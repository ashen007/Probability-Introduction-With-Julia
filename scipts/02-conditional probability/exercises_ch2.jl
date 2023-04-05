### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 41667e80-d3b9-11ed-0fe0-d163bb95e348
md"""
# Unit 2: Conditioning
"""

# ╔═╡ 46682e95-f0dd-4001-8666-6333b4705a88
md"""
Fred is answering a multiple-choice problem on an exam, and has to choose one of $n$ options (exactly one of which is correct). Let $K$ be the event that he knows the answer, and $R$ be the event that he gets the problem right (either through knowledge or through luck). Suppose that if he knows the right answer he will definitely get the problem right, but if he does not know then he will guess completely randomly. Let $P(K) = p$.
"""

# ╔═╡ 4fe88447-1a9b-4965-9740-f74d5c51aa1f
md"""
a) Find $P(K \mid R)$ (in terms of $p$ and $n$).
"""

# ╔═╡ 1bc8e1db-2fb3-4641-aa6a-e429e4aaeb81
md"""
$p(K) = p$
$p(K^c) = 1 - p = q$

$\eqalign{
p(K \mid R) &= \frac{p(K \cap R)}{p(R)} \\
p(R) &= p(R \mid K)p(K) + p(R \mid K^c)p(K^c) \\
p(K \mid R) &= \frac{p}{p + \frac{1 - p}{n}}
}$
"""

# ╔═╡ 4f92ec27-61c9-47fd-85ae-19a36726bba1
md"""
b) When (if ever) does $P(K \mid R)$ equal $p$?
"""

# ╔═╡ 264b5f05-5f7e-43a1-aad6-abccc27dfabc
md"""
In each of the following extreme cases: $n - 1$, $p = 0$, $p = 1$
"""

# ╔═╡ 9e7d2379-3870-4ae3-9ad1-bbfdd37dc0e2
md"""
A hat contains $100$ coins, where $99$ are fair but one is double-headed (always landing Heads). A coin is chosen uniformly at random. The chosen coin is flipped $7$ times, and it lands Heads all $7$ times. Given this information, what is the probability that the chosen coin is double-headed? (Of course, another approach here would be to look at both sides of the coin—but this is a metaphorical coin.)
"""

# ╔═╡ eb441cda-424e-4185-9dde-683c4f61cfee
md"""
$T \text{ - 7 Heads}$
$C \text{ - choosing bias coin}$

$$\eqalign{
p(C \mid T) &= \frac{p(T \mid C)p(C)}{p(T)} \\
p(T) &= p(T \mid C)p(C) + p(T \mid C^c)p(C^c) \\
\\
p(C \mid T) &= \frac{2^7}{2^7 + 99}
}$$
"""

# ╔═╡ 1a998010-50b9-41aa-bc26-6b4914a09864
(2^7) / (2^7 + 99)

# ╔═╡ b0b4ce01-b1fc-48fc-b363-6c1c75aae894
md"""
Jimmy decides to take a series of $n$ tests, to diagnose whether he has a certain disease (any individual test is not perfectly reliable, so he hopes to reduce his uncertainty by taking multiple tests). Let $D$ be the event that he has the disease, $p = P(D)$ be the prior probability that he has the disease, and $q = 1 - p$. Let $T_j$ be the event that he tests positive on the $j$th test.
"""

# ╔═╡ a9e8a716-2e2a-47af-b447-22b85a1b041f
md"""
a) Assume for this part that the test results are conditionally independent given Jimmy’s disease status. Let $a = P(T_j \mid D)$ and $b = P(T_j \mid D^c)$, where $a$ and $b$ don’t depend on $j$. Find the posterior probability that Jimmy has the disease, given that he tests positive on exactly $k$ out of the $n$ tests.
"""

# ╔═╡ 1d58093b-24b8-4604-be1d-2657aa58a413
md"""
$$\eqalign{
p(D \mid A) &= \frac{p(A \mid D)p(D)}{p(A)} \\
&= \frac{p(A \mid D)p(D)}{p(A \mid D)p(D) + p(A \mid D^c)p(D^c)} \\
&= \frac{p({a^k}{(1 - a)}^{n-k})}{p{a^k}{(1 - a)^{n-k}} + q{b^k}{(1-b)^{n-k}}}
}$$
"""

# ╔═╡ 8c763a21-1dc0-458a-9ec3-16601049e61e
md"""
b) Now suppose that Jimmy tests positive on all $n$ tests. However, some people have a certain gene that makes them always test positive. Let $G$ be the event that Jimmy has the gene. Assume that $P(G) = 1/2$ and that $D$ and $G$ are independent. If Jimmy does not have the gene, then the test results are conditionally independent given his disease status. Let $a_0 = P(T_j \mid D, G^c)$ and $b_0 = P(T_j \mid D^c, G^c)$, where $a_0$ and $b_0$ don’t depend on $j$. Find the posterior probability that Jimmy has the disease, given that he tests positive all $n$ times.
"""

