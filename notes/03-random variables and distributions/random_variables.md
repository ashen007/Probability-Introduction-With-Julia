## random variable

let's assume a game of cards, we may be very interested in how much wealth each gambler has at
any particular time,

we could make up notation like letting $A_{jk}$ be the event that gambler $A$ has exactly $j$
dollars after $k$ rounds, and similarly defining an event $B_{jk}$ for gambler $B$, for all
$j$ and $k$. (in $r$ rounds of play)

- event $A_{jk}$ : number of dollars $A$ has after $k$ rounds of playing
- event $B_{jk}$ : number of dollars $B$ has after $k$ rounds of playing

also we interested in wealth difference between two players and time duration they played.

Instead of having convoluted notation that obscures how the quantities of interest
are related,

> "Let $X_k$ be the wealth of gambler $A$ after $k$ rounds. Then $Y_k = N - X_k$
> is the wealth of gambler $B$ after $k$ rounds (where N is the fixed total wealth);
> $X_k - Y_k = 2.X_k - N$ is the difference in wealth after $k$ rounds; ${c_k}X_k$
> is the wealth of gambler $A$ in euros after $k$ rounds, where ${c_k}$ is the euros
> per dollar exchange rate after $k$ rounds; and the duration is
> R = min $\lbrace n : X_n = 0 or Y_n = 0 \rbrace$"

The notion of a random variable will allow us to do exactly this!

> "_a random variable is a variable that takes on random values_"

but such a feeble attempt at a definition fails to say where the randomness come from. Nor
does it help us to derive properties of random variables.

$$x^2 + y^2 = 1$$

<p>
<img height="582" src="../../images/Asset%2015.png" width="894" alt="random variable"/>
</p>

A random variable maps the sample space into the real line. The random variable $X$ depicted
here is defined on a sample space with 6 elements, and has possible values 0, 1, and 4. The
randomness comes from choosing a random pebble according to the probability function $P$ for
the sample space.

**_Given an experiment with sample space S, a random variable is a function from the sample
space S to the real numbers R._**

Thus, a random variable $X$ assigns a numerical value $X(s)$ to each possible outcome $s$ of the
experiment. The randomness comes from the fact that we have a random experiment, with probabilities
described by the probability function P. the mapping itself is deterministic.

for example,

Consider an experiment where we toss a fair coin twice. The sample space consists of four possible
outcomes: $S = {HH, HT, TH, TT}$, let's consider some random variables,

- let $X$ (random variable) be the number of heads, possible outcomes of this random variable are
  0, 1 ,2 and mapping will like,

$$X(HH) = 2, X(HT) = X(TH) = 1, X(TT) = 0$$

- let $Y$ be the number of tails, in terms of $X$,

$$Y = 2 - X \text{ in other words, } Y(s) = 2 - X(s)$$

- Let $I$ be 1 if the first toss lands Heads and 0 otherwise. Then $I$ assigns the value 1 to the outcomes
  $HH$ and $HT$ and 0 to the outcomes $TH$ and $TT$. This random variable is an example of what is called
  an indicator random variable since it indicates whether the first toss lands Heads, using 1 to mean
  "yes" and 0 to mean "no"

We can also encode the sample space as ${(1, 1), (1, 0), (0, 1), (0, 0)}$, where 1 is the code for Heads and
0 is the code for Tails. Then we can give explicit formulas for $X, Y, I$:

$$\eqalign{X_{(s_1, s_2)} &= s_1 + s_2 \\
Y_{(s_1, s_2)} &= 2 - s_1 - s_2 \\
I_{(s_1, s_2)} &= s_1
}$$

## variate

A variate is a generalization of the idea of a random variable and has similar probabilistic properties
but is defined without reference to a particular type of probabilistic experiment. A variate is the set
of all random variables that obey a given probabilistic law.

## cumulative distribution functions

The cumulative distribution function (CDF) of a random variable $X$ is the function $F_X$ given by
$F_X(x) = P(X \leq x)$. When there is no risk of ambiguity, we sometimes drop the subscript(x) and
just write F (or some other letter) for a CDF. CDF is the probability function that $X$ will take
a value less than or equal to $x$.

Any CDF $F$ has the following properties,

- increasing: if $x_1 \leq x_2$, then $F(x_1) \leq F(x_2)$
- right continues: CDF is continuous except possibly for having some jumps. Wherever there is a jump,
  the CDF is continuous from the right. That is, for any $a$, we have,

$$F(a) = {\lim}_{x \to a^{+} F(x)}$$

- convergence to 0 and 1 in the limit,

$${\lim}_{x \to -\infty} F(x) = 0 \text{ and } {\lim}_{x \to \infty} F(x) = 1$$

<p align="center">
<img height="500" src="../../images/03/binomial_experiment_cdf.png" width="800" alt="cdf"/>
</p>

## function of random variables

That is, if $X$ is a random variable, then $X^2$, $e^X$, and $sin(X)$ are also random variables, as is
$g(X)$ for any function $g : R \to R$.

if we want, apply the same function $g$ to all the numbers inside the pebbles. Instead of the numbers
$X(s_1)$ through $X(s_6)$, we now have the numbers $g(X(s_1))$ through $g(X(s_6))$, which gives a new
mapping from sample outcomes to real numbers we've created a new random variable, $g(X)$.

For an experiment with sample space $S$, a random variable $X$, and a function $g : R \to R, g(X)$ is
the random variable that maps $s$ to $g(X(s))$ for all $s \in S$.

<p align="center">
<img height="582" src="../../images/Asset%2016.png" width="1269" alt="function of random variable"/>
</p>

This suggests a strategy for finding the PMF of a random variable with an unfamiliar distribution:
try to express the random variable as a one-to-one function of a random variable with a known
distribution.