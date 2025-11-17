"""
Package for auxiliary functions (such as debugging and printing)
"""

def print_transcript(transcript: dict):
    """
    Prints the contents of the Sum-Check transcript in a readable format.
    """
    
    print("\n" + "="*20 + " Proof Transcript " + "="*20)
    
    # Print the main polynomial and the claimed sum
    print(f"\nOriginal Polynomial (f):\n  {transcript['polynomial']}")
    print(f"\nClaimed Sum (H):\n  {transcript['claimed_sum']}")
    
    print("\n" + "-"*58)
    
    # Print each round's polynomial on a new line
    print("\nRound Polynomials (s_j):")
    polynomials = transcript.get('polynomials', [])
    if not polynomials:
        print("  None")
    else:
        for i, poly in enumerate(polynomials):
            # The protocol rounds are 1-indexed, so we use i+1
            print(f"  s_{i+1}(x) = {poly}")

    print("\n" + "-"*58)

    # Print each random value on a new line
    print("\nRandom Values from Fiat-Shamir (r_j):")
    random_values = transcript.get('random_values', [])
    if not random_values:
        print("  None")
    else:
        for i, r_val in enumerate(random_values):
            print(f"  r_{i+1} = {r_val}")
            
    print("\n" + "="*58 + "\n")