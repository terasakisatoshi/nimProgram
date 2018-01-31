using BenchmarkTools

function calc_pi_by_gcd(N)
    s = 0
    for a in 1:N
        for b in 1:N
            s += ifelse(gcd(a,b)==1, 1, 0)
        end
        s
    end
    println(sqrt(6N^2/s))
end

function main()
    @time calc_pi_by_gcd(10000)
end

main()