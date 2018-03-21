# Identity Hub Attestation Flows and Components

Authors:

* Daniel Buchner - Daniel.Buchner@microsoft.com

Collaborators:

* Cherie Duncan - Cherie.Duncan@dominode.com
* John Toohey - john.toohey@dominode.com
* Ron Kreutzer - ron@pillarproject.io
* Stephen Curran - swcurran@cloudcompass.ca

## Abstract

Define all technical components and user flows required to facilitate request, issuance, presentation, verification, and revocation of interoperable attestations. This is used as an update to the Identity Hub explainer to reflect these flows and components.

## 1 Introduction

In the digital identity space, Hubs let you securely store and share data. A Hub is a datastore containing semantic data objects at well-known locations. An identity needs to be able to prove that some data is true to another entity that requests it. These attestations are that method of proof. In the digital world, the requestor may be software, and the response may or may not require involvement of the individual/identity who the proof is being made against. These examples and flows depict how attestations are requested and resolved.

## 2 Example Use Cases

We use examples here to give guidance/suggestions for how attestations can be used with real world examples. The overall use case is a person, Alice who registers for College using that a process that includes using an attestation she possesses to prove she has received some required immunizations. After graduation, Alice requests an attestation from the College that she has graduated, and presents that attestation to LinkedIn to be added to her professional profile.

#### Agents

We use the term “User Agent” (UA) to refer to an app on a smartphone or other device that has access to DID-linked keys and the power to do things on behalf of a DID owner (Alice). This could also be referred to as a digital wallet. Similarly, we use the term “Enterprise Agent” (EA) to refer to the comparable component representing an Organization – e.g. a College or LinkedIn. A UA and EA are conceptually the same, but while the UA is likely a personal device (laptop, tablet, phone), an EA is likely a service that processes requests based on business rules and data held in back end systems. Note that an EA might need input from a person to complete the processing of a request. In that case, the EA might contact that user through that person’s User Agent (although there are many other possibilities).

#### Sites

In the examples below, “Sites” are assumed to be Web or Mobile Site – user interfaces that allow a user (in our case, Alice) to trigger the start of a process. There are many other ways to trigger the start of such a process.

#### Decentralized IDs (DIDs), Documents and Attestations

