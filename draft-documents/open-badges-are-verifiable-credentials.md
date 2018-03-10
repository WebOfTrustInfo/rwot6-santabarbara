# Open Badges are Verifible Credentials
By Nate Otto (Concentric Sky, USA), Kim Hamilton Duffy (Learning Machine, USA)

Contributors: (feel free to move yourself up to the author line as you feel your contributions rise to that level)

* Kulpreet Singh (Chlu)
* Luiz Gustavo Ferraz Aoqui (IBM)

This document is expected to contribute to standards development at IMS Global and/or other standards bodies such as the W3C. This document's license is Creative Commons Attribution (CC-BY), but contributions should also be ready to commit to license relevant and necessary IP under the IPR policies of these standard organizations.

## Abstract
We identify use cases and requirements that connect threads of work happening in the Rebooting Web of Trust community around: educational achievement claims (particularly using the Open Badges vocabulary), use of decentralized identifiers (DIDs) within web services where educational claims circulate, and integrating blockchain-reliant verification layers. We illustrate each of these cases with a set of example documents and describe user stories for Open Badges ecosystem software in the roles of Issuer, Host/Backpack, Displayer, and Verifier that need to be implemented in order to enable the capabilities described.

## Table of Contents
> [TOC]

## Introduction
The Open Badges Specification is a vocabulary and set of protocols that describes Credentials. The vocabulary can describe any achievement in terms of a common set of attributes and is most often found in describing educational or occupational credentials. At present, Open Badges defines two verification methods, `HostedBadge` (requiring resources hosted on HTTP in specific locations) and `SignedBadge` (using a JSON Web Signature, that references hosted Issuer Profile and CryptographicKey information). This paper proposes a new option that can reside alongside these existing verification methods. We present an ordered set of examples introducing new capabilities for Open Badges and we explore the opportunities and costs in  implementing each of them.

## TODO: describe how these approaches will be used relating to existing and expected future OB & VC ecosystem. TODO: Kim needs to review/cleanup
0. Context setting for comparison -- Open Badges and Verifiable Credentials are complementary

Both Open Badges (OB) and Verifiable Credentials (VC) are capable of expressing a cryptographically verifiable statement about the subject, issuer, evidence, and expiration date of a credential.

