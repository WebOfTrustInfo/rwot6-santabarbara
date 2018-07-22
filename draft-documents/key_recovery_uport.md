Follow up from [Survey of Cryptographic Key Recovery Methods Breakout Session](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/draft-documents/key_recovery_methods.md)

# μPort Key Recovery Methods

Author: Christian Lundkvist

μPort is a lightweight decentralized identity system. It uses a combination of IPFS and Ethereum to create a [decentralized PKI](http://www.weboftrust.info/downloads/dpki.pdf). It also includes a social recovery mechanism allowing identities to rely on other identities for protection and recovery in case they lose the device(s) where their private keys are held.

## Overview

The main idea behind μPort is to use IPFS for registration and DID resolution and only use the Ethereum blockchain for key revocations. The benefits of this include:

* No blockchain transactions needed for registering an identity
* Tiny amount of smart contract code (Only required smart contract RevokeAndPublish is ~30 lines of Solidity)
* The simplest implementation (useful for devices with built-in keys) requires no blockchain transactions
* The Ethereum usage is highly parallelizable and so can take full advantage of sharding, plasma and other scaling technologies
* There is the potential to switch to other blockchains while maintaining a persistent identifier
* There may be a future possibility of coupling the blockchain revocation with off-chain systems like [CONIKS](https://coniks.cs.princeton.edu) such that we can fallback to the blockchain in the case where the CONIKS system is compromised, this could allow the system to scale to millions of users while still being able to utilize the security of the blockchain.

## Implementation

In this section we go through the details of how to register an identity, recover the identity in the case of key loss, read the DID document for a specific identity as well as update the DID document (including key revocation).

We assume that the reader is somewhat familiar with the general ideas behind DIDs, DID documents etc. For a good introduction of DIDs see [this primer](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/did-primer.md). For an introduction to Verifiable Credentials, see [this primer](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/verifiable-credentials-primer.md).

### Notation

We use the notation `(k, K)` to denote a private/public key pair where the lowercase `k` denotes the secret/private key and the uppercase `K` denotes the public key.

The notation `enc(E, X)` is used to denote the asymmetric encryption of the data `X` with the public encryption key `E`.

### Registering an identity

A user creates a master secret `m` from which they generate three private key pairs: signingKey, managmentKey and encryptionKey. We also derive a symmetricKey used for symmetric encryption.

We may also choose to generate other keys like cryptocurrency private keys from the master secret.

We assume two kinds of backup procedures:

**Offline manual backup:** The user handles their own backup key management. This is the current status quo in the cryptocurrency space, which requires a fairly high degree of computer literacy and basic understanding of cryptography and threat models.

**Social recovery:** The user relies on other identities (default is 3 others) to be able to recover if they lose their keys. This type of user will utilize existing trust relationships to offload the burden of key management.

A user utilizing a social recovery backup selects 3 identities (could be friends, family or institutions) to be their recovery delegates.

We use a [Shamir Secret Sharing scheme](http://dl.acm.org/citation.cfm?doid=359168.359176) to split our master secret among the three delegates.

Suppose we designate three recovery delegates D1, D2, D3 and corresponding asymmetric encryption key pairs `(e1, E1)`, `(e2, E2)`, `(e3, E3)`.

We split the master secret `m` into shares `S1`, `S2`, `S3` in a 2-of-3 SSS scheme and encrypt them to the respective recipients, to get three encrypted payloads as follows:

```
(enc(E1, S1), enc(E2, S2), enc(E3, S3))
```

The above package is added to the users DID Document. This approach can also be generalized to choose N contacts and set up a general M-of-N scheme.

Note that for this scheme to work we cannot have the master key m be stored on a smart card or similar device that prevents extraction of the key.

We then create a so-called “DID document template” which is a JSON file with the following general structure:

```
{"version" 1, "signingKey":"030b8842f6bbd533dfec2938a23518d9fbf25ce489c8dbb554b2873e86de50eec9",
"managementKey":"0230656c245e71feed2f36e49e9a6a8cc58c4485d4f256ae5aadad851fc02927e6",
"asymEncryptionKey":"IHJ5MgBjZAAZLUYlNH4OWUqowi4OTMOsE7MjYnjUMik=",
"recoveryNetwork":{"nonce":"l0i5Btxh0MywERlpOSSDYqpZf06EVPcu",
"ciphertexts":["Ejr9EJoFFnuxCmsu2rlOTUhVZJO42g7AuwNvhV7xMsg+TYCA6bEB+F3u8T5XGt/oVoBgDPZLXES6jcec/LCim9uFoJYZ","Uv9NakbyrTwTdX39c/zMw93HZorm3wbT25WxXsCGPiWtM0BzJF8rGMKMZ8+bDEsUO1QTexqtrBrxx21tUkk2oyeCC1Ud","mMxr9sGZ60iUcijEYp0R0VoyQO18S5s/P/J3OkyrTMmgS83B+d/4q9Rik0c9E3DMhngxa4PgToSeadsDmFYgYCqESiOd"]}
}
```

The “recoveryNetwork” section consists of the master secret `m` split up in 3 parts such that each part can be decrypted by one of the recovery delegates, as described above.

Instead of selecting 3 recovery delegates a user utilizing offline manual backup will instead write down a seed phrase encoding their master seed `m`, or store a backup of `m` as a QR code or similar. Their DID document template is identical to the one for the Normal user except with no “recoveryNetwork” section.

The user then stores the above document in IPFS, and the IPFS hash is the new DID of the user, i.e. their DID is of the form

```
did:muport:QmfUXqkEv3nGgCXegKc2JgQNj4FCqGy6GDRn8LTcCzmZQH
```

In order to fetch the DID document of a newly created identity we would simply fetch the document corresponding to the IPFS hash. Note that this registration flow requires no blockchain interactions.

### Recover identity (Social recovery)

Suppose the user loses their master seed `m`. We can recover using the following steps:

0. User has access to their DID somehow (saved in their contact list, screenshot, mailed to themselves, ask a friend or service)
1. On their new device, user generates a temporary encryption key pair `(eT, ET)`.
2. The recovering user contacts recovery delegate D1 and presents them the encryption public key `ET` along with their DID. This could for instance be encoded in a QR code.
3. D1 retrieves the DID document of the user and decrypts `enc(E1, S1)` using `e1` to get `S1`
4. D1 encrypts `S1` with the temporary encryption key to get `enc(ET, S1)` and provides this to the user through an arbitrary channel (QR code, email, chat etc).
5. User decrypts `enc(ET, S1)` with `eT` to obtain `S1`
6. User repeats steps 2-5 until enough shares have been obtained to reconstruct `m`
7. `m` is used to derive the signingKey, managementKey and encryptionKey
8. User retrieves their DID document and verifies that the derived keys match what’s in the document. The identity is now restored.

### Recover identity (Offline manual backup)

0. User has access to their DID (saved together with their master seed, or emailed to themselves)
1. User types in their word encoding of the master seed m, or scans the QR code representation of the master seed
2. m is used to derive the signingKey, managementKey and encryptionKey
3. User retrieves their DID document and verifies that the derived keys match what’s in the document. The identity is now restored.


### Updating a DID document

Updating the DID document is necessary when updating the recovery network, or adding other data to the DID document. The update procedure uses the managementKey.

In order to modify the DID document we use the RevokeAndPublish smart contract defined here:

<https://github.com/uport-project/ethereum-claims-registry/blob/master/contracts/applications/RevokeAndPublish.sol>

Suppose we have a DID document D. In order to update to a new document D’ we will call the `publish` function on the RevokeAndPublish contract using the managementKey to publish the hex encoding of the IPFS hash of D’.

We recommend that the updated DID document contains the hash of the previous document, so that the whole chain of updates can be easily linked.

We also recommend that if the DID document is updated in order to rotate the recovery delegates, then the keys should be rotated as well. See below for how to rotate keys.

### Revoking and rotating keys

Revoking and rotating keys are necessary if we suspect that that keys may have been compromised. In order to revoke and rotate keys we use the RevokeAndPublish smart contract.

To revoke and rotate keys:

1. Generate a new master seed m'
1. Derive a new set of keys from the new master seed
1. Split up the new master seed m' to the recovery network
1. Use the new symmetricKey' derived from m' to encrypt the old master seed m
1. Create an updated DID document containing: the new keys and recovery network, the symmetrically encrypted old seed `m`
1. Use the old managementKey (derived from m) to call the `revokeAndPublish` function of the RevokeAndPublish smart contract. The inputs to the function should be: genesis managementKey, the IPFS hash of the updated DID document, and the new managementKey (derived from `m'`).
1. Verify that the managementKey in the resolved DID document matches the key obtained from calling the `manager` function in the RevokeAndPublish smart contract.

### Resolving a DID (Read)

1. Use IPFS to resolve the IPFS hash of the DID to get the original DID document.
2. Call the `lookup` function of the RevokeAndPublish using the managementKey in the original DID document. 
3. The `lookup` function will return the IPFS hash pointing to the latest version of the DID document, or if it returns `0` the DID document resolved directly from the DID is the latest one. 

## Variations

We give examples of some variations of the above protocol.

### managementKey external to user

Instead of having the master secret m generate the managementKey, we can have the managementKey be randomly generated when the master secret is generated. The managementKey is then bundled with the master secret and this data is split using SSS and encrypted to the recovery delegates. After this the managementKey is deleted. This way we have a system where the user can only update their DID document or rotate keys with the help of their recovery delegates.

Using this variation if a user has their device compromised or master secret stolen the attacker can potentially impersonate the user and/or decrypt messages, but they cannot take over the identity since the recovery network can always force a key rotation.

This may be a good option for identities that are used in a business setting.

### Smart contract based DID document updates

Instead of using RevokeAndPublish to publish a new DID document we could have more complex smart contracts with arbitrary logic that can cause a new DID document to be published if certain conditions are met in the smart contract.

## Challenges and potential mitigations

* We are storing asymetrically encrypted data in public - if a quantum computer is developed this data could be decrypted and reveal potentially sensitive data. One way to mitigate this could be to save data symmetrically encrypted rather than asymetrically encrypted. Another mitigation is to use a Data Hub or Agent to store the encrypted data.
* Scaling is an issue for any system relying on a public blockchain.
