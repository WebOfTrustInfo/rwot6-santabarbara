# Technology Demos

## DIF Universal Resolver (Markus)

DIDs are become more mature; resolver takes you from the DID to the
DID Document.

Graphical interface: type a DID and it gets resolved!

Written in Java

Each DID method works a little different, and the Resolver has drivers
that work for them. Drivers can work internally in different ways.

The tool supports service selection (such as looking for a "homepage" service)

### An Application of the Universal Resolver

Adding DID-based authentication to TheOrgBook

Uses service-to-service APIs: only allow API requests from certain DIDs
   * Which requires a Signing DID Auth Proxy & Verifying DID Auth Proxy

## Practical Usage of DID (Cedric)

ixo Protocol manages projects & their implacts.

   * Project
   * Claims
   * Evaluation

A user with a self-sovereign project creates a project, then another
user makes a request to submit claims, which the project owner can
authorize.

   * Uses capabilities

Uses Metamask as credential provider

   * An Ethereum wallet is used for the DID
   * Takes data and adds signature

Then users on mobile applications can make claims, which are also signed.

https://github.com/ixofoundation
http://ixo.network

## The OrgBook (John)

Province of British Columbia

Solving problems for business people, by creating

_Verifiable Claims_

The OrgBook is a _Holder_ in the middle, which stores Verifiable
Credentials about businesses.

   * Business registry and permits & licenses

Can search by name and look up permits & other credentials related to company

   * Can "Verify Credential" to see proof of credential

Public value thanks to transparency, but it's available by API to any
one else who uses the service

   * Can be used to look up suppliers
   * Can offer recipes necessary to start up a specific type of business

Uses zero-knowledge proofs to verify existence of some permits

## Capturing Ratings Interviews (Kulpreet)

A use case for DIDs: Chlu

Decentralized, verifiable ratings for vendors selling services and
products on marketplaces.

They should be publically accessible and shared with a certain marketplace

   * Can't hide any ratings or reviews: it's all or nothing

Verification requires signatures by reviewer and marketplace and vendor

Gets by problems of replication of IPFS by pinning a copy immediately

Next Step: move to DID spec, solve problems with IPFS as a passive
store, integrate with btcd.

## Javascript DID Resolver (Christian)

Similar to Markus': a tool for resolving a DID to a DID Document

   * We want different implementations in different languages

Has a simple "resolve" function

You register methods with resolver, and then you can resolve them

## Evernym's VCX: Verifiable Credentials Exchange (Drummond)

Show: Issuing a Verifiable Credential & Using It

1. Demo makes a connection between person & company
2. Company offers a verifiable credential to person
3. Person gets verifiable credential offer on phone
4. Person chooses to accept it
5. Company then turns offer into credential
6. Person can then use selective disclosure of attributes on credential

(This completes the issuance of the claim.)

Now person can use it:

7. Second company makes a connection to person
8. Second company requests proof of credential from person
9. Person now receives request of proof
10. Person sends back proof fulled in with information
11. Second company gets proof from person 

A lot of this credentials exchange will be automated

## Veres One (Manu)

A globally interoperable blockchain for identity, fit-for-purpose

   * non-speculative, sustainable, low-cost
   * fast: 209 DID ops/sec, ~$1 for DID creation, 15-30 second consensus time
   * global
   * pure, capability-based system

What can you do with a DID leger, using the DID client?

   * Create a DID
   * Register it on a ledger
   * Retrieve it from ledger
   * Add or Rotate Keys

Accelerators are used to fast-create DIDs instead of taking 6-9
proof-of-work hours to create DID.

## BTCR (Chris & Kim)

A Bitcoin DID 

A descriptor encrypts Bitcoin height and index

As long as it's a standard P2PKH and there's still coins, it can be
used as a BTCR DID

You revoke it just by spending the coins!

Use the OP_RETURN to give additional information, like additional
keys, and point to the new tip

### BTCR TX Conversion Playground

Can convert a BTCR txref to a txid or a blockheight and position
Or convert back from txid

Can take DID document from transaction, merge in OP_RETURN information
(really: information pointed to by OP_RETURN), and create a composite
DID documentation.

A SatoshiAuditTrail gives additional information like fees and amount
of money on the tip that sorts of creates a reputation(!) for the DID
