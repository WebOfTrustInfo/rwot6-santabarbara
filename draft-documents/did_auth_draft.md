# DID Auth RWoT#6 Paper

Slack: [https://weboftrustinfo.slack.com/messages/C9N0M37ST](https://weboftrustinfo.slack.com/messages/C9N0M37ST) (#did-auth)


# Authors

ADD YOUR EMAIL ADDRESSES

Markus Sabadello (markus@danubetech.com)

Kyle Den Hartog (kyle.denhartog@evernym.com)

Christian Lundkvist (christian.lundkvist@consensys.net)

Cedric Franz (cedric.franz@gmail.com)

Alberto Elias (hi@albertoelias.me)

Andrew Hughes (AndrewHughes3000@gmail.com)

John Jordan (john.jordan@gov.bc.ca)


# Resources

Markus' topic paper:

[https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/DID%20Auth:%20Scope,%20Formats,%20and%20Protocols.md](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/DID%20Auth:%20Scope,%20Formats,%20and%20Protocols.md)

Kyle's topic paper:

[https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/DID-Auth%20protocol.md](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/DID-Auth%20protocol.md)

Web Authentication: An API for accessing Public Key Credentials Level 1

From the "Terms defined by"

[https://www.w3.org/TR/webauthn/#authentication](https://www.w3.org/TR/webauthn/#authentication)

Uport specification for Selective Disclosure request/response protocol:

[https://github.com/uport-project/specs/blob/develop/flows/selectivedisclosure.md](https://github.com/uport-project/specs/blob/develop/flows/selectivedisclosure.md)

[https://github.com/uport-project/specs/blob/develop/messages/sharereq.md](https://github.com/uport-project/specs/blob/develop/messages/sharereq.md)

[https://github.com/uport-project/specs/blob/develop/messages/shareresp.md \
](https://github.com/uport-project/specs/blob/develop/messages/shareresp.md)

BC Government Open Opportunity

[http://bit.ly/2I86vvR](http://bit.ly/2I86vvR)

<span style="text-decoration:underline;">Authentication Use Case </span>



1.  **System to System:** Services that generate verifiable claims about organizations and write them to TheOrgBook need to be authenticated. Such Services must have a DID known to TheOrgBook and use that DID to access the Issuer API for writing verifiable claims to TheOrgBook. This would be a generic authentication method between two services at the API level.
1.  **Administrative:** There is an administrative element of TheOrgBook that should be limited to authorized users who would have a DID.
    1.  This use case could (should) be expandable into the use case where an arbitrary user can connect to a service for the purposes of "enrolling" and subsequently re-connecting once they are known to the service 


# Abstract

The term DID Auth has been used in different ways and is currently not well-defined. We define DID Auth as a ceremony where an identity owner, with the help of various components such as web browsers, mobile devices, and other agents, cryptographically proves to a relying party that they are in control of a DID. This means demonstrating control over the DID using the mechanism specified in the DID Document Authentication object. This could take place using a number of different data formats, protocols, and flows. DID Auth includes the ability to establish mutually authenticated communication channels, and to authenticate to web sites and applications. Authorization, verifiable credentials, and capabilities are built on top of DID Auth and out of scope for this document. This specification defines the scope of DID Auth, supported protocols and flows, the use of components of the DID documents which are relevant to authentication, as well as formats for challenges and responses.


# Definitions

**Authentication: **[https://www.w3.org/TR/webauthn/#authentication](https://www.w3.org/TR/webauthn/#authentication) 

**Authorization: **Method of verifying the rights and privileges of an individual to perform certain actions upon a DID that is not proving its ownership.

**DID**: Decentralized Identifier, in this paper is assumed to include both the URI based identiifier and the DID Document as per the DID Spec (**align with DID Spec) [https://w3c-ccg.github.io/did-spec/#terminology](https://w3c-ccg.github.io/did-spec/#terminology) 

**Identity owner:** Individual, organization or thing who has rights and privileges to perform certain actions upon a DID.

**Identity subject: **Individual, organization or thing whom a DID identifies.** ** 

**Relying party: **Also called "Verifier" in other specifications. 

**Verifiable Credentials:** [https://www.w3.org/TR/verifiable-claims-data-model/#terminolog](https://www.w3.org/TR/verifiable-claims-data-model/#terminology) A collection of verifiable claims which are statements made by an entity about a subject that is effectively tamper-proof and whose authorship can be cryptographically verified.


# Introduction


## Scope

DID Auth defines data formats and challenge and response transports allowing a DID owner to prove control over a DID to another party. A successful DID Auth interaction may create the required conditions to allow the parties to exchange further data in a trustworthy way. This further data could include streams of raw data from sensors to the exchange of verifiable credentials. This further exchange of data is out of scope of the DID Auth exchange and specification. 

Proof of control over a DID is a technical action which may be a precursor to establishing a trustworthy relationship between two parties. The DID Auth interaction may be a one way interaction where A proves control over a DID<sub>A</sub> to B, or a two way interaction where mutual proof of control over DIDs is achieved. Two way control is a situation where A proves control over DID<sub>A</sub> to B and B proves control over DID<sub>B</sub> to A.

It is in the purview of the two parties engaged in the interaction to determine the need to have a one way or two way DID Auth interaction. It is also in the purview of the two parties to determine if further exchanges of data may be necessary to establish the nature of the relationship between the two parties. 

Implementers may decide to subsume a DID Authentication interaction within a higher layer interaction such as the exchange of a Verifiable Credential which could simultaneously prove control over a DID and offer some other verifiable claims for some specific transaction specific purpose.


## Generic Ceremony

This section describes a conceptual authentication framework elaborating the specific flows of the DID Auth protocol. It relates general concepts of authentication to specific concepts of DID Authentication.

**Authentication of a DID means: An identity owner demonstrates knowledge or possession or control of the entity's authentication material that was generated and distributed during DID Record Creation through execution of the authentication proof mechanism.**

There are two main phases in DID Auth: Creation of the DID Record and Authentication of the DID.


### Create DID Record

As stated in the DID Spec, the steps to create a DID Record are:



1.  Generate a NEW_DID as specified in the relevant DID Method Specification
1.  Generate a NEW_DID_DOCUMENT as specified in the relevant DID Method Specification
    1.  The id property must have the value of NEW_DID
1.  Choose an authentication type from the array of proof mechanisms
    1.  Record the type property in the authentication property of the NEW_DID_DOCUMENT
1.  Generate authentication material for use at a later time during DID Authentication. The authentication type determines how to generate authentication material.
1.  Communicate and store the authentication material, either directly or as derived material, in the NEW_DID_DOCUMENT and for storage by the Identity Owner / DID Subject


### DID Authentication

Note: this flow describes a relying party authentication the DID of a identity owner 



1.  Determine which DID requires authentication (THE_DID)
1.  Resolve THE_DID to THE_DID_DOCUMENT using the relevant DID Method Specification
1.  Confirm that the id property of THE_DID_DOCUMENT equals THE_DID
1.  Select the authentication method to use for DID Auth from the list contained in THE_DID_DOCUMENT.  The authentication method chosen must be supported by the relying party.
1.  Establish a communication channel between the identity owner and the relying party over which DID Auth will happen (e.g. service lookup, QR code scan, etc)
1.  Send challenge to identity owner over established channel. Must include a nonce (to prevent replay attacks), and selected authentication method as a minimum and optionally a callback communication channel.
1.  Identity owner signs challenge using the selected method
1.  Identity owner sends the signature back to relying party
1.  Initiator using the public key of THE_DID_DOCUMENT and verifies the signature of the identity owner
1.  Optionally use the other content of the DID Document to do other things.

Note: Steps 7,8,9 make the assumption of asymmetric keys


# Data Formats

This section defines formats of documents, messages, etc. that are relevant in an DID Auth interaction. This includes the DID document as well as challenges and responses that are exchanged between identity owner and a relying party.


## DID Document

Proving control of a DID can happen via various "proof mechanisms" or "authentication suites", which are specified in the form of "authentication" objects in a DID document. The authentication object(s) may include or reference a publicKey object, in cases where the identity owner's proof is established as a signature based on asymmetric cryptography.

Example "authentication" and "publicKey" objects in a DID document:


```
{
	"@context": "https://w3id.org/did/v1",
	"id": "did:example:123456789abcdefghi",
	"authentication": [{
		"type": "RsaSignatureAuthentication2018",
		"publicKey": "did:example:123456789abcdefghi#keys-1"
	}, {
		"type": "Ed25519SignatureAuthentication2018",
		"publicKey": "did:example:123456789abcdefghi#keys-2"
	}],
	"publicKey": [{
		"id": "did:example:123456789abcdefghi#keys-1",
		"type": "RsaVerificationKey2018",
		"owner": "did:example:123456789abcdefghi",
		"publicKeyPem": "-----BEGIN PUBLIC KEY...END PUBLIC KEY-----\r\n"
	}, {
		"id": "did:example:123456789abcdefghi#keys-2",
		"type": "Ed25519VerificationKey2018",
		"owner": "did:example:123456789abcdefghi",
		"publicKeyBase58": "H3C2AVvLMv6gmMNam3uVAjZpfkcJCwDwnZn6z3wXmqPV"
	}]
}
```


DID Auth supports multiple transports that can be used for exchanging challenges and responses between an identity owner and a relying party (see section XX). One such transport is HTTP POST to a DID Auth service endpoint. This service endpoints can be discovered from a DID document.

Example DID Auth service endpoint in a DID document:


```
{
	"@context": "https://w3id.org/did/v1",
	"id": "did:example:123456789abcdefghi",
	"service": {
		"type": "DidAuthService",
		"serviceEndpoint": "https://auth.example.com/did:example:123456789abcdefg"
	}
}
```



## Challenge Formats

In a DID Auth interaction, a challenge is transmitted by a relying party to an identity owner, asking the identity owner to return a response that proves their control of a DID.



*   The relying party may or may not know the identity owner's DID at the time the challenge is constructed, and therefore the identity owner's DID may or may not be included in the challenge.
*   The challenge that is sent by the relying party may or may not itself contain a proof of the relying party's control of a DID.
*   The _relying party_ may or may not need additional transport-specific information about the _identity owner_ in order to be able to deliver the challenge (e.g. a DID Auth service endpoint). This additional protocol-specific information may be discoverable from the _identity owner's_ DID that is known to the relying party.
*   The identity owner may or may not need additional transport-specific information about the relying party in order to be able to deliver the response (e.g. a callback URL). This additional protocol-specific information may be included in the challenge, or it may be discoverable from the relying party's DID that is included in the challenge.


### Example DID Auth challenge (in JWT format):

JWT payload:


```
eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NksifQ.eyJpc3MiOiIyb3BpTnJHU3hUVzZzRm82ZXJ2SFpuRWVFWEdOR0FvdXBGTiIsImlhdCI6MTUyMDQ2ODg4MywidmVyaWZpZWQiOlsiTXkgVGl0bGUiXSwiY2FsbGJhY2siOiJodHRwOi8vMTkyLjE2OC40NC4xNjI6ODA4MS9jYWxsYmFjayIsImV4cCI6MTUyMDQ2OTE4MywidHlwZSI6InNoYXJlUmVxIn0.zZVwQ-KT5XdLPXmXOOe2UgGFpWiq5MA7QVoLnIvcLE5p-KJfQ2Yvvhg5hWbrgRF5RzcpDvV7jyRKzBe-_6aMIQ
```


Header and payload decodes to:


```
{
  "typ": "JWT",
  "alg": "ES256K"
}
{
  "iss": "did:uport:2opiNrGSxTW6sFo6ervHZnEeEXGNGAoupFN",
  "iat": 1520468883,
  "verified": [
    "MyCredential" // This is a request for a specific credential (optional)
  ],
  "callback": "http://192.168.44.162:8081/callback",
  "exp": 1520469183,
  "type": "shareReq"
}
```



### Example DID Auth challenge (in JSON-LD format):


```
{
	"id": "???",
	"type": ["Credential"],
	"issuer": "???",
	"issued": "2018-03-07",
	"claim": {
		"id": "???",
		"publicKey": ""
	}
}
```



## Response Formats

A DID Auth response is constructed by an identity owner after reception of a DID Auth challenge. It includes the identity owner's DID together with proof of the identity owner's control of that DID. The relying party resolves the identity owner's DID to its DID document and interprets the "authentication" and "publicKey" objects in that DID document to determine how to verify the proof.



*   The relying party must be able to internally link a response to a prior challenge. This can be done with a nonce in the challenge that must also be included in the response. It can also be done by including the entire original challenge in the response.


### Example DID Auth response (in JWT format):


```
{
  "typ": "JWT",
  "alg": "ES256K"
}
{
  "iss": "did:uport:2omWsSGspY7zhxaG6uHyoGtcYxoGeeohQXz",
  "iat": 1520469645,
  "aud": "did:uport:2opiNrGSxTW6sFo6ervHZnEeEXGNGAoupFN",
  "type": "shareResp",
  "nad": "2omWsSGspY7zhxaG6uHyoGtcYxoGeeohQXz",
  "req":
"eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NksifQ.eyJpc3MiOiIyb3BpTnJHU3hUVzZzRm82ZXJ2SFpuRWVFWEdOR0FvdXBGTiIsImlhdCI6MTUyMDQ2OTYzMCwidmVyaWZpZWQiOlsiTXkgVGl0bGUiXSwiY2FsbGJhY2siOiJodHRwOi8vMTkyLjE2OC4xLjE5OTo4MDgxL2NhbGxiYWNrIiwiZXhwIjoxNTIwNDY5OTMwLCJ0eXBlIjoic2hhcmVSZXEifQ.54K3IHiCkgjigTSnUiVqAQZ575vpSMNcGlaKeCxo8ZeghObvaVuvDaE7ToWDiJK8VtQUAOj3pY40tRomon8zAA", // This is a copy of the Request (this is to support a stateless architecture on the server side)
  "exp": 1520556045
}
```



### Example DID Auth response (in JSON-LD Verifiable Credentials format):

The following Verifiable Credential contains a claim of a certain public key as a property of the identity owner.


```
{
	"id": "...",
	"type": ["Credential", "DIDAuthCredential"],
	"issuer": "did:example:123456789abcdefghi",
	"issued": "2018-03-07",
	"claim": {
		"id": "did:example:123456789abcdefghi",
		"publicKey": "did:example:123456789abcdefghi#keys-2"
	},
	"proof": {
		"type": "Ed25519Signature2018",
		"created": "2018-01-01T21:19:10Z",
		"creator": "did:example:123456789abcdefghi#keys-2",
		"nonce": "c0ae1c8e-c7e7-469f-b252-86e6a0e7387e",
		"signatureValue": "..."
	}
}
```



# Challenge Transports

A DID Auth challenge may be delivered by a relying party to an identity owner in different ways. DID Auth defines a few common ways this can be done.



*   Multiple devices, user agents, and other technical components may act on behalf of the identity owner to receive and process the challenge. For example, an identity owner's DID Auth Service may receive the challenge and relay it to the identity owner's mobile app (see section XX for more examples).


### DID Auth Service

If the identity owner's DID is known to the relying party, it resolves it to a DID document to find a DID Auth service endpoint and sends an HTTP POST with the challenge to that endpoint.


### Scan QR Code from mobile app

The relying party may display a DID Auth challenge encoded as a QR code, which is delivered to the identity owner by scanning it with a DID Auth compatible mobile app.


### Mobile Deep Link

A mobile app or webpage may itself be a relying party and deliver a DID Auth challenge to another mobile app that represents the identity owner.

Example:


```
didauth:?challenge=...
```



### Custom Protocol Handler

Similar to a mobile deep link, a web page can contain a web-based protocol link that contains a DID Auth challenge.

Example:


```
<a href="web+didauth:challenge=?...">Login with DID Auth</a>
```



### Device-to-Device Communication

If both the relying party and identity owner meet physically with devices they control, a DID Auth challenge can be delivered via direct communication between devices, using Bluetooth, NFC, WiFi, etc.


### Invoke User Agent's JavaScript API

A relying party web site may deliver a DID Auth challenge to the identity owner by invoking an API via a JavaScript function in the identity owner's user agent.


#### 	User Agent Key Selector

The relying party may ask the user agent to display a DID selection dialog where the identity owner is able to pick the DID to authenticate with the relying party. The DID Auth challenge is then done to that DID.


#### 	Web Authentication API

[https://www.w3.org/TR/webauthn/](https://www.w3.org/TR/webauthn/) 


# Response Transports


### HTTP POST to callback URL

The DID Auth response may be delivered to the relying party in the form of an HTTP POST to a callback URL. This callback URL may be known to the identity owner in advance, it may have been included in the challenge, or it may be discoverable from the relying party's DID.


### Scan QR code from mobile app

The identity owner may encode a DID Auth response as a QR code, which is delivered to the relying party by scanning it with a DID Auth compatible mobile app.


### Hardware Wallet

The DID Auth challenge may be forwarded to a hardware wallet, that upon an individual's physical interaction, will create a response and sending it back to the relying party via the forwarder.


# Examples

[ Examples how Challenge Flows and Response Flows can be arranged in useful ways ]


## Peer to Server


## 	Peer to Peer


## 	Server to Server (DID-TLS)


# Security Considerations


# Privacy Considerations


# --------


# Open Questions

How does DID Auth relate to existing systems (OAuth, WebAuthn…)

Do we assume that there is a standard TLS channel with a website or do we want to use the DIDs to set up an authenticated and/or encrypted channel?

Does DID Auth support automatic single-sign-on, for example signing in to an additional website without repeating an entire flow.

Consider how to automatically log out everywhere if a DID owner revokes a DID which in a currently authenticated interaction. (So this may be a "cache problem" where each party has to decide how often they will "refre

Can there be a DID Auth - OAuth proxy service that allows a relying party to implement standard OAuth2, provided by a gateway service that implements a DID Auth relying party.

Mention that we want to re-authenticate on high-value transactions.

Biometrics: Mention the use of biometrics for locally unlocking your private key on a device. (This would be a good time to reference to the Biometrics paper being written at RWoT)
