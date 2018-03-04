# A Demonstration of the Veres One Blockchain

Contributors: David I. Lehn, Manu Sporny, David Longley, Matt Collier, and
Chris Webber

## Introduction

The Veres One Project envisions a world where people and organizations
control their identifiers and their identity data. The Veres One
Blockchain is the worlds first public, permissionless, fit-for-purpose
blockchain optimized for identity on the Web. You can learn more about
Veres One by reading the [Veres One Primer](veres-one-primer.md).

This document outlines a demo of the Veres One Blockchain features and how
it is implementing technical output from the Rebooting the Web of Trust
events as well as the W3C Credentials Community Group and the
W3C Verifiable Claims Working Group.

## Demo

The demo requires you to download and install the DID client:

```
git clone https://github.com/digitalbazaar/did-client.git
cd did-client
npm install
```

Once you have the DID client installed, you can go through the following
demo:

### Creating a Veres One DID

You can generate an off-chain Veres One DID by performing the following
command:

```
./did generate
```

The output of the command above should look something like this:

```
[Veres One][test] Generating a new Veres One DID...
[Veres One][test] Generating keypair... (5-15 seconds)
[Veres One][test] DID: did:v1:test:nym:2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou
[Veres One][test] Storing DID Document on disk...
[Veres One][test] DID Document stored in: /home/YOURNAME/.testdid/did-v1-test-nym-2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou.jsonld
[Veres One][test] Local DID generation successful.
[Veres One][test] To register the DID globally, use the `register` command.
```

Why this is important: Veres One DIDs can be used as pairwise pseudonymous
identifiers and may exist entirely off chain.

### Registering a Veres One DID

You can register the DID you created in the previous step by issuing the
following command:

```
./did register YOUR_DID
```

For example:

```
./did register did:v1:test:nym:2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou
```

The output for the command above should look something like this:

```
[Veres One][test] Preparing to register a DID on Veres One...
[Veres One][test] Generating Equihash proof of work... (60-120 seconds)
[Veres One][test] Attaching LD-OCAP invocation proof...
[Veres One][test] Registering DID on Veres One...
[Veres One][test] DID registration send to ledger.
[Veres One][test] Please wait ~15-30 seconds for ledger consensus.
[Veres One][test] You may use the `info` command to monitor the registration of your DID.
```

Why this is important: Veres One DIDs are useful when others can look them
up and get important cryptographic information from the DID Document associated
with the DID.

### Retrieving a Veres One DID Document

You can retrieve the DID you registered above by retrieving it from the
Veres One Network:

```
./did get YOUR_DID
```

For example:

```
./did get did:v1:test:nym:2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou

```

Why this is important: Retrieving a DID Document from the Veres One Network
verifies that what you think you wrote to the network was actually written
to the network.

### Adding an Authentication Key

Your DID Document starts out with an authentication key. You can add an
additional authentication key like so:

```
./did authn-add YOUR_DID -p YOUR_PUBLIC_KEY
```

For example:

```
./did authn-add did:v1:test:nym:2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou
  -p 7MJbwTVS6bMzMFnDaNYVWH64NV8yHxgdhCN3auUJSyym
```

The output from the command above will look something like this:

```
[Veres One][test] Storing DID Document on disk...
[Veres One][test] DID local update successful.
[Veres One][test] Preparing to update a DID Document on Veres One...
[Veres One][test] Generating Equihash proof of work... (60-120 seconds)
[Veres One][test] DID Document stored in: /home/YOURNAME/.testdid/did-v1-test-nym-2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou.jsonld
[Veres One][test] Attaching LD-OCAP invocation proof...
[Veres One][test] Updating DID Document on Veres One...
[Veres One][test] DID Document update sent to the Veres One ledger.
[Veres One][test] Please wait ~15-30 seconds for ledger consensus.
[Veres One][test] You may use the `info` command to monitor the registration of your DID.
```

Why this is important: Adding authentication keys allows you to provide
access for additional devices (e.g. mobile phone, desktop, laptop). It also
enables you to rotate cryptographic material.

### Removing an Authentication Key

You can remove authentication keys using the following command:

```
./did authn-remove YOUR_DID YOUR_PUBLIC_KEY_ID
```

For example:

```
./did authn-remove did:v1:test:nym:2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou
  did:v1:test:nym:2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou#authn-keys-2
```

The output from the command above will look something like this:

```
[Veres One][test] Storing DID Document on disk...
[Veres One][test] DID local update successful.
[Veres One][test] Preparing to update a DID Document on Veres One...
[Veres One][test] Generating Equihash proof of work... (60-120 seconds)
[Veres One][test] DID Document stored in: /home/YOURNAME/.testdid/did-v1-test-nym-2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou.jsonld
[Veres One][test] Attaching LD-OCAP invocation proof...
[Veres One][test] Updating DID Document on Veres One...
[Veres One][test] DID Document update sent to the Veres One ledger.
[Veres One][test] Please wait ~15-30 seconds for ledger consensus.
[Veres One][test] You may use the `info` command to monitor the registration of your DID.
```

Why this is important: Removing authentication material enables you to
rotate keys and remove keys from compromised devices.

### Using an Accelerator to Perform Operations

Performing operations on the Veres One Network requires you to prove that you
are not attacking the network. You can prove this in one of two ways: 1)
perform a proof of work, or 2) get an Accelerator to vouch for you. All
examples previous to this one used the first approach.

This demonstration uses an accelerator to register a DID. To do this,
you must register a DID with the Accelerator and typically pay them a
fee to perform accelerated operations before issuing this command:

```
./did generate --register
  --auth YOUR_ACCELERATOR_REGISTERED_DID
  --accelerator HOSTNAME
```

For example:

```
./did generate --register
  --auth did:v1:test:nym:2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou
  --accelerator genesis.testnet.veres.one
```

The output from the command above will look something like this:

```
[Veres One][test] Generating a new Veres One DID...
[Veres One][test] Generating keypair... (5-15 seconds)
[Veres One][test] DID: did:v1:test:nym:syrM5dv8ZXsaM9gAB8BKhYZou2xQn7AKZpGo8no3zvUG
[Veres One][test] Storing DID Document on disk...
[Veres One][test] DID Document stored in: /home/YOURNAME/.testdid/did-v1-test-nym-2xQn7AKZpGo8no3zvUGsyrM5dv8ZXsaM9gAB8BKhYZou.jsonld
[Veres One][test] Local DID generation successful.
[Veres One][test] Attaching LD-OCAP invocation proof...
[Veres One][test] Attaching Accelerator update proof...
[Veres One][test] Registering DID on Veres One...
[Veres One][test] DID registration send to ledger.
[Veres One][test] Please wait ~15-30 seconds for ledger consensus.
[Veres One][test] You may use the `info` command to monitor the registration of your DID.
```

Why this is important: Proof of work on the production network takes a
very long time to perform (multiple hours). Accelerators bypass the proof of
work in exchange for a monetary contribution, which is then used to fund
network operations. This demo also demonstrates the use of Linked Data
Capabilities in a network that is nearing production.

# Learning More

This demonstration overview showed how one can use the Veres One Network to
generate, register, and get Veres One DIDs. It also showed authentication
key addition and removal as well as the use of Accelerators and Linked Data
Capabilities to perform fast modifications to the ledger and delegation of
responsibilities.

Readers that would like to dive into the technical details should read the
[Veres One DID Method](veres-one-did-method.md) paper.

You can learn more about the Veres One Project by visiting the
[Veres One Website](https://veres.one/).
