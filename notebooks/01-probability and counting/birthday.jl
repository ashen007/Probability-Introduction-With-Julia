using Plots

"""
calculate factorial of k number of peoples birthday

...
# Arguments

`k:: Integer`: number of peoples in the room
...
"""
function fact(k::Integer)
    if k <= 365
        fac::BigInt = 1

        for i in 365:-1:(365-k+1)

            fac *= i

        end

        return fac

    else
        error("k must be less than or equal to 365.")

    end

end


"""
calculate the probability of no matching pair of
birthdays in k number of peoples

...
# Arguments

`k:: Integer`: number of peoples in the room
...
"""
function no_matching_bd(k::Integer)
    fact(k) / BigInt(365)^k

end


"""
calculate probability of at least found one matching
pair of birthdays

...
# Arguments

`k:: Integer`: number of peoples in the room
...
"""
function matching_bd(k::Integer)
    no_match = no_matching_bd(k)

    1 - no_match

end


function main()
    ks = 1:150
    ps = [matching_bd(i) for i in ks]

    g = plot(ks, ps, seriestype=:scatter)
    savefig(g, "birthday_jl.png")

end

main()
