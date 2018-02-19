# Open TLS
Contributors: Sam Curren

## Summary
OpenSSL and HTTP Libraries encode practices not required by TLS Spec
Adjusting existing libraries to accommodate variations in certificate verification will allow for additional verification requirements.
Background

The TLS Specification establishes well-formed practices for establishing secure communications. The spec itself does not impose opinions about how the certificates used should be validated or verified:

> The TLS standard, however, does not specify how protocols add security with TLS; how to initiate TLS handshaking and how to interpret the authentication certificates exchanged are left to the judgment of the designers and implementers of protocols that run on top of TLS.”
https://tools.ietf.org/html/draft-ietf-tls-tls13-22#page-4

OpenSSL is the main library providing TLS support. The OpenSSL library maintainers have made judgement calls about how certificates are authenticated. This method relies on the presence of accepted keys from root Certificate Authorities. This method has served us well in the past. Many HTTP libraries use OpenSSL to provide TLS support, and have followed this pattern.

## Opportunity

The development of cryptographic tools, including those anchored in the blockchain, provide new opportunities for certificate verification outside the traditional Certificate Authority Model. Extending Libraries to support additional verification options prevents vulnerability regressions within a new protocol.

An additional assumption present in OpenSSL and other HTTP libraries is that certificate acceptance is a binary option. Allowing certificate inspection during and after an encrypted connection will provide additional uses of certificates in a secure protocol.

## Requirements
These requirements are all designed from the perspective of a library user, even if that user is another library. None of these requirements are intended to be the default behavior of a library.

### Requirement 1: Validate Server Certificate during TLS handshake.
This allows a client to inspect the certificate provided by the TLS server during the TLS handshake, and continue or abort the connection. This could be built as a callback with the certificate details as an argument.
This requirement is a logical expansion of the currently common flag used to disable Certificate Authority certificate validation. 

### Requirement 2: Validate Client Certificate during TLS Handshake.
The inverse of requirement 1, This allows the server to inspect a returned client certificate before the completion of the TLS Handshake. Inspection prior to the end of the handshake allows TLS errors to be returned in response to a terminated connection.

Current implementations assume that provided client certificates are issued by the server they are sent to. Flows must support they presentation of _any_ client certificate.

### Requirement 3: Make requests with specified client certificate
Allow users to specify client certificate at the time of request.

### Requirement 4: Inspect Server Certificate After HTTP Request
Clients must have the ability to inspect the provided certificate after a request has completed. 

### Requirement 5: Inspect Client Certificate During HTTP Request
Servers must be able to inspect a provided client certificate during request processing. 

### Requirement 6: Return and Catch TLS Handshake Errors during failed handshakes.
Any method that can result in a TLS Error must provide that error in a meaningful format. Any validation callbacks must have the ability to trigger the return of a TLS Error
