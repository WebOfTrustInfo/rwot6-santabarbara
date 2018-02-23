# Decentralized Identities for the Cannabis Industry

Authors
* Matthew Nguyen
  * Github: @MattNguyen
* Nicholas Shook
  * Github: @Shicholas

## Background

Cannabis is a highly regulated environment where each facility is required to
track the chain of custody of each plant and plant-derived product. This
includes identifying each person that managed the product and the cannabis.
These regulations are important to prevent the inversion and diversion of
cannabis products to and from black markets. States require implementing a
traceability system, analogous to the pharmaceutical industry, that monitors
inflow and outflows of cannabis, providing accountability for all stakeholders
along the cannabis supply chain.

Before someone is eligible to work at a cannabis facility, they are subject to
a background check conducted by the State. In Nevada, the background check is
conducted by the Department of Taxation. For owners or managers of a facility,
a financial background search is also conducted, inclusive of examining all of
the financial history of a given person that owns more than 5% of the Company. 

When it comes to the customers, there are two types: medical patients, which
need an Identification or Doctor’s Letter from a state or jurisdiction with a
medical marijuana program; and recreational users, who are required to provide
a simple identification that the customer is over 21 in certain states such as
California, Oregon, and Nevada.

Identity is thus important for two reasons, for the first, it’s important to
establish self-sovereignty for an industry that’s strictly regulated on the one
hand, but looked down upon by the feds who have purposefully vague laws.
Customer identity and their privacy should be protected, and employees of
cannabis businesses should be encouraged to develop best practices for managing
their role in the supply chain.  Secondly, identity actors form a
self-reinforcing graph of trust that facilitates compliance with various
jurisdictions and promotes public safety. Cryptographic identities are a key
ingredient in making this system work.

Blockchain presents an opportunity to introduce self-sovereign identities as a
way for individuals and organizations to provide identity claims to navigate
this highly regulatory landscape. From the consumer perspective, since I am
able to own my identity, I can divulge the age and identification requirements
necessary to enter dispensaries. Regarding employment, the situation is more
complex. As an employer, how would I access an employee’s employment history?
If this person were blacklisted from other cannabis businesses, should I know?
How? Later sections will explore how we plan on tackling this issue.

Though identity will play a central role, governments are slow to respond. Some
forward thinking governments have begun adopting decentralized identities, such
as the city of Zug and Brazil. However, usage of these identity systems in
highly regulated markets such as cannabis remain to be seen. We plan on taking
a different approach to adoption.

## Solution

Our issuing credential will be the Cannaledger Foundation (Foundation), a
non-profit that certifies claims inspectors on the blockchain. The Foundation
will certify and verify the legal authority of certain licensed attorneys to
serve as claims inspectors who will add the identities of the individuals to
the blockchain. An individual or organization seeking claims attestations can
visit an attorney with their legal photo identification and their latest bank
statement and be certified to be over 21 years old. For employees, more
information such as their state agent card application form and card, may be
required. For businesses, inspectors can verify business documents relating to
their incorporation status and their commercial licenses for medicinal and
recreational marijuana.

The diagram below outlines the claims verification tree:

![Claims Verification](https://gist.github.com/MattNguyen/38242a0a70fff97e9dd500dcac65cf29/raw/1b6159b26fa4c07892116f85c5629e7333359d71/graph.png)

The following table describes the types of verifications each entity will
perform on its child:

![Verifications Table](https://gist.github.com/MattNguyen/38242a0a70fff97e9dd500dcac65cf29/raw/1b6159b26fa4c07892116f85c5629e7333359d71/table.png)

Claims data will be recorded to the blockchain, and the type of data stored
depends on the subject of the claims. For instance, when the Foundation
onboards new attorneys into the network, the foundation will collect
information regarding the lawyer’s qualifications to practice law in Nevada,
including their State Bar license. The Foundation will then sign the
attestation using their private key. This process continues for all other
attestations in the trust graph.

The Foundation serves a critical role in this system. Since the actual
regulatory bodies issuing credentials will be slow to adopt DIDs, a consortium
of legal entities will provide interim support to individuals and businesses,
leveraging their legal authority to back identity claims. When State
institutions are ready to adopt DIDs, they may issue claims to identity
holders, thus providing more legitimacy to existing claims. In this web of
trust model, issuers do not need to exist, but need to be verifiable by third
parties.

To create this identity system, we chose uPort to store identities on the
Ethereum blockchain. uPort provides the requisite feature-set to implement this
graph of trust. In addition to providing the APIs for identity creation and
claim attestation, uPort’s identity social recovery mechanism ensures that
identity profiles are transferable to other devices. Moreover, by providing
proofs and digital signatures for claims within identity documents, we can
attain a degree of trust that a particular identity and its claims are
authentic. 

## Beyond Identities

With the identity layer in place, the cannabis industry can begin implementing
other interesting applications, particularly those in the supply chain space.
We’re interested in using these digital identities to interact with other
identities (individuals, organizations, and devices) through a shared
authentication and authorization layer that manages supply chain compliance
with the State. 
