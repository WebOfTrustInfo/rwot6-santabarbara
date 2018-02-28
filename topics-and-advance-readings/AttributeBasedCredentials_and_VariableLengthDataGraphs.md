# Attribute Based Credentials and Variable Length Data Graphs

Handling arbitrary data graphs (like JSON-LD) in selective-disclosure enabled signature schemes.

## Introduction

Attribute Based Credentials using Camenisch Lysyanskaya signature schemes typically require a fixed list of attributes defined before issue time in order to validate the correct attribute signature for revealed and unrevealed attributes, including predicate proofs.  This poses problems when an attribute based credential system is to be used for arbitrary data graphs or schema definitions with optional fields, multi-valued fields or nested data structures, such as data schemas in wide use, documented on sites like schema.org.

In an effort to allow JSON-LD data structures to leverage attribute based credentials and zero knowledge signature schemes, this paper outlines differences, requirements and possible options for representing JSON-LD data in attribute based credential schemes such as the one in use by the Sovrin network, implemented in the Hyperledger Indy project.

## JSON-LD and RDF Serialization

<This section of the document could use attention from a JSON-LD expert to update and expand on the available tools and most important challenges.>

There are challenges with creating a reproducible serialization of a data graph and that we would need to leverage framing functionality to commit to the shape of the data graph, and additionally be able to commit to the exact number of data elements in each field, which may be better covered under json-schema specifications than through JSON-LD context definitions.  In an open world data model, where attributes could exist in the document beyond the ones specified in the schema and subsequent credential definition, some standard approach for enumerating or dropping these attributes would need to be followed to allow attribute based credentials to define the per-attribute bases needed for verification.

Background Reading:

