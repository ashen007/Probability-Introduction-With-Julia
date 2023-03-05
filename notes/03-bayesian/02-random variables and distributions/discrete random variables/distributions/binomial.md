## indicator random variables

an event $A$ is the random variable which equals 1 if $A$ occurs and 0 otherwise. this called an
_indicator random variable_ of an event, denote by $I_A$ or $I(A)$.

## bernoulli

an random variable is said to have the _bernoulli distribution_ with parameter $p$ if $P(X = 1) = p$
and $P(X = 0) = 1 - p$ where $0 < p < 1$. write it as $X ~ Bern(p)$, note `~` is indicate 
"is distributed as".

any random variable whose possible values are 0 and 1 has a $Bern(p)$ distribution, with $p$ the
probability of the random variable equaling 1. This number $p$ in $Bern(p)$ is called the parameter 
of the distribution, it determines which specific Bernoulli distribution we have. Thus, there is not 
just one Bernoulli distribution, but rather a family of Bernoulli distributions, indexed by $p$.

- variate $B: 1, p$
- range $X \in \lbrace 0, 1 \rbrace
- parameter $p$, bernoulli probability parameter, $0 < p < 1$