# Introducing the BTCR DID Method Spec

Authors: Kim Hamilton Duffy, Ryan Grant, Christopher Allen, Dan Pape

## Abstract
This paper describes the BTCR DID Method Specification. BTCR is a simple DID method spec using the Bitcoin blockchain. Because of its simplicity, it's a useful introduction to DIDs, and anyone can start using them right away.

This paper describes how the BTCR DID Operations work, including creation, resolving, updating, and deleting. We weave in examples using our BTCR Playground to demonstrate how to get started immediately.


## Outline

- TODO: Get Christopher's ppt

- txref deviation
    - deviating from bip
    - output
    - Why (ChristopherA)
        - BIP won't be adopted
        - Payment node and don't need bech32
        - officially BIP had them take out all stuff on alt chains
        - we can convert to lightning channel "ids" ????
    - next generation will likely be more lightning based
    - just create; don't need full scaling solution (other people need to do work anyway; figure out offchain scaling)
    - UTXO will be compatible with scaling

- if we switch between immutable and mutable -- registry?
    - resolver gets thing -- it won't say where from
    - if hash doesn't match, sign

- ordering: should we specify depth first, e.g. predictability? add numbers? handle conflicts
    - rotate keys -- keep old ones for verifier purposes?
    - error out or disambiguate by fragment id
    
- did document type


implicit DDO
------------
    - if only 1 use of publickey, don't need to ref; can just inline
    - prefix partial ids with DIDs (e.g. #keys-0)
    - credential issuing

```
"authentication": {
    "type": "EdDsa...Authentication",
    "publicKey": "#keys-1"
}
"credentialIssuing": {
    "type": "EdDsa...Signing",
    "publicKey": "#keys-1"
}
```
Merging
-------
    - authentication cannot be replaced, append only. I.e. DID is useless without
    - credentialIssuing can be overwritten

Verifiable Credentials:
- Issuer should be explicit
- creator: did:btcr:xxxxxx#keys-0


Example
-------
```
{
  "@context": [
    "https://schema.org/",
    "https://w3id.org/security/v1"
  ],
  "issuer": "did:btcr:xyv2-xzyq-qqm5-tyke",
  "claim": {
    "id": "did:btcr:xkyt-fzgq-qq87-xnhn",
    "alternateName": "KimD"
  },
  "signature": {
    "type": "EcdsaKoblitzSignature2016",
    "created": "2018-03-08T21:09:36Z",
    "creator": "did:btcr:xyv2-xzyq-qqm5-tyke:#keys-1",
    "signatureValue": "H3yEiysgAZ9KjCL5pd4PHKZRQ8UAN9PlkjSEb7xplXP+BLQ7yWZuplIGPCAh7943upqa7KgXfUqBDxW4oyXcbAo="
  }
}
```
