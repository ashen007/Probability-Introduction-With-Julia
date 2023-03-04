<!-- TOC -->
  * [multiplication rule](#multiplication-rule)
    * [sampling with replacement](#sampling-with-replacement)
    * [sampling without replacement](#sampling-without-replacement)
    * [permutations and factorials](#permutations-and-factorials)
    * [binomial coefficient](#binomial-coefficient)
  * [story proofs](#story-proofs)
<!-- TOC -->

## multiplication rule

consider a compound experiment consisting of two sub-experiments, Experiment $A$ and Experiment $B$. 
Suppose that Experiment $A$ has a possible outcomes, and for each of those outcomes Experiment $B$ has b
possible outcomes. Then the compound experiment has ab possible outcomes.

for example, suppose two events $A$ and $B$ where event $A$ has 6 possible outcomes and $B$ has 5 outcomes,
to calculate all possibilities of this two events are,

$$\text{total number of possibilities} = {6 . 5} = 30$$

<p align="center">
<img height="348" src="../../../images/Asset%2010.png" width="336" alt="outcome tree"/>
</p>

things to notice in using multiplication rule,

- it doesn't matter the chronological order of counting
- it doesn't matter the same possible choices are available to each level, what is matter is
  number of choices

### sampling with replacement

consider $n$ objects and making k choices from them, one at a time with replacement. Then there are $n^k$
possible outcomes.

### sampling without replacement

consider $n$ objects and making $k$ choices from them, one at a time without replacement (i.e., choosing a certain
object precludes it from being chosen again). then there are $n(n - 1) ... (n - k + 1)$ possible outcomes for 
$1 \leq k \leq n$, and 0 possibilities for $k \lt n$ (where order matters). by convention, 

$$n(n - 1) ... (n - k + 1) = n \text{ for } k = 1$$

### permutations and factorials

a permutation of $1, 2, ..., n$ is an arrangement of them in some order, with $k = n$, there are $n!$ permutations 
of $1, 2, ..., n$. For example, there are $n!$ ways in which n people can line up for ice cream.

### binomial coefficient

for any non-negative integers $k$ and $n$, the binomial coefficient ${n \choose k}$, read as "n choose k", 
is the number of subsets of size k for a set of size n.

binomial coefficient counts the number of subsets of a certain size for a set, such as the number of ways to 
choose a committee of size k from a set of n people. Sets and subsets are by definition unordered, 
e.g. ${3, 1, 4} = {4, 1, 3}$, so we are counting the number of ways to choose k objects out of n, without 
replacement and without distinguishing between the different orders in which they could be chosen.

$${n \choose k} = {{n(n - 1) ... (n - k + 1)} \over {k!}} = {{n!} \over {(n - k)!k!}}$$

## story proofs

A story proof is a proof by interpretation. For counting problems, this often means counting the same thing in 
two different ways, rather than doing tedious algebra. A story proof often avoids messy calculations and goes 
further than an algebraic proof toward explaining why the result is true. The word "story" has several meanings,
some more mathematical than others, but a story proof (in the sense in which we're using the term) is a fully 
valid mathematical proof. Here are some examples of story proofs, which also serve as further examples of counting.