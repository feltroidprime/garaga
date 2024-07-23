use core::circuit::{u96, u384};
use garaga::basic_field_ops::{neg_mod_p};
use core::result::Result;

#[derive(Copy, Drop, Debug, PartialEq)]
struct G1Point {
    x: u384,
    y: u384,
}

trait G1PointTrait {
    fn is_on_curve(self: @G1Point, curve_index: usize) -> bool;
    fn is_infinity(self: @G1Point) -> bool;
    fn update_hash_state(
        self: @G1Point, s0: felt252, s1: felt252, s2: felt252
    ) -> (felt252, felt252, felt252);
}

#[derive(Copy, Drop, Debug, PartialEq)]
struct G2Point {
    x0: u384,
    x1: u384,
    y0: u384,
    y1: u384,
}

trait G2PointTrait {
    fn is_on_curve(self: @G2Point, curve_index: usize) -> bool;
}

#[derive(Copy, Drop, Debug, PartialEq)]
struct G1G2Pair {
    p: G1Point,
    q: G2Point,
}

#[derive(Copy, Drop, Debug, PartialEq)]
struct E12D {
    w0: u384,
    w1: u384,
    w2: u384,
    w3: u384,
    w4: u384,
    w5: u384,
    w6: u384,
    w7: u384,
    w8: u384,
    w9: u384,
    w10: u384,
    w11: u384,
}
#[derive(Copy, Drop, Debug, PartialEq)]
struct MillerLoopResultScalingFactor {
    w0: u384,
    w2: u384,
    w4: u384,
    w6: u384,
    w8: u384,
    w10: u384,
}
#[derive(Copy, Drop, Debug, PartialEq)]
struct E12DMulQuotient {
    w0: u384,
    w1: u384,
    w2: u384,
    w3: u384,
    w4: u384,
    w5: u384,
    w6: u384,
    w7: u384,
    w8: u384,
    w9: u384,
    w10: u384,
}

trait FieldDefinitions<F> {
    fn one() -> F;
    fn zero() -> F;
    fn conjugate(self: F, curve_index: usize) -> F;
}

impl E12DDefinitions of FieldDefinitions<E12D> {
    fn one() -> E12D {
        E12D {
            w0: u384 { limb0: 1, limb1: 0, limb2: 0, limb3: 0 },
            w1: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w2: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w3: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w4: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w5: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w6: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w7: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w8: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w9: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w10: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w11: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
        }
    }

    fn zero() -> E12D {
        E12D {
            w0: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w1: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w2: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w3: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w4: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w5: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w6: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w7: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w8: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w9: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w10: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
            w11: u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 },
        }
    }

    fn conjugate(self: E12D, curve_index: usize) -> E12D {
        let p = get_p(curve_index);
        E12D {
            w0: self.w0,
            w1: neg_mod_p(self.w1, p),
            w2: self.w2,
            w3: neg_mod_p(self.w3, p),
            w4: self.w4,
            w5: neg_mod_p(self.w5, p),
            w6: self.w6,
            w7: neg_mod_p(self.w7, p),
            w8: self.w8,
            w9: neg_mod_p(self.w9, p),
            w10: self.w10,
            w11: neg_mod_p(self.w11, p),
        }
    }
}


// From a G1G2Pair(Px, Py, Qx0, Qx1, Qy0, Qy1), returns (1/Py, -Px/Py)
#[derive(Drop, Debug, PartialEq)]
struct BLSProcessedPair {
    yInv: u384,
    xNegOverY: u384,
}


// From a G1G2Pair(Px, Py, Qx0, Qx1, Qy0, Qy1), returns (1/Py, -Px/Py,-Qy0, -Qy1)
#[derive(Drop, Debug, PartialEq)]
struct BNProcessedPair {
    yInv: u384,
    xNegOverY: u384,
    QyNeg0: u384,
    QyNeg1: u384,
}

// curve_index 0: BN254
// curve_index 1: BLS12_381
// curve_index 2: SECP256K1
// curve_index 3: SECP256R1
// curve_index 4: X25519

struct Curve {
    p: u384, // Prime modulus
    n: u384, // Order of the curve
    a: u384, // Weierstrass a parameter in eqn: y^2 = x^3 + ax + b
    b: u384, // Weierstrass b parameter in eqn: y^2 = x^3 + ax + b
    g: u384, // Generator of Fp. (Used to verify square roots)
    min_one: u384, // (-1) % p
}


