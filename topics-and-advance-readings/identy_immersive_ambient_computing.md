## Identity System for Immersive and Ambient Computing
by Alberto Elias

## Introduction

There are two trends that are seeking to transform how we interact with technology and even function as a society.

With IoT (Internet of Things) and AI (Artificial Intelligence), we are bringing technology everywhere. It lets us build driverless transportation systems and intelligent everyday objects. With all kinds of sensors fitted everywhere, even on our bodies, Gartner states that in 2020 there will be more than 20 billion IoT devices, up from 8 billion in 2017. And there are still 2 billion people who do not even own a mobile device yet. 

Billions of new devices will be part of our interconnected networks, and we will be interacting with technology in a deeper and more meaningful manner. 

The other trend is the advent of XR (Mixed Reality), encompassing both Virtual and Augmented Reality. It is a whole new interface into technology, and a whole new dimension to foster innovation. It allows for new ways to communicate ideas, and new opportunities as we explore how to adapt our current interfaces.

This brings new challenges as to how we can interact with technology more effectively, but also poses even stronger privacy, censorship and security concerns.

Lately, we have seen how the technology sector is dominated more and more by giants like Google, Amazon, Facebook and Apple. These are companies that actively, at a greater or lesser extent, attempt to force their walled gardens on people. As technology covers an ever-growing piece of our lives, this becomes more of an issue due to the restraints it imposes on our freedom. We have become their products and are in their hands.

We also risk widening the economic gap, as not being able to access this network of devices would leave people at a clear disadvantage. It is also of vast importance to keep folks with every kind of disability in mind as no one must be left behind.

These are big upcoming changes and a whole set of accompanying risks that together offer the opportunity to transform human-computer interaction. We must seek to make good use of this transformation and take the chance to implement a platform that is focused on humans.
This is our chance to bring back the initial vision of the Internet, a decentralized network where the different peers had similar power, instead of most connections mainly going through the servers of very few big corporations. It is our chance to build a platform where users are treated as humans, truly owning the different aspects of their identity and without discrimination. It is our chance to build a user interface that is capable of blending physical and digital reality without turning humans into products.

We need an open, safe and private platform for all technology that guarantees equal opportunities for everyone and provides a great experience. And the Web is a great starting point as it’s the most open and universal platform out there.

Based on this philosophy, Holonet is a set of tools to make the Web the platform for ambient and immersive computing. Tools to act as a bridge from the current Web to the social 3D Web, where people own their identities.

# Identity

To fully comply with all the requirements mentioned in the previous section (great experience, security, privacy…), a great identity system is a must. Holonet brings forward the concept of Virtual Personas, self-sovereign identities that work seamlessly with immersive and ambient computing.

Virtual Personas are the core block at Holonet’s center. Now that technology and nature are indistinguishable, it stops making sense to have an identity for the physical world, and multiple identities for each online silo. Signing in with different accounts every time we visit an immersive 3D world, or we bump into an AR interface down the street is a terrible user experience. There’s a seamless transition from one Holonet site to another.

This platform change brings upon us a great chance to change how we manage information, giving humans back ownership over their identities, ownership of what makes them, them. We will be sharing even more information and ensuring privacy is necessary. Virtual Personas can selectively share discreet pieces of data about them with specific sites, to get a personalized experience without giving over control over the identity. It is also possible to have multiple Virtual Personas to be anonymous in certain contexts.

Another important aspect is that humans need to feel safe, both in the physical and the digital world. This means 3 things:
-	Appropriating/Stealing/Imitating an identity is almost impossible, with an easy, quick and secure recovery system.
-	Having control over their near view, so different applications are not summoning bothersome objects in front of them and they have an easy way out to a comfortable place.
-	Being able to avoid harassment by making use of the control of the near view and being able to decide with whom they share a space (only with friends, family, people you know, or with everyone).

Even though we are human centered, Virtual Personas work for all kinds of identities, as they are capable of having multiple owners. They can be tied to organizations, bots or even blockchain smart contracts.

Virtual Personas are an open source identity system based on open standards, thought out to be interoperable. You can carry them everywhere and use them with any device.

