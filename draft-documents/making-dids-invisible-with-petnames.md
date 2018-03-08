# Making DIDs invisible: Petnames and their secure user interfaces

By Mark S. Miller, Christopher Lemmer Webber, Zarchary Larson, Kate Sills,
Eli Yaacoby, and Steve Dekorte.

If we ever show a DID to a user we have failed.  We should always show
a human readable name.  DIDs and tor .onion names give decentralized
and globally unique names, but they are not human readable.  How can
we build user interfaces that real users might actually use?  In this
paper we provide an overview of petname systems, a way of mapping
human readable names to cryptographically secure names, and describe
changes to two user interface designs that we believe that are
compatible with intuitive user expectations.  We first discuss the
smartphone contact list as already approximating petnames to some
degree and discuss how to augment it with secure introduction.  We
then walk through several changes to browsers (which may be provided
natively or as an extension) which add the functionality of a petname
system.  By utilizing petname systems we are able to collectively
support individual naming definitions, community curated directories
of names, as well as exiting naming authorities such as certificate
authorities and the domain name system, government agencies such as
trademark offices, and decentralized systems such as namecoin.
