using LinearAlgebra, DSP, Polynomials

function LagF(t, g, x)
    N = length(t)
    L = zeros(N, N)

    for i in 1:N
        p = [1]
        for j in 1:N
            if i != j
                p = conv(p, [-t[j], 1]) / (t[i] - t[j])
            end
        end
        L[i, :] = p * g[i]
    end

    apprx = sum(L, dims=1)  
    
    poly = Polynomial(apprx[1, :])  # Create a polynomial
    
    
    result = poly(x)  # Evaluate the polynomial at a specific point x
    
    return result
end