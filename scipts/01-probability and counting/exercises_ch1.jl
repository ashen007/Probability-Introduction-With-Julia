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

# ╔═╡ Cell order:
# ╠═5d62393a-167a-4df3-b8ae-dff52e5ead84
# ╠═98ded8f0-cbf9-11ed-1b33-2b3fe83448d6
# ╠═e2a66c2f-67c5-415d-a7ea-fff0f9640e43
# ╠═7f5fd23f-4e3f-4b95-9d12-88c3f8857db2
# ╠═34600447-6a6c-4383-b153-fb3119bdd318
# ╠═37c9d160-620d-486c-9fa4-d334c80479ff
# ╠═2f305ce3-73de-4948-8f95-86fe805ab94f
# ╠═b3dbdb50-e79e-4c2f-bbfc-2d8961809c06
# ╠═9d9d47ac-e291-4435-8796-68d7b2beca89
# ╠═cef8d26c-f3ba-4f70-bc90-f78a81780fc8
# ╠═096426e5-b187-4db9-97f6-4a8297f5a9a8
# ╠═5e2e6f71-6069-4e1b-a575-1e3b6789c7b8
# ╠═d3d185e2-514f-471d-98fe-f01340944df6
# ╠═c51f80f7-d999-41de-ac88-e482cbf7e5a6
# ╠═c73b64bd-4be2-4759-98c5-848f886ed9d8
# ╠═92ac4f49-ba23-406e-b7b1-5db6227fc9c0
# ╠═038d81a0-1e70-488f-8f76-38f48bd0ca20
# ╠═a1dd1fbf-099f-49ae-9978-96f4bb885a2e
# ╠═6f5e12d4-af24-41d6-b187-2b466857dd5e
# ╠═3319d87d-7d3f-40ec-9e11-48d0d2856de0
# ╠═9ff3282b-4a54-4ffa-be00-811e3b952151
# ╠═9e9c150a-39bf-4fa9-9a22-7452918a51f6
# ╠═f3ae8441-0572-42bb-b7b6-2b934ec97e6a
# ╠═96700a89-1951-47c5-a449-a553a34f3936
# ╠═6a6d1cc9-1d7b-421d-8157-b52089287ca9
# ╠═ef53b22a-256b-411f-9da1-dc164cce8311
# ╠═6bbdb4be-96d3-47b3-807e-ce57ce15be43
# ╠═ad85c9c0-9467-4e63-99af-7bb8ca2ec39f
# ╠═01b22e63-66a4-4d6c-8683-c4c3899b868a
# ╠═1505e28a-dedb-4f2d-84e9-c390af48c078
# ╠═ca862cb7-aaee-46c2-9492-632afdbaf3dd
