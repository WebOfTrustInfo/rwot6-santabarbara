# BTCR DID Resolver Specification

By: Kim Hamilton Duffy, Christopher Allen, Ryan Grant

This describes the process of resolving a BTCR DID into a DID Document. The draft reference implementation is available at https://github.com/WebOfTrustInfo/btcr-did-tools-js (see didFormatter.js). Note not all steps described in this document are implemented yet.

[See the BTCR playground](https://weboftrustinfo.github.io/btcr-tx-playground.github.io/) for a live demonstration. The BTCR playground uses the draft reference implementation BTCR DID resolver.

## Input: BTCR DID

The input to a BTCR DID resolver is a BTCR DID. 

```
Format:  did:btcr:<specific-idstring>
Example: did:btcr:txtest1-xkyt-fzgq-qq87-xnhn
```

### Goal

The initial step of a BTCR DID resolver validates input by confirming `method` from the DID is `btcr`.

### Steps

0. Confirm `method` from the DID is `btcr`. Fail if not

## Resolution Phase 1: Construct "implicit" DID document

### Goal
This phase constructs the "implicit" DID Document from Bitcoin transactioh data

### Steps
1. From the BTCR DID, extract the transaction reference: this is the `<specific-idstring>` part of `did:btcr:<specific-idstring>` = `did:btcr:<TXREF(TX0)>`
2. From the txref encoding, determine the transaction 
    * The txref prefix determines which Bitcoin network to use
        * For example with `txtest1-xkyt-fzgq-qq87-xnhn`, `txtest1` is the Bitcoin testnet network, which means we consult the testnet network for the transaction
    * The remainder of the txref-encoded transaction is an encoding of the block height and position
    * Reference implementation: https://github.com/WebOfTrustInfo/txref-conversion-js
3. Look up transaction by height and position. Is the transaction output spent?
    * no: this is the latest version of the DID. From this we can construct the DID Document
    * yes: keep following transaction chain until the latest with an unspent output is found
4. Extract the hex-encoded public key that signed the transaction and update the DID document with default authentication capability
    * Populate the first entry of the `publicKey` array in the DID document. This uses the [Koblitz Elliptic Curve Signature 2016](https://w3c-dvcg.github.io/lds-koblitz2016/) signature suite
    * Populate the first entry of the `authentication` array in the DID document, referencing the key above. 
    * Note: It is a BTCR method convention that `#keys-1` corresponds to the transaction signing key. We'll see in the next spec that overriding this path in the supplementary DID document data is not allowed
5. If the transaction contains an `OP_RETURN` field, populate the `serviceEndpoint` in the DID document. This is assumed to reference supplementary DID document data
    * Add an entry to the `service` section of the DID document
        * `type` is `BTCREndpoint`
        * `serviceEndpoint` is the value in the OP_RETURN field, e.g. "https://github.com/myopreturnpointer"
        * `timestamp` is XXX?
6. Add `SatoshiAuditTrail`, which contains additional metadata available from the Bitcoin transaction. Note: needs details

If the transaction contained no OP_RETURN data (and therefore no serviceEndpoint was added), the resolution process is done. Otherwise, proceed to the next phase.
    
    
### Output of Phase 1

The output of this resolution phase is referred to as the "implicit" DID Document; it is derived exclusively from Bitcoin transaction data.

If the transaction has no OP_RETURN data, then the `service` array would have no entries. The only default capabilities would be to authenticate with the transaction signing key.

```

{
  "@context": "https://w3id.org/btcr/v1",
  "id": "did:btcr:<specific-idstring>",
  "publicKey": [{
      "id": "did:btcr:<specific-idstring>#keys-1",
      "owner": "did:btcr:<specific-idstring>",
      "type": "EdDsaSAPublicKeySecp256k1",
      "publicKeyHex": "02b97c30de767f084ce3080168ee293053ba33b235d7116a3263d29f1450936b71"
  }],
  "authentication": [{
      "type": "EdDsaSAPublicKeySecp256k1Authentication",
      "publicKey": "#keys-1"
  }],
  "service": [{
    "type": "BTCREndpoint",
    "serviceEndpoint": "https://github.com/myopreturnpointer.jsonld"     
    "timestamp": "XXXX"
  ]},
  "SatoshiAuditTrail": [{
    "chain": "testnet3",
    "blockhash": "00000000b3487880b2814da8c0a6b545453d88945dc29a7b700f653cd7e9cdc7",
    "blockindex": 1,
    "outputindex": 1,
    "blocktime": 1499502050,
    "time": 1499501000,
    "timereceived": 1499501000,
    "burn-fee": -0.05
  }]
}
```

## Resolution Phase 2: Populate DID document with supplementary DID document data

### Goal

### Steps

7. Retrieve the jsonld document from `serviceEndpoint.BTCREndpoint`, get first JSON type "DID Document". TODO
    * If URL doesn't exist, ERROR
8. Authenticate this JSON-LD fragment as valid
    * Note: The DID `id` value is *not* required to be in this JSON-LD.
        * If this patch data is an immutable file named by content hash (if stored in IPFS, for example) then it was committed before any blockchain confirmations occurred. 
        * The DID `id` value for an immutable DID document patch must be implicitly constructed by the method resolver presenting the valid DID document.
        * Question: must it be present if not in an immutable store? I think yes
    * If BTCREndpoint is in immutable content hash (say ipfs), it is considered valid and no signature is required on this JSON, as in effect, it is signed by the blockchain transaction
    * Otherwise, the JSON-LD at the BTCREndpoint must have signature matching Bitcoin transaction signing key
        * If not, ERROR
    * Question: does this mean BTCR resolvers must know in advance a registry of immutable stores?
9. Merges in known JSON-LD values (additional keys, authorizations, etc) as appropriate into DID document. Additive only!
    * Any fields that are part of the DID specification (`publicKey`, `authentication`, `service`) will be merged into the DID document by appending their entries to the arrays of the appropriate field
    * If continuation overwrites the Bitcoin key value, ERROR
    * Unknown JSON-LD values (in type "DID Document") are appended to the constructed DID Document
    * Non-DID JSON-LD data types that may also be at BTCEndpoint (such as Verifiable Claims) are ignored by resolver
10. Loop for secondary (patch) DID Documents
    * Get secondary (patch) DID Documents and merge according to step 8
    * Parse for secondary BTCREndpoint URL(s) TODO: what does this mean?
    * Questions: 
        * should we specify order? Depth first? 
        * what to do with path collisions? i.e. 2 different DID patches use the path `#keys-2`?
        * Consider DoS limits of this loop
11. Proposed: wrap the DID document in resolver envelope with additional metadata

### Output of Phase 2

Returns final constructed JSON-LD DID Document to caller, which can use the keys to authenticate data such the signature on a verifiable claim, or perform other application tasks.

Let's assume the supplementary DID document (from the OP_RETURN data) is stored in an immutable store and contains the following `didDocument`. 

```
{
  ...
  "didDocument": {
      "@context": "https://w3id.org/did/v1",
      "publicKey": [{
        "id": "#keys-2",
        "type": "RsaVerificationKey2018",
        "publicKeyPem": "-----BEGIN PUBLIC KEY...END PUBLIC KEY-----\r\n"
      }],
      "authentication": [{
        // this key can be used to authenticate as DID ...fghi
        "type": "RsaSignatureAuthentication2018",
        "publicKey": "#keys-2"
      }],
  ...
}
```

Note that the `id` is not known yet, because the transaction referencing this supplementary document has not occurred. 

Then the final DID document would be:

```
{
    "resolver-specific envelope": "some-did-resolver-v1", 
    "doesn't matter to DID spec": true,
    "resultDid": {
      "@context": "https://w3id.org/did/v1",
      "id": "did:btcr:<specific-idstring>",
      "publicKey": [{
        "id": "did:btcr:<specific-idstring>#key-1",
        "owner": "did:btcr:mytxid",
        "type": "EdDsaSAPublicKeySecp256k1",
        "publicKeyHex": "02b97c30de767f084ce3080168ee293053ba33b235d7116a3263d29f1450936b71"
      }, {
        "id": "did:btcr:<specific-idstring>#keys-2",
        "type": "RsaVerificationKey2018",
        "publicKeyPem": "-----BEGIN PUBLIC KEY...END PUBLIC KEY-----\r\n"
      }
      ],
      "authentication": [{
        "type": "EdDsaSAPublicKeySecp256k1Authentication",
        "publicKey": "#keys-1"
      }, {
        "type": "RsaSignatureAuthentication2018",
        "publicKey": "#keys-2"
      }],
      "service": [{
        "type": "BTCREndpoint",
        "serviceEndpoint": "https://github.com/myopreturnpointer",  
        "timestamp": "XXXX"
      }],
      "SatoshiAuditTrail": [{
        "chain": "testnet3",
        "blockhash": "00000000b3487880b2814da8c0a6b545453d88945dc29a7b700f653cd7e9cdc7",
        "blockindex": 1,
        "outputindex": 1,
        "blocktime": 1499502050,
        "time": 1499501000,
        "timereceived": 1499501000,
        "burn-fee": -0.05
      }]

      // fields found in BTCREndpoint marked using JSON type "DID Document"
      "future DID-spec term_a" : {
      },
      "future DID-spec term_b: : {
      }

      // Excluded from this diddoc are some other things allowed in
      // the files storing patches to the diddoc, when using it like a
      // "bag of keys".  One example would be verifiable claims stored
      // in the same github document as a BTCREndpoint.
    }

    // Here the method resolver, sometimes also called the method
    // driver, may add a signature (which is out of scope for the DID
    // spec), confirming that it looked these things up on the
    // blockchain then-current, and merged all applicable patches
    // found following the BTCREndpoint algorithm.  The resolver will
    // have stripped any signature from a BTCREndpoint file on a
    // mutable filesystem, since it MUST at minimum add its own
    // SatoshiAuditTrail section.
}
```

## Assumptions

* Content at BTCREndpoint has term separating out DID document "extensions".
    * Under this are terms from DID specification.
    * Known BTCR terms will be spliced into e.g. "service", "authentication", etc
    * others will be included in DID returned by resolver
* everything not under that node is not part of DID Document.
    * claims
    * crypto-cats

## Questions and Answers from January 2018 Hackathon

* How to represent updates?
    * Ryan claims that proofs about update are not proper for the DID document, other than to require methods to provide a way to do updates. Why should a client app need to know about updates? The DID spec should not try to provide a signed DID Document that is JSON-LD self-complete.  Instead, trust in the method resolver is needed. 
    * Should this be part of the audit trail?  (Ryan thinks yes.  Any objections?)
    * At which layer is this happening? is it a requirement of the universal resolver? or is this simply returning info from which this can be determined? 
    * This also means we can remove the following:

```
      "update": {[
        // update is implicit 
        // Optional: txout index
        "type": "BTCRTip",
        "serviceEndpoint": "bitcoinaddress"
      ]},
```

* How to represent timestamp?
  * Some of the values (the DID ID itself, the bitcoin key, the BTREndpoint, and any immutable content hash items) are effectively timestamped by the Bitcoin transaction
  * However, mutable values from the DID Document construction process may have been updated later. 
* Should the BTCR spec demand that compliant method resolvers sign the returned DID Document (diddo), using a standard envelope?  (This, even though it's out of scope for the DID spec.)

