# DID-Auth Protocol
Contribution and collaborations by many in the W3C CCG, W3C VCCG, and DIF Auth WG
Authored by Kyle Den Hartog
# Summary:
 this is nearly an implementation of [TLS 1.3](https://tools.ietf.org/html/draft-ietf-tls-tls13-24) using public keys associated with a DID rooted on a blockchain rather than X.509 Certificates. It allows two DID owners to be able to mutually authenticate with a high degree of certainty (as long as the private key haven't been cracked, stolen, intercepted, etc) and can establish an ephemeral, secure, communication channel. The main concerns with TLS at this point is that established libraries such as OpenSSL, GnuTLS, and wolfSSL need slight modifications in order to run DID-TLS. In the intermediary, we could utilize this protocol to get Authentication through DIDs working, and then when the modifications in [Open-TLS](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-spring2018/blob/master/topics-and-advance-readings/OpenTLS.md) are accepted into the libraries, DID-Authentication could migrate to these libraries.

# protocol:
##### 1. Client sets up primitives:
* Client DID ( The DID the client wishes to be associated with)
* Client generates a nonce 3<sup>15</sup>mod 17 = 6 (nonce = 6, g = 3, p = 17, 15 is secret key)

##### 2. Client packages Message
{ plaintext [Client DID, g, p, nonce], signature signed by private key associated with DID document public key }

##### 3. Client sends message to Server (or another communication partner)

##### 4. Server receives message:

##### 5. Server verifies message received:
1. Server looks up DID Doc of Client DID
2. Server verifies signature
3. If valid server generates request A else server generates request B
    * **Request A (valid):**
        Server DID ( The DID the server wishes to be associated with )
        Server generates a nonce 3<sup>13</sup>mod 17 = 12 (nonce = 12, g = 3, p = 17, 13 = secret key)

    * **Request B (invalid):**
        A standard 401 HTTP response

##### 6. **Server package message:** 
{ plaintext [Server DID, g, p, nonce], signature signed by private key associated with DID document public key }
##### 7. Server sends message to Client
##### 8. Client Verifies message
* If client validates the message, the shared private key is now used as a symmetrical encryption key 
    
1. Client would produce shared private key (symmetrical encryption key) by calculating: 12<sup>15</sup>mod17 = 10
2. Server would produce shared private key (symmetrical encryption key) by calculating: 6<sup>13</sup>mod17 = 10

##### 9. Client and Server now are mutual Authenticated and established an encrypted channel
* This could use verifiable claims, HTTP-signatures, JWTs, etc to maintain continuous mutual Authentication

