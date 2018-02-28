I decided to open a thread [On Twitter](https://twitter.com/IdentityWoman/status/959047070790250496) for ID & security professionals to share why (/if) putting hashed PII on any immutable ledger(blockchain) is a bad Idea. Not everyone agreed that it was bad if certain thingss were done right. There were 15 direct responses and then a whole lot of subthreads. I have pulled out all the subthreads. All tweets are linked to. Yes...all of them. Let me know if i missed a thread and I will pull it in.

I was told my blog post was not good enough. So I took the HTML turned it into Markdown. I believe it is harder to read. [Here is the link to the original blog post](https://identitywoman.net/putting-hashed-pii-immutable-ledgerblockchain-bad-idea/) 

* * *

[John Toohey](https://twitter.com/johnptoohey/status/959114787169951744): A hash of static data is a corelatable identifier, a DID is an opaque identifier that can be decoupled from the underlying data. A DID would be GDPR compliant, the hash probably not.

* * *

[Marc Boorshtein](https://twitter.com/mlbiam/status/959063305640906752): Why would you put hashed data on the block chain? What problem does that solve? 

[Joel de Bruijn](https://twitter.com/blogisch/status/959126829188644864): For Proof-of-Existence you could always use the notary function of your local Trusted Third Party database ;) 

[Tim Bouma](https://twitter.com/trbouma/status/959128046161858561): Sure. If you expect that third party to be involved in the verification process going forward. 

[Joel de Bruijn](https://twitter.com/blogisch/status/959129461470920704): Indefinitely ;)

* * *

[Timothy Holborn](https://twitter.com/SailingDigital/status/959368800612184066): Why is "rule of law", "do unto others" or "fair dealings" a bad idea. An impossible tweet. re; the works of actors who seek to improve [<s>#</s>**digitalcivilrights**](https://twitter.com/hashtag/digitalcivilrights?src=hash) What's wrong with 

[<s>@</s>**SolidMit**](https://twitter.com/SolidMit) ? Is it a bad idea citizens own data 2 support the basis 4 all verified claims via our [<s>#</s>**SocialWeb**](https://twitter.com/hashtag/SocialWeb?src=hash)

* * *

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959157566625406976): Near term, storing a hash on chain can be statistically anonymous, although you can always use it in a way that promotes correlation. Long term, quantum decryption/future tech, any hash is reversible. As always, anonymity is a function of economics, not technology.

> **Thread A)** 
> [Joe Andrieu](https://twitter.com/bkaptijn/status/959191195099521030): Hashes should be treated as the strongest locks we have, TODAY. For precious data, protect it through multiple means. Hash, shard, encrypt data, w/ nonces, salts, & multiple indirection. There is no bullet proof solution. For a public record, SOMETHING has to be public. 
> 
> **Thread B)**
> <span style="color: #333399;">[Bob Blakley](https://twitter.com/bobblakley/status/959160841743556608): You don't need to reverse a hash. Attributes are not like passwords; they're not like secrets and we often know in advance what the range of values is. "State of Residence", for example, has fewer than 60 values in the US, so the dictionary is tiny.</span>
> 
> <span style="color: #333399;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959161676149932032): But we're talking about the reversibility of hashes, not other correlation. You can ALWAYS modify your data to have a place for a salt, e.g., "State of Residence" can be concatenated with an arbitrarily long nonce before or after the data in question. No more dictionary attack.</span> 
> <span style="color: #333399;">Bas Kaptijn: Though be carefull about the hash function used: [<span class="invisible">https://</span><span class="js-display-url">en.m.wikipedia.org/wiki/Length_ex</span><span class="invisible">tension_attack</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/ANVCZmbO5n "https://en.m.wikipedia.org/wiki/Length_extension_attack")</span>

[Ben Laurie](https://twitter.com/BenLaurie/status/959171389633810433): More nonsense. Quantum is not a magic wand. It doesn't work any better than classical against hashes. Also, hashes are demonstrably not generally reversible for arbitrary inputs (because there are an infinite number of inputs for each output, on average). 

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959174217466966016): I thought the "/future tech" made it clear I was claiming any arbitrary future tech, including magic wands. Pretending today's tech is the only attack vector would be the cryptographic version of the Y2K mistake of two digit years.

* * *

* * *

[Branden@Reflexivity](https://twitter.com/rflxvty/status/959059565177376770): There may be GDPR issues in Europe: "The Article 29 Working Party has been unequivocal that hashing constitutes a technique of pseudonymisation, not anonymisation as it is still possible to link the dataset with the data subject."

> **Thread A)** [Brendan@Reflexivity](https://twitter.com/rflxvty/status/959060733525770241): This relates to right to be forgotten, where you can ask a business to destroy all data that belongs you. If on immutable public blockchain, even in hashed form, if someone can theoretically recover the unhashed data which is associated with your ID then it's not GDPR compliant. 
> 
> [Tim Bouma](https://twitter.com/trbouma/status/959061782043267072): But I might not want to trust a business with my PII in the first place. [Brendan@Reflexivity](https://twitter.com/rflxvty/status/959063873876668416): Yep, that's the big crypto plan. Zero knowledge identity.

> **Thread B)** [Stephan Engberd](https://twitter.com/Engbrg/status/959357210554982400): Notice that the legal term "pseudonymisation" in GDPR is a very, very weak term and has nothing to do with the use of the security use of the term in e.g. Identity (e.g. eIDAS 5.2)

[Christopher Allen](https://twitter.com/ChristopherA/status/959130024233222144): Hashed data with suitable nonces, as well as various hash trees should not be considered pseudo-anonymous, as the same values hashed at another time result in different hashes and thus are not correlateable. But I agee bare hashes are often a bad idea — a lesson from FOAF.
> 
> [Martin Bolt](https://twitter.com/martijnbolt/status/960139215454556160): This is exactly why blockchain based attestation can be implemented within GDPR regulatory requirements while preserving sovereignty for users, without the need of trusted third parties whatsoever that (can) become the more sovereign. Many people I meet (deliberately) ignore this 
> 
> [Tim Bouma](https://twitter.com/trbouma/status/960155641112399873): Yup. This is the essence of the capability we are all looking for. No more, no less. Everything then, can be built up from this essence. 
> 
> [Martin Bolt](https://twitter.com/martijnbolt/status/960231228862599169): The thing is that this was already found a few years ago and I've personally shown that to the relevant people within my government. It seems they decided to keep looking, in directions other than this known solution, but more in the suboptimal direction of political interests.

[Bob Blakely](https://twitter.com/bobblakley/status/959155028291391493): Nonces don't help here; you have to know the nonce to verify the hash, so it's got to be public. And if it's public, the dictionary attack on the underlying attribute is still easy to execute for values from small finite sets.

> [Joe Andrieu:](https://twitter.com/JoeAndrieu/status/959155475605438464) A nonce within the data can remove the the dictionary attack vector.

[Ben Laurie](https://twitter.com/BenLaurie/status/959170395206242304): That makes no sense. You only need to know the nonce to verify the hash if you also know the hashed value. If you don't know the hashed value, then you don't need to know the nonce, either. 

[David G.W. Birch](https://twitter.com/dgwbirch/status/959171133772791808): I think Bobs point is that if you are storing the hash of, say, age then it doesn’t take long to hash 1..129 and compare them with the stored hash. So therefore the hash of the age is PII. Is my interpretation correct Bob? 

[Ben Laurie:](https://twitter.com/BenLaurie/status/959171821135376385) But that's not what you do, you hash 1000 bits of randomness + the age. 

[Nishant Kaushik](https://twitter.com/NishantK/status/959184062358347776): May be a naive question, but what purpose is the (salted) and hashed value of the attribute serving here for the RP (where the RP does not know and is not getting the actual value)? 

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959184440005050369): The RP does get the actual value, along with the nonce, aka the payload. The hash of that payload is on chain, and can be verified as current by inspecting the chain. 

[Nishant Kaushik](https://twitter.com/NishantK/status/959217802535161856): So the RP (multiple RPs?) would receive the original value, associated random (not a nonce since it is reused) and salt over the wire. Doesn't that defeat the security purpose of those?

* * *

* * *

[Tim Bouma](https://twitter.com/trbouma/status/959049367767437312): Lots of confusion between putting encrypted versus hashed info on [<s>#</s>**blockchain**](https://twitter.com/hashtag/blockchain?src=hash). The former is BAD; the latter is ok, if it is a Merkle Root, separated from the Merkle Proof, and of course PII.

> [Bob Blakley](https://twitter.com/bobblakley/status/959109878060068864): Additionally there will be the usual issue with deciding who's authoritative for an attribute - whose signature do you trust for each attribute? So basically you'll have to reinvent PKI to implement this. And if you already have PKI....
> 
> <div style="padding-left: 30px;">[Tim Bouma](https://twitter.com/trbouma/status/959903793826672641): I think that's what we're all trying to figure out. Mass adoption of internet was largely due to no one controlling it. Mass adoption of a [<s>#</s>**verifiableclaims**](https://twitter.com/hashtag/verifiableclaims?src=hash) platform will need the same.</div>

> <div style="padding-left: 60px;">**Thread 1)** [Tim Bouma](https://twitter.com/trbouma/status/959904527800520706): There are some new ingredients in the mix (novel combination of existing ingredients, actually), hashes as guids, POW, etc. Some right combination will be found.</div>
> 
> <div style="padding-left: 60px;">[Adam C. Migus](https://twitter.com/amigus/status/959914410335711232): Meh. It's a new implementation of [<s>#</s>**PKI**](https://twitter.com/hashtag/PKI?src=hash) with a different trust model and role(s) for authorities. The more powerful participants will inevitably control it. If a society or system ever becomes egalitarian, it won't be because of a technology, however new and alluring it might be. </div>

> <div style="padding-left: 60px;"> **Thread 2)** [Adam C. Migus](https://twitter.com/amigus/status/959913557990301696): ...and look what's happening to the internet today i.e. net neutrality. Also look at what's happening with [<s>#</s>**Bitcoin**](https://twitter.com/hashtag/Bitcoin?src=hash). If there is mass adoption it won't stay independent nor will it's participants be assured "sovereignty," it'll be die or co-opted eventually, I'm afraid. </div>
> 
> <div style="padding-left: 60px;"> [Ciaran](https://twitter.com/C1aranMurray/status/959946031814365184): Already kind of has been. Bitcoin Core had to seize control of the development process in order to win the blocksize war. The powers that be now have a leadership that can be captured.</div>
> 
> <div style="padding-left: 30px;">[Adam C. Migus](https://twitter.com/amigus/status/959915437151711237): P.S. thanks for the most plain, non-evasive answer I've ever gotten to that question. If we can cut out the hype and talk about it without rose-colored glasses, we might get somewhere.</div>
> 
> <div style="padding-left: 30px;">[Tim Bouma](https://twitter.com/trbouma/status/959931706433302528): We're trying to tweak the ’I’ in PKI so it can be fair for everyone generations to come.</div>
> 
> <div style="padding-left: 60px;">[Adam C. Migus](https://twitter.com/amigus/status/959940106936291328): ...and IMHO, unless that's an integral part of the discussion and solution, I think this work (if successful) is just as likely to encourage dystopia as it is egalitarianism.</div>
> 
> <div style="padding-left: 30px;">[Adam C. Migus](https://twitter.com/amigus/status/959937326477729792): But that's just it, Tim. Technology can *at best* facilitate fairness, not assure it and, of all the work being done on this, I see no acknowledgement let alone action in response to that reality. The most direct answer I've gotten amounted to "someone else's problem."</div>
> 
> <div style="padding-left: 30px;">[Tim Bouma](https://twitter.com/trbouma/status/959959248154308616): The flipside is that technology can also facilitates unfairness and effect less than desirable outcomes. The point I am trying to make is that we need understand with clarity before we accept or reject anything.</div>
> 
> <div style="padding-left: 60px;">[Tim Bouma](https://twitter.com/trbouma/status/959959570327187456): And "some else's problem" invariably lands in the lap of government to solve. Now might be the opportunity to be a step ahead.</div>
> 
> <div style="padding-left: 30px;">[Adam C. Migus](https://twitter.com/amigus/status/959971973307748353): Agreed, however, a comprehensive threat assessment that addresses actors like authoritarian governments, human traffickers and vulnerable participants is conspicuously absent at this point given it's criticality to understanding the system and developing effective policy for it.</div>
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959321324773556224): Bob, yes. That's the point. The purpose of the Rebooting Web of Trust workshops [<span class="invisible">http://</span><span class="js-display-url">rwot6.eventbrite.com</span><span class="tco-ellipsis"><span class="invisible"> </span></span>](https://t.co/fwc9n2h91M "http://rwot6.eventbrite.com") is to fix what didn't work with PGP WoT and provide an alternative to PKI without the dependency and security risks of centralized root CA.
> 
> <div style="padding-left: 30px;">[Tristan Hoy](https://twitter.com/tristanhoy/status/959922544001277952): Web of Trust is even worse than PKI in an internet setting. It requires end users to signal their political and sexual preferences, meaning that either 1) privacy is nonexistant or 2) alternate points of view can't earn "trust".'</div>
> 
> <div style="padding-left: 30px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959923285097029634): Where did you get that? There is no dependency on signaling anything in the web of trust models I know of.</div>
> 
> <div style="padding-left: 30px;">[Tristan Hoy](https://twitter.com/tristanhoy/status/959933243096145920): How do you establish the correct cryptographic identity for a website? By asking your peers, right?</div>
> 
> [Tim Bouma](https://twitter.com/trbouma/status/959400605939916800): We tried PKI for widescale adoption. We even put in policies and regulations to support. Didn't work. No adoption. Now what? PKI? [<s>#</s>**GroundhogDay**](https://twitter.com/hashtag/GroundhogDay?src=hash)
> 
> <div style="padding-left: 30px;">**Thread 1**<span style="color: #008000;">[Jeff Lombardo](https://twitter.com/IdentityMonk/status/959410795779063808): 1) PKI is working but on a long scale, you think it's not (see let's encrypt) 2) talking of hashing: you need key exchange svc for all to be used, that's what a PKI is for 3) [<s>@</s>**Steve_Lockstep**](https://twitter.com/Steve_Lockstep) MDAV [<span class="invisible">http://www.</span><span class="js-display-url">slideshare.net/Identiverse/ka</span><span class="invisible">ntara-workshop-mdav-mobile-device-attributes-validation-cis-2017</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/vfCWit6Eze "http://www.slideshare.net/Identiverse/kantara-workshop-mdav-mobile-device-attributes-validation-cis-2017") is good example of what you try to achieve with only PKI</span></div>
> 
> <div style="padding-left: 30px;"><span style="color: #008000;">Steve Wilson: The approach we’ve taken with [<s>@</s>**dhsscitech**](https://twitter.com/dhsscitech) [<s>#</s>**MDAV**](https://twitter.com/hashtag/MDAV?src=hash) is to build a private PKI wholly focused on Attribute validation. Every CA signed by the Root CA is authoritative over attributes described in the certificate’s Policy. [<span class="invisible">http://</span><span class="js-display-url">lockstep.com.au/library/identi</span><span class="invisible">ty_authentication/pki-post-blockchain</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/6yOTS9NGjv "http://lockstep.com.au/library/identity_authentication/pki-post-blockchain")</span></div>
> 
> <div style="padding-left: 30px;"><span style="color: #008000;">[Steve Wilson](https://twitter.com/Steve_Lockstep/status/960392366120099840): May I offer some more detail on PKI for attributes? See my [<s>#</s>**CIS2017**](https://twitter.com/hashtag/CIS2017?src=hash) preso [<span class="invisible">http://</span><span class="js-display-url">lockstep.com.au/library/identi</span><span class="invisible">ty_authentication/pki-post-blockchain</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/6yOTS9NGjv "http://lockstep.com.au/library/identity_authentication/pki-post-blockchain") We are witnessing a contest of ideas in the distribution of attributes and verified claims. Ledgers are one idea; Attribute Certs ([<s>#</s>**MDAV**](https://twitter.com/hashtag/MDAV?src=hash)) is another.</span></div>
> 
> <div style="padding-left: 30px;"><span style="color: #008000;">[Steve Wilson](https://twitter.com/Steve_Lockstep/status/960393014274174978): 2\. Seems to me that [<s>#</s>**SelfSovereign**](https://twitter.com/hashtag/SelfSovereign?src=hash) Identity and several IDAM initiatives have all converged on importance of verified claims. If there is to be an "attribute economy" then the reliability and provenance of claims is paramount. -/3</span></div>
> 
> <div style="padding-left: 30px;"><span style="color: #008000;">[Steve Wilson](https://twitter.com/Steve_Lockstep/status/960394134757322752): 3\. So Attribute Supply Chains are emerging. There are various sources of attributes. And different ways of distributing verified attributes. Integrity and provenance are generally assured by digital signatures -/4</span></div>
> 
> <div class="AdaptiveMedia-photoContainer js-adaptive-photo " style="padding-left: 30px;" data-image-url="https://pbs.twimg.com/media/DVQBIejU0AAgWHZ.jpg">![](https://pbs.twimg.com/media/DVQBIejU0AAgWHZ.jpg) [Steve Wilson](https://twitter.com/Steve_Lockstep/status/960395301696634880): 4\. Some like to distribute attributes on a blockchain-like ledger (which I agree has advantages of availability). Another option is "PKI redux" and attribute certificates as used in</div>
> 
> <div class="AdaptiveMedia-photoContainer js-adaptive-photo " style="padding-left: 30px;" data-image-url="https://pbs.twimg.com/media/DVQCRcfU8AACvA8.jpg" data-element-context="platform_photo_card" data-dominant-color="[49,49,64]"><span style="color: #008000;">![](https://pbs.twimg.com/media/DVQCRcfU8AACvA8.jpg)</span> [Steve Wilson](https://twitter.com/Steve_Lockstep/status/960395886156177408): 6\. I reckon the discussion of "PII on a blockchain" (or hashed/encrypted/redeferenced PII) should be framed by the broader question of which medium do you want to use for distributing verified attributes? Contest of ideas!</div>
> 
> <div style="padding-left: 30px;" data-image-url="https://pbs.twimg.com/media/DVQCRcfU8AACvA8.jpg" data-element-context="platform_photo_card" data-dominant-color="[49,49,64]">[Tim Bouma](https://twitter.com/trbouma/status/960509115737964544): Totally on point. The question now becomes, who do you want (if anyone) to provide/control your attribute distribution channel?</div>
> 
> <div style="padding-left: 30px;">[Steve Wilson](https://twitter.com/Steve_Lockstep/status/960510410230136833): It's a really interesting question. Is attributes supply a two-sided market? Classically in [<s>#</s>**IDAM**](https://twitter.com/hashtag/IDAM?src=hash), the RP calls the shots, because they wear most risk. But a competitive attribute economy will feature a range of attribute providers, and most likely new networks.</div>
> 

[Adam C. Migus](https://twitter.com/amigus/status/959902192907030538): "We tried widescale [<s>#</s>**PKI**](https://twitter.com/hashtag/PKI?src=hash) and it didn't work" is a broad-brush characterization of the history while, perhaps ironically also applying to this [<s>#</s>**Blockchain**](https://twitter.com/hashtag/Blockchain?src=hash)-based reinvention of it. What's going to drive mass adoption this time? No one seems to be able to answer that basic question.

> [Tim Bouma](https://twitter.com/trbouma/status/959903793826672641): I think that's what we're all trying to figure out. Mass adoption of internet was largely due to no one controlling it. Mass adoption of a [<s>#</s>**verifiableclaims**](https://twitter.com/hashtag/verifiableclaims?src=hash) platform will need the same.
> 
> [Adam C. Migus](https://twitter.com/amigus/status/959915437151711237): P.S. thanks for the most plain, non-evasive answer I've ever gotten to that question. If we can cut out the hype and talk about it without rose-colored glasses, we might get somewhere.
> 
> [Tim Bouma](https://twitter.com/trbouma/status/959931706433302528): We're trying to tweak the ’I’ in PKI so it can be fair for everyone generations to come.
> 
> [Adam C. Migus](https://twitter.com/amigus/status/959937326477729792): But that's just it, Tim. Technology can *at best* facilitate fairness, not assure it and, of all the work being done on this, I see no acknowledgement let alone action in response to that reality. The most direct answer I've gotten amounted to "someone else's problem."
> 
> [Tim Bouma](https://twitter.com/trbouma/status/959959248154308616): The flipside is that technology can also facilitates unfairness and effect less than desirable outcomes. The point I am trying to make is that we need understand with clarity before we accept or reject anything.
> 
> <div style="padding-left: 30px;">**Thread 1)** [Tim Bouma](https://twitter.com/trbouma/status/959959570327187456): And "some else's problem" invariably lands in the lap of government to solve. Now might be the opportunity to be a step ahead.
> 
> <div style="padding-left: 30px;">**Thread 2)** [Steve Wilson](https://twitter.com/Steve_Lockstep/status/959588380978720769): No reason at all [<s>#</s>**PKI**](https://twitter.com/hashtag/PKI?src=hash) should be any more complicated than magnetic stripe cards. Electromagnetism / cryptography are complex in the theory but readily consumerized. Brief blog: [<span class="invisible">http://</span><span class="js-display-url">lockstep.com.au/blog/2011/01/1</span><span class="invisible">6/embedded-pki-on-the-cards</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/IvVJFrWH5G "http://lockstep.com.au/blog/2011/01/16/embedded-pki-on-the-cards") Longer thesis: [<span class="invisible">http://</span><span class="js-display-url">lockstep.com.au/library/pki/pu</span><span class="invisible">blic_key_superstructure</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/xcV4XvcoAn "http://lockstep.com.au/library/pki/public_key_superstructure")</div>
> 
> <div style="padding-left: 30px;">[Tim Bouma](https://twitter.com/trbouma/status/959762935387185152): I describe what we are doing as the required roadwork (including water and sewer) before the nice neighbourhood can be built. Roadwork is dusty and annoying but needs to be done once every generation or so.</div>
> 
> <div style="padding-left: 30px;">[Tim Bouma](https://twitter.com/trbouma/status/959778943317442560): We are also trying to develop an independent proof channel (at least from my perspective) that is not dependent on any system and can endure for generations. Paper still does the job for this requirement.</div>
> 
> <div style="padding-left: 30px;">**Thread 3)** [Jeff Lombardo](https://twitter.com/IdentityMonk/status/959410795779063808): 1) PKI is working but on a long scale, you think it's not (see let's encrypt) 2) talking of hashing: you need key exchange svc for all to be used, that's what a PKI is for 3) [<s>@</s>**Steve_Lockstep**](https://twitter.com/Steve_Lockstep) MDAV [<span class="invisible">http://www.</span><span class="js-display-url">slideshare.net/Identiverse/ka</span><span class="invisible">ntara-workshop-mdav-mobile-device-attributes-validation-cis-2017</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/vfCWit6Eze "http://www.slideshare.net/Identiverse/kantara-workshop-mdav-mobile-device-attributes-validation-cis-2017") is good example of what you try to achieve with only PKI </div>

> Adam C. Migus: Agreed, however, a comprehensive threat assessment that addresses actors like authoritarian governments, human traffickers and vulnerable participants is conspicuously absent at this point given it's criticality to understanding the system and developing effective policy for it.

[Tim Bouma](https://twitter.com/trbouma/status/959052003988201474): The basic requirement to be fulfilled is proving something was stated at some point in time and that it has not changed since. [<s>#</s>**blockchain**](https://twitter.com/hashtag/blockchain?src=hash)


> [Jeff Lambardo](https://twitter.com/IdentityMonk/status/959191439509897216): But is hash so immutable to sustain as a very old cold proof? As soon as Hash have collision, proof die. What if we store instead proof that "A successfully stated PII ξ Feb 1rst 2018 17:22 EST". Now I know I can trust A to state PII ξ value again if not proved unsuccessful since
> 
> [Ben Laurie](https://twitter.com/BenLaurie/status/959192121554194433): "not useful for proof in a decade" is not the same as "a bad idea". Also, what is your proof technique that will live forever?
> 
> [Jeff Lombardo](https://twitter.com/IdentityMonk/status/959195256787910656): 1) Don't challenge the use case, challenge the mean 2) Yes no hash mechanism is eternal Therefore I don't see added value of storing the hash of the PII ξ value if assurance aims for "A stated PII ξ at one point in time". Immutability of statement is already provided by DLT
> 
> [Jeff Lombardo](https://twitter.com/IdentityMonk/status/959195782581690368): But I join late. May be my bad understanding of the case presented with the question
> 
> [Jeff Lombardo](https://twitter.com/lsaiz/status/959207586724745217): Maybe you try to use hash value of ξ to prove [B] value of ξ did not change But then, there's more value to ask A... Cause if no one asks A to state again successfully value of ξ, DLT is not updated, no trace that ξ value changed. And you will be fooled by the old value of ξ
> 
> <div style="padding-left: 30px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959209507011227648): The assumption is that the issuer *will* update the DLT. That's the value proposition of the blockchain. You can record a hash publicly as a timestamp of a statement, then you can later make public statements *about* that statement, such as revocation, withdrawal, etc.</div>
> 
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959207586724745217):  If you trust the original source, just ask the source.... If you don’t trust the source is game over before starting the game “Crypto can't create trust It merely automates the trust that already exists for other reasons" John Gilmore
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959207872595767296):Asking the source is a privacy violation. The DMV and/or State Dept. have no need to know when I use their credentials to prove i'm over 21 or 18 or whatever.
> 
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959209511088218112): Age is a very special attribute. As far as I know if you sometime in the past was >18 you also are >18 now. Nobody will need to revoque it, obtain an “age attestation” signed by DMV/State and use it at your convenience
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959209825941970945'): Ditto for the right to drive. DMV doesn't need to know where I rent my vehicles. Is it really that hard to imagine a situation where individuals don't want to be surveilled all the time?
> 
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959211043988918273): Ask DMV for a fresh signature including a nonce provided by rent-a-car
> 
> [Jo Andrieu](https://twitter.com/JoeAndrieu/status/959211262918799360): You don't get it. Or you are being intentionally obtuse. Asking the DMV for ANYTHING after the issuance of the credential is a privacy violation. PERIOD.
> 
> <div style="padding-left: 30px;">[David G.W. Birch](https://twitter.com/dgwbirch/status/959211587222425601): What about asking them if the credential has been revoked?</div>
> 
> <div style="padding-left: 30px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959212010587246592): That's bad too. Hence the desire for a distributed system that remains rigorous. Blockchain does that. I'm sure there are other ways, but those who say the blockchain gives you nothing are missing this capability as core to how blockchain increases privacy.</div>
> 
> <div style="padding-left: 30px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959213505848029185): To be fair, how the blockchain *can* increase privacy.</div>
> 
> <div style="padding-left: 60px;">[Jeff Lombardo](https://twitter.com/IdentityMonk/status/959212657088847878): Let's not confuse being obtuse and trying to understand the value of doing things. We don't challenge the case, but the flow and the mean. Otherwise we might all accept that DLT has effectively cured cancer, hunger and poverty as we read it everywhere. Thanks.</div>
> 
><div style="padding-left: 60px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959213053295280129):I'm not talking about cancer. I'm talking about privacy leaks because of checking with the issuer. Luis seems to think that's perfectly acceptable. It's not.</div>
> 
><div style="padding-left: 60px;">[Jeff Lombardo](https://twitter.com/IdentityMonk/status/959213992781729797): I agree that's the exchange. Let's agree we are all of good faith for the final solution to be the best privacy oriented one cause we questioned and challenged it</div>

[Robin Wilton](https://twitter.com/futureidentity/status/959168306652565504): I may be misunderstanding your stmt of reqts, Tim, but I don't see what, on a blockchain, can tell you that an asserted attribute hasn't changed since last asserted.


> David G.W. Birch: Isn’t this where [<s>@</s>**BenLaurie**](https://twitter.com/BenLaurie) and Trillian come in?
> 
> [Robin Wilton](https://twitter.com/futureidentity/status/959172689389850631): (Disambiguation) I assume you mean the Merkle tree thing on Github, not the instant messaging app or the person Arthur Dent singularly failed to get off with.
> 
> <div style="padding-left: 30px;">[David G.W. Birch](https://twitter.com/dgwbirch/status/959172838723850242): Indeed ![😀](https://abs.twimg.com/emoji/v2/72x72/1f600.png "Grinning face")</div>
> 
> [Ben Laurie](https://twitter.com/BenLaurie/status/959173066340339714): Given that the Merkle tree thing on Github is associated with me and the messaging app and fictitious person are not, this is not a giant leap.
> 
> [Robin Wilton](https://twitter.com/futureidentity/status/959174197552537600): I am not a great leaper, I admit ;^)
> 
> [Robin Wilton](https://twitter.com/futureidentity/status/959174668631642112): But I confess, I did have to look it up; I knew of the IM app and Zaphod's girlfriend, but not your trillian, though I know you and Merkle trees are a thing ;^)

[Ben Laurie](https://twitter.com/BenLaurie/status/959172477116133376): I think the claim is that you can't say you made a different assertion at that point in time.


> [Robin Wilton](https://twitter.com/futureidentity/status/959174113142169601): ... on that blockchain. Maybe, but that's not how I read Tim's stated reqt.. Also, suppose I can get two conflicting assertions from diff't authoritative sources; I might append both those at more or less the same time.
> 
> [Tim Bouma](https://twitter.com/trbouma/status/959174714487910401): Sure. Blockchain doesn't solve that problem, but at least it can make you aware of it.

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959173040234930176): Well, duplicitous issuers can always issue simultaneous incompatible assertions...


> **Thread A)**
> [Ben Laurie](https://twitter.com/BenLaurie/status/959182619387809798): Sure, and then we can all see that they did so, and prove they are duplicitous.
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959183014407237632): Not if they hashed the data properly. Only recipients of both payloads can see the duplicity.
> 
> [Ben Laurie](https://twitter.com/BenLaurie/status/959185974587789312): I am confused - are you telling me its possible to badly design protocols that are intended to prove honest behaviour? Coz I already knew that.
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959186338523181056): Lol. Of course that's true. But, no, I'm saying the information on the chain is not comparable, so the "public" can't discover the duplicity. One must be a recipient of both payloads to discern the conflict.
> 
> [Ben Laurie](https://twitter.com/BenLaurie/status/959186892532211712): Right, and if you need that property, then you should design your protocol to assure it. Obviously "put hash of stuff on the magic blockchain" is not a protocol design that solves all problems. Possibly not any problems.
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959187486604869632): Which property did we need? I'm speaking from the work going on in the W3C Credentials Community Group regarding DIDs. It's far more specific than "magic blockchain", which, unfortunately, is a common fools gold sold in these parts.
> 
> [Ben Laurie](https://twitter.com/BenLaurie/status/959188252564557825): In this case, the property was "issuer can't issue incompatible assertions". According to you.
> 
> On W3C, first I heard of it. I was responding to the assertion "putting hashed PII on any immutable ledger(blockchain) is a bad Idea". Which is incorrect, IMO.
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959189112497389568): Ah... that was Tim's rqmt, which I think is poorly worded. We're in agreement about (properly) hashed data on the ledger is ok. Many point to improper hash techniques and believe they are challenging hashed PII on chain generally.

> **Thread B)**
> <span style="color: #808000;">[Robin Wilton](https://twitter.com/futureidentity/status/959324877827211265): Hence Bob's observation that you will also need an OCSP-like revocation service. It's impractical for an RP to scan the blockchain for a more recent, contradictory assertion about the same attribute.</span>
> 
> <span style="color: #808000;">[Ben Laurie](https://twitter.com/BenLaurie/status/959326228607102983): This is why trillian has verifiable mails as well as verifiable logs.</span>
> 
> <span style="color: #808000;">[Ben Laurie](https://twitter.com/BenLaurie/status/959326306512003072): Dammit. Verifiable maps.</span>
> 
> <span style="color: #808000;">[Robin Wilton](https://twitter.com/futureidentity/status/959342479458873344): Mr Birch was right, then... this is indeed where you and trillian come in ;^)</span>

[Tim Bouma](https://twitter.com/trbouma/status/959174140547788801): Of course. But now there is no need to have singular, or few ( duplicitous) CAs.

[Robin Wilton](https://twitter.com/futureidentity/status/959175096178020352): I wasn't assuming CAs or duplicitousness. Suppose I have two bank accounts. [<s>@</s>**dgwbirch**](https://twitter.com/dgwbirch) wants to know if I'm good for £500\. One bank might rightly say "yes", and the other "no".

> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959175785205477376): You might still not be good for it, because, theoretically, you never pay your debts. The banks aren't asserting that. They are asserting that at a given point in time you had > $500\. Which might be useful to a potential debtor.
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959175936993247232): Got that reversed. I mean to a potential creditor.

[Ben Laurie](https://twitter.com/BenLaurie/status/959175319805710336): Then you're good for £500, right?

[Robin Wilton](https://twitter.com/futureidentity/status/959176109102379009): Yes, but neither assertion is false as far as the authoritative source is concerned, and the blockchain might legitimately record both of them at about the same time (sequence being immaterial in this admittedly contrived caase).


> [Robin Wilton](https://twitter.com/futureidentity/status/959176781298327552): Apologies, response time is about to increase, because I'm bizarrely jet-lagged and about to crash..... Thanks for the thought provocation, all.

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959176465920045056): They banks are only asserting information about your account in their institution. Not about your net worth overall. They are distinct assertions.

> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959179384824320001): Hmm... if only we could fix these typos...

[Robin Wilton](https://twitter.com/futureidentity/status/959180907956580357): I was just replying with an example of how two valid but conflicting answers to the same question might end up on the same blockchain at around the same time.

> [Tim Bouma](https://twitter.com/trbouma/status/959181972085071873): Alas, blockchain doesn't actually solve that problem, but let me tell all the problems that blockchain could solve...

[Ben Laurie](https://twitter.com/BenLaurie/status/959182429801144320): The answers in your example are not conflicting.

[Robin Wilton](https://twitter.com/futureidentity/status/959350440604459008): It was a late-night attempt to find a counter-example; the principle is: a blockchain could contain sincere but conflicting assertions of the same attribute for the same individual, e.g. from different authoritative sources. 1/2

[Robin Wilton](https://twitter.com/futureidentity/status/959350915856822272): However, as you say, verifiable maps could form the basis for a solution - or at least transparency - leaving it to the relying party to decide which assertion or AS to believe. 2/2

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959352195417174016): Exactly right. The receiving party decides what to believe from whom and how to reconcile differences. Verifiable Credentials and DIDs should make it easier for AAs to provide privacy-respecting attribute assertions, ideally without even running their own 24x7 endpoint.

* * *

* * *

[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959196707618787328): Will state be changed? By who? Maybe it’s a bad engineering idea to use blockchain as a bulletin board.
Anyway, it depends on the exact PII, just one attribute or a relationship? A SSN or an IP-SSN? A SSN or a SSN-time-geolocation? Who’s asserting the link?

[Tim Bouma](https://twitter.com/trbouma/status/959199752989667335): We are trying to implement what remains an inherent advantage of paper - independence from system. We are still willing to sacrifice authenticity, integrity for this advantage.

[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959200469997490176): Sorry, I don’t understand you.

[Tim Bouma](https://twitter.com/trbouma/status/959201451577872385): Likely due to a different perspective. The requirement (in my view) is to verify something stated at some point in time. Existing approaches introduce dependencies that may not be desireable in the long run.

Luis Saiz Gimeno: Lots of “special” signature schemes can solve it if you clearly state the problem and threat model. Designated verifiers, undeniable signatures, blind signatures, ZKPs, .... Buy forcing the use of blockchains for the shake of blockchain ....

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959207475424632833): Luis, can you point to a non-blochchain scheme that provides for public revocation w/o central authority in the face of compromised keys? How about key rotation without central authority?

[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959207805952647168): Revocation is a centralized task

> [Phil Windley](https://twitter.com/windley/status/959853397397536768): Revocation is a task that has to be done by the issuer, but there are conveniences in using decentralized system for it. 1/ verifier doesn’t have to contact (or know how to contact) issuer 2/ issuer doesn’t have to maintain always on service 3/ availability is enhanced
> 
> [Ben Laurie](https://twitter.com/BenLaurie/status/959858248772964353): You are describing conveniences of a distributed system (which you can achieve cheaply with Trillian) not particularly of a decentralised system. We outlined revocation transparency five years ago. It has all of these properties, without any need of decentralisation.

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959208497178005504): In some schemes, but it doesn't need to be. The issuer can revoke in such a manner that revocation is public and checking status leaks no data to the issuer. Further, the revocation itself can be protected to only be useful to those who already have the payload. No PII leaked.

[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959209826982211585): Where’s blockchain here?

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959210712441618433): Create DID (on chain). Create Verifiable Credential using DID as subject. Post salted hash of VC to chain as timestamp. Now issuer can post to the chain a revocation/adjustment/correction/withdrawal/etc. Anyone with the VC can check the chain to verify timestamp and amendments.

> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959211926193688576): Can DMV run a service with such a list? Make caches too DMV attested, DMV revoqued. Centralized.
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959212514256007171): You're confusing the centralization of the identity platform, which is "on chain" and hence distributed, with the innate centrality of individual authorities. Forcing everyone to interactively check the source is a privacy problem. Which apparently, you don't understand.

[David G.W. Birch](https://twitter.com/dgwbirch/status/959211131976892416): So: you point me at DID to indicate that you have a driving license and then I have to search the blockchain from that date onwards to look for a revocation. I can see that is a logically consistent way of working but how efficient is it?

> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959218564984053765): More correctly, I give you a verifiable credential, with a DID as a subject, which I can prove I control (aka the VC is about me). You can verify it locally w/ math, then also check the chain to see if there is revocation or amendment.
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959218871713460224): It's as efficient as you need it to be. You don't HAVE to check the DLT. If you need lightweight checks, there will be resolvers offering the service; you can check multiples of those if you want redundant checks. Again, privacy & anonymity are about economics. This is part of it

[James Monaghan](https://twitter.com/james_monaghan/status/959215172673032195): That's one of the reasons why [<s>@</s>**SovrinID**](https://twitter.com/SovrinID) lets you (the identity owner) prove non-revocation at the same time as you prove the attributes you're disclosing and the fact that the claim belongs to you. Verifier just checks most recent keys & revocation accumulator from the chain.

[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959216703153557505): Can you use another public service to store the same information? Why blockchain? Which differential property of blockchain are you using? If only issuer can revoque (change state), what kind of consensus about state change is adding blockchain here? That’s my main point.

> **Thread  A)** [Bob Blakley](https://twitter.com/bobblakley/status/959221330876002304):<span style="color: #333399;"> If RPs go directly to AAs, they will always get the current attribute value according to the AA, and you won’t need the revocation mechanism or the hashing.</span>
> 
> <span style="color: #333399;">[Joe Andrieu](https://twitter.com/bobblakley/status/959221330876002304): Yes. But now the AA knows that you are using the credential, and presumably the receiving party. That's an unacceptable privacy leak.</span>
> 
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959223134292504577):<span style="color: #333399;"> I asked you before what exactly DMV is learning from a random nonce and a previously known information</span>
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959223668432805888): <span style="color: #333399;">That I'm asking. Right now. I also don't trust the DMV to maintain a 99.999% reliable 24x7 service endpoint. The idea that all these authorities are going to become reliable service providers is insane. Instead, they post to the chain when their systems need to record a change.</span>
> 
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959226087812329472):<span style="color: #333399;"> In absence of other explanation I assume blockchain use is merely by convenience of availability and even everybody can store all relevant information in their preferred (as much as replicated as possible) systems</span>

> **Thread B)**
>[Bob Blakley](https://twitter.com/bobblakley/status/959221330876002304): <span style="color: #808000;">If RPs go directly to AAs, they will always get the current attribute value according to the AA, and you won’t need the revocation mechanism or the hashing.</span>
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959221616172412928):<span style="color: #808000;"> Yes. But now the AA knows that you are using the credential, and presumably the receiving party. That's an unacceptable privacy leak.</span>
> 
>[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959223134292504577):<span style="color: #808000;"> I asked you before what exactly DMV is learning from a random nonce and a previously known information</span>
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959223668432805888):<span style="color: #808000;"> That I'm asking. Right now. I also don't trust the DMV to maintain a 99.999% reliable 24x7 service endpoint. The idea that all these authorities are going to become reliable service providers is insane. Instead, they post to the chain when their systems need to record a change.</span>
> 
> [Luis Saiz Gimeno:](https://twitter.com/lsaiz/status/959226087812329472)<span style="color: #808000;"> In absence of other explanation I assume blockchain use is merely by convenience of availability and even everybody can store all relevant information in their preferred (as much as replicated as possible) systems</span>

> **Thread C)** <span style="color: #333399;">[Joe Andrieu:](https://twitter.com/JoeAndrieu/status/959217613749460992) The consensus is that the state has or hasn't changed recently and that the issuer's keys are still recognized as valid.</span>
> 
> <span style="color: #333399;">[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959220154193403905): Ok, let’s follow. The only actor that change status is DMV. DMV creates and DMV “deletes”. Nobody else can. Only one party change status. But we need a decentralized system to maintain a consensus on state. Yes, maybe I’m obtuse</span>

> **Thread D)**
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959218607195676673): I’m very interested in this. And will appreciate technical feedback apart from calling me obtuse because nobody dares to do it in any sense to agree or disagree with it or even if it’s just convenience.

> **Thread E)** <span style="color: #808080;">[Bob Blakley](https://twitter.com/bobblakley/status/959220342102380545): It’s a public ledger but you’re using it to store private data</span>
> 
> <span style="color: #808080;">[James Monaghan](https://twitter.com/james_monaghan/status/959220708307030016): Nope. Private data not stored on the chain. Only the material you need to prove its origin and the fact that it belongs to you goes on there. You transfer private data P2P.</span>
> 
> <span style="color: #808080;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959220975849037825): At best, you're using the chain to timestamp the data, through a hash, which is not reversible to the original data. So the data never needs to be on chain.</span>
> 
> <span style="color: #808080;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959221313343700992): That said, ERC 725 [<span class="invisible">https://</span><span class="js-display-url">github.com/ethereum/EIPs/</span><span class="invisible">issues/725</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/MxkpBM9sj2 "https://github.com/ethereum/EIPs/issues/725") fails to address any of this, treating keys as "identity", so yes, I'll accept that some blockchain identity solutions aren't up to snuff.</span>
> 
> **Thread F)** <span style="color: #808000;">[Bob Blakley](https://twitter.com/bobblakley/status/959220972598562817): The third of these is the one I’m really stocking on. Since you need trusted AAs anyway, why not just have RPs go to them directly rather than go to the Blockchain?</span>
>  
> <span style="color: #808000;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959232394426425344): Because trust is not a blanket. We trust AAs to be authoritative on some attribute. That doesn't mean we should trust them with usage data or require them to maintain 24x7 attribute stores.</span>

> **Thread G)**
> [Ben Laurie](https://twitter.com/BenLaurie/status/959666631231275008): That's why you should use trillian.
> 
> [Kaliya Young](https://twitter.com/IdentityWoman/status/959673956218298368): What is Trillian?
> 
> <div style="padding-left: 30px;">[Ben Laurie](https://twitter.com/BenLaurie/status/959705686732103680): [<span class="invisible">https://</span><span class="js-display-url">github.com/google/trillian</span><span class="tco-ellipsis"><span class="invisible"> </span></span>](https://t.co/qwnDo6v9H1 "https://github.com/google/trillian").</div>
> 
> <div style="padding-left: 30px;">[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959729413381292032): Need to ralk.....</div>

> [Ben Laurie](https://twitter.com/BenLaurie/status/959756419368148992): Or, to put it another way, the distillation of 6 years of designing and building global scale verifiable ledgers. A fast, scaleable, robust, general purpose verifiable ledger and verifiable map software suite. That doesn't waste energy.
> 
> [Tim Bouma](https://twitter.com/trbouma/status/959760925036351489): Good stuff. But it really boils down to verifying using a Merkle Tree (large or small), the root of which has to be somewhere and provably associated with someone/something at some point in time. For longevity, I'd prefer to depend on a blockchain than somebody's SQL instance.
> 
> [Ben Laurie](https://twitter.com/BenLaurie/status/959855974726230017): Don't understand this point: Trillian ledgers and maps are trivially mirrorable by anyone. What property is "a blockchain" giving you that you don't get from Trillian + mirrors?
> 
> <div style="padding-left: 30px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959892942008680448): How do trillian and mirrors give you distributed consensus? The shared agreement about state, absent a central authority, is what blockchain gives you for decentralized identifiers. I'm not yet seeing that in the trillian+mirrors proposal. Am I missing something?</div>
> 
> <div style="padding-left: 30px;">[Ben Laurie](https://twitter.com/BenLaurie/status/959893507992375297): Have you read [<span class="invisible">https://</span><span class="js-display-url">medium.com/@benlaurie_183</span><span class="invisible">78/distributed-verifiable-ledgers-a-framework-5b130cc8ef60</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/sUwMNyW9Tt "https://medium.com/@benlaurie_18378/distributed-verifiable-ledgers-a-framework-5b130cc8ef60")? It would help frame the conversation if you have...</div>
> 
> <div style="padding-left: 30px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959894103071707136): Excellent. I'll read it. It took me a while to feel like I "got" what blockchain does, so I'm happy to invest some time to unpack what you're explaining.</div>
> 
> <div style="padding-left: 30px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959875122306850817): Thanks. This is worth understanding better.</div>

> [Anil John](https://twitter.com/aniltj/status/959891983375446016): This is resonating with something I've been trying to figure out: Every tech hype cycle ("SOA", "Cloud") leaves a residue behind that changes how we build software, systems, and services. What will Blockchain/DLT leave behind? Hmm ...
> 
> <div style="padding-left: 30px;">[David G.W. Birch](https://twitter.com/dgwbirch/status/959950344913485824): Transparency</div>
> 
> <div style="padding-left: 30px;">[David Fields](https://twitter.com/davetfields/status/959950527411863552): Hardware</div>
> 
> <div style="padding-left: 30px;">[Leif Johansson](https://twitter.com/leifjohansson/status/959898021281652738): All of those other trends had utility before hype. The utility is what is left when the hype has ebbed. In this case I suspect the ebb will leave behind... nothing much</div>
> 
> <div>[Ben Laurie](https://twitter.com/BenLaurie/status/959892776262471680): Inversion of vulnerability (what many call "trust") - instead of me having to figure out, somehow, that your public key is really yours and not some imposter, you have to ensure that the ledger has the correct key, and I merely have to consult the ledger. For example.</div>
> 
> <div>[Christopher Allen](https://twitter.com/ChristopherA/status/959905242031804418): I find a quote by [<s>@</s>**BenLaurie**](https://twitter.com/BenLaurie) “‘Inversion of vulnerability’ (what many call ‘trust’)” interesting. There is a core truth to it, but I also feel that there is something subtle missing from it that I can’t quite pin down. Maybe because vulnerability can incentivize collaboration?</div>
> 
> <div style="padding-left: 30px;">[Jeff Lombardo](https://twitter.com/IdentityMonk/status/959944035329871872): Trust is the result of a risk analysis. Paranoiac? Don't trust a CA cert but only correlation of 15 hash value of this cert acquired through 15 independent methods. Then, if you finally trust it, you just lowered your vuln score, but you are still at risk of consuming the service</div>
> 
> <div>[Ben Laurie](https://twitter.com/BenLaurie/status/959912863778463744): I object to the word "trust" because mostly when people say "A trusts B" they mean "A is vulnerable to B". I don't "trust" certification authorities. Or any "trusted third party". I am, however, vulnerable to them. So, that's what I'm getting at.</div>
> 
> <div style="padding-left: 30px;">**Thread 1)** [Jeff Lombardo](https://twitter.com/IdentityMonk/status/959942282404298752):That's a nice definition. But it is just the other side of the same coin. Cause you accept to be vulnerable. As long as you think you are less vulnerable than what you gain from using the related service.</div>
> 
> <div style="padding-left: 30px;">**Thread2)** 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959953298684964864): Actually, you are forced to trust them, assuming you want to use browsers to access HTTPS content.</div>

> <div style="padding-left: 30px;">
> **Thread 3)** [David G.W.Birch](https://twitter.com/dgwbirch/status/959948799866105856):  In the world of fintech, I think A “trusts” B in the sense that if things go wrong, B has legal liability to A.</div>
> 
> <div style="padding-left: 30px;">[Bob Blakley](https://twitter.com/bobblakley/status/959952479470477313): Indemnity is not trust. If you have indemnity, you don’t need trust. To quote a well-known sage ![😁](https://abs.twimg.com/emoji/v2/72x72/1f601.png "Grinning face with smiling eyes"), trust is for suckers.</div>
> 
> <div style="padding-left: 30px;">[David G.W. Birch](https://twitter.com/dgwbirch/status/959953044044578816): This is much too interesting a discussion to be on Twitter. Who’s going to be at KnowID?</div>
> 
> <div style="padding-left: 60px;">[Kaliya Young](https://twitter.com/IdentityWoman/status/959980973319380992): I might go but no one has asked me to be on a panel or speak yet. It’s gonna be a great IIW you should come.</div>
> 
> <div style="padding-left: 60px;">[Christopher Allen](https://twitter.com/ChristopherA/status/959975435932086272): I’ll be at [<s>#</s>**RebootingWebOfTrust**](https://twitter.com/hashtag/RebootingWebOfTrust?src=hash) & [<s>#</s>**IIW**](https://twitter.com/hashtag/IIW?src=hash).</div>
> 
> <div style="padding-left: 60px;">[Ben Laurie](https://twitter.com/BenLaurie/status/960016655135989760): Thanks for using the proper name so I could Google it. Anyway, not me if I can help it.</div>
> 
> <div style="padding-left: 30px;">**Thread 4:** [Bob Blakley](https://twitter.com/bobblakley/status/959914736094732293): During the CORBASecurity standardization process, we became so frustrated with the imprecise use of "trust" that we began to require that it only be used in sentences of the form "A trusts B to do X to Y", optionally with the qualifier "under conditions Z"</div>
> 
> [Kaliya Young](https://twitter.com/IdentityWoman/status/959931351800545280): I've been objecting to the word trust since I figured out what the NSTIC folks thought they meant by the word "trust framework". <<---that is a bad name for that thing...they said come up with a better word.... I did ... they ignored...[<span class="invisible">https://</span><span class="js-display-url">identitywoman.net/the-trouble-wi</span><span class="invisible">th-trust-the-case-for-accountability-frameworks/</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/yDnBBUFoJv "https://identitywoman.net/the-trouble-with-trust-the-case-for-accountability-frameworks/") sigh.
> 
> [Hamish MacEwan](https://twitter.com/HamishMacEwan/status/959957216714399744): I don't trust, I verify. Verifiable claims, loved that working group
> 
> [David G.W. Birch](https://twitter.com/dgwbirch/status/959960439772692480): OK. You verify. Weatherspoon’s confirm that I am over 18\. I log in to your porn site. Turns out I am actually only 17\. You get prosecuted.
> 
> So what was the point of the verifiable claim?
> 
> [Hamish MacEwan](https://twitter.com/HamishMacEwan/status/959964703719022593): I wasn't able to verify a Witherspoons could make a verifiable claim about your age.

[Bob Blakley](https://twitter.com/bobblakley/status/959220194488012806): It’s an immutable ledger but you’re using it to store mutable values

> [James Monaghan](https://twitter.com/james_monaghan/status/959220996648656897): Nope. Using it to show an auditable history of the changes to certain metadata (including keys and revocation material).
> 
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959222316579291136): Certificate transparency. Just verifiable logging. Or it is Haber-Stornetta a blockchain? Blockchain uses the underlying data structure, but it is consensus of state changes what makes it a different beast

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959223056332857344): Just like the amount of bitcoin in a given account is mutable over time. Don't confuse the mysticism of "immutability" with how blockchains actually maintain an ordered state. The state of the chain mutates EVERY BLOCK.

[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959225208723988481): By those who have authority to do it though their private keys, transferring that authority to another user by means of a shared state change consensus. Sorry about it but you cannot transfer your driving license

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959225713755762688): Sure, I can. My DID isn't *me*. It's just one endpoint I can prove I control. If that DID is compromised or its keys needs rotation, I can transfer the control of the DID to another, both just as valid as representing ME through proof of control.

> **ThreadA)**
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959227164775284738): Please transfer your DL to me, how much is it? Identity attributes cannot be transferred, that’s why there’s no status change and blockchain is not needed</div>
> [Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959228903544979456): And sorry, 1:50 am here</div>
> 
> Tomorrow I’ll check if somebody provided a reasoned explanation beyond convenience (it can be challenged too, I need to run a node or must rely on a 3rd party to check the blockchain? The world sustained by a tortoise sustained by another...)
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959229172559196161): Not trusting central authorities isn't about convenience. It's about freedom.
> 

> **Thread B)** <span style="color: #333399;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959225991469002753): That said, most real-world credentials will have some form of real-world proofing capability such as a photo or observable attributes like age, weight, etc. Proof of control, via keys, should only ever be considered one factor in identity assurance</span>
> 
> <span style="color: #333399;">[David G.W. Birch](https://twitter.com/dgwbirch/status/959348259075444738): This is mixing up identification and authentication.</span>
> 
> <span style="color: #333399;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959353668846813184): Not at all. I'm acknowledging that some authentication use cases depend on reliable identity assurance. Proof of control, such as envisioned in most DID Authentication plans, is just one factor that should be used for identity proofing. Changing DIDs != changing identity.</span>
>

> **Thread C)**
> <span style="color: #808000;">[Christopher Allen](https://twitter.com/ChristopherA/status/959337670269747201): Relevant to this thread, next week is the 1st Tuesday of the month which we call “Crypto Tuesday” where the W3C Credentials CG will be reviewing our crypto, privacy & security work items. On agenda is Data Minimization. Call is 12pm ET 9am PT.</span> [<span style="color: #808000;"><span class="invisible">https://</span><span class="js-display-url">w3c-ccg.gitub.io</span></span><span class="tco-ellipsis"><span class="invisible"><span style="color: #808000;"> </span></span></span>](https://t.co/fXiNjcgumE "https://w3c-ccg.gitub.io")


> **Thread D)** <span style="color: #333399;">[Luis Saiz Gimeno](https://twitter.com/lsaiz/status/959211926193688576): Can DMV run a service with such a list? Make caches too DMV attested, DMV revoqued. Centralized.</span>
> 
> <span style="color: #333399;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959212514256007171): You're confusing the centralization of the identity platform, which is "on chain" and hence distributed, with the innate centrality of individual authorities. Forcing everyone to interactively check the source is a privacy problem. Which apparently, you don't understand.</span>

[Ben Laurie](https://twitter.com/BenLaurie/status/959357048772349952): If its keys are compromised, so can the attacker. And if its keys are lost, you can't.

That's the problem that actually needs solving but is apparently being punted in favour of yet another round of specification for what we already know how to do.

But hey, you can have an ICO.

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959358134186749952): You can address these on chain, although to be fair, we're still figuring out the tradeoffs of different approaches. For example, you can, via smart contract, provide alternative update mechanisms, including time-without-challenge and social recovery. So... not punted at all

> [Ben Laurie](https://twitter.com/BenLaurie/status/959359130959048705): Where are these in the working group documents? Also social recovery is a terrible idea, and I have no idea what time-without-challenge is.
> 
> <div style="padding-left: 30px;">[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959360137017229312): about the working group docs, I don't think either of those terms have made it that far. Like I said, we're still figuring out the tradeoffs.</div>
> 
> <div style="padding-left: 30px;">[Ben Laurie](https://twitter.com/BenLaurie/status/959364283984482306): I don't see the problem even mentioned in the WG docs. Is it?</div>
> 
> <div style="padding-left: 30px;">[Christopher Allen](https://twitter.com/ChristopherA/status/959576387559374848): Some items in progress (VERY early drafts!) are the Redaction Signature Suite (which allows for data minimization) [<span class="invisible">https://</span><span class="js-display-url">w3c-dvcg.github.io/lds-redaction2</span><span class="invisible">016/</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/Ap81ME38tP "https://w3c-dvcg.github.io/lds-redaction2016/") & Pseudonymous Signature Suite (which enables selective disclosure) [<span class="invisible">https://</span><span class="js-display-url">w3c-dvcg.github.io/lds-pseudonymo</span><span class="invisible">us2016/</span><span class="tco-ellipsis"><span class="invisible"> </span>…</span>](https://t.co/yJ3PoWZfUL "https://w3c-dvcg.github.io/lds-pseudonymous2016/") and requirements docs</div>
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959359603170398209): I expect both of those terms are so ill-defined as to preclude much reasonable discussion, especially as social recovery has so many potential forms, it's agressive of you to dismiss it as a terrible idea.
> 
> [Ben Laurie](https://twitter.com/BenLaurie/status/959360089688813568): I would call it realistic. But yes they are ill defined, which is why I asked where they were documented.
> 
> [Joe Andrieu](https://twitter.com/JoeAndrieu/status/959361710749446144): Even a simple multi-sig can prevent the theft of a single key from updating a DID record. It isn't hard to imagine what you can do to "enhance" key management with scriptSig or Solidity. The hard part is understanding the consequences of those enhancements.

[Ben Laurie](https://twitter.com/BenLaurie/status/959359305052033024): And what the hell do you mean "you can address these on chain"?

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959360585086283778): By on-chain, I mean that there are schemes for addressing these issues that involve using the blockchain for rotation, escalation, and recovery. These schemes are young and immature, but the options are being explored, debated, and implemented. Solutions will emerge.

[Ben Laurie](https://twitter.com/BenLaurie/status/959365014502170625): The mechanics are easy enough. That's not the problem. The problem is recovering from total key loss, or key compromise, which blockchain makes no difference to.

To be frank: I've been thinking about this problem for years, and I've concluded that you need authorities.

> [Ben Laurie](https://twitter.com/BenLaurie/status/959365216478924800): Of course, this knocks a giant hole in the core idea of "self-sovereign", but that's the way it is.
> 
> [Filipe Farinha](https://twitter.com/ktorn/status/959399460232052736): Key management issues can be fixed in a decentralised way. You will probably need trusted wearables for it to work, but it’s possible.
> 
> [Tim Bouma:](https://twitter.com/trbouma/status/959400989794152448) Similar to having two car keys. And going to an authorized dealer if you lose one.
> 
> [Filipe Farinha](https://twitter.com/ktorn/status/959403920450703362): Not really, unless the backup key was originally co-signed by you and that is recorded on the public ledger. If a third-party can revoke your keys, or issue new ones, without your publicly verifiable consent you’re doing it wrong.

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959366264652152833): I appreciate your time invested. So, why don't you think social recovery--in some form--is a viable alternative to authorities? Isn't my social network a better authority on who I am than some displaced "authority" sitting in a corporate data center a thousand miles away?</div>

[Ben Laurie](https://twitter.com/BenLaurie/status/959477428237238272): Because your social network has no obligation to you and is easily fooled. If they screw up, what is your recourse? You need someone with a contractual relationship with you, and sufficient reserve to fix what they break when they screw up.

[Joe Andrieu](https://twitter.com/JoeAndrieu/status/959481849230708736): I find my most meaningful relationships are not defined by contract. Rather, I use contracts to handle exceptions, especially with people I don't know. It sounds like you don't believe a resilient system can be built on top of individually untrustworthy actors.

* * *
* * *

[Giyom](https://twitter.com/giyom/status/959059113857630208): Putting hashed PII directly is an obvious bad idea but I would ask: is it a bad idea to put a hash of a verifiable claim which aggregates in a single object: PII, an issuer identifier, timestamps, payload sigs, subject identifier (typically a new random one for each claim). 

[Bas Kaptijn](https://twitter.com/bkaptijn/status/959185695939137538): To verify that an attestation really relates to an off ledger claim you'll need to be able to corelate it. If a hash (in attestation) is taken from a hard enough to guess mostly random one time use (per relationship) claim it can be made more "quantum safe" than the dlt used is.?

* * *

[Stephan Engberg](https://twitter.com/Engbrg/status/959354428255072256): You ask why pushing information about people online isn't a bad idea? Lots of reason why it is a bad idea: Abuse, lock-in, control (especially to to the online account model), legal. None to the opposite. Data should be locked to transactions, not to people. No reuse of Id! 

[Stephan Engberg](https://twitter.com/Engbrg/status/959356463536893952): Because hashing are ALWAYS susceptible to dictionary attacks and thus a security illusion as they leak data. Besides we talk deterministic cryptography which means it will be broken some day - e.g. hash collisions in which case they can be used to prove anything 

[Stephan Engberg](https://twitter.com/Engbrg/status/960103882511847425): Let's be very clear here - identity has to be resolved OUTSIDE an online blockchain as it will otherwise turn into a tool for centralized control 

[Stephan Engberg](https://twitter.com/Engbrg/status/959358821159374848): An example of what you NEVER EVER do is creating a genocide database storing non-revocable biometrics. A hash of biometrics even including other PII data is non-revocable biometrics A genocide database is any database that makes it possible to identify you from biometrics. ![](https://pbs.twimg.com/media/DVBTSKnX0AEdKMD.jpg)  
