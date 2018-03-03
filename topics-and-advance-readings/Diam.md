# Integrating Identity silos via address books

Today there are too many fragmented identity silos starting from a simple contact database, social networks, user directories, wallets, password managers, CRM /CIAM systems, HRMs, social and various cloud services. This adds immense friction in user experiences, adoption and security.

Further, having Sybil-resistant Identities mapped to real people is near impossible.

## Digital Identities is now a full-fledged Global War Front
With Blockchain now becoming the web of transactions requires everyone to have a private key. Allowing anonymous private keys basically sets us back a few decades of what the global Financial Action Task Force (FATF) was able to accomplish in its fight against Money laundering. Bill Gates has put it that crypto is killing people in a "fairly direct way". Further cybercrime is going to hit $6 trillion annually by 2021. Integrating and securing the silos has therefore become critical.

## The real question are
* How far can the self-sovereign identities save privacy, stop external correlation without removing accountability?
* Is cryptography and 1000s of DIDs going to cripple the FATF effort and make everything go dark?
* Interoperatibility across platforms and entities must have multiple DIDs or just a unqiue contact ID per relatinship is better than mangaging 1000s of keys?

### The top use cases for identities 
1.	Contacts
2.	Social networks
3.	Access management (IAM industry)
4.	Blockchain (wallets)
5.	AML / KYC


# Proposal for seamless interoperatibility & usability via phone address book
The proposal draws upon a lot of work already accomplished in previous workshops of RWOT and proposes SPKI partly based on MSISDNs.

1.	**Contacts platform** - A network of self-sovereign identities including directories with SPKI. The identities use  globally unique mobile numbers as handles **like a domain name system** for easy reference.
2.	**DPKI and ERC725** for managing the asymmetric keys and recovery.
3.	**Proof-of-life** - Using Social graphs and live human conversations with cryptographic signing. Similar to live human validation used during kidnappings.
4.	**Shared contact directories** exposed as LDAP for authentication, authorization and context.
5.	**Contact IDs** to prevent external correlation (while having persistent identifier in the Distributed Ledger or Identity hub).
6.	_**Cryptographic KYC**_ – capture SSL certificate along with web page as a hash on blockchain.

For detailed reading please see [Diro's Technical Paper](https://github.com/dirofoundation/whitepaper/blob/master/02%20DIAM%20Whitepaper_v7.pdf)
