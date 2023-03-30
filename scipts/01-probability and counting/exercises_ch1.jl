### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 5d62393a-167a-4df3-b8ae-dff52e5ead84
md"""
# unit 1: exersizes
"""

# ╔═╡ 98ded8f0-cbf9-11ed-1b33-2b3fe83448d6
md"""
How many ways are there to split a dozen people into 3 teams, where one team has 2 people, and the other two teams have 5 people each?
"""

# ╔═╡ e2a66c2f-67c5-415d-a7ea-fff0f9640e43
begin
size_two_team = binomial(12, 2)
size_five_team = binomial(10, 5)
	
size_two_team * (size_five_team / 2)
end

# ╔═╡ 7f5fd23f-4e3f-4b95-9d12-88c3f8857db2
md"""
How many ways are there to split a dozen people into 3 teams, where each team has 4 people?
"""

# ╔═╡ 34600447-6a6c-4383-b153-fb3119bdd318
factorial(12) / (factorial(4) * factorial(4) * factorial(4) * factorial(3))

# ╔═╡ 37c9d160-620d-486c-9fa4-d334c80479ff
md"""
rolling dice,

- total after rolling 4 fair dice is 21
- total after rolling 4 fair dice is 22
"""

# ╔═╡ 2f305ce3-73de-4948-8f95-86fe805ab94f
function rolling_fair_die(n)
	rand(1:6, 4)

end

# ╔═╡ b3dbdb50-e79e-4c2f-bbfc-2d8961809c06
begin
	total_in_four_rolls = [sum(rolling_fair_die(4)) for i=1:50000]
	tot_21 = length(total_in_four_rolls[total_in_four_rolls .== 21])
	tot_22 = length(total_in_four_rolls[total_in_four_rolls .== 22])

	p_tot_21 = tot_21/50000
	p_tot_22 = tot_22/50000

	println("P(21) = $p_tot_21")
	println("P(22) = $p_tot_22")
end

# ╔═╡ 9d9d47ac-e291-4435-8796-68d7b2beca89
md"""
How many 7-digit phone numbers are possible, assuming that the first digit can’t be a 0 or a 1?
"""

# ╔═╡ cef8d26c-f3ba-4f70-bc90-f78a81780fc8
begin
	first_number = binomial(8, 1)
	other_six_numbers = binomial(10, 1)

	first_number * other_six_numbers^6
end

# ╔═╡ 096426e5-b187-4db9-97f6-4a8297f5a9a8
md"""
Re-solve the previous problem, except now assume also that the phone number is not allowed to start with 911.
"""

# ╔═╡ 5e2e6f71-6069-4e1b-a575-1e3b6789c7b8
begin
	numbers_with_911 = 1 * binomial(10, 1) ^ 4
	val_nums = 8000000

	val_nums - numbers_with_911

end

# ╔═╡ d3d185e2-514f-471d-98fe-f01340944df6
md"""
Two chess players, A and B, are going to play 7 games. Each game has three possible outcomes: a win for A (which is a loss for B), a draw (tie), and a loss for A (which is a win for B). A win is worth 1 point, a draw is worth 0.5 points, and a loss is worth 0 points.
"""

# ╔═╡ c51f80f7-d999-41de-ac88-e482cbf7e5a6
md"""
How many possible outcomes for the individual games are there, such that overall player A ends up with 3 wins, 2 draws, and 2 losses?
"""

# ╔═╡ c73b64bd-4be2-4759-98c5-848f886ed9d8
begin
	total_results = factorial(7)
	three_wins = factorial(3)
	two_draws = factorial(2)
	two_loss = factorial(2)

	total_results / (three_wins * two_draws * two_loss)

end

# ╔═╡ 92ac4f49-ba23-406e-b7b1-5db6227fc9c0
md"""
How many possible outcomes for the individual games are there, such that A ends up with 4 points and B ends up with 3 points?
"""