A DID is a decentralized identifier to a user’s agent (UA), for a specific purpose, and not necessarily correlated to any other identifiers for her identity. Per the [W3C DID Specification](https://w3c-ccg.github.io/did-spec/), associated with a DID is a DID Document that contains information about the public keys and service endpoints for that DID. Thus, given a DID, the holder of the DID has a mechanism to communicate with the Identity Owner of that DID. DIDs may be public and stored on a publicly available Distributed Ledger or may be pairwise private DIDs, where two Identities directly exchange DIDs. For each DID, its associated DID Document is found via the [DIF Universal Resolver](https://github.com/decentralized-identity/universal-resolver).
 > [name=Ron Kreutzer]I modified the part about pairwise DIDs to state that only DIDs are shared. All DDOs are found via the Universal Resolver -- correct?
 
An attestation is something (such as a [Verifiable Credential](https://www.w3.org/TR/verifiable-claims-data-model/)) issued by an entity to a holder (often the individual) so that the holder can prove they hold the attestation to others. In one of the examples below, for instance, Alice wants to receive a graduation attestation from the College so that she can present (prove) that attestation to a professional networking site.

#### Interface Guidelines: Hubs, Agents and Identity Owners

Some basic guidelines are defined about Hubs, Agents, and their Identity Owners:

-   Private keys are accessible only to the Agents (User and Enterprise) and so any encrypting/signing of information must be done by an Agent.
    
-   In general, Hubs are directly addressable based on information in a DID Document, and Agents are accessed only by their Hub. The only exception is a direct invocation of a User Agent via, for example, a deep link on a mobile site or a QR code on a Web site scanned by a User Agent.
    
-   Hubs generally have limited, generic functionality and any decision making must be made at the Agent level via either human intervention (User Agents) or business logic (Enterprise Agents).

### 2.1 Alice links to an Entity

In order to communicate regarding attestations with an entity, an individual, in our examples Alice, will first need to establish a connection between her user agent and the entity she will interact with. This is necessary for all follow-on scenarios and is discussed first.
  
Alice wants to transact with the entity used in the scenarios with the intent to exchange attestations via her digital identity. First and foremost, the entity verifies that Alice is the owner of the digital identifier. In order to find Alice’s user agent we utilize the Universal Resolver (UR) to lookup Alice’s provided Decentralized Identifier (DID) to find her DID Document (DDO), used to authenticate Alice’s ownership of the DID and have access to Alice’s hub and user agent.

```sequence
participant Universal Resolver as UR
participant Enterprise Agent as EA
participant Entity Hub as EH
participant Entity Site as ES
participant Alice Hub as AH
participant Alice UA as AUA
AUA-->ES: 1 Initiates DID Linkage
ES-->AUA: 2 Prompts to disclose DID
AUA-->EH: 3 Discloses DID
EH-->EA: 4 Disclose DID
EA-->UR: 5 Lookup DID
UR-->EA: 6 Return DID Doc
EA-->AH: 7 DID Auth Challenge
AH-->AUA: 8 DID Auth Challenge
AUA-->EH: 9 DID Auth Response
EH-->ES: 10 DID Auth Complete
```

1.  Alice navigates to an entity’s website and clicks a link to initiate a DID linkage with the entity.
    
2.  The entity prompts for Alice to disclose a DID that represents her digital identity.

    1. If  the website was accessed via a laptop/desktop, the website typically displays a QR Code for Alice to use her wallet app to scan. If the website was accessed via her mobile device, the website performs an app transfer.

3.  Alice selects an existing DID or creates a new DID for this relationship and sends the DID to the Entity Hub.
    
4.  The Entity Hub passes the DID to the Entity’s Enterprise Agent to initiate the DID Auth response.
    
5.  The EA uses a Universal Resolver (UR) application to request retrieval of the DID Doc for that DID.
    
6.  The DID Doc is returned to the EA.
    
7.  The EA initiates the DID Auth process by issuing a challenge to Alice’s Hub.
    
8.  Alice’s Hub passes the DID Auth challenge to Alice’s User Agent for signing.
    
9.  Alice’s User Agent proves her identity with a signed response to the auth challenge.
    
10.  The Entity Hub confirms the response and notifies the Entity Site with a successful login.

### 2.2 Alice must prove a precondition

Alice is attempting to register for College and her DID is already linked to the College. In this example, for Alice to get admitted to the College, Alice must prove she previously has received appropriate immunizations.

#### Assumptions

-   Alice is linked to the College via her DID.
-   Alice has an Identity Hub accessed via an application on her mobile device.
-   Alice has a verified digital attestation for her previous immunizations.
    
```sequence
participant College EA as CE
participant College Hub as CH
participant College Site as CS
participant Alice Hub as AH
participant Alice UA as AUA

AUA-->CS: 1 Request Registration
CS-->AH: 2 /message: OfferAttestationAction
AH-->CH: 3 /message: RequestAttestationAction
CH-->CE: 4 Determine Preconditions
CE-->AH: 5 /message: PreconditionsAttestationAction (Immunizations)
AH-->AUA: 6 Attestation Options
AUA-->AH: 7 Select/Confirm Attestations 
AH-->CH: 8 PresentAttestationAction (Immunizations)
CH-->CE: 9 Attestation provided
AH-->CH: 10 /message: RequestAttestationAction
CH-->CE: 11 Determine Preconditions
CE-->AH: 12 /message: IssueAttestationAction (Registered)
AH-->AUA: 13 Accept Attestation?
AUA-->AH: 14 Approve
AH-->AH: 15 Attestation stored
```

1.  Alice initiates a registration request on the College website.
    
2.  The College Site responds with a message to Alice’s Hub offering a “registered” attestation.
    
3.  Alice’s Hub requests the registration attestation from the College Hub.
    
4.  The College Hub contacts the College EA to determine the preconditions (business rules) for Alice’s receipt of a registration attestation.
    
5.  The College EA determines that In order for Alice to complete her registration, she must prove she already has appropriate immunizations - so the College Hub initiates a request for presentation of the precondition attestation.
    
6.  Alice’s Hub provides Alice (via her User Agent) the attestations that could satisfy the precondition.
    
7.  Alice selects the correct attestation to use and her User Agent provides it to her Hub.
    
8.  Alice’s Hub presents the immunization attestation to the College Hub.
    
9.  The College Hub provides the Attestation to the College EA so that the College’s back end systems can be updated as necessary.
    
10.  Alice’s Hub (again) requests the registration attestation from the College Hub.
    
11.  The College Hub contacts the College EA to determine the preconditions (business rules) for Alice’s receipt of a registration attestation.
    
12.  Since all preconditions are now met, the College EA issues the Registration Attestation to Alice’s Hub.
    
13.  Alice’s Hub requests authorization from Alice to accept/store the attestations.
    
14.  Alice accepts the request to accept/store the College registration attestation.
    
15.  Alice’s Hub, authorized by Alice, accepts/stores the College registration attestation and that attestation is now available for Alice to present to others.

#### Referenced Message Objects

-   RequestAttestationAction
-   OfferAttestationAction
-   PreconditionsAttestationAction
-   PresentAttestationAction
-   IssueAttestationAction
    

### 2.3 Alice obtains education verification

In this example, Alice has graduated from College and wants to add her Graduated attestation into her identity wallet. Her DID is already linked to the College.

#### Assumptions

-   Alice is linked to the College via her DID.
-   Alice has an Identity Hub accessed via an application on her mobile device.
-   Alice has graduated from College

```sequence
participant College EA as CE
participant College Hub as CH
participant College Site as CS
participant Alice Hub as AH
participant Alice UA as AUA

AUA-->CS: 1 Initiates Graduate Verification
CS-->AH: 2 /message: OfferAttestionAction
AH-->CH: 3 /message: RequestAttestationAction
CH-->CE: 4 Determine Preconditions
CE-->AH: 5 /message: IssueAttestationAction (Registered)
AH-->AUA: 6 Accept Attestation?
AUA-->AH: 7 Approve
AH-->AH: 8 Attestation stored
```

1.  Alice initiates a request through the College website to obtain an attestation regarding her graduation.
    
2.  College website reaches out to it’s Hub and provides an attestions request on Alice’s behalf. If the DDO for Alice’s DID was not retrieved during this session, the DID lookup with the Universal Resolver and the DID Auth must be performed for Alice’s DDO to be used.
    
3.  College Hub issues the attestation to Alice’s Hub.
    
4.  Alice grants permission to accept/store the College graduation attestation.
    
5.  Alice’s Hub,  granted permission from Alice, accepts/stores the College graduation attestation and is now available for Alice to share with others via her identity wallet.

Referenced Message Objects

-   OfferAttestationAction
-   RequestAttestationAction
-   IssueAttestationAction


### 2.4 Alice shares her education verification, and future updates, with a professional networking site

Alice has graduated from College, has a verified attestation from the College, and wants to share her verified education attestations, her College graduation and any future educational attestations, on her professional network page (PROF).

  

#### Assumptions

-   Alice is linked to PROF via her DID.
    
-   Alice has an Identity Hub accessed via an application on her mobile device.
    
-   Alice has a verified digital attestation for her graduation from College.

> [Daniel - why not just have this as a PresentAttestationAction vs. a Grant Permission?]
    
```sequence
participant PROF EA as LA
participant PROF Hub as LH
participant PROF Site as LS
participant Alice Hub as AH
participant Alice UA as AUA

AUA-->LS: 1 Initiates education integration
LS-->AH: 2 /message: RequestPermissionAction
AH-->AUA: 3 Prompt to grant permission
AUA-->AH: 4 Generate Permission 
AH-->AUA: 5 Process matching object keys
AUA-->AH: 6 Return processed object keys
AH-->LH: 7 Permission granted
LS-->AH: 8 Retrieve attestations
```

1.  Alice navigates to the professional network site, logs in, then clicks a link to initiate an education integration function.
    
2.  The website initiates a RequestPermissionAction to Alice’s hub.
    
3.  Alice’s Hub needs permission from Alice to grant these permissions.
    
4.  Alice grants permission to share her education credentials with the professional network site, now and any changes in the future (new education credentials).
    
5.  Alice’s hub sends all matching education credentials to Alice’s user agent.
    
6.  The user agent then signs the permission request for each credential and sends these back to her hub.
    
7.  Alice’s hub sends information on these permissions to the entity’s hub.
    
8.  At any time in the future, the professional networking site can directly access Alice’s education credentials from Alice’s hub, based on the permissions previously provided.


Referenced Message Objects

-   RequestPermissionAction
    
-   Permission granted
    
-   Retrieve attestations
    

  

### 2.5 Alice applies for job and refuses to provide references

Alice is applying for a job and has connected with the HR department via her DID. Alice has already provided some basic attestations about her right to work, name, address, etc. But when she receives a request for her references Alice refuses/denies the request - as she does not have these in her digital wallet yet.

  

#### Assumptions

-   Alice is linked to Company’s HR via her DID.
    
-   Alice has an Identity Hub accessed via an application on her mobile device.
    
-   Alice has a verified digital attestation for her references and does not wish to share at this time, or Alice does not have references in her digital wallet yet.

> [name=Stephen Curran]This should be the same as a "PreConditions"/"PresentAttestations" sequence - as in the second scenario (immunization) above. I've updated it accordingly.

```sequence
participant HR EA as LA
participant HR Hub as LH
participant HR Site as LS
participant Alice Hub as AH
participant Alice UA as AUA

LA-->AH: 1 /message: PreconditionsAttestationAction (References)
AH-->AUA: 2 Attestation Options
AUA-->AH: 3 Refuse
AH-->LH: 4 /message:RefuseAttestationAction (reason)
LH-->LA: 5 Refusal notification
```

1.  HR initiates a request for references via Alice’s Hub
    
2.  Alice's Hub finds appropriate Attestations and provides them to Alice's User Agent.
    
3.  For whatever reason, Alice refuses (via her agent) to provide references at this time
    
4.  Alice’s Hub notifies HR Hub of the refusal (reason for refusal is optional)

5.  A notification is sent to HR with the refusal details (generic or specific to the scenario)
    

  

#### Referenced Message Objects

-   PreconditionAttestationAction
-   RefuseRequestAttestionAction

### 2.6 Example needed for Deliver

#### Referenced Message Objects

> [name=Stephen Curran]This is the same as "Present", right?

-   DeliverAttestionAction
    

### 2.7 Example needed for Endorse

#### Referenced Message Objects

> [name=Stephen Curran]Do we have a definition/purpose for this? I think we found this on the W3C specs. page, but didn't know what it was for.

-   EndorseAttestionAction
  

### 2.8 Example needed for Submit

#### Referenced Message Objects

> [name=Stephen Curran] This is the same as "Present", right?

-   SubmitAttestionAction
  

### 2.9 Example needed for Denied

#### Referenced Message Objects

-   DeniedAttestionAction
    
### 2.10 Alice revokes a site's access to her academic credentials with a professional network site, and issues them a message to cease use of any of her data.

Referenced Message Objects

> [name=Stephen Curran] A "revoke" is an action taken by an Issuer about an Attestation provided to the Holder. As such, I don't think we should use that term for this use case. IMHO this is a new use case (vs. W3C). Perhaps "retract"?

-   RevokeAttestionAction

### 2.11 Example needed for Amended

#### Referenced Message Objects

> [name=Stephen Curran] My suggestion is that we remove this, as it is just a new "Present", with a possible "Retract" action for the previous instance.

-   AmendedAttestionAction

## 3 Message Objects

Identity Hub attestation handling relies on the passage and recognition of common message types that Hubs, User Agents, and consuming apps/services understand. In order to ensure that the flows related to attestations are precise and maximally descriptive of their intent, the Identity Hub spec will define its own message objects for each of the relevant attestation actions. These objects are extensions of the Schema.org Action object, the schema origin of which shall be schema.identity.foundation. These objects are strictly a shared means of communicating and facilitating the various activities related to attestations, they do not infer or require a specific type of proof format or material be used within them.

Note that each message returns only a status of whether the message was successfully (or not) transmitted. The result of processing the request is conveyed to the caller via a subsequent message.

The following is a description of the objects and examples that encompass their structure and properties:

### 3.1 RequestAttestationAction

The Holder requests an attestation from an Issuer.

-   Type of attestation wanted
-   List of tag strings to describe the attestation
-   Detailed, human-readable description of the attestation being requested (mostly for UAs to display to users) 
-   Who is the attestation for?
-   What format do you need it in?
-   Enable passing of preconditions
-   Option to set a deadline for issuance/fulfillment
  
```json
{
    "@context": "http://schema.identity.foundation/",
    "@type": "RequestAttestationAction",
    "for": ["did:foo:123-456"],
    "format": "OAuthClaim",
    "expiration": 1520974795372,
    "description": "Province of British Columbia Driver’s License",
    "tags": ["license", "driving", "permit", "DL", "driver’s license"]
}
```

### 3.2 RefuseRequestAttestationAction

In response to a request for an Attestation, a Verifier/Issuer informs a Holder that the attestation cannot be provided.

  

-   Linked attestation action ID
    
-   Reason for refusing the Request Attestation Action.
    

### 3.3 PreconditionsAttestationAction

In response to a request for an Attestation, a Verifier/Issuer informs a Holder a list of Pre-Conditions that must be met before the requested Attestation can be issued.

  

-   Linked attestation action ID
    
-   Specify set of preconditions, each with their own descriptors
    

### 3.4 OfferAttestationAction

In response to a request for an Attestation that cannot be issued because that type is not available, provide to the Holder a list of attestations that ARE available.

- For each attestation type available to the requester:
- Type of attestation
- List of tag strings to describe the attestation
- Detailed, human-readable description of the attestation being requested (mostly for UAs to display to users)
- Formats available for the attestation

### 3.5 IssueAttestationAction

-   Linked attestation action ID
-   Payload of the proof material
-   Time delivered
  
```json
{
    "@context": "http://schema.identity.foundation/",
    "@type": "DeliverAttestationAction",
    "identifier": "ATTESTATION\_ID\_FORMAT",
    "object": ATTESTATION_PAYLOAD,
    "description": "Province of British Columbia Driver’s License"
}
```

### 3.6 EndorseAttestationAction

-   Proof material for signing - array of proofs to be signed
-   Option to set a deadline for issuance/fulfillment

### 3.7 PresentAttestationAction

-   Type of attestation
-   List of tag strings to describe the attestation
-   Detailed, human-readable description of the attestation being requested (mostly for UAs to display to users)
-   What format do you need it in?
-   Option to set a deadline for issuance/fulfillment
    
```json
{
    "@context": "http://schema.identity.foundation/",
    "@type": "SubmitAttestationAction",
    "identifier": "ATTESTATION\_ID\_FORMAT",
    "object": "IdentityHub.Payload",
    "description": "MIT wants to present you a diploma attestation",
    "format": "Verified Credential",
    "endtime": "ISO 8601",
    "mainEntityOfPage": "http://example.org/.identity"
}
```

### 3.8 DeniedAttestationAction

-   Linked attestation action ID
-   Rejection code - array of rejection codes (look for an existing standard)
-   Reason for rejection - array of human-readable descriptions of the reason, or URI
    
### 3.9 RevokeAttestationAction

-   Attestation ID
-   Revocation code - array of revocation codes (look for an existing standard)
-   Reason for revocation - array of human-readable descriptions of the reason, or URI

### 3.10 AmendAttestationAction

-   Attestation ID
-   Change delta of some kind
-   Reason for amendment - array of human-readable descriptions of the reason, or URI
  
## 4 Glossary

- **UR**: Universal Resolver for looking up a DID and returning a DDO

- **UA**: User Agent: a smartphone-based digital wallet, browser

- **EA**: Enterprise Agent: a HUB-aware service that integrates with an Enterprise’s backend systems and representatives to process HUB requests. Conceptually equivalent to a person’s UA, but for an organization.

- **DID**: Decentralized Identifier

- **DDO**: DID Document

- **DID Auth**: The process for verifying that a DDO belongs to a user.

## 5 Technical & Spec Implications

-   For the Hub /permission spec: add optional timeout for permissions

## 6 Callouts

-   Do we need a VerifyAttestationAction? Can you use this to hand off to other potential DIDs that help verify the validity of an attestation.
-   Verifying that delegation of attestation flow is allowed by subject DID
