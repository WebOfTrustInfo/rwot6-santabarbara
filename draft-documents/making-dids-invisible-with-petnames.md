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

## Outline

 - Introduction / abstract
   - Add examples from twitter

 - Explaination of petnames derived from topic paper
   - types of names
     - petname: set locally by a user (has to be bidirectional, but
       not necessarily 1:1 (maybe we go into this more in contact
       section))
     - path names (which are rooted in a petname, and have paths to
       edge names): a path through a graph to find a name (using a
       unicode thick black arrow in this paper)
     - anchor name: to suggest to the receiver what a good petname
       for the entity would be and the receiver can act on the suggestion
       by accepting or accept it with modification
   - Naming hubs

 - Implementation scenarios
   - Contact list
     - What it already does right
       - Bidirectional mapping
         - Uses phone numbers as a global namespace without making the
           numbers be the primary user experience
         - The names that it presents that correspond to phone
           numbers, it has no pretense that the names have global
           significance... chosen by each human operator according to
           what's useful to them.
         - User interface uses that mapping both in selecting things and in
           rendering things such as an incoming call or call history
         - The rendering is in terms of the live mapping

     - Things to add
       - Party scenario
       - Searching the contact list, type in a friend's name, get results
         from "your contacts" (petnames) "network contacts" (path names)
         - Sorting petname systems?
           - petnames
           - two-level path where first step is something you've chosen to use as a naming hub
         - call a person who's a friend
         - call a friend of a friend
       - Saving a friend of a friend as a new petname
         - Save the petname (highlighted text which you can edit)
         - Click "share with contacts"
           - your edge name for others is immediately highlighted so you can edit
         - Previous interactions should also show an updated name
           (they were previously an accquaintence, you realize you'd
           like to add them to your primary contacts)
         - A footnote to: we've glossed over it in our example, but
           what should we do about mapping to a composite of values
           such as email and phone numbers

       - caller ID (anchor name)
         Someone you don't know wants to come to your party
         - How do we visually distinguish between these and path names?
           We should probably do a "?=>John Doe 1"
       - a user is called and there's no phone number given,
         "?=>Unknown/Unnamed Caller Number 1"
       - scan a QR code for a business, and "blocknym"

   - Browser
     - What it already does right
       - they understand the address bar *should* be a trusted path
       - a web page, when over a secure connection, is able to present a link that
         does express where the web page would like you to think that you would go
       - bookmarks, which is the basis of doing petnames
     - What it currently does wrong
       - the web page can confuse the user; the webpage may confuse you by telling
         you where you may go, but you're reliant on the browser to tell you where
         you are
         - hovers
         - the bottom bar can change
         - the address bar can change (though less)

     - Things to add
       - no petnames

     - we can repurpose Certificate Authorities + DNS as a particular petname
       which expresses domains as names

     - you can always have a naming hub that issues confusing names for things,
       which may make them a bad naming hub.  We aren't avoiding this, but we
       are giving users other ways to find edge names (which they may compare)
       and who it is that's issueing edge names (which can be audited
       and can be competitive)

     - when can you and can't you control the "body" of the interface?
       yes on a mobile application but not on 

     - assumptions: we're assuming that you don't have a soci
     - the top bar shows the name from the petname system

     - footnote: why we didn't do the bottom bar and the hover (you
       can't take control from the web page about where you will go)

     - You must copy around the URL and *NOT* the petname.
     - footnote: bookmark should by default add a petname for the whole url but may
       expose an option to give a petname to the whole prefix

 - Conclusion

 - Glossary "Within this document, these words mean..."

 - Extended reading
   - Petname markup language
   - Petmail
   - SPKI/SDSI??

