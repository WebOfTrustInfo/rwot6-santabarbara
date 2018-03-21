# A Primer on the Veres One Decentralized Identifier Blockchain

Contributors: Manu Sporny, David Longley, Kaliya Young, Joe Andrieu,
Pindar Wong, Kim Hamilton Duffy, David Ezell, Dan Burnett, David Wood,
Jim Norton, and Chris Webber

## Abstract

The Veres One Project envisions a world where people and organizations
control their identifiers and their identity data. The Veres One
Blockchain is the worlds first public, permissionless, fit-for-purpose
blockchain optimized for identity on the Web.

## Vision

The Vision of the Veres One Project is to enable all people and
organizations in the world to

1. create and own their online identifiers, and

2. control their identity data and with whom they share that data.

Achieving this vision will enable a Web where:

* Our identity information and identifiers are owned and controlled by
each of us.

* We can more strongly prove key attributes about our digital personas,
reducing fraud.

* Data can be bound to identifiers under our control instead of only to
websites, or stuck on paper in file cabinets, improving data portability.

* Privacy can be enhanced by choosing when and with whom our information
is shared.

* Data sharing can be more easily reduced to the minimum required for a
given interaction.

This vision is shared among a large community of people working within
global organizations such as the Internet Identity Workshop, World Wide
Web Consortium, Internet Engineering Task Force, United Nations ID2020,
the Decentralized Identity Foundation and the Rebooting the Web of Trust
project. Veres One is a realization of this Vision and we are eternally
thankful to the communities that helped shape this project from the very
beginning.

## The Network

The Veres One Blockchain is a fit-for-purpose blockchain built
specifically for Decentralized Identifiers. This specialization enables
the blockchain to be faster, more cost effective, and more privacy
enhancing compared to existing blockchains that are being repurposed for
identity management. The Veres One Network is:

* **Public** - Anyone in the world may read and audit the entire contents
of the ledger.

* **Permissionless** - Any person or organization in the world may create
and control their identifiers.

* **Leaderless** - Blockchain consensus relies on leaderless elector
collaboration, not proof of work, to determine when consensus has been
finalized. Electors are selected dynamically to allow participants to join
and leave the network and to ensure that there is no centralization or
single point of failure for the ledger.

* **Based entirely on open standards and open specifications **- Broad
implementation and interoperability can only be achieved if all aspects of
the system are documented and standardized in a non-discriminatory,
patent-free and royalty-free manner while ensuring that the creators and
maintainers of the system are properly funded.

* **Built on a stakeholder driven governance model** - The source code and
development team have a strict mission-driven focus that always puts the
users of the ledger first.

* **Economically sustainable** - The people that create, run, and protect
the network are paid by the Veres One Project to do so. Avoiding a
"tragedy of the commons" is essential for sound network economics for a
global public utility.

* **Non-speculative** - Unlike other ledgers, the Veres One Blockchain
does not need a speculative network token or cryptocurrency, which
eliminates currency speculation, thus ensuring predictable long term
operational costs.

## The Roles on the Network

The Veres One Network consists of a number of roles:

* The **Board of Governors** is responsible for governance. This includes
ensuring the proper execution of the Veres One Project mission and
managing, collecting, and distributing funds according to the funding
model.

* The **Maintainer** is responsible for maintaining the Veres One software
including continuous security review, managing community contributions,
correcting software defects, and implementing new features.

* **Nodes** are responsible for providing computational and storage
resources for the Network. As the system is permissionless, any person or
organization may run one or more Nodes.

* The **Network** is a collection of Nodes that maintain the decentralized
ledger.

* **Entities** (people, organizations, and devices) use the Network to
create and update decentralized identifiers and their associated
metadata.

* **Accelerators** enable entities to increase the speed at which Entities
can create and update identifiers on the Network.

<img src="https://veres.one/img/Veres_One_Ecosystem_Diagram__Desktop1.png">

## The Funding Model

Entities may use the Veres One Network to create decentralized identifiers
via software applications such as digital wallets. There are two
mechanisms for creating Decentralized Identifiers on the Network. Both
mechanisms require roughly $1 USD to perform, which is derived from the
estimated cost of running the Network. Updates to the Decentralized
Identifier require roughly $0.25 USD to perform or between 2%-4% of what
the Accelerator charges to write a particular type of data to the
blockchain, whichever is greater.

The first approach is to pay an
Accelerator to create a Decentralized Identifier, which happens as quickly
as the Network can come to consensus (a few minutes).

The second
mechanism is to submit a creation request to the Network with an
associated proof of work, which typically takes 6-9 hours for a software
application to generate. Once the Network verifies the proof of work and
comes to consensus, the Decentralized Identifier will be created.

The Veres One Project collects proceeds from Accelerators at agreed upon
rates set by the Board of Governors and distributes the funds according to
current operational needs.

<img src="https://veres.one/images/disbursement.png">

Accelerators fees will be waived on a recurring
basis for a fixed number of humanitarian uses, such as providing portable
digital credentials to refugees for asylum-seeking purposes.

## Features

A select number of features and characteristics of the Veres One blockchain
are listed below:

Feature | Description
--- | ---
Internal Data Model | Linked Data + Web Ledger
Supported Key Types | RSA 2048-4096, Ed25519
Gossip Algorithm | biased, logarithmic reduction
Consensus Algorithm | Continuity - Leaderless, byzantine fault tolerant, asynchronous without rounds, non-blocking, consensus with probability 1
Write Fault Tolerance | 3f + 1 (f == number of byzantine faults)
Elector Model | Dynamic, rotating attack surface
Throughput | 209 DIDs/sec, 18M DIDs/day, 6.6B DIDs/year
Consensus Latency | ~15-30 seconds

Readers that would like to dive into the technical details should read the
[Veres One DID Method](veres-one-did-method.md) paper.

## Learning More

You can learn more about this project by visiting the
[Veres One Website](https://veres.one/).
