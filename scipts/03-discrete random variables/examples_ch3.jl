### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 019e3601-69eb-4622-9fcf-9a0c25776c67
begin

using IterTools
using CairoMakie
using AlgebraOfGraphics
using DataFrames
using Distributions
end

# ╔═╡ 4277db80-d48a-11ed-30e8-db69f212895c
md"""
## example 3.2.5 sum of die rolls
"""

# ╔═╡ 58c3ac04-71d4-4cc1-ab23-314871bbae14
md"""
We roll two fair 6-sided dice. Let $T = X + Y$ be the total of the two rolls, where $X$ and $Y$ are the individual rolls.
"""

# ╔═╡ 295f4880-bdcf-4140-a95c-772839ad31b3
begin
	first_die = 1:6
	sec_die = 1:6
	S = IterTools.product(first_die, sec_die)

	for i in S
		println(i)

	end
	
end

# ╔═╡ b521cbf5-3a6c-4428-899f-ef7924fe1e49
begin
	n = 10000
	s = [rand(1:6, 2) for i=1:n]
	t = [sum(i) for i in s]
	pmf = []

	for i=2:12
		push!(pmf, [i, sum(t .== i)/n])
	end

	print(pmf)
	
end

# ╔═╡ c15624c0-b6cb-4740-88d1-7bf44c509b86
begin
	df = DataFrame(x=[i[1] for i in pmf], p=[i[2] for i in pmf])
	layers = visual(Scatter) + visual(Lines)
	g = AlgebraOfGraphics.data(df) * mapping(:x, :p)
	draw(layers * g)
end

# ╔═╡ 5f0574a1-4b13-4faf-8f1b-ffe4f3577006
begin
	tl = pdf(Distributions.Binomial(10, 0.5))
	tr = pdf(Distributions.Binomial(10, 1/8))
	bl = pdf(Distributions.Binomial(100, 0.03))
	br = pdf(Distributions.Binomial(100, 4/5))
end

# ╔═╡ 5a5019db-cc91-4ad6-ac75-1c0ee4a55a62
begin
	t_df = DataFrame(x=0:10, l=tl, r=tr)
	t_plt = data(t_df) * (visual(Lines) + visual(Scatter)) * mapping(:x, [:l :r], col=dims(1), row=dims(2))
	draw(t_plt)
end

# ╔═╡ 093b276e-427a-417b-8540-ae05338a0e9f
begin
	b_df = DataFrame(x=0:100, l=bl, r=br)
	b_plt = data(b_df) * (visual(Lines) + visual(Scatter)) * mapping(:x, [:l :r], col=dims(1), row=dims(2))
	draw(b_plt)
end

# ╔═╡ 64f6fdb2-d98e-4b95-95ec-1aeed63a2da8
md"""
## example 3.4.3 elk capture-recapture
"""

# ╔═╡ 7bc7b2cb-52f3-488a-a046-394b90a17657
md"""
A forest has $N$ elk. Today, $m$ of the elk are captured, tagged, and released into the wild. At a later date, $n$ elk are recaptured at random. Assume that the recaptured elk are equally likely to be any set of $n$ of the elk, e.g., an elk that has been captured does not learn how to avoid beingcaptured again.
"""

# ╔═╡ cc31c9a7-2097-4045-b2ec-c3a6a3b52566
md"""
By the story of the Hypergeometric, the number of tagged elk in the recaptured sample is $HGeom(m, N - m, n)$. The $m$ tagged elk in this story correspond to the white balls and the $N - m$ untagged elk correspond to the black balls. Instead of sampling $n$ balls from the urn, we recapture $n$ elk from the forest.
"""

# ╔═╡ da5f625c-9c63-4883-8ffc-5e447793a0a2
function elk_recapture(n)
	ps = pdf(Distributions.Hypergeometric(100, 50, n))
	elk_plt = data((; x=0:n, y=ps)) * (visual(Lines) + visual(Scatter)) * mapping(:x, :y)
	draw(elk_plt)

end

# ╔═╡ 515e44c3-2d2c-4b28-87bd-5e46503b9283
elk_recapture(10)

# ╔═╡ a76a7269-0a4b-4923-a459-c22f4cda76c2
elk_recapture(20)

# ╔═╡ 6c320877-1bab-4099-ac52-5f0c02efe0c0
elk_recapture(35)

# ╔═╡ db70c980-3756-4be4-8d3a-b6204ee0a3bd
begin
	X = Distributions.Binomial(50, 0.5)
	cdf_df = DataFrame(x=0:50, pmf=pdf(X), cdf=[Distributions.cdf(X, x) for x in 0:50])
	
	cdf_plt = data(cdf_df) * (visual(Lines) + visual(Scatter)) * mapping(:x, [:pmf :cdf], col=dims(1), row=dims(2))
	draw(cdf_plt)
end

# ╔═╡ 69d6d1fa-dbc5-4eee-9a91-30f509e58ee0
md"""
---
"""

# ╔═╡ 05aaa840-7736-4711-af11-e7ff9a19ec58
md"""
Benford’s law states that in a very large variety of real-life data sets, the first digit approximately follows a particular distribution with about a 30% chance of a 1, an 18% chance of a 2, and in general,

$$P(D = j) = {log_{10}}{\left( \frac{j+1}{j} \right)}, \text{ for j } \in \lbrace 1, 2, 3, ..., 9 \rbrace$$

where $D$ is the first digit of a randomly chosen element. Check whether this is a valid PMF
"""

# ╔═╡ 1a2fc19b-3b24-4f23-8836-4162e7311d33
begin

	function benford(j)
		log10((j + 1)/j)
	end

	ben = [benford(j) for j=1:9]

	if sum(ben) == 1
		if all(ben .> 0)
			println("valid")
		end
	end

end

# ╔═╡ e1eac5ae-7cc5-4f17-a181-8bc2ced18aa9
md"""
---
"""

# ╔═╡ cacddc3f-b68f-4a86-b262-23039f5420de
md"""
In a chess tournament, 10 games are being played, independently. Each game ends in a win for one player with probability 0.4 and ends in a draw (tie) with probability 0.6. Find the probability that exactly 5 games end in a draw.
"""

# ╔═╡ 672bea96-78b5-4e0a-afc6-e3ec8da933e4
pdf(Distributions.Binomial(10, 0.6), 5)

# ╔═╡ 34b082bf-33ee-4a54-8e32-f0cfc1069cf2
md"""
---
"""

# ╔═╡ 3f8b9e22-3065-4bfe-b146-d185cdfb4de4
md"""
There are two coins, one with probability $p_1$ of Heads and the other with probability $p_2$ of Heads. One of the coins is randomly chosen (with equal probabilities for the two coins). It is then flipped $n \geq 2$ times. Let $X$ be the number of times it lands Heads.
"""

# ╔═╡ 307cfab9-328e-4407-849f-276d97582cef
md"""
${A} \text{ be the event choose first coin}$

$$\eqalign{
P(X=k) &= P(X=k \mid A)P(A) + P(X=k \mid A^c)P(A^c) \\
&= \frac{1}{2}({n \choose k}{p_1}^k(1 - p_1)^{n-k}) + \frac{1}{2}({n \choose k}{p_2}^k(1 - p_2)^{n-k})
}$$
"""

# ╔═╡ 3f8a27d4-755f-433b-bc3c-f5f1e6678a5f
md"""
Is the distribution of $X$ Binomial if $p_1 = p_2$?
"""

# ╔═╡ a2d86c2a-6c86-4fef-9365-55e6d7da90a6
md"""
$$\eqalign{
P(X=k) &= P(X=k \mid A)P(A) + P(X=k \mid A^c)P(A^c) \\
&= \frac{1}{2}({n \choose k}{p_1}^k(1 - p_1)^{n-k}) + \frac{1}{2}({n \choose k}{p_2}^k(1 - p_2)^{n-k}) \\
\\
if p_1 = p_2, \\
&= \frac{1}{2}({n \choose k}{p_1}^k(1 - p_1)^{n-k}) + \frac{1}{2}({n \choose k}{p_1}^k(1 - p_1)^{n-k}) \\
&= {n \choose k}{p_1}^k(1 - p_1)^{n-k}
}$$
"""