[https://w3c-dvcg.github.io/ld-signatures/](https://w3c-dvcg.github.io/ld-signatures/) - one signature scheme proposed in W3C Verifiable Credentials data model

[https://json-ld.github.io/normalization/spec/](https://json-ld.github.io/normalization/spec/) - introduction to RDF Dataset Normalization

[https://json-ld.org/spec/latest/json-ld-framing/](https://json-ld.org/spec/latest/json-ld-framing/) - Describes techniques to match flatten data and then match those flattened attributes to a predefined data shape.

Proposed Sections that could be expanded include: Canonical Serialization, Variability in Data Shape, Multivalued and Optional Fields, Polymorphism and Inheritance, and Committing to Data Shape (Framing)

## Indy Anoncreds (Camenisch-Lysyanskaya signatures)

Hyperledger Indy implements attribute based credentials using Camenisch-Lysyanskaya signatures for selective disclosure and predicate proofs.  This system allows a signature to be validated on a per-attribute basis while revealing the attribute, not revealing the attribute and only proving its valid presence (zero-knowledge proof), or hiding the attribute and only proving a predicate (for example providing proof that a birthdate is more than 21 years ago without revealing the actual date).  To support the cryptography involved, a data structure must be reduced to a fixed flat array of attributes of known length, rather than represented by data graph.

### Schemas and Credential Definitions

The exact details of the cryptography and protocol involved is better described here:

[Anonymous Credentials (Claims and Proofs in a developer friendly format)](https://docs.google.com/document/d/1XEfaOinOTIU9RgtP-GlXQAbOoW8z-oR5aWJDoQdftZ4)

This section contains a simplified explanation for the purpose of illustrating the concept of variable attributes later on.

To allow verification, the issue creates or reuses a schema definition on the ledger that has a flat list of attributes.  Then they create a credential definition that declares the signature used to sign the credentials along with a integer base number for each attribute such that the value disclosed for each attribute in the proof can selectively revealed by the credential holder and validated by the verifier to be correct according to the issuer.

<include example credential definition>

If any and all variation in data schemas must be encoded in unique schemas and corresponding credential definitions, the possession of a credential with strange or rare data could itself be a correlation risk, as the schema and issuer must be disclosed in the proof to allow for validation.  Even timing attacks where a proof request asks for a schema and the time needed to respond "I will not provide this" it could pose a risk in terms of disclosing the presence of a rare schema in an agent’s wallet.

### Fixed Attributes and Variable Attributes

The current Indy system defines a schema object on the ledger that can be reused by multiple credential issuers to build the credential definitions that we just discussed.  Currently these schema definitions only allow a single list of attributes and cannot accommodate data objects with inline sub-types (for examples explore [http://schema.org/Person](http://schema.org/Person) or [https://www.hl7.org/fhir/patient.html](https://www.hl7.org/fhir/patient.html)).  

To overcome this it would be possible to add a variable attributes section after the fixed attributes section in the schema definition.  Ideally this would only be for cases where the number of potential additional attributes is large, but the number of attributes to include in a majority of issued credentials is small, as these new variable attributes would require multiple attribute slots in the actual credential for practical implementations.  Instead of making a one-field disclosure of an attribute that is directly defined in the schema and credential definition, the proof could instead contain a list of attributes for each variable field where the first item contains a commitment to which attribute is being disclosed, the next the standard attribute field as if it were defined in a fixed list, but using the base in the credential definition as referenced in the previous field.  Additional commitments could be added to express the data structure being communicated and ensuring that attribute mismatches and ordinality could also be selectively disclosed as needed.

#### Commitment to Meaning

In addition to the fixed attribute list, the schema could now contain a list of all possible attributes that may or may not be included in a credential.  The credential definition would also define a base for each of these optional attributes for when they are included by the issuer.  When providing a credential, if there is a value present for one of these values the issuer would sign at minimum: an attribute that states what the next variable attribute is and the value of the attribute.  Instead of including these in a proof in a fixed order specified in the schema and credential definition the prover could include them in any order and leave them out entirely (we need to verify how this would work with the details of the protocol and that it wouldn’t disrupt the crypto of the proof).  The attribute disclosing what is intended by the varying attribute would always be required for these attributes, making them twice as expensive as fixed attributes.

#### Commitment to Scope

Once the issuer is signing which optional field is included, along with its value, it is also possible to add a commitment to what part of the data structure includes this attribute.  To illustrate here is a simple data structure:

```xml
<loan>
    <signers>
        <signer>
            <given_name>Alice</given_name>
            <family_name>Smith</family_name>
            <type>Primary</type>
        </signer>
        <signer>
            <given_name>Bob</given_name>
            <family_name>Jones</family_name>
            <type>Cosigner</type>
        </signer>
    </signers>
</loan>
```

In a selective disclosure scheme we want to avoid a situation where one could prove that Alice Jones is the Cosigner on the loan.  To do this we’d like to check that the signer given_name and family_name attributes came from the same signer within the document.

With the same pattern we have used for variable attributes we could add another optional attribute to the proof data structure that makes a selective disclosure of a document scope GUID.  This guid could be a blinded commitment in the proof, meaning we would like to prove in zero knowledge that given_name, family_name and type were all from the same scope in the document without revealing what GUID was used to generate the credential so that it doesn’t create a new unique identifier in the digitally signed data that could be used to track or fingerprint this particular credential if it is ever presented again to another verifier (collusion among verifiers).

#### Commitment to Ordinality

In some cases it is useful to prove that multi-valued attributes appeared in a particular order or that there is more than a particular number of a multi-valued attribute (see predicate proofs).  If we do another additional attribute in a variable attribute that discloses this number 0, 1, 2, ... , n, it could be disclosed as needed to prove that attributes were from the same ordinal scope in the document or that they occured in a desired order or particular position within the issuer signed information.

### Difficulties with ProofRequests and Negotiation for Selective Disclosure

Adding these new fields to a credential and the resulting proof introduces some new challenges for presenting proofs and considering which attributes may be appropriate to disclose.  The list of available attributes would become much larger and the presence of a credential in the wallet that matches a particular schema would no longer ensure that the credential would be a match for a particular proof request (matching and wallet indexing would have to account for variable attributes in schemas).

## Is it worth the effort?

Adding variable attributes to schemas, credential definitions, and the resulting credentials and proofs expands the proof size for credentials that include them and also increases the complexity of validation code.  Most of this work could be addressed directly in libindy, and not leak out into the API interface, but would affect the complexity of translating data into schemas.  If it enables automated tools that allow standard data description languages to be used directly by the protocol, it may be worth the added complexity.

### Data Normalization as an Alternative Strategy

As an alternative to this strategy, data alternatives could be provided in sub-schemas, and multi-valued fields could be specified in multiple credentials, much like you would decompose multi-valued data objects into a RDBMS when pursuing normal form.  This still reveals the exact schema types of the sub-tables as part of the credential disclosure, but only when those data elements are included in a composite proof.  This may make it easy to correlate individuals who have certain rare attributes even when they do not disclose the rare attributes (for example: https://en.wikipedia.org/wiki/Surname#Spanish_compound_surnames).

