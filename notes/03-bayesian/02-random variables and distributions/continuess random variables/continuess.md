## probability density function

A continuous random variable is a random variable with a continuous distribution. For discrete random variable, 
the CDF is awkward to work with because of its jumpiness, and its derivative is almost useless since it's 
undefined at the jumps and 0 everywhere else. But for continuous random variables, the CDF is often convenient 
to work with, and its derivative is a very useful function, called the probability density function.

For a continuous random variable $X$ with CDF $F$, the probability density function (PDF) of $X$ is the derivative
$f$ of the CDF, given by $f(x) = F0(x)$. The support of $X$, and of its distribution, is the set of all $x$ where
$f(x) > 0$.

An important way in which continuous random variable differ from discrete random variable is that for a continuous 
random variable $X$, $P(X = x) = 0$ for all $x$. This is because $P(X = x)$ is the height of a jump in the CDF at $x$,
but the CDF of $X$ has no jumps! Since the PMF of a continuous random variable would just be 0 everywhere, we work 
with a PDF instead.

**The PDF is analogous to the PMF in many ways, but there is a key difference: for a PDF $f$, the quantity $f(x)$ is 
not a probability, and in fact it is possible to have $f(x) > 1$ for some values of $x$. To obtain a probability, 
we need to integrate the PDF.**

$$F(x) = {{\int}_{-\infty}^x}{f(t)dt}$$

Since the PDF determines the distribution, we should be able to use it to find the probability of $X$ falling into
an interval $(a, b)$. A handy fact is that we can include or exclude the endpoints as we wish without altering the 
probability, since the endpoints have probability 0.

$$P(a \lt \lt b) = P(a \lt X \leq b) = P(a \leq X \lt b) = P(a \leq X \leq b)$$

By definition of CDF and the fundamental theorem of calculus,

$$P(a \lt X \leq b) = F(b) - F(a) = {{\int}_{a}^b}{f(x)}dx$$

Therefore, to find the probability of $X$ falling in the interval $(a, b] (or (a, b), [a, b), or [a, b]) using the 
PDF, we simply integrate the PDF from $a$ to $b$. In general, for an arbitrary region $A \subseteq \Re$,

$$P(X \in A) = {\int}_A{f(x)}dx$$

_To get a desired probability, integrate the PDF over the appropriate range._

The PDF $f$ of a continuous random variable must satisfy the following two criteria,

- non-negative: $f(x) \gteq 0$
- integrates to 1: ${\int}_{-\infty}^{\infty}f(x)dx = 1$