# ╔═╡ 8aedbd2f-6e23-4846-a4f0-967eae2c8ecf
md"""
Is the distribution of $X$ Binomial if $p_1 \neq p_2$?
"""

# ╔═╡ 31b32c04-7a2b-41e0-9601-39a92497c7a0
md"""
No. A mixture of two Binomials is not Binomial (except in the degenerate case $p_1 = p_2$). Marginally, each toss has probability $(p_1 + p_2) / 2$ of landing Heads, but the tosses are not independent since earlier tosses give information about which coin was chosen, which in turn gives information about later tosses.

Let $n$ be large, and imagine repeating the entire experiment many times (each repetition consists of choosing a random coin and flipping it $n$ times). We would expect to see either approximately $np_1$ Heads about half the time, and approximately $np_2$ Heads about half the time. In contrast, with a $Bin(n, p)$ distribution we would expect to see approximately $np$ Heads; no fixed choice of $p$ can create the behavior described above.
"""

# ╔═╡ 6037cd0e-f175-41dc-ba39-203573a0ef0e
md"""
----
"""

# ╔═╡ b82ccea1-6c93-4e66-8443-6007103e1231
md"""
There are $n$ eggs, each of which hatches a chick with probability $p$ (independently). Each of these chicks survives with probability $r$, independently. Let $H$ be the number of eggs that hatch and $X$ be the number of hatchlings that survive. Find the distribution of $H$ and the distribution of $X$.
"""

# ╔═╡ bd901877-5363-447d-817c-840949b3b98c
md"""
Think of each egg as a Bernoulli trial, where for $H$ we define “success" to mean hatching, while for $X$ we define “success" to mean surviving. For example, in the picture above, the events $H = 7, X = 5$ occurred. By the story of the Binomial, $H \sim Bin(n, p)$. The eggs independently have probability $pr$ each of hatching a chick that survives. By the story of the Binomial, we have $H \sim Bin(n, pr)$.
"""

# ╔═╡ 02d5e7f8-8488-46f6-83ac-54824d60d80a
md"""
---
Let $X$ be the number of purchases that a customer will make on the online site for a certain company (in some specified time period). Suppose that the PMF of $X$ is

$$P(X = k) = e^{-\lambda}{\lambda^k}/{k!}$$

for $k = 0, 1, 2, ...$. This distribution is called the Poisson distribution with parameter $\lambda$.
"""

# ╔═╡ 3d8aefde-19ed-4949-8b9c-d2436ad45b7c
md"""
a) Find $P(X \geq 1)$ and $P(X \geq 2)$ without summing infinite series.
"""

# ╔═╡ 828b3aee-91a7-48d8-9a5b-34348b61d6de
md"""
$$\eqalign{
{\sum_{k=0}^\infty}P(X = k) &= 1 \\
P(X = 0) + {\sum_{k=1}^\infty}P(X = k) &= 1 \\
\\
P(X \geq 1) &= 1 - P(X = 0) \\
&= 1 - e^{-\lambda}\\
\\
P(X \geq 2) &= 1 - P(X = 0) - P(X = 1) \\
&= 1 - e^{-\lambda} - {\lambda}{e^{-\lambda}}
}$$
"""

# ╔═╡ a857fd2e-d5b4-452b-91ca-f01a87cfa8c9
md"""
b) Suppose that the company only knows about people who have made at least one purchase on their site (a user sets up an account to make a purchase, but someone who has never made a purchase there doesn’t appear in the customer database). If the company computes the number of purchases for everyone in their database, then these data are draws from the conditional distribution of the number of purchases, given that at least one purchase is made. Which of the following is the conditional PMF of $X$ given $X \geq 1$? (This conditional distribution is called a truncated Poisson distribution.)
"""

# ╔═╡ a5f9de32-14e1-4ff4-91e2-e9974c98e59b
md"""
$$\eqalign{
P(X = k \mid X \geq 1) &= \frac{P(X \geq 1 \mid X = k)P(X = k)}{P(X \geq 1)} \\
&= \frac{1 * (e^{-\lambda}{\lambda^k}/{k!})}{1 - e^{-\lambda}} \\
&= \frac{e^{-\lambda}{\lambda^k}}{k!{(1 - e^{-\lambda})}}
}$$
"""

# ╔═╡ ae0794c3-11c1-40ea-8dc8-e8c30e0221ca
md"""
---
A book has $n$ typos. Two proofreaders, Prue and Frida, independently read the book. Prue catches each typo with probability $p_1$ and misses it with probability $q_1 = 1 - p_1$, independently, and likewise for Frida, who has probabilities $p_2$ of catching and $q_2 = 1 - q_1$ of missing each typo. Let $X_1$ be the number of typos caught by Prue, $X_2$ be the number caught by Frida, and $X$ be the number caught by at least one of the two proofreaders.
"""

# ╔═╡ 76fbb3f2-4188-45a8-bb1e-80069f585827
md"""
a) Find the distribution of $X$,
"""

# ╔═╡ 6097f1a5-1888-4cbf-aa0a-7b246cb07972
md"""
$\text{at least one of them find} = 1 - \text{both miss}$
$\text{at least one of them find} = 1 - {q_1}{q_2}$
$X \sim Bin(n, (1 - {q_1}{q_2}))$
"""

# ╔═╡ 55be08f5-06cd-42c1-8387-f3892c06b965
md"""
b) For this part only, assume that $p_1 = p_2$. Find the conditional distribution of $X_1$ given that $X_1 + X_2 = t$.
"""

# ╔═╡ bf910cd4-4d22-4e24-ba00-58464de8f92d
md"""
$$\eqalign{
p_1 &= p_2 = p, q_1 = q_2 = q \\
X_1 &\sim Bin(n, p) \\
X_2 &\sim Bin(n, p) \\
\\
\because X_1 + X_2 = t \\
X_1 + X_2 &\sim Bin(n, p) + Bin(n, p) \\
X_1 + X_2 &\sim Bin(2n, p) \\
\\
P(X_1 = k \mid X_1 + X_2 = t) &= \frac{P(X_1 + X_2 = t \mid X_1 = k)P(X_1 = k)}{P(X_1 + X_2 = t)} \\
\because X_1 \text{ and } X_2 \text{ independent,} X_2 = t - k \\
&= \frac{P(X_2 = t - k)P(X_1 = k)}{P(X_1 + X_2 = t)} \\
&= \frac{\left[{n \choose {t-k}}{p^{t-k}}{q^{n-t+k}}\right]\left[{n \choose k}{p^k}{q^{n-k}}\right]}{\left[{2n \choose t}{p^t}{q^{2n-t}}\right]} \\
&= \frac{{n \choose {t-k}}{n \choose k}}{2n \choose t}
}$$
"""

# ╔═╡ 8c0fd386-7cf1-47e3-be6f-cb31fe3ebfe9
md"""
---
People are arriving at a party one at a time. While waiting for more people to arrive they entertain themselves by comparing their birthdays. Let $X$ be the number of people needed to obtain a birthday match, i.e., before person $X$ arrives there are no two people with the same birthday, but when person $X$ arrives there is a match. For example, $X = 10$ would mean that the first nine people to arrive all have different birthdays, but the tenth person to arrive matches one of the first nine. Find $P(X = 3 \text{ or } X = 4)$
"""

