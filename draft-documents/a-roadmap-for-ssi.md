# SSI: A Roadmap for Adoption
> A Journey from huh? to DUH!

#### Authors
* Moses Ma, FutureLab
* Claire Rumore, FutureLab
* Dan Gisolfi, IBM
* Wes Kussmaul, Reliable Identities, Inc

## Abstract
The self-sovereign identity developer community needs to get
serious about paving a path towards broad adoption. Success demands intentional activities that will seeding a network effect. The goals need to be made clear: (i) a better approach to communicating the core concept and its benefits, (ii) the production of tools to assist in the development of compelling applications, (iii) guidance for the deployment of products that produce WOWs that stimulate media interest and viral propagation. All of this together should lead to the formation of critical mass in terms of end users and industry support.

## Problem
A vibrant community of technical thought leaders have been working diligently outside the traditional organizational fray that usually works on standards for topics as broad and complex as identity. After  almost twenty-five years, the concepts behind the phrase *Web of Trust* have morphed into a vision for decentralized self-sovereign identity. This same vibrant community is no longer outside-looking-in but now at the center of a movement that is ripe for maturation. However, this community has the potential of falling victim to the deep thinking character traits that yielded the foundational building blocks we have today. There will always be complex non-trivial problems to solve. The goal is to make sure there exists a well defined and justified need to solve them. This implies that at some point this community needs to ask the question "when and how do we motivation adoption?" *The answer is now!* 

## Audience
This paper is targeted first and foremost at the Self-Sovereign Identity (SSI) technical community who needs become a enabler and not a distraction to broad adoption. There will always be hard problems to solve, but in order to have the opportunity to work on non-trivial and interesting technical problems we must come together as a community to define and execute on a roadmap that hides the technical complexity of our vision, and addresses the needs for a seamless experience for both developers and users (citizens). 

Specifically, this paper is targeted at the early adopters within a minimal viable community of stakeholders that share a common interest in the maturation of decentralized self-sovereign identity:

* Incubation thought leaders at ground zero that are passionate about bringing Self-Sovereign Identity (SSI) to maturity.
* Participants in open standards organizations 
* Participants working on open source code based on those open standards
* Early adopters within the developer community 
* Change agents within the media, enterprise and public sectors
* University and research institutes 
* Forward thinking venture capital investors and incubators

## Goals
This paper is intended as a discussion starter. The community is mainly comprised of volunteers working remotely in their spare time. The objective is to help frame an approach that will place concentrated focus on key success factors and deliverables. Our discussion not only suggests best practices for businesses to create a SSI strategy but also helps to debunk some of the myths that have arisen due to a lack of understanding which of course is a direct result of our failure to simplify and articulate the concepts and benefits of SSI for the masses. We will touch on the necessity for toolkits, minimum viable environments (MVE), and interoperable end-to-end exemplars. Specifically, we suggest that attention must be placed on the following goals:

* Outline a better approach for communicating a crisp, cohesive and comprehensive vision of the core benefits of SSI.
* Justify the importance of streamlining the developer experience through tools that improve time to value and assist in the development of compelling applications.
* Shift the focus from longer term ad-hoc brainstorming towards a formal initiative to develop a set of minimum viable reference applications.
* Help find the WOW (the balance between low hanging fruit scenarios and instantly graspable killer app features) that inspires hope and stimulates media interest and viral propagation so that we can win the hearts and minds of a critical mass of stakeholders.

## Success Metrics
To address these goals, the community needs to crystalize a cohesive maturation roadmap (plan) that outlines initiatives which are measurable via key performance indicators. For example:

* The community goal is to see one million DIDs published by March 2019
* The release of a handful of reference applications that provide a down payment on the promise of decentralized identity
* Formalized plans by year end 2018 for the foundational SSI specifications
	* W3C DID
	* W3C VC
	* Oasis DKMS
* Go to Market Resources to support developers by year end 2018
	* Glossary of Terms
	* Convergence of technical primers (tutorials) into a single  getting started kit
	* Communications Kit
		* Cohesive narrative about the initiative and its goals for the Media
		* Common baseline talking points for SSI advocates
	* High impact videos and other demo recordings (i.e.: RWOT)
	* Portfolio of industry specific demonstrations
* Foundational catalysts for adoption
	* Creation of a realistic technology roadmap
	* Adoption of a formal agile project management approach to drive the roadmap
	* Recruitment of foundational partners for a social media platform
		* Operational recruitment of key technologists from Slack, Telegram and RocketChat
		* Ideological recruitment of influential leaders (i.e: Reid Hoffman, Fred Wilson, etc)
		* Get some traction on meaningful support from GitHub and Wikipedia

