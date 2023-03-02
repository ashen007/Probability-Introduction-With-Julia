## sample space (_S_)

sample space is the set of all possible outcomes of the experiment. sample space of an
experiment can be finite, countably infinite or uncountably infinite.

## event

an event is a subset of sample space.

### special event definitions

| description                         | set notation                                                       |
|-------------------------------------|--------------------------------------------------------------------|
| **events and occurrences**          |                                                                    |
| sample space                        | $S$                                                                |
| $s$ is a possible outcome           | $s \in S$                                                          |
| $A$ is an event                     | $A \subseteq S$                                                    |
| $A$ occurred                        | $s_actual \in A$                                                   |
| something must happen               | $s_actual \in S$                                                   |
|                                     |                                                                    |
| **new events from old events**      |                                                                    |
| $A$ or $B$ (inclusive)              | $A \cup B$                                                         |
| $A$ and $B$                         | $A \cap B$                                                         |
| not $A$                             | $A^c$                                                              |
| $A$ or $B$, but not both            | $(A \cap B^c) \cup (A^c \cap B)$                                   |
| at least one of $A_1,...,A_n$       | $A_1 \cup ... \cup A_n$                                            |
| all of $A_1,...,A_n$                | $A_1 \cap ... \cap A_n$                                            |
|                                     |                                                                    |
| **relationships between events**    |                                                                    |
| $A$ implies $B$                     | $A \subseteq B$                                                    |
| $A$ and $B$ are mutually exclusive  | $A \cap B = \emptyset$                                             |
| $A_1,...A_n$ are a partition of $S$ | $A_1 \cup ... \cup A_n = S, A_i \cap A_j = \emptyset for i \neq j$ |

## naive definition of probability

let $A$ be an event for an experiment with a finite sample space $S$. the _naive probability_ of $A$ is,

$$P_naive(A) = {{\mid A \mid} \over {\mid S \mid}} 
= {\text{number of outcomes favorable to A} \over \text{total number of outcomes in S}}$$

when naive definition will be applicable:

- if the problem interested has symmetry, for example flip a coin or well shuffled deck
  of cards.
- when the outcomes are equally likely by design.
- when the naive definition serves as a useful _null model_.

## non-nive definition of probability

A probability space consists of a sample space $S$ and a _probability function_ $P$ which takes an event 
$A \subseteq S$ as input and returns $P(A)$, a real number between 0 and 1, as output. The function $P$ must 
satisfy the following axioms:

- $P(\emptyset) = 0, P(S) = 1$
- if $A_1, A_2, ..., A_n$ are disjoint events, then,

$$P\left( {\bigcup}_{j=1}^\infty A_j \right) = {\sum}_{j=1}^\infty P(A_j)$$

  (meaning that these events are disjoint, they are mutually exclusive events)

the axioms don't tell us how probability should be _interpreted_. 

"the frequentist view of probability is that it represents a long-run frequency over a large 
number of repetitions of an experiment: if we say a coin has probability 1/2 of Heads, that 
means the coin would land Heads 50% of the time if we tossed it over and over and over."

"the Bayesian view of probability is that it represents a degree of belief about the
event in question, so we can assign probabilities to hypotheses like "candidate A
will win the election" or "the defendant is guilty" even if it isn't possible to repeat
the same election or the same crime over and over again.

### properties of probability

- $P(A^c) = 1 - P(A)$
- if $A \subseteq B$, then $P(A) \leq P(B)$

<p align="center">
<img height="284" src="../../../images/Asset%2011.png" width="422" alt="axiom_2"/>
</p>

since $A$ and $B \cap A^c$ are disjoint, we can apply the second axiom,

$$P(B) = P(A \cup (B \cap A^c)) = P(A) + P(B \cap A^c)$$

probability is non-negative, so $P(B \cap A^c) \geq 0$, proving that $P(B) \geq P(A)$

- $P(A \cup B) = P(A) + P(B) - P(A \cap B)$

<p align="center">
<img height="222" src="../../../images/Asset%205.png" width="344" alt="axiom_3"/>
</p>

$$\eqalign{
P(A \cup B) &= P(A \cup (B \cap A^c)) = P(A) + P(B \cap A^c) \\
P(B \cap A^c) &= P(B) - P(A \cap B)
}$$

the third property is a special case of inclusion-exclusion, a formula for finding the probability of a 
union of events when the events are not necessarily disjoint. We showed above that for two events $A$ and $B$,

$$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$

for three events, inclusive-exclusive says,

$$\eqalign{
P(A \cup B \cup C) &= P(A) + P(B) + P(C) \\
                   &- P(A \cap B) - P(A \cap C) - P(B \cap C) \\
                   &+ P(A \cap B \cap C)
}$$

for an example, suppose choosing 13 cards hand from well shuffle 52 card deck, what will be the
probability of an at least one suit void

<p align="center">
<img height="508" src="../../../images/Asset%2012.png" width="563" alt="at least one suite void"/>
</p>

$\text{lets define events for each suite being void, }$

- S : scope void
- D : diamond void
- H : heart void
- C : clubs void

$\text{to find the probability of at least one suite void need to find, }$ $P(S \cup D \cup H \cup C)$

from inclusion-exclusion,

$$\eqalign{
p(S \cup D \cup H \cup C) &= p(S) + p(D) + p(H) + p(C) \\ 
                          &- (p(S \cap D) + p(D \cap H) + p(H \cap C) + p(S \cap H) + p(S \cap C) + p(D \cap C)) \\
                          &+ (p(S \cap D \cap H) + p(D \cap H \cap C) + p(S \cap H \cap C) + (D \cap C \cap S)) \\
                          &- p(S \cap D \cap H \cap C) \\
\\
p(S) = p(D) = p(H) = p(C) = {{13 \choose 39} \over {13 \choose 52}}; \\
p(S \cap D) = p(D \cap H) = p(H \cap C) = p(S \cap H) = p(S \cap C) = p(D \cap C) = {{13 \choose 26} \over {13 \choose 52}}; \\ 
p(S \cap D \cap H) = p(D \cap H \cap C) = p(S \cap H \cap C) = (D \cap C \cap S) = {{13 \choose 13} \over {13 \choose 52}} \\
\\
                          &= 4p(S) - 6p(S \cap D) + 4p(S \cap D \cap H) - p(S \cap D \cap H \cap C) \\
                          &= 4*{{13 \choose 39} \over {13 choose 52}} - 6*{{13 \choose 26} \over {13 \choose 52}}
                             +4*{{13 \choose 13} \over {13 \choose 52}} - 0 \\
                          &= 0.051
}$$

general version of inclusion exclusion,

$$\eqalign{
P \left( {\bigcup}_{i=1}^n A_i \right) &= {\sum}_i P(A_i) - {\sum}_{i \lt j} P(A_i \cap A_j) 
                                       &+ {\sum}_{i \lt j \lt k} P(A_i \cap A_j \cap A_k) - ...
                                       + (-1)^{n+1} P(A_1 \cap ... \cap A_n)
}$$