# ╔═╡ 2af4fa16-b741-404f-8917-05d5f65c1311
md"""
The support of $X$ is $\lbrace 2, 3, ..., 366 \rbrace$ since if there are $365$ people there and no match, then every day of the year is accounted for and the $366$th person will create a match. Let’s start with a couple simple cases and then generalize:

$P(X = 2) = \frac{1}{365}$

since the second person has a $\frac{1}{365}$ chance of having the same birthday as the first,

$P(X = 3) = \frac{364}{365}.\frac{2}{365}$

since $X = 3$ means that the second person didn’t match the first but the third person matched one of the first two. In general, for $2 \leq k \leq 366$ we have

$$\eqalign{P(X = k) &= P(X \lt k - 1 \text{ and } X = k) \\
&= \frac{365.364...(365 - k + 2)}{365^{k-1}}.\frac{k-1}{365} \\
}$$

Therefore,
$P(X = 3 \text{ or } X = 4) = P(X = 3) + P(X = 4)$
"""

# ╔═╡ b0da76a7-6eb2-4971-a197-bfdd110566fb
md"""
---
Let $X$ be the number of Heads in 10 fair coin tosses.
"""

# ╔═╡ f6780eb6-e16e-4a73-994a-8af1ecc4ff3e
md"""
a) Find the conditional PMF of $X$, given that the first two tosses both land Heads.
"""

# ╔═╡ 3c74c9b7-2cfc-49f3-8f7d-4c836937e18a
md"""
$$\eqalign{
P(X = k \mid X_2 = 2) &= P(X_2 + X_8 = k \mid X_2 = 2) \\
&= P(X_8 = k - 2) \\
&= {8 \choose {k-2}}{\frac{1}{2}}^8 \\
&= {\frac{1}{256}}{8 \choose {k-2}}
}$$
"""

# ╔═╡ 385382ee-0844-4f2b-85fe-29893a30cbed
md"""
b) Find the conditional PMF of , given that at least two tosses land Heads.
"""

# ╔═╡ cd3b7740-c614-411f-99e0-d04d1f70a7aa
md"""
at least two heads, $P(X \geq 2)$. given that k will be,

$$\eqalign{
P(X = k \mid X \geq 2) &= \frac{P(X \geq 2 \mid X = k)P(X = k)}{P(X \geq 2)} \\
\\
\because P(X \geq 2) &= 1 - P(X \lt 2) \\
&= 1 - {\frac{1}{2}}^10 - 10{(\frac{1}{2})^10} \\
&= 1 - 11(\frac{1}{2})^10 \\
&= \frac{1013}{1024} \\
\\
P(X = k \mid X \geq 2) &= \frac{P(X = k)}{P(X \geq 2)} \\
&= \frac{{10 \choose k}{\frac{1}{1024}}}{\frac{1013}{1024}} \\
&= {\frac{1}{1013}}{10 \choose k}
}$$
"""

# ╔═╡ 9d6d749b-37f1-4e0c-9c95-035060ffee9e
md"""
---
## example 4.2.2 binomial expectation
"""

# ╔═╡ f9369890-06c6-4cc8-902e-a8d4815b305a
md"""
$$\eqalign{
P(X = k) &= {n \choose k}{p^k}{q^{n-k}} \\
E(X) &= {\sum_{k=0}^n}{kP(X=k)} \\
&= {\sum_{k=0}^n}{k}{n \choose k}{p^k}{q^{n-k}} \\
k = 0, E(X) = 0 \\
\therefore E(X) &= {\sum_{k=1}^n}{k}{n \choose k}{p^k}{q^{n-k}} \\
\because {k{n \choose k}} &= n{{n-1} \choose {k-1}} \\
E(X) &= {\sum_{k=1}^n}{n}{{n-1} \choose {k-1}}{p^k}{q^{n-k}} \\
&= {\sum_{k-1=0}^n}{n}{{n-1} \choose {k-1}}{p^k}{q^{n-k}} \\
\\
k - 1 = j \\
E(X) &= {\sum_{j=0}^n}{n}{{n-1} \choose {j}}{p^{j+1}}{q^{n-j-1}} \\
&= {\sum_{j=0}^n}{np}{{n-1} \choose {j}}{p^{j}}{q^{n-1-j}} \\
&= np{\sum_{j=0}^n}{{n-1} \choose {j}}{p^{j}}{q^{(n-1)-j}} \\
\\
\because {\sum_{j=0}^n}{{n-1} \choose {j}}{p^{j}}{q^{(n-1)-j}} &= {\sum{P(Y = j)}} = 1 \\
E(X) &= np
}$$
"""

# ╔═╡ 74fa9dcb-a19b-407d-b4d6-db348414aabc
md"""
## example 4.2.3 hypergeometric expectation
"""

# ╔═╡ 293a8db4-25b8-45ac-8f66-5030c3678769
md"""
$$\eqalign{
P(X = k) &= \frac{{w \choose k}{b \choose {n-k}}}{{w+b \choose n}} \\
E(X) &= {\sum_{k=0}^n}\frac{k{w \choose k}{b \choose {n-k}}}{{w+b \choose n}} \\
\because k = 0, E(X) = 0 \\
E(X) &= {\sum_{k=1}^n}\frac{k{w \choose k}{b \choose {n-k}}}{{w+b \choose n}} \\
\because k{w \choose k} = w{{w-1} \choose {k-1}} \\
\\
E(X) &= {\sum_{k=1}^n}\frac{w{{w-1} \choose {k-1}}{b \choose {n-k}}}{{{w+b} \choose n}} \\
&= {\sum_{k-1=0}^n}\frac{w{{w-1} \choose {k-1}}{b \choose {n-k}}}{{{w+b} \choose n}} \\
k - 1 = j \\
E(X) &= w{\sum_{j=0}^n}\frac{{{w-1} \choose {j}}{b \choose {n-1-j}}}{{{w+b} \choose n}} \\
w + b = m \\
n{m \choose n} = m{{m-1} \choose {n-1}} \\
{m \choose n} = {\frac{m}{n}}{{m-1} \choose {n-1}} \\
E(X) &= w{\sum_{j=0}^n}\frac{{{w-1} \choose {j}}{b \choose {n-1-j}}}{{\frac{m}{n}}{{m-1} \choose {n-1}}} \\
&= {w\frac{n}{m}}{{\sum_{j=0}^n}\frac{{{w-1} \choose {j}}{b \choose {n-1-j}}}{{{w+b-1} \choose {n-1}}}} \\
{{\sum_{j=0}^n}\frac{{{w-1} \choose {j}}{b \choose {n-1-j}}}{{{w+b-1} \choose {n-1}}}} &= \sum{P(Y=i)} = 1 \\
E(X) &= {w\frac{n}{w+b}}
}$$
"""

# ╔═╡ 8ff78ed8-cabb-4334-90a7-449b7350944c
md"""
## geometric and negative binomial distributions
"""

# ╔═╡ 21ab02d9-31c5-478f-9aaf-9f2d0962aed4
begin
	ks = 1:20
	d1 = [pdf(Distributions.Geometric(0.1), i) for i in ks]
	d2 = [pdf(Distributions.Geometric(0.5), i) for i in ks]
	d3 = [pdf(Distributions.Geometric(0.9), i) for i in ks]

	g_df = DataFrame(x=ks, d1=d1, d2=d2, d3=d3)
	g_plt = data(g_df) * (visual(Lines) + visual(Scatter)) * mapping(:x, [:d1 :d2 :d3], col=dims(1), row=dims(2))
	draw(g_plt)
end

# ╔═╡ 6685c382-6371-4891-8670-85ac582e1e30
md"""
## example 4.3.6 geometric expectation
"""

