# --- Code for Exercises ---

# Defining the base prime field
qs = [8431, 9173, 9419, 6947]
for q in qs:
    Fq = GF(q) 
    # Print roots of x^3+1
    p = x^3 - 1
    print(f'Roots for {q} are {p.roots(ring=Fq)}')

# --- Tower of extensions ---

# Defining the base prime field
q = Integer(5) # EC group order
Fq = GF(q) 

# Define the extension
K2.<x> = PolynomialRing(Fq)
Fq2.<i> = Fq.extension(x^2+2)

assert 2/i == (q-1)*i, 'nope'

for element in list(Fq2):
    if element != 0:
        _ = 1 / element # Will panic if some element is not invertible

K4.<y> = PolynomialRing(Fq2)
xi = i+1
Fq4.<j> = Fq2.extension(y^2 - xi)

for element in list(Fq4):
    if element != 0:
        _ = 1 / element # Will panic if some element is not invertible

print(f'Question 4 answer is {(i+3)/i}')
print(f'Question 5 answer is {j**4}')
print(f'Question 6 answer is {j**3+2*i**2*xi}')

# --- Elliptic Curves ---
# Define the elliptic curve
p = 11
Fp = GF(p)
E = EllipticCurve(Fp, [1, 6])

for point in E.points():
    print(f'Point {point} has order {point.order()}')
