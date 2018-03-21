# Recent happenings with Linked Data Capabilities

By Christopher Lemmer Webber

One of the outputs from
[Rebooting Web of Trust Fall 2017](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-fall2017)
was a writeup on
[Linked Data Capabilities](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-fall2017/blob/master/final-documents/lds-ocap.md)
based on discussions from the workshop (and particularly thanks to the
guide of Mark S. Miller's longstanding work on object capabilities).
While the writeup speaks for itself, in short Linked Data Capabilities
provide a way to encode object capability security to linked data
systems.
Much has happened since then.

After the workshop ideas from the paper were reified into
[specification form](https://w3c-ccg.github.io/ld-ocap/)
and the [W3C Credentials Community Group](https://w3c-ccg.github.io/)
has taken on the specification as an official work item of the group.
Some changes have happened in the design of Linked Data Capabilities
from the initial Rebooting Web of Trust paper to the 

Additionally, a
[new example](https://w3c-ccg.github.io/ld-ocap/#introduction) has been
added which expands on the common "car keys" metaphor used to
introduce object capabilities.
The specification also includes an
[analysis](https://w3c-ccg.github.io/ld-ocap/#relationship-to-vc)
of Linked Data Capabilities' relationship to
[Verifiable Credentials](https://w3c.github.io/vc-data-model/),
a work item of the
[Verifiable Claims Working Group](https://www.w3.org/2017/vc/WG/)
(a sister project of the Credentials Community Group).

A [reference implementation in Javascript](https://github.com/digitalbazaar/ldocap.js)
is in progress (current code exists in the
[first-pass branch](https://github.com/digitalbazaar/ldocap.js/tree/first-pass)).
We expect to ship the first alpha versions in the coming weeks.

Veres One's architecture has been adjusted to take full advantage of
Linked Data Capabilities as its primary mechanism for granting
authority to perform operations on the ledger as well as on DID
Documents.
permission to update key materials can be conditionally handed out to
an entity (or entities) and later revoked if deemed appropriate using
Linked Data Capabilities' design.
As for ledger updates, Accelerators also make use of Linked Data
Capabilities.
To prevent spamming the ledger, the costs of an update must somehow
be accounted for.
The traditional way to do this on a blockchain is to use proof of work,
and this is also an option in Veres One, but for those use cases where
expending time and energy on proof of work is less desirable users can
use an "accelerator".
An accelerator is an entity that has been granted a capability to
perform updates on the ledger more quickly.
Accelerators may likewise take advantage of Linked Data Capabilities'
support for delegation, with or without caveats.
For example, we can easily imagine two theoretical accelerators: one
is a for-profit institution which sells accelerated entries on the
ledger and another is a non-profit institution that helps people who
may not have the resources themselves to expend on proof or work or
may not have the funds to pay a for-profit accelerator.
Both of these institutions have good reasons to take advantage of
delegation; the for-profit company may wish to enter into commercial
relationships with other businesses to sell accelerated entries, and a
nonprofit may wish to allow other affiliated nonprofits to issue
credentials as well (for example, perhaps the nonprofit realizes that
local populations have particular needs and wants to allow local
nonprofits to best take care of those needs).
In any of these cases the ability to set caveats (perhaps limiting the
number or rate of entries made) and to revoke delegated capabilities
are highly desirable, and here we find that Linked Data Capabilities
deliver.

While Linked Data Capabilities have immediate use in the space of
decentralized identifiers, we believe that the application space is
very broad.
From social networks to games to financial instruments, we hope and
look forward to bringing the power and improved security of Linked
Data Capabilities to the web at large.
