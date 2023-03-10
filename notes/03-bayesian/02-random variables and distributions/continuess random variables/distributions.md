## uniform

Uniform random variable on the interval $(a, b)$ is a completely random number between $a$ and $b$. We formalize
the notion of "completely random" on an interval by specifying that the PDF should be constant over the interval.

a continuous random variable $U$ is said to have the _uniform distribution_ on the interval $(a, b)$ if its PDF,

$$f(x) = \begin{cases}
\frac{1}{b-a}&\text{ if $a \lt x \lt b$}\\
0&\text{ otherwise}\\
\end{cases}$$

we denote this by $U \sim Unif(a, b)$.

this is a valid PDF because the area under the curve is just the area of a rectangle with width $b-a$ and height
$1 \over (b-a)$. The CDF is the accumulated area under the PDF,

$$F(x) = \begin{cases}
0 \text{ if $x \leq a$,} \\
\frac{x-a}{b-a} \text{ if $a \lt x \lt b$,} \\
1 \text{ if $x \geq b$}
\end{cases}$$

The Uniform distribution that we will most frequently use is the Unif(0, 1) distribution, also called the
standard Uniform. The Unif(0, 1) PDF and CDF are particularly simple: $f(x) = 1$ and $F(x) = x$ for
$0 \lt x \lt 1$.

### universality of the uniform

Let $F$ be a CDF which is a continuous function and strictly increasing on the support of the distribution.
This ensures that the inverse function $F^{-1}$ exists, as a function from $(0, 1)$ to $\Bbb R$.

- let $U \sim Unif(0, 1)$ and $X = F^{-1}(U)$. then $X$ is a random variable

  if we start with $U \sim Unif(0, 1)$ and a CDF $F$, then we can create a random variable whose CDF is $F$ 
  by plugging $U$ into the inverse CDF $F^{-1}$. Since $F^{-1}$ is a function, $U$ is a random variable, and
  a function of a random variable is a random variable, $F^{-1}(U)$ is a random variable; universality of 
  the Uniform says its CDF is $F$.

- let $X$ be a random variable with CDF $F$, then $F(X) \sim Unif(0, 1)$
  
  starting from a random variable $X$ whose CDF is $F$ and then creating a Unif(0, 1) random variable Again, 
  $F$ is a function, $X$ is a random variable, and a function of a random variable is a random variable, so 
  $F(X)$ is a random variable. Since any CDF is between 0 and 1 everywhere, $F(X)$ must take values between 
  0 and 1. Universality of the Uniform says that the distribution of $F(X)$ is Uniform on $(0, 1)$.

## normal

### standard normal distribution

a continuous random variable $Z$ is said to have the _standard normal distribution_ if its PDF $\psi$ is 
given by,

$$\psi{(z)} = {\frac{1}{\sqrt{2\pi}}{e^{\frac{-z^2}{2}}}}, -\infty \lt z \lt \infty$$

We write this as $Z \sim N(0, 1)$ since, as we will show, $Z$ has mean 0 and variance 1. ${\frac{1}{\sqrt{2\pi}}$,
constants are called normalizing constants because they normalize the total area under the PDF to 1.

- symmetry of PDF: $\psi$ satisfies $\psi(z) = \psi(-z)$, $\psi$ is an even function
- symmetry of tail areas: The area under the PDF curve to the left of $-2$, which is 
                          $P(Z \leq -2) = \Phi(-2)$ by definition, equals the area 
                          to the right of 2, which is $P(Z \geq 2) = 1 - \Phi(2)$. 
                          In general, we have,
$$\Phi(z) = 1 - \Phi(-z)$$
                          for all $z$.
- symmetry of $Z$ and $-Z$: if $Z \sim N(0, 1)$, then $-Z \sim N(0, 1)$ as well.

### normal distribution

if $Z \sim N(0, 1)$, then
$$X = \mu + {\sigma}{Z}$$

is said to have the Normal distribution with mean $\mu$ and variance ${\sigma}^2$, for any real $\mu$ and 
${\sigma}^2$ with $\sigma \gt 0$. We denote this by $X \sim N(\mu, {\sigma}^2)$.

let $X \sim N(\mu, {\sigma}^2)$ then the CDF,

$$F(x) = {\Phi}{\left( \frac{x-\mu}{\sigma} \right)}$$

PDF is given by,

$$f(x) = {\psi}{\left( \frac{x-\mu}{\sigma} \right)}{\frac{1}{\sigma}}$$

PDF can be rewritten as,

$$f(x) = {\frac{1}{{\sqrt{2\pi}}\sigma}}e^{-\frac{(x-\mu)^2}{2{\sigma}^2}}$$