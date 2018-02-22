
# Sidetree Asset Protocol

Using blockchains for anchoring and tracking unique, non-transferable, digital assets is a useful primitive, but the current strategies for doing so suffer from severely limited transactional performance constraints. Sidetree Assets is a Layer 2 protocol for anchoring and tracking assets across blockchains. Sidetree Assets support a variety of DPKI operations. Sidetree Assets, and nodes that implement the protocol, are not another blockchain, and do not require a consensus layer, they run atop any existing blockchain that supports the ability to embed a small amount of data in a transaction.

## System Overview

To generate the global state of Sidetree Assets in accordance with the protocol, a compute node observes implementation-included blockchains to watching for transactions embedded with Sidetree Asset payloads, then applies protocol rules to process them. A valid Sidetree Asset transaction is marked in a recognizable way, and includes the root hash of a Sidetree Asset structure (a Merkle Tree of hashes that correspond to Sidetree Asset object operations).

Both the Sidetree's full Merkle Tree and source data for its leaves are stored in an open, decentralized, content addressable, highly-replicated storage system that anyone can run to provide redundancy of Sidetree Asset source data.

The protocol relies on the ordered nature of blockchain transactions, signed pointers to previous operations, and embedded Merkle proofs to derive a deterministic lineage of Asset operations as they progress through their lifecycle - this is called a Sidetree Asset Trail.

## Sidetree Asset Operations

