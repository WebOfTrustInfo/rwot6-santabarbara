
# Permissionless, replicated, decentralised storage network for storing verifiable credentials

Authors: Kulpreet Singh, Joao Santos, Nate Otto, Ron Kreutzer

## Abstract

We identify common usage patterns of storing verifiable credentials
and try to separate them in to two groups where the data has to be
stored on an active agent or can be stored on a permissionless,
replicated and decentralised storage network. We then identify a set
of features that we would like such a storage network to provide. We
don't believe that all these features are necessarily compatible and
should all be provided, instead we claim that a number of different
storage networks are possible that support different combinations of
these features.

## Introduction

A permissionless, replicating, decentralised storage network is a peer
to peer network that stores verifiable credentials so that these
credentials are always available, publicly readable and allow anyone
to join and obtain a replica of the entire data set stored on the
network. We envision that each node in this decentralised network can
choose to store data for a one or more Dapps, so that not all nodes
store data for all Dapps.

In the next sections we identify common patterns used by Dapps to
store verifiable credentials and identify if they need an active agent
for storage or if a permissionless, decentralised storage network is
needed. Finally, we identify a set of features that such a storage
network might want to support.

## Common Patterns of Storing Decentralised Credentials

In this section we identify common patterns of using storage of
verifiable credentials among three projects - dClaims, Pillar Project,
Open Badges and Chlu. We then identify if each of the identified
patterns 1) requires an active agent to store the credentials, 2)
requires a permissionless, decentralised storage network or 3) can be
provided by both approaches.

### Storing Protected Personal Information

Storing protected personal information and mediating access to the
same requires that an active agent running on a device controlled by
an entity or explicitly run on behalf of the entity provides the
access control. If an application needs to store PPI data, we believe
they should provide access to these through an active agent that can
adhere to entity selected authorisation policies.

### Mediated access

If any data requires that an authorisation policy be strictly
respected then, just like the last section, the data should be access
through an active agent.

### No mediated access, censorship resistant verifiable credentials

[TODO: This can be highlighted much earlier]

If data has to be publicly accessible without a mediated access, then
such data can be stored on a public, permissionless decentralised
storage network. In fact, if the verifiable credential is being
created for an entity by another entity, for example a claim written
by a reader about an article, and it needs to be censorship resistant,
then we have to store it in a permissionless decentralised storage
network.

### Revoking access to verifiable credentials

In cases where an entity wants to revoke access to a verifiable
credential, we think agents will provide a stronger guarantee to be
able to do so. Using decentralised storage network, revoking access is
possible through revocation lists, but the trust that no nodes on the
network misbehave and ignore the revocation lists.

### Share credentials with a community

[TODO: This can work with agents. Should we remove this case?]

Another use case, similar to the one above is sharing verifiable
credentials within a community, where other members are also sharing
credentials to build a network of trust relations. In this case, other
entities in the community need to access the verifiable credentials
even if the entities that shared the verifiable credentials left with
their device.

### Running services

Agents need to be run somewhere and the cost of running them has to be
paid by somebody. In some use cases, for example a vendor reviews or
claims made by readers of online news sites, running an agent or hub
to manage access to decentralised claims can be difficult to provide.

Agents can however provide much stronger guarantees for revoking
access to a decentralised claims, which a replicated decentralised
storage network can only do through revocation lists.

## Features

In this section we identify a set of features that a permissionless,
replicated, decentralised, storage network can support. We realise
that some of these features might be incompatible with each other, and
we invite feedback from the community about any features that seem
problematic or if there any features we missed out.

### Verification

Each node that stores a verifiable credential has to verify the
credential before storing it. This prevents nodes being abused to
store data that is not relevant to the network.

### Loadable Modules for Verification

Nodes can choose to support an application by loading the verification
module for the application. This allows the same node to support a
number of applications and at the same time not require the node to
support all applications.

### Availability

The data stored on the storage network should be always available, as
long as at least one node is online. This can be solved in a number of
ways, and we don't suggest any single solution. For example, all nodes
on the network can store all the verifiable credentials that were ever
stored or we can choose a system where each credential is stored with
a k replicas. [TODO: Use p2p terminology here].

### Nodes can choose to not provide access to all data

Following from the above point, some nodes might want to only store
data from a subset of issuers, and still be a member of the node. For
example, nytimes could choose to only store claims written against
their articles.

### Versioning and Updates

The network should support ability to publish and discover updates to
a verifiable claim. This is a hard problem to solve and our suggested
solution is to use full nodes and to use hash pointers from a new
version of a credential to the old version. This will assure that a
node can quickly check if a new version of a credential is available
in and then serve the new version.

[IMAGE]

### Reciprocity - No free riders

### Identify bad actors

Nodes should be able to identify if any nodes are not serving the
correct data. Some full nodes will have the entire data set and they
can police other nodes to check if they are serving correct data. In
case, a node is sending incorrect data, the policing nodes should be
able to call out the bad nodes along with a proof of the incorrect
data served.

### Freshness

Node should be able to specify the lifetime they are willing to store
data for. This is useful in the dclaims use case. Claims written
against x years old articles might not be of interest to the
community.

### Synchronisation

When a new node starts it should be able to fetch the entire data
stored on the network. This is similar to bitcoin full node obtaining
the entire blockchain.

### Prove full node status

Full nodes should be able to prove that they are storing the entire
data set, and anyone should be able to check the same. Our proposal is
that a "full node verifier" look at the blockchain for all anchors
published there and then fetch verifiable credentials from a given
node. If the node is able to provide all verifiable credentials then
it is a full node.
