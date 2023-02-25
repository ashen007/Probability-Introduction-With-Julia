## sample space (_S_)

sample space is the set of all possible outcomes of the experiment. sample space of an
experiment can be finite, countably infinite or uncounatbly infinite.

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