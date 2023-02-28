#=
intro_examples:
- Julia version: 1.8.5
- Author: ashen
- Date: 2023-02-28
=#

"""
Create a random sample with given size. use the input as
upperlimit and 0 1 as the lower limit

...
# Arguments
- `n::Integer`: the size of the sample and upper limit.
...
"""
function sample(n::Int)
    rand(1:n, n)

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
- `n::Integer`: number of time the given expression should
                evaluate
- `expression:: Expression`: expression want to evaluate
...
"""
function replicate(n::Int, expression::Expr)
    [eval(expression) for _ in 1:n]

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
function matching(n::Int, m::Int)
    r = replicate(n, :(sum(sample(m) .== (1:m))))
    sum(r.>=1)/n

end

n = 1000
m = 56

matching(n, m)