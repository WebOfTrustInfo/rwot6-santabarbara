## Rebooting the Web of Trust VI: Santa Barbara (March 2018)

This repository contains documents related to RWOT6, the sixth Rebooting the Web of Trust design workshop, which ran in Santa Barbara, California, on March 6th to 8th, 2018. The goal of the workshop was to generate five technical white papers and/or proposals on topics decided by the group that would have the greatest impact on the future.

_Please see the [Web of Trust Info website](http://www.weboftrust.info/) for more information about our community._

##  Topics & Advance Readings

In advance of the design workshop, all participants produced a one-or-two page topic paper to be shared with the other attendees on either:

* A specific problem that they wanted to solve with a web-of-trust solution, and why current solutions (PGP or CA-based PKI) can't address the problem?
* A specific solution related to the web-of-trust that you'd like others to use or contribute to?

Please see the [Topics & Advance Readings directory](topics-and-advance-readings) for a listing of all the papers.

## Complete Papers

The goal for each Rebooting the Web of Trust workshop is publication of three to five white papers:

## [*BTCR DID Resolver Specification*](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/btcr-resolver.pdf) [(Text)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/btcr-resolver.md)
#### Kim Hamilton Duffy, Christopher Allen, Ryan Grant, and Dan Pape

> This describes the process of resolving a BTCR DID into a DID Document. The draft reference implementation is available at https://github.com/WebOfTrustInfo/btcr-did-tools-js (see didFormatter.js). Note that not all steps described in this document are implemented yet.

## [*Decentralized Autonomic Data (DAD) and the three R's of Key Management*](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/DecentralizedAutonomicData.pdf) [(Text)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/DecentralizedAutonomicData.md)
#### by Samuel M. Smith Ph.D. with Vishal Gupta

> This paper proposes a new class of data called decentralized autonomic data (DAD). The term decentralized means that the governance of the data may not reside with a single party. A related concept is that the trust in the data provenance is diffuse in nature. Central to the approach is leveraging the emerging DID (decentralized identifier) standard. The term autonomic means self-managing or self-regulating. In the context of data, we crystalize the meaning of self-managing to include cryptographic techniques for maintaining data provenance that make the data self-identifying, self-certifying, and self-securing. Implied thereby is the use of cryptographic keys and signatures to provide a root of trust for data integrity and to maintain that trust over transformation of that data, e.g. provenance. Thus key management must be a first order property of DADs. This includes key reproduction, rotation, and recovery. The pre-rotation and hybrid recovery methods presented herein are somewhat novel.

## [*Decentralized Identifiers v1.0*](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/did-spec-1.0.pdf) [(Text)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/did-spec-1.0.md)
#### A Status Note

> The Decentralized Identifiers specification editors and implementers spent some time at Rebooting the Web of Trust 6 processing the remaining issues in the issue tracker. This document summarizes the proposed resolutions that the group has put forward to resolve all of the DID specification issues that were submitted before 2018-03-05.

## [*Exploring Sustainable Technology Commons using Appreciative Inquiry*](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/sustainable-commons.pdf) [(Text)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/sustainable-commons.md)
#### by Heather Vescent, Kaliya “Identity Woman” Young, Adrian Gropper, and Juan Caballero

> Technology commons come in a variety of flavors and have achieved varying levels of financial success. For-profit corporate activities have in few historical cases been set up with a financial feedback mechanism to support the commons upon which they depend and capitalize. Why do the commons and the technology sectors’ available forms of capitalism act as incompatible as oil and water, even though they support each other’s aims? When capitalist benefactors support the technology commons that they utilize, it creates a sustainable and thriving commons which enables and supports additional capitalistic technology innovation. Having worked on both sides of the equation, the authors of this piece propose a vocabulary to nourish these interactions between the two sides; identified characteristics of a sustainable technology commons; identified commons models and variations; applied Appreciative Inquiry principles to one commons model; and identified future research areas.

## [*Identity Hub Attestation Flows and Components*](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/identity-hub-attestations.pdf) [(Text)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/identity-hub-attestations.md)
#### by Daniel Buchner, Cherie Duncan, John Toohey, Ron Kreutzer, and Stephen Curran

> In this document, we define a set of user flows and describe the associated Action Objects that support a Hub-centric approach to the request, issuance, presentation, verification, and revocation of interoperable attestations. This document extends the [Identity Hub Explainer](https://github.com/decentralized-identity/hubs/blob/master/explainer.md).

## [*Introduction to DID Auth*](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/did-auth.pdf) [(Text)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/did-auth.md)
#### by Markus Sabadello, Kyle Den Hartog, Christian Lundkvist, Cedric Franz, Alberto Elias, Andrew Hughes, John Jordan & Dmitri Zagidulin

> The term DID Auth has been used in different ways and is currently not well-defined. We define DID Auth as a ceremony where an identity owner, with the help of various components such as web browsers, mobile devices, and other agents, proves to a relying party that they are in control of a DID. This means demonstrating control of the DID using the mechanism specified in the DID Document's "authentication" object. This could take place using a number of different data formats, protocols, and flows. DID Auth includes the ability to establish mutually authenticated communication channels and to authenticate to web sites and applications. Authorization, Verifiable Credentials, and Capabilities are built on top of DID Auth and are out of scope for this document. This paper gives on overview of the scope of DID Auth, supported protocols and flows, and the use of components of the DID Documents that are relevant to authentication, as well as formats for challenges and responses.

## [*Open Badges are Verifiable Credentials*](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/open-badges-are-verifiable-credentials.pdf) [(Text)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/open-badges-are-verifiable-credentials.md)
#### By Nate Otto & Kim Hamilton Duffy

> We identify use cases and requirements that connect threads of work happening in the Rebooting Web of Trust community around: educational achievement claims (particularly using the Open Badges vocabulary); use of decentralized identifiers (DIDs) within web services where educational claims circulate; and integrating blockchain-reliant verification layers. We illustrate each of these cases with a set of example documents and describe user stories for Open Badges ecosystem software in the roles of Issuer, Host/Backpack, Displayer, and Verifier that need to be implemented in order to enable the capabilities described.

## [*SSI: A Roadmap for Adoption*](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/a-roadmap-for-ssi.pdf) [(Text)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/final-documents/a-roadmap-for-ssi.md)
#### By Moses Ma, Claire Rumore, Dan Gisolfi, Wes Kussmaul & Dan Greening (Senex Rex)

> This document proposes the formation of a short-term team to develop consistent messaging for the Self-Sovereign Identity (SSI) market. It will target key stakeholders who would actively promote SSI adoption. The goal is to create an SSI market roadmap. This roadmap will help SSI leaders, standards bodies, developers, academics, media, and investors coordinate and clarify their messaging for the market, to accelerate the SSI adoption. 

## Complete Rebooting the Web of Trust Listing

A different repository is available for each of the Rebooting the Web of Trust design workshops:

* [Rebooting the Web of Trust I: San Francisco (November 2015)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust)
* [Rebooting the Web of Trust II: ID2020 - New York City (May 2016)](https://github.com/WebOfTrustInfo/ID2020DesignWorkshop)
* [Rebooting the Web of Trust III: San Francisco (October 2016)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-fall2016)
* [Rebooting the Web of Trust IV: Paris (April 2017)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2017)
* [Rebooting the Web of Trust V: Boston (October 2017)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-fall2017)
* [Rebooting the Web of Trust VI: Santa Barbara (March 2018)](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018)
* [Rebooting the Web of Trust VII: Toronto (September 2018)](https://github.com/WebOfTrustInfo/rwot7-fall2018)

## License

All of the contents of this directory are licensed [Creative Commons CC-BY](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust/blob/master/final-documents/LICENSE-CC-BY-4.0.md) their contributors.