# ╔═╡ 052eec1b-b61f-4f9d-ae61-f2a604598300
md"""
$$\eqalign{
P(X = k) &= {q^k}{p} \\
E(X) &= {\sum_{k=0}^{\infty}}{k{q^k}{p}} \\
\\
{\sum_{k=0}^{\infty}}{q^k} &= 1 + q + q^2 + \dots + \infty \\
{\sum_{k=0}^{\infty}}{q^k} &= 1 + q(1 + q + q^2 + \dots + \infty) \\
{\sum_{k=0}^{\infty}}{q^k} - q\left({\sum_{k=0}^{\infty}}{q^k}\right) &= 1 \\
{\sum_{k=0}^{\infty}}{q^k} &= \frac{1}{(1 - q)} \\
\text{get expectation from diravative, } \\
\frac{d{{\sum}_{k=0}^{\infty}}{q^k}}{dq} &= \frac{d\left(\frac{1}{(1 - q)}\right)}{dq} \\
{\sum_{k=0}^{\infty}}{kq^{k-1}} &= \frac{1}{(1 - q)^2} \\
{\sum_{k=0}^{\infty}}{kpq^{k}} &= \frac{pq}{(1 - q)^2} \\
{\sum_{k=0}^{\infty}}{kpq^{k}} &= \frac{pq}{(p)^2} \\
&= \frac{q}{p}
}$$
"""

# ╔═╡ 66d1dc30-f37e-4911-b962-18136b07a41d
begin
	rs = 1:10
	nb1 = [pdf(Distributions.NegativeBinomial(1, 0.1), i) for i in rs]
	nb2 = [pdf(Distributions.NegativeBinomial(3, 0.5), i) for i in rs]
	nb3 = [pdf(Distributions.NegativeBinomial(9, 0.9), i) for i in rs]

	nb_df = DataFrame(x=rs, d1=nb1, d2=nb2, d3=nb3)
	nb_plt = data(nb_df) * (visual(Lines) + visual(Scatter)) * mapping(:x, [:d1 :d2 :d3], col=dims(1), row=dims(2))
	draw(nb_plt)
end

# ╔═╡ 81d25e62-dd7e-4448-8955-6ec2118a375e
md"""
## example 4.3.11 negative binomial expectation
"""

# ╔═╡ 2754d630-97cc-4164-b703-8266818839dc
md"""
$$\eqalign{
X \sim NBin(r, p) \\
X = X_1 + X_2 + X_3 + \dots + X_r \text{ where, } X_i \sim Geom(p) \\
\\
X_1 \text{ is the number of failiers before first success} \\
X_2 \text{ is the number of failiers between first and second success} \\
\\}$$

$$\eqalign{
E(X) &= E(X_1) + E(X_2) + \dots + E(X_r) \\
&= \frac{q}{p} + \frac{q}{p} + \dots + \frac{q}{p} \\
&= \frac{rq}{p}
}$$
"""

# ╔═╡ d1af330e-e6be-4d04-a983-b0b41ddf8ece
md"""
## example 4.3.12 coupon collector
"""

# ╔═╡ 10c20e04-8970-4111-8c8f-8f4cb65f622c
md"""
Suppose there are $n$ types of toys, which you are collecting one by one, with the goal of getting a complete set. When collecting toys, the toy types are random (as is sometimes the case, for example, with toys included in cereal boxes or included with kids' meals from a fast food restaurant). Assume that each time you collect a toy, it is equally likely to be any of the $n$ types. What is the expected number of toys needed until you have a complete set?
"""

# ╔═╡ cff82343-b2c3-4f5c-b7fc-2d55dd9298e0
md"""
${N: \text{ number of toys need to complete set}}$
$E(N) = N_1 + N_2 + \dots + N_n, N_i = \text{ number of toys until new toy type found}$
$N_i \sim Fs({n - j - 1}/{n})$

$$\eqalign{
\because E_1 &= 1, E_2 = \frac{n-1}{n}, E_n = \frac{n + 1 - j}{n} \\
E(N) &= 1 + \frac{1}{(n-1)/n} + \frac{1}{(n-2)/n} + \dots + \frac{1}{(n-n+1)/n} \\
&= 1 + \frac{n}{(n-1)} + \frac{n}{(n-2)} + \dots + {n} \\
&= n{\sum_{j=1}}\frac{1}{j} \\
}$$
"""

# ╔═╡ db50f0b0-1b65-49cc-b380-a1e648914364
md"""
## example 4.4.5 Distinct birthdays, birthday matches
"""

# ╔═╡ f09e4288-599f-4c1e-b17d-eb1d76248872
md"""
In a group of $n$ people, under the usual assumptions about birthdays, what is the expected number of distinct birthdays among the $n$ people, i.e., the expected number of days on which at least one of the people was born? What is the expected number of birthday matches, i.e., pairs of people with the same birthday?
"""

# ╔═╡ a6313699-feaa-47f6-8e7a-18f32e3180d5
md"""
$X: \text{number of distinct birthdays}$
$X = I_1 + \dots + I_{365}$
$\text{where, }{I_j}\text{ if i th day reprecented,}$

$$\eqalign{
E(T_j) &= P(i^{th}\text{ day is reprecented}) = 1 - P(\text{no one born on day i}) \\
&= 1 - (\frac{364}{365})^n \\
& \text{by linearity of expectation} \\
E(X) &= 365\left(1 - (\frac{364}{365})^n \right) \\
\\
Y \text{ be the number of birthdays matched} \\
Y &= J_1 + \dots + J_{n \choose 2} \\
&\text{where $J_i$ is the indicator of the $i^{th}$ pair of people having the same birthday} \\
E(Y) &= {n \choose 2} * \frac{1}{365}
}$$
"""

# ╔═╡ 6c9fca6c-6870-449c-9842-3bad7a73dddf
md"""
## example 4.6.5 binomial variance
"""

# ╔═╡ 678a061f-aeb9-4cbf-ad5a-8cf054f3f5e1
md"""
binomial as an indicator variable,

$I_j = j^{th} \text{ trail being success}$
$$\eqalign{
X &= I_1 + I_2 + \dots + I_n \\
Var(I_j) &= E({I_j}^2) - (E(I_j))^2 \\
&= p - p^2 \\
&= p(1 - p) \\
\\
E({I_j}^2) &= E({I_j}) = p \\
\because I_j = {I_j}^2 \\
Var(X) &= Var(I_1) + Var(I_2) + \dots + Var(I_n) \\
&= n * Var(I_j) \\
&= np(1 - p)
}$$
"""

# ╔═╡ 4d23e995-9ba3-4f8b-8b4c-047c9d41aca7
md"""
## poisson distribution
"""

# ╔═╡ 3be30ce2-2269-4cae-9606-1eab9eab2142
begin
	ns = 1:10
	p1 = [pdf(Distributions.Poisson(0.001), i) for i in ns]
	p2 = [pdf(Distributions.Poisson(1.5), i) for i in ns]
	p3 = [pdf(Distributions.Poisson(100), i) for i in ns]

	p_df = DataFrame(x=ns, d1=p1, d2=p2, d3=p3)
	p_plt = data(p_df) * (visual(Lines) + visual(Scatter)) * mapping(:x, [:d1 :d2 :d3], col=dims(1), row=dims(2))
	draw(p_plt)
end

# ╔═╡ 487fcbab-6b68-4eda-90c1-8b12cdd98214
md"""
## example 4.7.4
"""

# ╔═╡ 6fd97083-5aee-412e-bcd3-0786afa88b23
md"""
There are $k$ distinguishable balls and n distinguishable boxes. The balls are randomly placed in the boxes, with all $n^k$ possibilities equally likely. Problems in this setting are called occupancy problems, and are at the core of many widely used algorithms in computer science.

(a) Find the expected number of empty boxes (fully simplified, not as a sum). \
(b) Find the probability that at least one box is empty. Express your answer as a
sum of at most $n$ terms. \
(c) Now let $n = 1000$, $k = 5806$. The expected number of empty boxes is then
approximately 3. Find a good approximation as a decimal for the probability that
at least one box is empty. The handy fact $e3 \approx 20$ may help.
"""

