# Decentralized Interfaces and the Request-Responsive World

Vlad Kahoun, <vlad@beconomy.live>, [Butterfly economy](http://beconomy.live)

We want a world where all our needs are solved in the best possible way. The world we are looking for is request-responsive. This means that for any of our requests (expressed both directly or indirectly) we can simultaneously get multiple solutions (responses) from theoretically any existing entity on this planet.

This kind of system will increase competition of agents that solve the requests and also the quality of solutions. At the same time, the system enables people, things and software themselves to cooperate at a new level.

To create this kind of hyperconnected world we need a fundamental layer that enables great flexibility. For that reason, the fundamental layer must contain the atomic pieces we recognize when talking about systems. These atomic pieces are entities (sovereign identities) with their indivisible character and interactions (claims) that have direct impact on the state of things.

At the same time, we need all the entities (regardless of whether they are people, things or software) to signal their character and offerings, so that they can be used as resources in favour of the entities who signal needs.

Blockchains and other entities representing decentralized platforms (state transition layer), play their role in creating new economy models and enable other entities to self-organize in their own way or to help the state transition when the broader consensus about such a transition is needed (e.g. transfer of money or other assets).

AIs and other software agents (solution layer) can access all public information about entities and serve like a glue: They analyze the state of entities (character, offerings, needs) and connect people, things and platforms, suggesting the most beneficial interactions in regard to their current situation.

After we have these main components, internet has no backbone anymore. Internet is more like a swarm of single-purpose networks, micro-economies and all other entities, all cooperating with each other to achieve the best possible results.

## Decentralized Interfaces

One of the most important parts of this new economy are entities signaling their character, offerings and needs. Decentralized Interfaces are doing exactly that work.

Decentralized Interfaces enable anyone to describe the atomic character of an entity. For instance, one single interface can describe what attributes the entity has, what actions (possible interactions) it accepts, what kind of messages it can process and return. It can be also imagined like API to any object.

Decentralized Interfaces may help adoption of Decentralized Identifiers and related standards. They may serve as dynamic templates for creation of DID documents.

For instance, an entity wants to signal that it is identified by a DID provided by IPFS. To achieve that, the entity simply adapts #identifiedByIpfsDid interface and pass necessary values into it. The interface may look something like this:


```
#identifiedByIpfsDid

{
  "id": "#string"
}

```

On the other side are entities (in this case network nodes) that can process #identifiedByIpfsDid entity as a parameter and return the appropriate message. These nodes adapt interface #acceptingAction that may look like this:


```
#acceptingAction

{
  "action": "resolve",
  "params": ["#identifiedByIpfsDid"]
}

```

A software agent who finds an entity signaling #identifiedByIpfsDid can easily resolve more information about it from an entity that signals to provide the “resolve” action with #acceptingAction interface and with #identifiedByIpfsDid as an argument. Other than the examples above, there can be many more interfaces like #havingRSAVerificationPublicKey or #flatForRent.

The atomic character of interfaces enables entities to combine these interfaces in very flexible ways to signal the whole character of an entity. Decentralized Interfaces themselves enable cross-platform programming and real p2p interactions, regardless of implementations that entities use.

## Network for Decentralized Interfaces

To enable evolutionary technology progress any entity should not depend on or be pushed to use any particular protocol or standard. Instead, any entity should be able to roll out its own protocols and still be available to cooperate with all other entities.

To reach this level of cooperation we propose a few single purpose networks that enable diversity of protocols while also enabling the cooperation of entities. These networks are mediators helping entities to cooperate better.

Different kinds of entities will need different interfaces which are not possible to predict or create in advance. New interfaces are needed as entities change their character or new kinds of entities are created.

The network for Decentralized Interfaces enables anyone to write and publish his own interface. Other entities can adapt these interfaces and also modify them to evolve.

The network also creates economic incentives for communities specialized in particular fields to contribute with interfaces and their semantics. As a result, we get general language that is created in cooperation with many people and interconnects various systems.

The possibility to freely create interfaces for any use case, adapt them and combine them enables great flexibility to find novel standards, approaches and patterns of cooperation.
