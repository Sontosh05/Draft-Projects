using LinearAlgebra, Polynomials

# Function for Linear Regression and then integrating
function LReg(t, g, a, b)

    X = [ones(length(t)) t] # Design matrix 
    coeffs = X \ g          # Regression coefficients

    # Define the linear regression model as a polynomial
    poly = Polynomial(coeffs) # reverse to match polynomial order

    intpoly = integrate(poly)
    
    apprx = (intpoly(b) - intpoly(a))
    
    return apprx
end