// Returns the prime modulus for a given curve index
fn get_p(curve_index: usize) -> u384 {
    if curve_index == 0 {
        return BN254.p;
    }
    if curve_index == 1 {
        return BLS12_381.p;
    }
    if curve_index == 2 {
        return SECP256K1.p;
    }
    if curve_index == 3 {
        return SECP256R1.p;
    }
    if curve_index == 4 {
        return X25519.p;
    }
    return u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 };
}

// Returns the Weierstrass 'a' parameter for a given curve index
fn get_a(curve_index: usize) -> u384 {
    if curve_index == 0 {
        return BN254.a;
    }
    if curve_index == 1 {
        return BLS12_381.a;
    }
    if curve_index == 2 {
        return SECP256K1.a;
    }
    if curve_index == 3 {
        return SECP256R1.a;
    }
    if curve_index == 4 {
        return X25519.a;
    }
    return u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 };
}

// Returns the Weierstrass 'b' parameter for a given curve index
fn get_b(curve_index: usize) -> u384 {
    if curve_index == 0 {
        return BN254.b;
    }
    if curve_index == 1 {
        return BLS12_381.b;
    }
    if curve_index == 2 {
        return SECP256K1.b;
    }
    if curve_index == 3 {
        return SECP256R1.b;
    }
    if curve_index == 4 {
        return X25519.b;
    }
    return u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 };
}

fn get_b2(curve_index: usize) -> Result<(u384, u384), felt252> {
    if curve_index == 0 {
        return Result::Ok(
            (
                u384 {
                    limb0: 27810052284636130223308486885,
                    limb1: 40153378333836448380344387045,
                    limb2: 3104278944836790958,
                    limb3: 0
                },
                u384 {
                    limb0: 70926583776874220189091304914,
                    limb1: 63498449372070794915149226116,
                    limb2: 42524369107353300,
                    limb3: 0
                }
            )
        );
    }
    if curve_index == 1 {
        return Result::Ok(
            (
                u384 { limb0: 4, limb1: 0, limb2: 0, limb3: 0 },
                u384 { limb0: 4, limb1: 0, limb2: 0, limb3: 0 }
            )
        );
    } else {
        return Result::Err('Invalid curve index');
    }
}

// Returns a generator of the curve base field for a given curve index
fn get_g(curve_index: usize) -> u384 {
    if curve_index == 0 {
        return BN254.g;
    }
    if curve_index == 1 {
        return BLS12_381.g;
    }
    if curve_index == 2 {
        return SECP256K1.g;
    }
    if curve_index == 3 {
        return SECP256R1.g;
    }
    if curve_index == 4 {
        return X25519.g;
    }
    return u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 };
}

// Returns (-1) % p for a given curve index
fn get_min_one(curve_index: usize) -> u384 {
    if curve_index == 0 {
        return BN254.min_one;
    }
    if curve_index == 1 {
        return BLS12_381.min_one;
    }
    if curve_index == 2 {
        return SECP256K1.min_one;
    }
    if curve_index == 3 {
        return SECP256R1.min_one;
    }
    if curve_index == 4 {
        return X25519.min_one;
    }
    return u384 { limb0: 0, limb1: 0, limb2: 0, limb3: 0 };
}

