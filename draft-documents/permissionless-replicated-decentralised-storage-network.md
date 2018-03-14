
# Permissionless, replicated, decentralised storage network for storing verifiable credentials

Authors: Kulpreet Singh, Joao Santos, Nate Otto, Ron Kreutzer

## Abstract

The Verifiable Credentials specifications require that "Holders must
provide verifiable claims to inspector-verifiers through an agent that
inspector-verifiers needn't trust; they only need to trust issuers."
This requirement can be fulfilled by a permissionless, replicated,
decentralised storage network that serves any Verifiable Credential
saved on the network with high availability. We motivate the need for
such a storage network by describing use cases where holders need to
provide public access to the claims. We identify common use cases of
storing verifiable credentials and try to separate them in to two
groups where the data must be stored on an active agent, and where the
data can be stored on a permissionless, replicated and decentralised
storage network. Finally we identify a set of features that such a
storage network needs to provide. We don't believe that all these
features are necessarily compatible and should all be provided by all
implementations. Instead we believe that a number of different storage
networks are possible that support different combinations of these
features.

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

# Common Patterns for Storing Verifiable Credentials

In this section we identify common patterns of using storage of
verifiable credentials among three projects -
[DClaims](https://github.com/inesc-id/dclaims-news),
[Pillar Project](https://pillarproject.io/),
[OpenBadges](https://openbadges.org/) and [Chlu](https://chlu.io). We
then identify if each of the identified patterns requires an active
agent to store the credentials or can can also be stored on a
permissionless, decentralised storage network while providing the
required application behaviour.

First we provide an brief overview of the three projects and list the
requirements for storing the Verifiable Credentials stored in each
project.

## Chlu

Chlu decentralises ratings and reviews earned by vendors from selling
their goods and services on marketplaces. These ratings and reviews
are saved so that they can be verified by any third part. The ratings
and reviews data includes references to the entities and keys that
signed the review. The ratings and reviews also include a reference to
a public payment made through a cryptocurrency, the payment inturn
also has a reference to the rating and review data, ensuring that each
rating is verifiable as backed by a payment.

Chlu also requires that vendors are unable to hide any rating or
review - once a vendor gets a bad ratings, they should not be able to
hide it from marketplaces and customers. This requires that access to
ratings and reviews is not mediated by the vendor.

Currently, Chlu saves the ratings and review data on IPFS, however
data replication on IPFS is not supported natively. For the moment,
Chlu uses IPFS' pubsub mechanism to provide replication.

## OpenBadges

The OpenBadges project provides a way for users to earn badges
asserting their achievements. These assertions are issued by XXX and
are stored in the recipient's accounts on OpenBadges backpack
services. These backpack services are independent services that store
a user's badges and allow anyone to access these verified badges.

The OpenBadges ecosystem relies on the backpack services to act as
verifiers of assertions included in the badges before being displayed
to a consumer. However, with recent innovation towards decentralised
identities, there is a drive within the OpenBadges community to adopt
verifiable credentials. It remains to be seen if OpenBadges could be
stored on a storage network that stores OpenBadges as verifiable
credentials and thus does not require an active agent like a
backpack. [TODO:NATE: If you kill me for saying such things, I will understand]

## DClaims

DClaims is a platform that enables a truly distributed and trustless
way of managing claims about News articles. Using the
DClaims-Web-Extension users can generate claims (whose authenticity
and integrity can be verified by anyone without the need of a third
party) about any news article, and those claims can be presented to
all other users. This all happens in a distributed and trustless form,
with the use of IPFS and Ethereum.

Currently, DClaims stores claims about news articles on IPFS, such
that, if the claim writers turn off their IPFS nodes the claim is lost
forever. The claims created by DClaims users need to replicated and
made highly available independent of the claim issuers availability.

[TODO:JOAO: Would love your feedback on this section and if you want to saying something more or something less please do so.]

## Pillar Project

The Pillar project's aim is to provide users control over their
data. The project currently stores assets in a user's wallet. The
wallet acts as a user's agent to mediate access to user owned
data. Just like in the case of OpenBadges, it remains to be seen if
the Pillar project's use case can be fulfilled by storing user data on
a decentralised storage network.

[TODO:RON: Are there any plans to support storing user's data on a storage network?]

## Patterns of data storage

In this section, we identify the common patterns of storing data that
were discovered while trying to understand the use cases of the above
projects.

### Storing Protected Personal Information

Storing protected personal information and mediating access to the
same requires that an active agent is running on a device controlled
by the subject. The active agent can be run on behalf of the subject
and allows the subject entity to define access control rules.

If an application needs to store PPI data, we believe they should
provide access to these through an active agent that can adhere to
entity selected authorisation policies. PPI should not be stored on a
decentralised storage network.

### Mediated Access

If any data requires that an access policy, then it is seems that the
the easiest way to provide access to the data is through an active
agent. This is probably the case for mediated access to personally
identifiable information.

However, there are other ways to provide mediated access. For
example, by making a copy of the data and then encrypting it with the
public key of a consumer. Such an approach to providing access to data
works if the consumer needs to access a large amount of data,
i.e. almost all of the entity's historical data and then receive
occasional updates.

Revoking access to an already shared data is a problem, however, once
a consumer has access to the data, then they could have made a copy of
the data.

So mediated access by keeping a copy of encrypted data works if there
is a large amount of entity's historical data that needs to be shared
and also where the application can tolerate that a data consumer
retains access to data shared in the past.

### No mediated access, censorship resistant verifiable credentials

[TODO: This can be highlighted much earlier]

If data has to be publicly accessible without a mediated access, then
such data can be stored on a public, permissionless decentralised
storage network. An active agent does not provide any benefits but
adds to the overhead of starting and maintaining services for all the
entities.

If the verifiable credential is created for an entity by another
entity, for example a claim written by a reader about an article, and
it needs to be censorship resistant, then we have to store it in a
permissionless decentralised storage network so that it remains highly
available and the subject can not deny access to that data.

### Revoking access to verifiable credentials

In cases where an entity wants to revoke access to a verifiable
credential, we think agents will provide a stronger guarantee to be
able to do so. Using decentralised storage network, revoking access is
possible through revocation lists, but the trust that no nodes on the
network misbehave and ignore the revocation lists.

However, as we pointed out earlier, the consumer still has a copy of
the data, and it can't be guaranteed that they will not use it in
future. Therefore, revoking access to data comes down to the trust
relationships established between the consumer and the subject.

### Share credentials with a community

Another use case, similar to the one above is sharing verifiable
credentials within a community, where other members are also sharing
credentials to build a network of trust relations. In this case, other
entities in the community need to access the verifiable credentials
even if the entities that shared the verifiable credentials left with
their device.

Once an entity's agent leaves the community, for example, the user
leaves the area with their mobile phone, then the rest of the
community can't access the entity's shared data anymore. In such
cases, a storage network approach, where entity's data are replicated
on all nodes will provide a better solution.

### Running services

Agents need to be run somewhere and the cost of running them has to be
paid by somebody. In some use cases, for example a vendor reviews or
claims made by readers of online news sites, running an agent or hub
to manage access to decentralised claims can be difficult to provide.

Depending on hubs to act as agents for entities creates other points
of centralisation, and in cases where an active agent is not required,
we believe a decentralised, replicated storage network can provide a
better solution.

## Features

In this section we identify a set of features that a permissionless,
replicated, decentralised, storage network can support. We realise
that some of these features are incompatible with each other, however,
different implementations of such a network can pick and choose which
features they want to support.

We invite feedback from the community about any features that seem
problematic or if there any features we missed out.

### Verification

Each node that stores a verifiable credential has to verify the
credential before storing it. This prevents nodes being abused to
store data that is not relevant to the network.

### Loadable Modules for Verification

Nodes can choose to support an application by loading the verification
module for the application. This allows the same node to support a
number of applications and at the same time allow the node to choose
the applications it wants to support.

### Availability

The data stored on the storage network should be always available, as
long as at least one node is online. This can be solved in a number of
ways, and we don't suggest any single solution. For example, all nodes
on the network can store all the verifiable credentials that were ever
stored or we can choose a system where each credential is stored with
a k replicas. [TODO: Use p2p terminology here].

### Replication

Following from the above point, some nodes will want to only store
data from a subset of issuers, and still be a member of the
network. For example, nytimes could choose to only store claims
written against their articles. In such cases, the network should
allow participation from nodes that only store a subset of the data
available on the network. We call such nodes "lite-nodes" as opposed
to "full-nodes."

### Versioning and Updates

The network should support ability to publish and discover updates to
a verifiable claim. This is a hard problem to solve and our suggested
solution is to use full nodes and to use hash pointers from a new
version of a credential to the old version. This will assure that a
node can quickly check if a new version of a credential is available
in and then serve the new version.

[IMAGE]

### Reciprocity - No free riders

To borrow from the bit-torrent protocol, a storage network can require
that a node is sent new data only if it is storing and serving a
certain minimum amount of data. Providing such reciprocity incentives
has not been easy in other networks, so we advise carefully evaluating
the benefits of providing this feature.


### Identify bad actors

Nodes should be able to identify if other nodes are not serving the
correct data. Full nodes will have the entire data set and they can
police other nodes to check if they are serving correct data. In case,
a node is sending incorrect data, the policing nodes should be able to
call out the bad nodes along with a proof of the incorrect data
served. By encouraging nodes to police each other and simply call out
bad actors we can provide for a way to govern and maintain the
network.

### Freshness

Node should be able to specify the lifetime they are willing to store
data for. This is useful in the DClaims use case. Claims written
against old articles might not be of interest to the community, and by
pruning old data, we allow light nodes run on user's machines to
participate in the network without requiring too many resources.

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


## Implementation

## Related Work

## Conclusion
