# Blockchain Timestamps Unnecessary In Proof-of-Work?

*Author: Greg Slepak ([@taoeffect@mastodon.social](https://mastodon.social/@taoeffect))*

----

The Bitcoin blockchain has a 10-minute target blocktime that is achieved by a difficulty adjustment algorithm.

I assert, or rather, pose the hypothesis, that the use of timestamps in Bitcoin's blockchain is completely unnecessary, and that Bitcoin can operate with the same security guarantees entirely without it, and therefore does not need miners to maintain global clock synchronization.

The alternative difficulty adjustment algorithm would work according to the following principles:

- The incentive for miners is and always has been to maximize profit.
- The block reward algorithm is now modified to issue coins into perpetuity (no maximum). Any given block can issue _up to_ `X` number of coins per block.
- The number of coins issued per block is now tied directly to the difficulty of the block, and the concept of "epocs" or "block reward halving" is removed.
- The chain selection rule remains "chain with most proof of work"
- The difficulty can be modified by miners in an arbitrary direction (up or down), but is limited in magnitude by some maximum percentage (e.g. no more than 20% deviation from the previous block), we call this `Y%`.

### Observations

- Miners are free to mine blocks of whatever difficulty they choose, up to a maximum deviation
- The blockchain may at times produce blocks very quickly, and at other times produce blocks more slowly
- Powerful miners are incentivized to raise the difficulty to remove competitors (as is true today)
- Whether miners choose to produce blocks quickly or slowly is entirely up to them. If they produce blocks quickly, each block has a lower reward, but there are more of them. If they produce blocks slowly, each block has a higher reward, but there are fewer of them. So an equilibrium will be naturally reached to produce blocks at a rate that should minimize orphans.

A timestamp may still be included in blocks, but it no longer needs to be used for anything, or represent anything significant other than metadata about when the miner claims to have produced the block.
