def pad(polynomial, size):
    polynomial = polynomial.list()
    assert size >= len(polynomial), f"polynomial must be padded to length {size}, got {len(polynomial)}"
    return polynomial + [0]*(size-len(polynomial))