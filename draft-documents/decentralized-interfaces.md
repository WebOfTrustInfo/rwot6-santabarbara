# Decentralized Interfaces

Authors: Vlad Kahoun (<vlad@signaling.network>), Stephen Curran (<swcurran@cloudcompass.ca>), Sam Curren (<telegramsam@gmail.com>)

## Abstract

This document describes Decentralized Interfaces, what they are, their benefits, use cases and the incentives to create or adopt them. It summarizes a proposal for Decentralized Interfaces and Extensible APIs and related topics.

## Introduction

We are looking for a way to make various entities interoperable through the direct exchange of information and interactions. Our goal is to increase the volume and quality of API-based capabilities by creating a marketplace of agents that can process requests in useful and powerful ways. Such a system will enable people, things and software to cooperate in ever more powerful ways.

To enable an API-driven ecosystem, we need to solve the problem of discoverability, interoperability and understanding of entities across platforms. For that purpose, entities should be able to easily adopt decentralized interfaces and APIs.

## What are Decentralized Interfaces

Traditional APIs are designed for a specific service or entity and are not widely shared or adopted by multiple entities. For example, the Stripe API is for the Stripe service, the AWS API is from AWS and so on. In rare cases, an API is implemented by multiple services - for example, the Wordpress API is implemented by multiple blogging services, not just Wordpress. This allows clients using the API to interact with Wordpress and other blogging services. Our goal with Decentralized Interfaces is to make a reusable API in front of multiple Service implementations the norm.

Decentralized Interfaces enable anyone to describe a very specific role, feature or attribute of an entity in terms of its API. For instance, one single interface can describe what attributes the entity has, what actions (possible interactions) it accepts and what kind of messages it can process and return. Ideally, the definition would include a “certification suite” that includes test data and cases that can be used by API implementers to prove adherence to the API specification.

Decentralized Interfaces are identified by an unique identifier that makes them resolvable and adoptable by entities. The Interface Definition is part of this discovery process, which makes bootstrapping new client code easier.

By adopting an interface, an entity signals its abilities. A Decentralized Interface Client can interact with any entity that adopts it’s target interface. This allows a single client to communicate and interact with many entities without building specialized client code for each.

## Composable Interfaces

A typical Service API contains all the behaviors and abilities of a single entity. We envision a Decentralized Interface to be the definition of a narrow range of features and abilities that encourage entities to combine (“compose”) multiple Decentralized Interfaces into a single service endpoint as an aggregate of its capabilities.

Each Decentralized Interface must be supported in a way that does not interfere with the operation of other supported interfaces at a single service endpoint. To promote reuse, each interface should do one thing and do it well. In particular, a single interface that serves many specialized purposes should be avoided in favor of one interface for each of the specialized purposes.

## Decentralized Interfaces in DID Document Services

A DID Document contains pointers to services that represent the DID. It is anticipated that the success of the DID standard will encourage many new services that wish to build upon the utility of Decentralized Identity.

The use of Decentralized Interfaces allows for each DID service to provide many interoperable functions. This flexibility in interface definition could reduce the total number of services required for a wide variety of interactions.

## Use Cases

While many popular services (AWS, github, flickr, stripe and countless more) implement APIs for their specific service, the use cases we are focusing on are more intended to be more generic and, in general (although not necessarily) smaller in scope. The following are some examples of such micro APIs.

### Business Hours

A service or retail-oriented API that allows businesses to publish their open hours in real-time. This enables a standardized approach for consumers to get accurate business hours information when a standard published set of expected hours will not suffice. Accurate business hours can be made available regardless of the extraneous circumstances - weather, promotions, etc.

Once defined, the API could support a multitude of implementations by Retail-as-a-Service vendors - application developers that build business management solutions for small businesses, as well as custom implementations by larger retailers.

### Food preferences

A simple consumer-oriented API that allows a person to publish their food preferences. The API could be consumed (if you will) by event organizing apps and even queried in ad hoc ways so that those providing food for events know the preferences of the invited guests without having to poll each person.

This real-time query can account for temporary diet restrictions or needs. A currently prescribed short-term medicine may restrict alcohol use, for example.

### AI Services

AIs and other software agents can index interfaces, analyze the state of entities (roles, offerings, needs) and suggest them the most beneficial interactions in regard to their current situation.

For example, different agents can suggest the food to a hungry user depending on his current taste and regardless of whether it is restaurant food, street food, food for delivery or ingredients for user's favorite recipe.

## Ecosystem for Interfaces

Different kinds of entities will need different interfaces which are not possible to predict or create in advance. New interfaces are needed as entities change their character or new kinds of entities are created.

One of the possibilities is to build a network that enables anyone to write and publish his own interface, while other entities can adopt these interfaces with new implementations and also evolve them. The network should create economic incentives for involved parties - API Designers, Implementers and Providers (those that deploy an instance of an implementation of an API).

The possibility to freely create interfaces for any use case, adapt them and combine them enables great flexibility to find novel standards, approaches and patterns of cooperation.

## Future Work

- Decentralized interface definition standards
- Discovery of supported interfaces
- Compatibility, upgradability, and versioning
- Implementation and adoption of underlying APIs
- Test/Certification Tools, conventions and the best practices for APIs
- Ecosystem for Interfaces