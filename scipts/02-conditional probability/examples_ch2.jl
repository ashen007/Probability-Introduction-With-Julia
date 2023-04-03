### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 5a1a6250-d154-11ed-2d83-2d745cc7d718
md"""
## example 2.2.2 two cards
"""

# ╔═╡ 0ef103b5-67b2-4369-b2de-f09cb690f7e7
md"""
A standard deck of cards is shuffled well. Two cards are drawn randomly, one at a time without replacement. Let $A$ be the event that the first card is a heart, and $B$ be the event that the second card is red. Find $P(A \mid B)$ and $P(B \mid A)$.
"""

# ╔═╡ d04436c0-91a7-41db-b635-f28470956f57
begin
	p_a = 1 / 4
	p_b = 26 / 52
	p_ab = (13 * 25) / (52 * 51)

	a_given_b = p_ab / p_b
	b_given_a = p_ab / p_a

	println("probability A given B: $a_given_b")
	println("probability B given A: $b_given_a")
end

# ╔═╡ 9ae104b4-e30c-4ed8-8c12-5b3a148d8496
md"""
**When we calculate conditional probabilities, we are considering what information observing one event provides about another event, not whether one event causes another.**
"""

# ╔═╡ 5c3578b4-2a70-4b6c-8ce6-75151a407eb4
md"""
## example 2.2.5 two children
"""

# ╔═╡ ffd88569-e517-458e-a410-0fe6bc162fe1
md"""
_Mr. Jones has two children. The older child is a girl. What is the probability that
both children are girls?_

_Mr. Smith has two children. At least one of them is a boy. What is the probability that both children are boys?_
"""

# ╔═╡ ff767a84-7a03-4900-848d-6e0e6c6b23fc
begin
	md"""
	all possibilities in here : $\lbrace (GG), (GB), (BG), (BB) \rbrace$
	"""
	md"""
	for part 1, $A$ is both being girls, $B$ is elder is girl.
	"""
	p_ab_1 = 1 / 4
	p_b_1 = 2 / 4
	a_1 = p_ab_1 / p_b_1

	println("P(both being girls | elder is girl) = $a_1")

	md"""
	for part 2, $A$ is both being boys, $B$ is one of them is boy.
	"""
	p_ab_2 = 1 / 4
	p_b_2 = 3 / 4
	a_2 = p_ab_2 / p_b_2

	println("P(both being boys | one of them is boy) = $a_2")
end

# ╔═╡ 6e0c0bdb-fad5-4177-a283-d79a5551caf9
md"""
## example 2.2.6 random child is a girl
"""

# ╔═╡ e9ec25e1-3166-454f-ade9-73e24bc4d15e
md"""
A family has two children. You randomly run into one of the two, and learn that she is a girl. With assumptions as in the previous example, what is the conditional probability that both are girls? Also assume that you are equally likely to run into either child, and that which one you run into has nothing to do with gender.
"""

# ╔═╡ 978d89aa-dec4-4c87-8cf1-8abdb12dd430
begin
	# A is both being girls, B is random child is girl
	p_ab_3 = 1 / 4
	p_b_3 = 1 / 2

	println("P(both being girls | random child is girl) = $(p_ab_3 / p_b_3)")
end

# ╔═╡ 4e962cb5-4f07-419e-885e-6675e1c0bbbf
md"""
## example 2.2.7 a girl born in winter
"""

# ╔═╡ 0b62bd89-889a-4e72-9b3a-fa1710b41da6
md"""
A family has two children. Find the probability that both children are girls, given that at least one of the two is a girl who was born in winter. In addition to the assumptions from Example 2.2.5, assume that the four seasons are equally likely and that gender is independent of season.
"""

# ╔═╡ 9abf920c-6a93-49e6-9991-1908e43df4b4
begin
	winter = 1/ 4
	winter_born_g = winter * (1 / 2)
	at_least_one_winter_g = 1 - (1 - winter_born_g)^2

	# p(both girls, at least one winter child) is same as p(both girls, at least one winter child)
	both_g_and_at_least_one_winter_g = (1 / 4) * (1 - (3 / 4)^2)

	both_g_and_at_least_one_winter_g / at_least_one_winter_g
end

# ╔═╡ 80e5cee9-09ec-4338-9049-a10892fc71b0
md"""
## example 2.3.7 random coin
"""

# ╔═╡ 42ec1d28-747a-4196-a5b1-c680a0ad6bfc
md"""
You have one fair coin, and one biased coin which lands Heads with probability 3/4. You pick one of the coins at random and flip it three times. It lands Heads all three times. Given this information, what is the probability that the coin you picked is the fair one?
"""

