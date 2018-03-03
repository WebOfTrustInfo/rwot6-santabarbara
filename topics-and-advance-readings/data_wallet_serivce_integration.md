# Proposed collaboration on open standards for data wallet and data service integration

Ron Kreutzer <<ron@pillarproject.io>>

## Abstract
As products and services are developed that allow individuals to take ownership and control of their personal data, an effort is needed to develop standards such that data services providers can more easily and efficiently interoperate with data wallet providers. This would allow individuals to retain control over their personal data and to be able to add or swap services that operate on their data.

## Problem
Many projects are being developed that aim to give ownership and control of personal data back to individuals. These projects may be for a specific industry, such as medical records, or for a specific service model, such as monetizing the individual's consent for using their personal data in research or marketing. These include both commercial and open source endeavors, and some include the use of tokens as the underlying payment mechanism for their platform.  Typically these projects include a user interface to their service, commonly referred to as a “wallet”.

The issue is that from a user perspective, an individual may need to install multiple software wallets to use the set of personal data services that they desire.  From the business’ perspective, each company must develop software to collect, store and maintain each individual’s identity, and to manage verified credentials and consents.

A services business doesn’t build a website, and then build a browser for people to access that website. Currently, however, a business that provides a service on top of personal data must build a user interface with common functions such as identity, key and consent management. 

## Solution
There are several companies building what I’ll refer to as a “data wallet”, although the companies may refer to them as lockers, vaults or hubs. [Pillar Project](https://pillarproject.io/), which I am involved with, is one such open source effort. Just like a user’s choice of web browser is based on features and device support, so could data wallets be chosen by the individual based on ease-of-use, features and supported services.

The separation of the “data service” from the “data wallet” can provide efficiencies to the data service business as they need not be concerned with the common user interface and identity management functions that are provided by the data wallet. Further, individuals gain efficiencies by installing their favorite data wallet and attaching data services to it based on their needs. 

A further logical separation of the underlying personal data from the data service and from the data wallet is also needed. This separation would allow for multiple data services to operate on the same set of personal data, and allow data services to be swapped out, based on an individual’s changing needs. This separation would also allow data wallet providers to be easily swapped, and provide incentives for the data wallet companies to continue to innovate and integrate data services into their wallets to create mass adoption.

## Conclusion
A method to allow data wallets and data services to easily integrate can bring efficiencies and mass adoption to the personal data ownership/control marketspace. Many of these standards already exist, and it’s a matter of packaging them into an open set of methods that such companies can support and adopt.
