# Decentralized Autonomic Data (DAD) and the three R's of Key Management

Author: Samuel M. Smith Ph.D. (sam@samuelsmith.org)

Contributor: Vishal Gupta (vishal@diro.io)

2018/03/07

## Abstract

This paper proposes a new class of data called *decentralized autonomic data* (DAD). The term *decentralized* means that the governance of the data may not reside with a single party. A related concept is that the trust in the data provenance is diffuse in nature. Central to the approach is leveraging the emerging [*DID*](https://w3c-ccg.github.io/did-spec/) (decentralized identifier) standard. The term *autonomic* means self-managing or self-regulating. In the context of data we crystalize the meaning of self-managing to include cryptographic techniques for maintaining data provenance that make the data self-identifying, self-certifying, and self-securing. Implied thereby is the use of cryptographic keys and signatures to provide a root of trust for data integrity and maintain that trust over transformation of that data, e.g. provenance. Thus key management must be a first order property of DADs. This includes key reproduction, rotation, and recovery.

The motivating use of DAD is to provide provenance for streaming data that is generated and processed in a distributed 
manner with decentralized governance. Streaming data are typically measurements that are collected and aggregated to form higher level constructs. Applications include analytics and instrumentation of distributed web or internet of things (IoT) applications. Of particular interest is the use of DADs in self-sovereign reputation systems. A DAD seeks to maintain a provenance chain for data undergoing various processing stages that follows diffuse trust security principles including signed at rest and in motion. 

Streaming data applications may impose significant performance demands on the processing of the associated data. Consequently one major goal is to use efficient mechanisms for providing the autonomic properties. This means finding minimally sufficient means for managing keys and cryptographic integrity.

Importantly this paper provides detailed descriptions of the minimally sufficient means for key reproduction, rotation, revocation, and recovery for DID leveraged DADS. 


## Overview

A decentralized autonomic data (DAD) item is associated with a decentralized identifier, ([DID](https://w3c-ccg.github.io/did-spec/)). This paper does not provided a detailed definition of DIDs but does describe how DIDs are used by a DAD. The DID syntax specification is a modification of standard URL syntax per [RFC-3986](https://www.ietf.org/rfc/rfc3986.txt). As such it benefits from familiarity which is a boon to adoption. One of the features of a DID is that it is a self certifying identifier in that a DID includes either a public key or a fingerprint of a public key from a cryptographic public/private key pair. Thereby a signature created with the private key can be verified using the public key provided by the DID. The inclusion of the public part of a cyptographic key pair in the DID give the DID other desirable properties. These include universal uniqueness and pseuodnynmity. Because a cryptographic key pair is generated from a large random number there is an infinitessimal chance that any two DIDs are the same (collision resistance). Another way to describe a DID is that it is a cryptonym, a cryptographically derived pseudonym.

Associated with a DID is a did document (DDO). The DDO provides meta-data about the DID that can be used to manage the DID as well as discover services affiliated with the DID. Typically the DDO is meant to be provided by some service. The DID/DDO model is not a good match for streaming data especially if a new DID/DDO pair would need to be created for each new DAD item. But a DID/DDO is a good match when used as the root or master identifier from which an identifier for the DAD is derived. This derived identifier is called a *derived DID* or *DDID*. Thus only one DID/DDO paring is required to manage a large number of DADs where each DAD may have a unique DDID. The syntax for a DDID is identical for a DID. The difference is that only one DDO with meta-data is needed for the root DID and all the DAD items carry any additional DAD specific meta-data, thus making them self-contained (autonomic).

### DID Syntax

A DID or DDID has the following required syntax:

did:*method*:*idstring*

The *method* is some short string that namespaces the did and provides for unique behavior in the associated method specification. In this paper we will use the method *dad*.

The  *idstring* must be universally unique. The *idstring* can have multiple colon ":" separated parts thus allowing for namespacing. In this document the first part of the *idstring* is linked to the public member of a cryptographic key pair that is defined by the method. In this paper we will use a 44 character Base64 URL-File safe  encoding as per [RFC-4648](https://tools.ietf.org/html/rfc4648) with one trailing pad byte of the 32 byte public verification key for an EdDSA (Ed25519) signing key pair. Unless otherwise specified Base64 in this document refers to the URL-File safe version of Base64. The URL-File safe version of Base64 encoding replaces plus "+" with minus “-” and slash “\” with underscore “_”. 

As an example a did using this format would be as follows:

```bash
did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=
```

An example did with namespaced idstring follows:

```bash
did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=:blue
```

A DID may have optional parts including a path, query, or fragment. These used the same syntax of a URL, that is, the path is delimited with slashes, */*, the query with a question mark, *?*, and the fragment with a pound sign, *#*. When the path part is provided then the query applies to the resource referenced by the path and the fragment refers to an element in the document referenced by the path. An example follows:

```bash
did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=/mom?who=me#blue
```

In contrast, when the path part is missing but either the query or fragment part is provided then the query and/or fragment parts have special meaning. A query without a path means the the query is an operation on the either the DID itself or the DID document (DDO). Likewise when a fragment is provided then the fragment is referencing an elemet of the DDO. An example of a DID without a path but with a query follows:

```bash
did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=?who=me
```

As will be described later, a query part on a DID expression without a path part will enable the generation of *DDIDs* (derived DIDs)

### Minimal DAD

A minimal DAD (decentralized autonomic data) item is a data item that contains a DID or DDID that helps uniquely identify that data item or affiliated data stream.  In this paper JSON is used to represent serialized DAD items but other formats could be used instead. An example minimal trivial DAD is provided below. Its trivial because there is no data payload.

```json
{
    "id": "did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148="
}
```

To ensure data integrity, i.e. that the data has not been tampered with. Appended to the DAD item is a signature that is verifiable as being generated by the private key associated with the public key in the *id* field value. This signature verifies that the DAD item was created by the holder of the associated private key  The DAD item is both self-identifing and self-certifying because the identifier value given by the *id* field is included in the signed data and is verifiable against the private key associated with the public key obtained from the associated DID in the *id* field. In the example below is a trivial DAD with an appended signature. The signature is separated from the JSON serialization with characters that may not appear in the JSON.

```json
{
    "id": "did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148="
}
\r\n\r\n
u72j9aKHgz99f0K8pSkMnyqwvEr_3rpS_z2034L99sTWrMIIJGQPbVuIJ1cupo6cfIf_KCB5ecVRYoFRzAPnAQ==
```

An example DAD with a payload follows:

```json
{
    "id": "did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=",
    "data":
    {
        "name": "John Smith",
        "nation": "USA"
    }
}
\r\n\r\n
u72j9aKHgz99f0K8pSkMnyqwvEr_3rpS_z2034L99sTWrMIIJGQPbVuIJ1cupo6cfIf_KCB5ecVRYoFRzAPnAQ==
```

While, the simple DADs given in the examples above are minimally self-identifying and self-certifying, they do not provide support for other self-management properties such as key management. In other words, because each DID (Decentralized Identifer) references a public signing key with its associated private key, it needs to be managed as a key not just as an identifier. The following sections will introduce the core key management properties and the associated meta-data that a DAD needs in order to support those properties.

## Key Management

The three main key management operations are:

* Reproduction 
* Rotation 
* Recovery 

We call these the essential three R's of key management.

### Key Reproduction

Key reproduction is all about managing the creation of new or derived keys. Each new DID requires a new public/private key pair. The private keys must be kept in a secured location. One reason to create unique public private key pairs for each pair-wise relationship is to minimize the risk of exposure to exploit from the repeated use of a given key pair. Another reason to create unique key pairs for each interaction between parties is as a means for maintaining privacy through *pseudonymity*. This is discussed in more detail below. Minimizing the number of private keys that must be securely preserved for a given number of public keys simplifies management and reduces both expense and risk of exposure. To reiterate, there are two key storage issues, one is storing public keys and the other is securely storing private keys. An exploit that captures a store of public keys may mean a loss of privacy because the expoiter can now correlate activity associated with those public keys. An exploit that captures a store of private keys means that the exploiter many now be able to use those private keys to take control of any associated resources. Consequently, one wants to avoid storing private keys as much as possible.

#### Privacy and Confidentiality

One desirable feature of a DAD is that it be privacy preserving. A simplified definition of privacy is that if two parties are participating in an exchange of data in a given context that the parties are not linked to other interactions with other parties in other contexts. A simplified definition of confidentiality is that the content of the data exchanged is not disclosed to a third party. Confidentiality is usually obtained by encrypting the data. This paper does not specifically cover encryption but in general the mechanisms for managing encryption keys are very similar to those for managing signing keys.

An exchange can be private but not confidential, confidential but not private, both, or neither. A minimally sufficent means for preserving privacy is to use a DID as a pseudonomous identifier of each party to the exchange. A *pseudonynm* is a manufactured alias e.g. identifier that is under the control of its creator and is used to identify a given interaction but is not linkable to other interactions by its owner. The ability of a third party to correlate an entity's behavior across contexts is reduced when the entity uses a unique DID for each context.  Although, there are more sophisticated methods for preserving privacy such as zero knowledge proofs, the goal here is to use methods that are compatible with the performance demands of streaming data. 

As mentioned above, the problem with using unique pseudonyms/cryptonyms for each exchange is that a large number of such identifiers may need to be maintained. Fortunately hierachically derived keychains provide a way to manage these cryptonyms with a reasonable level of effort. 

#### Hierachical Deterministic Key Generation

As previously mentioned, reproduction has to do with the generation of new keys. One way to accomplish this is with a deterministic proceedure for generating new public/private keys pairs where the private keys may be reproduced securely from some public information without having to be stored. A hierarchically deterministic (HD) key generation algorithm does this by using a master or root private key and then generating new key pairs using a deterministic key derivation algorithm. A derived key is expressed as a branch in a tree of parent/child keys. Each public key includes the path to its location in the tree. The private key for a given public key in the tree can be securely regenerated using the root private key and the key path also called a chain code. Only one private key, (the root) needs to be stored. 

The [BIP-32](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki) specification, for example, uses an indexed path representation for its HD *chain* code, such as, "0/1/2/0".
The BIP-32 algorithm needs a master or root key pair and a chain code for each derived key. Then only the master key pair needs to be saved and only the master private key needs to be kept securely secret. The other private keys can be reproduced on the fly given the key generation algorithm and the chain code. An extended public key would include the chain code in its representation so that the associated private key can be derived by the holder of the master private key anytime the extended public key is presented. This is the procedure for hardened keys.

The query part of the DID syntax may be used to represent an HD chain code or HD key path for an HD key that is derived from a root DID. This provides an economoical way to specify derived DIDs (DDIDs) used to identify DADS. An example follows:

```bash
did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=?chain=0\1\2
```
This expression above discloses the root public DID as well as the key derivation path or chain via the query part. For the sake of brevity this will be call an extended DID. The actual derived DDID is create by applying the HD algorithm such as:

```bash
did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=
```

Thus a database of DDIDs could be indexed by DDID expressions with each value being the extended DID. Looking up the extended DID allows the holder to recreate on the fly the associated private key for the DDID without ever having to store the private key. This might look like the following:

```json
{
    "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=": "did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=?chain=0\1\2",
   ... 
}
```

Or given that the same did method is used throughout:

```json
{
    "Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=": "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=?chain=0\1\2",
   ... 
}
```

The namespacing of the DID idstring also provides information that could be used to help formulate and HD path to generate a DDID. The following example shows two different DDIDs using the same chain coide but with a different extended idstring but using the same public key.

```bash
did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=:blue?chain=0/1
did:dad:Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=:red?chain=0/1
```

Some refinements to this approach may be useful. One is the granularity of DDID allocation. A unique DDID could be used for each unique DAD or a unique DDID could be used for each unique destination party that is receiving a data stream. In this case each DAD would need an additional identifier to disambiguate each DAD sent to the same party. This can be provided with an additional field or using the DID path part to provide a sequence number. This is shown in the following example:

```bash
did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=/10057
```

The associated DAD is as follows:

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=/10057",
    "data":
    {
        "temp": 50,
        "time": "12:15:35"
    }
}
\r\n\r\n
u72j9aKHgz99f0K8pSkMnyqwvEr_3rpS_z2034L99sTWrMIIJGQPbVuIJ1cupo6cfIf_KCB5ecVRYoFRzAPnAQ==
```

#### Change Detection

Often stale DAD items must be detectable to prevent replay attacks. A later re-transmission of an old copy of the DAD item must not supercede a newer copy. Using a sequence number or some other identifier could provide change detection. Another way to provide change detection is for the DAD item to include a *changed* field whose value is monotonically increasing and changes everytime the data is changed. The souce of the data can enforce that the *changed* field value is monotonically increasing. Typical approaches include a monotonically increasing date-time stamp or sequence number. Any older data items resent or replayed would have older date-time stamps or lower sequence numbers and would thus be detectable as stale. 

Below is an example of an non-trivial data item that has a *changed* field for change detection.

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=/10057",
    "changed" : "2000-01-01T00:00:00+00:00",
    "data":
    {
        "temp": 50,
        "time": "12:15:35"
    }
}
\r\n\r\n
u72j9aKHgz99f0K8pSkMnyqwvEr_3rpS_z2034L99sTWrMIIJGQPbVuIJ1cupo6cfIf_KCB5ecVRYoFRzAPnAQ==
```

Change detection prevents replay attacks in the following manner. A second party receives DAD updates that are each signed by the associated private key. Each update has a monitonically increasing changed field. The source signer controls the contents of the data wrapped by the signature. Therefore the signer controls any changed field. A consistent signer will use a monotonically increasing changed value whenever the data wrapped by the signature is changed. Thus a malicious third party cannot replay earlier instances of the DAD wrapped by a valid signature to the orginal second party because the second party knows to discard any receptions that have older changed fields than the latest one they have already received. 

#### On the Fly DDIDS in DADs

One important use case for DDIDs in DADs is to identify data that is received from a source that is not providing identifying information with the data. The receiver then creates an associated DID and DDIDs to identify the data. At some later point in the point the receiver may be able to link this data with some other identifying information or the source may *claim" this data later by supplying identifying information. In this case the DDIDs are private to the receiver but can later be used to credibly provenance the internal use of the data. This may be extremely beneficial when shared amongst the entities in the processing chain as a way to manage the entailed proliferation of keys that may be all claimed later as a hierarchial group. The DIDs and associated derivation operations for DDIDS may be shared amongst a group of more-or-less trusted entities that are involved in the processing chain.

#### Public Derivation

Another important used case for DDIDS in DADS is to avoid storing even the the DDID with its derivation chain. This may be an issue when a client wishes to communicate with a potenially very large number of public services. Each public service would be a new pairing with a unique DDID. If the derivation algorithm for an HD Key DDID could use the public key or public DID of the public service to generate the DDID then the client need not store the actual DDID but can recover the DDID by using the public DID of the server to re-derive the associated DDID. This can be done by creating a hash of the root DID private key and the remote server public DID to create the seed used to generate the DDID for the DAD. This also means that the DDIDs or chain codes do not have to be included in the keys preserved by a key recovery system. 

### Key Rotation

The simplest approach to key rotation is to revoke and replace the key in one operation. In some cases revocation without replacement is warranted. But this is the same as revoking and then replacing with a null key. Key rotation without revocation usually poses a security risk so it is not needed. Hence we simplify key management to include revocation as a subset of rotation.

Key rotation is necessary because keys used for signing (and/or encryption) may suffer increased risk of becoming compromized due to continued use over time, may be vulnerable to brute force attack merely due to advances in computing technology over time, or may become compromised due to misuse or a specific exploit. Peridically rotating the key bounds the risk of compromise resulting from exposure over time. The more difficult problem to solve is secure rotation after a specific exploit may have already occurred. In this case the receiving party may recieve a valid signed rotation operation from the exploiter prior to the orignal holding entity sending a valid rotation operation. The receiver may erroneously accept a rotation operation that transfers control of the data to the exploiter. A subsequent rotation operation from the original holder would either create a conflict or a race condition for the receiver.

Although there are several ways to solve the early rotation exploit problem described above, the goal is to find the minimally sufficient means for preventing that exploit that is compatible with the demands of streaming data applications for which DADs are well suited. 

#### Basic Pre-rotation

 A complication with DADs is that there are two types of keys being used. The keys for the root DIDs and the keys for the derived DIDS (DDIDS). Generating a derived key pair requires using the private root key. The process for pre-rotating the root DID is described first, followed by the additional measures for DDID pre-rotation.
 
The approach presented here is to pre-rotate the DID key and declare the pre-rotation at the inception of the DID. This pre-rotation is declared at initialization. This may be done with an inception event. A later rotation operation event creates the next pre-rotated key thus propogating a new set of current key and pre-rotated key. 

Shown below is an example inception event data structure with a signing key in the *signer* field and a pre-rotated next signing key in the *ensuer* field. The signature is generated using the *signer* key.

Example inception event:

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "changed" : "2000-01-01T00:00:00+00:00",
    "signer": "Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "ensuer": "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148="
}
\r\n\r\n
u72j9aKHgz99f0K8pSkMnyqwvEr_3rpS_z2034L99sTWrMIIJGQPbVuIJ1cupo6cfIf_KCB5ecVRYoFRzAPnAQ==
```

 A useful convention would be that if a signer field is not provided then the signer is given by the *id* field.

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "changed" : "2000-01-01T00:00:00+00:00",
    "ensuer": "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148="
}
\r\n\r\n
u72j9aKHgz99f0K8pSkMnyqwvEr_3rpS_z2034L99sTWrMIIJGQPbVuIJ1cupo6cfIf_KCB5ecVRYoFRzAPnAQ==
```

When rotation occurs sometime later, the rotation operation atomically indicates that the key in the *signer* field is to be replaced with the pre-declared rotation key in the *ensuer* field and also declares the next rotation key to be placed in the *ensuer* field. One way to keep track of this is to provide three keys in the rotation event, the former signer in a new *erster* field, the former *ensuer* in the *signer* field and a new pre-rotated key in the *ensuer* field. The rotation operation has two signatures. The first signature is created with the former *signer* key (now *erster* field). The second signature with the form *ensuer* key (now *signer* field). This establishes provenance of the rotation operation.

Example rotation event:

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "changed" : "2000-01-01T00:00:00+00:00",
    "erster": "Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "signer": "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=",
    "ensuer": "dZ74MLZXD-1QHoa73w9pQ9GroAvxqFi2RTZWlkC0raY="
}
\r\n\r\n
jc3ZXMA5GuypGWFEsxrGVOBmKDtd0J34UKZyTIYUMohoMYirR8AgH5O28PSHyUB-UlwfWaJlibIPUmZVPTG1DA==
\r\n\r\n
efIU4jplMtZzjgaWc85gLjJpmmay6QoFvApMuinHn67UkQZ2it17ZPebYFvmCEKcd0weWQONaTO-ajwQxJe2DA==
```

Instead of three fields in the structure a list or tuple of three fields could be used where the order corresponds to ```[erster, signer, ensuer]```.

In order to verify provenance over multiple rotation operations, the receiver needs to be able to replay the history of rotation operations. 

The pre-rotation approach has some useful features. For many exploits the likelihood of exploit is a function of exposure to continued monitoring or probing. Narrowly resticting the opportunity for exploit in terms of time, place, and method, especially if the time and place is a one time event makes exploit extremely difficult. The exploiter has to either predict the time and place of the event or has to have continuous universal monitoring of all events. By declaring the pre-rotation at the inception event of the associated DAD the window for exploit is as narrow as possible. Pre-rotation does not require any additional keys or special purpose keys for rotation. This makes the approach self-contained. Because the rotation operation event requires two signatures, one using the current key and the other using the pre-rotated key, an exploiter would have to exploit both keys. This is extremely difficult because the only times the private side of the pre-rotated key is used are (1) at its creation in order to make the associated public key, and (2) at the later signing of the rotation operation event. This minimizes the times and places to a narrow sample. 

#### Listed Rotation Key Structure

Another approach to declaring rotation events is to provide the full rotation history in the rotation operation and/or to use a list structure for providing the keys. In many cases rotations are a rare event so the number of entries in the rotation history would be small. In the associated data structure a list of all the signers both former and future to date is provided in the *signers* field. The current signer is indicated by an index into the list in the *signer* field. The list index is zero based. The pre-rotated next signer or ensuer is the following entry in the *signers* list. A rotation event then changes the signer field index which implies that the former signer (*erster*) is the previous entry and the next pre-rotated signer (*ensuer*) is the subsequent entry after the signer index.  This is shown in the following examples.

Example pre-rotated inception event with list structure for signing keys:

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "changed" : "2000-01-01T00:00:00+00:00",
    "signer": 0,
    "signers": 
    [
        "Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
        "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=",
    ]
}
\r\n\r\n
jc3ZXMA5GuypGWFEsxrGVOBmKDtd0J34UKZyTIYUMohoMYirR8AgH5O28PSHyUB-UlwfWaJlibIPUmZVPTG1DA==
```

The signature above is with key at index = signer = 0.

Example rotation event with list structure for signing keys:

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "changed" : "2000-01-01T00:00:00+00:00",
    "signer": 1,
    "signers": 
    [
        "Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
        "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=",
        "dZ74MLZXD-1QHoa73w9pQ9GroAvxqFi2RTZWlkC0raY="
    ]
}
\r\n\r\n
jc3ZXMA5GuypGWFEsxrGVOBmKDtd0J34UKZyTIYUMohoMYirR8AgH5O28PSHyUB-UlwfWaJlibIPUmZVPTG1DA==
\r\n\r\n
efIU4jplMtZzjgaWc85gLjJpmmay6QoFvApMuinHn67UkQZ2it17ZPebYFvmCEKcd0weWQONaTO-ajwQxJe2DA==
```

The first signature is with key at index = signer - 1 = 0. The second signature is with key at index = signer = 1.

A subsequent rotation would add another key to the signers list and increment the signer index as follows:

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "changed" : "2000-01-01T00:00:00+00:00",
    "signer": 2,
    "signers": 
    [
        "Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
        "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=",
        "dZ74MLZXD-1QHoa73w9pQ9GroAvxqFi2RTZWlkC0raY=",
        "3syVH2woCpOvPF0SD9Z0bu_OxNe2ZgxKjTQ961LlMnA="
    ]
}
\r\n\r\n
AeYbsHot0pmdWAcgTo5sD8iAuSQAfnH5U6wiIGpVNJQQoYKBYrPPxAoIc1i5SHCIDS8KFFgf8i0tDq8XGizaCg==
\r\n\r\n
o9yjuKHHNJZFi0QD9K6Vpt6fP0XgXlj8z_4D-7s3CcYmuoWAh6NVtYaf_GWw_2sCrHBAA2mAEsml3thLmu50Dw==
```

#### Multi-signature Pre-rotation

The list structure enables the declaration of several pre-rotations in advance by providing several future pre-rotation keys in the inception event. A rotation event then could include several rotations at once. Each rotation event would require a signature per each of the multiple rotations in the event thus allowing for multi-signature inception and rotations. If each key is from a different entity then the rotation would require multiple entities to agree. Thus a DAD could be multi-signature and support multi-signature rotations. In this case the signer field would be a list of indices into the signers list. This approach could be further extended to support an M of N signature scheme where any M of N signatures are required to incept or rotate where M < N, M,N integers. The total number of keys in the list is a multiple of N. The following examples provide an inception and rotation event for a two signature pre-rotation. A named spaced key with colon separated idstring as per the DID syntax could be used to allow for signers using a different DID method or for namespacing within a given DID method.

Example of a pre-rotated two signature inception event with list structure for signing keys where "*blue*" indicates one source and "*red*" indicates another source:

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "changed" : "2000-01-01T00:00:00+00:00",
    "signer": [0,1],
    "signers": 
    [
        "Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=:blue",
        "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=:red",
        "dZ74MLZXD-1QHoa73w9pQ9GroAvxqFi2RTZWlkC0raY=:blue",
        "3syVH2woCpOvPF0SD9Z0bu_OxNe2ZgxKjTQ961LlMnA=:red"
    ]
}
\r\n\r\n
AeYbsHot0pmdWAcgTo5sD8iAuSQAfnH5U6wiIGpVNJQQoYKBYrPPxAoIc1i5SHCIDS8KFFgf8i0tDq8XGizaCg==
\r\n\r\n
o9yjuKHHNJZFi0QD9K6Vpt6fP0XgXlj8z_4D-7s3CcYmuoWAh6NVtYaf_GWw_2sCrHBAA2mAEsml3thLmu50Dw==
```

The signatures above are generated with the keys at indices 0 and 1 in the signers list respectively.

Example of a two signature rotation event with list structure for signing keys where "*blue*" indicates one source and "*red*" indicates another source:

```json
{
    "id": "did:dad:Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=",
    "changed" : "2000-01-01T00:00:00+00:00",
    "signer": [2,3],
    "signers": 
    [
        "Qt27fThWoNZsa88VrTkep6H-4HA8tr54sHON1vWl6FE=:blue",
        "Xq5YqaL6L48pf0fu7IUhL0JRaU2_RxFP0AL43wYn148=:red",
        "dZ74MLZXD-1QHoa73w9pQ9GroAvxqFi2RTZWlkC0raY=:blue",
        "3syVH2woCpOvPF0SD9Z0bu_OxNe2ZgxKjTQ961LlMnA=:red"
        "rTkep6H-4HA8tr54sHON1vWl6FEQt27fThWoNZsa88V=:blue",
        "7IUhL0JRaU2_RxFP0AL43wYn148Xq5YqaL6L48pf0fu=:red",
    ]
}
\r\n\r\n
AeYbsHot0pmdWAcgTo5sD8iAuSQAfnH5U6wiIGpVNJQQoYKBYrPPxAoIc1i5SHCIDS8KFFgf8i0tDq8XGizaCg==
\r\n\r\n
o9yjuKHHNJZFi0QD9K6Vpt6fP0XgXlj8z_4D-7s3CcYmuoWAh6NVtYaf_GWw_2sCrHBAA2mAEsml3thLmu50Dw==
\r\n\r\n
GpVNJQQoYKBYrPPxAoIc1i5SHCIDS8KFFgf8i0tDq8XGizaCgAeYbsHot0pmdWAcgTo5sD8iAuSQAfnH5U6wiI==
\r\n\r\n
8z_4D-7s3CcYmuoWAh6NVtYaf_GWw_2sCrHBAA2mAEsml3thLmu50Dwo9yjuKHHNJZFi0QD9K6Vpt6fP0XgXlj==
```

The signatures above are generated with the keys at indices 0 through 3 in the signers list respectively.

#### Collective Signatures

This multi-signature scheme suffers from the significant increase in the length of the attached signature block.  One way to ameliorate this "bloat" is to use collective multi-signatures. A collective signature has the property that its length is not a multiple of the number of signatures it holds. Typically the maximum length of a collective signature is about double the length of a non-collective signature and does not increase significantly as more signatures are added to the collective. There is a draft IETF standard for collective signatures [CoSi](https://tools.ietf.org/id/draft-ford-cfrg-cosi-00.html) that might be useful for multi-signature rotation. Some useful references are here [project](https://github.com/dedis/cothority/wiki/CoSi), [paper](https://arxiv.org/pdf/1503.08768.pdf), [slides](http://dedis.cs.yale.edu/dissent/pres/160524-sp-cosi.pdf). Collective signatures are a type of Schnorr multi-signature or Schnorr threshold signature.

#### DDID Pre-rotation

The complication for DDIDs (Derived DIDs) is that each DAD stream for each pairing of sender and receiver may have a unique DDID. Rotation fo the root DID also requires rotating the the DDIDs. The same pre-rotation approach, however, can be used for the DDIDs. At the inception event the root key and pre-rotation root keys are created. These keys are then used to created a set of DDIDS and pre-rotated derived keys using the root and pre-rotated root keys respectively. This does not significantly change the exploit vulnerability as the inception event is still one event. Although the pre-rotated root DID key is used to create a set of pre-rotated derived keys, it does not signicantly increase its exposure. Each rotation event then involves rotating the root DID key and all the DDID keys.  The important consideration is that the number of DDIDs in the set must be determined in advance in order to create all the pre-rotated derived keys at one time. This can be managed by created extra DDIDs and pre-rotated derived keys at the inception event. Only the public half of each the key pairs need to be stored. 

In contrast, creating additional DDIDs with pre-rotated keys at a later time requires using the pre-rotated root private key. This increases the exposure of that private key to exploit and makes it less secure for pre-rotation. When the set of pre-rotated DDIDs is consumed, a rotation operation event may be triggered thereby rotating the existing DDIDs and then allowing additional DDIDs to be created. 

Alternatively if the pre-rotated set of DDIDs is consumed then a new DDID tree may be created with a unique new pre-rotated root key. This would create a hierachy of groups of pre-rotated DDIDs and derived keys. 

Moreover, when the re-establishment and re-initialization of a DAD stream is not a high cost or high risk endeavor then instead of pre-rotating the DDIDs, only pre-rotate the root DID and just close down the current DAD stream and re-establish with new DDID created by the pre-rotated key as part of the rotation event. 

Finally if the exposure of the root DID is insignificant compared the exposure of the DDIDs then another approach to DDID pre-rotation could be employed. This requires a trade-off between convenience and privacy. A group of receivers could all have knowledge of the root public DID key and its pre-rotated public DID key for their unique DDIDs. This means that the members of the group could leak correlation information about the group via the shared root DID. However each member of the group could still maintain security via its unique DDID. In this case the root private DID is used to derive both the inception DDID and the pre-rotated derived key of each member. The individual members could then undergo DDID key rotation but only using the root DID not its pre-rotated key. In the rare event that the root DID needs to be rotated then each of the DDID members performs a double rotation within a rotation event. The first rotation rotates to the pre-rotated key generated using the original root DID, the second rotation is to a new set of derived and pre-rotated derived keys, each generated using the new pre-rotated root key. The first derived key in the pair is the new signer key, the second is the new pre-rotated signer key. A receiver must have knowledge of the root DID and pre-rotated root key in order to verify that the second rotation is not a forgery.  This approach enables the organization and managment of DDIDs in heirarchical groups where the members of each group know about their group root DID but that group root did could be a DDID of a higher level group and so on. Lower level groups only know about thier group root DID, but not any sibling groups so it can't leak information about sibling or parent groups only child groups.

#### Replayability

The constraint on pre-rotation is that the receiving party be able to replay the rotation events to ensure that it did not miss a rotation. This replay allows the receiver to verify the provenance chain of rotations. The question then is what are minimally sufficient means for enabling this replay capability?

There are two use cases for providing this replay capability. The first case is for online one-to-one or pairwise interactions and the other case is for offline one-to-one or equivalently one-to-many or public interactions.  

In the one-to-one case, there is the sender of a DAD stream and the reciever of the stream. The initiation of the stream would involve exchanging keys for pairwise communication and would also include the establishment of the DDID used for the DAD items sent. The first DAD sent would include the DDID for the DAD as will as the pre-rotated DDID. This is the inception event.  The receiver then merely needs to maintain a running log of DAD items that contain rotation events. As long as reliable communications are used between the sender and receiver, then the receiver can ensure that it has observed all rotation events by keeping its log and no imposter can later send an undetectable forged inception or rotation event. If the reciever loses its history then it must re-establish its communications channel and re-initialize. Alternatively the sender could maintain a copy of the inception and rotation event history and then provide it to the receiver upon request. The receiver would cache this history for speedier lookup. 

In the one-to-many, public, or offline case, the rotation history is maintained by a service. While a decentralized distributed consensus blockchain ledger could provide this service it is not the minimally sufficient means of providing this capability. The minimally sufficient means is a redundant immutable event log of inception and rotation events indexed by the DDID associated with the DAD for the given DAD stream. The constraint is that a sufficient majority of the log hosts must be non-faulty at any point in time. This includes Byzantine faults. Is is also assumed that the sender communicates with the hosts using a reliable end-to-end signed protocol. The sender broadcasts the inception event to all the redundant hosts that provide copies of the log. These hosts are called Replicants. Then either the Replicants respond to the sender with a confirmation that the event is written to their log or the sender reads the log to verify. The event history is indexed by the DDID. The sender can then verify that a sufficient majority of the Replicants have captured the event. Subsequent rotation events are redundantly appended to the DDID indexed log in the same way. The receiver can then broadcast a query to the Replicants and verify via their responses that a sufficient majority of the Replicants have the same DDID indexed event log. This eanbles both offline and one-to-many event streams.  

This approach is more scalable than using a distributed consensus ledger because the Replicants do not need to communicate with each other. The inter-host agreement of the members of a distributed consensus pool is usually the limited factor in scalablity. Morever a given receiver could be completely responsible for providing the immutable log service for its own data stream with the sender. Each receiver could choose to implement a different level of reliability. Loss of the event log means that the sender and receiver have to re-initialize and re-establish the DAD stream. Alternatively the sender could be responsible for providing a set of Replicants and make the event log available to the receiver upon request.


### Key Recovery

Key recovery is about providing a secure way of recovering a lost private key. The important consideration here is that the recovery mechanism be compatible with streaming data applications as per DADs. Keys recovery tends to be a rare occurrence so performance demands may be less constraining. Nonetheless, finding the minimally sufficient means for key recovery is still the goal. Because cryptographic keys are long strings of numbers they are extremely hard to remember. Moreover to be secure the private key needs to be kept secret. This means that typically private keys are stored someplace besides a person's memory and are therefore subject to being lost or stolen. 

If it is required or at least desirable that the DAD stream not be reinitialized due to the loss of the rotation event history then a key recovery mechanism would also need to provide recovery of the key rotation history. To restate, it is not enough to just recover the original root DID but every rotated root DID must be recovered as well. Given that typically rotations happen rarely, the rotation event history should be small in size and not pose a storage size problem for recovery. Thus key recovery for DADs needs to at least recover the original root key and any rotations. 

DDIDs can be regenerated from the root DID given the HD derivation code. In the case where the the DDID stream may not be easily reestablished but must resume given the latest rotated DDID then the HD chain code must also be preserved and recovered. If the number of DDIDs is very large then the storage requirements for chain codes may also be large relative to the storage requirement for key recovery. The DID root public key and DDID derivation chain codes do not expose the private keys, so although disclosing the root public key and chain code for a DDID is not a security risk, it could be a privacy risk. A third party could correlate data streams from the associated DDIDs should the root public key used by multiple DDIDs be exposed. One way to address this is to encrypt the chain codes with an encryption key derived from the root signing key. The chain codes can then be stored outside of the core recovery system. The worst case exploit then is a loss of privacy should the encryption be broken but not a loss of control of the resources owned by the private key.

When the DDID for communicating with a public service is derived from the public key of a server then the client does not need to preserve and recover the HD chain code. Instead it can regenerate the DDID using a hash of the root private DID and the public DID of the server. A complication occurs when the root private key has been rotated and the server was not made aware of the rotation. The client can still recover the current root DID used by the server using a trial and error approach by going through the list of rotated root DIDs, generating the associated DDID or derived key, verifying if the server will accept it, and if not incrementing to the next rotated root. Eventually the client will discover the last rotated DDID or derived key recognized by the serve. As a result the client can recover the appropriate DDID or derived key for a given service without having to preserve anything but the history of rotated root DIDs. This approach may provide meaningful storage savings when the number of external services is large.

#### Recovery Methods

Fundamentally key recovery involves shifting the burden of remembering a cryptographic key made of a long random string of numbers to some other memory task that is less onerous. 

##### Physical Security

One approach is to shift the task to physical security. Create a hard copy of the key such as a printed piece of paper or a "hard" electronic wallet and then hide the hard copy. The memory task now becomes remembering where the hard copy was hidden. The security of the approach is now based on the physical security of the hidden location (under the bed, safety deposit box, hole in the backyard). The assumption is that remembering where something is hidden is assumed to be relatively reliable. A weakness of this approach is that recovery may take time. Moreover if the person with the knowledge of the key location is incapacitated then recovery may be impossible.

##### Secret Sharing

Another approach is to shift the task to other parties. This can be done securely using a [secret sharing](https://en.wikipedia.org/wiki/Secret_sharing) or "splitting" approach . The key is split into what are sometimes called shards and each shard is shared with someone else. To recover the key the shard holders are asked to reproduce their shard. Combining the shards results in reconstitution of the key. Variations on this approach include using threshold sharding where only a subset of all the shards is needed to reconstitute the key. For example an M of N secret sharing (M < N) would share shards with N parties. Any combination of a subset of M parties can reconstitute the key. This allows some of the parties to not be available or to lose their shard and still have recovery. Typically to maintain secrecy the N parties do not know of each other. This means that owner of the key must remember who the N parties are or at least M non-faulty parties. 

Some threshold secret sharing approaches such as [Shamir sharing](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing) have what is called [information-theoretic security](https://en.wikipedia.org/wiki/Information-theoretic_security) in that it cannot be broken algorithimically even if the adversary has unlimited computing power including quantum computing. It must be broken by brute force if at all. A special case of information-theoretic security is called [perfect security](https://en.wikipedia.org/wiki/Information-theoretic_security). Perfect security means that the cipher text provides no information about the key. Shamir sharing also has perfect security. These properties mean that storing encrypted copies of the shards online may still be secure as long as an adversay cannot correlate the shards as belonging to the same key.

The security properties of Secret sharing make it an attractive approach for key recovery. Secret sharing, however, is a complicated approach and requires multiple participants. The key owner must still remember the the list of shard holders. The success of the method is still dependent on the owner "remembering" the identifiers of the shard holders.
    
##### Mneumonics

[password strength](https://en.wikipedia.org/wiki/Password_strength)



## Appendices

### Support for DAD Signatures in HTTP 

In web applications that use HTTP, the simplest most compatible way to associate or attach the signature in an HTTP packet is to include it in a custom HTTP header. Standad JSON parsers raise an error if there are additional characters after a closing object bracket thus one cannot simply append the signature after the JSON serialization in the message body. Another approach would be to use a custom JSON parser that guarantees a cononical representation of a JSON serialization (including white-space) and then wrap the data item and the signature in another JSON object where the signature and the data item are both field in the wrapper object. This is more verbose and is not compatible with the vast majority of web application framework tools for handling JSON serialized message bodies. Thus it is non-trivial to include the signature in the message body.  Using a custome HTTP header is relatively easy and has the advantage that is is compatible with the vast majority of existing web frameworks.  

A suggested header name is  *Signature* header that provides one or more signatures of the request/response body text.

The format of the custom Signature header follows the conventions of [RFC 7230](https://tools.ietf.org/html/rfc7230)

Signature header has format:

```http
Signature: headervalue

Headervalue:
  tag = "signature"
or
  tag = "signature"; tag = "signature"  ...
  
where tag is replaced with a unique string for each signature value
```

An example is shown below where one *tag* is the string *signer* and the other *tag* is the string *current*.

```http
Signature: signer="Y5xTb0_jTzZYrf5SSEK2f3LSLwIwhOX7GEj6YfRWmGViKAesa08UkNWukUkPGuKuu-EAH5U-sdFPPboBAsjRBw=="; current="Xhh6WWGJGgjU5V-e57gj4HcJ87LLOhQr2Sqg5VToTSg-SI1W3A8lgISxOjAI5pa2qnonyz3tpGvC2cmf1VTpBg=="
```


Where tag is the name of a field in the body of the request whose value
is a DID from which the public key for the signature can be obtained.
If the same tag appears multiple times then only the last occurrence is used.

Each signature value is a doubly quoted string ```""``` that contains the actual signature
in Base64 url safe format. By the signatures should use an intelligent default cryptographic suite such as the  64 byte Ed25519 signatures that have been encoded into BASE64 url-file safe format. The encoded signatures are 88 characters in length and include two trailing pad characters ```=```.

An optional *tag* name = *kind*  may be present to specify the cryptographic suite and version of the signatures.
The *kind* tag field value specifies the type of signature. All signatures within the header
must be of the same kind.

```http
Signature: signer="B0Qc72RP5IOodsQRQ_s4MKMNe0PIAqwjKsBl4b6lK9co2XPZHLmzQFHWzjA2PvxWso09cEkEHIeet5pjFhLUDg=="; did="B0Qc72RP5IOodsQRQ_s4MKMNe0PIAqwjKsBl4b6lK9co2XPZHLmzQFHWzjA2PvxWso09cEkEHIeet5pjFhLUDg=="; kind="ed25519:1.0"

```

### Cryptographic Suite Representation

Best practices cryptography limits the option that user may choose from for the various cryptographic operations, such as, signing, encrypting, hashing to a suite of balanced and tuned set of protocols, one for each operation. Each member of the set should be the one and only one best suited to that operation. This prevents the user from making bad choices. In most key representation schemes each operation is completely free to be specified independent of the others. This is a very bad idea.  Users should not be custom combining different protocols that are not part of a best practices cypher suite. Each custom configuration may be vunerable to potential attack vectors for exploit. The suggested approach is to specify a cypher suite with a version. If an exploit is discovered for a member of a suite and then fixed, the suite is updated totally to a new version. The number of cypher suites should be minimized to those essential for compatibility but no more. This approach increases expressive power because only one element is needed to specify a whole suite of operations instead of a different element per operation.

The following article explains in more detail how standards such as JOSE expose vulnerabilities due to too much flexibility in how cryptographic operations are specified. 

https://paragonie.com/blog/2017/03/jwt-json-web-tokens-is-bad-standard-that-everyone-should-avoid 

Example cypher suites:

```bash
v1: Ed25519, X25519, XSalsa20poly1305, HMAC-SHA-512-256
v2: Ed448, X448, XChaCha20Poly1305, keyed BLAKE2b
v3: SPHINCS-256, SIDH, NORX64-4-1, keyed BLAKE2x
```


## Canonical Data Serialization

Canonical data serialization means that there is a universally defined way of serializing the data that is to be cyptographically signed.

The are few typical approaches to achieving data canonicalization. The advantages of compatibility, flexibility and modularity that come from using a key/value store serialization such as JSON usually makes 1) the preferred approach.

1. Store the serialization and signature as a chunk.

The simplest is that the signer is the only entity that actually serializes the data. All other users of the data only deserialize. This simplifies the work to guarantee canonization. For example JSON is the typical data format used to serialize key:value or structured data. But the JSON specifcation for ser/deser treats whitespace characters as semantically unimportant as well as the order of appearance of keys. For a dictionary (key:value) data structure the typical approach is to represent it internally as a hash table. Most hash algorithms do not store data ordered in any predictable way (Python and other languages have support for Ordered Dicts or Ordered hashes which can be used to partially ameliorate this problem). But from the perspective of equivalence, key:value data structures are "dict" equal if they have the same set of keys with the same values for each key. Thus deserialization can produce uniform equivalent "dict equal" results from multiple but differing serializations (that differ in whitespace and order of appearance of fields). JSON only guarantees *dict* equivalent not serialization equivalence. Unfortunately the signatures for the differing but equivalent serializations will not match.

But in signed at rest data only the signer ever needs to serialize the data. Indeed, only the signer may serialize the data because only the signer has the private key. So deserialization and reserialization by others is of limited value. The primary value appears to be either schema completeness where signatures are included as fields in a wrapper object or the ability to nest signatures or signed data with signatures. Because is is simple to convert a JSON serialization to a coded serializaiton such as Base64. Nested coded JSON serialization without canonicalization can be trivially supported.  After expansion and decoding, readers of the data can see the uncoded underlying data in a *schema complete* representation.

The signer's serialization is always *canonical* for the signature. Users of the data merely need to use a "dict equal" deserialization which is provided by any compliant JSON deserializer. So no additional work is required to support it across multiple languages etc. If the associated data also needs to be stored unserialized then validation and extraction of the data is performed by first verifying the signature on the stored serialization and then deserializing it in memory.

2. Implement perfectly canonical universally reproducibly serialization.

In this approach all implementations of the protocol or service use the exact same serialization method that is canonical including white space and field order so that they can reproduce the exact same serialization that the original signer created when originally signing the data. This is difficult to achieve with something like JSON across multiple languages, platforms, and tool kits. Its usually more work to implement and more work to support because it usually means either using something other than JSON for serialization or writing from scratch conformant JSON implementations or at the very least having tight control of how white space and order occurs and ensuring accross updates that this does not change. Unfortunately many overly schematizied standards are based on this approach. This approach typically breaks web application frameworks.

3. Use binary data structures

With binary data structures the canonical form is well defined but it is also highly inflexible. 


### Relative Expressive Power

One way to measure and compare different knowledge representations is called *relative expressive power*.  In the physics world *power* is defined as work done per unit time. Its a ratio. *Expressive power* is similary defined as the ratio of meaning conveyed per dependency, where dependency is something that must be kept track of or transmitted to convey the meaningful information. Because dependencies are a measure of complexity, relatively higher expressive power conveys more meaning relatively more simply.

#### Intelligent Defaults

One approach to acheiving higher expressive power in a data representation specification is the use of intelligent defaults. An intelligent default assigns meaning to the absence of data. For example, if there are several options for a given data item value such as the *type* of a data item, an intelligent default would assign the type to a predetermined default if no type is provided in the data. This provides high expressive power as the type meaning is conveyed without the transmission of any bytes to represent type.

Typically in any given knowledge representation application the relative frequency of the appearance of optional values is not evenly distributed, but follows a Pareto distribution. This means that if an intelligent default (the Pareto optimal value) is specified as part of the schema the average expressive power of data items will be increased.

A practical example of this is the RAET (Reliable Asynchronous Event Transport) protocol header (see https://github.com/RaetProtocol/raet). Typically in protocols the header has a fixed format binary representation for two reasons. The first is that every packet includes the header so a verbose header reduces the payload capacity of each packet thereby making the protocol comsume more bandwidth. The second is that the header is used to interpret the rest of the packet and therefore must be consistenly parsable which is easier if the format is fixed. The problem with fixed format headers is that they are not extensible. To make the extensible usually means adding addition fields to the header to indicate the precense of additional extended fields.  RAET used an *intelligent default policy* to achieve a completely flexible extensible header that on average is the size of a non-extensible fixed format header. In RAET the header is composed of a serialized list of key-value pairs where each key is the field name of the associated field value. This makes it easy to add new key-value pairs as needed to extend the protocol to different uses and with different behavior. Unfortunately, transmitting the keys makes the header much larger relative to a fixed format header where the offset of the value in the header determines the associated field. RAET overcomes this problem by defining a default value for each key-value pair. When a header is generated on the transmit side, the actual key-value pairs are compared against the default set. Any pair where the value matches the default is not included in the list of key-value pairs in the transmitted header. On the recieve side a default header is created with every key value pair set to the default. The received header's key-value pairs are used to update the default header with the non-defaulted values.  Because the optional fields are seldomly used by most packets the average header size is comparable to a fixed format header.  When viewing the header after expansion and update all the fields are present so there is no hidden information. All the meaning is apparently conveyed.

RAET header field defaults

```python
PACKET_DEFAULTS = odict([
                            ('sh', DEFAULT_SRC_HOST),
                            ('sp', RAET_PORT),
                            ('dh', DEFAULT_DST_HOST),
                            ('dp', RAET_PORT),
                            ('ri', 'RAET'),
                            ('vn', 0),
                            ('pk', 0),
                            ('pl', 0),
                            ('hk', 0),
                            ('hl', 0),
                            ('se', 0),
                            ('de', 0),
                            ('cf', False),
                            ('bf', False),
                            ('nf', False),
                            ('df', False),
                            ('vf', False),
                            ('si', 0),
                            ('ti', 0),
                            ('tk', 0),
                            ('dt', 0),
                            ('oi', 0),
                            ('wf', False),
                            ('sn', 0),
                            ('sc', 1),
                            ('ml', 0),
                            ('sf', False),
                            ('af', False),
                            ('bk', 0),
                            ('ck', 0),
                            ('fk', 0),
                            ('fl', 0),
                            ('fg', '00'),
                      ])
```

Any key value based schema standard specification may benefit from an intelligent default policy to greatly increase the expressive power of the schema.  This becomes even more important where security is concerned as the intelligent default might be the most secure set of options thus helping the user be more secure and more expressive. Moreover expressive power is about conveying meaning more simply which makes it easier to implement and incentivizes adoption.

#### Essential vs. Optional Elements

Another related technique for increasing expressive power is to distinguish between essential and optional elements in a given representation. Any essential elements should be expressed as explicitly as possible (when not defaulted), that is, should not be looked up and should either not be indirected or have minimal indirecton. External lookups are expensive. Moreover, hiding essential elements behind multiple levels of indirection may make it harder to understand the conveyed meaning (adding dependencies and hence complexity). An important meaningful difference that should be apparent is whenever an essential element is not set to a default value. This difference should not be hidden behind indirection.