Sidetree Assets are a form of [Decentralized Identifier](https://w3c-ccg.github.io/did-spec/) (DID) that manifest through blockchain-anchoring DID Document objects (and subsequent deltas) that represent the existence and state of assets. Each update to an asset includes its full operational lineage (creation, update, recovery, etc.) across a blockchain's linear history. Ownership of an Asset is linked to possession of keys specified within the Asset object itself.

The following is a simplified pseudo code example of a Sidetree Asset's JSON text, to help explain the content and functional elements:

```javascript
[
  {
    sig: OWNER_SIG_DELTA_0, // Initial creation of DID
    delta: { RFC_6902_JSON_PATCH },
    recovery: RECOVERY_JSON_DESCRIPTORS
  },
  {
    sig: OWNER_SIG_DELTA_1, // Previous update of DID
    proof: PROOF_OF_DELTA_0,
    delta: { RFC_6902_JSON_PATCH },
    recovery: RECOVERY_JSON_DESCRIPTORS
  },
  {
    sig: OWNER_SIG_DELTA_2, // Latest update of DID
    proof: PROOF_OF_DELTA_1,
    delta: { RFC_6902_JSON_PATCH },
    recovery: RECOVERY_JSON_DESCRIPTORS
  }
  
]
```

System diagram showing op sig links that form a Sidetree Asset Trail:

> NOTE: This graphic is out-of-date, and does not match the description of the explainer. TODO: Update graphic.

![Sidetree Asset Trail diagram](https://i.imgur.com/RbwM1nj.png)

### Creation of a Sidetree Asset

Creation of an Asset is accomplished via the following set of procedures:

1. Generate a JSON-encoded array that includes one member: an object with a `delta` property that describes the initial state of a [DID Document](https://w3c-ccg.github.io/did-spec/#self-managed-did-document), in the delta format specified by [RFC 6902](http://tools.ietf.org/html/rfc6902).
2. Add a `sig` property to the object that is the signature of the initial delta, generated with the owning keys specified in the delta.
3. Hash the Sidetree Asset object and embed it in a Merkle Tree with other Sidetree Asset operations.
4. Create a transaction on the blockchain with the Merkle root embedded within it and mark the transaction to indicate it contains a Sidetree.
5. Store the Merkle tree source and all Asset objects in the decentralized storage system.
6. OPTIONAL: You may choose to include a `recovery` property in the DID Document, the value of which is an array of recovery descriptor objects.

```javascript
[
  {
    sig: OWNER_SIG_DELTA_0, // Initial creation of DID
    delta: { RFC_6902_JSON_PATCH },
    recovery: RECOVERY_JSON_DESCRIPTORS
  }
]
```
> NOTE: Because every operation beyond initial creation contains pointers and delta state proofs that link previous operations together, only the latest revision of the object must be retained in the decentralized storage layer.

> NOTE: Proof of Asset ownership plus a subset of uses should be possible (because regardless of block inclusion, the owner is verifiable via included key references), but the Asset remains in a pending state until it is confirmed in a block.

### Asset ID

Each Sidetree Asset has an emergent ID, which is composed of the the following combination of values: `MERKLE_ROOT` + `Unicode EN DASH (U+2013)` + `SIDETREE_ASSET_HASH`
  - Example: `did:xcid:1xms56ng0646faf3f43fa33f4faw4ds3-3bv3232k23937m7ds3133f4faw4f43f`


### Updating a Sidetree Asset

To update an Asset, use the following procedures:

1. Create a new Asset operation object to append to the Asset's JSON array
2. Add a `delta` property to the operation object with the value being an object that includes any changes to the DID Document, encoded in the format specified by [RFC 6902](http://tools.ietf.org/html/rfc6902)
3. Add a `sig` property to the operation object that is the signature of the initial delta, generated with the owning keys specified in the delta.
4. Add a `proof` property to the operation object with the value being the Merkle Proof that validates the last operation and its inclusion in the blockchain.

## Sidetree Asset Processing Rules

Assets are processed by protocol-enforcing compute nodes that observes the chain and apply the protocol rules to transactions marked as bearing Sidetree Assets. When a transaction is found, the node follows this procedural rule set

#### Walking the Chain

**1**. Secure a copy of the target blockchain and listen for incoming transactions

**2**. Starting at the genesis entry of the blockchain, begin processing the included transactions in order, from earliest to latest.

#### Inspecting a Transaction

**3**. For each transaction, inspect the property known to bear the marking of a Sidetree Asset. If the transaction is marked as a Sidetree Asset, continue, if unmarked, move to the next transaction.

**4**. Locate the Sidetree Asset's Merkle Root within the transaction.

#### Processing the Sidetree

**5**. Fetch the Sidetree's Merkle Tree from the decentralized storage system.

**6**. Fetch each of the Merkle Tree's leaf objects from the decentralized storage system. If a leaf object is not found in the decentralized storage system, skip and proceed with the next leaf.

#### Evaluating a Leaf

*__If the asset contains just one operation:__*

**7**. The object shall be treated as a new Asset registration.

**8**. Ensure that the entry is signed with the owner's specified key material. If valid, proceed, if invalid, discard the leaf and proceed to the next.

**9**. Generate a state object using the procedural rules in the "Processing Asset Operations" section below, and store the resulting state in cache.

**10**. Pin the asset leaf for retention in the decentralized storage medium.

*__If the asset contains multiple operations:__*

**7**. Retrieve the last Asset state from cache.

**8**. Evaluate the incoming Asset entry to determine if it is a fork, and if the fork supersedes the previously recognized Asset state:

  1) Begin comparing hashes of current asset state operations against the incoming asset update's operations at index 0.
  2) If during iteration and comparison of operation hash equality an operation index is found to be divergent from the current Asset state, the incoming Asset represents a fork. Halt iteration and proceed to handle the incoming update as a fork.
  3) The forking operation is valid if it:
      - Includes a valid `proof` that establishes linkage to the last known good operation's Merkle Root.
      - Is signed by keys that were known-valid in the operation index preceding the fork index __OR__ the incoming fork operation contains a valid `recovery` of the asset. (to assess an operation for recovery, see the section "Evaluating Recovery Attempts")
  4) If the fork is invalid, discard the leaf and proceed to the next. 

**9**. Attempt to update the Asset's state (see "Processing Asset Updates" for rules):

