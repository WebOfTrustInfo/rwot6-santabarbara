# ​Identity Hub Attestation Flows and Components

## ​1​ Abstract

Define all technical components and user flows required to facilitate request, issuance, presentation, verification, and revocation of interoperable attestations. This is used as an update to the identity hub specification to reflect these flows and components.

[[TOC]]

## ​2​ Introduction

In the digital identity space, Hubs let you securely store and share data. A Hub is a datastore containing semantic data objects at well-known locations. An identity needs to be able to prove that some data is true to another entity that requests it. These attestations are that method of proof. In the digital world, the requestor may be software, and the response may of may not require involvement of the individual/identity who the proof is being made against. These examples and flows depict how attestations are requested and resolved.

## ​3​ Example Use Cases

We use examples here to give guidance/suggestions for how attestations can be used with real world examples. In these examples, we use the term "user agent" to refer to an app on a smartphone or similar device under the control of an individual (Alice). This could also be referred to as a digital wallet. A DID is a decentralized identifier to an individual’s agent, for a specific purpose, and not necessarily correlated to any other identifiers for her identity. An attestation is something the individual wants to be able to prove to others.

In order to communicate regarding attestations with an entity, an individual, in our examples Alice, will first need to establish a connection between her user agent and the entity she will interact with. This is necessary for all of the follow-on scenarios and is discussed first.

### ​3.1​ Alice links to an Entity

Alice wants to transact with the entity used in the scenarios with the intent to exchange attestations via her digital identity. First and foremost, the entity verifies that Alice is the owner of the digital identifier. In order to find Alice’s user agent we utilize the Universal Resolver (UR) to lookup Alice’s provided Decentralized Identifier (DID) to find her DID Document (DDO), used to authenticate Alice’s ownership of the DID and have access to Alice’s user agent.

```plantuml
autonumber
participant UR
participant "Entity Hub"
participant "Entity Site"
participant "Alice UA"
"Alice UA"-->"Entity Site": Initiates DID Linkage
"Entity Site"-->"Alice UA": Prompts to disclose DID
"Alice UA"-->"Entity Site": Discloses DID
"Entity Site"-->UR: Lookup DID
UR-->"Entity Site": Return DDO
"Entity Site"-->"Alice UA": DID Auth Challenge
"Alice UA"-->"Entity Site": DID Auth Response

```

1. Alice navigates to an entity’s website and clicks a link to initiate a DID linkage with the entity. 

2. The entity prompts for Alice to disclose a DID that represents her digital identity. If the website was accessed via a laptop/desktop, the website typically displays a QR Code for Alice to use her wallet app to scan. If the website was accessed via her mobile device, the website performs an app transfer.

3. Alice selects an existing DID or creates a new DID for this relationship, then uses her user agent to send the DID to the entity.

4. The entity uses a Universal Resolver (UR) software application to request retrieval of the DDO for that DID. 

5. The DDO is returned to the entity.

6. The entity performs the DID Auth process by issuing a challenge to Alice’s user agent.

7. Alice’s user agent responds with a response to the auth challenge.

### ​3.2​ Alice must prove a precondition

Alice is attempting to register for College and her DID is already linked to the College. For Alice to get admitted to the College, Alice must prove she previously has received appropriate immunizations. 

Assumptions 

* Alice is linked to the College via her DID.

* Alice has an Identity Hub accessed via an application on her mobile device.

* Alice has a verified digital attestation for her previous immunizations.

```plantuml
autonumber
participant "College Hub"
participant "College Site"
participant "Alice UA"
participant "Alice Hub"
"Alice UA"-->"College Site": Request Registration
"College Site"-->"College Hub": /message: RequestAttestationAction
"College Hub"-->"Alice Hub": /message: PreconditionsAttestationAction (Immunizations)
"Alice Hub"-->"Alice UA": Request Permission
"Alice UA"-->"Alice Hub": Grant Permission 
"Alice Hub"-->"College Hub": PresentAttestationAction (Immunizations)
"College Hub"-->"Alice Hub": /message: IssueAttestationAction (Registered)
"Alice Hub"-->"Alice UA": Request Permission
"Alice UA"-->"Alice Hub": Grant Permission
"Alice Hub"-->"Alice Hub": Attestation accepted/stored

```