# ╔═╡ 84a93510-46b4-4997-8194-e54265fe7410
md"""
$$\eqalign{
I(A) &= I_1 + I_2 + \dots + I_n \\
I_j &= j^{th} \text{ box is empty} \\
\\
E(I_j) &= P(I_j = 1) = \frac{(n - 1)^k}{n^k} \\
&= {\left( \frac{n - 1}{n} \right)}^k \\
&= {\left( 1 - \frac{1}{n} \right)}^k \\
\\
E(\sum{I_j}) &= n{\left( 1 - \frac{1}{n} \right)}^k \\
}$$
"""

# ╔═╡ 13e515aa-c647-481f-8661-a21346dacd71
md"""
$$\eqalign{
P(A_1 \cup A_2 \cup \dots \cup A_n) &= {\sum_{j=1}^{n}}{P(A_j)} - {\sum_{j=1}^{n}}{P(A_j \cap A_k)} + \dots + (-1)^{j+1}P(A_1 \cap A_2 \cap \dots \cap A_n) \\
&= {n \choose 1}{\left( \frac{n - 1}{n} \right)}^k - {n \choose 2}{\left( \frac{n - 1}{n} \right)}^k + \dots + (-1)^{j+1}{n \choose j}{\left(\frac{n-j}{n}\right)}^k \\
&= {\sum_{j=1}^{n-1}}(-1)^{j+1}{n \choose j}{\left({1-\frac{j}{n}}\right)}^k
}$$
"""

