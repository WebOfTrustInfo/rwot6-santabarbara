did:erc725 method
=================
27th February 2018

Markus Sabadello <<markus@danubetech.com>>,
Fabian Vogelsteller <<fabian@ethereum.org>>,
Peter Kolarov <<pkolarov@finid.me>>

Decentralized Identifiers (DIDs, see **[1]**) are designed to be compatible with any distributed ledger or network (called the target system).
In the Ethereum community, a pattern known as ERC725 (see **[2]**) utilizes smart contracts for standard key management functions.
We propose a new DID method that allows ERC725 identities to be treated as valid DIDs.
One advantage of this DID method over others appears to be the ability to use the full flexibility of Ethereum smart contracts for key management purposes.

## DID Method Name

The namestring that shall identify this DID method is: `erc725`

A DID that uses this method MUST begin with the following prefix: `did:erc725`. Per the DID specification, this string MUST be in lowercase. The remainder of the DID, after the prefix, is specified below.

## Method Specific Identifier

The method specific identifier is composed of an optional Ethereum network identifier with a `:` separator, followed by a Hex-encoded Ethereum ERC725 smart contract address (without a `0x` prefix).

	erc725-did = "did:erc725:" erc725-specific-idstring
	erc725-specific-idstring = [ erc725-network  ":" ] erc725-address
	erc725-network  = "mainnet" / "ropsten" / "rinkeby" / "kovan"
	erc725-address  = 40*HEXDIG

The smart contract address is case-insensitive, but it is recommended to use mixed-case checksum address encoding (see **[3]**).

This specification currently only supports Ethereum "mainnet", "ropsten", "rinkeby", and "kovan", but
can be extended in the future to support arbitrary Ethereum instances (including private ones).

### Example

Example `erc725` DIDs:

 * `did:erc725:2F2B37C890824242Cb9B0FE5614fA2221B79901E`
 * `did:erc725:mainnet:2F2B37C890824242Cb9B0FE5614fA2221B79901E`
 * `did:erc725:ropsten:2F2B37C890824242Cb9B0FE5614fA2221B79901E`

## DID Document

### Example

	{
		"@context": "https://w3id.org/did/v1",
		"id": "did:erc725:ropsten:2F2B37C890824242Cb9B0FE5614fA2221B79901E",
		"publicKey": [{
			"id": "did:erc725:ropsten:2F2B37C890824242Cb9B0FE5614fA2221B79901E#key-1",
			"type": ["Secp256k1SignatureVerificationKey2018", "ERC725ManagementKey"],
			"publicKeyHex": "1a0cb8f32c94921649383b14523cb6df04858cfbd4f77711371321cd8ebd87d72efe02b69ca4b02b35a848404101ad17efbf962441733135cb7d833313c3d37b"
		}, {
			"id": "did:erc725:ropsten:2F2B37C890824242Cb9B0FE5614fA2221B79901E#key-2",
			"type": ["Secp256k1SignatureVerificationKey2018", "ERC725ActionKey"],
			"publicKeyHex": "00e17b0f13af42bd7c992ef991ebd75f8345b5edb8e937eb0c9c3dea80af23448419faa1d7562054e31bf56ab1af485944b3a327085c4502e38d723129fd5cf666"
		}],
		"authentication": {
			"type": "Secp256k1SignatureAuthentication2018",
			"publicKey": "did:erc725:ropsten:2F2B37C890824242Cb9B0FE5614fA2221B79901E#key-2"
		},
		"service": []
	}

## JSON-LD Context Definition

The `erc725` method defines additional JSON-LD terms for the supported ERC725 key types `MANAGEMENT`, `ACTION`, `CLAIM`, and `ENCRYPTION`.

The definition of the `erc725` JSON-LD context is:

	{
		"@context":
		{
			"ERC725ManagementKey": "https://github.com/ethereum/EIPs/issues/725#ERC725ManagementKey",
			"ERC725ActionKey": "https://github.com/ethereum/EIPs/issues/725#ERC725ActionKey",
			"ERC725ClaimKey": "https://github.com/ethereum/EIPs/issues/725#ERC725ClaimKey",
			"ERC725EncryptionKey": "https://github.com/ethereum/EIPs/issues/725#ERC725EncryptionKey"
		}
	}

## CRUD Operation Definitions

### Create (Register)

In order to create a `erc725` DID, a smart contract compliant with the ERC725 standard must be deployed on Ethereum. The holder of the private key that created the
smart contract is the entity identified by the DID. The Ethereum network identifier together with the smart contract address becomes the DID as per the syntax rules
above.

### Read (Resolve)

To construct a valid DID document from an `erc725` DID, the following steps are performed:

1. Determine the Ethereum network identifier ("mainnet", "ropsten", "rinkeby", or "kovan"). If the DID contains no network identifier, then the default is "mainnet".
1. Invoke the `getKeysByType` function for each of the supported key types, i.e. `MANAGEMENT`, `ACTION`, `CLAIM`, and `ENCRYPTION`.
1. For each returned key address, look up the secp256k1 public key associated with the key address.
1. For each `MANAGEMENT` public key:
	1. Add a `publicKey` of type `Secp256k1SignatureVerificationKey2018` (see **[4]**) and `ERC725ManagementKey` to the DID Document.
1. For each `ACTION` public key:
	1. Add a `publicKey` element of type `Secp256k1SignatureVerificationKey2018` and `ERC725ActionKey` to the DID Document.
	1. Add an `authentication` element of type `Secp256k1SignatureAuthentication2018`, referencing the `publicKey`.
1. For each `CLAIM` public key:
	1. Add a `publicKey` element of type `Secp256k1SignatureVerificationKey2018` and `ERC725ClaimKey` to the DID Document.
1. For each `ENCRYPTION` public key:
	1. Add a `publicKey` element of type `Secp256k1SignatureVerificationKey2018` and `ERC725EncryptionKey` to the DID Document.
	1. Add an `encryption` element of type `Secp256k1Encryption2018` to the DID Document, referencing the `publicKey`.

Note: Service endpoints and other elements of a DID Document may be supported in future versions of this specification.

### Update

The DID Document may be updated by invoking the relevant smart contract functions as defined by the ERC725 standard:

 * `function addKey(address _key, uint256 _type) public returns (bool success);`
 * `function removeKey(address _key) public returns (bool success);`

Note that these methods are written in the Solidity language. Ethereum smart contracts are actually executed as binary code running in the Ethereum Virtual Machine (EVM).

### Delete (Revoke) 

Revoking the DID can be supported by executing a `selfdestruct()` operation that is part of the smart contract. This will remove the smart contract's storage and code
from the Ethereum state, effectively marking the DID as revoked.

## Security Considerations

TODO

## Privacy Considerations

TODO

## Performance Considerations

In Ethereum, looking up a raw public key from a native 20-byte address is a complex and resource-intensive process. The DID community may want to consider
allowing hashed public keys in the DID documents instead of (or in addition to) the raw public keys. It seems this would make certain DID methods such as
`erc725` much simpler to implement, while at the same time not really limiting the spirit and potential use cases of DIDs.

References
----------

 **[1]** https://w3c-ccg.github.io/did-spec/

 **[2]** https://github.com/ethereum/EIPs/issues/725

 **[3]** https://github.com/ethereum/EIPs/blob/master/EIPS/eip-55.md

 **[4]** https://w3c-dvcg.github.io/lds-koblitz2016/
 