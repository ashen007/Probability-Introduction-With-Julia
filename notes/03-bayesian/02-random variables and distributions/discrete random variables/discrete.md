## discrete random variable

A random variable $X$ is said to be discrete if there is a finite list of values $a_1, a_2, ..., a_n$
or an infinite list of values $a_1, a_2, ...$ such that $P(X = a_j \text{ for some } j) = 1$. If $X$ 
is a discrete random variable, then the finite or countably infinite set of values $x$ such that 
$P(X = x) > 0$ is called the _support_ of $X$. commonly in applications, the support of a discrete random
variable is a set of integers.

We will see that there are several equivalent ways to express the distribution of a random variable For a 
discrete random variable, the most natural way to do so is with a probability mass function,

## probability mass function

The probability mass function (PMF) of a discrete random variable $X$ is the function $pX$ given by 
$pX(x) = P(X = x)$. Note that this is positive if $x$ is in the support of $X$, and 0 otherwise.

for example,

if $X$ is the number of Heads in two fair coin tosses, then $\lbrace X = 1 \rbrace$ consists of the 
sample outcomes $HT$ and $TH$, which are the two outcomes to which $X$ assigns the number 1. Since
${HT, TH}$ is a subset of the sample space, it is an event. So it makes sense to talk about $P(X = 1)$, 
or more generally, $P(X = x)$. If $\lbrace X = x \rbrace$ were anything other than an event, it would 
make no sense to calculate its probability! It does not make sense to write $P(X)$ we can only take 
the probability of an event, not of a random variable.

- $X$, the number of Heads. Since $X$ equals 0 if $TT$ occurs, 1 if $HT$ or $TH$ occurs, and 2 if 
  $HH$ occurs, the PMF of $X$ is the function $pX$ given by

$$\eqalign{
pX(0) &= P(X = 0) = {1 \over 4} \\
pX(1) &= P(X = 1) = {1 \over 2} \\
pX(2) &= P(X = 2) = {1 \over 4}
}$$

  and $pX(x) = 0$ for all other values of $x$.

- $Y = 2 - X$, the number of Tails. Reasoning as above or using the fact that

$$\eqalign{
P(Y = y) &= P(2 - X = y) = P(X = 2 - y) = pX(2 - y), \text{ PMF}, \\
pY(0) &= P(Y = 0) = {1 \over 4} \\
pY(1) &= P(Y = 1) = {1 \over 2} \\
pY(2) &= P(Y = 2) = {1 \over 4}
}$$

  and $pY(y) = 0$ for all other values of $y$. note that X and Y have the same PMF 
  (that is, pX and pY are the same function) even though X and Y are not the same random variable.

- $I$, the indicator of the first toss landing Heads. Since $I$ equals 0 if $TH$ or $TT$ occurs 
  and 1 if $HH$ or $HT$ occurs, the PMF of $I$ is

$$\eqalign{
pI(0) &= P(I = 0) = {1 \over 2} \\
pI(1) &= P(I = 1) = {1 \over 2}
}$$

  and $pI(i) = 0$ for all other values of $i$.
  
### valid PMFs

Let $X$ be a discrete random variables with support $x_1, x_2, ...$ . The PMF $pX$ of $X$ must 
satisfy the following two criteria:

- non-negative: $pX(x) > 0$ if $x = x_j$ for some $j$, and $pX(x) = 0$ otherwise;
- sums to 1: ${\sum}_{j=1}^\infty pX(x_j) = 1$