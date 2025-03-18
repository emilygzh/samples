import numpy as np

# convert from rectangular form (a + jb) to polar form (r, theta)
def rect_to_polar(a, b, degrees=False):
    r = np.sqrt(a**2 + b**2)
    theta = np.arctan2(b, a)  # radians
    if degrees:
        theta = np.degrees(theta)
    print(f"polar: magnitude = {r}, angle = {theta} {'degrees' if degrees else 'radians'}")
    return (r, theta)

# convert from polar form (r, theta) to complex rectangular form (a + jb)
def polar_to_rect(r, theta, degrees=False):
    if degrees:
        theta = np.radians(theta)
    a = r * np.cos(theta)
    b = r * np.sin(theta)
    print(f"rectangular: real = {a}, imaginary = {b}")
    return (a, b)


#arithmetic in polar form
def rect_add(a1, b1, a2, b2):
    result = complex(a1, b1) + complex(a2, b2)
    print(f"add result: {result.real} + j{result.imag}")
    return (result.real, result.imag)

def rect_subtract(a1, b1, a2, b2):
    result = complex(a1, b1) - complex(a2, b2)
    print(f"sub result: {result.real} + j{result.imag}")
    return (result.real, result.imag)

def rect_mult(a1, b1, a2, b2):
    result = complex(a1, b1) * complex(a2, b2)
    print(f"mult result: {result.real} + j{result.imag}")
    return (result.real, result.imag)

def rect_div(a1, b1, a2, b2):
    result = complex(a1, b1) / complex(a2, b2)
    print(f"div result: {result.real} + j{result.imag}")
    return (result.real, result.imag)


def phasor_multiply(r1, theta1, r2, theta2, degrees=False):
    r = r1 * r2 
    theta = theta1 + theta2 
    if degrees:
        theta %= 360
    else:
        theta %= (2 * np.pi)
    print(f"mult result: magnitude = {r}, angle = {theta} {'degrees' if degrees else 'radians'}")
    return (r, theta)


def phasor_divide(r1, theta1, r2, theta2, degrees=False):
    r = r1 / r2
    theta = theta1 - theta2 
    if degrees:
        theta %= 360
    else:
        theta %= (2 * np.pi)
    print(f"div result: magnitude = {r}, angle = {theta} {'degrees' if degrees else 'radians'}")
    return (r, theta)