1. Alice initiates a registration request on the College website.

2. The College website requests the registration attestation from the College Hub.

3. The College Hub identifies that In order for Alice to complete her registration, she must prove she already has appropriate immunizations - so the College Hub initiates a request for confirmation of the precondition - immunizations.

4. Alice’s Hub needs permission from Alice to release any attestations. 

5. Alice grants permission to share her immunization attestation to the College Hub.

6. Alice’s Hub, with granted permission from Alice, presents her Immunization attestations to the College Hub.

7. Assuming all preconditions are met and Alice is accepted into the College, the College will issue an attestation as to her successful registration into College.

8. Alice’s Hub needs permission from Alice to accept/store any attestations. 

9. Alice grants permission to accept/store the College registration attestation.

10. Alice’s Hub, with granted permission from Alice, accepts/stores the College registration attestation and is now available for Alice to share with others via her identity wallet.

Referenced Message Objects

* RequestAttestationAction

* PreconditionsAttestationAction

* PresentAttestationAction

* IssueAttestationAction

### ​3.3​ Alice obtains education verification

Alice has graduated from College and wants to add this attestation into her identity wallet. Her DID is already linked to the College.

Assumptions 

* Alice is linked to the College via her DID.

* Alice has an Identity Hub accessed via an application on her mobile device.

* Alice has graduated from College

```plantuml
autonumber
participant "College Hub"
participant "College Site"
participant "Alice UA"
participant "Alice Hub"
"Alice UA"-->"College Site": Initiates Graduate Verification
"College Site"-->"College Hub": /message: RequestAttestionAction

"College Hub"-->"Alice Hub": /message: IssueAttestationAction
"Alice Hub"-->"Alice UA": Prompt to accept attestation
"Alice UA"-->"Alice Hub": Attestation accepted/stored
```

1. Alice initiates a request through the College website to obtain an attestation regarding her graduation.

2. College website reaches out to it’s Hub and provides an attestions request on Alice’s behalf. If the DDO for Alice’s DID was not retrieved during this session, the DID lookup with the Universal Resolver and the DID Auth must be performed for Alice’s DDO to be used.

3. College Hub issues the attestation to Alice’s Hub.

4. Alice grants permission to accept/store the College graduation attestation.

5. Alice’s Hub,  granted permission from Alice, accepts/stores the College graduation attestation and is now available for Alice to share with others via her identity wallet.

Referenced Message Objects

* RequestAttestationAction

* IssueAttestationAction

### ​3.4​ Alice shares her education verification with a professional networking site

Alice has graduated from College, has a verified attestation from the College, and wants to share her verified education attestions on her professional network, (LinkedIn in this example) page, now and in the future. 

Assumptions 

* Alice is linked to LinkedIn via her DID.

* Alice has an Identity Hub accessed via an application on her mobile device.

* Alice has a verified digital attestation for her graduation from College.

```plantuml
autonumber
participant "LinkedIn Hub"
participant "LinkedIn Site"
participant "Alice UA"
participant "Alice Hub"
"Alice UA"-->"LinkedIn Site": Initiates education integration
"LinkedIn Site"-->"Alice Hub": /message: RequestPermissionAction

"Alice Hub"-->"Alice UA": Prompt to grant permission
"Alice UA"-->"Alice Hub": Generate Permission 
"Alice Hub"-->"Alice UA": Process matching object keys
"Alice UA"-->"Alice Hub": Return processed object keys
"Alice Hub"-->"LinkedIn Hub": Permission granted
"LinkedIn Site"-->"Alice Hub": Retrieve attestations
```

1. Alice navigates to the LinkedIn website, logs in, then clicks a link to initiate an education integration function. 

2. The website initiates a RequestPermissionAction to Alice’s hub. 

3. Alice’s Hub needs permission from Alice to grant these permissions. 

4. Alice grants permission to share her education credentials with the professional network site..

5. Alice’s hub sends all matching education credentials to Alice’s user agent.

6. The user agent then signs the permission request for each credential and sends these back to her hub.

7. Alice’s hub sends information on these permissions to the entity’s hub.