# ╔═╡ 038d81a0-1e70-488f-8f76-38f48bd0ca20
begin
	way_1 = factorial(7) / (factorial(4) * factorial(3))
	way_2 = factorial(7) / (factorial(2) * factorial(4) * factorial(1))
	way_3 = factorial(7) / (factorial(3) * factorial(2) * factorial(2))
	way_4 = factorial(7) / (factorial(1) * factorial(6))

	way_1 + way_2 + way_3 + way_4
end

# ╔═╡ a1dd1fbf-099f-49ae-9978-96f4bb885a2e
md"""
Now assume that they are playing a best-of-7 match, where the match will end when either player has 4 points or when 7 games have been played, whichever is first. For example, if after 6 games the score is 4 to 2 in favor of A, then A wins the match and they don't play a 7th game. How many possible outcomes for the individual games are there, such that the match lasts for 7 games and A wins by a score of 4 to 3?
"""

# ╔═╡ 6f5e12d4-af24-41d6-b187-2b466857dd5e
begin
	way_1_ = factorial(6) / (factorial(3) * factorial(3))
	way_2_ = factorial(6) / (factorial(2) * factorial(2) * factorial(2))
	way_3_ = factorial(6) / (factorial(3) * factorial(2))
	way_4_ = factorial(6) / factorial(6)
	way_5_ = factorial(6) / factorial(5)
	way_6_ = factorial(6) / factorial(4)
	way_7_ = factorial(6) / (factorial(2) * factorial(3))

	way_1_ + way_2_ + way_3_ + way_4_ + way_5_ + way_6_ + way_7_
end

# ╔═╡ 3319d87d-7d3f-40ec-9e11-48d0d2856de0
md"""
Three people get into an empty elevator at the first floor of a building that has 10 floors. Each presses the button for their desired floor (unless one of the others has already pressed that button). Assume that they are equally likely to want to go to floors 2 through 10 (independently of each other). What is the probability that the buttons for 3 consecutive floors are pressed?
"""

# ╔═╡ 9ff3282b-4a54-4ffa-be00-811e3b952151
begin
	three_con_btn = binomial(7, 1)
	ways_getting_off = factorial(3)
	tot_three_btn = 9^3

	(three_con_btn * ways_getting_off) / tot_three_btn
end

# ╔═╡ 9e9c150a-39bf-4fa9-9a22-7452918a51f6
md"""
The number of ways to choose 5 people out of 10 is ___ the number of ways to choose 6 people out of 10
"""

# ╔═╡ f3ae8441-0572-42bb-b7b6-2b934ec97e6a
begin
	choose_five = binomial(10, 5)
	choose_six = binomial(10, 6)

	println(choose_five)
	println(choose_six)
end

# ╔═╡ 96700a89-1951-47c5-a449-a553a34f3936
md"""
The number of ways to break 10 people into 2 teams of 5 is ___ the number of ways to break 10 people into a team of 6 and a team of 4
"""

# ╔═╡ 6a6d1cc9-1d7b-421d-8157-b52089287ca9
begin
	equal_size_teams = factorial(10) / (factorial(5) * factorial(5) * factorial(2))
	different_size_teams = binomial(10, 6) * binomial(4, 4)

	println(equal_size_teams)
	println(different_size_teams)
end

# ╔═╡ ef53b22a-256b-411f-9da1-dc164cce8311
md"""
The probability that all 3 people in a group of 3 were born on January 1 is ___ unanswered  the probability that in a group of 3 people, one was born on January 1, another one was born on January 2, and the remaining one was born on January 3.
"""

# ╔═╡ 6bbdb4be-96d3-47b3-807e-ce57ce15be43
begin
	all_born_in_same_day = 1 - ((31 * 30 * 29) / 31^3)
	born_in_con_days = (binomial(29, 1) * factorial(3)) / 31^3

	println(all_born_in_same_day)
	println(born_in_con_days)
