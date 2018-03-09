# RWOT6 Draft Papers

This directory continues the drafts of the white papers and specs that are coming out of the RWOT6 design workshop, run in March 2018 in Santa Barbara, California.

## Primary Papers 

<table>
  <tr>
    <td><b>Title</b></td>
    <td><b>Lead</b></td>
    <td><b>Link</b></td>
  </tr>
  <tr>
    <td><b><i>Attribute-Based Credentials</i></b></td>
    <td>Nathan G.</td>
    <td></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> 
    </td>
  </tr>
   <tr>
     <td><b><i>Introducing the BTCR DID Method Spec</i></b></td>
    <td>Kim</td>
    <td><a href="introducing_btcr.md">Outline</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> This paper describes the BTCR DID Method Specification. BTCR is a simple DID method spec using the Bitcoin blockchain. Because of its simplicity, it's a useful introduction to DIDs, and anyone can start using them right away. This paper describes how the BTCR DID Operations work, including creation, resolving, updating, and deleting. We weave in examples using our BTCR Playground to demonstrate how to get started immediately.
    </td>
  </tr>
  <tr>
    <td><b><i>DAD: Decentralized Autonomic Data</i></b></td>
    <td>Sam S.</td>
    <td></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> 
    </td>
  </tr>
  <tr>
    <td><b><i>DID v1.0</i></b></td>
    <td>Manu</td>
    <td></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> 
    </td>
  </tr>
  <tr>
    <td><b><i>DID-Auth</i></b></td>
    <td>Markus</td>
    <td><a href="did_auth_draft.md">Draft</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> The term DID Auth has been used in different ways and is currently not well-defined. We define DID Auth as a ceremony where an identity owner, with the help of various components such as web browsers, mobile devices, and other agents, cryptographically proves to a relying party that they are in control of a DID. This means demonstrating control over the DID using the mechanism specified in the DID Document Authentication object. This could take place using a number of different data formats, protocols, and flows. DID Auth includes the ability to establish mutually authenticated communication channels, and to authenticate to web sites and applications. Authorization, verifiable credentials, and capabilities are built on top of DID Auth and out of scope for this document. This specification defines the scope of DID Auth, supported protocols and flows, the use of components of the DID documents which are relevant to authentication, as well as formats for challenges and responses.
    </td>
  </tr>
   <tr>
     <td><b><i>Identity Hubs</i></b></td>
    <td>Daniel</td>
    <td><a href="Identity%20Hub%20Attestation%20Handling.md">Draft</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> Define all technical components and user flows required to facilitate request, issuance, presentation, verification, and revocation of interoperable attestations. This is used as an update to the identity hub specification to reflect these flows and components.
    </td>
  </tr>
  <tr>
    <td><b><i>Making DIDs Invisible: Petnames & Their Secure User Interfaces</i></b></td>
    <td>Chris W.</td>
     <td><a href="making-dids-invisible-with-petnames.md">Outline</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> T If we ever show a DID to a user we have failed. We should always show a human readable name. DIDs and tor .onion names give decentralized and globally unique names, but they are not human readable. How can we build user interfaces that real users might actually use? In this paper we provide an overview of petname systems, a way of mapping human readable names to cryptographically secure names, and describe changes to two user interface designs that we believe that are compatible with intuitive user expectations. We first discuss the smartphone contact list as already approximating petnames to some degree and discuss how to augment it with secure introduction. We then walk through several changes to browsers (which may be provided natively or as an extension) which add the functionality of a petname system. By utilizing petname systems we are able to collectively support individual naming definitions, community curated directories of names, as well as exiting naming authorities such as certificate authorities and the domain name system, government agencies such as trademark offices, and decentralized systems such as namecoin.
    </td>
  </tr>
   <tr>
     <td><b><i>Open Badge Are Verifiable Credentials</i></b></td>
    <td>Nate</td>
    <td><a href="open-badges-are-verifiable-credentials.md">Draft</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> We identify use cases and requirements that connect threads of work happening in the Rebooting Web of Trust community around: educational achievement claims (particularly using the Open Badges vocabulary), use of decentralized identifiers (DIDs) within web services where educational claims circulate, and integrating blockchain-reliant verification layers. We illustrate each of these cases with a set of example documents and describe user stories for Open Badges ecosystem software in the roles of Issuer, Host/Backpack, Displayer, and Verifier that need to be implemented in order to enable the capabilities described.
    </td>
  </tr>
   <tr>
     <td><b><i>Roadmap: Let's Go Exponential</i></b></td>
    <td>Moses</td>
    <td><a href="a-roadmap-for-ssi.md">Draft</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> The self-sovereign identity developer community is fun and vibrant in thought leadership, but the community’s current direction will not lead to exponential adoption. The community needs to get serious about doing what it takes to insure success for the standard, applications and vision. The goals need to be made clear: (i) a better approach to communicating the core concept and its benefits, (ii) the production of tools to assist in the development of compelling applications, (iii) the deployment of products that produce WOWs that stimulate media interest and viral propagation, and (iv) which leads to the formation of a critical mass of end users.
    </td>
  </tr>
     <tr>
       <td><b><i>Six Truths About Biometrics</i></b></td>
    <td>John C.</td>
    <td><a href="Biometrics.md">Draft</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> Biometrics are already here, and they will be used on the internet, whether we like it or not. They are already are; a lot of the current practices are bad and the centralized hosts know it. We know that centralized repositories of sensitive information are highly vulnerable and present irresistible targets, but better solutions are not available to current practitioners; they’re not even being considered. Fortunately, there are other fields that are already solving these problems, such as self-sovereign identity. We need to adapt their best practices to make biometrics safe and secure.
    </td>
  </tr>
  <tr>
    <td><b><i>TLS-Flex</i></b></td>
    <td>Sam C.</td>
    <td><a href="TLS-Flex.md">Draft</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> TLS validation requirements is burdened by problematic certificate mechanisms. The goal for this work is to reduce that burden and thereby enable a broader range of TLS use by applications. The effort will facilitate exploration of alternate types of certificate and validation mechanisms, leading to mechanisms with better administration and operations properties; it will also have the benefit of permitting mutual authentication to be completed at the beginning of the connection.
    </td>
  </tr>
  <tr>
    <td><b><i>Towards a Sustainable Technology Commons</i></b></td>
    <td>Heather</td>
    <td><a href="Towards a Sustainable Technology Commons.md">Outline</a></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> There are technology commons and they have varying levels of success. Capitalism can not produce innovations/innovative products without utilizing commons. However capitalist activities do not have a financial feedback mechanism to support commons. It is as if commons and capitalism are oil and water, but they need to work together and support each other's aims. Doing so can create a more sustainable and thriving commons that enables and supports more technology innovation.
    </td>
  </tr>
  <tr>
    <td><b><i>Web of Trust: End to End</i></b></td>
    <td>Kim</td>
    <td></td>
  </tr>
  <tr>
    <td colspan=3>
      <b>Abstract:</b> 
    </td>
  </tr>
</table>

## Mandatory Minor Papers

| Title | Lead | Link |
|:--|:--|:--|
| Adhaar vs Sovereign | Joe | |
| Decentralized Interfaces for Extensible APIs | Vlad | |
| Survey of Cryptographic Key Recovery Methods | Ryan etal. | [Outline](key_recovery_methods.md) |
| Key Recovery (I) | Drummond | |
| Key Recovery (II) | Christian | |
| Minimal Web of Trust Schema | Andrew | [Notes](topics-and-advance-readingsWeb%20Of%20Trust%20Schema%20RWOT%206.md) |
| Permissionless, Replicated, Decentralised Storage Network | Kulpreet | [Draft](permissionless-replicated-decentralised-storage-network.md) |
