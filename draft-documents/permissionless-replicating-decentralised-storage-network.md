# Permissionless, Replicating, Decentralised Storage Network for Storing Verifiable Credentials

Authors: Kulpreet Singh, Joao Santos, Nate Otto, Ron Kreutzer

## Abstract

The Verifiable Credentials specifications require that "Holders must
provide verifiable claims to inspector-verifiers through an agent that
inspector-verifiers needn't trust; they only need to trust issuers."
This requirement can be fulfilled by a permissionless, replicating,
decentralised storage network that serves any Verifiable Credential
saved on the network with high availability. We motivate the need for
such a storage network by describing use cases where holders need to
provide public access to the claims. We identify common use cases of
storing verifiable credentials and try to separate them in to two
groups where the data must be stored on an active agent, and where the
data can be stored on a permissionless, replicating and decentralised
storage network. Finally we identify a set of features that such a
storage network needs to provide. We don't think that all these
features are necessarily compatible and should all be provided by all
implementations. Instead we suggest that a number of different storage
networks are possible supporting different combinations of these
features.

## Introduction

[Verifiable Credentials Specifications](https://w3c.github.io/vc-data-model/)
provide a mechanism to express these sorts of credentials on the Web
in a way that is cryptographically secure, privacy respecting, and
automatically verifiable. The
[Credentials Community](https://www.w3.org/community/credentials/charter/)
is working on providing specifications for the Verifiable Credentials
and [Decentralised Identiy(DID)](https://w3c-ccg.github.io/did-spec/)
where
[Identity Hubs](https://github.com/decentralized-identity/hubs/blob/master/explainer.md)
are used to store credentials for an entity identified by a DID
document. We present an alternative way to store Verifiable
Credentials - by storing them on a public decentralised network.

A permissionless, replicating, decentralised storage network is a peer
to peer network that stores Verifiable Credentials so that the
credentials are always available and publicly readable. The network
allows anyone to join and obtain a replica of the entire data set
stored on the network. We envision that each node in this
decentralised network can choose to store data for one or more
DApps, so that not all nodes store data for all DApps. Such a storage
network runs as a public utility where participants store and retrieve
data for their use cases but as a consequence provide the utility for
everyone else.

In the following sections we identify common patterns used by DApps to
store verifiable credentials and identify if they need an active agent
for storage or if a permissionless, decentralised storage network is
needed. We identify a set of features that such a storage network
might want to support and finally present a layered architecture to
provide features that cover some common usage patterns.

# Common Patterns for Storing Verifiable Credentials

In this section we identify common patterns for storing verifiable
credentials among four projects - [Chlu](https://chlu.io),
[DClaims](https://github.com/inesc-id/dclaims-news),
[OpenBadges](https://openbadges.org/) and
[Pillar Project](https://pillarproject.io/). We then identify if each
of the identified patterns requires an active agent to store the
credentials or can can also be stored on a permissionless,
decentralised storage network while providing the required application
behaviour.

First we provide an brief overview of the four projects and list the
requirements for storing the Verifiable Credentials stored in each
project.

## Chlu

Chlu decentralises ratings and reviews earned by vendors from selling
their goods and services on marketplaces. These ratings and reviews
are saved so that they can be verified by any third party. The ratings
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

## DClaims

DClaims is a platform that enables a truly distributed and trustless
way of managing claims about news articles. Using the
DClaims-Web-Extension, users can generate claims (whose authenticity
and integrity can be verified by anyone without the need of a third
party) about any news article, and those claims can be presented to
all other users. This all happens in a distributed and trustless form,
with the use of IPFS and Ethereum.

Currently, DClaims stores claims about news articles on IPFS, such
that, if the claim writers turn off their IPFS nodes the claim is lost
forever. The claims created by DClaims users need to replicating and
made highly available independent of the claim issuers availability.

[TODO:JOAO: Would love your feedback on this section and if you want to saying something more or something less please do so.]

## OpenBadges

[TODO:NATE: Does this section make sense? Please point out if my understanding is incorrect anywhere]

The OpenBadges project provides a way for users to earn badges
asserting their achievements. These assertions are issued by
educational institutions and are stored in the recipient's accounts on
OpenBadges backpack services. These backpack services are independent
services that store a user's badges and allow anyone to access these
verified badges.

The OpenBadges ecosystem relies on the backpack services to act as
verifiers of assertions included in the badges before being displayed
to a consumer. However, with recent innovation towards decentralised
identities, there is a drive within the OpenBadges community to adopt
verifiable credentials. It remains to be seen if OpenBadges could be
stored on a storage network that stores OpenBadges as verifiable
credentials and thus does not require an active agent like a
backpack.

## Pillar Project

The Pillar project's aim is to provide users with ownership and control over their
personal data. The project currently stores some assets in a user's wallet with the
remaining data on data hub servers run by the project. The wallet acts as a user's
agent to mediate access to user owned data. The near-term plan is to store data,
including verifiable credentials, consents and encrypted personal data on a
replicated storage network, with a longer-term plan of storing data on a combination
of user-selected storage options, including decentralised storage networks.

## Patterns of Data Storage

In this section, we identify the common patterns of storing data that
were discovered while trying to understand the use cases of the above
projects.

### Storing Protected Personal Information

Storing personally identifiable information (PII), or sensitive personal
information (SPI) and mediating access to the same requires that an
active agent is running on a device controlled by the subject. The active
agent can be run on behalf of the subject and allows the subject entity
to define access control rules.

If an application needs to store PII or SPI data, we believe they should
provide access to these through an active agent that can adhere to
entity selected authorisation policies. PII AND SPI should not be stored
unencrypted on a decentralised storage network.

[added "unencrypted" -- is this our thinking?]

### Mediated Access

If any data requires an access policy, then it seems that the
the easiest way to provide access to the data is through an active
agent. This is probably the case for mediated access to personally
identifiable information.

However, there are other ways to provide mediated access. For
example, by making a copy of the data and then encrypting it with the
public key of a consumer. Such an approach to providing access to data
works if the consumer needs to access a large amount of data,
i.e. almost all of the entity's historical data and then receive
occasional updates.

Revoking access to an already shared data is problematic. This is
because, once a consumer has access to the data, then they could have
made a copy of the data.

We think mediated access by keeping a copy of encrypted data works if
there is a large amount of entity's historical data that needs to be
shared and also where the application can tolerate that a data
consumer retains access to data shared in the past.

### No Mediated Access, Censorship Resistant Verifiable Credentials

If data has to be publicly accessible without mediated access, then
such data can be stored on a public, permissionless decentralised
storage network. An active agent does not provide any benefits but
adds to the overhead of running and maintaining services for all
entities that want to share their verifiable credentials.

If the verifiable credential is created for an entity by another
entity, for example a claim written by a reader about an article, and
it needs to be censorship resistant, then we have to store it in a
permissionless decentralised storage network so that it remains highly
available and the subject can not deny access to that data.

### Revoking Access to Verifiable Credentials

In cases where an entity wants to revoke access to a verifiable
credential, we think agents will provide a stronger guarantee to be
able to do so. Revoking access to credentials stored on a
decentralised storage network is possible through revocation
lists. But it requires trusting nodes on the network to not misbehave
by ignoring revocation lists.

However, as we pointed out earlier, the consumer still has a copy of
the data, and it can't be guaranteed that they will not use it in the
future. Therefore, revoking access to data comes down to the trust
relationships established between the consumer and the subject.

### Share Credentials with a Community

Another use case, similar to the one above is sharing verifiable
credentials within a community, where other members are also sharing
credentials to build a network of trust relations. In this case, other
entities in the community need to access the verifiable credentials
even after the entities that shared the verifiable credentials have left
with their device.

Once an entity's agent leaves the community, for example, the user
leaves the area with their mobile phone, then the rest of the
community can't access the entity's shared data anymore. In such
cases, a storage network approach, where entity's data are replicating
on all nodes will provide a better solution.

### Running Services

Agents need to be run somewhere and the cost of running them has to be
paid by somebody. In some use cases, for example, when a customer
leaves reviews for a vendor, or claims created by readers of online
news sites, running an agent or hub to manage access to decentralised
claims can be difficult to provide. The claims should not be only
stored on the news website, nor only the reader's device. At the same
time the subjects (vendors or news articles) can not be required to
run a service for claims associated to them.

Depending on hubs to act as agents for entities creates other points
of centralisation, and in cases where an active agent is not required,
we believe a decentralised, replicating storage network can provide a
better solution.

## Features

In this section we identify a set of features that a permissionless,
replicating, decentralised, storage network can support. We realise
that some of these features are incompatible with each other, however,
different implementations of such a network can pick and choose which
features they want to support.

We invite feedback from the community about any features that seem
problematic or if there are any features we missed out.

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
a k replicas, enough to provide 100% availability. Using a k-replica
approach creates a requirement that when a node goes offline, other
nodes in the network make sure all the data on that node gets
replicated one more time. DHTs like
(Chord)[https://pdos.csail.mit.edu/papers/chord:sigcomm01/chord_sigcomm.pdf],
provide for such replication, but they result in a lot of
implementation complexity.

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
and then serve the new version, or the entire history of the claim.

![Versioning Verifiable Credentials](media/storage-network/versioning.png)

The figure above shows how a verifiable credential is linked from the
blockchain. Any updates to a claim link back to the previous
credential that is being over-ridden by the new credential.

Each node on the storage network maintains an index of the content
identifiers stored at the node. There is another reverse index
maintained by each node, which allows for quick lookups for a content
address that include a hash pointer to a given content address.

When a node is queried for a given content identifier, the node
returns the entire chain of claims. It is then up to the consumer how
to consume the data.

### Reciprocity - No Free Riders

To borrow from the bit-torrent protocol, a storage network can require
that a node is sent new data only if it is storing and serving a
certain minimum amount of data. Providing such reciprocity incentives
has not been easy in other networks, so we advise carefully evaluating
the benefits of providing this feature.


### Identify Bad Actors

Nodes should be able to identify if other nodes are not serving the
correct data. Full nodes will have the entire data set and they can
police other nodes to check if they are serving correct data. In case,
if a node is sending incorrect data, the policing nodes should be able
to call out the bad nodes along with a proof of the incorrect data
served. By encouraging nodes to police each other and simply call out
bad actors we can provide for a way to govern and maintain the
network.

### Freshness

A node should be able to specify the lifetime they are willing to
store data for. This is useful in the DClaims use case. Claims written
against old articles might not be of interest to the community, and by
pruning old data, we allow light nodes run on user's machines to
participate in the network without requiring too many resources.

### Synchronisation

When a new node starts it should be able to fetch the entire data
stored on the network. This is similar to bitcoin full node obtaining
the entire blockchain.

### Prove Full Node Status

Full nodes should be able to prove that they are storing the entire
data set, and anyone should be able to check the same. Our proposal is
that a "full node verifier" look at the blockchain for all anchors
published there and then fetch verifiable credentials from a given
node. If the node is able to provide all verifiable credentials then
it is a full node.

In this section we identified a list of features that a storage
network needs to support. We envision a multitude of storage networks
that support different combinations of the features listed. In the
next section we propose an architecture of a storage network and
identify which of the above features can be provided by putting
together open source libraries already available.


## Proposed Architecture

In this section we propose a layered architecture of the storage
network and identify which of the features listed above can be
provided by an implementation of such an architecture. The figure
below shows our proposed layered architecture.

![Proposed Architecture](media/storage-network/architecture.png)

The components are

### HTTP API Endpoint

An HTTP API to receive GET, PUT and UPDATE requests. DELETE is not
supported as claims have to revoked using a revocation list, they can
not be deleted from the storage network. PUT requests are
asynchronous, and the client does not have to wait for the node to
verify the review and save it before it can receive a response. PUT
requests are queued for processing so that the client doesn't have to
wait.

### Gossip Based Replication

Gossip based replication protocol that provides eventual
consistency. Each claim is an independent data point and therefore
claim write operations are commutative. This allows us to provide
eventual consistency even in the case of network partitions. When
partitions heal, then the nodes have to synchronise by playing catch
up with each other. Again, this architecture will work for
applications whose writes are commutative. In case, the writes do not
commute, the storage network will have to use an alternative
replication protocol to provide eventual consistency.

Finally, we note that updates to a verifiable credential is also a
commutative write. This is provided because we require that
applications using this particular architecture provide a claim update
to include a hash pointer to the review being updated. This hash
pointer is simply the hash of the claim being updated, and clients can
compute this hash from the contents of the claim, before they publish
an update.

### Verification Layer with Plugins

A verification layer, that makes sure a received message is a valid
claim. A lot of cases are verifiable directly following the Verified
Credentials specifications, but some might require application
specification steps to be taken. We propose to handle this situation
by allowing for nodes to load plugins for running application specific
verification protocols. These are shown as "Plugin DApp X" in the
figure. Once a received claim is verified, it is saved in the local
data storage and also passed to the gossip based replication protocol
to make sure other nodes receive a copy.

### Data Storage

Finally, the local data storage will use a database to store each
claim keyed by the hash of the entire contents of the claim. This hash
can be computed by the client sending the HTTP/PUT request and
therefore the node does not need to return this to the client. The PUT
requests can therefore be made asynchronous, and the client does not
have to wait for the node to run the verification for the claim being
written.

The database store will also write to a reverse index to enable fast
lookups for any updates to a claim.

The architecture presented above addresses one particular use case,
that we believe will be fairly common for DApps. The requirement here
is that DApps need a censorship resistant storage network and are
willing to provide for write operations to be commutative.

## Related Work

(IPFS)[https://ipfs.io/ipfs/QmR7GSQM93Cx5eAg6a6yRzNde1FQv7uL6X1o4k7zrJa3LX/ipfs.draft3.pdf]
is a popular option in the DApps community as a storage solution. But
from our experience on Chlu we have found that developers need to
build bespoke solutions to provide replication and verification. We
believe that the IPFS use case of a permanent web is slightly
different from what DApps like Chlu and DClaims require.

The (Ethereum SWARM)[https://github.com/ethersphere/swarm] project
motivations are closest to the one presented in this paper, however,
the SWARM team is focused on providing auditable storage and with
incentives for nodes to store data. In the solution we have proposed,
nodes have an incentive to store data for a DApp and run full nodes
for it because they value the availability of the data itself. For
example, in Chlu's case, marketplaces want to make sure reviews and
ratings data are available on a permissionless, decentralised network
to build trust in the reviews. In case of DClaims, online publishers
of news content have an incentive to run full nodes so that claims
about articles published by them and other publishers remain available
to their readers.

In both the cases of Chlu and DClaims, competing marketplaces and
publishers have an incentive to police full nodes run by the others
and call them out if they skip any reviews. Further still, anyone can
audit that the full nodes run by the marketplace include all reviews
linked from blockchain transactions. All full nodes can collude and
hide an update to a claim, as it is not linked directly from a
blockchain. But to counter this problem, all it takes is for a claim
issuer to publish the claim again on a new full node, and immediately
call out all the existing full nodes for trying to hide the claim.

(Dat protocol)[https://datproject.org/paper] is designed for syncing
shared folders between peers who know and trust each other. In Dat,
Alice can access Bob's data only if Alice knows Bob's public key. Dat
also provide advanced features like privacy, random access to data
within a filesystem hierarchy and also mirroring data a node knows
about. Dat's goals are different from our requirements of publicly
accessible data stored on a decentralised network. In Dat, each peer
makes a direct connection to all the known peers and runs
synchronisation between them. Such an approach will not work for use
cases we are concerned with, especially if we want tens of thousands
of claim writers to publish claims on the network.

## Conclusion

We presented use cases motivating a need for a permissionless,
replicating, decentralised storage network. The use cases were derived
from discussion at the RWOT6 between participants from Chlu, DClaims,
OpenBadges and Pillar Project. After identifying the use cases, we
derived requirements for a storage network and finally presented an
architecture that will address the storage problems for some of our
use cases.