const BN254: Curve =
    Curve {
        p: u384 {
            limb0: 0x6871ca8d3c208c16d87cfd47,
            limb1: 0xb85045b68181585d97816a91,
            limb2: 0x30644e72e131a029,
            limb3: 0x0
        },
        n: u384 {
            limb0: 0x79b9709143e1f593f0000001,
            limb1: 0xb85045b68181585d2833e848,
            limb2: 0x30644e72e131a029,
            limb3: 0x0
        },
        a: u384 { limb0: 0x0, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        b: u384 { limb0: 0x3, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        g: u384 { limb0: 0x3, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        min_one: u384 {
            limb0: 0x6871ca8d3c208c16d87cfd46,
            limb1: 0xb85045b68181585d97816a91,
            limb2: 0x30644e72e131a029,
            limb3: 0x0
        },
    };

const BLS12_381: Curve =
    Curve {
        p: u384 {
            limb0: 0xb153ffffb9feffffffffaaab,
            limb1: 0x6730d2a0f6b0f6241eabfffe,
            limb2: 0x434bacd764774b84f38512bf,
            limb3: 0x1a0111ea397fe69a4b1ba7b6
        },
        n: u384 {
            limb0: 0xfffe5bfeffffffff00000001,
            limb1: 0x3339d80809a1d80553bda402,
            limb2: 0x73eda753299d7d48,
            limb3: 0x0
        },
        a: u384 { limb0: 0x0, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        b: u384 { limb0: 0x4, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        g: u384 { limb0: 0x3, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        min_one: u384 {
            limb0: 0xb153ffffb9feffffffffaaaa,
            limb1: 0x6730d2a0f6b0f6241eabfffe,
            limb2: 0x434bacd764774b84f38512bf,
            limb3: 0x1a0111ea397fe69a4b1ba7b6
        },
    };

const SECP256K1: Curve =
    Curve {
        p: u384 {
            limb0: 0xfffffffffffffffefffffc2f,
            limb1: 0xffffffffffffffffffffffff,
            limb2: 0xffffffffffffffff,
            limb3: 0x0
        },
        n: u384 {
            limb0: 0xaf48a03bbfd25e8cd0364141,
            limb1: 0xfffffffffffffffebaaedce6,
            limb2: 0xffffffffffffffff,
            limb3: 0x0
        },
        a: u384 { limb0: 0x0, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        b: u384 { limb0: 0x7, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        g: u384 { limb0: 0x3, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        min_one: u384 {
            limb0: 0xfffffffffffffffefffffc2e,
            limb1: 0xffffffffffffffffffffffff,
            limb2: 0xffffffffffffffff,
            limb3: 0x0
        },
    };

const SECP256R1: Curve =
    Curve {
        p: u384 {
            limb0: 0xffffffffffffffffffffffff, limb1: 0x0, limb2: 0xffffffff00000001, limb3: 0x0
        },
        n: u384 {
            limb0: 0xa7179e84f3b9cac2fc632551,
            limb1: 0xffffffffffffffffbce6faad,
            limb2: 0xffffffff00000000,
            limb3: 0x0
        },
        a: u384 {
            limb0: 0xfffffffffffffffffffffffc, limb1: 0x0, limb2: 0xffffffff00000001, limb3: 0x0
        },
        b: u384 {
            limb0: 0xcc53b0f63bce3c3e27d2604b,
            limb1: 0xb3ebbd55769886bc651d06b0,
            limb2: 0x5ac635d8aa3a93e7,
            limb3: 0x0
        },
        g: u384 { limb0: 0x6, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        min_one: u384 {
            limb0: 0xfffffffffffffffffffffffe, limb1: 0x0, limb2: 0xffffffff00000001, limb3: 0x0
        },
    };

const X25519: Curve =
    Curve {
        p: u384 {
            limb0: 0xffffffffffffffffffffffed,
            limb1: 0xffffffffffffffffffffffff,
            limb2: 0x7fffffffffffffff,
            limb3: 0x0
        },
        n: u384 {
            limb0: 0xa2f79cd65812631a5cf5d3ed,
            limb1: 0x14def9de,
            limb2: 0x1000000000000000,
            limb3: 0x0
        },
        a: u384 {
            limb0: 0xaaaaaaaaaaaaaa984914a144,
            limb1: 0xaaaaaaaaaaaaaaaaaaaaaaaa,
            limb2: 0x2aaaaaaaaaaaaaaa,
            limb3: 0x0
        },
        b: u384 {
            limb0: 0x5ed097b4260b5e9c7710c864,
            limb1: 0x97b425ed097b425ed097b42,
            limb2: 0x7b425ed097b425ed,
            limb3: 0x0
        },
        g: u384 { limb0: 0x6, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
        min_one: u384 {
            limb0: 0xffffffffffffffffffffffec,
            limb1: 0xffffffffffffffffffffffff,
            limb2: 0x7fffffffffffffff,
            limb3: 0x0
        },
    };

// NAF(6 * 0x44E992B44A6909F1 + 2)[2:] with consecutive zeros replaced by 3, and -1 replaced by 2
const bn_bits: [
    felt252
    ; 50] = [
    2,
    0,
    1,
    3,
    0,
    2,
    0,
    2,
    3,
    0,
    2,
    0,
    1,
    0,
    2,
    3,
    2,
    3,
    3,
    0,
    1,
    3,
    2,
    0,
    1,
    3,
    2,
    3,
    3,
    2,
    0,
    1,
    3,
    0,
    2,
    0,
    2,
    3,
    1,
    3,
    0,
    2,
    3,
    2,
    0,
    1,
    0,
    1,
    3,
    0
];

// [int(x) for x in bin(0xD201000000010000)[2:]][2:] with two-consecutive zeros replaced by 3
const bls_bits: [
    felt252
    ; 34] = [
    0,
    1,
    3,
    1,
    3,
    3,
    3,
    3,
    1,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    0,
    1,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3
];