# ╔═╡ d986ec9a-d8e1-49d4-805f-27d4a2780be9
md"""
The number $X$ of empty boxes is approximately $Pois(3)$, since there are a lot of
boxes but each is very unlikely to be empty, the probability that a specific box is
empty is $(1 - \frac{1}{n})^k = \frac{1}{n} . E(X) \approx 0.003$. So,

$P(X \leq 1) = 1 - P(X = 0) \approx 1 - e^{-3} \approx 1 - \frac{1}{20} = 0.95$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
AlgebraOfGraphics = "cbdf2221-f076-402e-a563-3d30da359d67"
CairoMakie = "13f3f980-e62b-5c42-98c6-ff1f3baf88f0"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"
IterTools = "c8e1da08-722c-5040-9ed9-7db0dc04731e"

[compat]
AlgebraOfGraphics = "~0.6.14"
CairoMakie = "~0.10.4"
DataFrames = "~1.5.0"
Distributions = "~0.25.87"
IterTools = "~1.4.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "015c5f47470162178e48ff528f882b598362b6e6"

[[deps.AbstractFFTs]]
deps = ["ChainRulesCore", "LinearAlgebra"]
git-tree-sha1 = "16b6dbc4cf7caee4e1e75c49485ec67b667098a0"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.3.1"

[[deps.AbstractTrees]]
git-tree-sha1 = "faa260e4cb5aba097a73fab382dd4b5819d8ec8c"
uuid = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
version = "0.4.4"

[[deps.Adapt]]
deps = ["LinearAlgebra", "Requires"]
git-tree-sha1 = "cc37d689f599e8df4f464b2fa3870ff7db7492ef"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.6.1"

[[deps.AlgebraOfGraphics]]
deps = ["Colors", "Dates", "Dictionaries", "FileIO", "GLM", "GeoInterface", "GeometryBasics", "GridLayoutBase", "KernelDensity", "Loess", "Makie", "PlotUtils", "PooledArrays", "RelocatableFolders", "SnoopPrecompile", "StatsBase", "StructArrays", "Tables"]
git-tree-sha1 = "43c2ef89ca0cdaf77373401a989abae4410c7b8a"
uuid = "cbdf2221-f076-402e-a563-3d30da359d67"
version = "0.6.14"

[[deps.Animations]]
deps = ["Colors"]
git-tree-sha1 = "e81c509d2c8e49592413bfb0bb3b08150056c79d"
uuid = "27a7e980-b3e6-11e9-2bcd-0b925532e340"
version = "0.4.1"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Automa]]
deps = ["Printf", "ScanByte", "TranscodingStreams"]
git-tree-sha1 = "d50976f217489ce799e366d9561d56a98a30d7fe"
uuid = "67c07d97-cdcb-5c2c-af73-a7f9c32a568b"
version = "0.8.2"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "66771c8d21c8ff5e3a93379480a2307ac36863f7"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.1"

[[deps.AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "1dd4d9f5beebac0c03446918741b1a03dc5e5788"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.6"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.CEnum]]
git-tree-sha1 = "eb4cb44a499229b3b8426dcfb5dd85333951ff90"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.2"

[[deps.CRC32c]]
uuid = "8bf52ea8-c179-5cab-976a-9e18b702a9bc"

[[deps.Cairo]]
deps = ["Cairo_jll", "Colors", "Glib_jll", "Graphics", "Libdl", "Pango_jll"]
git-tree-sha1 = "d0b3f8b4ad16cb0a2988c6788646a5e6a17b6b1b"
uuid = "159f3aea-2a34-519c-b102-8c37f9878175"
version = "1.0.5"

[[deps.CairoMakie]]
deps = ["Base64", "Cairo", "Colors", "FFTW", "FileIO", "FreeType", "GeometryBasics", "LinearAlgebra", "Makie", "SHA", "SnoopPrecompile"]
git-tree-sha1 = "2aba202861fd2b7603beb80496b6566491229855"
uuid = "13f3f980-e62b-5c42-98c6-ff1f3baf88f0"
version = "0.10.4"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.Calculus]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f641eb0a4f00c343bbc32346e1217b86f3ce9dad"
uuid = "49dc2e85-a5d0-5ad3-a950-438e2897f1b9"
version = "0.5.1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c6d890a52d2c4d55d326439580c3b8d0875a77d9"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.7"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "485193efd2176b88e6622a39a246f8c5b600e74e"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.6"

[[deps.ColorBrewer]]
deps = ["Colors", "JSON", "Test"]
git-tree-sha1 = "61c5334f33d91e570e1d0c3eb5465835242582c4"
uuid = "a2cac450-b92f-5266-8821-25eda20663c8"
version = "0.4.0"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Random", "SnoopPrecompile"]
git-tree-sha1 = "aa3edc8f8dea6cbfa176ee12f7c2fc82f0608ed3"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.20.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "600cc5508d66b78aae350f7accdb58763ac18589"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.10"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "fc08e5930ee9a4e03f84bfb5211cb54e7769758a"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.10"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "7a60c856b9fa189eb34f5f8a6f6b5529b7942957"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.1"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "89a9db8d28102b094992472d333674bd1a83ce2a"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.5.1"

[[deps.Contour]]
git-tree-sha1 = "d05d9e7b7aedff4e5b51a029dced05cfb6125781"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.2"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InlineStrings", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Random", "Reexport", "SentinelArrays", "SnoopPrecompile", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "aa51303df86f8626a962fccb878430cdb0a97eee"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.5.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

[[deps.Dictionaries]]
deps = ["Indexing", "Random", "Serialization"]
git-tree-sha1 = "e82c3c97b5b4ec111f3c1b55228cebc7510525a2"
uuid = "85a47980-9c8c-11e8-2b9f-f7ca1fa99fb4"
version = "0.3.25"

[[deps.Distances]]
deps = ["LinearAlgebra", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "49eba9ad9f7ead780bfb7ee319f962c811c6d3b2"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.8"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "13027f188d26206b9e7b863036f87d2f2e7d013a"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.87"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.DualNumbers]]
deps = ["Calculus", "NaNMath", "SpecialFunctions"]
git-tree-sha1 = "5837a837389fccf076445fce071c8ddaea35a566"
uuid = "fa6b7ba4-c1ee-5f82-b5fc-ecf0adba8f74"
version = "0.6.8"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e3290f2d49e661fbd94046d7e3726ffcb2d41053"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.4+0"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bad72f730e9e91c08d9427d5e8db95478a3c323d"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.8+0"

[[deps.Extents]]
git-tree-sha1 = "5e1e4c53fa39afe63a7d356e30452249365fba99"
uuid = "411431e0-e8b7-467b-b5e0-f676ba4f2910"
version = "0.1.1"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "74faea50c1d007c85837327f6775bea60b5492dd"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+2"

[[deps.FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "f9818144ce7c8c41edf5c4c179c684d92aa4d9fe"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.6.0"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c6033cc3892d0ef5bb9cd29b7f2f0331ea5184ea"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.10+0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "7be5f99f7d15578798f338f5433b6c432ea8037b"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.16.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "fc86b4fd3eff76c3ce4f5e96e2fdfa6282722885"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "1.0.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.FreeType]]
deps = ["CEnum", "FreeType2_jll"]
git-tree-sha1 = "cabd77ab6a6fdff49bfd24af2ebe76e6e018a2b4"
uuid = "b38be410-82b0-50bf-ab77-7b57e271db43"
version = "4.0.0"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FreeTypeAbstraction]]
deps = ["ColorVectorSpace", "Colors", "FreeType", "GeometryBasics"]
git-tree-sha1 = "38a92e40157100e796690421e34a11c107205c86"
uuid = "663a7486-cb36-511b-a19d-713bb74d65c9"
version = "0.10.0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GLM]]
deps = ["Distributions", "LinearAlgebra", "Printf", "Reexport", "SparseArrays", "SpecialFunctions", "Statistics", "StatsAPI", "StatsBase", "StatsFuns", "StatsModels"]
git-tree-sha1 = "cd3e314957dc11c4c905d54d1f5a65c979e4748a"
uuid = "38e38edf-8417-5370-95a0-9cbb8c7f171a"
version = "1.8.2"

[[deps.GPUArraysCore]]
deps = ["Adapt"]
git-tree-sha1 = "1cd7f0af1aa58abc02ea1d872953a97359cb87fa"
uuid = "46192b85-c4d5-4398-a991-12ede77f4527"
version = "0.1.4"

[[deps.GeoInterface]]
deps = ["Extents"]
git-tree-sha1 = "0eb6de0b312688f852f347171aba888658e29f20"
uuid = "cf35fbd7-0cd7-5166-be24-54bfbe79505f"
version = "1.3.0"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "GeoInterface", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "303202358e38d2b01ba46844b92e48a3c238fd9e"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.6"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "d3b3624125c1474292d0d8ed0f65554ac37ddb23"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.74.0+2"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "d61890399bc535850c4bf08e4e0d3a7ad0f21cbd"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.GridLayoutBase]]
deps = ["GeometryBasics", "InteractiveUtils", "Observables"]
git-tree-sha1 = "678d136003ed5bceaab05cf64519e3f956ffa4ba"
uuid = "3955a311-db13-416c-9275-1d80ed98e5e9"
version = "0.9.1"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[deps.HypergeometricFunctions]]
deps = ["DualNumbers", "LinearAlgebra", "OpenLibm_jll", "SpecialFunctions"]
git-tree-sha1 = "d926e9c297ef4607866e8ef5df41cde1a642917f"
uuid = "34004b35-14d8-5ef3-9330-4cdb6864b03a"
version = "0.3.14"

[[deps.ImageAxes]]
deps = ["AxisArrays", "ImageBase", "ImageCore", "Reexport", "SimpleTraits"]
git-tree-sha1 = "c54b581a83008dc7f292e205f4c409ab5caa0f04"
uuid = "2803e5a7-5153-5ecf-9a86-9b4c37f5f5ac"
version = "0.6.10"

[[deps.ImageBase]]
deps = ["ImageCore", "Reexport"]
git-tree-sha1 = "b51bb8cae22c66d0f6357e3bcb6363145ef20835"
uuid = "c817782e-172a-44cc-b673-b171935fbb9e"
version = "0.1.5"

[[deps.ImageCore]]
deps = ["AbstractFFTs", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Graphics", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "Reexport"]
git-tree-sha1 = "acf614720ef026d38400b3817614c45882d75500"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.9.4"

[[deps.ImageIO]]
deps = ["FileIO", "IndirectArrays", "JpegTurbo", "LazyModules", "Netpbm", "OpenEXR", "PNGFiles", "QOI", "Sixel", "TiffImages", "UUIDs"]
git-tree-sha1 = "342f789fd041a55166764c351da1710db97ce0e0"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.6.6"

[[deps.ImageMetadata]]
deps = ["AxisArrays", "ImageAxes", "ImageBase", "ImageCore"]
git-tree-sha1 = "36cbaebed194b292590cba2593da27b34763804a"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.8"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "3d09a9f60edf77f8a4d99f9e015e8fbf9989605d"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.7+0"

[[deps.Indexing]]
git-tree-sha1 = "ce1566720fd6b19ff3411404d4b977acd4814f9f"
uuid = "313cdc1a-70c2-5d6a-ae34-0150d3930a38"
version = "1.1.1"

[[deps.IndirectArrays]]
git-tree-sha1 = "012e604e1c7458645cb8b436f8fba789a51b257f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "1.0.0"

[[deps.Inflate]]
git-tree-sha1 = "5cd07aab533df5170988219191dfad0519391428"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.3"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "9cc2baf75c6d09f9da536ddf58eb2f29dedaf461"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.4.0"

[[deps.IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d979e54b71da82f3a65b62553da4fc3d18c9004c"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2018.0.3+2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Interpolations]]
deps = ["Adapt", "AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "721ec2cf720536ad005cb38f50dbba7b02419a15"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.14.7"

[[deps.IntervalSets]]
deps = ["Dates", "Random", "Statistics"]
git-tree-sha1 = "16c0cc91853084cb5f58a78bd209513900206ce6"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.7.4"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

[[deps.InvertedIndices]]
git-tree-sha1 = "0dc7b50b8d436461be01300fd8cd45aa0274b038"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.3.0"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.Isoband]]
deps = ["isoband_jll"]
git-tree-sha1 = "f9b6d97355599074dc867318950adaa6f9946137"
uuid = "f1662d9f-8043-43de-a69a-05efc1cc6ff4"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JpegTurbo]]
deps = ["CEnum", "FileIO", "ImageCore", "JpegTurbo_jll", "TOML"]
git-tree-sha1 = "106b6aa272f294ba47e96bd3acbabdc0407b5c60"
uuid = "b835a17e-a41a-41e7-81f0-2f016b05efe0"
version = "0.1.2"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6f2675ef130a300a112286de91973805fcc5ffbc"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.91+0"

[[deps.KernelDensity]]
deps = ["Distributions", "DocStringExtensions", "FFTW", "Interpolations", "StatsBase"]
git-tree-sha1 = "9816b296736292a80b9a3200eb7fbb57aaa3917a"
uuid = "5ab0869b-81aa-558d-bb23-cbf5423bbe9b"
version = "0.6.5"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c7cb1f5d892775ba13767a87c7ada0b980ea0a71"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+2"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Loess]]
deps = ["Distances", "LinearAlgebra", "Statistics"]
git-tree-sha1 = "46efcea75c890e5d820e670516dc156689851722"
uuid = "4345ca2d-374a-55d4-8d30-97f9976e7612"
version = "0.5.4"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "0a1b7c2863e44523180fdb3146534e265a91870b"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.23"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "2ce8695e1e699b68702c03402672a69f54b8aca9"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2022.2.0+0"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

[[deps.Makie]]
deps = ["Animations", "Base64", "ColorBrewer", "ColorSchemes", "ColorTypes", "Colors", "Contour", "Distributions", "DocStringExtensions", "Downloads", "FFMPEG", "FileIO", "FixedPointNumbers", "Formatting", "FreeType", "FreeTypeAbstraction", "GeometryBasics", "GridLayoutBase", "ImageIO", "InteractiveUtils", "IntervalSets", "Isoband", "KernelDensity", "LaTeXStrings", "LinearAlgebra", "MakieCore", "Markdown", "Match", "MathTeXEngine", "MiniQhull", "Observables", "OffsetArrays", "Packing", "PlotUtils", "PolygonOps", "Printf", "Random", "RelocatableFolders", "Setfield", "Showoff", "SignedDistanceFields", "SnoopPrecompile", "SparseArrays", "StableHashTraits", "Statistics", "StatsBase", "StatsFuns", "StructArrays", "TriplotBase", "UnicodeFun"]
git-tree-sha1 = "74657542dc85c3b72b8a5a9392d57713d8b7a999"
uuid = "ee78f7c6-11fb-53f2-987a-cfe4a2b5a57a"
version = "0.19.4"

[[deps.MakieCore]]
deps = ["Observables"]
git-tree-sha1 = "9926529455a331ed73c19ff06d16906737a876ed"
uuid = "20f20a25-4f0e-4fdf-b5d1-57303727442b"
version = "0.6.3"

[[deps.MappedArrays]]
git-tree-sha1 = "e8b359ef06ec72e8c030463fe02efe5527ee5142"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.1"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.Match]]
git-tree-sha1 = "1d9bc5c1a6e7ee24effb93f175c9342f9154d97f"
uuid = "7eb4fadd-790c-5f42-8a69-bfa0b872bfbf"
version = "1.2.0"

[[deps.MathTeXEngine]]
deps = ["AbstractTrees", "Automa", "DataStructures", "FreeTypeAbstraction", "GeometryBasics", "LaTeXStrings", "REPL", "RelocatableFolders", "Test", "UnicodeFun"]
git-tree-sha1 = "64890e1e8087b71c03bd6b8af99b49c805b2a78d"
uuid = "0a4f8689-d25c-4efe-a92b-7142dfc1aa53"
version = "0.5.5"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.MiniQhull]]
deps = ["QhullMiniWrapper_jll"]
git-tree-sha1 = "9dc837d180ee49eeb7c8b77bb1c860452634b0d1"
uuid = "978d7f02-9e05-4691-894f-ae31a51d76ca"
version = "0.4.0"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.4"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore", "ImageMetadata"]
git-tree-sha1 = "5ae7ca23e13855b3aba94550f26146c01d259267"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.1.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.Observables]]
git-tree-sha1 = "6862738f9796b3edc1c09d0890afce4eca9e7e93"
uuid = "510215fc-4207-5dde-b226-833fc4488ee2"
version = "0.5.4"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "82d7c9e310fe55aa54996e6f7f94674e2a38fcb4"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.12.9"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "327f53360fdb54df7ecd01e96ef1983536d1e633"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.2"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "a4ca623df1ae99d09bc9868b008262d0c0ac1e4f"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.1.4+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9ff31d101d987eb9d66bd8b176ac7c277beccd09"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.20+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "d321bf2de576bf25ec4d3e4360faca399afca282"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.0"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.40.0+0"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "67eae2738d63117a196f497d7db789821bce61d1"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.17"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "f809158b27eba0c18c269cf2a2be6ed751d3e81d"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.3.17"

[[deps.Packing]]
deps = ["GeometryBasics"]
git-tree-sha1 = "ec3edfe723df33528e085e632414499f26650501"
uuid = "19eb6ba3-879d-56ad-ad62-d5c202156566"
version = "0.5.0"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "0fac6313486baae819364c52b4f483450a9d793f"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.12"

[[deps.Pango_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "FriBidi_jll", "Glib_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "84a314e3926ba9ec66ac097e3635e270986b0f10"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.50.9+0"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "478ac6c952fddd4399e71d4779797c538d0ff2bf"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.8"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "f6cf8e7944e50901594838951729a1861e668cb8"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.3.2"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "SnoopPrecompile", "Statistics"]
git-tree-sha1 = "c95373e73290cf50a8a22c3375e4625ded5c5280"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.4"

[[deps.PolygonOps]]
git-tree-sha1 = "77b3d3605fc1cd0b42d95eba87dfcd2bf67d5ff6"
uuid = "647866c9-e3ac-4575-94e7-e3d426903924"
version = "0.1.2"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "LaTeXStrings", "Markdown", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "548793c7859e28ef026dba514752275ee871169f"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.2.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "d7a7aef8f8f2d537104f170139553b14dfe39fe9"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.2"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "18e8f4d1426e965c7b532ddd260599e1510d26ce"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.0"

[[deps.QhullMiniWrapper_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Qhull_jll"]
git-tree-sha1 = "607cf73c03f8a9f83b36db0b86a3a9c14179621f"
uuid = "460c41e3-6112-5d7f-b78c-b6823adb3f2d"
version = "1.0.0+1"

[[deps.Qhull_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "238dd7e2cc577281976b9681702174850f8d4cbc"
uuid = "784f63db-0788-585a-bace-daefebcd302b"
version = "8.0.1001+0"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "6ec7ac8412e83d57e313393220879ede1740f9ee"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.8.2"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "dc84268fe0e3335a62e315a3a7cf2afa7178a734"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.3"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "90bc7a7c96410424509e4263e277e43250c05691"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.0"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "f65dcb5fa46aee0cf9ed6274ccbd597adc49aa7b"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.1"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6ed52fdd3382cf21947b15e8870ac0ddbff736da"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.4.0+0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMD]]
deps = ["SnoopPrecompile"]
git-tree-sha1 = "8b20084a97b004588125caebf418d8cab9e393d1"
uuid = "fdea26ae-647d-5447-a871-4b548cad5224"
version = "3.4.4"

[[deps.ScanByte]]
deps = ["Libdl", "SIMD"]
git-tree-sha1 = "2436b15f376005e8790e318329560dcc67188e84"
uuid = "7b38b023-a4d7-4c5e-8d43-3f3097f304eb"
version = "0.3.3"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "30449ee12237627992a99d5e30ae63e4d78cd24a"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.0"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "77d3c4726515dca71f6d80fbb5e251088defe305"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.18"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "StaticArraysCore"]
git-tree-sha1 = "e2cc6d8c88613c05e1defb55170bf5ff211fbeac"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "1.1.1"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.ShiftedArrays]]
git-tree-sha1 = "503688b59397b3307443af35cd953a13e8005c16"
uuid = "1277b4bf-5013-50f5-be3d-901d8477a67a"
version = "2.0.0"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SignedDistanceFields]]
deps = ["Random", "Statistics", "Test"]
git-tree-sha1 = "d263a08ec505853a5ff1c1ebde2070419e3f28e9"
uuid = "73760f76-fbc4-59ce-8f25-708e95d2df96"
version = "0.4.0"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "8fb59825be681d451c246a795117f317ecbcaa28"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.2"

[[deps.SnoopPrecompile]]
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "ef28127915f4229c971eb43f3fc075dd3fe91880"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.2.0"

[[deps.StableHashTraits]]
deps = ["CRC32c", "Compat", "Dates", "SHA", "Tables", "TupleTools", "UUIDs"]
git-tree-sha1 = "0b8b801b8f03a329a4e86b44c5e8a7d7f4fe10a3"
uuid = "c5dd0088-6c3f-4803-b00e-f31a60c170fa"
version = "0.3.1"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "b8d897fe7fa688e93aef573711cb207c08c9e11e"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.19"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "45a7769a04a3cf80da1c1c7c60caf932e6f4c9f7"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.6.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.StatsFuns]]
deps = ["ChainRulesCore", "HypergeometricFunctions", "InverseFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "f625d686d5a88bcd2b15cd81f18f98186fdc0c9a"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "1.3.0"

[[deps.StatsModels]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "Printf", "REPL", "ShiftedArrays", "SparseArrays", "StatsBase", "StatsFuns", "Tables"]
git-tree-sha1 = "51cdf1afd9d78552e7a08536930d7abc3b288a5c"
uuid = "3eaba693-59b7-5ba5-a881-562e759f1c8d"
version = "0.7.1"

[[deps.StringManipulation]]
git-tree-sha1 = "46da2434b41f41ac3594ee9816ce5541c6096123"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.3.0"

[[deps.StructArrays]]
deps = ["Adapt", "DataAPI", "GPUArraysCore", "StaticArraysCore", "Tables"]
git-tree-sha1 = "521a0e828e98bb69042fec1809c1b5a680eb7389"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.15"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "1544b926975372da01227b382066ab70e574a3ec"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.10.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TiffImages]]
deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "Mmap", "OffsetArrays", "PkgVersion", "ProgressMeter", "UUIDs"]
git-tree-sha1 = "8621f5c499a8aa4aa970b1ae381aae0ef1576966"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.6.4"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "94f38103c984f89cf77c402f2a68dbd870f8165f"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.11"

[[deps.TriplotBase]]
git-tree-sha1 = "4d4ed7f294cda19382ff7de4c137d24d16adc89b"
uuid = "981d1d27-644d-49a2-9326-4793e63143c3"
version = "0.1.0"

[[deps.TupleTools]]
git-tree-sha1 = "3c712976c47707ff893cf6ba4354aa14db1d8938"
uuid = "9d95972d-f1c8-5527-a6e0-b4b365fa01f6"
version = "1.3.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "de67fa59e33ad156a590055375a30b23c40299d3"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.5"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "93c41695bc1c08c46c5899f4fe06d6ead504bb73"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.10.3+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.isoband_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51b5eeb3f98367157a7a12a1fb0aa5328946c03c"
uuid = "9a68df92-36a6-505f-a73e-abb412b6bfb4"
version = "0.2.3+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3a2ea60308f0996d26f1e5354e10c24e9ef905d4"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.4.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "libpng_jll"]
git-tree-sha1 = "d4f63314c8aa1e48cd22aa0c17ed76cd1ae48c3c"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.3+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"
"""

