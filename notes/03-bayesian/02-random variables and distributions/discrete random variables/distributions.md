## indicator random variables

an event $A$ is the random variable which equals 1 if $A$ occurs and 0 otherwise. this called an
_indicator random variable_ of an event, denote by $I_A$ or $I(A)$.

## bernoulli

a random variable is said to have the _bernoulli distribution_ with parameter $p$ if $P(X = 1) = p$
and $P(X = 0) = 1 - p$ where $0 < p < 1$. write it as $X \sim Bern(p)$, note `~` is indicate
"is distributed as".

any random variable whose possible values are 0 and 1 has a $Bern(p)$ distribution, with $p$ the
probability of the random variable equaling 1. This number $p$ in $Bern(p)$ is called the parameter
of the distribution, it determines which specific Bernoulli distribution we have. Thus, there is not
just one Bernoulli distribution, but rather a family of Bernoulli distributions, indexed by $p$.

if $X \sim Bern(p)$, then the PMF of $X$ is,

$$\eqalign{
pX(0) = P \lbrace X = 0 \rbrace = 1 - p \\
pX(1) = P \lbrace X = 1 \rbrace = p
}$$

- variate $B: 1, p$
- range $X \in \lbrace 0, 1 \rbrace$
- parameter $p$, bernoulli probability parameter, $0 \lt p \lt 1$

An experiment that can result in either a "success" or a "failure" (but not both) is called a
Bernoulli trial. A Bernoulli random variable can be thought of as the _indicator of success_ in a
Bernoulli trial: it equals 1 if success occurs and 0 if failure occurs in the trial.

## binomial

Suppose that $n$ _independent_ Bernoulli trials are performed, each with the same success probability $p$.
Let $X$ be the number of successes. The distribution of $X$ is called the Binomial distribution with
parameters $n$ and $p$. We write $X \sim Bin(n, p)$ to mean that $X$ has the Binomial distribution
with parameters $n$ and $p$, where $n$ is a positive integer and $0 \lt p \lt 1$.

**Here it is clear that $Bern(p)$ is the same distribution as $Bin(1, p)$ the Bernoulli is a special
case of the Binomial.**

If $X \sim Bin(n, p)$, then the PMF of $X$ is,

$$P(X = k) = {n \choose k} {p^k} {(1 - p)^{n - k}}$$

for $k=0, 1, ..., n$ and $P(X = k) = 0$ otherwise.

<p align="center">
<img height="899" src="../../../../images/03/binomial_experiment.png" width="699" alt="binomial experiment"/>
</p>

For a fixed number of trials $n$, $X$ tends to be larger when the success probability is high and lower when
the success probability is low, as we would expect from the story of the Binomial distribution. Also recall
that in any PMF plot, the sum of the heights of the vertical bars must be 1.

Let $X \sim Bin(n, p)$, and $q = 1 - p$ (we often use $q$ to denote the failure probability of a Bernoulli 
trial). Then $n - X \sim Bin(n, q)$.

- variate $B: n, p$
- range $0 \leq k \leq n,$ $k$ an integer
- parameter $n$, the bernoulli trial parameter (a positive integer), $p$, the bernoulli probability parameter

expected value,

$$eqalign{
E(X) &= {{\sum}_{x=0}^n}{xP(X=x)} \\
\because P(X=x) = {{n \choose k}{p^k(1-p)^{n-k}}} \\
     &= {\sum_{k=0}^n}{k{n \choose k}{p^k(1-p)^{n-k}}} \\
\\
\because {n \choose k} = {n \over k}{{n-1} \choose {k-1}} \\
\\
\because k=0, {k{n \choose k}{p^k(1-p)^{n-k}}} = 0, \\
     &= n{\sum_{k=1}^n}{{{n-1} \choose {k-1}}{p^k}{(1-p)^{n-k}}} \\
     &= np{\sum_{k=1}^n}{{{n-1} \choose {k-1}}{p^{k-1}}{(1-p)^{(n-1)-(k-1)}}} \\
n-1 = m, k-1 = j \\
     &= np{\sum_{j=0}^m}{{{m} \choose {j}}{p^{j}}{(1-p)^{(m)-(j)}}} \\
{\sum_{j=0}^m}{{{m} \choose {j}}{p^{j}}{(1-p)^{(m)-(j)}}} = 1, \because \sum PMF = 1 \\
     &= np
}$$

### corollary

Let $X \sim Bin(n, p)$ with $p = {1 \over 2}$ and $n$ even. Then the distribution of $X$ is symmetric about $n=2$, 
in the sense that $P(X = {n \over 2} + j) = P(X = {n \over 2} - j)$ for all non-negative integers j.

## hyper-geometric

Consider an urn with $w$ white balls and $b$ black balls. We draw $n$ balls out of the urn at random without 
replacement, such that all ${{w+b} \choose n}$ samples are equally likely. Let $X$ be the number of white balls in
the sample. Then $X$ is said to have the _Hyper-geometric distribution_ with parameters $w, b,$ and $n$, we denote
this by $X \sim HGeom(w, b, n)$.