# ╔═╡ c416addd-f3c5-4959-b688-0673c68ed007
begin
	fair_coin = 1 / 2
	three_heads = (((1 / 2)^3) * fair_coin) + (((3 / 4)^3) * (1 - fair_coin))
	three_heads_given_fair_coin = (1 / 2)^3
	fair_coin_given_three_heads = (three_heads_given_fair_coin * fair_coin) / three_heads
end

# ╔═╡ f3d8ff6a-22a2-4b6f-bace-a9e3fce926eb
md"""
## example 2.3.9 testing rare disease
"""

# ╔═╡ ed36a264-938f-477f-9bf3-206d793a59aa
md"""
A patient named Fred is tested for a disease called conditionitis, a medical condition that afflicts 1% of the population. The test result is positive, i.e., the test claims that Fred has the disease. Let $D$ be the event that Fred has the disease and $T$ be the event that he tests positive.

Suppose that the test is "95% accurate"; there are different measures of the accuracy
of a test, but in this problem it is assumed to mean that $P(T \mid D) = 0.95$ and
$P(T^c \mid D^c) = 0.95$. The quantity $P(T \mid D)$ is known as the _sensitivity_ or _true positive rate_ of the test, and $P(T^c \mid D^c)$ is known as the _specificity_ or _true negative rate_.

Find the conditional probability that Fred has conditionitis, given the evidence
provided by the test result.
"""

# ╔═╡ 456031b9-7852-4479-b64b-c0f5b7f281a2
begin
	D = 0.01
	T = 0.95 * 0.01 + 0.05 * 0.99 # p(T) = p(T | D)p(D) + p(T | D^c)p(D^c)
	T_given_D = 0.95
	D_given_T = (T_given_D * D) / T
end

# ╔═╡ 7ce8bbb3-dc5e-48f5-81e4-8ff9e73902b2
md"""
## example 2.3.10 six-fingered man
"""

# ╔═╡ 37378edb-d439-4cb7-82fa-0b392f13f1d0
md"""
A crime has been committed in a certain country. The perpetrator is one (and only one) of the n men who live in the country. Initially, these n men are all deemed equally likely to be the perpetrator. An eyewitness then reports that the crime was committed by a man with six fingers on his right hand.

Let $p_0$ be the probability that an innocent man has six fingers on his right hand,
and $p_1$ be the probability that the perpetrator has six fingers on his right hand,
with $p_0 \lt p_1$. (We may have $p_1 \lt 1$, since eyewitnesses are not 100% reliable.) Let $a = p_0 / p_1$ and $b = {(1 - p_1)} / {(1 - p_0)}$.

Rugen lives in the country. He is found to have six fingers on his right hand.

a) Given this information, what is the probability that Rugen is the perpetrator?

b) Now suppose that all n men who live in the country have their hands checked, and      Rugen is the only one with six fingers on his right hand. Given this information,     what is the probability that Rugen is the perpetrator?
"""

# ╔═╡ 3b6f1358-32f5-4a42-b055-6d04d70bbff6


# ╔═╡ Cell order:
# ╟─5a1a6250-d154-11ed-2d83-2d745cc7d718
# ╟─0ef103b5-67b2-4369-b2de-f09cb690f7e7
# ╠═d04436c0-91a7-41db-b635-f28470956f57
# ╟─9ae104b4-e30c-4ed8-8c12-5b3a148d8496
# ╟─5c3578b4-2a70-4b6c-8ce6-75151a407eb4
# ╟─ffd88569-e517-458e-a410-0fe6bc162fe1
# ╠═ff767a84-7a03-4900-848d-6e0e6c6b23fc
# ╟─6e0c0bdb-fad5-4177-a283-d79a5551caf9
# ╟─e9ec25e1-3166-454f-ade9-73e24bc4d15e
# ╠═978d89aa-dec4-4c87-8cf1-8abdb12dd430
# ╟─4e962cb5-4f07-419e-885e-6675e1c0bbbf
# ╟─0b62bd89-889a-4e72-9b3a-fa1710b41da6
# ╠═9abf920c-6a93-49e6-9991-1908e43df4b4
# ╟─80e5cee9-09ec-4338-9049-a10892fc71b0
# ╟─42ec1d28-747a-4196-a5b1-c680a0ad6bfc
# ╠═c416addd-f3c5-4959-b688-0673c68ed007
# ╟─f3d8ff6a-22a2-4b6f-bace-a9e3fce926eb
# ╟─ed36a264-938f-477f-9bf3-206d793a59aa
# ╠═456031b9-7852-4479-b64b-c0f5b7f281a2
# ╟─7ce8bbb3-dc5e-48f5-81e4-8ff9e73902b2
# ╟─37378edb-d439-4cb7-82fa-0b392f13f1d0
# ╠═3b6f1358-32f5-4a42-b055-6d04d70bbff6
