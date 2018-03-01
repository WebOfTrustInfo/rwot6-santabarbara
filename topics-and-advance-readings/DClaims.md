# DClaims News - A Fake News Mitigation Platform

## Abstract
The verification of news articles is a difficult problem to solve. The media has a great power over society and fake news can have deep consequences. 
DClaims News is a browser extension that allows for anyone to make and view claims about any news article. It is built with IPFS and Ethereum.

## Introduction
In this age of digital information it has become incredibly difficult to track down the origin of a news article, and tell the difference between thruful and false information. Large data silos have incredible power to control what information people see, and users need to trust their good intentions. DClaims News is a browser extension that allows anyone to make claims about news articles. These claims are public, generated and displayed on any news websites, and their authenticity and integrity can verified by anyone. The system is built on top of IPFS (a distributed file-system) and Ethereum resulting in a completely decentralized, trustless and censorship-proof system.

## How it works

DClaims is a platform that enables people ot make claims about news articles on any news website. Claims are stored on IPFS, which ensure that links do not get broken and an Ethereum smart-contract is used to keep track of the claims for each news article.
The Claim object is based on Verifiable Claims (it has a similar schema) but it currently is not yet fully compliant with the specification.
When a news website is opened, DClaims generates the resources to allow a user to view and generate claims about news articles. To view and generate claims users must be running Go-IPFS and have the Metamask web-extension installed and configured.

**Viewing claims**

The process of viewing claims consists on querying the Ethereum smart-contract for the list of claims for a given article (querying by the article's ID). The smart-contract returns the IPFS link of each claim and the claims are then fetched from IPFS and presented to the user.

**Issuing claims**

After a user has written a claim (can be a paragraph talking about a news article, or just a classification such as "fake news article", "biased",etc) the Claim is added to IPFS. The IPFS link is then sent to the Ethereum smart-contract and indexed by the news article's ID.

![](https://raw.githubusercontent.com/inesc-id/dclaims-pm/master/images/Screen%20Shot%202018-03-01%20at%2001.42.34.jpg)

## Important Features

**Censorship resistant**

The application runs locally on the browser, as an extension, so news websites can not prevent it from being run on top of their websites.

**Secure**

Ethereum assures the authenticity of the claims (we use the issuers’ Ethereum wallet address for identification)
IPFS assures the integrity of the claims. If a claim’s content is changed so will be the link to that claim. An IPFS link works as a snapshot of the claim object. An IPFS link always resolves to the same version of an object.

**Resilient**

Due to its highly distributed and trustless architecture, the system has no single point of failure that could be attacked. The way to bring it down would be to destroy the entire IPFS and Ethereum networks, but at that point the world would probably be destroyed as well, so news articles would be the least concern on people’s minds.




