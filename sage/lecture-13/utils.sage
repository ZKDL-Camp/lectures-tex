def pad(polynomial, n):
    polynomial = polynomial.list()
    assert n >= len(polynomial), f"polynomial must be padded to length {n}, got {len(polynomial)}"
    return polynomial + [0]*(n-len(polynomial))