8. At any time in the future, the professional networking site can directly access Alice’s education credentials from Alice’s hub, based on the permissions previously provided.

Referenced Message Objects

* RequestPermissionAction 

### ​3.6​ Message Objects

Identity Hub attestation handling relies on the passage and recognition of common message types that Hubs, User Agents, and consuming apps/services understand. In order to ensure that the flows related to attestations are precise and maximally descriptive of their intent, the Identity Hub spec will define its own message objects for each of the relevant attestation actions. These objects are extensions of the Schema.org Action object, the schema origin of which shall be schema.identity.foundation. These objects are strictly shared means of communicating and facilitating the various activities related to attestations, they do not infer or require a specific type of proof format or material be used within them.

The following is a description of the objects and examples that encompass their structure and properties:

#### ​3.6.1​ PreconditionsAttestationAction

* Linked attestation action ID

* Specify set of preconditions, each with their own descriptors

#### ​3.6.2​ RequestAttestationAction

* Type of attestation

* List of tag strings to describe the attestation

* Detailed, human-readable description of the attestation being requested (mostly for UAs to display to users)

* Who is the attestation for?

* What format do you need it in?

* Enable passing of preconditions

* Option to set a deadline for issuance/fulfillment

` {

	"@context": "[http://schema.identity.foundation](http://schema.identity.foundation)/",

	"@type": "RequestAttestationAction",

	"object": "IdentityHub.Payload",

	"tags": ["license", "driving", "permit", "DL", "driver’s license"],

	"description": "Province of British Columbia Driver’s License",

	"mainEntityOfPage": "http://example.org/.identity"

} `

#### ​3.6.3​ OfferAttestationAction

#### ​3.6.4​ DeliverAttestationAction

* Linked attestation action ID

* Payload of the proof material

* Time delivered

`{

	"@context": "[http://schema.identity.foundation](http://schema.identity.foundation)/",

	"@type": "DeliverAttestationAction",

	"identifier": "ATTESTATION_ID_FORMAT",

	"object": "IdentityHub.Payload",

	"description": "Create Attestation",

	"mainEntityOfPage": "http://example.org/.identity"

}`

#### ​3.6.5​ DeniedAttestationAction

* Linked attestation action ID

* Rejection code - array of rejection codes (look for an existing standard)

* Reason for rejection - array of human-readable descriptions of the reason, or URI

#### ​3.6.6​ EndorseAttestationAction

* Proof material for signing - array of proofs to be signed

* Option to set a deadline for issuance/fulfillment

#### ​3.6.7​ PresentAttestationAction

* Type of attestation

* List of tag strings to describe the attestation

* Detailed, human-readable description of the attestation being requested (mostly for UAs to display to users)

* What format do you need it in?

* Option to set a deadline for issuance/fulfillment

`{

	"@context": "[http://schema.identity.foundation](http://schema.identity.foundation)/",

	"@type": "PresentAttestationAction",

	"identifier": "ATTESTATION_ID_FORMAT",

	"object": "IdentityHub.Payload",

	"description": "MIT wants to present you a diploma attestation",

	"format": "Verified Credential",

	"endtime": "ISO 8601",

	"mainEntityOfPage": "http://example.org/.identity"

}`

#### ​3.6.8​ RevokedAttestationAction

* Attestation ID

* Revocation code - array of revocation codes (look for an existing standard)

* Reason for revocation - array of human-readable descriptions of the reason, or URI

#### ​3.6.9​ AmendedAttestationAction

* Attestation ID

* Change delta of some kind

* Reason for amendment - array of human-readable descriptions of the reason, or URI

### ​3.7​ Glossary

UR: Universal Resolver for looking up a DID and returning a DDO

UA: User Agent: a smartphone-based digital wallet, browser

DID: Decentralized Identifier

DDO: DID Document

DID Auth: The process for verifying that a DDO belongs to a user.

### ​3.8​ Technical & Spec Implications

* For the Hub /permission spec: add optional timeout for permissions

### ​3.9​ Callouts

* Do we need a VerifyAttestationAction? Can you use this to hand off to other potential DIDs that help verify the validity of an attestation.

* Verifying that delegation of attestation flow is allowed by subject DID

