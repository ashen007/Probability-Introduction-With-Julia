## probability of the intersection of two events

for any events $A$ and $B$ with positive probabilities,

$$\eqalign{P(A \mid B) &= {P(A \cap B)} \over {P(B)} \\
           P(B \mid A) &= {P(B \cap A)} \over {P(A)} \\
\\
           P(A \cap B) &= P(A \mid B).P(B) \\
           P(B \cap A) &= P(B \mid A).P(A) \\
\\
           \because P(A \cap B) = P(B \cap A) \\
\\
           P(A \mid B).P(B) = P(B \mid A).P(A)
}$$

more generally conditional probability can express, 

$$\eqalign{
P(A_1, A_2, ..., A_n) = P(A_1).P(A_2 \mid A_1).P(A_3 \mid A_1, A_2) ... P(A_n \mid A_1, ..., A_{n-1}) \\
\text{commas denote intersections }, P(A_3 \mid A_1, A_2) = P(A_3 \mid A_1 \cap A_2)
}$$

## bayes' rule

$$P(A \mid B) = {P(B \mid A).P(A)} \over {P(B)}$$

this rule can rewrite with _odds_. odds of the event $A$ are,

$$odds(A) = {P(A)} \over {P(A^c)}$$

By taking the Bayes' rule expression for $P(A \mid B)$ and dividing it by the Bayes' rule
expression for $P(A^c \mid B)$, we arrive at the odds form of Bayes' rule.

$${P(A \mid B)} \over {P(A^c \mid B)} = {{P(B \mid A)} \over {P(B \mid A^c}} . {{P(A)} \over {P(A^c)}}$$

in words, this says that the posterior odds ${P(A \mid B)} \over {P(A^c \mid B)}$ are equal to the prior
odds ${P(A)} \over {P(A^c)}$ times the factor ${P(B \mid A)} \over {P(B \mid A^c)}$, which is known in 
statistics as the _likelihood ratio_. Sometimes it is convenient to work with this form of Bayes' rule to 
get the posterior odds, and then if desired we can convert from odds back to probability.

## law of total probability

The law of total probability (LOTP) relates conditional probability to unconditional probability. It is 
essential for fulfilling the promise that conditional probability can be used to decompose complicated 
probability problems into simpler pieces, and it is often used in tandem with Bayes' rule.

let $A_1, ..., A_n$ be a partition of the sample space $S$, with $P(A_i) > 0 for all $i$. then

$$eqalign{P(B) &= \sum_{i=1}^n P(B \mid A_i).P(A_i)}$$
$$eqalign{B &= (B \cap A_1) \cup (B \cap A_1) \cup ... \cup (B \cap A_n)}$$

<img height="414" src="../../../images/Asset%2014.png" width="634" alt="partitioning event B"/>

where we have chopped $B$ into the smaller pieces $B \cap A_1$ through $B \cap A_n$. By the second axiom of
probability, because these pieces are disjoint, we can add their probabilities to get $P(B)$:

$$eqalign{P(B) &= $(B \cap A_1) + (B \cap A_1) + ... + (B \cap A_n) \\
\\
\text{by applying }  P(B \cap A_i) = P(B \mid A_i).P(A_i) \\
\\
P(B) &= P(B \mid A_1).P(A_1) + ... + P(B \mid A_n).P(A_n)
}$$

The law of total probability tells us that to get the unconditional probability of $B$, we can divide the sample 
space into disjoint slices $A_i$, find the conditional probability of $B$ within each of the slices, then take a 
weighted sum of the conditional probabilities, where the weights are the probabilities $P(A_i)$. The choice of 
how to divide up the sample space is crucial: a well-chosen partition will reduce a complicated problem into 
simpler pieces, whereas a poorly chosen partition will only exacerbate our problems, requiring us to calculate $n$
difficult probabilities instead of just one!