Having a global identity in a virtual universe is necessary to build a universal inventory system. There are many use cases, like games or art, where we will want to associate digital assets to our identities. There are already multiple markets to buy and sell these assets, and there needs to be complete trust about who created and owns any such asset.

To summarize, a Virtual Persona is a self-sovereign global identity for the blended digital-physical world.

## Development

Virtual Personas are an identity system where people own all their data and have full control over who can access and modify it. It is based on decentralized technologies, both blockchain and decentralized file protocols. We are following a currently worked on Web specification called DIDs. Its first version is almost final.

The DID is a content address that points to a DID document that is hosted in a decentralized file system such as IPFS or Dat. The DID document can hold certificates that prove the information stated within it, but also the ownership of blockchain addresses.

Blockchains can bring in value as they allow identities to easily handle payments in different cryptocurrencies, hold virtual property or interact in new token-based protocols. They are not efficient enough to have an identity system that is solely blockchain based, and they are not Web compliant, but this identity system can work off-chain, and do all necessary transactions on-chain easily. Also, many of their shortcomings are being worked on, like what Ethereum is doing with the transition to Proof or Stake or Plasma.

Currently, DIDs would be public keys which are very hard to remember. DNS is a centralized system, but both IPFS and Dat are working to make their decentralized protocols work better with DNS. This could be a temporary possibility while decentralized naming systems like Blockstack and ENS are further developed.

Verifiable Claims would also work just fine with this system, which will allow entities to prove facts about their identities by providing a proof from a 3rd party (like a government issued ID), without having to reveal information that wasn’t solicited.

For the 3D Web, some other properties are needed in the DID document. A clear example would be a GLTF formatted avatar, so the identity can have a single avatar for all sites. We are going to have virtual objects that can be possessed by identities and there are several blockchain projects to handle property which can be held and transferred by an identity.

Authentication is another important element. We have the Credential Management API, though it only supports passwords and federated logins. It is compatible with creating custom credentials, so a new key-pair system could be implemented. A site could check that a person is the owner of a key using the DID. The site sends a message encrypted with the DID’s public key, the owner decrypts it with their private key, and sends it back encrypted with the site’s public key.

From there, we would need to start working on a browser API for identity management. This would provide features such as soliciting permissions to read specific information fields and handling social aspects like adding friends, following another identity or adding new information. The team behind Beaker Browser, a Dat based browser, are building a social API based on Dat archives.
There are different DID methods, all interoperable with each other thanks to the DID Resolver. Holonet is building on top of uPort for now, as it comes close to the needs mentioned above. We have extended it by issuing a Verifiable Claim (VC) from the Virtual Persona creation tool. This VC adds information like a path to the GLTF avatar, height and nickname. Holonet users can then visit any Holonet site with their uPort ID.

uPort implements a way to recover an identity in case you lose your phone associated to your ID. They are working on a direction called social revocation where there are other trusted identities, such as friends and families, who are needed to accept the revocation of current keys and issuance of new keys.

DIDs also support having multiple owners of an identity, which works great for organizations and bots. It is also important for underage humans, so their guardians can have control over their identities.

To sum up, the benefits of this identity system are:
•	The identity can be trusted, as it is provable that a DID points to a DID document, and said document is owned by a set of keys.
•	There can be provable Verified Claims from reputed third parties that can add all kinds of identity information such as age, if it is a human, passport, payment methods etc.
•	Virtual Personas are great, not only for humans, but also organizations and bots. Everything, including all devices, can have one or more Virtual Personas associated to them.
•	It is a very secure implementation as it is hard to take control of an identity, and very easy to revoke that control from malevolent parties.
•	Privacy can be ensured, as only the appropriate keys can modify or view the data in the DID document. Humans decide what to share with whom, and the data that is shared is minimized as much as possible. (For example, you would not share your date of birth, but only the fact that your over 18)
•	It is censorship resistant, as Virtual Personas are built on top of decentralized networks, and DIDs are interoperable with other. This means, that in the case that one decentralized network is compromised, Virtual Personas can be transferred to another network.
•	They work everywhere, with all devices, and with all sites. You carry your Virtual Persona with you, and authenticate with whatever service you attempt to use, wherever you are.

