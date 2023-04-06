using Plots, Distributions

function experiment_pmf(n::Integer, p::Float64)
    dist = Binomial(n, p)
    pmf = [pdf(dist, s) for s in 0:n]

    pmf

end

function experiment_cdf(n::Integer, p::Float64)
    dist = Binomial(n, p)

    [cdf(dist, s) for s in 0:n]

end

function build_plot(n::Integer, p::Float64)
    x = 0:n
    y_pmf = experiment_pmf(n, p)
    y_cdf = experiment_cdf(n, p)

    g_pmf = scatter(x, y_pmf, title="Bin($n, $p) PMF")
    g_cdf = scatter(x, y_cdf, title="Bin($n, $p) CDF")

    plot(g_pmf, g_cdf, layout=(1, 2), legend=false, size=(800, 500))
    
end

ex_plot = build_plot(50, 0.45)
savefig(ex_plot, "./images/03/binomial_experiment_cdf.png")