from utils import pad

# Part I: Multiplicative subgroup
p = 15 * (1<<27) + 1
Fp = GF(p)

# Find generator of Fp
g = Fp.multiplicative_generator()

# Let us see check 2^10 roots of unity
w = g**((p-1)>>10)
print(f'Order of selected subgroup is {w.multiplicative_order()}')

# Part II: NTT (FFT
# Let us define a polynomial
R.<x> = PolynomialRing(Fp)
# Generate random polynomials of degree N=1<<r
r = 4
N = 1<<r
P = R.random_element(N-1)
Q = R.random_element(N-1)

assert len(P.list()) == N and len(Q.list()) == N, f'Polynomials must have degree {N-1}, got {len(P.list())} and {len(Q.list())}'

print(f'Selected P={P}')
print(f'Selected Q={Q}')

# Compute product of polynomials as usual
PQ = P*Q
print(f'Got P*Q = {PQ}')
assert len(PQ.list()) == 2*N-1, f'Product must have degree {2*N-1}, got {len(PQ.list())}'

# Write NTT
def ntt(w: Fp, p: list[Fp]) -> list[Fp]:
    n = len(p)
    if n <= 1:
        return p

    assert w**n == 1, f"primitive root must be nth root of unity, where n is {n}"

    h = n//2 # Half-size of polynomial

    p_O = ntt(w**2, p[1::2]) # Odd polynomial
    p_E = ntt(w**2, p[::2]) # Even polynomial

    return [p_E[i%h] + (w**i)*p_O[i%h] for i in range(n)]

# Compute NTTS
w = g**((p-1) // (2*N))
print(P.list() + [0]*(1<<r))
p_ntt = ntt(w, pad(P, 2*N))
q_ntt = ntt(w, pad(Q, 2*N))

print('Now let us verify that NTTs are correct!')
print('NTT gives:', p_ntt)
print('Actual evaluations are:', [P(w**i) for i in range(2*N)])

# Now, inverse NTT
def intt(w: Fp, p: list[Fp]) -> list[Fp]:
    # Compute the regular FFT, but with conjugate of w
    _ntt = ntt(w.inverse(), p)
    n = len(p)
    return [Fp(1/n) * _ntt[i] for i in range(n)]

# Check that inverse NTT is correct
print('Now let us verify that inverse NTTs are correct!')
print('INTT of NTT(p) gives:', intt(w, p_ntt))
print('Actual polynomial is:', P)

# Now, let us compute product of polynomials using NTT
def ntt_product(w: Fp, p: list[Fp], q: list[Fp]) -> list[Fp]:
    p_ntt = ntt(w, p)
    q_ntt = ntt(w, q)
    return intt(w, [p_ntt[i]*q_ntt[i] for i in range(len(p_ntt))])

# Check that NTT product is correct
print('Now let us verify that NTT product is correct!')
print('NTT product gives:', ntt_product(w, pad(P, 2*N), pad(Q, 2*N)))
print('Actual product is:', P*Q)