If $X \sim HGeom(w, b, n)$, then the PMF of $X$ is,

$$P(X = k) = {{{w \choose k}{b \choose {n-k}}} \over {{w+b} \choose n}}$$

for integers $k$ satisfying $0 \leq k \leq w$ and $0 \leq {n-k} \leq$, and $P(X=k) = 0$ otherwise.

The essential structure of the Hyper-geometric story is that items in a population are classified using two
sets of tags: in the urn story, each ball is either white or black (this is the first set of tags), and each 
ball is either sampled or not sampled (this is the second set of tags). Furthermore, at least one of these 
sets of tags is assigned completely at random (in the urn story, the balls are sampled randomly, with all 
sets of the correct size equally likely). Then $X \sim HGeom(w, b, n)$ represents the number of twice-tagged
items: in the urn story, balls that are both white and sampled.

The $HGeom(w, b, n)$ and $HGeom(n, w + b - n, w)$ distributions are identical. That is, if $X \sim HGeom(w, b, n)$ 
and $Y \sim HGeom(n, w + b - n, w)$, then X and Y have the same distribution.

more general version of hyper-geometric,

$N = w + b$, $X$ are success or one labeled section of the population, $k$ is the number of success, 
$n$ sample size,

$$P(X = k) = {{{X \choose k}{{N - X} \choose {n - k}}} \over {N \choose n}}$$

### connection between binomial and hyper-geometric

we can get from the Binomial to the Hyper-geometric by conditioning, and we can get from the Hyper-geometric 
to the Binomial by taking a limit.

for example,

A scientist wishes to study whether women or men are more likely to have a certain disease, or whether they 
are equally likely. A random sample of $n$ women and $m$ men is gathered, and each person is tested for the disease 
(assume for this problem that the test is completely accurate). The numbers of women and men in the sample 
who have the disease are $X$ and $Y$ respectively, with $X \sim Bin(n, p_1)$ and $Y \sim Bin(m, p_2)$, independently. 
Here $p_1$ and $p_2$ are unknown, and we are interested in testing whether $p1 = p2$, suppose that $X + Y = r$,

|            | women | men       | total     |
|------------|-------|-----------|-----------|
| disease    | x     | r - x     | r         |
| no disease | n - x | m - r + x | n + m - r |
| total      | n     | m         | n + m     |

the condition here is $X + Y = r$ (number of men and women found with disease),

$$\eqalign{
P(X = x | X + Y = r) &= {{{P(X + Y = r | X = x)}{P(X = x)}} \over {P(X + Y = r)}} \\
\\
\because {P(X + Y = r | X = x)} = {P(Y = r - x)} \\
                     &= {{{P(Y = r - x)}{P(X = x)}} \over {P(X + Y = r)}}
}$$

${P(X + Y = r | X = x)} = {P(Y = r - x)}$ is justified by the independence of $X$ and $Y$ . Assuming the null 
hypothesis and letting $p = p1 = p2$, we have $X \sim Bin(n, p)$ and $Y \sim Bin(m, p)$, independently, so 
$X + Y \sim Bin(n + m, p)$.

$$\eqalign{
P(X = x | X + Y = r) &= {{{m \choose {r-x}}{p^{r-x}}{{(1 - p)}^{m-r+x}}{n \choose x}{p^x}{(1 - p)^{n-x}}} 
                        \over {{{n+m} \choose r}{p^r}{(1 - p)^{n+m-r}}}}
                     &= {{{n \choose x}{m \choose {r-x}}} \over {{n+m} \choose {r}}}
}$$

So the conditional distribution of $X$ is Hyper-geometric with parameters $n, m, r$:

under the null hypothesis, the set of diseased people is equally likely to be any set of $r$ people. Thus, 
conditional on $X + Y = r$, $X$ represents the number of women among the $r$ diseased individuals, which 
is distributed $HGeom(n, m, r)$.

An interesting fact, which turns out to be useful in statistics, is that the conditional distribution of $X$ does
not depend on $p$: unconditionally, $X \sim Bin(n, p)$, but $p$ disappears from the parameters of the conditional 
distribution! This makes sense upon reflection, since once we know $X + Y = r$, we can work directly with the fact
that we have a population with $r$ diseased and $n + m - r$ healthy people, without worrying about the value of $p$ 
that originally generated the population.

## discrete uniform

Let $C$ be a finite, nonempty set of numbers. Choose one of these numbers uniformly at random (i.e., all 
values in $C$ are equally likely). Call the chosen number $X$. Then $X$ is said to have the Discrete
Uniform distribution with parameter $C$; we denote this by $X \sim DUnif(C)$.

the PMF of $X \sim DUnif(C)$ is,

$$P(X = x) = {1 \over {\lvert C \rvert}}$$

## geo-metric



## negative binomial