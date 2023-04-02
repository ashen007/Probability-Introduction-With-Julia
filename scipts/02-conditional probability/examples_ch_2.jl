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
# ╠═4e962cb5-4f07-419e-885e-6675e1c0bbbf
