Contributors:
ChristopherA
DCrocker
CWebber
AndrewHughes3000
DLarsen
CaballeroJuan
KateSills
Msporny

Notes by Andrew Hughes (AndrewHughes3000@gmail.com)
March 8, 2018
RWOT #6 Santa Barbara

The topic of the discussion was:
* What is the Minimum Viable schema to serve the needs of a cryptographic web of trust?
    * For example, an Entity asserts that ‘Kate’ is in possession of ‘her’ private key
    * or, Entity calls other DID using an Edge Name
    * or, X is able to get an introduction to Me so that I can start to assemble a view of trust (bootstrapping the relationship graph)

The participants did not discuss schemas directly. The conversation turned to the kinds of assertions that such a cryptographic web of trust might want to assert.

What are the assertion primitives?
Notes:
* These assertions are all from the perspective of one Entity (known as 'The Entity' towards another Entity.
* Entities are expected to possess many DIDs, therefore the perspective is that the Entity will only know a subset of DIDs for another Entity
* The Entity can be a person, group, software agent or thing.

1. An assertion that The Entity has performed DID Auth on another DID
    * DID Auth is cryptographic proof that a DID claimed by an Entity pertains to that Entity
2. An assertion that The Entity has done some verification of another Entity’s existence or that Entity’s verifiable credentials
    * The assertion might be ‘IS_A_PERSON’ or ’Presented a driving license’ or ‘Biometric witness’ (supervision of the biometric capture event), or other Identity Proofing & Verification actions
3. An assertion of The Entity’s ‘Introduction Name' for itself
    * Introduction Name: what one Entity uses as an Edge name for another DID
    * ‘Intro Name’ is a new suggestion for ‘Anchor name'
4. An assertion of The Entity's Edge Name for another DID
    * “That DID is known as <blah>”

* (maybe) Permission for an entity to share the assertions with other DIDs
    * Warning that this goes beyond ‘pairwise’ and so is beyond Minimum Viable

* Note: Christopher would like the ability for a collection of people to assert that they are a member of the collection of people - this might be a variant on #3 where Entity is a collective or group of entities
* Manu: why not solve for messaging systems that use DIDs - ‘Signal with DIDs instead of phone numbers’. This might be a high value solution that would be supported by the assertion primitives.
    * Christopher: note that the introduction problem still exists
* Dave: Maybe the ‘vouching for’ activity is the highest value activity
    * The Journalist scenario might be a good story to tell - e.g. for whistleblowers
* ‘Intro name” is our name for the ‘Anchor name’ from the 'petnames' group
* Manu: the primitives are fine, but there’s no money in it :-)
* Kate: talked about the spectrum of control of namespaces
* Chris: if this could be implemented for ToR browsers then there’s a ready-made audience that would value the solution
* Andrew: What are the Functional Identity nouns and verbs for the primitives?
*