end

# ╔═╡ ad85c9c0-9467-4e63-99af-7bb8ca2ec39f
md"""
How many paths are there from the point (0, 0) to the point (110, 111) in the plane such that each step either consists of going one unit up or one unit to the right?
"""

# ╔═╡ 01b22e63-66a4-4d6c-8683-c4c3899b868a
md"""
To reach point (110,111) from (0,0) a total of 221 steps must be taken, of which 110
steps involve going one unit to the right and the remaining 111 involve going one unit up. If a path is encoded by a sequence of U's and R's denoting 'up' and 'right' respectively, to determine the possible paths we just need to specify where the U's are located in the sequence (or where the R's are located). So the number of paths is: 

${221 \choose 111}$ or ${221 \choose 110}$ both of which evaluate to the same number.
"""

# ╔═╡ 1505e28a-dedb-4f2d-84e9-c390af48c078
md"""
How many paths are there from (0, 0) to (210, 211), where each step consists of going
one unit up or one unit to the right, and the path has to go through (110, 111)?
"""

# ╔═╡ ca862cb7-aaee-46c2-9492-632afdbaf3dd
md"""
As calculated in (a), there are ${221 \choose 111}$ paths from (0,0) to (110,111). From there, to reach (210,211), 100 more unit steps should be taken in each direction (up, right). So the total number of paths is:

${221 \choose 111}.{200 \choose 100}$
"""

# ╔═╡ 454a338d-b0ca-494c-875f-c2847a45efcb
md"""
A certain family has 6 children, consisting of 3 boys and 3 girls. Assuming that all
birth orders are equally likely, what is the probability that the 3 eldest children are the 3 girls?
"""

# ╔═╡ 1c45cbae-6db2-4de4-af96-d6a4fad7398e
md"""
Label the girls as 1, 2, 3 and the boys as 4, 5, 6. Think of the birth order is a
permutation of 1, 2, 3, 4, 5, 6, e.g., we can interpret 314265 as meaning that child 3
was born first, then child 1, etc. The number of possible permutations of the birth
orders is 6!. Now we need to count how many of these have all of 1, 2, 3 appear before
all of 4, 5, 6. This means that the sequence must be a permutation of 1, 2, 3 followed
by a permutation of 4, 5, 6. So with all birth orders equally likely, we have,
"""

# ╔═╡ ef697a01-fcb0-48d7-96e5-f5ed9875a22d
begin
	elder_girls = factorial(3) * factorial(3)
	total_ways = factorial(6)

	elder_girls / total_ways
end

# ╔═╡ 17adb53f-667e-4b95-93b0-75034e6fae10
md"""
A city with 6 districts has 6 robberies in a particular week. Assume the robberies are
located randomly, with all possibilities for which robbery occurred where equally likely. What is the probability that some district had more than 1 robbery?
"""

# ╔═╡ e0fed597-09e3-4fdb-bae4-630ef4de2582
md"""
There are $6^6$ possible configurations for which robbery occurred where. There are
6! configurations where each district had exactly 1 of the 6, so the probability of the complement of the desired event is 6!/$6^6$. So the probability of some district having more than 1 robbery is,
"""

# ╔═╡ f4475b38-d676-442c-a6a2-8aea466eee8f
begin
	tot_ways = 6^6
	no_more_than_single_rob = factorial(6)
	more_than_single_rob = 1 - (no_more_than_single_rob / tot_ways)
end

# ╔═╡ 75f9ad5c-27cb-4026-8a9f-6e0c24d1908f
md"""
A college has 10 time slots for its courses, and blithely assigns courses to completely random time slots, independently. The college offers exactly 3 statistics courses. What is the probability that 2 or more of the statistics courses are in the same time slot?
"""

# ╔═╡ acbc4545-e45f-4027-bdcb-243210cf034a
begin
	ways_choose_timeslot = 10^3
	no_crashes = 10 * 9 * 8
	crashes = 1 - (no_crashes / ways_choose_timeslot)