# ╔═╡ Cell order:
# ╟─4277db80-d48a-11ed-30e8-db69f212895c
# ╟─58c3ac04-71d4-4cc1-ab23-314871bbae14
# ╠═019e3601-69eb-4622-9fcf-9a0c25776c67
# ╠═295f4880-bdcf-4140-a95c-772839ad31b3
# ╠═b521cbf5-3a6c-4428-899f-ef7924fe1e49
# ╠═c15624c0-b6cb-4740-88d1-7bf44c509b86
# ╠═5f0574a1-4b13-4faf-8f1b-ffe4f3577006
# ╠═5a5019db-cc91-4ad6-ac75-1c0ee4a55a62
# ╠═093b276e-427a-417b-8540-ae05338a0e9f
# ╟─64f6fdb2-d98e-4b95-95ec-1aeed63a2da8
# ╟─7bc7b2cb-52f3-488a-a046-394b90a17657
# ╟─cc31c9a7-2097-4045-b2ec-c3a6a3b52566
# ╠═da5f625c-9c63-4883-8ffc-5e447793a0a2
# ╠═515e44c3-2d2c-4b28-87bd-5e46503b9283
# ╠═a76a7269-0a4b-4923-a459-c22f4cda76c2
# ╠═6c320877-1bab-4099-ac52-5f0c02efe0c0
# ╠═db70c980-3756-4be4-8d3a-b6204ee0a3bd
# ╟─69d6d1fa-dbc5-4eee-9a91-30f509e58ee0
# ╟─05aaa840-7736-4711-af11-e7ff9a19ec58
# ╠═1a2fc19b-3b24-4f23-8836-4162e7311d33
# ╟─e1eac5ae-7cc5-4f17-a181-8bc2ced18aa9
# ╟─cacddc3f-b68f-4a86-b262-23039f5420de
# ╠═672bea96-78b5-4e0a-afc6-e3ec8da933e4
# ╟─34b082bf-33ee-4a54-8e32-f0cfc1069cf2
# ╟─3f8b9e22-3065-4bfe-b146-d185cdfb4de4
# ╟─307cfab9-328e-4407-849f-276d97582cef
# ╟─3f8a27d4-755f-433b-bc3c-f5f1e6678a5f
# ╟─a2d86c2a-6c86-4fef-9365-55e6d7da90a6
# ╟─8aedbd2f-6e23-4846-a4f0-967eae2c8ecf
# ╟─31b32c04-7a2b-41e0-9601-39a92497c7a0
# ╟─6037cd0e-f175-41dc-ba39-203573a0ef0e
# ╟─b82ccea1-6c93-4e66-8443-6007103e1231
# ╟─bd901877-5363-447d-817c-840949b3b98c
# ╟─02d5e7f8-8488-46f6-83ac-54824d60d80a
# ╟─3d8aefde-19ed-4949-8b9c-d2436ad45b7c
# ╟─828b3aee-91a7-48d8-9a5b-34348b61d6de
# ╟─a857fd2e-d5b4-452b-91ca-f01a87cfa8c9
# ╟─a5f9de32-14e1-4ff4-91e2-e9974c98e59b
# ╟─ae0794c3-11c1-40ea-8dc8-e8c30e0221ca
# ╟─76fbb3f2-4188-45a8-bb1e-80069f585827
# ╟─6097f1a5-1888-4cbf-aa0a-7b246cb07972
# ╟─55be08f5-06cd-42c1-8387-f3892c06b965
# ╟─bf910cd4-4d22-4e24-ba00-58464de8f92d
# ╟─8c0fd386-7cf1-47e3-be6f-cb31fe3ebfe9
# ╟─2af4fa16-b741-404f-8917-05d5f65c1311
# ╟─b0da76a7-6eb2-4971-a197-bfdd110566fb
# ╟─f6780eb6-e16e-4a73-994a-8af1ecc4ff3e
# ╟─3c74c9b7-2cfc-49f3-8f7d-4c836937e18a
# ╟─385382ee-0844-4f2b-85fe-29893a30cbed
# ╟─cd3b7740-c614-411f-99e0-d04d1f70a7aa
# ╟─9d6d749b-37f1-4e0c-9c95-035060ffee9e
# ╟─f9369890-06c6-4cc8-902e-a8d4815b305a
# ╟─74fa9dcb-a19b-407d-b4d6-db348414aabc
# ╟─293a8db4-25b8-45ac-8f66-5030c3678769
# ╟─8ff78ed8-cabb-4334-90a7-449b7350944c
# ╠═21ab02d9-31c5-478f-9aaf-9f2d0962aed4
# ╟─6685c382-6371-4891-8670-85ac582e1e30
# ╟─052eec1b-b61f-4f9d-ae61-f2a604598300
# ╠═66d1dc30-f37e-4911-b962-18136b07a41d
# ╟─81d25e62-dd7e-4448-8955-6ec2118a375e
# ╟─2754d630-97cc-4164-b703-8266818839dc
# ╟─d1af330e-e6be-4d04-a983-b0b41ddf8ece
# ╟─10c20e04-8970-4111-8c8f-8f4cb65f622c
# ╟─cff82343-b2c3-4f5c-b7fc-2d55dd9298e0
# ╟─db50f0b0-1b65-49cc-b380-a1e648914364
# ╟─f09e4288-599f-4c1e-b17d-eb1d76248872
# ╟─a6313699-feaa-47f6-8e7a-18f32e3180d5
# ╟─6c9fca6c-6870-449c-9842-3bad7a73dddf
# ╟─678a061f-aeb9-4cbf-ad5a-8cf054f3f5e1
# ╟─4d23e995-9ba3-4f8b-8b4c-047c9d41aca7
# ╠═3be30ce2-2269-4cae-9606-1eab9eab2142
# ╟─487fcbab-6b68-4eda-90c1-8b12cdd98214
# ╟─6fd97083-5aee-412e-bcd3-0786afa88b23
# ╟─84a93510-46b4-4997-8194-e54265fe7410
# ╟─13e515aa-c647-481f-8661-a21346dacd71
# ╟─d986ec9a-d8e1-49d4-805f-27d4a2780be9
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
