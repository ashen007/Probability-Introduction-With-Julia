#=
intro_examples:
- Julia version: 1.8.5
- Author: ashen
- Date: 2023-02-28
=#

function sample(n)
    rand(1:n, n)

end

# can not pass a sum(...) function call as it is
# becaues julia will evaluate it imidiatly amd function
# replicate get Int64 value return from the expression
# so need to pass the sum(...) as a Symbol which is not 
# evaluate imideatly it waits until explicitly said to do so
function replicate(n, expression::Expr)
    r = [eval(expression) for _ in 1:n]
    r

end

function matching(n)


end

n = 100

replicate(10, :(sum(sample(n) .== (1:n)))) .>= 1