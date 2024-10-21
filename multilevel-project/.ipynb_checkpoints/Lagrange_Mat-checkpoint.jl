function Lagrange_Mat(t, g, a, b)
    N = length(t)
    M = size(g, 1)  # Number of spatial points
    dt = b - a
    s = (t .- a) / dt
    pval = zeros(M)
    
    for i in 1:N
        p = [1.0]  # Start with polynomial p = 1
        for j in 1:N
            if i != j
                p = conv(p, [-s[j], 1]) / (s[i] - s[j])
            end
        end
        cpoly = Polynomial(p)
        intcpoly = integrate(cpoly)
        
        # Vectorized scalar product for each component
        pval += g[:, i] * (intcpoly(1) - intcpoly(0))
    end
    
    return dt * pval
end