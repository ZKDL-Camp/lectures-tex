from typing import List, Tuple

q = 2^(31) - 1
Fq = GF(q)

P.<x> = PolynomialRing(Fq)

def generate(n: int, k: int) -> List[[Fq, int]]:
    """
    Generate a Shamir secret sharing scheme with n shares and k threshold.
    """

    # Generate a random polynomial
    f = P.random_element(degree=k-1)
    
    # Generate a secret
    secret = Fq.random_element()
    print(f'Chosen secret: {secret}')

    # Set the constant term as the secret
    f = P([secret] + [f[i] for i in range(1, k)])
    print(f'Polynomial: {f}')
    
    # Return shares
    return [(Fq(i), f(i)) for i in range(1, n+1)]

shares = generate(5, 3)

def reconstruct(shares: List[Tuple[int, Fq]], threshold: int) -> Fq:
    """
    Reconstruct the secret from the shares using Lagrange interpolation.
    """
    
    assert len(shares) >= threshold, f"Not enough shares to reconstruct the secret, got {len(shares)}"

    reconstructed_polynomial = P.lagrange_polynomial(shares)
    print(f'Reconstructed polynomial: {reconstructed_polynomial}')

    # The secret is the constant term of the polynomial
    return reconstructed_polynomial(0)

recovered_secret = reconstruct(shares[1:4], 3)
print(f'Recovered secret: {recovered_secret}')