end

# ╔═╡ c7577e8f-1d0c-4d0f-ba46-6e9fdf8643b8
md"""
A jar contains r red balls and g green balls, where r and g are fixed positive integers. A ball is drawn from the jar randomly (with all possibilities equally likely), and then a second ball is drawn randomly.
"""

# ╔═╡ f58243e9-8145-4d8b-b809-9113c093e1e5
md"""
a) Explain intuitively why the probability of the second ball being green is the same
as the probability of the first ball being green.
"""

# ╔═╡ ffd58c73-ecbd-4504-8073-414585f2f9ca
md"""
This is true by symmetry. The first ball is equally likely to be any of the $g + r$
balls, so the probability of it being green is $g/(g + r)$. But the second ball is also equally likely to be any of the $g + r$ balls (there aren’t certain balls that enjoy being chosen second and others that have an aversion to being chosen second); once we know whether the first ball is green we have information that affects our uncertainty about the second ball, but before we have this information, the second ball is equally likely to be any of the balls.
"""

# ╔═╡ 0bf13ce9-0124-462b-958b-a3ef1ac0c3f3
md"""
b) Define notation for the sample space of the problem,
"""

# ╔═╡ 42b4869b-a167-4060-90e6-0a36438086ab
md"""
Label the balls as $1, 2,...,g+r$, such that $1, 2,...,g$ are green and $g+1,...,g+r$
are red. The sample space can be taken to be the set of all pairs $(a, b)$ with $a, b \in \lbrace 1,...,g + r \rbrace$ and $a \neq b$
"""

# ╔═╡ 92793d92-9a30-44ed-bd9d-6c786e223f7a
md"""
c) Suppose that there are 16 balls in total, and that the probability that the two balls are the same color is the same as the probability that they are dierent colors. What are r and g (list all possibilities)?
"""

# ╔═╡ 6b2a5a19-15b1-4799-bd2b-c37c6bd176aa
md"""
Let $A$ be the event of getting one ball of each color. In set notation, we can write
$A = (G_1 \cap G_2^c) \cup (G_1^c \cap G_2)$. We are given that $P(A) = P(A^c)$, so
$P(A)=1/2$. Then,

$$P(A) = \frac{2gr}{(g + r)(g + r  1)} = \frac{1}{2}$$

giving the quadratic equation

$$g^2 + r^2 - 2gr - g - r = 0$$

i.e., $(g - r)^2 = g + r$. But $g + r = 16$, so $g - r$ is $4$ or $-4$. Thus, either $g = 10$, $r = 6$, or $g = 6$, $r = 10$.
"""

# ╔═╡ e8339acb-f7db-4a6f-a713-7e5e6c35c112
md"""
Arby has a belief system assigning a number ${P_{Arby}(A)}$ between 0 and 1 to every
event A (for some sample space). This represents Arby’s subjective degree of belief
about how likely A is to occur. For any event A, Arby is willing to pay a price of
1000 · ${P_{Arby}(A)}$ dollars to buy a certificate such as the one shown below:

**Certificate**
_The owner of this certificate can redeem it for $1000 if A
occurs. No value if A does not occur, except as required
by federal, state, or local law. No expiration date._

Likewise, Arby is willing to sell such a certificate at the same price. Indeed, Arby
is willing to buy or sell any number of certificates at this price, as Arby considers it the “fair” price. Arby, not having taken Stat 110, stubbornly refuses to accept the axioms of probability. In particular, suppose that there are two disjoint events A and B with ${P_{Arby}(A \cup B) \neq P_{Arby}(A) + P_{Arby}(B)}$. Show how to make Arby go bankrupt, by giving a list of transactions Arby is willing to make that will guarantee that Arby will lose money (you can assume it will be known whether A occurred and whether B occurred the day after any certificates are bought/sold).
"""

