#=
intro_examples:
- Julia version: 1.8.5
- Author: ashen
- Date: 2023-02-28
=#
using Plots

"""
Create a random sample with given size. use the input as
upperlimit and 0 1 as the lower limit

...
# Arguments
- `num_sample::Integer`: the size of the sample and upper limit.
...
"""
function sample(num_sample::Int)
    rand(1:num_sample, num_sample)

end

# can not pass a sum(...) function call as it is
# becaues julia will evaluate it imidiatly amd function
# replicate get Int64 value return from the expression
# so need to pass the sum(...) as a Symbol which is not 
# evaluate imideatly it waits until explicitly said to do so

"""
Evaluate given expression given times.

...
# Arguments
- `iter::Integer`: number of time the given expression should
                evaluate
- `expr:: Expression`: expression want to evaluate
...
"""
function replicate(iter::Int, expr::Expr)
    [eval(expr) for _ in 1:iter]

end


"""
find the probability of having at least one matching
cards in the deck.

...
# Arguments
- `n::Integer`: number of times expression should evaluate
- `m::Integer`: number of cards in the deck
...
"""
function matching(dsize::Integer, n::Integer)
    expr = :(sum(sample($(dsize)) .== (1:$(dsize))))
    r = replicate(n, expr)
    p = sum(r.>=1)/n

    p

end

n = 1000
ms = 1:150
ps = [matching(i, n) for i in ms]

plot(ms, ps)
plot!(ms, ps, seriestype=:scatter)