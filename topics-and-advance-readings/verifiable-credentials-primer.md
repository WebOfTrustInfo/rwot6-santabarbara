# A Verifiable Credentials Primer
***by Manu Sporny, Digital Bazaar***

***NOTE***: "Verifiable Claims" are now known as "Verifiable Credentials".
The W3C Verifiable Claims Working Group's experience with using the term
"Verifiable Claims" demonstrated that it led to confusion in the marketplace.
The group has since found consensus in shifting to use the term
"Verifiable Credentials", which contain "Claims".

## Introduction

It is currently difficult to transmit credentials such as driver's licenses,
proofs of age, education qualifications, and healthcare data, via the
Internet in a way that is verifiable yet protects individual privacy.

Starting in 2013, the
[W3C Credentials Community Group](https://w3c-ccg.github.io/) started to
work in earnest on solutions in this space followed shortly thereafter by the
[Rebooting Web of Trust Community](http://www.weboftrust.info/)
and
[W3C Verifiable Claims Working Group](https://www.w3.org/2017/vc/).
These groups, composed of 150+ individuals and organizations, are currently
focused on the creation, storage, transmission, and verification of digital
credentials via the Internet.

This document is a primer for those that want to learn about the
Verifiable Credentials initiative, the use cases and ecosystem,
a basic overview of the technology, and how to get involved.

## Use Cases

Verifiable Credentials are useful when a person needs to prove that they are:

* above a certain age,
* capable of driving a particular motor vehicle,
* require a particular medication,
* trained and certified as an electrician,
* professionally licensed to practice medicine, and
* cleared to travel internationally.

The use cases above are merely a high-level introduction to the problem
space. Readers that would like to explore the use cases in more detail
are urged to read the
[Verifiable Claims Working Groups' Use Cases](https://w3c.github.io/vc-use-cases/)
document.

## Ecosystem

The Verifiable Credentials ecosystem is composed of four primary roles:

* The ***Issuer***, who issues verifiable credentials about a specific
  ***Subject***.
* The ***Holder*** stores credentials on behalf of a ***Subject***.
  ***Holders*** are typically also the ***Subject*** of a credential.
* The ***Verifier*** requests a ***profile*** of the ***Subject***. A
  ***profile*** contains a specific set of credentials. The ***verifier***
  verifies that the credentials provided in the profile are fit-for-purpose.
* The ***Identifier Registry*** is a mechanism that is used to issue
  identifiers for ***Subjects***.

A visual depiction of the ecosystem above is shown below:

<a href="https://w3c.github.io/vc-data-model/">
  <img src="https://rawgithub.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/master/topics-and-advance-readings/verifiable-credentials-primer-diagrams/ecosystem.svg" width="100%" height="400">
</a>

## Claims, Credentials, and Profiles

The ecosystem roles exchange data that enables the realization of the previously
mentioned use cases. The data that is exchanged differs based on the roles
participating, but is fundamentally composed of Claims, Credentials, and
Profiles.

A claim is statement about a subject, expressed as a subject-property-value
relationship:

<a href="https://w3c.github.io/vc-data-model/">
  <img src="https://rawgithub.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/master/topics-and-advance-readings/verifiable-credentials-primer-diagrams/claim-simple.svg" width="50%">
</a>


The data model for claims described above is powerful and can be used to
express a large variety of statements. For example, whether or not someone is
over the age of 21 may be expressed as follows:

<a href="https://w3c.github.io/vc-data-model/">
  <img src="https://rawgithub.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/master/topics-and-advance-readings/verifiable-credentials-primer-diagrams/claim-example.svg" width="50%">
</a>

These claims may be merged together to express a graph of information about
a particular subject. The example below extends the data model above by
adding claims that state that Pat knows Sam and that Sam is a student.

<a href="https://w3c.github.io/vc-data-model/">
  <img src="https://rawgithub.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/master/topics-and-advance-readings/verifiable-credentials-primer-diagrams/claim-multiple.svg" width="50%">
</a>

When an Issuer sends data to a Holder, it bundles a set of claims into a
data structure called a credential and digitally signs the data structure:

<a href="https://w3c.github.io/vc-data-model/">
  <img src="https://rawgithub.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/master/topics-and-advance-readings/verifiable-credentials-primer-diagrams/credential.svg" width="50%">
</a>

When a Verifier asks for data from a Holder, the Holder typically bundles a
set of credentials into a data structure called a Profile and digitally signs
the data structure:

<a href="https://w3c.github.io/vc-data-model/">
  <img src="https://rawgithub.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/master/topics-and-advance-readings/verifiable-credentials-primer-diagrams/profile.svg" width="50%">
</a>

The depictions above are a high-level introduction to the data model and gloss
over specifics. Readers that would like to explore the data model in more depth
are urged to read the
[Verifiable Claims Working Groups' Data Model Specification](https://w3c.github.io/vc-data-model/).

## Participating

If you would like to participate in shaping this work, there are multiple ways
to participate:

1. If you want weekly updates and are NOT a W3C Member, or want to participate
   in the more experimental work, you should
   [join the Credentials Community Group](https://www.w3.org/community/wp-login.php?redirect_to=%2Fcommunity%2Fcredentials%2Fjoin). The W3C Credentials Community Group [holds weekly calls that are open to the public](https://w3c-ccg.github.io/).
2. If you want weekly updates and are a W3C Member, you should
   [join the Verifiable Claims Working Group](https://www.w3.org/2004/01/pp-impl/98922/join). The W3C Verifiable Credentials Working Group [holds weekly calls that are open to W3C Members](https://lists.w3.org/Archives/Member/member-vc-wg/2017Apr/0000.html).
3. We hold bi-yearly face-to-face meetings in the spring and fall at
   [Rebooting Web of Trust](http://www.weboftrust.info/)
   and once a year in the fall at the
   [W3C Technical Plenary](https://www.w3.org/participate/meetings).

The groups are very inclusive and welcome input and participation people
from all disciplines and levels of expertise.
