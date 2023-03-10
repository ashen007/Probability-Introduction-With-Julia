## uniform

Uniform random variable on the interval $(a, b)$ is a completely random number between $a$ and $b$. We formalize 
the notion of "completely random" on an interval by specifying that the PDF should be constant over the interval.

a continuous random variable $U$ is said to have the _uniform distribution_ on the interval $(a, b)$ if its PDF,

$$f(x) = \begin{cases}
\frac{1}{b-a}&\text{for $x\in[a,b]$}\\
0&\text{otherwise}\\
\end{cases}$$