# ╔═╡ 0e1031f5-2bd4-4a47-943b-62bd134f9827
md"""
suppose, 

$${{P_{Arby}(A \cup B)} \lt {P_{Arby}(A) + P_{Arby}(B)}}$$

Call a certificate like the one show above, with any event C in place of A, a Ccertificate. Measuring money in units of thousands of dollars, Arby is willing to
pay ${P_{Arby}(A) + P_{Arby}(B)}$ to buy an A-certificate and a B-certificate, and is willing to sell an $(A \cup B)$-certificate for ${P_{Arby}(A \cup B)}$. In those transactions, Arby loses ${P_{Arby}(A) + P_{Arby}(B) - P_{Arby}(A \cup B)}$ and will not recoup any of that loss because if A or B occurs, Arby will have to pay out an amount equal to the amount Arby receives (since it’s impossible for both A and B to occur).

now suppose,

$${P_{Arby}(A \cup B) \gt P_{Arby}(A) + P_{Arby}(B)}$$

Measuring money in units of thousands of dollars, Arby is willing to sell an Acertificate for ${P_{Arby}(A)}$, sell a B-certificate for ${P_{Arby}(B)}$, and buy a $(A \cup B)$-certificate for $(A \cup B)$. In so doing, Arby loses ${P_{Arby}(A \cup B) - ({P_{Arby}(A)} + {P_{Arby}(B)})}$, and Arby won’t recoup any of this loss, similarly to the above. (In fact, in this case, even if A and B are not disjoint, Arby will not recoup any of the loss, and will lose more money if both A and B occur.)

By buying/selling a suciently large number of certificates from/to Arby as described above, you can guarantee that you’ll get all of Arby’s money; this is called
an arbitrage opportunity. This problem illustrates the fact that the axioms of probability are not arbitrary, but rather are essential for coherent thought (at least the first axiom, and the second with finite unions rather than countably infinite unions).

_Arbitrary axioms allow arbitrage attacks, principled properties and perspectives
on probability potentially prevent perdition._
"""

# ╔═╡ 742ac932-2d32-4d94-ba54-565c35a781cd
md"""
A card player is dealt a 13-card hand from a well-shuffled, standard deck of cards.
What is the probability that the hand is void in at least one suit ("void in a suit" means having no cards of that suit)?
"""

# ╔═╡ ef050531-dc26-4ad7-ba1e-732c0d2d6805
begin
	choose_hand = binomial(52, 13)
	void_in_single_suite = 4 * (binomial(39, 13) / choose_hand)
	void_in_two_suite = 6 * (binomial(26, 13) / choose_hand)
	void_in_three_suite = 4 * (binomial(13, 13) / choose_hand)
	voids_in_atleast_hand = void_in_single_suite - void_in_two_suite + void_in_three_suite
end

# ╔═╡ cb4df133-a78a-49a5-81a9-568c26b29ef9
md"""
For a group of 7 people, find the probability that all 4 seasons (winter, spring,
summer, fall) occur at least once each among their birthdays, assuming that all seasons are equally likely.
"""

# ╔═╡ e3244016-3285-47f2-9ca9-7d29491a6177
begin
	choose_a_season = binomial(7, 4)
	at_least_one_season = 4 * (binomial(4, 1) / choose_a_season)
	at_least_two_season = 6 * (binomial(4, 2) / choose_a_season)
	at_least_three_season = 4 * (binomial(4, 3) / choose_a_season)

	at_least_one_season - at_least_two_season + at_least_three_season
end