- If the incoming Asset entry is a valid, superseding fork:

    attempt to update the cached Asset's state from the index of the fork's occurrence. If all fork operations are valid and processed without error or violation of protocol rules, save the resulting asset state to cache, if the fork evaluation fails, discard the leaf and proceed to the next. 

- If the incoming Asset entry is a non-conflicting update:

    Attempt to update the current Asset state from the the first new operation of the incoming Asset entry. If all new update operations are valid and processed without error or violation of protocol rules, save the resulting asset state to cache, if the fork evaluation fails, discard the leaf and proceed to the next.

#### Processing Asset Updates

> **NOTE: the following section must be modified to reflect other updates**

In order to update an Asset's state with that of an incoming Asset entry, various values and objects must be examined or assembled to validate and merge incoming operations. The following the a series of steps to perform to correctly process, merge, and cache the state of an Asset:

##### If processing from 0 index (the initial Asset registration operation) of the Asset object:

**1**. Create and hold an object in memory that will be retained to store the current state of the Asset.

**2**. Store the Asset ID in the cache object. The Asset ID is a combination of the Asset's genesis operation Merkle Root and the hash of the Asset object itself, as described in the [Asset ID](#asset-id) section.

**3**. Use the `delta` value of the Asset to create the initial state of the DID Document via the procedure described in [RFC 6902](http://tools.ietf.org/html/rfc6902). Store the compiled DID Document in the cache object. If the delta is not present, abort the process and discard as an invalid DID.

**4**. Verify that the `sig` value is a signature from one of the keys in the compiled DID Document.

**5**. If the `recovery` field is present in the Asset, store any recovery descriptor objects it contains as an array in the cache object.

**6**. Store the source of the Asset in the cache object.

##### If processing any operation beyond index 0:

**1**. Validate that the object's proof field is present, and its value is a proof that links to the last operation's transaction root.

**2**. If the field `recover` is present on the Asset, the operation is initiating a recovery of the Asset. Process the value of the `recover` field in accordance with the recovery process defined by the matching `recovery` descriptor. If the recovery attempt is validated against the matching recovery descriptor, proceed. If there is no matching descriptor, or the recovery attempt is found to be invalid, abort, discard the entry, and revert state to last known good.

**3**. If no recovery was attempted, validate the Asset operation `sig` with one of the keys present in the DID Document compiled from the Asset's current state. If a recovery was performed, skip step this and proceed.

**4**. Use the `delta` present to update the compiled DID Document object being held in cache.

**5**. If the `recovery` field is present in the Asset, store any recovery descriptor objects it contains as an array in the cache object.

**6**. Store the source of the new Asset source in the cache object.

## Implementation Pseudo Code

```javascript
function getRootHash(txn){
  // Inspect txn, and if it is a Sidetree-bearing asset, process the tree 
}
async function getTreeData(rootHash) {
  // Fetch tree source data from decentralized storage, return array of leaves.
  // If not found warn: "Processing Warning: tree not found"
};
async function getLeafData(leafHash) {
  // Fetch and return asset source data from decentralized storage.
  // If not found warn: "Processing Warning: asset not found"
};
async function getAssetState(id){ ... };
async function validateOpSig(op) { ... };
async function validateOpProof(index, asset) { ... };
async function validateFork(state, update, forkIndex) { ... }
async function updateState(state, update, startIndex) { ... }
function mergeDiff(doc, diff) { ... };
function generateOpHash(op){ ... }


async function processTransaction(txn){
  var rootHash = getRootHash(txn);
  if (rootHash) {
    var leaves = await getTreeData(rootHash);
    leaves.forEach(async (leafHash) => {
      await processLeaf(rootHash, leafHash);
    });
  }
}

  async function processLeaf(rootHash, leafHash) {
    var asset = await getLeafData(leafHash);
    if (!asset || !Array.isArray(asset) || !asset.length) {
      throw new Error('Protocol Violation: asset is malformed');
    }
    if (asset.length === 1) {
      return await processGenesisOp(rootHash, leafHash, asset);
    }
    else {
      return await processUpdate(asset);
    }
  }

  async function processGenesisOp (rootHash, leafHash, asset){
    var id = rootHash + '-' + leafHash;
    var state = await getAssetState(id);
    if (state === null) {
      var genesis = asset[0];
      if (!await validateOpSig(genesis)) {
        throw new Error('Protocol Violation: operation signature is invalid');
      }
      return await setAssetState(id, {
        id: id,
        src: asset,
        doc: mergeDiff({}, genesis.delta),      
        recovery: genesis.recovery || []
      });
    }
  }

  async function processUpdate (update){
    var id = update[1].proof.id;
    var state = await getAssetState(id);
    var forkIndex;
    var forked = state.src.some((op, i) => {
      if (op.proof.leafHash !== generateOpHash(update[i])) {
        forkIndex = i;
        return true;
      }
    });
    if (forked){
      if (await validateFork(state, update)) {
        return await updateState(state, update, forkIndex);
      }
    }
    else if (update.length > state.src.length) {
      return await updateState(state, update, update.length);
    }
    else throw new Error('Protocol Violation: update discarded, duplicate detected');
  }
```

# Open Questions

As an early WIP, this protocol may require further additions and modifications as it is developed and implemented. This is the list of topics, ideas, and discussions that have been considered, but not yet included in the proposed spec.

## DDoS Mitigation

Given the protocol was designed to enable unique asset rooting and DPKI operations to be performed at 'unfair' volumes with unit costs that are 'unfairly' cheap, the single most credible issue for the system would be DDoS vectors.

What does DDoS mean in this context? Because asset IDs and subsequent operations in the system are represented via embedded tree structures where the trees can be arbitrarily large, it is possible for protocol adherent nodes to create and broadcast transactions to the underlying blockchain that embed massive sidetrees composed of leaves that are not intended for any other purpose than to force other observing nodes to process their asset operations in accordance with the protocol.

The critical questions are: can observing nodes 'outrun' bad actors who may seek to clog the system with transactions bearing spurious sidetrees meant to degraded system-wide performance? Can an attacker generate spurious trees of asset ops faster than observing nodes can fetch those tree/leaf/source data and process the operations? Without actually running a simulation yet, it's important to consider what mitigations can be put in place to assure that, assuming an issue exists, it can be overcome.

At a certain point, the attacker would be required to overwhelm the underlying chain itself, which has its own in-built organic price-defense, but it's possible that the Layer 2 nodes can be overcome before that begins to impact the attacker.

### Mitigation Ideas

##### Max Tree Depth

A very basic idea is to simply limit the depth of a protocol-adherent sidetree. The protocol could specify that sidetrees that exceed a maximum depth are discarded, which would limit the ability of all participants to drop massive trees on the system. At its core, this mitigation strategy forces the attacker to deal with the organic economic pressure exerted by the underlying chain's transactional unit cost.

> NOTE: large block expansion of the underlying chain generally creates a Tragedy of the Commons spam condition on the chain itself, which negatively impacts this entire class of DDoS protection for all L2 systems. Large block expansion may exclude networks from being a viable substrate for sidetree assets, if this mitigation strategy was selected for use.

##### Leaf-level Proof-of-Work

Add a requirement to the protocol that each leaf be required to show a specified or algorithmically computed level of proof-of-work for nodes to recognize the leaf as a valid submission.

By requiring the leaf hash submitted in a sidetree to being with N level of leading 0s, it may be possible to degrade the ability of bad actors to effectively spam the system with useless sidetrees with massive numbers of ops. The user-level outcome would be that someone using the system to do an update of their human identity's DID would hash the update object with an included nonce on their local device until it satisfied the requisite work requirement, then have it included in a sidetree. Nodes would discard any leaves that did not meet the require work level.