## Reality Check

We are a community of very passionate and bright individuals who share a common vision about self-sovereign identity (SSI). We have as an open community established the foundational building blocks for bringing the SSI vision to fruition. We witnessing a perfect storm whereby the juxtaposition of the fear of identity related hacks and thief are pervasive; decentralized identity and key management is now possible because of enabling technologies like blockchain; and governments and business are realizes the risks and liabilities associated with centralized identity systems. 

### Preventing Technical Debit

This perfect storm arrives at a time when non-SSI alternatives are also being considered at scale. If these alternatives gain traction inside key adoption communities like DMVs, which are historically slow to change, our failure to focus on SSI adoption will indirectly allow for new alternatives to get entrenched thereby making our adoption challenge more difficult. For example, one of our core worldwide identity instruments, the digital driver license, is being considered by national and state governments worldwide. Unfortunately, the new mobile driver license (mDL) initiative that is being considered by [ISO](https://www.iso.org/standard/41920.html) will yield technical debit within our society that will make the adoption of SSI even more difficult.  The time is now to get focused on an clear and achievable rollout roadmap for SSI technology.    
 
### Resetting Priorities
An honest assessment of the state of our SSI initiative will yield the reality that we are “not ready for prime time”. If we can get the community to agree on short and long term priorities, we have a very good chance to succeed and prevent unnecessary adoption hurdles. So instead of worrying about when/if DNA chips may be used to track humans (which is really a fun and thought provoking topic, and we encourage discussion), we need to focus on:  

* Setting technology available expectations so early adopters can develop plans 
* Hiding the complexity for usage; 
* Solving the Wallet distribution problem
	* Who are the wallet makers 
	* How wallets will be [interoperable and secure](http://www.links.org/files/nspw36.pdf) 

### Debunking Myths

The urgency for a roadmap may be justified best by listening to the naysayers. An unfortunate outcome of a poor communication plan is the rise of myths that need to be discredited. Here are a few examples of unfortunate myths that are already circulating in the media and amongst analysts:

* For example some people believe that blockchain based identity solutions actually store personally identifiable information (PII) on the distributed ledger. This is utterly false. The SSI initiative not only advocates against such poor practices, the community has established several principles including that of *portability* which addresses this issue. A globally unique [decentralized identifier](https://w3c-ccg.github.io/did-spec/#dfn-did) (DID), which is compliant with internet standard [Universally Unique Identifiers](https://en.wikipedia.org/wiki/Universally_unique_identifier) (UUIDs), is used to establish a non-correlatable unique ID. While this DID may be stored on a blockchain and used as mechanism for public key exchange, the actual PII associated with an individual is never placed on a public ledger. This DID is used by an SSI solution to deliver public keys that can be used to verify identity realted credentials that are exchanged privately between willing participants at the edges of the network.
* Another common misconception about the decentralized identity concept is that participation in the system is somehow involuntary. Additionally, it has been said, erroneously, that a decentralized ID could "*never be turned off or blocked*” due to the immutability of the distributed ledgers that underlie decentralized applications. And finally, that it will be impossible to prevent anyone from publishing anything they want about you, and that the immutability of the ledger means a negative review would be part of an indelible permanent record. Implying that once you are associated with a digital key in a world of pertinent memory, anyone can choose to add any information they want about you to the public record that could never be changed.  These misconceptions could not be farther from the truth. The DID specification states clearly that the publishing of any user’s decentralized ID is explicitly controlled and administered by the user/owner. The proposed specification for Verifiable Credentials states plainly that claims are revocable, expirable, and that the policies of both the issuer and holder must be adhered to. It’s assumed that the normal policy for a holder is to approve every credential before acceptance. This means that a competitor, who would not be trusted to make a claim about your business, could not append a negative claim about your business without your explicit approval. This is because both the issuer and holder both have the ability to revoke any claim. 
* Some also misunderstand the concepts behind *Selective Disclosure* (or the Principle of Minimum Disclosure). The true intent here is that a system should follow a minimal disclosure approach that could help with compliance with regulations like HIPAA in the US and GDPR in the EU. This means that users can be in control of private data that they don’t even realize they have, enabling a level of control over personally identifiable data and enabling data privacy at a level heretofore never seen before. 


### Be Proactive 
The reality is that there will always be naysayers and alternatives to our SSI vision. However, it is our responsibility to proactively defend our cause. It is not in our best interest to spend wasteful energy debating. Instead we should focus our attention on awareness and education through positive communications and live exemplars. To be proactive we need a plan.

## Establishment of the Roadmap Tribe

The creation and execution of a roadmap plan requires an execution team. One requirement for success is to organize a set of small teams, *Squads*, into a team of teams called a *Tribe*. The **Roadmap Tribe** would be responsible for defining and executing a project roadmap plan. Each Squad will tackle objectives such as:

* **Portal Development**: Creation and maintenance of a community website.
* **Communications**: Propagation of SSI messaging
* **Domain Interlock**: Interfacing with key standards and open source workgroups.
* **Go-to-Market (GTM) Development**: Create the resources necessary to deliver informational content (presentation, videos, etc)

Initially as single **Scrum-master** can be assigned to drive the workflow and insure timely results across all Squads. If necessary, each Squad could assign it's own Scrum-master.

The volunteers who have initially committed to join this tribe are:

| Group | Person(s) | Note |
| --- | --- | --- | 
| Co-chair | Dan Gisolfi | |
| Co-chair | Moses Ma| |
| Scrum-master | Darrell Duane | |
| Communications Squad | Kate Sills | |
| Communications Squad | Kaliya Young | |
| Communications Squad | Remy Lyon | |
| GTM Development Squad | Alex Preukschat | Invited |
| GTM Development Squad | Wes Kussmaul | |
| Domain Leaders Squad | Sean Bohan | Invited|
| Domain Leaders Squad | David Crocker | | Invited |
| Domain Leaders Squad | Nathan George | Invited |

>NOTE: Squad participation is open and voluntary. Nomination of individuals is not good enough, active and willing participation is required.

## Manifesting some WOWs

Another requirement for success is to create a design process that would lead to a sustainable flow of compelling technologies that provide a “wow” factor, that can form a pipeline of compelling functionality to fortify the value proposition for decentralized identity. An initial set of projects and ideas for “wow prototypes” include:

1. **Community Badges Toolkit**: Produce a Starter Kit for any small or large community to begin to issue verifiable credentials in the form of [OpenBadges](https://openbadges.org). Such a toolkit would be a perfect *Getting Started* toolkit for a Go-to-Market (GTM) package of resources.  

	>NOTE:  The final paper submitted by the [Open Badges are Verifiable Credentials](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018) RWOT Workgroup is suppose to produce a working prototype that can be used to seed this toolkit.

2. **Industry Demos**: Develop a number of vertical industry references. For example:
	* FinTech: A demo of the [CULedger](http://culedger.com) CUID Trust Framework that uses the Hyperledger Indy framework. 
	* Travel and Transportation: A [Dapps](https://coinsutra.com/dapps-decentralized-applications/) that implements one or more  concepts outlined in the [World Economic Forum’s Known Traveler Report](https://www.weforum.org/reports/the-known-traveller-unlocking-the-potential-of-digital-identity-for-secure-and-seamless-travel). 
	
3. **Other Interesting Concepts**: There are a number of other potential reference applications that could be interesting to develop and deploy. 
	* *SuperSignOn*, a decentralized authentication system based on the DID-Auth specification. 
	* *GitHub Authentication* using Verifiable Credentials. 
	* *ICO-LegalAssist* which would use Verifiable Claims as a basis for attestations by attorneys in ICOs. 
	* *IDESG’s IDEF assessment* [tool for receiving badges](https://www.idefregistry.org/)

## Deliverables
A project roadmap should produce the following non-exhaustive list of artifacts:

* Creation of the Roadmap Tribe 
	* Criteria for Success: Goals for the Roadmap Tribe
	* Members and Roles
	* Published Plan/Schedule
* Community Information Portal (i.e.: ssi.org)
	* Go-to-Market (GTM) Resources
		* MythBusters: SSI/VC FAQ Sheet
		* Glossary
		* Sample Presentations
		* Videos
		* Access to subject matter experts
	* WOW Factor: Community Badges Toolkit
	* Dashboard tracking success metrics
	* Best practices for businesses to create a SSI strategy

## Next Steps

* Finalize RWOT paper (this document) as a catalyst for a roadmap.
* Get Organized
	* Duanne and Claire discuss project management
		* Setup tools (i.e. Trello)
		* Schedule cadence (scrum) call
		* Review and refine tribe structure 
	* Establish initial plan/schedule (for standards, communications media kits and GTM materials), that includes the meeting schedule (which will be a minimal time standup meeting once a week, online)
		* Work with Joe to figure out where a SSI.org portal is  organizationally hosted (CCG, RWOT?)
		* Develop a comprehensive glossary of SSI/VC terms

