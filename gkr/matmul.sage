"""
Implementation of the sumcheck protocol for matrix multiplication
"""

from sumcheck import (
    SumCheckProtocol, 
    boolean_hypercube_sum, 
    print_transcript
)
from utils import print_transcript

# Defining the finite field GF(p) where p is a large prime
p = 11
Fp = GF(p)

# Assume for simplicity that matrices are of size 2^v x 2^v
v = 2 # Matrix of size 16x16
n = 1<<v

# Defining how MLE are computed
variable_names = [f'x{i}' for i in range(2*v)]
R = PolynomialRing(Fp, names=variable_names)
variables = R.gens()


def mle_from_hypercube(hypercube: list) -> R:
    """
    Computes the Multivariate Linear Extension (MLE) of a hypercube.
    The hypercube is represented as a list of tuples, where each tuple
    contains the coordinates of a point in the hypercube.

    Args:
        hypercube (list): A list of tuples representing points in the hypercube.
                           Each tuple should have length equal to the dimension dim.
    """

    # Create a polynomial for each point in the hypercube
    mle = R.zero()
    for point, value in hypercube:
        eq_poly = R(1)
        for i, bit in enumerate(point):
            eq_poly *= bit*variables[i] + (1-bit)*(1-variables[i])

        mle += eq_poly * value
    
    return mle


def mle_from_matrix(matrix: Matrix) -> R:
    """
    Computes the Multivariate Linear Extension (MLE) of a matrix.
    The MLE is a polynomial that represents the matrix entries as variables.
    """
    
    assert matrix.nrows() == matrix.ncols(), "Matrix must be square."
    assert matrix.nrows() == n, "Matrix size must 1<<v"

    # Range over all indices, bit-decompose them, and build the mle
    hypercube = []
    for i in range(n):
        for j in range(n):
            # Convert i and j to binary representation of length v
            point = [(i >> k) & 1 for k in range(v)] + [(j >> k) & 1 for k in range(v)]
            hypercube.append((tuple(point), matrix[i, j]))

    return mle_from_hypercube(hypercube)


if __name__ == "__main__":
    print('Matrix multiplication SumCheck Protocol')
    # Generate two random matrices A and B over the finite field GF(p)
    A = Matrix(Fp, n, n, [Fp.random_element() for _ in range(n*n)])
    B = Matrix(Fp, n, n, [Fp.random_element() for _ in range(n*n)])

    # Find the product matrix C=A*B
    C = A * B
    print(f'Matrix A:\n{A}')
    print(f'Matrix B:\n{B}')
    print(f'Matrix C:\n{C}')

    # Find MLE (Multivariate Linear Extension) of each of the matrices
    A_mle = mle_from_matrix(A)
    B_mle = mle_from_matrix(B)
    C_mle = mle_from_matrix(C)
    print(f'MLE of A:\n{A_mle}')
    print(f'MLE of B:\n{B_mle}')
    print(f'MLE of C:\n{C_mle}')

    # Now, we are going to apply the sumcheck protocol. First, 
    # sample two random vectors r1 and r2 of size v = log(n)
    r1 = [Fp.random_element() for _ in range(v)]
    r2 = [Fp.random_element() for _ in range(v)]

    # If g(z) := f_A(r_1,z)f_B(z,r_2) is summed over the hypercube,
    # it equals to the claimed sum f_C(r_1,r_2). That is our 
    # sumcheck claim.
    # Below some technicalities to define g:
    claimed_sum = C_mle(*(r1 + r2))
    g = A_mle.subs({
        variables[i]: r1[i] for i in range(v)
    }).subs({
        variables[v+i]: variables[i] for i in range(v)
    }) * B_mle.subs({
        variables[i+v]: r2[i] for i in range(v)
    })
    variable_names = [f'x{i}' for i in range(v)]
    
    # Defining a smaller polynomial ring for the protocol (since g 
    # is polynomial in v variables)
    Q = PolynomialRing(Fp, names=variable_names)
    variables = Q.gens()
    g = Q(g)

    # Printing the random vectors and the claimed sum
    print(f'Random vectors r1: {r1}, r2: {r2}')
    print(f'Claimed sum: {claimed_sum}')
    print(f'Computed g: {g}')

    protocol = SumCheckProtocol(Fp, Q, g, claimed_sum, degree=v)
    transcript = protocol.prove()
    print_transcript(transcript)
    verification_result = protocol.verify(transcript)
    print(f'Verification result: {verification_result}')