# ╔═╡ Cell order:
# ╟─5d62393a-167a-4df3-b8ae-dff52e5ead84
# ╟─98ded8f0-cbf9-11ed-1b33-2b3fe83448d6
# ╠═e2a66c2f-67c5-415d-a7ea-fff0f9640e43
# ╟─7f5fd23f-4e3f-4b95-9d12-88c3f8857db2
# ╠═34600447-6a6c-4383-b153-fb3119bdd318
# ╟─37c9d160-620d-486c-9fa4-d334c80479ff
# ╠═2f305ce3-73de-4948-8f95-86fe805ab94f
# ╠═b3dbdb50-e79e-4c2f-bbfc-2d8961809c06
# ╟─9d9d47ac-e291-4435-8796-68d7b2beca89
# ╠═cef8d26c-f3ba-4f70-bc90-f78a81780fc8
# ╟─096426e5-b187-4db9-97f6-4a8297f5a9a8
# ╠═5e2e6f71-6069-4e1b-a575-1e3b6789c7b8
# ╟─d3d185e2-514f-471d-98fe-f01340944df6
# ╟─c51f80f7-d999-41de-ac88-e482cbf7e5a6
# ╠═c73b64bd-4be2-4759-98c5-848f886ed9d8
# ╟─92ac4f49-ba23-406e-b7b1-5db6227fc9c0
# ╠═038d81a0-1e70-488f-8f76-38f48bd0ca20
# ╟─a1dd1fbf-099f-49ae-9978-96f4bb885a2e
# ╠═6f5e12d4-af24-41d6-b187-2b466857dd5e
# ╟─3319d87d-7d3f-40ec-9e11-48d0d2856de0
# ╠═9ff3282b-4a54-4ffa-be00-811e3b952151
# ╟─9e9c150a-39bf-4fa9-9a22-7452918a51f6
# ╠═f3ae8441-0572-42bb-b7b6-2b934ec97e6a
# ╟─96700a89-1951-47c5-a449-a553a34f3936
# ╠═6a6d1cc9-1d7b-421d-8157-b52089287ca9
# ╟─ef53b22a-256b-411f-9da1-dc164cce8311
# ╠═6bbdb4be-96d3-47b3-807e-ce57ce15be43
# ╟─ad85c9c0-9467-4e63-99af-7bb8ca2ec39f
# ╟─01b22e63-66a4-4d6c-8683-c4c3899b868a
# ╟─1505e28a-dedb-4f2d-84e9-c390af48c078
# ╟─ca862cb7-aaee-46c2-9492-632afdbaf3dd
# ╟─454a338d-b0ca-494c-875f-c2847a45efcb
# ╟─1c45cbae-6db2-4de4-af96-d6a4fad7398e
# ╠═ef697a01-fcb0-48d7-96e5-f5ed9875a22d
# ╟─17adb53f-667e-4b95-93b0-75034e6fae10
# ╟─e0fed597-09e3-4fdb-bae4-630ef4de2582
# ╠═f4475b38-d676-442c-a6a2-8aea466eee8f
# ╟─75f9ad5c-27cb-4026-8a9f-6e0c24d1908f
# ╠═acbc4545-e45f-4027-bdcb-243210cf034a
# ╟─c7577e8f-1d0c-4d0f-ba46-6e9fdf8643b8
# ╟─f58243e9-8145-4d8b-b809-9113c093e1e5
# ╟─ffd58c73-ecbd-4504-8073-414585f2f9ca
# ╟─0bf13ce9-0124-462b-958b-a3ef1ac0c3f3
# ╟─42b4869b-a167-4060-90e6-0a36438086ab
# ╟─92793d92-9a30-44ed-bd9d-6c786e223f7a
# ╟─6b2a5a19-15b1-4799-bd2b-c37c6bd176aa
# ╟─e8339acb-f7db-4a6f-a713-7e5e6c35c112
# ╟─0e1031f5-2bd4-4a47-943b-62bd134f9827
# ╟─742ac932-2d32-4d94-ba54-565c35a781cd
# ╠═ef050531-dc26-4ad7-ba1e-732c0d2d6805
# ╟─cb4df133-a78a-49a5-81a9-568c26b29ef9
# ╠═e3244016-3285-47f2-9ca9-7d29491a6177
