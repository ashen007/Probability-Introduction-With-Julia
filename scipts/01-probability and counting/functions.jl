using Plots

function parabolic(x)
    return x.^2
    
end

function exponential_(x)
    return exp.(-1*((x.^2) ./ 2))
    
end

function cubic(x)
    return x.^3
    
end

function expon_rate(x)
    return x .* exp.(-1*((x.^2) ./ 2))
    
end

xs = range(-2, 2, 1000)

para_y = parabolic(xs)
exp_ = exponential_(xs)
cube = cubic(xs)
exp_rate = expon_rate(xs)

plot(xs, para_y)
plot(xs, exp_)
plot(xs, cube)
plot(xs, exp_rate)