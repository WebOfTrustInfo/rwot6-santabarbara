# Three Primers

## Functional Identity

An approach to discussing identity.

### It's Not

It's _not_ a question of "Who am I?" Because that's more philosophical
and psychological.

It's _not_ compositional (attributes).

It's _not_ digital assets.

It's _not_ independent actors; _identities don't do things!_

### It Is

Instead it's about _keeping track_ of people and things.

It's how we _recognize_, _remember_, and _respond_ to specific people and things.

### Terminology

   * Subjects, Identifiers, Attributes, Raw Data, Contexts
      * (People & Things, Names, Knowledge, Observations, Situations)
   * Acquire, Correlate, Reason, Apply, Govern
      * (Relate, Collect, Reason, Apply, Control)

### Q&A

Q: Is it reflexive?

A: Yes.

## Verifiable Credentials

Anatomy:
   * Credential Identifier, Credential Metadata, Claims [Attributes], Issuer Signature [Cryptography]
   * Cryptographically Verifiable, Sendable over Internet/Web

Ecosystem:
   * Issuer: Issues Credentials
   * Holder: Acquires, Stores, and Presents Credentials
   * Verifier: Requests & Verifies Credentials
   * Identifier Registry (e.g. DID Legder): Maintains Identifiers

In standardization process, test suite and interoperability within 6 months

## Decentralized Identifiers (DIDs)

The fundamental building block of self-sovereign identity.

DID is an address of a public key on a blockchain (somewhere)

_You_ hold the private key. 

Need _devices_ to manage them because they're not human manageeable.

You will not have just one DID.
   * You will have thousands.
   * One for every relationship.
   * Each one gives you a lifetime encrypted private channel with someone.
   * Great way to exchange verifiable credentials.
   * And with no central registration authority.

In summary, a DID is:
   * A permanent identifier
   * A resolvable identifier
   * A cryptographically-verifiable identifier
   * A decentralized identifier

No identifier has ever done these before!

### Q&A

Q: How different from PGP?

A: In relation, PGP was not resolvable!

Q: What if keys get stolen?

A: They need to be rotatable! (But it's a deep topic.)

Q: How is it resistant to real-world disasters, like fires?

A1: There are emerging solutions.

A2: It's relatively easy to solve the stolen or lost, but encrypted,
keys. It's harder to solve the problem where an unecrypted key was
stolen and transactions were conducted!

Q: How do you do Sybil resistance for _decentralized_ identities?

A: Use algorithmic procedures, looking at graphs; or have an issuer.