A VC provides a very lightweight structure for expressing a variety of claims, including government-issued credentials (such as driver's licenses or passports) and educational credentials. A VC implementer chooses which schema/vocabulary to use, depending on the use case or domain. 

The strength of Verifiable Claims is its flexibility across a wide variety of use caess. A VC is obtains semantics through JSON-LD contexts; however, because of its relative newness, there is not general agreement on schemas and vocabulary sets. This will no doubt improve over time: while fragmentation is an initial risk, issuers in a given domain will likely converge to a few well-known vocabularies, and there will be established semantic mappings.

> Note that equivalence of credentials (e.g. C.S. 101 at University A qualifies as a transfer credit for "Intro to C.S." at University B) is beyond the scope of semantic equivalence (and this paper).

In comparison, Open Badges have been used in production deployments for nearly a decade. This has established fitness-of-purpose FOR real-world EDU/OCC scenarios, and has led to a rich set of conventions and vocabularies. Successful deployments range from low to high stakes scenarios:
- informal recognition of a valuable contribution, which in aggregate may establish an individual as a subject matter expert among their peers
- recognition for completion of online training, which provides an individual recognition by their employer
- completion of coursework or university degrees

Building on this success, the Open Badges community has driven related standards, such as stackable credentials leading to a larger goal ("Open Pathways", which could be used to represent the path from individual university courses to a degree). Open Badges -- like Verifable Credentials -- have been architected with self-sovereign principles in mind, even before the term was established. The goal is to allow recipients to own their credentials, that a recipient's credentials are independently-verifiable and long-lived.

The Blockcerts extension of Open Badges furthered alignment with Verifiable Credentials by using JSON-LD signatures/verification and blockchain anchoring. The logical next step is continued alignment, such that a recipient may share their Open Badges just like any Verifiable Credential, 

1. What is the structure/purpose of an Open Badge?


An Open Badge consists of an `Assertion`, a `BadgeClass` and `Profiles` -- one each for the issuer and recipient. The issuer is identified by a URI, typically pointing to an http Issuer Profile containing information about the issuer, including its current and revoked cryptographic keys.

Open Badges support signed and hosted ... TODO blockcerts

....


2. What is the structure/purpose of a Verifiable Credential?


A `Credential` is set of one or more `Claim`s about a `Subject`. Credentials are almost always digitally signed by the `Issuer`, making the credential tamper-resistennt and non-repudiable.


3. What is the prospect for implementation landscape that brings these together.

There is significant cross-pollination in the development of Open Badges and Verifiable Credentials; accordingly, there is already significant structural alignment:
- Open Badge Endorsements employ the Verifiable Credneitals structure
- Open Badges and Verifiable Credentials Issuer Profiles are aligned
- Both use JSON Linked Data, allowing reuse among different contexts

The motivation behind the Verifiable Credentials specification was largely driven by educational and occupational use cases. The current VC data model uses samples outside the edu/occ space; e.g. driver's licenses or other government-issued credentials. 

Further alignemnt of Open Badges and Verifiable Credentials provides benefits to both communities:
- Verifiable Credentials benefit from the rich expressiveness and vocabulary vetted by years of real-world Open Badges deployments 
- Open Badges can participate in the upcoming Verifiable Credentials ecosystem, which benefits recipients by allowing their Open Badges to function as Verifiable Credentials (via alignment of structural and verification mechanisms).


We have identified three ways to connect the Open Badges and Verifiable Credentials specifications. We will circulate and compare the core options here and choose which to base our prototypes upon.

## Option 1: A Verifiable Credential/Assertion claims that an entity holds an BadgeClass

The Verifiable Credentials Data model has moved to enable some "credential metadata" options that parallel attributes of Open Badges Assertions, including evidence. The core purpose of the Assertion is to describe the instance of the award, an issuer's claim that a particular recipient has met the criteria defined in a Badgeclass and the evidence related to that. 

While Open Badges have a `badge` property that points to "the BadgeClass definition that is presently asserted" and a separate `recipient` property that serves to identify the recipient by some string-based identifier, such as an email or a DID, Verifiable Credentials have a `claim` an issuer makes to describe attributes of a recipient. In the Verifiable Credentials context, the way to describe the Open Badges concept of "earning an instance of a BadgeClass definition" is to *claim* that "a recipient, identified by a DID or in possession of a particular identifier, holds or has met the criteria of a BadgeClass definition". This requires the introduction of a new `holds` property in the Open Badges vocabulary.

Here is an example of a Verifiable Credential/Assertion that a recipient identified by a DID holds a certain BadgeClass.

```json
{
	"@context": ["https://w3id.org/credentials/v1", "https://w3id.org/openbadges/v2"],
	"id": "https://some.university.edu/assertions/9732",
	"type": ["Credential", "Assertion"],
	"issuer": "https://example.com/i/alice",
	"issued": "2018-02-28T14:58:57.461422+00:00",
	"claim": {
		"id": "did:example:recipient_did",
		"obi:holds": {
			"id": "https://example.com/badgeclasses/123",
			"type": "BadgeClass",
			"name": "Certificate of Accomplishment",
			"image": "data:image/png;base64,...",
			"description": "Lorem ipsum dolor sit amet, mei docendi concludaturque ad, cu nec partem graece. Est aperiam consetetur cu, expetenda moderatius neglegentur ei nam, suas dolor laudem eam an.",
			"criteria": {
				"narrative": "Nibh iriure ei nam, modo ridens neglegentur mel eu. At his cibo mucius."
			},
            "issuer": {
                "type": "Profile",
				"id": "https://example.com/i/alice",
				"name": "Example Issuer",
				"url": "http://example.com",
				"email": "test@example.com"
            }
		}
	},
	"obi:evidence": {
		"id": "https://example.org/beths-robot-work.html",
		"name": "My Robot",
		"description": "A webpage with a photo and a description of the robot the student built for this project.",
		"narrative": "The student worked very hard to assemble and present a robot. She documented the process with photography and text.",
		"genre": "ePortfolio"
	},
	"sec:proof": {
		"@graph": {
			"type": "sec:RsaSignature2018",
			"created": "2018-03-07T19:22:15Z",
			"creator": "https://example.com/i/alice/keys/1",
			"sec:jws": "eyJhbGciOiJQUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..p9RDJqwzXyxfC69dMEz503_ZZ_af1e_hV931dPlIdrofC6p2y_dcjjqIDysReJy6W_fnN_dZGVoXqFAg2OD_SmbDi5dNMOZILot-zJdDJCxXWuwZtiCFlt29KfLmJs6me0bD5pU4RbknXDoyBhA8muMby8j1fUeBDo3Ienmzv5UlB3v0f0-w5l6-z_cswHB_UXIlWw4EzcsmLvHzjB7TI76QLwq3KeVPSB3U9aM3o2Ejkq6Ygh5XxUGkXiZUQ5ungQ9Psy_VicjZyOc19LoBPoiPxDHQodTrqCFNH2qCNhDc4lg2zE8S9KNlQhUUFatzkTN70s23fhWBMKz2a5DWgQ"
		}
	}
}
```

Values for the claim may vary in two meaningful cases to note here:

1. The issuer wishes to take advantage of the light anti-correlation mechanism enabled by Open Badges hashed recipient identifiers for a recipient identified by `id`.
2. The issuer wishes to identify the recipient by a profile identifier property other than `id`, such as `email`. Use of hashed identifier may or may not be used.

In either case, the implementation option is to make an additional claim about the recipient. In addition to the above claim that "a recipient holds or has met the criteria of a BadgeClass definition", the issuer makes a claim that the recipient "holds an identifier of a particular type" using the Open Badges IdentityObject:

```json
{
	...
	"claim": {
		"holds": { "type": "BadgeClass" },
		"recipient": {
			"type": "email",
			"hashed": false,
			"identity": "testrecipient@example.com"
		}
	}
}
```

## Option 2: An Assertion is a Verifiable Credential Claim
The Verifiable Credentials Specification allows issuers to make a claim about a subject while remaining  agnostic to the content of that claim. It is possible to use an Open Badges Assertion as the claim of a Verifiable Credential, signed with a Linked Data Signature. The ID for the key and its owner are modeled as an HTTP-resolvable document as in the examples on the [jsonld-signatures](https://github.com/digitalbazaar/jsonld-signatures) library.

```json
{
	"@context": "https://w3id.org/credentials/v1",
	"id": "https://some.university.edu/credentials/9732",
	"type": ["Credential", "OpenBadgeCredential"],
	"issuer": "https://example.com/i/alice",
	"issued": "2018-02-28T14:58:57.461422+00:00",
	"claim": [{
		"@context": "https://w3id.org/openbadges/v2",
		"id": "urn:uuid:437fc6ff-bb3c-4987-a4b7-be8661ff6f21",
		"type": "Assertion",
		"recipient": {
			"type": "email",
			"identity": "test@example.com",
			"hashed": false
		},
		"badge": {
			"type": "BadgeClass",
			"id": "urn:uuid:7aad3c57-3bfb-45ea-ae79-5a6023cc62e4",
			"name": "Certificate of Accomplishment",
			"image": "data:image/png;base64,...",
			"description": "Lorem ipsum dolor sit amet, mei docendi concludaturque ad, cu nec partem graece. Est aperiam consetetur cu, expetenda moderatius neglegentur ei nam, suas dolor laudem eam an.",
			"criteria": {
				"narrative": "Nibh iriure ei nam, modo ridens neglegentur mel eu. At his cibo mucius."
			},
			"issuer": {
				"type": "Profile",
				"id": "https://example.com/i/alice",
				"name": "Example Issuer",
				"url": "http://example.com",
				"email": "test@example.com"
			}
		},
		"verification": {
			"type": "VerifiableClaim2018"
		}
	}],
	"sec:proof": {
		"@graph": {
			"type": "sec:RsaSignature2018",
			"created": "2018-03-07T19:22:15Z",
			"creator": "https://example.com/i/alice/keys/1",
			"sec:jws": "eyJhbGciOiJQUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..p9RDJqwzXyxfC69dMEz503_ZZ_af1e_hV931dPlIdrofC6p2y_dcjjqIDysReJy6W_fnN_dZGVoXqFAg2OD_SmbDi5dNMOZILot-zJdDJCxXWuwZtiCFlt29KfLmJs6me0bD5pU4RbknXDoyBhA8muMby8j1fUeBDo3Ienmzv5UlB3v0f0-w5l6-z_cswHB_UXIlWw4EzcsmLvHzjB7TI76QLwq3KeVPSB3U9aM3o2Ejkq6Ygh5XxUGkXiZUQ5ungQ9Psy_VicjZyOc19LoBPoiPxDHQodTrqCFNH2qCNhDc4lg2zE8S9KNlQhUUFatzkTN70s23fhWBMKz2a5DWgQ"
		}
	}
}
```

The example above illustrates the following salient features:
 
* The claim ID is the ID of the Assertion, not of the Recipient. Semantically, that means that the Verifiable Credential is effectively claiming "This Assertion exists with content...". An alternative model is to introduce a "holds" property making the claim about a recipient instead. For example, "The subject identified as `id` holds the Assertion with content".
* The above approach is chosen because it preserves Open Badges ability to "hash" the recipient, and because specialized backpack/wallet tools will likely need to exist for OpenBadgeCredential in any case. This means expending extra effort to use the more common way of thinking about Verifiable Credentials, that they are claims about a potentially human subject entity, will not result in any meaningful return.
* There is some duplication in the data package around the issuer. Future relaxation of the Open Badges Specification may become possible when the Assertion issuer is defined elsewhere in the "envelope", but the relative cost of duplicating this data to achieve parity with the current Open Badges Specification is low and will minimize the work needed in Open Badges tools to implement this delivery method.

## An Assertion Awarded to a Recipient Identified by a DID
In the first example above, the recipient was identified by an email address. 

```
"recipient": {
	"type": "email",
	"identity": "testrecipient@example.com",
	"hashed": false
}
```

The Open Badges Specification allows for several string-type attributes of an entity to be used as an Assertion's *[Recipient Profile Identifier Property[(https://openbadgespec.org/#ProfileIdentifierProperties)*. 

[Decentralized Identifiers (DIDs)](https://w3c-ccg.github.io/did-spec/) are emerging as a new type of entity identifier that comes in a usuable IRI string format and have the ability to be deterministically "resolved" to result in a "DID Document". The resolved documents then describe the entity itself and other important aspects of its identity, such as the public keys and other authentication methods that can be used to connect a user in a web browser or a human sitting across the table from you to the DID identifier.

As Open Badges can be awarded to other string-type identifiers, like "@id" (aliased to "id" in the Open Badges & Verifiable Credentials contexts). We can identify a recipient in an Assertion like:

```
"recipient": { 
	"identity": "did:example:recipient_did",
	"type": "id",
	"hashed": false
}
```

This is all that must be done to award an Assertion to a DID as recipient identifier. Verifying that the Assertion is awarded to the expected DID is already supported in the Open Badges Validator. The Specification can be clarified to add "id" to the list of identifier types "considered servicable", but that will constitute a clarification rather than a change.

One other feature to note about recipient identifiers in the [IdentityObject](https://openbadgespec.org/#IdentityObject) specification is the ability to salt and hash the identifier within the Assertion. This provides a layer of obfuscation around the identity of the recipient so that anybody who "picks the Assertion up off the street" is unlikely to be able to correlate that with a recipient. However, this obfuscation does not provide foolproof protection against correlation, because it is susceptible to brute force attacks. Further, any individual/entity in posession of the Assertion and the correct recipient identifier can share it with other entities. DIDs can also be hashed in the IdentityObject, this is similar to the way email addresses were hashed in earlier example. The hashed identity value below is the result of a single-pass SHA-256 hash of the `id`-type identifier `did:example:recipient_did` concatenated with the salt `kosher`.

```
"recipient": {
	"identity": "sha245$008f8e2100a34fe6d10cc4205555c5a24e26058843aa23e53a4b4d42cb0424c8",
	"type": "id",
	"hashed": true,
	"salt": "kosher"
}
```

## An Assertion Awarded by an Issuer identified with a DID
The primary function of a Decentralized Identifier is to resolve a DID string to a [DID Document](https://w3c-ccg.github.io/did-spec/#did-documents) that describes the entity, specifically, attributes like public keys that allow for the authentication of messages sent by and under the auspices of the entity that controls the DID. Verifiable Credentials are one type of message that can be signed and delivered by a DID-identified entity, and Open Badges Verifiable Credentials are yet another type of Verifiable Credential that can be signed in the same way. 

With this model in place, Open Badges Verifiers (through Verifiers, Backpacks/Hosts and Displayers) can resolve a DID to a DID document, access the authorized public keys associated with that DID, determine which authorized key was identified as the creator of a Credential signature, and verify the integrity of that signature. 

In the current Open Badges Specification, even when using the `SignedBadge` verification method, there are at least two resources that must be hosted on HTTP(s) in order to be able to produce valid Open Badges Assertions: the Issuer Profile, and the CryptographicKey (identified by the publicKey attribute of the Issuer Profile). Using a DID for the Issuer Profile `id` instead of an HTTP URI allows for open badge data to be entirely uncoupled from HTTP hosting dependencies.

Here is an example DID for an issuer: `did:example:issuer_did`. The part of the DID between the first and second `:` characters identifies the [resolver method](https://w3c-ccg.github.io/did-spec/#did-resolvers). The part after the second `:` is the [DID path](https://w3c-ccg.github.io/did-spec/#did-paths). If a service has implemented the algorithm specified by the particular resolver method used, it can reliably retrieve a DID document identified by the DID.

We now show an example DID document for the `example` issuer described above. An implementer of the `example` resolver method could have retrieved the DID document using the method specified by the method specified. For example, by fetching data from a specific blockchain and deriving the DID document from it.

```json
{
  "@context": "https://w3id.org/did/v1",
  "id": "did:example:issuer_did",
  "publicKey": [{
    "id": "did:example:issuer_did#keys-1",
    "type": "RsaVerificationKey2018",
    "owner": "did:example:issuer_did",
    "publicKeyPem": "-----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2x3wWF6LY1pNxxTIUfPtHBGvPgcVvVDaoGpOjMk9+QfcXBVzcEnIlYenI8WfvoNSNUbblmDyn5sqWg9KyQpcoJ2IAoemjTcb+Skw9PaS2KAYjCYq9pmnvGhmmXJjk1xuT3gevG8K9XGJ2MmuqdKQ4yzfPhD5kHdLxV9Y9VY2rgZJzSNL83Oz596tcFbA1QB0p8wj7xQpLYRu5d1Mz+1qu1E8NM6HPgSBp54JHJF0yL3s39rGNbxmopwCq1Vw9E22ZnJpHQtc4nq4N3JksfVPeHhirC3eny0YS78Z6W7bGlVT+bf+T6r43Rq8kQ7N8hVLrGHc+NuHXm1JBIbpKwIDAQAB-----END PUBLIC KEY-----\r\n"
  }],
  "authentication": [{
    "type": "RsaSignatureAuthentication2018",
    "publicKey": "did:example:issuer_did#keys-1"
  }],
  "service": [{
    "type": "ExampleService",
    "serviceEndpoint": "https://example.com/endpoint/8377464"
  }]
}
```

### TODO: Add version of above example for "Option 1"

Within such a DID document, one or more public keys can be identified. In the example above, a single RSA key is described. An Open Badges verifier that supports the required DID resolver method discovers keys that can be trusted to be under the control of the entity. The resolver then verifies that a particular Open Badges Verifiable Claim is signed by a keypair belonging to the entity. Here is an example of what such a signed Assertion looks like for this issuer:

```json
{
	"@context": "https://w3id.org/credentials/v1",
	"id": "urn:uuid:01f0bb90-86ee-4469-9655-7ca6f4d591ae",
	"type": ["Credential", "OpenBadgeCredential"],
	"issuer": "did:example:issuer_did",
	"issued": "2018-02-28T14:58:57.461422+00:00",
	"claim": [{
		"@context": "https://w3id.org/openbadges/v2",
		"id": "urn:uuid:437fc6ff-bb3c-4987-a4b7-be8661ff6f21",
		"type": "Assertion",
		"issuedOn": "2018-02-25T00:00:00+00:00",
		"recipient": {
			"type": "id",
			"identity": "did:example:recipient_did",
			"hashed": false
		},
		"badge": {
			"type": "BadgeClass",
			"id": "urn:uuid:7aad3c57-3bfb-45ea-ae79-5a6023cc62e4",
			"name": "Certificate of Accomplishment",
			"image": "data:image/png;base64,...",
			"description": "Lorem ipsum dolor sit amet, mei docendi concludaturque ad, cu nec partem graece. Est aperiam consetetur cu, expetenda moderatius neglegentur ei nam, suas dolor laudem eam an.",
			"criteria": {
				"narrative": "Nibh iriure ei nam, modo ridens neglegentur mel eu. At his cibo mucius."
			},
			"issuer": {
				"type": "Profile",
				"id": "did:example:issuer_did",
				"name": "Example Issuer",
				"url": "http://example.com",
				"email": "test@example.com"
			}
		},
		"verification": {
			"type": "VerifiableClaim2018"
		}
	}],
	"sec:proof": {
		"@graph": {
			"type": "sec:RsaSignature2018",
			"created": "2018-03-07T22:26:57Z",
			"creator": "did:example:issuer_did#keys-1",
			"sec:jws": "eyJhbGciOiJQUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..GMPdCXn-qQcZHPoO6qHn6hBiysMNaZ7nSBx_e27LuDxJvRsCLbR1n7LGG7i8NVW1SVMwRjs8aJ3H2XXFphCZF_dGaueTsaehTzLQgh9n5imPgrQFsAKsRAKTJ_zpVL8JpsbPcrXbb-fkAcD52oDuYJg1uVr3MOhe4BzibDUKaFg5-cXZ-Gs8KcXrh_Ddqtd8CWw0zS3fRvI3SKbO6op6hNB1Jha4mfAn49Q0BRiSuCxbyPNy5MtX7FGoimvLhsluM7UAtPWHBi6iW8Nh57fk4uS5ZywHJSYS9-HPcvbDUGPHPHOnwq4qq7xc47yXveMmyo2VX4YSYe3LM-_9w1TnGg"
		}
	}
}
```

### TODO: Add version of above example for "Option 1"

The issuer `id` declared in the `claim.badge.issuer` is the DID that we expect the verifier will resolve to the `did:example:issuer_did` DID document shown earlier in this section. When the verifier encounters this "did:example" IRI scheme, it will 1) resolve this DID to its corresponding DID document, 2) verify the signature and 3) verify that an authorized key created the signature. 

There is some repetition of data in the example above. The issuer id is included at both `issuer` and `claim.badge.issuer`. While this data can be normalized to only appear at `issuer`, leaving it in supports consistency within the Open Badges Specification - there are no breaking changes needed to add this new verification option. In addition, there are attributes of the Issuer Profile that are not assumed to be verifiable by DID resolver methods, such as the name of the issuer. The Open Badges ecosystem needs to model and implement verification for these properties independently of the capabilitity to verify connection between DID and public signing key demonstrated by these examples. Future versions of the Open Badges Specification may include capability to have an Assertion Issuer other than the BadgeClass Issuer (creator). 

An important capability enabled by using a DID instead of an HTTP URI as an Issuer `id` is that the issuer entity can authenticate into multiple applications that will then have equal ability to act on behalf of the issuer entity. There will be no implied primary/secondary distinction between these applications, because neither will "own" the identifier the way DNS allows only one entity to authoritatively own an HTTP identifier.

## Implementation User Stories for Open Badges Tools
### Validator
The [Open Badges Validator](https://github.com/IMSGlobal/openbadges-validator-core) is the main application that needs to be updated to support these features.
### Issuer
The OpenBadgeCredential wrapper is an optional verification type for Open Badges. That means issuers don't need to implement it in order to continue to issue valid Open Badges.
### Backpack/Host
Backpacks mostly rely on the verification information returned from a validator.
### Displayer


## TODO LIST: 
* [x] Option 1: Draft schema showing how An Open Badge Assertion can be delivered as the Verifiable Credential class itself
    * [ ] Update other examples with Option 1
* [x] Option 2: Draft schema showing how an Open Badge-defined achievement could be delivered using the Verifiable Credentials envelope: Create working examples of documents and software that show An Open Badge delivered as a Verifiable Credentials claim, signed with a Linked Data Signature
* [x] Use DID as recipient identifiers for Open Badge Assertion
* [x] Use DID as an issuer identifier referenced by an Open Badge Assertion
* [ ] Kim: Demonstrate Blockcerts signature method
* [ ] Nate: Create JSON-LD Verifiable Credential samples of peer claims: "I read through Kim's code and know she writes good clear comments." - these samples should make sense to the Open Badges community.
* [ ] Christopher: An example of a peer attestation ("endorsement") from a DID-identified issuer to a DID-identified recipient.
* [] Joao: Describe alternatives for blockchain-based storage of badge data: Should the entire badge object be stored or just a verification hash or can they be stored on a public utilty peer to peer network? 

