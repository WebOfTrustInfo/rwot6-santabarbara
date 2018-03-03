DID Auth: Scope, Formats, and Protocols
=======================================
Markus Sabadello, Danube Tech (https://danubetech.com), Vienna, March 3rd 2018

Now as certain base technologies for decentralized identity are becoming more mature (e.g. DIDs), this seems to be a good time to work on some of the most basic uses of these building blocks – such as using DIDs for authentication. There is broad interest from many individuals and organizations around the world in this topic.

This paper is intended as an overview and outline to frame the discussion about DID Auth at RWoT#6.

# Scope

The term DID Auth has been used for different things and is currently not really well-defined.

At a minimum, it should be understood as "proving control over a DID" in one way or another.

This can take place using a number of different formats, protocols, and flows.

In addition to "proving control over a DID", DID Auth could potentially also be understood more broadly as "proving something else such as possession of a credential". Or to put it another way, "control over a DID" is a special claim – the most fundamental self-asserted claim that "I am me" – that an *identity owner* would want to prove. "Proving something else such as possession of a credential" could therefore be considered an extension of basic DID Auth.

# DID Auth Basics

What all variants of DID Auth have in common is that during an interaction between an *identity owner* and a *relying party*, the *identity owner* proves control over a DID.

This requires the following steps to be executed by the relying party:

 * The *relying party* resolves the *identity owner's* DID to a DID Document.
 * The *relying party* attempts to authenticate the *identity owner* using the `authentication` object(s) found in the DID Document.
 * The `authentication` object(s) may include or reference a `publicKey` object, in cases where the *identity owner's* proof is established as a cryptographic signature.

DID Auth must be understood to be extensible with regard to how an *identity owner* can prove control over a DID (not just through cryptographic signatures).

DID Auth must also be understood to work with multiple types of public keys.

Example DID Document with `authentication` and `publicKey` objects:

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

In some variants of DID Auth, an *identity owner's* proof of control over a DID is preceded by a cryptographic challenge issues by a *relying party* to an *identity ower*, and again in some variants, this challenge is delivered to the *identity owner* via a DID Auth service endpoint in the DID Document.

Example DID Document:

	{
		"@context": "https://w3id.org/did/v1",
		"id": "did:example:123456789abcdefghi",
		"service": {
			"type": "DidAuthService",
			"serviceEndpoint": "https://auth.example.com/did:example:123456789abcdefg"
		}
	}

In the DID resolution process, it is currently assumed that a DID resolver returns an entire DID Document for a given DID. One optimization could be to define input parameters to a DID resolution process that would return not a full DID Document, but only the parts that are needed for a DID Auth process, e.g. the `authentication` and `publicKey` objects, and a DID Auth service endpoint.

References:

 * https://w3c-ccg.github.io/did-spec/
 * https://w3c-ccg.github.io/ld-key-registry/

# Types of DID Auth

Proving control over a DID by an *identity owner* to a *relying party* can take place using a number of different formats, protocols, and flows.

The following sections are an attempt to enumerate and group some of these variants.

# DID-Auth'ed Channels

It is possible to establish authenticated (and potentially encrypted) communication channels between two parties that each act as both *identity owner* and *relying party*. Both parties of the channel are mutually authenticated. Establishment of such a channel takes place before any additional payloads are exchanged between the parties. In order to establish an authenticated channel, one party generally knows the endpoint for such a channel to the other party in advance, or this endpoint may be discoverable from the party's DID.

## DID-TLS

 * The standard TLS X.509 certificates based on traditional hierarchical PKI are replaced by key material associated with DIDs, which are used to mutually authenticate both parties.
 * Even though the TLS standard should support this, in practice some implementations are not flexible enough to support custom logic for handling certificates.
 * A set of standards and guidelines (Open TLS) could be developed to ease adoption of DID-TLS.

References:

 * https://docs.google.com/document/d/1-aPY1eeHdR_TnF7_WpEs58RZ_jNdDeptVrNEu3groFc/
 * https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/OpenTLS.md

## Intermediary DID-TLS

 * If full support for DID-TLS is not possible, an intermediary protocol that approximates the DID-TLS functionality can be implemented.

References:

 * https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/DID-Auth%20protocol.md

## CurveZMQ

 * CurveZMQ is a protocol for mutually authenticated and encrypted channels based on Curve25519.
 * Instead of using hardcoded keys, they can be discoverable from the DIDs of the two parties.

References:

 * http://curvezmq.org/

# DID-Auth'ed Isolated Messages

An isolated message outside of an established channel may include a proof by an *identity owner*.

## HTTP Signatures

 * An HTTP request or HTTP response may be signed to authenticate the sender.
 * The signatures are the same for identical messages, i.e. there is no replay protection.
 * The senders of the HTTP request and HTTP response are not authenticated in advance, only once the message is received.

Example:

	POST /api/v1/issuerservices HTTP/1.1
	Host: django-devex-von-test.pathfinder.gov.bc.ca
	User-Agent: curl/7.58.0
	Accept: */*
	Authorization: Signature keyId="did:example:123456789abcdefghi#keys-1",algorithm="rsa-sha256",headers="(request-target) accept user-agent",signature="214BeK0YJ9P2wmMXBjZNNXDMT4prNlc32ZkslillkJYkJeLp3zbz4r1WfgCltd103m7AyY734qbau+GsWENDXaqxeTaP6LSMLWr6FexWMVgBbMzH1KDMhJlozTMFPkMsGlbuDpRKwEPqnX1Yy6ldHLe8mIJfSAEUy5P/Hf3y1b1kI8XyHNVbChFJLiUkOocF7XsFuTfoB+MJSEUqJDnuKibiF+Ap9rxI7J7Uroe6EjaVYqLXnGbpu8j8Oxn5QzGBZFCA/j6XgHy4NK9fG9pcCyyAPGzSYi1RWjDWFyS0RDQAXFBBNgyskXAgssKuVS2AFwPvXcHb5mhvKFUYMvMESg=="

References:

 * https://www.ietf.org/id/draft-cavage-http-signatures-09.txt

## E-mail Signatures

 * An e-mail may be signed using MIME Security and OpenPGP formats, but using key material associated with DIDs, instead of keys that are exchanged in advanced.

# DID-Auth'ed Challenges/Responses

The most flexible variants of DID Auth are those where a challenge is issued by a *relying party* to an *identity owner*, who answers with a response to the *relying party*. This response proves control over a DID (e.g. with a cryptographic signature) and is linked to the challenge (e.g. with a nonce and timestamp).

Formats, protocols, and flows:

 * Both the challenge and the response may be expressed in various formats, such as JWT, Verifiable Credentials, etc.
 * Both the challenge and the response can be delivered over a number of protocols and flows, involving e.g. JavaScript function calls, deep links, browser redirects, HTTP POSTs, push notifications, etc.
 * The *relying party* may or may not need additional protocol-specific information about the *identity owner* in order to be able to deliver the challenge (e.g. a DID Auth service endpoint). This additional protocol-specific information may be discoverable from the *identity owner's* DID.
 * The *identity owner* may or may not need additional protocol-specific information about the *relying party* in order to be able to deliver the response (e.g. a callback URL). This additional protocol-specific information may be included in the challenge, or it may be discoverable from the *relying party's* DID.

Composition of components:

 * The *identity owner's* component that sends the response may or may not be the same component as the one that received the challenge. E.g. the challenge may be received as HTTP POST by a **DID Auth service**, but the response may be sent as HTTP POST by a **mobile app** (see Example Flow 6).
 * The *relying party's* component that receives the response may or may not be the same component as the one that sent the challenge. E.g. the challenge may be sent as deep link by a **mobile web page**, but the response may be received as HTTP POST by a **web server** (see Example Flow 1).

Additional considerations:

 * The *relying party* may or may not know the *identity owner's* DID in advance.
 * The cryptographic challenge sent by the *relying party* to the *identity owner* may or may not itself include a proof of the *relying party's* control over a DID.
 * Once the *identity owner* receives the challenge via a component that can produce a response with a valid proof, the *identity owner* will typically have to approve this step (grant consent). Depending on the components and protocols, this approval step may be omitted in certain cases (e.g. on repeated DID Auth flows).

References:

 * https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2017/tree/master/supporting-files

## Example Flow 1

 1. *Relying party's* **mobile web page** redirects via deep link (with challenge) to *identity owner's* **mobile app**.
 1. *Identity owner's* **mobile app** opens link (with response) to *relying party's* **web server**. OR:
 1. *Identity owner's* **mobile app** sends HTTP POST (with response) to *relying party's* **web server**.

Example challenge:

	did:auth?challenge=...

Example response:

	{
		"header": {
			"typ": "JWT",
			"alg": "ES256"
		},
		"payload": {
			"iss": "did:example:123456789abcdefg",
			"sub": "did:example:123456789abcdefg",
			iat: 1479850830,
			exp: 1511305200,
		},
		"signature": "..."
	}

References:

 * https://github.com/uport-project/specs/blob/develop/flows/index.md
 * https://github.com/uport-project/specs/blob/develop/flows/selectivedisclosure.md
 * https://github.com/uport-project/specs/blob/develop/messages/sharereq.md
 * https://github.com/uport-project/specs/blob/develop/messages/shareresp.md

## Example Flow 2

 1. *Relying party's* **web page** displays a QR code (with challenge) that is scanned by *identity owner's* **mobile app**.
 1. *Identity owner's* **mobile app** sends HTTP POST (with response) to *relying party's* **web server**.
 1. { *Relying party's* **web server** sends push notification (with response) to *relying party's* **web page**. }

Example challenge:

	{
		"header": {
			"typ": "JWT",
			"alg": "ES256"
		},
		"payload": {
			"iss": "did:example:123456789abcdefg",
			"callback": "https://rp.example.com/didauth",
			"iat": "2018-01-01T12:42:26.556Z",
			"exp": "2018-01-01T13:32:26.556Z",
			"jti": "0.dqh8o13bnbs"
		},
		"signature": "..."
	}

## Example Flow 3

 1. *Relying party's* **web page** calls JavaScript function (with challenge) on *identity owner's* **web browser**.
 1. { *Identity owner's* **web browser** communicates (with challenge and response) with *identity owner's* additional components such as a **credential repository service**. }
 1. *Identity owner's* **web browser** triggers JavaScript promise (with response) on *relying party's* **web page**.

Example challenge:

	const credential = await navigator.credentials.get({
		web: {
			VerifiableProfile: {
			...
			}
		}
	});

Example response:

	{
		"id": "http://example.gov/credentials/3732",
		"type": ["Credential", "IamMeCredential"],
		"issuer": "did:example:123456789abcdefghi",
		"issued": "2010-01-01",
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

References:

 * https://w3c-ccg.github.io/credential-handler-api/

## Example Flow 4

 1. *Relying party's* **web page** contains a link or button that redirects (with challenge) to *identity owner's* **DID Auth web server**.
 1. { *Identity owner's* **DID Auth web server** communicates with *identity owner's* **web browser**. }
 1. *Identity owner's* **DID Auth web server** contains a link or button that redirects (with response) to *relying party's* **web server**.

Example challenge:

	<form action="https://auth.example.com/did:example:123456789abcdefg" method="post">
		<input type="hidden" name="challenge" value="...">
		<input type="submit" value="Submit!">
	</form>

## Example Flow 5

 1. *Relying party's* **mobile app** displays a QR code (with challenge) that is scanned by *identity owner's* **mobile app**.
 1. *Identity owner's* **mobile app** sends HTTP POST (with response) to *relying party's* **DID Auth service**.
 1. { *Relying party's* **DID Auth service** sends push notification (with response) to *relying party's* **mobile app**. }

## Example Flow 6

 1. { *Relying party's* **web page** contains a link or button that calls the *relying party's* **web server**. }
 1. *Relying party's* **web server** sends HTTP POST (with challenge) to *identity owner's* **DID Auth service**.
 1. { *Identity owner's* **DID Auth service** sends push notification (with challenge) to *identity owner's* **mobile app**. }
 1. *Identity owner's* **mobile app** sends HTTP POST (with response) to *relying party's* **web server**.

## Example Flow 7

 1. { *Relying party's* **web page** contains a link or button that calls the *relying party's* **web server**. }
 1. *Relying party's* **web server** sends HTTP POST (with challenge) to *identity owner's* **DID Auth service**.
 1. { *Identity owner's* **DID Auth service** sends push notification (with challenge) to *identity owner's* **mobile app**. }
 1. { *Identity owner's* **mobile app** sends HTTP POST (with response) to *identity owner's* **DID Auth service**. }
 1. *Identity owner's* **DID Auth service** sends HTTP POST (with response) to *relying party's* **web server**.

# Next Steps

DID Auth work should focus on the following:

 * Agree on scope of DID Auth.
 * Agree on supported formats for challenges and responses.
 * Agree on supported protocols and flows.
