# Petnames for Self Sovereign and Human Readable Identifiers

By Christopher Lemmer Webber, based on conversations with Mark S. Miller.

## Introduction

[Zooko's Triangle](https://en.wikipedia.org/wiki/Zooko%27s_triangle)
tells us that naming systems can have two out of three properties:
decentralized, globally unique, human meaningful.
[DIDs](https://w3c-ccg.github.io/did-spec/) are decentralized and
globally unique, but are intentionally not built to be human readable,
and yet are meant to be used by humans.
Consider the following example DID:

    did:example:fbc0f54d1a084b469490ff78d55632ea

Identifiers like this look like gobbledygook to you and me, so how can
we use them?

[Petnames](http://www.skyhunter.com/marcs/petnames/IntroPetNames.html)
offer a solution to squaring Zooko's Triangle by mapping local names
to global identifiers and vice versa.
At its simplest, petnames are not unlike the physical telephone books
individuals and families would manage in days past.
These books were useful and important even if one had a "Yellow Pages"
style directory; there may be hundreds of Bob Smiths in your city's
telephone book, but only one of them is your next door neighbor Bob
Smith.
(Even if you know multiple Bob Smiths, you could always write down
`Bob Smith (neighbor)` and `Bob Smith (accountant)`.)

But Petnames go further: participants may introduce other participants
to each other or ask about one another (including asking
semi-centralized "oracles" or directories of information...  the
"Yellow Book" is always something you can consult, if you want to).
These names may be recognized and recorded, but Petnames systems
remember history about how names come to be known.
Critically, petname-using systems do (and even must) display names
differently depending on how the name is known.
This turns out to be important for security purposes and requires some
coordination with programs' user interfaces, as we shall see.

# An example

Alyssa P. Hacker checks her inbox and sees an interesting message from
`did:example:74cbe1a1774445ee8c18660033b06723` announcing a special
lecture on mathematics that the sender is presenting and asking if
Alyssa has any friends who may be interested in attending it.
The message is from Dr. May Tree-Arch, who is both a professor at
Alyssa's university and also, as it turns out, her mother.
(Never mind that their last names are different... many life events
can lead to family members having different last names over time, and
that's none of our business anyhow.)
But the program that Alyssa is reading her messages from does not
display `did:example:74cbe1a1774445ee8c18660033b06723`, it says
`Mom`.
"Mom" is distinctly rendered in a way that helps Alyssa remember that
she set the name `Mom`... perhaps the whole name is rendered in a
box with a yellow star next to it.
(Alyssa has only one `Mom` in her address book.
Were her family situation different, she may have multiple Moms, but
they would have distinct names in her Petnames database like
`Mom (Alice)` and `Mom (Beatrice)`.)

While Alyssa calls her own mother "Mom" when she's talking to her, she
sometimes introduces her mother to other people and would like to
suggest a name that they refer to her by.
It wouldn't make sense for others to refer to Alyssa's mother as "Mom"
since they probably have their own mothers.
Instead, Alyssa has set her Petnames database so that when she
introduces her mother to others, she suggests the name "Dr. May Tree-Arch".

Alyssa thinks her friends Ben Bitdiddle and Eva Lu Ator may like to
attend the lecture and forwards the message to them.
Ben has known Alyssa's mother for a long time and already has a local
Petname for her which says `Alyssa's Mom`, also rendering as a locally
set name with a golden star.

However, Eva has never met Alyssa's mother before.
The incoming message suggests the name "Dr. May Tree-Arch" (email
similarly allows senders to suggest names for participants) and is
added to Eva's Petnames database.
However, Eva's petname database does a couple of things: it marks that
this name was given "by introduction" and adds a small amount of
random identifier information alongside it.
When it renders in Eva's mail reader, she sees
`Dr. May Tree-Arch::ccadf77b` with a blue icon that shows two people
with an arrow drawn between them.
This is important because Eva can tell that this name was given to her
by introduction (hovering over it might even tell her additional
context, such as that it was Alyssa who made the introduction) and the
`ccadf77b` extra bit of random information prevents conflicts.
Eva is grateful for this because, while this is the first Dr. May
Tree-Arch she has been introduced to, she previously was introduced to
several Bob Smiths and was glad that the world did not have to agree on
only one Bob Smith in order for those Bob Smiths to exist (the Bob
Smiths were grateful that they did not have to settle on one Bob Smith
either).
Eva decides to attend the lecture and trusts that a name that Alyssa
would have suggested would be a correct name for this person, and
decides to reify the name `Dr. Tree-Arch` as her own manually set
local petname for the professor, and the display of the name updates
accordingly with a friendly golden star.
(Her Petnames database might potentially also provide her the
opportunity to write a note or so about Dr. Tree-Arch in case Eva
would find adding such context to be helpful.)
When she receives communication from or about Dr. Tree-Arch in the
future, she will be aware that it is this particular Dr. Tree-Arch
within the network of people she knows, and not some other
Dr. Tree-Arch.
Eva also sets this name to be the same external name by which she
introduces Dr. Tree-Arch to others.

Meanwhile Cy D. Fect encounters a note about the upcoming lecture on a
local bulletin board.
Cy isn't particularly close friends with Alyssa, though he does know
Eva, and for whatever reason whoever posted this message to the board
merely left Dr. Tree-Arch's DID of
`did:example:74cbe1a1774445ee8c18660033b06723`
without any additional context.
Cy wonders who this lecturer may be, so he asks his local web of trust
(or one may say "Cy's social network") for suggestions.
Eva's computer responds by suggesting that the name "Dr. Tree-Arch"
may be appropriate and so Cy's petname database adds this, also recording
that this was a suggestion through the web of trust and adding a bit
of random identifier information.
This renders as `Dr. Tree-Arch::5af7a60b` with a purple web, reminding
Cy that this came from his web of trust.
Cy also queries the campus directory (an oracle, and many oracles
could be queried or added to one's web of trust) to find out whether
Dr. Tree-Arch is a member of the faculty (she is) and reads more about
her local biography there.
Since the directory responds with information about Dr. Tree-Arch,
Cy's petname database could add a record by introduction from the
directory, or depending on how it is configured, Cy's petname database
may decide that since it already has a suggested name for this DID
that it doesn't need to keep accruing names.

# Petnames for safe user experiences

It's important that Petnames-using applications render different kinds
of Petnames in different ways.
If Mallet sends a message to Alyssa asking her to pay for a birthday
gift for a relative and suggests the name "Mom" or "Dr. Tree-Arch",
this suggested name will render differently than if Alyssa had set
this name herself or if one of her friends suggested it.

# Epilogue

Petnames are an old but powerful concept and date back to the 1980s as
part of the pioneering [Electric Communities](http://www.crockford.com/ec/)
distributed social game.
Unfortunately, until now Petnames have mostly lived in obscurity.
The time has come for that to change: with the introduction of DIDs
and the re-growth of peer to peer networks, Petnames bring human
readable names back to decentralized systems while remaining truly
"self sovereign".