# ╔═╡ f1a1a3ae-fbaf-4dbc-b339-ba9301866e2c
md"""
$U \text{ be the event } n = k,$
$$\eqalign{
P(D \mid U) &= \frac{P(U \mid D)P(D)}{P(U)} \\
&= \frac{P(U \mid D)P(D)}{P(U \mid D)P(D) + P(U \mid D^c)P(D^c)} \\
\\
P(U \mid D) &= P(U \mid D, G)P(G \mid D) + P(U \mid D, G^c)P(G^c \mid D) \\
&= \frac{({a_0}^n + 1)}{2}\\
\\
P(U \mid D^c) &= P(U \mid D^c, G)P(G \mid D^c) + P(U \mid D^c, G^c)P(G^c \mid D^c) \\
&= \frac{({b_0}^n + 1)}{2}\\
\\
P(D \mid U) &= \frac{p({a_0}^n + 1)}{p({a_0}^n + 1) + q({b_0}^n + 1)}
}$$
"""

# ╔═╡ dfebf589-1177-461d-a4b1-5564f5d4e21f
md"""
An exit poll in an election is a survey taken of voters just after they have voted. One major use of exit polls has been so that news organizations can try to figure out as soon as possible who won the election, before the votes are officially counted. This has been notoriously inaccurate in various elections, sometimes because of selection bias: the sample of people who are invited to and agree to participate in the survey may not be similar enough to the overall population of voters.

Consider an election with two candidates, Candidate A and Candidate B. Every voter is invited to participate in an exit poll, where they are asked whom they voted for; some accept and some refuse. For a randomly selected voter, let $A$ be the event that they voted for A, and $W$ be the event that they are willing to participate in the exit poll. Suppose that $P(W \mid A) = 0.7$ but $P(W \mid A^c) = 0.3$. In the exit poll, 60% of the respondents say they voted for A (assume that they are all honest), suggesting a comfortable victory for A. Find $P(A)$, the true proportion of people who voted for A.
"""

# ╔═╡ eb32cf06-58fa-4263-abc2-1da30ac9efdb
md"""
$P(A \mid W) = 0.6$

$$\eqalign{
P(A) &= P(A \mid W)P(W) + P(A \mid W^c)P(W^c) \\
P(A \mid W^c) &= \frac{P(W^c \mid A)P(A)}{P(W^c)} \\
P(A) &= 0.6 * (P(W)) + \frac{0.3 * P(A)}{P(W^c)} * P(W^c) \\
&= 0.6 * P(W) + 0.3 * P(A) \\
\\
P(W) &= P(W \mid A)P(A) + P(W \mid A^c)P(A^c) \\
&= 0.4 * P(A) + 0.3 \\
\\
P(A) &= 0.6 * (0.4 * P(A) + 0.3) + 0.3 * P(A)
P(A) &= \frac{18}{46}
}$$
"""

# ╔═╡ 4096d1b8-85cb-408a-b46a-282fc9faf430
18/46

# ╔═╡ Cell order:
# ╟─41667e80-d3b9-11ed-0fe0-d163bb95e348
# ╟─46682e95-f0dd-4001-8666-6333b4705a88
# ╟─4fe88447-1a9b-4965-9740-f74d5c51aa1f
# ╟─1bc8e1db-2fb3-4641-aa6a-e429e4aaeb81
# ╟─4f92ec27-61c9-47fd-85ae-19a36726bba1
# ╟─264b5f05-5f7e-43a1-aad6-abccc27dfabc
# ╟─9e7d2379-3870-4ae3-9ad1-bbfdd37dc0e2
# ╟─eb441cda-424e-4185-9dde-683c4f61cfee
# ╠═1a998010-50b9-41aa-bc26-6b4914a09864
# ╟─b0b4ce01-b1fc-48fc-b363-6c1c75aae894
# ╟─a9e8a716-2e2a-47af-b447-22b85a1b041f
# ╟─1d58093b-24b8-4604-be1d-2657aa58a413
# ╟─8c763a21-1dc0-458a-9ec3-16601049e61e
# ╟─f1a1a3ae-fbaf-4dbc-b339-ba9301866e2c
# ╟─dfebf589-1177-461d-a4b1-5564f5d4e21f
# ╟─eb32cf06-58fa-4263-abc2-1da30ac9efdb
# ╠═4096d1b8-85cb-408a-b46a-282fc9faf430
