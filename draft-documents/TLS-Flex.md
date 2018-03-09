# TLS Flex

*Previous Title: Open TLS*

Co-Authors: Sam Curren, Dave Crocker


## Abstract

TLS validation requirements is burdened by problematic certificate mechanisms. The goal for this work is to reduce that burden and thereby enable a broader range of TLS use by applications. The effort will facilitate exploration of alternate types of certificate and validation mechanisms, leading to mechanisms with better administration and operations propertiesl; it will also have the benefit of permitting mutual authentication to be completed at the beginning of the connection. 

Early adopters are expected to include those validating certificates registered on a blockchain. As an example, this work will lower the administrative burden and provide greater flexibility in networks of servers or IoT devices. The technical approach is as an incremental TLS certification method with application-level certification extensibility; it will not impose any changes on the core TLS protocol. 

Audience: TLS, HTTP library maintainers.

This effort serves as a narrow, practical application of DID technology, into an established service, by providing clear, incremental benefit. Such an approach to adoption of a new technology often benefits from a ready understanding of the value proposition by the established development and operations community.


## Introduction

The goal of this work is to facilitate the exploration of additional certification methods, given the significant burdens and problems present in current certification methods. Historically, certificates are considered valid if a signature chain can be found that links to an accepted root certificate. DANE is an example of an additional certificate validation method that uses a different mechanism to accept or reject a certificate presented during a TLS handshake. The work, here, is to support extensible methods of certificate validation in the standards and then carry this extensibility through the various software library layers.  This will facilitate controlled experimentation of new validation methods during development, without requiring changes to the software libraries themselves during the demonstration process. Such operational experimentation experience will significantly improve the ability to standardize alternative certification methods, given their being well-understood. 

In addition to classic, CA-based validation, the Generally Accepted Certificate Authorities, (DANE) has been defined for use with TLS. The proposed use of Distributed Identifiers (DIDs) and related keys to validate TLS connections, constitutes a third alternative, which is a good signal that a standardized method of both protocol and software extensibility should be established.

Support for extensible certification methods is accomplished through an independent registry. Standards work will enable the extensible registry for the addition of standardized certification methods. [flesh this out with CA origins]

To enable controlled experimentation with alternative certification mechanisms, HTTP and SSL libraries should support extensible methods for certificate handling. Developers will then be able to experiment and test new certificate validation methods, without having to change the supporting libraries. The needed flexibility includes:



*   Designating which certificate should be presented during connection 
*   Custom validation methods for both server and client certificates
*   Inspection of certificates after the connection has been established or completed. 

These methods should provide incremental benefit and should not interfere with the established uses of TLS. It is expected that successful experience with new validation methods will lead to their standardization.

This effort is meant to serve as a narrow, practical application of DID technology, into an established service by providing clear, incremental benefit. Such an approach to adoption of a new technology often benefits from the ready understanding of the value proposition by the established community.

The proposed work sequence is first to enable alternative certificate mechanisms, and second, to explore TLS use for additional applications including client validation. The work will explore current efforts to enhance TLS use with DANE, in order to build upon the approach it takes to TLS extensibility, and then to provide for support of DID as an additional certificate validation mechanism.


## Current State

The various libraries familiar to the authors have varying levels of support for the desired features. Presented here is a general summary of the state of support within libraries at the current time:



*   Many current libraries do allow for modification of the certificate verification process, but with limited options. It is common, for example, to allow disabling the server certificate check during an HTTP request. 
*   Custom client certificate validation is even more uncommon, with typically no options to disable CA validation. 
*   Specifying server and client certificates are often an option, but some libraries make this difficult.
*   Most libraries consider the certificate validation a pass/fail process. While passing is certainly a boolean operation, there are additional details that may be useful during the process of a request. Servers are not always provided access to client certificates sent during the TLS handshake, and clients are not always provided with access to the server certificate after a connection has finished.


## Opportunities

Instead of just disabling the server validation check, library users can provide custom validation instead of (or in addition to) the built-in certificate chain check against the built in root certificate repository. The same opportunities on the server can allow a server to provide custom validation for client provided certificates. Increased availability of certificate information during and after the connection can allow for deeper application inspection of the certificates and enhanced request flows. Finally, simplifying the process of 

Expanding and formalizing these extensibility options will provide the flexibility needed for future innovation.


### Promote Use of Client Certificates

Client certificate use in TLS has seen very little adoption in spite of its benefits. Allowing validation experimentation could lead to expanded use of client certificates. Expanded client certificate use will allow for the TLS protocol to provide not only connection encryption, but mutual authentication. Authentication flows become redundant in many cases.


## Areas of Extensibility

Validation of certificates in the TLS flow has a few key points. Providing for custom behavior at these points will enable testing of new methods critical to the development of new verification methods.


### Providing Certificate for Use

**Server Certificate**

Providing a mechanism for selecting a server certificate, for new inbound connections, is a common case, to allow support of Server Name Indication (SNI). SNI is a TLS extension that passes the expected hostname as part of the connection request, allowing the server to respond with the appropriate server certificate.

The same mechanism can be used to select a server certificate based on user defined criteria. 

**Client Certificate**

Client selection of its own certificate should be allowed prior to connection initiation. The certificate (or path to the certificate) can then be presented during the connection setup, and that client certificate should then be sent during the TLS handshake.

The client certificate should be permitted general flexibility. For example, the client certificate sent should not need to be signed by the server.


### Validating Certificate presented by the other party

Both the server and client should have the opportunity to inspect each other's certificates, and accept or reject them as valid. If the certificates are accepted, the connection should be allowed to continue. If either certificate is rejected, the TLS connection should be aborted with the appropriate TLS error. If a custom verification method is presented, no additional verification should be performed.

A method should be provided that will perform the default certificate validation if the user wishes to perform that validation in addition to any custom validation logic.


### Inspecting Certificate

Libraries should preserve information about the certificates in use, and make those details available. For server code, the client certificate should be available for inspection during the request. For client code, the certificate sent by the server should remain available for inspection after the completion of the request.

This allows for uses where inspection of the server certificate is useful post validation, perhaps to facilitate future communication in a particular manner.

Beautiful term: Application Level Certificate Validation
