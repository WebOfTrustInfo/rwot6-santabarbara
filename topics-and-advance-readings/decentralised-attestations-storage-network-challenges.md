# Decentralized Attestations Storage - Current Challenges

Kulpreet Singh, [Chlu](https://chlu.io)

## Abstract

Our ongoing effort for implementing a decentralized vendor ratings and
reviews system has posed a number of challenges while trying to store
attestations provided by peers such that they are stored in
persistent, decentralized storage that validate attestations before
storing them. We are using IPFS for our current implementation but
providing layers of validation and replication highlights the need for
storage network that can provide these features in a generic manner
such that various Dapps can use the same network. In this document we
motivate the need for such a network by highlighting the challenges we
are facing during our implementation effort.

## Introduction

The [Chlu reputation
protocol](https://www.chlu.io/papers/position-paper.pdf) provides
decentralized ratings and reviews for vendors who until now are
entrapped by centralized marketplaces that lock vendor reputations in
walled gardens. We [published our
analysis](https://medium.com/chlunetwork/chlu-design-considerations-e8c7498cdf79)
of the Chlu protocol using the [RWOT design
considerations](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2017/blob/master/final-documents/reputation-design.pdf)
for decentralized reputation system.

During our ongoing development work to provide a decentralized
platform for ratings and reviews data, we have encountered the need
for a decentralized PKI and the challenges faced while trying to
provide an "always available" attestations storage network such that
the DID owner can't refuse an attestation - as long as it is
valid. The need for our requirements and how we aim to provide it is
described in the [Chlu
protocol](https://www.chlu.io/papers/position-paper.pdf).

In this document we briefly describe our protocol and highlight the
challenges facing our work. We acknowledge the need for Chlu to start
supporting the [Decentralized Identifiers
specifications](https://w3c-ccg.github.io/did-spec/) and [Linked Data
Signatures
specifications](https://w3c-dvcg.github.io/ld-signatures/). Finally,
we point out changes we would like to discuss around [Decentralized
Identity Hubs
Specifications](https://github.com/decentralized-identity/hubs/blob/master/explainer.md).

## Chlu Protocol Overview

We haven't started using DID specification yet, and we plan to start
using them as soon as our first reference implementation is complete.

The actors in the Chlu protocol are marketplaces (both centralized and
decentralized), vendors selling goods and services on marketplaces and
customers making purchases through those marketplaces.

We next provide a quick over of the Chlu protocol as it stands without
implementing DID specs.

1. Vendors obtain a keypair from a marketplace (S_vm, P_vm). The
secret let S_vm is signed by the marketplace using the marketplace
root key pair, (S_m, P_m). The public keys P_m and P_vm are published
in well-known location under marketplace control. The problem of
depending on a well-known locations and DNS are identified in
'Challenge 1.'

2. Vendors sign P_vm with their own identifying key. Currently we use
[IPNS](https://ipfs.io/) for distributing this vendor identity key and
we want to explore using DID specifications to provide this.

3. Marketplaces generate a payment request on behalf of a vendor by
signing the payment request using S_vm.

4. The payment request includes a reference to the public key P_vm
that can be used to verify the payment request.

5. Customers receive the signed payment request, validate that the
payment request was signed by the P_vm referenced from it, and
that P_vm is signed by the claiming vendor and the
marketplace.

6. Once the payment request is validated, the customer creates a
rating and review, stores it in a decentralized storage network and
finally makes a payment via a cryptocurrency including a reference to
the rating and review in the payment transaction. Chlu saves the
rating and review on IPFS and then uses flooding messages to provide
replication. See 'Challenge 2.'

7. Validation - Anyone who finds the rating and review can validate
the review, by checking the rating and review data has a reference to
payment request that was signed by the vendor and a marketplace - or
directly by a marketplace on behalf of the vendor. See 'Challenge 3.'

8. Finally, Chlu requires that vendors can control which marketplaces
have access to their ratings and reviews data. We are working on a
bespoke encryption scheme that is a stand in for authorization DID
methods specification. See 'Challenge 4.'

## Challenges 

1. We use .well-known location to distribute marketplace root keys. We
   are aware of the problems with the approach, and we want to switch
   to decentralized PKI as soon as one is easily usable for production
   use. Ideally, we could work towards providing an implementation of
   a decentralized identity hub that can be used without using a token
   to pay for its use.
   
2. We are using IPFS to provide for a replicated store for ratings and
   reviews data. Chlu IPFS nodes validate any new data and then store
   it, they also help any new nodes receive historical data. We would
   like to switch to an implementation of the [Decentralized Identity
   Hub
   Specification](https://github.com/decentralized-identity/hubs/blob/master/explainer.md). However,
   the specifications state how attestations can be accessed, but we
   want to provide means to a) create attestations and store them and
   b) enable attestation authors to update the attestations. The need
   for updating attestations is derived from requirements in
   e-commerce world for allowing customers to edit their reviews.

3. It is important that the storage network only store ratings and
   reviews that are valid and linked to a payment via a
   cryptocurrency. We at Chlu believe that a generic validating
   storage network is possible and that such a network can be
   configured to support a number of different validation
   protocols. The storage network should then only store attestations
   that are valid according to a supported protocol.

4. Vendors can choose to authorize marketplaces to read reviews and
   ratings as they want to join or leave a marketplace. When vendors
   share their ratings and review history with a marketplace, it
   should have access to all the past and future attestations received
   by the vendor. This requires that the Decentralized Identity Hubs
   need to provide support for sharing all the past and future
   attestations data. Our stand in solution is a brute force solution
   of encrypting the review data with marketplace public key and
   publishing the encrypted data on IPFS. We think there is a better,
   more elegant solution possible, especially around the decentralized
   hub specifications.

## Related work

Chlu proposes to save ratings and reviews on a decentralized network
and linked to a blockchain transaction. This is closest to the
[Chainpoint](https://tierion.com/chainpoint),
[Factom](https://www.factom.com/devs/docs/guide/factom-white-paper-1-0)
and [Blockstack
Identity](https://blockstack.org/posts/blockchain-identity). However
both Factom and Tierion require a token for using the network, while
using Blockstack Identity requires that application be built on top of
their stack, which some Dapp authors might be reluctant to do,
especially those using Ethereum as a smart contracts platform.

## Conclusion

We think a freely accessible peer to peer storage network to store
DIDs and attestations could work if the right incentives are provided
to the participants. 

Such a storage network will allow anyone to leave an attestation for
an entity, as long as they provide a proof that the storage network
knows how to validate. The storage network will only store
attestations for proof types (protocols) that it supports and will
only store an attestation if it is valid. Nodes on a storage network
could load/unload proof types they want to support.

In Chlu's case the attestations are in the form of ratings and
reviews for a vendors, and marketplaces have a strong incentive to run
a full replicating node for the simple reason of having local access
to all the data available on the network that they have been given
read access to.
