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

## expected value

The definition of expectation for a discrete random variable is inspired by the weighted mean of a list of
numbers, with weights given by probabilities. The expected value (also called the expectation or mean) of
a discrete random variable $X$ whose distinct possible values are $x_1, x_2, ...$ is define by,

$$E(X) = {\sum}_{j=1}^\infty {xP(X = x_j)}$$

$x_j$ is a value that random variable can get $P(X = x)$ is the PMF at $x$.

if $X$ and $Y$ are discrete random variable with the same distribution, then $E(X) = E(Y)$. The converse of
the proposition is false since the expected value is just a one number summary, not nearly enough to specify
the entire distribution. it's a measure of where the "center" is but does not determine, for example, how
spread out the distribution is or how likely the random variable is to be positive.

### linearity of expectation

The most important property of expectation is linearity: the expected value of a sum of random variable is
the sum of the individual expected values.

For any random variables X, Y and any constant c,

$$\eqalign{
E(X + Y) &= E(X) + E(Y), \\
E(cX) &= cE(X)
}$$

The second equation says that we can take out constant factors from an expectation, this is both intuitively
reasonable and easily verified from the definition. The first equation, $E(X + Y) = E(X) + E(Y)$, also
seems reasonable when $X$ and $Y$ are independent. What may be surprising is that it holds even if $X$ and $Y$
are dependent! To build intuition for this, consider the extreme case where $X$ always equals $Y$. Then
$X + Y = 2X$, and both sides of $E(X + Y ) = E(X) + E(Y)$ are equal to $2E(X)$, so linearity still holds
even in the most extreme case of dependence.

This insight, that averages can be calculated in two ways, ungrouped or grouped is all that is needed to
prove linearity.

## law of the unconscious statistics

$E(g(X))$ does not equal $g(E(X))$ in general if $g$ is not linear. So how do we correctly calculate $E(g(X))$? Since
$g(X)$ is an random variable, one way is to first find the distribution of $g(X)$ and then use the definition
of expectation. Perhaps surprisingly, it turns out that it is possible to find $E(g(X))$ directly using the
distribution of $X$, without first having to find the distribution of $g(X)$. This is done using the law of
the unconscious statistician (LOTUS).

$$E(g(X)) = {\sum_{x}}{g(x)P(X=x)}$$

## variance

Like expected value, variance is a single-number summary of the distribution of a random variable. While the
expected value tells us the center of mass of a distribution, the variance tells us how spread out the
distribution is.

the _variance_ of a discrete random variable $X$ is,
$$Var(X) = E(X - EX)^2$$

recall that when we write $E(X - EX)^2$, we mean the expectation of the random variable $(X - EX)^2$,
not $(E(X - EX))^2$ (which is 0 by linearity).

for any random variable $X$,
$$Var(X) = E(X^2) - (EX)^2$$
