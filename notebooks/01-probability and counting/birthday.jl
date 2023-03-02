using Plots


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


function no_matching_bd(k::Integer)
    fact(k) / BigInt(365)^k

end


function matching_bd(k::Integer)
    no_match = no_matching_bd(k)

    1 - no_match

end


ks = 1: 150
ps = [matching_bd(i) for i in ks]

plot(ks, ps, seriestype=:scatter)