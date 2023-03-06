#=
binomial_experiment:
- Julia version: 1.8.5
- Author: ashen
- Date: 2023-03-06
=#

using Plots, Distributions

function experiment(n:: Integer, p::Float64)
    dist = Binomial(n, p)
    pmf = [pdf(dist, s) for s in 0:n]

    pmf
    
end

function biuld_plot()
    ps = [0.1, 0.25, 0.65, 0.95]
    gs = []

    for n in [10, 100]
        for p in ps
            x = 0:n
            y = experiment(n, p)
            g = scatter(x, y, title="Bin($n, $p)")

            push!(gs, g)

        end
        
    end

    return gs
    
end

gs = biuld_plot()
ex_plot = plot(gs..., layout=(4, 2), legend=false, size = (700, 900))
savefig(ex_plot, "./images/03/binomial_experiment.png")
