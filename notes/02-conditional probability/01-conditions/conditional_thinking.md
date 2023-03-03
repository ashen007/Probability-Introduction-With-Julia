For example, that one morning we are interested in the event R that it will rain that day. 
Let P(R) be our assessment of the probability of rain before looking outside. If we then 
look outside and see ominous clouds in the sky, then presumably our probability of rain 
should increase;

we denote this new probability by $P(R|C)$ (read as "probability of R given C"), where $C$ 
is the event of there being ominous clouds. When we go from $P(R)$ to $P(R|C)$, we say that 
we are "conditioning on C". As the day progresses, we may obtain more and more information 
about the weather conditions, and we can continually update our probabilities. If we observe
that events $B1, ..., Bn$ occurred, then we write our new conditional probability of rain 
given this evidence as $P(R|B1, ..., B)$. If eventually we observe that it does start raining, 
our conditional probability becomes 1.

## conditional probability definition

If $A$ and $B$ are events with $P(B) > 0$,then the conditional probability of $A$ given $B$, 
denoted by $P(A|B)$, is defined as

$$P(A|B) = {{P(A \cap B} \over {P(B)}}$$

here $A$ is the event whose uncertainty want to update, and $B$ is the evidence observed. we call
$P(A)$ the _prior probability_ of $A$ and $P(A|B)$ the _posterior probability_ of $A$. "prior"
means before updating based on the evidence, and "posterior" means after updating based on the 
evidence.

for example, $A$ standard deck of cards is shuffled well. Two cards are drawn randomly, one at a 
time without replacement. Let $A$ be the event that the first card is a heart, and $B$ be the 
event that the second card is red.

$$\eqalign{P(A|B) &= {{P(A \cap B)} \over {P(B)}} \\ 
\\
      P(A \cap B) &= {{13 \dot 25} \over {52 \dot 51}} = {25 \over 204} \\
             P(B) &= {26 \over 52} = {1 \over 2} \\
\\
\text{by symmetry: from a vantage point before having done the experiment, the second card 
is equally likely to be any card in the deck.}
\\
             P(A) &= {13 \over 52} = {1 \over 4} \\
\\
P(A|B) &= {{P(A \cap B)} \over {P(B)}} = {{25 \over 204} \over {1 \over 2}} = {25 \over 102} \\
P(B|A) &= {{P(B \cap A)} \over {P(A)}} = {{25 \over 204} \over {1 \over 4}} = {25 \over 51}
}$$

### note

- $P(A|B) \neq P(B|A)$
- Both $P(A|B)$ and $P(B|A)$ make sense (intuitively and mathematically); the chronological order in 
  which cards were chosen does not dictate which conditional probabilities we can look at. When we 
  calculate conditional probabilities, we are considering what information observing one event 
  provides about another event, not whether one event causes another

### some intuitions

<img height="211" src="../../../images/Asset%2013.png" width="926" alt="pebble world"/>

Pebble World intuition for $P(A \mid B)$. From left to right: 

(a) Events $A$ and $B$ are subsets of the sample space

(b) Because we know $B$ occurred, get rid of the outcomes in $B^c$

(c) In the restricted sample space, _re-normalize_ so the total mass is still 1.

    This is achieved by dividing by $P(B)$, the total mass of the pebbles in $B$. The updated mass of the 
    outcomes corresponding to event $A$ is the conditional probability $P(AjB) = {{P(A | B)} \over {P(B)}}$.