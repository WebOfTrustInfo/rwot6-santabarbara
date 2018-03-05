Adapted from https://github.com/w3c-ccg/edu_occ_verifiable_credentials/ by @kimdhamilton and @ottonomy.

# About
There is a lot of interest in interoperability of Open Badges and other delivery formats of Educational/Occupational Verifiable Credentials. Below, we outline our goals, forthcoming design drafts, and other research related to achieving interoperabilty between the relevant specifications and services operating in this space.

Work on describing credentials is occurring within the IMS Global Open Badges Workgroup, W3C Verifiable Credentials Working Group, W3C Credentials Commiunity Group, Educational and Occupational Credentials in Schema.org Community Group, and Credential Engine/CTDL. Members of each of these communities are maintaining mutual awareness of activities and are pushing these specifications toward better long-term compatibility.

## Open Badges Identities - and how to reboot them
There are millions of credentials issued as Open Badges, but almost every badge is issued to an identity defined by an email address by an identity defined by a hosted HTTP record. Open Badges services construct issuer and recipient identities asymmetrically, but the recently finalized Open Badges 2.0 Specification opens the door to resolving this issue. All entities acting in the Open Badges space should be both able to receive and to award badges, but email addresses, most commonly used to identify recipients, can't completely fullfill the needs of issuer identification, and the HTTP identifiers used by issuers are unsuited for confirmation of identity. There is no standardized method of a credential inspector verifying that the entity logged into their service via a browser corresponds with a specific Open Badges [Issuer Profile](https://openbadgespec.org/#Profile). Open Badges 2.0 allows recipients to be identified by a property other than email address more specifically, like "@id", allowing identification of recipients by Decentralized Identifiers (DIDs). DIDs also have the potential to be used as issuer identifiers, if issuing tools can be connected to DID-based authentication services. 

This effort will result in requirements, use cases, and/or draft specs to be formalized in the appropriate standards group. For now, our priorities are:
- exploring the problem space
- creating specification/schema drafts and prototypes
- getting broader community feedback
- drafting initial use cases for forthcoming rounds of standardization

## Goals, use cases, and deliverables:
1. **VC Envelope**: Develop a proof of concept that uses Verifiable Credentials as a verification method for an Open Badges Assertion
  - Wrap and sign an assertion with verifiable claims envelope and linked data signature
    - See draft: [Open Badge Assertions as Verifiable Credentials](open_badge_assertions_as_verifiable_credentials.md)
  - Update an experimental fork of the [Open Badges Validator](https://github.com/IMSGlobal/openbadges-validator-core) to support the VC envelope JSON string as an input format, including support for verification of at least one flavor of Linked Data Signature.
  - Accurately describe capabilities and limitations of verification functionality in terms of what signature suites are supported in prototype.
2. **Blockcerts**: Develop a proof of concept that uses a [Blockcerts](https://www.blockcerts.org/) signature-and-blockchain-proof-of-existence Linked Data signature prototype using the above VC envelope. 
  - Add support to experimental fork of the Open Badges Validator that can verify the integrity of this signature and verify proof of existence on at least one blockchain.
3. **DID Recipient Identification**: Develop a proof of concept that uses a DID as Assertion recipient identifier
  - This is fairly trivial. Open Badges may use "id" as a recipient type. `"recipient": {"type": "id", "identity": "did:example:abc123", "hashed": false}` See [Profile Identifier Properties](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0/index.html#ProfileIdentifierProperties).
  - Update the experimental fork of the Open Badges Validator to support this use case and add relevant tests. 
4. **DID Issuer Identification and Signing**: Develop a proof of concept that uses a DID as an Issuer id.
  - Implement support for at least one did resolver method in the experimental fork of the Open Badges Validator to discover a relevant signing key and verify Linked Data Signature (at least one suite). 
5. We will likely build or seek collaboration with a OAuth2-based authentication service that can resolve and authenticated DIDs for users signed in via a browser. Open Badges services that trust this authentication service may associate DIDs with recipients and issuer users. 
6. Show how use of Open Badges Endorsements (Verifiable Credentials data format by another name) can be used to build a web-of-trust based model to answer questions of Issuer Profile authenticity and accreditation. Write up the wins that arise from authenticating DID documents compared with those from endorsements.

A relatively small number of Open Badges services implementing DIDs as issuer and recipeint identifiers could enable significant expansions to the use cases covered by Open Badges. We view the deliverables scoped out above as highly achievable in proof-of-concept form based on existing work from prior Rebooting Web of Trust workshops and work in the credentials standards communities listed above. In building the above prototypes, upgrades will be made to open source tools in the Open Badges ecosystems to integrate technologies such as DID resolution and verification, Linked Data Signatures, and Verifiable Credentials. Open Badges is a widely deployed vocabulary for describing educational achievements. It should work well with these other technologies and specifications in the credentials space to make sure the benefits of approaches developed in each corner of the community can spread broadly across closely related ecosystems.
