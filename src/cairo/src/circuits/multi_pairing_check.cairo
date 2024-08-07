use core::circuit::{
    RangeCheck96, AddMod, MulMod, u384, u96, CircuitElement, CircuitInput, circuit_add, circuit_sub,
    circuit_mul, circuit_inverse, EvalCircuitResult, EvalCircuitTrait, CircuitOutputsTrait,
    CircuitModulus, AddInputResultTrait, CircuitInputs, CircuitDefinition, CircuitData,
    CircuitInputAccumulator
};
use core::circuit::CircuitElement as CE;
use core::circuit::CircuitInput as CI;
use garaga::definitions::{
    get_a, get_b, get_p, get_g, get_min_one, G1Point, G2Point, E12D, E12DMulQuotient, G1G2Pair,
    BNProcessedPair, BLSProcessedPair, MillerLoopResultScalingFactor, G2Line
};
use garaga::ec_ops::{SlopeInterceptOutput, FunctionFeltEvaluations, FunctionFelt};
use core::option::Option;

fn run_BLS12_381_MP_CHECK_BIT00_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    G2_line_2nd_0_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    G2_line_2nd_0_1: G2Line,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    z: u384,
    ci: u384
) -> (u384, u384, u384) {
    // INPUT stack
    let (in0, in1, in2) = (CE::<CI<0>> {}, CE::<CI<1>> {}, CE::<CI<2>> {});
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let (in27, in28, in29) = (CE::<CI<27>> {}, CE::<CI<28>> {}, CE::<CI<29>> {});
    let (in30, in31, in32) = (CE::<CI<30>> {}, CE::<CI<31>> {}, CE::<CI<32>> {});
    let (in33, in34, in35) = (CE::<CI<33>> {}, CE::<CI<34>> {}, CE::<CI<35>> {});
    let t0 = circuit_mul(in34, in34); // Compute z^2
    let t1 = circuit_mul(t0, in34); // Compute z^3
    let t2 = circuit_mul(t1, in34); // Compute z^4
    let t3 = circuit_mul(t2, in34); // Compute z^5
    let t4 = circuit_mul(t3, in34); // Compute z^6
    let t5 = circuit_mul(t4, in34); // Compute z^7
    let t6 = circuit_mul(t5, in34); // Compute z^8
    let t7 = circuit_mul(t6, in34); // Compute z^9
    let t8 = circuit_mul(t7, in34); // Compute z^10
    let t9 = circuit_mul(t8, in34); // Compute z^11
    let t10 = circuit_mul(in35, in35); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in21, in21); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_sub(in4, in5);
    let t13 = circuit_mul(t12, in0); // eval bls line by yInv
    let t14 = circuit_sub(in2, in3);
    let t15 = circuit_mul(t14, in1); // eval blsline by xNegOverY
    let t16 = circuit_mul(in5, in0); // eval bls line by yInv
    let t17 = circuit_mul(in3, in1); // eval bls line by xNegOverY
    let t18 = circuit_mul(t15, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t19 = circuit_add(t13, t18); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t20 = circuit_add(t19, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t21 = circuit_mul(t16, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t22 = circuit_add(t20, t21); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t23 = circuit_mul(t17, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t24 = circuit_add(t22, t23); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t25 = circuit_mul(t11, t24); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t26 = circuit_sub(in8, in9);
    let t27 = circuit_mul(t26, in10); // eval bls line by yInv
    let t28 = circuit_sub(in6, in7);
    let t29 = circuit_mul(t28, in11); // eval blsline by xNegOverY
    let t30 = circuit_mul(in9, in10); // eval bls line by yInv
    let t31 = circuit_mul(in7, in11); // eval bls line by xNegOverY
    let t32 = circuit_mul(t29, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t33 = circuit_add(t27, t32); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t34 = circuit_add(t33, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t35 = circuit_mul(t30, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t36 = circuit_add(t34, t35); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t37 = circuit_mul(t31, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t38 = circuit_add(t36, t37); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t39 = circuit_mul(t25, t38); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t40 = circuit_mul(
        t39, t39
    ); // Compute (f^2 * Π(i,k) (line_i,k(z))) ^ 2 = f^4 * (Π(i,k) (line_i,k(z)))^2
    let t41 = circuit_sub(in14, in15);
    let t42 = circuit_mul(t41, in0); // eval bls line by yInv
    let t43 = circuit_sub(in12, in13);
    let t44 = circuit_mul(t43, in1); // eval blsline by xNegOverY
    let t45 = circuit_mul(in15, in0); // eval bls line by yInv
    let t46 = circuit_mul(in13, in1); // eval bls line by xNegOverY
    let t47 = circuit_mul(t44, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t48 = circuit_add(t42, t47); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t49 = circuit_add(t48, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t50 = circuit_mul(t45, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t51 = circuit_add(t49, t50); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t52 = circuit_mul(t46, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t53 = circuit_add(t51, t52); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t54 = circuit_mul(t40, t53); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t55 = circuit_sub(in18, in19);
    let t56 = circuit_mul(t55, in10); // eval bls line by yInv
    let t57 = circuit_sub(in16, in17);
    let t58 = circuit_mul(t57, in11); // eval blsline by xNegOverY
    let t59 = circuit_mul(in19, in10); // eval bls line by yInv
    let t60 = circuit_mul(in17, in11); // eval bls line by xNegOverY
    let t61 = circuit_mul(t58, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t62 = circuit_add(t56, t61); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t63 = circuit_add(t62, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t64 = circuit_mul(t59, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t65 = circuit_add(t63, t64); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t66 = circuit_mul(t60, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t67 = circuit_add(t65, t66); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t68 = circuit_mul(t54, t67); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t69 = circuit_mul(in23, in34); // Eval f_i+1 step coeff_1 * z^1
    let t70 = circuit_add(in22, t69); // Eval f_i+1 step + (coeff_1 * z^1)
    let t71 = circuit_mul(in24, t0); // Eval f_i+1 step coeff_2 * z^2
    let t72 = circuit_add(t70, t71); // Eval f_i+1 step + (coeff_2 * z^2)
    let t73 = circuit_mul(in25, t1); // Eval f_i+1 step coeff_3 * z^3
    let t74 = circuit_add(t72, t73); // Eval f_i+1 step + (coeff_3 * z^3)
    let t75 = circuit_mul(in26, t2); // Eval f_i+1 step coeff_4 * z^4
    let t76 = circuit_add(t74, t75); // Eval f_i+1 step + (coeff_4 * z^4)
    let t77 = circuit_mul(in27, t3); // Eval f_i+1 step coeff_5 * z^5
    let t78 = circuit_add(t76, t77); // Eval f_i+1 step + (coeff_5 * z^5)
    let t79 = circuit_mul(in28, t4); // Eval f_i+1 step coeff_6 * z^6
    let t80 = circuit_add(t78, t79); // Eval f_i+1 step + (coeff_6 * z^6)
    let t81 = circuit_mul(in29, t5); // Eval f_i+1 step coeff_7 * z^7
    let t82 = circuit_add(t80, t81); // Eval f_i+1 step + (coeff_7 * z^7)
    let t83 = circuit_mul(in30, t6); // Eval f_i+1 step coeff_8 * z^8
    let t84 = circuit_add(t82, t83); // Eval f_i+1 step + (coeff_8 * z^8)
    let t85 = circuit_mul(in31, t7); // Eval f_i+1 step coeff_9 * z^9
    let t86 = circuit_add(t84, t85); // Eval f_i+1 step + (coeff_9 * z^9)
    let t87 = circuit_mul(in32, t8); // Eval f_i+1 step coeff_10 * z^10
    let t88 = circuit_add(t86, t87); // Eval f_i+1 step + (coeff_10 * z^10)
    let t89 = circuit_mul(in33, t9); // Eval f_i+1 step coeff_11 * z^11
    let t90 = circuit_add(t88, t89); // Eval f_i+1 step + (coeff_11 * z^11)
    let t91 = circuit_sub(t68, t90); // (Π(i,k) (Pk(z))) - Ri(z)
    let t92 = circuit_mul(t10, t91); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t93 = circuit_add(in20, t92); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t90, t93, t10,).new_inputs();
    // Prefill constants:

    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in0
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in1
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in2
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in5
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r0a0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r0a1); // in7
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r1a0); // in8
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r1a1); // in9
    circuit_inputs = circuit_inputs.next(yInv_1); // in10
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in11
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in15
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r0a0); // in16
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r0a1); // in17
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r1a0); // in18
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r1a1); // in19
    circuit_inputs = circuit_inputs.next(lhs_i); // in20
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in21
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in22
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in23
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in24
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in25
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in26
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in27
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in28
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in29
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in30
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in31
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in33
    circuit_inputs = circuit_inputs.next(z); // in34
    circuit_inputs = circuit_inputs.next(ci); // in35

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t90);
    let lhs_i_plus_one: u384 = outputs.get_output(t93);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BLS12_381_MP_CHECK_BIT00_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    G2_line_2nd_0_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    G2_line_2nd_0_1: G2Line,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    z: u384,
    ci: u384
) -> (G2Point, u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x3
    let in1 = CE::<CI<1>> {}; // 0x6
    let in2 = CE::<CI<2>> {}; // 0x0

    // INPUT stack
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let (in27, in28, in29) = (CE::<CI<27>> {}, CE::<CI<28>> {}, CE::<CI<29>> {});
    let (in30, in31, in32) = (CE::<CI<30>> {}, CE::<CI<31>> {}, CE::<CI<32>> {});
    let (in33, in34, in35) = (CE::<CI<33>> {}, CE::<CI<34>> {}, CE::<CI<35>> {});
    let (in36, in37, in38) = (CE::<CI<36>> {}, CE::<CI<37>> {}, CE::<CI<38>> {});
    let (in39, in40, in41) = (CE::<CI<39>> {}, CE::<CI<40>> {}, CE::<CI<41>> {});
    let (in42, in43, in44) = (CE::<CI<42>> {}, CE::<CI<43>> {}, CE::<CI<44>> {});
    let t0 = circuit_mul(in43, in43); // Compute z^2
    let t1 = circuit_mul(t0, in43); // Compute z^3
    let t2 = circuit_mul(t1, in43); // Compute z^4
    let t3 = circuit_mul(t2, in43); // Compute z^5
    let t4 = circuit_mul(t3, in43); // Compute z^6
    let t5 = circuit_mul(t4, in43); // Compute z^7
    let t6 = circuit_mul(t5, in43); // Compute z^8
    let t7 = circuit_mul(t6, in43); // Compute z^9
    let t8 = circuit_mul(t7, in43); // Compute z^10
    let t9 = circuit_mul(t8, in43); // Compute z^11
    let t10 = circuit_mul(in44, in44); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in30, in30); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_sub(in7, in8);
    let t13 = circuit_mul(t12, in3); // eval bls line by yInv
    let t14 = circuit_sub(in5, in6);
    let t15 = circuit_mul(t14, in4); // eval blsline by xNegOverY
    let t16 = circuit_mul(in8, in3); // eval bls line by yInv
    let t17 = circuit_mul(in6, in4); // eval bls line by xNegOverY
    let t18 = circuit_mul(t15, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t19 = circuit_add(t13, t18); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t20 = circuit_add(t19, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t21 = circuit_mul(t16, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t22 = circuit_add(t20, t21); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t23 = circuit_mul(t17, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t24 = circuit_add(t22, t23); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t25 = circuit_mul(t11, t24); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t26 = circuit_sub(in11, in12);
    let t27 = circuit_mul(t26, in13); // eval bls line by yInv
    let t28 = circuit_sub(in9, in10);
    let t29 = circuit_mul(t28, in14); // eval blsline by xNegOverY
    let t30 = circuit_mul(in12, in13); // eval bls line by yInv
    let t31 = circuit_mul(in10, in14); // eval bls line by xNegOverY
    let t32 = circuit_mul(t29, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t33 = circuit_add(t27, t32); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t34 = circuit_add(t33, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t35 = circuit_mul(t30, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t36 = circuit_add(t34, t35); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t37 = circuit_mul(t31, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t38 = circuit_add(t36, t37); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t39 = circuit_mul(t25, t38); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t40 = circuit_add(in25, in26); // Doubling slope numerator start
    let t41 = circuit_sub(in25, in26);
    let t42 = circuit_mul(t40, t41);
    let t43 = circuit_mul(in25, in26);
    let t44 = circuit_mul(t42, in0);
    let t45 = circuit_mul(t43, in1); // Doubling slope numerator end
    let t46 = circuit_add(in27, in27); // Fp2 add coeff 0/1
    let t47 = circuit_add(in28, in28); // Fp2 add coeff 1/1
    let t48 = circuit_mul(t46, t46); // Fp2 Div x/y start : Fp2 Inv y start
    let t49 = circuit_mul(t47, t47);
    let t50 = circuit_add(t48, t49);
    let t51 = circuit_inverse(t50);
    let t52 = circuit_mul(t46, t51); // Fp2 Inv y real part end
    let t53 = circuit_mul(t47, t51);
    let t54 = circuit_sub(in2, t53); // Fp2 Inv y imag part end
    let t55 = circuit_mul(t44, t52); // Fp2 mul start
    let t56 = circuit_mul(t45, t54);
    let t57 = circuit_sub(t55, t56); // Fp2 mul real part end
    let t58 = circuit_mul(t44, t54);
    let t59 = circuit_mul(t45, t52);
    let t60 = circuit_add(t58, t59); // Fp2 mul imag part end
    let t61 = circuit_add(t57, t60);
    let t62 = circuit_sub(t57, t60);
    let t63 = circuit_mul(t61, t62);
    let t64 = circuit_mul(t57, t60);
    let t65 = circuit_add(t64, t64);
    let t66 = circuit_add(in25, in25); // Fp2 add coeff 0/1
    let t67 = circuit_add(in26, in26); // Fp2 add coeff 1/1
    let t68 = circuit_sub(t63, t66); // Fp2 sub coeff 0/1
    let t69 = circuit_sub(t65, t67); // Fp2 sub coeff 1/1
    let t70 = circuit_sub(in25, t68); // Fp2 sub coeff 0/1
    let t71 = circuit_sub(in26, t69); // Fp2 sub coeff 1/1
    let t72 = circuit_mul(t57, t70); // Fp2 mul start
    let t73 = circuit_mul(t60, t71);
    let t74 = circuit_sub(t72, t73); // Fp2 mul real part end
    let t75 = circuit_mul(t57, t71);
    let t76 = circuit_mul(t60, t70);
    let t77 = circuit_add(t75, t76); // Fp2 mul imag part end
    let t78 = circuit_sub(t74, in27); // Fp2 sub coeff 0/1
    let t79 = circuit_sub(t77, in28); // Fp2 sub coeff 1/1
    let t80 = circuit_mul(t57, in25); // Fp2 mul start
    let t81 = circuit_mul(t60, in26);
    let t82 = circuit_sub(t80, t81); // Fp2 mul real part end
    let t83 = circuit_mul(t57, in26);
    let t84 = circuit_mul(t60, in25);
    let t85 = circuit_add(t83, t84); // Fp2 mul imag part end
    let t86 = circuit_sub(t82, in27); // Fp2 sub coeff 0/1
    let t87 = circuit_sub(t85, in28); // Fp2 sub coeff 1/1
    let t88 = circuit_sub(t86, t87);
    let t89 = circuit_mul(t88, in23); // eval bls line by yInv
    let t90 = circuit_sub(t57, t60);
    let t91 = circuit_mul(t90, in24); // eval blsline by xNegOverY
    let t92 = circuit_mul(t87, in23); // eval bls line by yInv
    let t93 = circuit_mul(t60, in24); // eval bls line by xNegOverY
    let t94 = circuit_mul(t91, t0); // Eval sparse poly line_2p_1 step coeff_2 * z^2
    let t95 = circuit_add(t89, t94); // Eval sparse poly line_2p_1 step + coeff_2 * z^2
    let t96 = circuit_add(t95, t1); // Eval sparse poly line_2p_1 step + 1*z^3
    let t97 = circuit_mul(t92, t4); // Eval sparse poly line_2p_1 step coeff_6 * z^6
    let t98 = circuit_add(t96, t97); // Eval sparse poly line_2p_1 step + coeff_6 * z^6
    let t99 = circuit_mul(t93, t6); // Eval sparse poly line_2p_1 step coeff_8 * z^8
    let t100 = circuit_add(t98, t99); // Eval sparse poly line_2p_1 step + coeff_8 * z^8
    let t101 = circuit_mul(t39, t100); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t102 = circuit_mul(
        t101, t101
    ); // Compute (f^2 * Π(i,k) (line_i,k(z))) ^ 2 = f^4 * (Π(i,k) (line_i,k(z)))^2
    let t103 = circuit_sub(in17, in18);
    let t104 = circuit_mul(t103, in3); // eval bls line by yInv
    let t105 = circuit_sub(in15, in16);
    let t106 = circuit_mul(t105, in4); // eval blsline by xNegOverY
    let t107 = circuit_mul(in18, in3); // eval bls line by yInv
    let t108 = circuit_mul(in16, in4); // eval bls line by xNegOverY
    let t109 = circuit_mul(t106, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t110 = circuit_add(t104, t109); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t111 = circuit_add(t110, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t112 = circuit_mul(t107, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t113 = circuit_add(t111, t112); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t114 = circuit_mul(t108, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t115 = circuit_add(t113, t114); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t116 = circuit_mul(t102, t115); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t117 = circuit_sub(in21, in22);
    let t118 = circuit_mul(t117, in13); // eval bls line by yInv
    let t119 = circuit_sub(in19, in20);
    let t120 = circuit_mul(t119, in14); // eval blsline by xNegOverY
    let t121 = circuit_mul(in22, in13); // eval bls line by yInv
    let t122 = circuit_mul(in20, in14); // eval bls line by xNegOverY
    let t123 = circuit_mul(t120, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t124 = circuit_add(t118, t123); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t125 = circuit_add(t124, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t126 = circuit_mul(t121, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t127 = circuit_add(t125, t126); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t128 = circuit_mul(t122, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t129 = circuit_add(t127, t128); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t130 = circuit_mul(t116, t129); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t131 = circuit_add(t68, t69); // Doubling slope numerator start
    let t132 = circuit_sub(t68, t69);
    let t133 = circuit_mul(t131, t132);
    let t134 = circuit_mul(t68, t69);
    let t135 = circuit_mul(t133, in0);
    let t136 = circuit_mul(t134, in1); // Doubling slope numerator end
    let t137 = circuit_add(t78, t78); // Fp2 add coeff 0/1
    let t138 = circuit_add(t79, t79); // Fp2 add coeff 1/1
    let t139 = circuit_mul(t137, t137); // Fp2 Div x/y start : Fp2 Inv y start
    let t140 = circuit_mul(t138, t138);
    let t141 = circuit_add(t139, t140);
    let t142 = circuit_inverse(t141);
    let t143 = circuit_mul(t137, t142); // Fp2 Inv y real part end
    let t144 = circuit_mul(t138, t142);
    let t145 = circuit_sub(in2, t144); // Fp2 Inv y imag part end
    let t146 = circuit_mul(t135, t143); // Fp2 mul start
    let t147 = circuit_mul(t136, t145);
    let t148 = circuit_sub(t146, t147); // Fp2 mul real part end
    let t149 = circuit_mul(t135, t145);
    let t150 = circuit_mul(t136, t143);
    let t151 = circuit_add(t149, t150); // Fp2 mul imag part end
    let t152 = circuit_add(t148, t151);
    let t153 = circuit_sub(t148, t151);
    let t154 = circuit_mul(t152, t153);
    let t155 = circuit_mul(t148, t151);
    let t156 = circuit_add(t155, t155);
    let t157 = circuit_add(t68, t68); // Fp2 add coeff 0/1
    let t158 = circuit_add(t69, t69); // Fp2 add coeff 1/1
    let t159 = circuit_sub(t154, t157); // Fp2 sub coeff 0/1
    let t160 = circuit_sub(t156, t158); // Fp2 sub coeff 1/1
    let t161 = circuit_sub(t68, t159); // Fp2 sub coeff 0/1
    let t162 = circuit_sub(t69, t160); // Fp2 sub coeff 1/1
    let t163 = circuit_mul(t148, t161); // Fp2 mul start
    let t164 = circuit_mul(t151, t162);
    let t165 = circuit_sub(t163, t164); // Fp2 mul real part end
    let t166 = circuit_mul(t148, t162);
    let t167 = circuit_mul(t151, t161);
    let t168 = circuit_add(t166, t167); // Fp2 mul imag part end
    let t169 = circuit_sub(t165, t78); // Fp2 sub coeff 0/1
    let t170 = circuit_sub(t168, t79); // Fp2 sub coeff 1/1
    let t171 = circuit_mul(t148, t68); // Fp2 mul start
    let t172 = circuit_mul(t151, t69);
    let t173 = circuit_sub(t171, t172); // Fp2 mul real part end
    let t174 = circuit_mul(t148, t69);
    let t175 = circuit_mul(t151, t68);
    let t176 = circuit_add(t174, t175); // Fp2 mul imag part end
    let t177 = circuit_sub(t173, t78); // Fp2 sub coeff 0/1
    let t178 = circuit_sub(t176, t79); // Fp2 sub coeff 1/1
    let t179 = circuit_sub(t177, t178);
    let t180 = circuit_mul(t179, in23); // eval bls line by yInv
    let t181 = circuit_sub(t148, t151);
    let t182 = circuit_mul(t181, in24); // eval blsline by xNegOverY
    let t183 = circuit_mul(t178, in23); // eval bls line by yInv
    let t184 = circuit_mul(t151, in24); // eval bls line by xNegOverY
    let t185 = circuit_mul(t182, t0); // Eval sparse poly line_2p_1 step coeff_2 * z^2
    let t186 = circuit_add(t180, t185); // Eval sparse poly line_2p_1 step + coeff_2 * z^2
    let t187 = circuit_add(t186, t1); // Eval sparse poly line_2p_1 step + 1*z^3
    let t188 = circuit_mul(t183, t4); // Eval sparse poly line_2p_1 step coeff_6 * z^6
    let t189 = circuit_add(t187, t188); // Eval sparse poly line_2p_1 step + coeff_6 * z^6
    let t190 = circuit_mul(t184, t6); // Eval sparse poly line_2p_1 step coeff_8 * z^8
    let t191 = circuit_add(t189, t190); // Eval sparse poly line_2p_1 step + coeff_8 * z^8
    let t192 = circuit_mul(t130, t191); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t193 = circuit_mul(in32, in43); // Eval f_i+1 step coeff_1 * z^1
    let t194 = circuit_add(in31, t193); // Eval f_i+1 step + (coeff_1 * z^1)
    let t195 = circuit_mul(in33, t0); // Eval f_i+1 step coeff_2 * z^2
    let t196 = circuit_add(t194, t195); // Eval f_i+1 step + (coeff_2 * z^2)
    let t197 = circuit_mul(in34, t1); // Eval f_i+1 step coeff_3 * z^3
    let t198 = circuit_add(t196, t197); // Eval f_i+1 step + (coeff_3 * z^3)
    let t199 = circuit_mul(in35, t2); // Eval f_i+1 step coeff_4 * z^4
    let t200 = circuit_add(t198, t199); // Eval f_i+1 step + (coeff_4 * z^4)
    let t201 = circuit_mul(in36, t3); // Eval f_i+1 step coeff_5 * z^5
    let t202 = circuit_add(t200, t201); // Eval f_i+1 step + (coeff_5 * z^5)
    let t203 = circuit_mul(in37, t4); // Eval f_i+1 step coeff_6 * z^6
    let t204 = circuit_add(t202, t203); // Eval f_i+1 step + (coeff_6 * z^6)
    let t205 = circuit_mul(in38, t5); // Eval f_i+1 step coeff_7 * z^7
    let t206 = circuit_add(t204, t205); // Eval f_i+1 step + (coeff_7 * z^7)
    let t207 = circuit_mul(in39, t6); // Eval f_i+1 step coeff_8 * z^8
    let t208 = circuit_add(t206, t207); // Eval f_i+1 step + (coeff_8 * z^8)
    let t209 = circuit_mul(in40, t7); // Eval f_i+1 step coeff_9 * z^9
    let t210 = circuit_add(t208, t209); // Eval f_i+1 step + (coeff_9 * z^9)
    let t211 = circuit_mul(in41, t8); // Eval f_i+1 step coeff_10 * z^10
    let t212 = circuit_add(t210, t211); // Eval f_i+1 step + (coeff_10 * z^10)
    let t213 = circuit_mul(in42, t9); // Eval f_i+1 step coeff_11 * z^11
    let t214 = circuit_add(t212, t213); // Eval f_i+1 step + (coeff_11 * z^11)
    let t215 = circuit_sub(t192, t214); // (Π(i,k) (Pk(z))) - Ri(z)
    let t216 = circuit_mul(t10, t215); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t217 = circuit_add(in29, t216); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t159, t160, t169, t170, t214, t217, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x3, 0x0, 0x0, 0x0]); // in0
    circuit_inputs = circuit_inputs.next([0x6, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in2
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in3
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in7
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in8
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r0a0); // in9
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r0a1); // in10
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r1a0); // in11
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r1a1); // in12
    circuit_inputs = circuit_inputs.next(yInv_1); // in13
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in16
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in17
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in18
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r0a0); // in19
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r0a1); // in20
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r1a0); // in21
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r1a1); // in22
    circuit_inputs = circuit_inputs.next(yInv_2); // in23
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in24
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in25
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in26
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in27
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in28
    circuit_inputs = circuit_inputs.next(lhs_i); // in29
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in30
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in31
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in33
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in34
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in35
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in36
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in37
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in38
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in39
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in40
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in41
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in42
    circuit_inputs = circuit_inputs.next(z); // in43
    circuit_inputs = circuit_inputs.next(ci); // in44

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let Q0: G2Point = G2Point {
        x0: outputs.get_output(t159),
        x1: outputs.get_output(t160),
        y0: outputs.get_output(t169),
        y1: outputs.get_output(t170)
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t214);
    let lhs_i_plus_one: u384 = outputs.get_output(t217);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (Q0, f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BLS12_381_MP_CHECK_BIT0_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    z: u384,
    ci: u384
) -> (u384, u384, u384) {
    // INPUT stack
    let (in0, in1, in2) = (CE::<CI<0>> {}, CE::<CI<1>> {}, CE::<CI<2>> {});
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let in27 = CE::<CI<27>> {};
    let t0 = circuit_mul(in26, in26); // Compute z^2
    let t1 = circuit_mul(t0, in26); // Compute z^3
    let t2 = circuit_mul(t1, in26); // Compute z^4
    let t3 = circuit_mul(t2, in26); // Compute z^5
    let t4 = circuit_mul(t3, in26); // Compute z^6
    let t5 = circuit_mul(t4, in26); // Compute z^7
    let t6 = circuit_mul(t5, in26); // Compute z^8
    let t7 = circuit_mul(t6, in26); // Compute z^9
    let t8 = circuit_mul(t7, in26); // Compute z^10
    let t9 = circuit_mul(t8, in26); // Compute z^11
    let t10 = circuit_mul(in27, in27); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in13, in13); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_sub(in4, in5);
    let t13 = circuit_mul(t12, in0); // eval bls line by yInv
    let t14 = circuit_sub(in2, in3);
    let t15 = circuit_mul(t14, in1); // eval blsline by xNegOverY
    let t16 = circuit_mul(in5, in0); // eval bls line by yInv
    let t17 = circuit_mul(in3, in1); // eval bls line by xNegOverY
    let t18 = circuit_mul(t15, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t19 = circuit_add(t13, t18); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t20 = circuit_add(t19, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t21 = circuit_mul(t16, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t22 = circuit_add(t20, t21); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t23 = circuit_mul(t17, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t24 = circuit_add(t22, t23); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t25 = circuit_mul(t11, t24); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t26 = circuit_sub(in10, in11);
    let t27 = circuit_mul(t26, in6); // eval bls line by yInv
    let t28 = circuit_sub(in8, in9);
    let t29 = circuit_mul(t28, in7); // eval blsline by xNegOverY
    let t30 = circuit_mul(in11, in6); // eval bls line by yInv
    let t31 = circuit_mul(in9, in7); // eval bls line by xNegOverY
    let t32 = circuit_mul(t29, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t33 = circuit_add(t27, t32); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t34 = circuit_add(t33, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t35 = circuit_mul(t30, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t36 = circuit_add(t34, t35); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t37 = circuit_mul(t31, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t38 = circuit_add(t36, t37); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t39 = circuit_mul(t25, t38); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t40 = circuit_mul(in15, in26); // Eval f_i+1 step coeff_1 * z^1
    let t41 = circuit_add(in14, t40); // Eval f_i+1 step + (coeff_1 * z^1)
    let t42 = circuit_mul(in16, t0); // Eval f_i+1 step coeff_2 * z^2
    let t43 = circuit_add(t41, t42); // Eval f_i+1 step + (coeff_2 * z^2)
    let t44 = circuit_mul(in17, t1); // Eval f_i+1 step coeff_3 * z^3
    let t45 = circuit_add(t43, t44); // Eval f_i+1 step + (coeff_3 * z^3)
    let t46 = circuit_mul(in18, t2); // Eval f_i+1 step coeff_4 * z^4
    let t47 = circuit_add(t45, t46); // Eval f_i+1 step + (coeff_4 * z^4)
    let t48 = circuit_mul(in19, t3); // Eval f_i+1 step coeff_5 * z^5
    let t49 = circuit_add(t47, t48); // Eval f_i+1 step + (coeff_5 * z^5)
    let t50 = circuit_mul(in20, t4); // Eval f_i+1 step coeff_6 * z^6
    let t51 = circuit_add(t49, t50); // Eval f_i+1 step + (coeff_6 * z^6)
    let t52 = circuit_mul(in21, t5); // Eval f_i+1 step coeff_7 * z^7
    let t53 = circuit_add(t51, t52); // Eval f_i+1 step + (coeff_7 * z^7)
    let t54 = circuit_mul(in22, t6); // Eval f_i+1 step coeff_8 * z^8
    let t55 = circuit_add(t53, t54); // Eval f_i+1 step + (coeff_8 * z^8)
    let t56 = circuit_mul(in23, t7); // Eval f_i+1 step coeff_9 * z^9
    let t57 = circuit_add(t55, t56); // Eval f_i+1 step + (coeff_9 * z^9)
    let t58 = circuit_mul(in24, t8); // Eval f_i+1 step coeff_10 * z^10
    let t59 = circuit_add(t57, t58); // Eval f_i+1 step + (coeff_10 * z^10)
    let t60 = circuit_mul(in25, t9); // Eval f_i+1 step coeff_11 * z^11
    let t61 = circuit_add(t59, t60); // Eval f_i+1 step + (coeff_11 * z^11)
    let t62 = circuit_sub(t39, t61); // (Π(i,k) (Pk(z))) - Ri(z)
    let t63 = circuit_mul(t10, t62); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t64 = circuit_add(in12, t63); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t61, t64, t10,).new_inputs();
    // Prefill constants:

    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in0
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in1
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in2
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in5
    circuit_inputs = circuit_inputs.next(yInv_1); // in6
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in7
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in8
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in9
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in10
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in11
    circuit_inputs = circuit_inputs.next(lhs_i); // in12
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in13
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in14
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in15
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in16
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in17
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in18
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in19
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in20
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in21
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in22
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in23
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in24
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in25
    circuit_inputs = circuit_inputs.next(z); // in26
    circuit_inputs = circuit_inputs.next(ci); // in27

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t61);
    let lhs_i_plus_one: u384 = outputs.get_output(t64);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BLS12_381_MP_CHECK_BIT0_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    z: u384,
    ci: u384
) -> (G2Point, u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x3
    let in1 = CE::<CI<1>> {}; // 0x6
    let in2 = CE::<CI<2>> {}; // 0x0

    // INPUT stack
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let (in27, in28, in29) = (CE::<CI<27>> {}, CE::<CI<28>> {}, CE::<CI<29>> {});
    let (in30, in31, in32) = (CE::<CI<30>> {}, CE::<CI<31>> {}, CE::<CI<32>> {});
    let (in33, in34, in35) = (CE::<CI<33>> {}, CE::<CI<34>> {}, CE::<CI<35>> {});
    let in36 = CE::<CI<36>> {};
    let t0 = circuit_mul(in35, in35); // Compute z^2
    let t1 = circuit_mul(t0, in35); // Compute z^3
    let t2 = circuit_mul(t1, in35); // Compute z^4
    let t3 = circuit_mul(t2, in35); // Compute z^5
    let t4 = circuit_mul(t3, in35); // Compute z^6
    let t5 = circuit_mul(t4, in35); // Compute z^7
    let t6 = circuit_mul(t5, in35); // Compute z^8
    let t7 = circuit_mul(t6, in35); // Compute z^9
    let t8 = circuit_mul(t7, in35); // Compute z^10
    let t9 = circuit_mul(t8, in35); // Compute z^11
    let t10 = circuit_mul(in36, in36); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in22, in22); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_sub(in7, in8);
    let t13 = circuit_mul(t12, in3); // eval bls line by yInv
    let t14 = circuit_sub(in5, in6);
    let t15 = circuit_mul(t14, in4); // eval blsline by xNegOverY
    let t16 = circuit_mul(in8, in3); // eval bls line by yInv
    let t17 = circuit_mul(in6, in4); // eval bls line by xNegOverY
    let t18 = circuit_mul(t15, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t19 = circuit_add(t13, t18); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t20 = circuit_add(t19, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t21 = circuit_mul(t16, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t22 = circuit_add(t20, t21); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t23 = circuit_mul(t17, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t24 = circuit_add(t22, t23); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t25 = circuit_mul(t11, t24); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t26 = circuit_sub(in13, in14);
    let t27 = circuit_mul(t26, in9); // eval bls line by yInv
    let t28 = circuit_sub(in11, in12);
    let t29 = circuit_mul(t28, in10); // eval blsline by xNegOverY
    let t30 = circuit_mul(in14, in9); // eval bls line by yInv
    let t31 = circuit_mul(in12, in10); // eval bls line by xNegOverY
    let t32 = circuit_mul(t29, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t33 = circuit_add(t27, t32); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t34 = circuit_add(t33, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t35 = circuit_mul(t30, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t36 = circuit_add(t34, t35); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t37 = circuit_mul(t31, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t38 = circuit_add(t36, t37); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t39 = circuit_mul(t25, t38); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t40 = circuit_add(in17, in18); // Doubling slope numerator start
    let t41 = circuit_sub(in17, in18);
    let t42 = circuit_mul(t40, t41);
    let t43 = circuit_mul(in17, in18);
    let t44 = circuit_mul(t42, in0);
    let t45 = circuit_mul(t43, in1); // Doubling slope numerator end
    let t46 = circuit_add(in19, in19); // Fp2 add coeff 0/1
    let t47 = circuit_add(in20, in20); // Fp2 add coeff 1/1
    let t48 = circuit_mul(t46, t46); // Fp2 Div x/y start : Fp2 Inv y start
    let t49 = circuit_mul(t47, t47);
    let t50 = circuit_add(t48, t49);
    let t51 = circuit_inverse(t50);
    let t52 = circuit_mul(t46, t51); // Fp2 Inv y real part end
    let t53 = circuit_mul(t47, t51);
    let t54 = circuit_sub(in2, t53); // Fp2 Inv y imag part end
    let t55 = circuit_mul(t44, t52); // Fp2 mul start
    let t56 = circuit_mul(t45, t54);
    let t57 = circuit_sub(t55, t56); // Fp2 mul real part end
    let t58 = circuit_mul(t44, t54);
    let t59 = circuit_mul(t45, t52);
    let t60 = circuit_add(t58, t59); // Fp2 mul imag part end
    let t61 = circuit_add(t57, t60);
    let t62 = circuit_sub(t57, t60);
    let t63 = circuit_mul(t61, t62);
    let t64 = circuit_mul(t57, t60);
    let t65 = circuit_add(t64, t64);
    let t66 = circuit_add(in17, in17); // Fp2 add coeff 0/1
    let t67 = circuit_add(in18, in18); // Fp2 add coeff 1/1
    let t68 = circuit_sub(t63, t66); // Fp2 sub coeff 0/1
    let t69 = circuit_sub(t65, t67); // Fp2 sub coeff 1/1
    let t70 = circuit_sub(in17, t68); // Fp2 sub coeff 0/1
    let t71 = circuit_sub(in18, t69); // Fp2 sub coeff 1/1
    let t72 = circuit_mul(t57, t70); // Fp2 mul start
    let t73 = circuit_mul(t60, t71);
    let t74 = circuit_sub(t72, t73); // Fp2 mul real part end
    let t75 = circuit_mul(t57, t71);
    let t76 = circuit_mul(t60, t70);
    let t77 = circuit_add(t75, t76); // Fp2 mul imag part end
    let t78 = circuit_sub(t74, in19); // Fp2 sub coeff 0/1
    let t79 = circuit_sub(t77, in20); // Fp2 sub coeff 1/1
    let t80 = circuit_mul(t57, in17); // Fp2 mul start
    let t81 = circuit_mul(t60, in18);
    let t82 = circuit_sub(t80, t81); // Fp2 mul real part end
    let t83 = circuit_mul(t57, in18);
    let t84 = circuit_mul(t60, in17);
    let t85 = circuit_add(t83, t84); // Fp2 mul imag part end
    let t86 = circuit_sub(t82, in19); // Fp2 sub coeff 0/1
    let t87 = circuit_sub(t85, in20); // Fp2 sub coeff 1/1
    let t88 = circuit_sub(t86, t87);
    let t89 = circuit_mul(t88, in15); // eval bls line by yInv
    let t90 = circuit_sub(t57, t60);
    let t91 = circuit_mul(t90, in16); // eval blsline by xNegOverY
    let t92 = circuit_mul(t87, in15); // eval bls line by yInv
    let t93 = circuit_mul(t60, in16); // eval bls line by xNegOverY
    let t94 = circuit_mul(t91, t0); // Eval sparse poly line_2p_1 step coeff_2 * z^2
    let t95 = circuit_add(t89, t94); // Eval sparse poly line_2p_1 step + coeff_2 * z^2
    let t96 = circuit_add(t95, t1); // Eval sparse poly line_2p_1 step + 1*z^3
    let t97 = circuit_mul(t92, t4); // Eval sparse poly line_2p_1 step coeff_6 * z^6
    let t98 = circuit_add(t96, t97); // Eval sparse poly line_2p_1 step + coeff_6 * z^6
    let t99 = circuit_mul(t93, t6); // Eval sparse poly line_2p_1 step coeff_8 * z^8
    let t100 = circuit_add(t98, t99); // Eval sparse poly line_2p_1 step + coeff_8 * z^8
    let t101 = circuit_mul(t39, t100); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t102 = circuit_mul(in24, in35); // Eval f_i+1 step coeff_1 * z^1
    let t103 = circuit_add(in23, t102); // Eval f_i+1 step + (coeff_1 * z^1)
    let t104 = circuit_mul(in25, t0); // Eval f_i+1 step coeff_2 * z^2
    let t105 = circuit_add(t103, t104); // Eval f_i+1 step + (coeff_2 * z^2)
    let t106 = circuit_mul(in26, t1); // Eval f_i+1 step coeff_3 * z^3
    let t107 = circuit_add(t105, t106); // Eval f_i+1 step + (coeff_3 * z^3)
    let t108 = circuit_mul(in27, t2); // Eval f_i+1 step coeff_4 * z^4
    let t109 = circuit_add(t107, t108); // Eval f_i+1 step + (coeff_4 * z^4)
    let t110 = circuit_mul(in28, t3); // Eval f_i+1 step coeff_5 * z^5
    let t111 = circuit_add(t109, t110); // Eval f_i+1 step + (coeff_5 * z^5)
    let t112 = circuit_mul(in29, t4); // Eval f_i+1 step coeff_6 * z^6
    let t113 = circuit_add(t111, t112); // Eval f_i+1 step + (coeff_6 * z^6)
    let t114 = circuit_mul(in30, t5); // Eval f_i+1 step coeff_7 * z^7
    let t115 = circuit_add(t113, t114); // Eval f_i+1 step + (coeff_7 * z^7)
    let t116 = circuit_mul(in31, t6); // Eval f_i+1 step coeff_8 * z^8
    let t117 = circuit_add(t115, t116); // Eval f_i+1 step + (coeff_8 * z^8)
    let t118 = circuit_mul(in32, t7); // Eval f_i+1 step coeff_9 * z^9
    let t119 = circuit_add(t117, t118); // Eval f_i+1 step + (coeff_9 * z^9)
    let t120 = circuit_mul(in33, t8); // Eval f_i+1 step coeff_10 * z^10
    let t121 = circuit_add(t119, t120); // Eval f_i+1 step + (coeff_10 * z^10)
    let t122 = circuit_mul(in34, t9); // Eval f_i+1 step coeff_11 * z^11
    let t123 = circuit_add(t121, t122); // Eval f_i+1 step + (coeff_11 * z^11)
    let t124 = circuit_sub(t101, t123); // (Π(i,k) (Pk(z))) - Ri(z)
    let t125 = circuit_mul(t10, t124); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t126 = circuit_add(in21, t125); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t68, t69, t78, t79, t123, t126, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x3, 0x0, 0x0, 0x0]); // in0
    circuit_inputs = circuit_inputs.next([0x6, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in2
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in3
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in7
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in8
    circuit_inputs = circuit_inputs.next(yInv_1); // in9
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in10
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in11
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in14
    circuit_inputs = circuit_inputs.next(yInv_2); // in15
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in16
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in17
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in18
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in19
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in20
    circuit_inputs = circuit_inputs.next(lhs_i); // in21
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in22
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in23
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in24
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in25
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in26
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in27
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in28
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in29
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in30
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in31
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in33
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in34
    circuit_inputs = circuit_inputs.next(z); // in35
    circuit_inputs = circuit_inputs.next(ci); // in36

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let Q0: G2Point = G2Point {
        x0: outputs.get_output(t68),
        x1: outputs.get_output(t69),
        y0: outputs.get_output(t78),
        y1: outputs.get_output(t79)
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t123);
    let lhs_i_plus_one: u384 = outputs.get_output(t126);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (Q0, f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BLS12_381_MP_CHECK_BIT1_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    Q_or_Q_neg_line0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    Q_or_Q_neg_line1: G2Line,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    c_or_cinv_of_z: u384,
    z: u384,
    ci: u384
) -> (u384, u384, u384) {
    // INPUT stack
    let (in0, in1, in2) = (CE::<CI<0>> {}, CE::<CI<1>> {}, CE::<CI<2>> {});
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let (in27, in28, in29) = (CE::<CI<27>> {}, CE::<CI<28>> {}, CE::<CI<29>> {});
    let (in30, in31, in32) = (CE::<CI<30>> {}, CE::<CI<31>> {}, CE::<CI<32>> {});
    let (in33, in34, in35) = (CE::<CI<33>> {}, CE::<CI<34>> {}, CE::<CI<35>> {});
    let in36 = CE::<CI<36>> {};
    let t0 = circuit_mul(in35, in35); // Compute z^2
    let t1 = circuit_mul(t0, in35); // Compute z^3
    let t2 = circuit_mul(t1, in35); // Compute z^4
    let t3 = circuit_mul(t2, in35); // Compute z^5
    let t4 = circuit_mul(t3, in35); // Compute z^6
    let t5 = circuit_mul(t4, in35); // Compute z^7
    let t6 = circuit_mul(t5, in35); // Compute z^8
    let t7 = circuit_mul(t6, in35); // Compute z^9
    let t8 = circuit_mul(t7, in35); // Compute z^10
    let t9 = circuit_mul(t8, in35); // Compute z^11
    let t10 = circuit_mul(in36, in36); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in21, in21); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_sub(in4, in5);
    let t13 = circuit_mul(t12, in0); // eval bls line by yInv
    let t14 = circuit_sub(in2, in3);
    let t15 = circuit_mul(t14, in1); // eval blsline by xNegOverY
    let t16 = circuit_mul(in5, in0); // eval bls line by yInv
    let t17 = circuit_mul(in3, in1); // eval bls line by xNegOverY
    let t18 = circuit_sub(in8, in9);
    let t19 = circuit_mul(t18, in0); // eval bls line by yInv
    let t20 = circuit_sub(in6, in7);
    let t21 = circuit_mul(t20, in1); // eval blsline by xNegOverY
    let t22 = circuit_mul(in9, in0); // eval bls line by yInv
    let t23 = circuit_mul(in7, in1); // eval bls line by xNegOverY
    let t24 = circuit_mul(t15, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t25 = circuit_add(t13, t24); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t26 = circuit_add(t25, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t27 = circuit_mul(t16, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t28 = circuit_add(t26, t27); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t29 = circuit_mul(t17, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t30 = circuit_add(t28, t29); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t31 = circuit_mul(t11, t30); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t32 = circuit_mul(t21, t0); // Eval sparse poly line_0p_2 step coeff_2 * z^2
    let t33 = circuit_add(t19, t32); // Eval sparse poly line_0p_2 step + coeff_2 * z^2
    let t34 = circuit_add(t33, t1); // Eval sparse poly line_0p_2 step + 1*z^3
    let t35 = circuit_mul(t22, t4); // Eval sparse poly line_0p_2 step coeff_6 * z^6
    let t36 = circuit_add(t34, t35); // Eval sparse poly line_0p_2 step + coeff_6 * z^6
    let t37 = circuit_mul(t23, t6); // Eval sparse poly line_0p_2 step coeff_8 * z^8
    let t38 = circuit_add(t36, t37); // Eval sparse poly line_0p_2 step + coeff_8 * z^8
    let t39 = circuit_mul(t31, t38); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t40 = circuit_sub(in14, in15);
    let t41 = circuit_mul(t40, in10); // eval bls line by yInv
    let t42 = circuit_sub(in12, in13);
    let t43 = circuit_mul(t42, in11); // eval blsline by xNegOverY
    let t44 = circuit_mul(in15, in10); // eval bls line by yInv
    let t45 = circuit_mul(in13, in11); // eval bls line by xNegOverY
    let t46 = circuit_sub(in18, in19);
    let t47 = circuit_mul(t46, in10); // eval bls line by yInv
    let t48 = circuit_sub(in16, in17);
    let t49 = circuit_mul(t48, in11); // eval blsline by xNegOverY
    let t50 = circuit_mul(in19, in10); // eval bls line by yInv
    let t51 = circuit_mul(in17, in11); // eval bls line by xNegOverY
    let t52 = circuit_mul(t43, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t53 = circuit_add(t41, t52); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t54 = circuit_add(t53, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t55 = circuit_mul(t44, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t56 = circuit_add(t54, t55); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t57 = circuit_mul(t45, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t58 = circuit_add(t56, t57); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t59 = circuit_mul(t39, t58); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t60 = circuit_mul(t49, t0); // Eval sparse poly line_1p_2 step coeff_2 * z^2
    let t61 = circuit_add(t47, t60); // Eval sparse poly line_1p_2 step + coeff_2 * z^2
    let t62 = circuit_add(t61, t1); // Eval sparse poly line_1p_2 step + 1*z^3
    let t63 = circuit_mul(t50, t4); // Eval sparse poly line_1p_2 step coeff_6 * z^6
    let t64 = circuit_add(t62, t63); // Eval sparse poly line_1p_2 step + coeff_6 * z^6
    let t65 = circuit_mul(t51, t6); // Eval sparse poly line_1p_2 step coeff_8 * z^8
    let t66 = circuit_add(t64, t65); // Eval sparse poly line_1p_2 step + coeff_8 * z^8
    let t67 = circuit_mul(t59, t66); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t68 = circuit_mul(t67, in34);
    let t69 = circuit_mul(in23, in35); // Eval f_i+1 step coeff_1 * z^1
    let t70 = circuit_add(in22, t69); // Eval f_i+1 step + (coeff_1 * z^1)
    let t71 = circuit_mul(in24, t0); // Eval f_i+1 step coeff_2 * z^2
    let t72 = circuit_add(t70, t71); // Eval f_i+1 step + (coeff_2 * z^2)
    let t73 = circuit_mul(in25, t1); // Eval f_i+1 step coeff_3 * z^3
    let t74 = circuit_add(t72, t73); // Eval f_i+1 step + (coeff_3 * z^3)
    let t75 = circuit_mul(in26, t2); // Eval f_i+1 step coeff_4 * z^4
    let t76 = circuit_add(t74, t75); // Eval f_i+1 step + (coeff_4 * z^4)
    let t77 = circuit_mul(in27, t3); // Eval f_i+1 step coeff_5 * z^5
    let t78 = circuit_add(t76, t77); // Eval f_i+1 step + (coeff_5 * z^5)
    let t79 = circuit_mul(in28, t4); // Eval f_i+1 step coeff_6 * z^6
    let t80 = circuit_add(t78, t79); // Eval f_i+1 step + (coeff_6 * z^6)
    let t81 = circuit_mul(in29, t5); // Eval f_i+1 step coeff_7 * z^7
    let t82 = circuit_add(t80, t81); // Eval f_i+1 step + (coeff_7 * z^7)
    let t83 = circuit_mul(in30, t6); // Eval f_i+1 step coeff_8 * z^8
    let t84 = circuit_add(t82, t83); // Eval f_i+1 step + (coeff_8 * z^8)
    let t85 = circuit_mul(in31, t7); // Eval f_i+1 step coeff_9 * z^9
    let t86 = circuit_add(t84, t85); // Eval f_i+1 step + (coeff_9 * z^9)
    let t87 = circuit_mul(in32, t8); // Eval f_i+1 step coeff_10 * z^10
    let t88 = circuit_add(t86, t87); // Eval f_i+1 step + (coeff_10 * z^10)
    let t89 = circuit_mul(in33, t9); // Eval f_i+1 step coeff_11 * z^11
    let t90 = circuit_add(t88, t89); // Eval f_i+1 step + (coeff_11 * z^11)
    let t91 = circuit_sub(t68, t90); // (Π(i,k) (Pk(z))) - Ri(z)
    let t92 = circuit_mul(t10, t91); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t93 = circuit_add(in20, t92); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t90, t93, t10,).new_inputs();
    // Prefill constants:

    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in0
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in1
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in2
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in5
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r0a0); // in6
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r0a1); // in7
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r1a0); // in8
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r1a1); // in9
    circuit_inputs = circuit_inputs.next(yInv_1); // in10
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in11
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in15
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r0a0); // in16
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r0a1); // in17
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r1a0); // in18
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r1a1); // in19
    circuit_inputs = circuit_inputs.next(lhs_i); // in20
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in21
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in22
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in23
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in24
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in25
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in26
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in27
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in28
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in29
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in30
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in31
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in33
    circuit_inputs = circuit_inputs.next(c_or_cinv_of_z); // in34
    circuit_inputs = circuit_inputs.next(z); // in35
    circuit_inputs = circuit_inputs.next(ci); // in36

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t90);
    let lhs_i_plus_one: u384 = outputs.get_output(t93);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BLS12_381_MP_CHECK_BIT1_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    Q_or_Q_neg_line0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    Q_or_Q_neg_line1: G2Line,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    Q_or_Q_neg_2: G2Point,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    c_or_cinv_of_z: u384,
    z: u384,
    ci: u384
) -> (G2Point, u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x0

    // INPUT stack
    let (in1, in2, in3) = (CE::<CI<1>> {}, CE::<CI<2>> {}, CE::<CI<3>> {});
    let (in4, in5, in6) = (CE::<CI<4>> {}, CE::<CI<5>> {}, CE::<CI<6>> {});
    let (in7, in8, in9) = (CE::<CI<7>> {}, CE::<CI<8>> {}, CE::<CI<9>> {});
    let (in10, in11, in12) = (CE::<CI<10>> {}, CE::<CI<11>> {}, CE::<CI<12>> {});
    let (in13, in14, in15) = (CE::<CI<13>> {}, CE::<CI<14>> {}, CE::<CI<15>> {});
    let (in16, in17, in18) = (CE::<CI<16>> {}, CE::<CI<17>> {}, CE::<CI<18>> {});
    let (in19, in20, in21) = (CE::<CI<19>> {}, CE::<CI<20>> {}, CE::<CI<21>> {});
    let (in22, in23, in24) = (CE::<CI<22>> {}, CE::<CI<23>> {}, CE::<CI<24>> {});
    let (in25, in26, in27) = (CE::<CI<25>> {}, CE::<CI<26>> {}, CE::<CI<27>> {});
    let (in28, in29, in30) = (CE::<CI<28>> {}, CE::<CI<29>> {}, CE::<CI<30>> {});
    let (in31, in32, in33) = (CE::<CI<31>> {}, CE::<CI<32>> {}, CE::<CI<33>> {});
    let (in34, in35, in36) = (CE::<CI<34>> {}, CE::<CI<35>> {}, CE::<CI<36>> {});
    let (in37, in38, in39) = (CE::<CI<37>> {}, CE::<CI<38>> {}, CE::<CI<39>> {});
    let (in40, in41, in42) = (CE::<CI<40>> {}, CE::<CI<41>> {}, CE::<CI<42>> {});
    let (in43, in44, in45) = (CE::<CI<43>> {}, CE::<CI<44>> {}, CE::<CI<45>> {});
    let (in46, in47) = (CE::<CI<46>> {}, CE::<CI<47>> {});
    let t0 = circuit_mul(in46, in46); // Compute z^2
    let t1 = circuit_mul(t0, in46); // Compute z^3
    let t2 = circuit_mul(t1, in46); // Compute z^4
    let t3 = circuit_mul(t2, in46); // Compute z^5
    let t4 = circuit_mul(t3, in46); // Compute z^6
    let t5 = circuit_mul(t4, in46); // Compute z^7
    let t6 = circuit_mul(t5, in46); // Compute z^8
    let t7 = circuit_mul(t6, in46); // Compute z^9
    let t8 = circuit_mul(t7, in46); // Compute z^10
    let t9 = circuit_mul(t8, in46); // Compute z^11
    let t10 = circuit_mul(in47, in47); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in32, in32); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_sub(in5, in6);
    let t13 = circuit_mul(t12, in1); // eval bls line by yInv
    let t14 = circuit_sub(in3, in4);
    let t15 = circuit_mul(t14, in2); // eval blsline by xNegOverY
    let t16 = circuit_mul(in6, in1); // eval bls line by yInv
    let t17 = circuit_mul(in4, in2); // eval bls line by xNegOverY
    let t18 = circuit_sub(in9, in10);
    let t19 = circuit_mul(t18, in1); // eval bls line by yInv
    let t20 = circuit_sub(in7, in8);
    let t21 = circuit_mul(t20, in2); // eval blsline by xNegOverY
    let t22 = circuit_mul(in10, in1); // eval bls line by yInv
    let t23 = circuit_mul(in8, in2); // eval bls line by xNegOverY
    let t24 = circuit_mul(t15, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t25 = circuit_add(t13, t24); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t26 = circuit_add(t25, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t27 = circuit_mul(t16, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t28 = circuit_add(t26, t27); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t29 = circuit_mul(t17, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t30 = circuit_add(t28, t29); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t31 = circuit_mul(t11, t30); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t32 = circuit_mul(t21, t0); // Eval sparse poly line_0p_2 step coeff_2 * z^2
    let t33 = circuit_add(t19, t32); // Eval sparse poly line_0p_2 step + coeff_2 * z^2
    let t34 = circuit_add(t33, t1); // Eval sparse poly line_0p_2 step + 1*z^3
    let t35 = circuit_mul(t22, t4); // Eval sparse poly line_0p_2 step coeff_6 * z^6
    let t36 = circuit_add(t34, t35); // Eval sparse poly line_0p_2 step + coeff_6 * z^6
    let t37 = circuit_mul(t23, t6); // Eval sparse poly line_0p_2 step coeff_8 * z^8
    let t38 = circuit_add(t36, t37); // Eval sparse poly line_0p_2 step + coeff_8 * z^8
    let t39 = circuit_mul(t31, t38); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t40 = circuit_sub(in15, in16);
    let t41 = circuit_mul(t40, in11); // eval bls line by yInv
    let t42 = circuit_sub(in13, in14);
    let t43 = circuit_mul(t42, in12); // eval blsline by xNegOverY
    let t44 = circuit_mul(in16, in11); // eval bls line by yInv
    let t45 = circuit_mul(in14, in12); // eval bls line by xNegOverY
    let t46 = circuit_sub(in19, in20);
    let t47 = circuit_mul(t46, in11); // eval bls line by yInv
    let t48 = circuit_sub(in17, in18);
    let t49 = circuit_mul(t48, in12); // eval blsline by xNegOverY
    let t50 = circuit_mul(in20, in11); // eval bls line by yInv
    let t51 = circuit_mul(in18, in12); // eval bls line by xNegOverY
    let t52 = circuit_mul(t43, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t53 = circuit_add(t41, t52); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t54 = circuit_add(t53, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t55 = circuit_mul(t44, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t56 = circuit_add(t54, t55); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t57 = circuit_mul(t45, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t58 = circuit_add(t56, t57); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t59 = circuit_mul(t39, t58); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t60 = circuit_mul(t49, t0); // Eval sparse poly line_1p_2 step coeff_2 * z^2
    let t61 = circuit_add(t47, t60); // Eval sparse poly line_1p_2 step + coeff_2 * z^2
    let t62 = circuit_add(t61, t1); // Eval sparse poly line_1p_2 step + 1*z^3
    let t63 = circuit_mul(t50, t4); // Eval sparse poly line_1p_2 step coeff_6 * z^6
    let t64 = circuit_add(t62, t63); // Eval sparse poly line_1p_2 step + coeff_6 * z^6
    let t65 = circuit_mul(t51, t6); // Eval sparse poly line_1p_2 step coeff_8 * z^8
    let t66 = circuit_add(t64, t65); // Eval sparse poly line_1p_2 step + coeff_8 * z^8
    let t67 = circuit_mul(t59, t66); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t68 = circuit_sub(in25, in29); // Fp2 sub coeff 0/1
    let t69 = circuit_sub(in26, in30); // Fp2 sub coeff 1/1
    let t70 = circuit_sub(in23, in27); // Fp2 sub coeff 0/1
    let t71 = circuit_sub(in24, in28); // Fp2 sub coeff 1/1
    let t72 = circuit_mul(t70, t70); // Fp2 Div x/y start : Fp2 Inv y start
    let t73 = circuit_mul(t71, t71);
    let t74 = circuit_add(t72, t73);
    let t75 = circuit_inverse(t74);
    let t76 = circuit_mul(t70, t75); // Fp2 Inv y real part end
    let t77 = circuit_mul(t71, t75);
    let t78 = circuit_sub(in0, t77); // Fp2 Inv y imag part end
    let t79 = circuit_mul(t68, t76); // Fp2 mul start
    let t80 = circuit_mul(t69, t78);
    let t81 = circuit_sub(t79, t80); // Fp2 mul real part end
    let t82 = circuit_mul(t68, t78);
    let t83 = circuit_mul(t69, t76);
    let t84 = circuit_add(t82, t83); // Fp2 mul imag part end
    let t85 = circuit_add(t81, t84);
    let t86 = circuit_sub(t81, t84);
    let t87 = circuit_mul(t85, t86);
    let t88 = circuit_mul(t81, t84);
    let t89 = circuit_add(t88, t88);
    let t90 = circuit_add(in23, in27); // Fp2 add coeff 0/1
    let t91 = circuit_add(in24, in28); // Fp2 add coeff 1/1
    let t92 = circuit_sub(t87, t90); // Fp2 sub coeff 0/1
    let t93 = circuit_sub(t89, t91); // Fp2 sub coeff 1/1
    let t94 = circuit_mul(t81, in23); // Fp2 mul start
    let t95 = circuit_mul(t84, in24);
    let t96 = circuit_sub(t94, t95); // Fp2 mul real part end
    let t97 = circuit_mul(t81, in24);
    let t98 = circuit_mul(t84, in23);
    let t99 = circuit_add(t97, t98); // Fp2 mul imag part end
    let t100 = circuit_sub(t96, in25); // Fp2 sub coeff 0/1
    let t101 = circuit_sub(t99, in26); // Fp2 sub coeff 1/1
    let t102 = circuit_add(in25, in25); // Fp2 add coeff 0/1
    let t103 = circuit_add(in26, in26); // Fp2 add coeff 1/1
    let t104 = circuit_sub(t92, in23); // Fp2 sub coeff 0/1
    let t105 = circuit_sub(t93, in24); // Fp2 sub coeff 1/1
    let t106 = circuit_mul(t104, t104); // Fp2 Div x/y start : Fp2 Inv y start
    let t107 = circuit_mul(t105, t105);
    let t108 = circuit_add(t106, t107);
    let t109 = circuit_inverse(t108);
    let t110 = circuit_mul(t104, t109); // Fp2 Inv y real part end
    let t111 = circuit_mul(t105, t109);
    let t112 = circuit_sub(in0, t111); // Fp2 Inv y imag part end
    let t113 = circuit_mul(t102, t110); // Fp2 mul start
    let t114 = circuit_mul(t103, t112);
    let t115 = circuit_sub(t113, t114); // Fp2 mul real part end
    let t116 = circuit_mul(t102, t112);
    let t117 = circuit_mul(t103, t110);
    let t118 = circuit_add(t116, t117); // Fp2 mul imag part end
    let t119 = circuit_add(t81, t115); // Fp2 add coeff 0/1
    let t120 = circuit_add(t84, t118); // Fp2 add coeff 1/1
    let t121 = circuit_sub(in0, t119); // Fp2 neg coeff 0/1
    let t122 = circuit_sub(in0, t120); // Fp2 neg coeff 1/1
    let t123 = circuit_add(t121, t122);
    let t124 = circuit_sub(t121, t122);
    let t125 = circuit_mul(t123, t124);
    let t126 = circuit_mul(t121, t122);
    let t127 = circuit_add(t126, t126);
    let t128 = circuit_sub(t125, in23); // Fp2 sub coeff 0/1
    let t129 = circuit_sub(t127, in24); // Fp2 sub coeff 1/1
    let t130 = circuit_sub(t128, t92); // Fp2 sub coeff 0/1
    let t131 = circuit_sub(t129, t93); // Fp2 sub coeff 1/1
    let t132 = circuit_sub(in23, t130); // Fp2 sub coeff 0/1
    let t133 = circuit_sub(in24, t131); // Fp2 sub coeff 1/1
    let t134 = circuit_mul(t121, t132); // Fp2 mul start
    let t135 = circuit_mul(t122, t133);
    let t136 = circuit_sub(t134, t135); // Fp2 mul real part end
    let t137 = circuit_mul(t121, t133);
    let t138 = circuit_mul(t122, t132);
    let t139 = circuit_add(t137, t138); // Fp2 mul imag part end
    let t140 = circuit_sub(t136, in25); // Fp2 sub coeff 0/1
    let t141 = circuit_sub(t139, in26); // Fp2 sub coeff 1/1
    let t142 = circuit_mul(t121, in23); // Fp2 mul start
    let t143 = circuit_mul(t122, in24);
    let t144 = circuit_sub(t142, t143); // Fp2 mul real part end
    let t145 = circuit_mul(t121, in24);
    let t146 = circuit_mul(t122, in23);
    let t147 = circuit_add(t145, t146); // Fp2 mul imag part end
    let t148 = circuit_sub(t144, in25); // Fp2 sub coeff 0/1
    let t149 = circuit_sub(t147, in26); // Fp2 sub coeff 1/1
    let t150 = circuit_sub(t100, t101);
    let t151 = circuit_mul(t150, in21); // eval bls line by yInv
    let t152 = circuit_sub(t81, t84);
    let t153 = circuit_mul(t152, in22); // eval blsline by xNegOverY
    let t154 = circuit_mul(t101, in21); // eval bls line by yInv
    let t155 = circuit_mul(t84, in22); // eval bls line by xNegOverY
    let t156 = circuit_sub(t148, t149);
    let t157 = circuit_mul(t156, in21); // eval bls line by yInv
    let t158 = circuit_sub(t121, t122);
    let t159 = circuit_mul(t158, in22); // eval blsline by xNegOverY
    let t160 = circuit_mul(t149, in21); // eval bls line by yInv
    let t161 = circuit_mul(t122, in22); // eval bls line by xNegOverY
    let t162 = circuit_mul(t153, t0); // Eval sparse poly line_2p_1 step coeff_2 * z^2
    let t163 = circuit_add(t151, t162); // Eval sparse poly line_2p_1 step + coeff_2 * z^2
    let t164 = circuit_add(t163, t1); // Eval sparse poly line_2p_1 step + 1*z^3
    let t165 = circuit_mul(t154, t4); // Eval sparse poly line_2p_1 step coeff_6 * z^6
    let t166 = circuit_add(t164, t165); // Eval sparse poly line_2p_1 step + coeff_6 * z^6
    let t167 = circuit_mul(t155, t6); // Eval sparse poly line_2p_1 step coeff_8 * z^8
    let t168 = circuit_add(t166, t167); // Eval sparse poly line_2p_1 step + coeff_8 * z^8
    let t169 = circuit_mul(t67, t168); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t170 = circuit_mul(t159, t0); // Eval sparse poly line_2p_2 step coeff_2 * z^2
    let t171 = circuit_add(t157, t170); // Eval sparse poly line_2p_2 step + coeff_2 * z^2
    let t172 = circuit_add(t171, t1); // Eval sparse poly line_2p_2 step + 1*z^3
    let t173 = circuit_mul(t160, t4); // Eval sparse poly line_2p_2 step coeff_6 * z^6
    let t174 = circuit_add(t172, t173); // Eval sparse poly line_2p_2 step + coeff_6 * z^6
    let t175 = circuit_mul(t161, t6); // Eval sparse poly line_2p_2 step coeff_8 * z^8
    let t176 = circuit_add(t174, t175); // Eval sparse poly line_2p_2 step + coeff_8 * z^8
    let t177 = circuit_mul(t169, t176); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t178 = circuit_mul(t177, in45);
    let t179 = circuit_mul(in34, in46); // Eval f_i+1 step coeff_1 * z^1
    let t180 = circuit_add(in33, t179); // Eval f_i+1 step + (coeff_1 * z^1)
    let t181 = circuit_mul(in35, t0); // Eval f_i+1 step coeff_2 * z^2
    let t182 = circuit_add(t180, t181); // Eval f_i+1 step + (coeff_2 * z^2)
    let t183 = circuit_mul(in36, t1); // Eval f_i+1 step coeff_3 * z^3
    let t184 = circuit_add(t182, t183); // Eval f_i+1 step + (coeff_3 * z^3)
    let t185 = circuit_mul(in37, t2); // Eval f_i+1 step coeff_4 * z^4
    let t186 = circuit_add(t184, t185); // Eval f_i+1 step + (coeff_4 * z^4)
    let t187 = circuit_mul(in38, t3); // Eval f_i+1 step coeff_5 * z^5
    let t188 = circuit_add(t186, t187); // Eval f_i+1 step + (coeff_5 * z^5)
    let t189 = circuit_mul(in39, t4); // Eval f_i+1 step coeff_6 * z^6
    let t190 = circuit_add(t188, t189); // Eval f_i+1 step + (coeff_6 * z^6)
    let t191 = circuit_mul(in40, t5); // Eval f_i+1 step coeff_7 * z^7
    let t192 = circuit_add(t190, t191); // Eval f_i+1 step + (coeff_7 * z^7)
    let t193 = circuit_mul(in41, t6); // Eval f_i+1 step coeff_8 * z^8
    let t194 = circuit_add(t192, t193); // Eval f_i+1 step + (coeff_8 * z^8)
    let t195 = circuit_mul(in42, t7); // Eval f_i+1 step coeff_9 * z^9
    let t196 = circuit_add(t194, t195); // Eval f_i+1 step + (coeff_9 * z^9)
    let t197 = circuit_mul(in43, t8); // Eval f_i+1 step coeff_10 * z^10
    let t198 = circuit_add(t196, t197); // Eval f_i+1 step + (coeff_10 * z^10)
    let t199 = circuit_mul(in44, t9); // Eval f_i+1 step coeff_11 * z^11
    let t200 = circuit_add(t198, t199); // Eval f_i+1 step + (coeff_11 * z^11)
    let t201 = circuit_sub(t178, t200); // (Π(i,k) (Pk(z))) - Ri(z)
    let t202 = circuit_mul(t10, t201); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t203 = circuit_add(in31, t202); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t130, t131, t140, t141, t200, t203, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in0
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in1
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in2
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in6
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r0a0); // in7
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r0a1); // in8
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r1a0); // in9
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r1a1); // in10
    circuit_inputs = circuit_inputs.next(yInv_1); // in11
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in16
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r0a0); // in17
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r0a1); // in18
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r1a0); // in19
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r1a1); // in20
    circuit_inputs = circuit_inputs.next(yInv_2); // in21
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in22
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in23
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in24
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in25
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in26
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_2.x0); // in27
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_2.x1); // in28
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_2.y0); // in29
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_2.y1); // in30
    circuit_inputs = circuit_inputs.next(lhs_i); // in31
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in33
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in34
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in35
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in36
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in37
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in38
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in39
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in40
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in41
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in42
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in43
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in44
    circuit_inputs = circuit_inputs.next(c_or_cinv_of_z); // in45
    circuit_inputs = circuit_inputs.next(z); // in46
    circuit_inputs = circuit_inputs.next(ci); // in47

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let Q0: G2Point = G2Point {
        x0: outputs.get_output(t130),
        x1: outputs.get_output(t131),
        y0: outputs.get_output(t140),
        y1: outputs.get_output(t141)
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t200);
    let lhs_i_plus_one: u384 = outputs.get_output(t203);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (Q0, f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BLS12_381_MP_CHECK_FINALIZE_BLS_2P_circuit(
    R_n_minus_1: E12D,
    c_n_minus_2: u384,
    w_of_z: u384,
    z: u384,
    c_inv_frob_1_of_z: u384,
    previous_lhs: u384,
    R_n_minus_2_of_z: u384,
    Q: Array<u384>
) -> (u384,) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x2
    let in1 = CE::<CI<1>> {}; // -0x2 % p

    // INPUT stack
    let (in2, in3, in4) = (CE::<CI<2>> {}, CE::<CI<3>> {}, CE::<CI<4>> {});
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let (in38, in39, in40) = (CE::<CI<38>> {}, CE::<CI<39>> {}, CE::<CI<40>> {});
    let (in41, in42, in43) = (CE::<CI<41>> {}, CE::<CI<42>> {}, CE::<CI<43>> {});
    let (in44, in45, in46) = (CE::<CI<44>> {}, CE::<CI<45>> {}, CE::<CI<46>> {});
    let (in47, in48, in49) = (CE::<CI<47>> {}, CE::<CI<48>> {}, CE::<CI<49>> {});
    let (in50, in51, in52) = (CE::<CI<50>> {}, CE::<CI<51>> {}, CE::<CI<52>> {});
    let (in53, in54, in55) = (CE::<CI<53>> {}, CE::<CI<54>> {}, CE::<CI<55>> {});
    let (in56, in57, in58) = (CE::<CI<56>> {}, CE::<CI<57>> {}, CE::<CI<58>> {});
    let (in59, in60, in61) = (CE::<CI<59>> {}, CE::<CI<60>> {}, CE::<CI<61>> {});
    let (in62, in63, in64) = (CE::<CI<62>> {}, CE::<CI<63>> {}, CE::<CI<64>> {});
    let (in65, in66, in67) = (CE::<CI<65>> {}, CE::<CI<66>> {}, CE::<CI<67>> {});
    let (in68, in69, in70) = (CE::<CI<68>> {}, CE::<CI<69>> {}, CE::<CI<70>> {});
    let (in71, in72, in73) = (CE::<CI<71>> {}, CE::<CI<72>> {}, CE::<CI<73>> {});
    let (in74, in75, in76) = (CE::<CI<74>> {}, CE::<CI<75>> {}, CE::<CI<76>> {});
    let (in77, in78, in79) = (CE::<CI<77>> {}, CE::<CI<78>> {}, CE::<CI<79>> {});
    let (in80, in81, in82) = (CE::<CI<80>> {}, CE::<CI<81>> {}, CE::<CI<82>> {});
    let (in83, in84, in85) = (CE::<CI<83>> {}, CE::<CI<84>> {}, CE::<CI<85>> {});
    let (in86, in87, in88) = (CE::<CI<86>> {}, CE::<CI<87>> {}, CE::<CI<88>> {});
    let (in89, in90, in91) = (CE::<CI<89>> {}, CE::<CI<90>> {}, CE::<CI<91>> {});
    let (in92, in93, in94) = (CE::<CI<92>> {}, CE::<CI<93>> {}, CE::<CI<94>> {});
    let (in95, in96, in97) = (CE::<CI<95>> {}, CE::<CI<96>> {}, CE::<CI<97>> {});
    let (in98, in99, in100) = (CE::<CI<98>> {}, CE::<CI<99>> {}, CE::<CI<100>> {});
    let t0 = circuit_mul(in16, in16); // Compute z^2
    let t1 = circuit_mul(t0, in16); // Compute z^3
    let t2 = circuit_mul(t1, in16); // Compute z^4
    let t3 = circuit_mul(t2, in16); // Compute z^5
    let t4 = circuit_mul(t3, in16); // Compute z^6
    let t5 = circuit_mul(t4, in16); // Compute z^7
    let t6 = circuit_mul(t5, in16); // Compute z^8
    let t7 = circuit_mul(t6, in16); // Compute z^9
    let t8 = circuit_mul(t7, in16); // Compute z^10
    let t9 = circuit_mul(t8, in16); // Compute z^11
    let t10 = circuit_mul(t9, in16); // Compute z^12
    let t11 = circuit_mul(t10, in16); // Compute z^13
    let t12 = circuit_mul(t11, in16); // Compute z^14
    let t13 = circuit_mul(t12, in16); // Compute z^15
    let t14 = circuit_mul(t13, in16); // Compute z^16
    let t15 = circuit_mul(t14, in16); // Compute z^17
    let t16 = circuit_mul(t15, in16); // Compute z^18
    let t17 = circuit_mul(t16, in16); // Compute z^19
    let t18 = circuit_mul(t17, in16); // Compute z^20
    let t19 = circuit_mul(t18, in16); // Compute z^21
    let t20 = circuit_mul(t19, in16); // Compute z^22
    let t21 = circuit_mul(t20, in16); // Compute z^23
    let t22 = circuit_mul(t21, in16); // Compute z^24
    let t23 = circuit_mul(t22, in16); // Compute z^25
    let t24 = circuit_mul(t23, in16); // Compute z^26
    let t25 = circuit_mul(t24, in16); // Compute z^27
    let t26 = circuit_mul(t25, in16); // Compute z^28
    let t27 = circuit_mul(t26, in16); // Compute z^29
    let t28 = circuit_mul(t27, in16); // Compute z^30
    let t29 = circuit_mul(t28, in16); // Compute z^31
    let t30 = circuit_mul(t29, in16); // Compute z^32
    let t31 = circuit_mul(t30, in16); // Compute z^33
    let t32 = circuit_mul(t31, in16); // Compute z^34
    let t33 = circuit_mul(t32, in16); // Compute z^35
    let t34 = circuit_mul(t33, in16); // Compute z^36
    let t35 = circuit_mul(t34, in16); // Compute z^37
    let t36 = circuit_mul(t35, in16); // Compute z^38
    let t37 = circuit_mul(t36, in16); // Compute z^39
    let t38 = circuit_mul(t37, in16); // Compute z^40
    let t39 = circuit_mul(t38, in16); // Compute z^41
    let t40 = circuit_mul(t39, in16); // Compute z^42
    let t41 = circuit_mul(t40, in16); // Compute z^43
    let t42 = circuit_mul(t41, in16); // Compute z^44
    let t43 = circuit_mul(t42, in16); // Compute z^45
    let t44 = circuit_mul(t43, in16); // Compute z^46
    let t45 = circuit_mul(t44, in16); // Compute z^47
    let t46 = circuit_mul(t45, in16); // Compute z^48
    let t47 = circuit_mul(t46, in16); // Compute z^49
    let t48 = circuit_mul(t47, in16); // Compute z^50
    let t49 = circuit_mul(t48, in16); // Compute z^51
    let t50 = circuit_mul(t49, in16); // Compute z^52
    let t51 = circuit_mul(t50, in16); // Compute z^53
    let t52 = circuit_mul(t51, in16); // Compute z^54
    let t53 = circuit_mul(t52, in16); // Compute z^55
    let t54 = circuit_mul(t53, in16); // Compute z^56
    let t55 = circuit_mul(t54, in16); // Compute z^57
    let t56 = circuit_mul(t55, in16); // Compute z^58
    let t57 = circuit_mul(t56, in16); // Compute z^59
    let t58 = circuit_mul(t57, in16); // Compute z^60
    let t59 = circuit_mul(t58, in16); // Compute z^61
    let t60 = circuit_mul(t59, in16); // Compute z^62
    let t61 = circuit_mul(t60, in16); // Compute z^63
    let t62 = circuit_mul(t61, in16); // Compute z^64
    let t63 = circuit_mul(t62, in16); // Compute z^65
    let t64 = circuit_mul(t63, in16); // Compute z^66
    let t65 = circuit_mul(t64, in16); // Compute z^67
    let t66 = circuit_mul(t65, in16); // Compute z^68
    let t67 = circuit_mul(t66, in16); // Compute z^69
    let t68 = circuit_mul(t67, in16); // Compute z^70
    let t69 = circuit_mul(t68, in16); // Compute z^71
    let t70 = circuit_mul(t69, in16); // Compute z^72
    let t71 = circuit_mul(t70, in16); // Compute z^73
    let t72 = circuit_mul(t71, in16); // Compute z^74
    let t73 = circuit_mul(t72, in16); // Compute z^75
    let t74 = circuit_mul(t73, in16); // Compute z^76
    let t75 = circuit_mul(t74, in16); // Compute z^77
    let t76 = circuit_mul(t75, in16); // Compute z^78
    let t77 = circuit_mul(t76, in16); // Compute z^79
    let t78 = circuit_mul(t77, in16); // Compute z^80
    let t79 = circuit_mul(in14, in14);
    let t80 = circuit_mul(in3, in16); // Eval R_n_minus_1 step coeff_1 * z^1
    let t81 = circuit_add(in2, t80); // Eval R_n_minus_1 step + (coeff_1 * z^1)
    let t82 = circuit_mul(in4, t0); // Eval R_n_minus_1 step coeff_2 * z^2
    let t83 = circuit_add(t81, t82); // Eval R_n_minus_1 step + (coeff_2 * z^2)
    let t84 = circuit_mul(in5, t1); // Eval R_n_minus_1 step coeff_3 * z^3
    let t85 = circuit_add(t83, t84); // Eval R_n_minus_1 step + (coeff_3 * z^3)
    let t86 = circuit_mul(in6, t2); // Eval R_n_minus_1 step coeff_4 * z^4
    let t87 = circuit_add(t85, t86); // Eval R_n_minus_1 step + (coeff_4 * z^4)
    let t88 = circuit_mul(in7, t3); // Eval R_n_minus_1 step coeff_5 * z^5
    let t89 = circuit_add(t87, t88); // Eval R_n_minus_1 step + (coeff_5 * z^5)
    let t90 = circuit_mul(in8, t4); // Eval R_n_minus_1 step coeff_6 * z^6
    let t91 = circuit_add(t89, t90); // Eval R_n_minus_1 step + (coeff_6 * z^6)
    let t92 = circuit_mul(in9, t5); // Eval R_n_minus_1 step coeff_7 * z^7
    let t93 = circuit_add(t91, t92); // Eval R_n_minus_1 step + (coeff_7 * z^7)
    let t94 = circuit_mul(in10, t6); // Eval R_n_minus_1 step coeff_8 * z^8
    let t95 = circuit_add(t93, t94); // Eval R_n_minus_1 step + (coeff_8 * z^8)
    let t96 = circuit_mul(in11, t7); // Eval R_n_minus_1 step coeff_9 * z^9
    let t97 = circuit_add(t95, t96); // Eval R_n_minus_1 step + (coeff_9 * z^9)
    let t98 = circuit_mul(in12, t8); // Eval R_n_minus_1 step coeff_10 * z^10
    let t99 = circuit_add(t97, t98); // Eval R_n_minus_1 step + (coeff_10 * z^10)
    let t100 = circuit_mul(in13, t9); // Eval R_n_minus_1 step coeff_11 * z^11
    let t101 = circuit_add(t99, t100); // Eval R_n_minus_1 step + (coeff_11 * z^11)
    let t102 = circuit_mul(in19, in17);
    let t103 = circuit_mul(t102, in15);
    let t104 = circuit_sub(t103, t101);
    let t105 = circuit_mul(t79, t104); // c_n_minus_1 * ((Π(n-1,k) (Pk(z)) - R_n_minus_1(z))
    let t106 = circuit_add(in18, t105); // previous_lhs + lhs_n_minus_1
    let t107 = circuit_mul(in1, t4); // Eval sparse poly P_irr step coeff_6 * z^6
    let t108 = circuit_add(in0, t107); // Eval sparse poly P_irr step + coeff_6 * z^6
    let t109 = circuit_add(t108, t10); // Eval sparse poly P_irr step + 1*z^12
    let t110 = circuit_mul(in21, in16); // Eval big_Q step coeff_1 * z^1
    let t111 = circuit_add(in20, t110); // Eval big_Q step + (coeff_1 * z^1)
    let t112 = circuit_mul(in22, t0); // Eval big_Q step coeff_2 * z^2
    let t113 = circuit_add(t111, t112); // Eval big_Q step + (coeff_2 * z^2)
    let t114 = circuit_mul(in23, t1); // Eval big_Q step coeff_3 * z^3
    let t115 = circuit_add(t113, t114); // Eval big_Q step + (coeff_3 * z^3)
    let t116 = circuit_mul(in24, t2); // Eval big_Q step coeff_4 * z^4
    let t117 = circuit_add(t115, t116); // Eval big_Q step + (coeff_4 * z^4)
    let t118 = circuit_mul(in25, t3); // Eval big_Q step coeff_5 * z^5
    let t119 = circuit_add(t117, t118); // Eval big_Q step + (coeff_5 * z^5)
    let t120 = circuit_mul(in26, t4); // Eval big_Q step coeff_6 * z^6
    let t121 = circuit_add(t119, t120); // Eval big_Q step + (coeff_6 * z^6)
    let t122 = circuit_mul(in27, t5); // Eval big_Q step coeff_7 * z^7
    let t123 = circuit_add(t121, t122); // Eval big_Q step + (coeff_7 * z^7)
    let t124 = circuit_mul(in28, t6); // Eval big_Q step coeff_8 * z^8
    let t125 = circuit_add(t123, t124); // Eval big_Q step + (coeff_8 * z^8)
    let t126 = circuit_mul(in29, t7); // Eval big_Q step coeff_9 * z^9
    let t127 = circuit_add(t125, t126); // Eval big_Q step + (coeff_9 * z^9)
    let t128 = circuit_mul(in30, t8); // Eval big_Q step coeff_10 * z^10
    let t129 = circuit_add(t127, t128); // Eval big_Q step + (coeff_10 * z^10)
    let t130 = circuit_mul(in31, t9); // Eval big_Q step coeff_11 * z^11
    let t131 = circuit_add(t129, t130); // Eval big_Q step + (coeff_11 * z^11)
    let t132 = circuit_mul(in32, t10); // Eval big_Q step coeff_12 * z^12
    let t133 = circuit_add(t131, t132); // Eval big_Q step + (coeff_12 * z^12)
    let t134 = circuit_mul(in33, t11); // Eval big_Q step coeff_13 * z^13
    let t135 = circuit_add(t133, t134); // Eval big_Q step + (coeff_13 * z^13)
    let t136 = circuit_mul(in34, t12); // Eval big_Q step coeff_14 * z^14
    let t137 = circuit_add(t135, t136); // Eval big_Q step + (coeff_14 * z^14)
    let t138 = circuit_mul(in35, t13); // Eval big_Q step coeff_15 * z^15
    let t139 = circuit_add(t137, t138); // Eval big_Q step + (coeff_15 * z^15)
    let t140 = circuit_mul(in36, t14); // Eval big_Q step coeff_16 * z^16
    let t141 = circuit_add(t139, t140); // Eval big_Q step + (coeff_16 * z^16)
    let t142 = circuit_mul(in37, t15); // Eval big_Q step coeff_17 * z^17
    let t143 = circuit_add(t141, t142); // Eval big_Q step + (coeff_17 * z^17)
    let t144 = circuit_mul(in38, t16); // Eval big_Q step coeff_18 * z^18
    let t145 = circuit_add(t143, t144); // Eval big_Q step + (coeff_18 * z^18)
    let t146 = circuit_mul(in39, t17); // Eval big_Q step coeff_19 * z^19
    let t147 = circuit_add(t145, t146); // Eval big_Q step + (coeff_19 * z^19)
    let t148 = circuit_mul(in40, t18); // Eval big_Q step coeff_20 * z^20
    let t149 = circuit_add(t147, t148); // Eval big_Q step + (coeff_20 * z^20)
    let t150 = circuit_mul(in41, t19); // Eval big_Q step coeff_21 * z^21
    let t151 = circuit_add(t149, t150); // Eval big_Q step + (coeff_21 * z^21)
    let t152 = circuit_mul(in42, t20); // Eval big_Q step coeff_22 * z^22
    let t153 = circuit_add(t151, t152); // Eval big_Q step + (coeff_22 * z^22)
    let t154 = circuit_mul(in43, t21); // Eval big_Q step coeff_23 * z^23
    let t155 = circuit_add(t153, t154); // Eval big_Q step + (coeff_23 * z^23)
    let t156 = circuit_mul(in44, t22); // Eval big_Q step coeff_24 * z^24
    let t157 = circuit_add(t155, t156); // Eval big_Q step + (coeff_24 * z^24)
    let t158 = circuit_mul(in45, t23); // Eval big_Q step coeff_25 * z^25
    let t159 = circuit_add(t157, t158); // Eval big_Q step + (coeff_25 * z^25)
    let t160 = circuit_mul(in46, t24); // Eval big_Q step coeff_26 * z^26
    let t161 = circuit_add(t159, t160); // Eval big_Q step + (coeff_26 * z^26)
    let t162 = circuit_mul(in47, t25); // Eval big_Q step coeff_27 * z^27
    let t163 = circuit_add(t161, t162); // Eval big_Q step + (coeff_27 * z^27)
    let t164 = circuit_mul(in48, t26); // Eval big_Q step coeff_28 * z^28
    let t165 = circuit_add(t163, t164); // Eval big_Q step + (coeff_28 * z^28)
    let t166 = circuit_mul(in49, t27); // Eval big_Q step coeff_29 * z^29
    let t167 = circuit_add(t165, t166); // Eval big_Q step + (coeff_29 * z^29)
    let t168 = circuit_mul(in50, t28); // Eval big_Q step coeff_30 * z^30
    let t169 = circuit_add(t167, t168); // Eval big_Q step + (coeff_30 * z^30)
    let t170 = circuit_mul(in51, t29); // Eval big_Q step coeff_31 * z^31
    let t171 = circuit_add(t169, t170); // Eval big_Q step + (coeff_31 * z^31)
    let t172 = circuit_mul(in52, t30); // Eval big_Q step coeff_32 * z^32
    let t173 = circuit_add(t171, t172); // Eval big_Q step + (coeff_32 * z^32)
    let t174 = circuit_mul(in53, t31); // Eval big_Q step coeff_33 * z^33
    let t175 = circuit_add(t173, t174); // Eval big_Q step + (coeff_33 * z^33)
    let t176 = circuit_mul(in54, t32); // Eval big_Q step coeff_34 * z^34
    let t177 = circuit_add(t175, t176); // Eval big_Q step + (coeff_34 * z^34)
    let t178 = circuit_mul(in55, t33); // Eval big_Q step coeff_35 * z^35
    let t179 = circuit_add(t177, t178); // Eval big_Q step + (coeff_35 * z^35)
    let t180 = circuit_mul(in56, t34); // Eval big_Q step coeff_36 * z^36
    let t181 = circuit_add(t179, t180); // Eval big_Q step + (coeff_36 * z^36)
    let t182 = circuit_mul(in57, t35); // Eval big_Q step coeff_37 * z^37
    let t183 = circuit_add(t181, t182); // Eval big_Q step + (coeff_37 * z^37)
    let t184 = circuit_mul(in58, t36); // Eval big_Q step coeff_38 * z^38
    let t185 = circuit_add(t183, t184); // Eval big_Q step + (coeff_38 * z^38)
    let t186 = circuit_mul(in59, t37); // Eval big_Q step coeff_39 * z^39
    let t187 = circuit_add(t185, t186); // Eval big_Q step + (coeff_39 * z^39)
    let t188 = circuit_mul(in60, t38); // Eval big_Q step coeff_40 * z^40
    let t189 = circuit_add(t187, t188); // Eval big_Q step + (coeff_40 * z^40)
    let t190 = circuit_mul(in61, t39); // Eval big_Q step coeff_41 * z^41
    let t191 = circuit_add(t189, t190); // Eval big_Q step + (coeff_41 * z^41)
    let t192 = circuit_mul(in62, t40); // Eval big_Q step coeff_42 * z^42
    let t193 = circuit_add(t191, t192); // Eval big_Q step + (coeff_42 * z^42)
    let t194 = circuit_mul(in63, t41); // Eval big_Q step coeff_43 * z^43
    let t195 = circuit_add(t193, t194); // Eval big_Q step + (coeff_43 * z^43)
    let t196 = circuit_mul(in64, t42); // Eval big_Q step coeff_44 * z^44
    let t197 = circuit_add(t195, t196); // Eval big_Q step + (coeff_44 * z^44)
    let t198 = circuit_mul(in65, t43); // Eval big_Q step coeff_45 * z^45
    let t199 = circuit_add(t197, t198); // Eval big_Q step + (coeff_45 * z^45)
    let t200 = circuit_mul(in66, t44); // Eval big_Q step coeff_46 * z^46
    let t201 = circuit_add(t199, t200); // Eval big_Q step + (coeff_46 * z^46)
    let t202 = circuit_mul(in67, t45); // Eval big_Q step coeff_47 * z^47
    let t203 = circuit_add(t201, t202); // Eval big_Q step + (coeff_47 * z^47)
    let t204 = circuit_mul(in68, t46); // Eval big_Q step coeff_48 * z^48
    let t205 = circuit_add(t203, t204); // Eval big_Q step + (coeff_48 * z^48)
    let t206 = circuit_mul(in69, t47); // Eval big_Q step coeff_49 * z^49
    let t207 = circuit_add(t205, t206); // Eval big_Q step + (coeff_49 * z^49)
    let t208 = circuit_mul(in70, t48); // Eval big_Q step coeff_50 * z^50
    let t209 = circuit_add(t207, t208); // Eval big_Q step + (coeff_50 * z^50)
    let t210 = circuit_mul(in71, t49); // Eval big_Q step coeff_51 * z^51
    let t211 = circuit_add(t209, t210); // Eval big_Q step + (coeff_51 * z^51)
    let t212 = circuit_mul(in72, t50); // Eval big_Q step coeff_52 * z^52
    let t213 = circuit_add(t211, t212); // Eval big_Q step + (coeff_52 * z^52)
    let t214 = circuit_mul(in73, t51); // Eval big_Q step coeff_53 * z^53
    let t215 = circuit_add(t213, t214); // Eval big_Q step + (coeff_53 * z^53)
    let t216 = circuit_mul(in74, t52); // Eval big_Q step coeff_54 * z^54
    let t217 = circuit_add(t215, t216); // Eval big_Q step + (coeff_54 * z^54)
    let t218 = circuit_mul(in75, t53); // Eval big_Q step coeff_55 * z^55
    let t219 = circuit_add(t217, t218); // Eval big_Q step + (coeff_55 * z^55)
    let t220 = circuit_mul(in76, t54); // Eval big_Q step coeff_56 * z^56
    let t221 = circuit_add(t219, t220); // Eval big_Q step + (coeff_56 * z^56)
    let t222 = circuit_mul(in77, t55); // Eval big_Q step coeff_57 * z^57
    let t223 = circuit_add(t221, t222); // Eval big_Q step + (coeff_57 * z^57)
    let t224 = circuit_mul(in78, t56); // Eval big_Q step coeff_58 * z^58
    let t225 = circuit_add(t223, t224); // Eval big_Q step + (coeff_58 * z^58)
    let t226 = circuit_mul(in79, t57); // Eval big_Q step coeff_59 * z^59
    let t227 = circuit_add(t225, t226); // Eval big_Q step + (coeff_59 * z^59)
    let t228 = circuit_mul(in80, t58); // Eval big_Q step coeff_60 * z^60
    let t229 = circuit_add(t227, t228); // Eval big_Q step + (coeff_60 * z^60)
    let t230 = circuit_mul(in81, t59); // Eval big_Q step coeff_61 * z^61
    let t231 = circuit_add(t229, t230); // Eval big_Q step + (coeff_61 * z^61)
    let t232 = circuit_mul(in82, t60); // Eval big_Q step coeff_62 * z^62
    let t233 = circuit_add(t231, t232); // Eval big_Q step + (coeff_62 * z^62)
    let t234 = circuit_mul(in83, t61); // Eval big_Q step coeff_63 * z^63
    let t235 = circuit_add(t233, t234); // Eval big_Q step + (coeff_63 * z^63)
    let t236 = circuit_mul(in84, t62); // Eval big_Q step coeff_64 * z^64
    let t237 = circuit_add(t235, t236); // Eval big_Q step + (coeff_64 * z^64)
    let t238 = circuit_mul(in85, t63); // Eval big_Q step coeff_65 * z^65
    let t239 = circuit_add(t237, t238); // Eval big_Q step + (coeff_65 * z^65)
    let t240 = circuit_mul(in86, t64); // Eval big_Q step coeff_66 * z^66
    let t241 = circuit_add(t239, t240); // Eval big_Q step + (coeff_66 * z^66)
    let t242 = circuit_mul(in87, t65); // Eval big_Q step coeff_67 * z^67
    let t243 = circuit_add(t241, t242); // Eval big_Q step + (coeff_67 * z^67)
    let t244 = circuit_mul(in88, t66); // Eval big_Q step coeff_68 * z^68
    let t245 = circuit_add(t243, t244); // Eval big_Q step + (coeff_68 * z^68)
    let t246 = circuit_mul(in89, t67); // Eval big_Q step coeff_69 * z^69
    let t247 = circuit_add(t245, t246); // Eval big_Q step + (coeff_69 * z^69)
    let t248 = circuit_mul(in90, t68); // Eval big_Q step coeff_70 * z^70
    let t249 = circuit_add(t247, t248); // Eval big_Q step + (coeff_70 * z^70)
    let t250 = circuit_mul(in91, t69); // Eval big_Q step coeff_71 * z^71
    let t251 = circuit_add(t249, t250); // Eval big_Q step + (coeff_71 * z^71)
    let t252 = circuit_mul(in92, t70); // Eval big_Q step coeff_72 * z^72
    let t253 = circuit_add(t251, t252); // Eval big_Q step + (coeff_72 * z^72)
    let t254 = circuit_mul(in93, t71); // Eval big_Q step coeff_73 * z^73
    let t255 = circuit_add(t253, t254); // Eval big_Q step + (coeff_73 * z^73)
    let t256 = circuit_mul(in94, t72); // Eval big_Q step coeff_74 * z^74
    let t257 = circuit_add(t255, t256); // Eval big_Q step + (coeff_74 * z^74)
    let t258 = circuit_mul(in95, t73); // Eval big_Q step coeff_75 * z^75
    let t259 = circuit_add(t257, t258); // Eval big_Q step + (coeff_75 * z^75)
    let t260 = circuit_mul(in96, t74); // Eval big_Q step coeff_76 * z^76
    let t261 = circuit_add(t259, t260); // Eval big_Q step + (coeff_76 * z^76)
    let t262 = circuit_mul(in97, t75); // Eval big_Q step coeff_77 * z^77
    let t263 = circuit_add(t261, t262); // Eval big_Q step + (coeff_77 * z^77)
    let t264 = circuit_mul(in98, t76); // Eval big_Q step coeff_78 * z^78
    let t265 = circuit_add(t263, t264); // Eval big_Q step + (coeff_78 * z^78)
    let t266 = circuit_mul(in99, t77); // Eval big_Q step coeff_79 * z^79
    let t267 = circuit_add(t265, t266); // Eval big_Q step + (coeff_79 * z^79)
    let t268 = circuit_mul(in100, t78); // Eval big_Q step coeff_80 * z^80
    let t269 = circuit_add(t267, t268); // Eval big_Q step + (coeff_80 * z^80)
    let t270 = circuit_mul(t269, t109); // Q(z) * P(z)
    let t271 = circuit_sub(t106, t270); // final_lhs - Q(z) * P(z)

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t271,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x2, 0x0, 0x0, 0x0]); // in0
    circuit_inputs = circuit_inputs
        .next(
            [
                0xb153ffffb9feffffffffaaa9,
                0x6730d2a0f6b0f6241eabfffe,
                0x434bacd764774b84f38512bf,
                0x1a0111ea397fe69a4b1ba7b6
            ]
        ); // in1
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w0); // in2
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w1); // in3
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w2); // in4
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w3); // in5
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w4); // in6
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w5); // in7
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w6); // in8
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w7); // in9
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w8); // in10
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w9); // in11
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w10); // in12
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w11); // in13
    circuit_inputs = circuit_inputs.next(c_n_minus_2); // in14
    circuit_inputs = circuit_inputs.next(w_of_z); // in15
    circuit_inputs = circuit_inputs.next(z); // in16
    circuit_inputs = circuit_inputs.next(c_inv_frob_1_of_z); // in17
    circuit_inputs = circuit_inputs.next(previous_lhs); // in18
    circuit_inputs = circuit_inputs.next(R_n_minus_2_of_z); // in19

    let mut Q = Q;
    while let Option::Some(val) = Q.pop_front() {
        circuit_inputs = circuit_inputs.next(val);
    };
    // in20 - in100

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let final_check: u384 = outputs.get_output(t271);
    return (final_check,);
}
fn run_BLS12_381_MP_CHECK_FINALIZE_BLS_3P_circuit(
    R_n_minus_1: E12D,
    c_n_minus_2: u384,
    w_of_z: u384,
    z: u384,
    c_inv_frob_1_of_z: u384,
    previous_lhs: u384,
    R_n_minus_2_of_z: u384,
    Q: Array<u384>
) -> (u384,) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x2
    let in1 = CE::<CI<1>> {}; // -0x2 % p

    // INPUT stack
    let (in2, in3, in4) = (CE::<CI<2>> {}, CE::<CI<3>> {}, CE::<CI<4>> {});
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let (in38, in39, in40) = (CE::<CI<38>> {}, CE::<CI<39>> {}, CE::<CI<40>> {});
    let (in41, in42, in43) = (CE::<CI<41>> {}, CE::<CI<42>> {}, CE::<CI<43>> {});
    let (in44, in45, in46) = (CE::<CI<44>> {}, CE::<CI<45>> {}, CE::<CI<46>> {});
    let (in47, in48, in49) = (CE::<CI<47>> {}, CE::<CI<48>> {}, CE::<CI<49>> {});
    let (in50, in51, in52) = (CE::<CI<50>> {}, CE::<CI<51>> {}, CE::<CI<52>> {});
    let (in53, in54, in55) = (CE::<CI<53>> {}, CE::<CI<54>> {}, CE::<CI<55>> {});
    let (in56, in57, in58) = (CE::<CI<56>> {}, CE::<CI<57>> {}, CE::<CI<58>> {});
    let (in59, in60, in61) = (CE::<CI<59>> {}, CE::<CI<60>> {}, CE::<CI<61>> {});
    let (in62, in63, in64) = (CE::<CI<62>> {}, CE::<CI<63>> {}, CE::<CI<64>> {});
    let (in65, in66, in67) = (CE::<CI<65>> {}, CE::<CI<66>> {}, CE::<CI<67>> {});
    let (in68, in69, in70) = (CE::<CI<68>> {}, CE::<CI<69>> {}, CE::<CI<70>> {});
    let (in71, in72, in73) = (CE::<CI<71>> {}, CE::<CI<72>> {}, CE::<CI<73>> {});
    let (in74, in75, in76) = (CE::<CI<74>> {}, CE::<CI<75>> {}, CE::<CI<76>> {});
    let (in77, in78, in79) = (CE::<CI<77>> {}, CE::<CI<78>> {}, CE::<CI<79>> {});
    let (in80, in81, in82) = (CE::<CI<80>> {}, CE::<CI<81>> {}, CE::<CI<82>> {});
    let (in83, in84, in85) = (CE::<CI<83>> {}, CE::<CI<84>> {}, CE::<CI<85>> {});
    let (in86, in87, in88) = (CE::<CI<86>> {}, CE::<CI<87>> {}, CE::<CI<88>> {});
    let (in89, in90, in91) = (CE::<CI<89>> {}, CE::<CI<90>> {}, CE::<CI<91>> {});
    let (in92, in93, in94) = (CE::<CI<92>> {}, CE::<CI<93>> {}, CE::<CI<94>> {});
    let (in95, in96, in97) = (CE::<CI<95>> {}, CE::<CI<96>> {}, CE::<CI<97>> {});
    let (in98, in99, in100) = (CE::<CI<98>> {}, CE::<CI<99>> {}, CE::<CI<100>> {});
    let (in101, in102, in103) = (CE::<CI<101>> {}, CE::<CI<102>> {}, CE::<CI<103>> {});
    let (in104, in105, in106) = (CE::<CI<104>> {}, CE::<CI<105>> {}, CE::<CI<106>> {});
    let (in107, in108, in109) = (CE::<CI<107>> {}, CE::<CI<108>> {}, CE::<CI<109>> {});
    let (in110, in111, in112) = (CE::<CI<110>> {}, CE::<CI<111>> {}, CE::<CI<112>> {});
    let (in113, in114, in115) = (CE::<CI<113>> {}, CE::<CI<114>> {}, CE::<CI<115>> {});
    let (in116, in117, in118) = (CE::<CI<116>> {}, CE::<CI<117>> {}, CE::<CI<118>> {});
    let (in119, in120, in121) = (CE::<CI<119>> {}, CE::<CI<120>> {}, CE::<CI<121>> {});
    let (in122, in123, in124) = (CE::<CI<122>> {}, CE::<CI<123>> {}, CE::<CI<124>> {});
    let t0 = circuit_mul(in16, in16); // Compute z^2
    let t1 = circuit_mul(t0, in16); // Compute z^3
    let t2 = circuit_mul(t1, in16); // Compute z^4
    let t3 = circuit_mul(t2, in16); // Compute z^5
    let t4 = circuit_mul(t3, in16); // Compute z^6
    let t5 = circuit_mul(t4, in16); // Compute z^7
    let t6 = circuit_mul(t5, in16); // Compute z^8
    let t7 = circuit_mul(t6, in16); // Compute z^9
    let t8 = circuit_mul(t7, in16); // Compute z^10
    let t9 = circuit_mul(t8, in16); // Compute z^11
    let t10 = circuit_mul(t9, in16); // Compute z^12
    let t11 = circuit_mul(t10, in16); // Compute z^13
    let t12 = circuit_mul(t11, in16); // Compute z^14
    let t13 = circuit_mul(t12, in16); // Compute z^15
    let t14 = circuit_mul(t13, in16); // Compute z^16
    let t15 = circuit_mul(t14, in16); // Compute z^17
    let t16 = circuit_mul(t15, in16); // Compute z^18
    let t17 = circuit_mul(t16, in16); // Compute z^19
    let t18 = circuit_mul(t17, in16); // Compute z^20
    let t19 = circuit_mul(t18, in16); // Compute z^21
    let t20 = circuit_mul(t19, in16); // Compute z^22
    let t21 = circuit_mul(t20, in16); // Compute z^23
    let t22 = circuit_mul(t21, in16); // Compute z^24
    let t23 = circuit_mul(t22, in16); // Compute z^25
    let t24 = circuit_mul(t23, in16); // Compute z^26
    let t25 = circuit_mul(t24, in16); // Compute z^27
    let t26 = circuit_mul(t25, in16); // Compute z^28
    let t27 = circuit_mul(t26, in16); // Compute z^29
    let t28 = circuit_mul(t27, in16); // Compute z^30
    let t29 = circuit_mul(t28, in16); // Compute z^31
    let t30 = circuit_mul(t29, in16); // Compute z^32
    let t31 = circuit_mul(t30, in16); // Compute z^33
    let t32 = circuit_mul(t31, in16); // Compute z^34
    let t33 = circuit_mul(t32, in16); // Compute z^35
    let t34 = circuit_mul(t33, in16); // Compute z^36
    let t35 = circuit_mul(t34, in16); // Compute z^37
    let t36 = circuit_mul(t35, in16); // Compute z^38
    let t37 = circuit_mul(t36, in16); // Compute z^39
    let t38 = circuit_mul(t37, in16); // Compute z^40
    let t39 = circuit_mul(t38, in16); // Compute z^41
    let t40 = circuit_mul(t39, in16); // Compute z^42
    let t41 = circuit_mul(t40, in16); // Compute z^43
    let t42 = circuit_mul(t41, in16); // Compute z^44
    let t43 = circuit_mul(t42, in16); // Compute z^45
    let t44 = circuit_mul(t43, in16); // Compute z^46
    let t45 = circuit_mul(t44, in16); // Compute z^47
    let t46 = circuit_mul(t45, in16); // Compute z^48
    let t47 = circuit_mul(t46, in16); // Compute z^49
    let t48 = circuit_mul(t47, in16); // Compute z^50
    let t49 = circuit_mul(t48, in16); // Compute z^51
    let t50 = circuit_mul(t49, in16); // Compute z^52
    let t51 = circuit_mul(t50, in16); // Compute z^53
    let t52 = circuit_mul(t51, in16); // Compute z^54
    let t53 = circuit_mul(t52, in16); // Compute z^55
    let t54 = circuit_mul(t53, in16); // Compute z^56
    let t55 = circuit_mul(t54, in16); // Compute z^57
    let t56 = circuit_mul(t55, in16); // Compute z^58
    let t57 = circuit_mul(t56, in16); // Compute z^59
    let t58 = circuit_mul(t57, in16); // Compute z^60
    let t59 = circuit_mul(t58, in16); // Compute z^61
    let t60 = circuit_mul(t59, in16); // Compute z^62
    let t61 = circuit_mul(t60, in16); // Compute z^63
    let t62 = circuit_mul(t61, in16); // Compute z^64
    let t63 = circuit_mul(t62, in16); // Compute z^65
    let t64 = circuit_mul(t63, in16); // Compute z^66
    let t65 = circuit_mul(t64, in16); // Compute z^67
    let t66 = circuit_mul(t65, in16); // Compute z^68
    let t67 = circuit_mul(t66, in16); // Compute z^69
    let t68 = circuit_mul(t67, in16); // Compute z^70
    let t69 = circuit_mul(t68, in16); // Compute z^71
    let t70 = circuit_mul(t69, in16); // Compute z^72
    let t71 = circuit_mul(t70, in16); // Compute z^73
    let t72 = circuit_mul(t71, in16); // Compute z^74
    let t73 = circuit_mul(t72, in16); // Compute z^75
    let t74 = circuit_mul(t73, in16); // Compute z^76
    let t75 = circuit_mul(t74, in16); // Compute z^77
    let t76 = circuit_mul(t75, in16); // Compute z^78
    let t77 = circuit_mul(t76, in16); // Compute z^79
    let t78 = circuit_mul(t77, in16); // Compute z^80
    let t79 = circuit_mul(t78, in16); // Compute z^81
    let t80 = circuit_mul(t79, in16); // Compute z^82
    let t81 = circuit_mul(t80, in16); // Compute z^83
    let t82 = circuit_mul(t81, in16); // Compute z^84
    let t83 = circuit_mul(t82, in16); // Compute z^85
    let t84 = circuit_mul(t83, in16); // Compute z^86
    let t85 = circuit_mul(t84, in16); // Compute z^87
    let t86 = circuit_mul(t85, in16); // Compute z^88
    let t87 = circuit_mul(t86, in16); // Compute z^89
    let t88 = circuit_mul(t87, in16); // Compute z^90
    let t89 = circuit_mul(t88, in16); // Compute z^91
    let t90 = circuit_mul(t89, in16); // Compute z^92
    let t91 = circuit_mul(t90, in16); // Compute z^93
    let t92 = circuit_mul(t91, in16); // Compute z^94
    let t93 = circuit_mul(t92, in16); // Compute z^95
    let t94 = circuit_mul(t93, in16); // Compute z^96
    let t95 = circuit_mul(t94, in16); // Compute z^97
    let t96 = circuit_mul(t95, in16); // Compute z^98
    let t97 = circuit_mul(t96, in16); // Compute z^99
    let t98 = circuit_mul(t97, in16); // Compute z^100
    let t99 = circuit_mul(t98, in16); // Compute z^101
    let t100 = circuit_mul(t99, in16); // Compute z^102
    let t101 = circuit_mul(t100, in16); // Compute z^103
    let t102 = circuit_mul(t101, in16); // Compute z^104
    let t103 = circuit_mul(in14, in14);
    let t104 = circuit_mul(in3, in16); // Eval R_n_minus_1 step coeff_1 * z^1
    let t105 = circuit_add(in2, t104); // Eval R_n_minus_1 step + (coeff_1 * z^1)
    let t106 = circuit_mul(in4, t0); // Eval R_n_minus_1 step coeff_2 * z^2
    let t107 = circuit_add(t105, t106); // Eval R_n_minus_1 step + (coeff_2 * z^2)
    let t108 = circuit_mul(in5, t1); // Eval R_n_minus_1 step coeff_3 * z^3
    let t109 = circuit_add(t107, t108); // Eval R_n_minus_1 step + (coeff_3 * z^3)
    let t110 = circuit_mul(in6, t2); // Eval R_n_minus_1 step coeff_4 * z^4
    let t111 = circuit_add(t109, t110); // Eval R_n_minus_1 step + (coeff_4 * z^4)
    let t112 = circuit_mul(in7, t3); // Eval R_n_minus_1 step coeff_5 * z^5
    let t113 = circuit_add(t111, t112); // Eval R_n_minus_1 step + (coeff_5 * z^5)
    let t114 = circuit_mul(in8, t4); // Eval R_n_minus_1 step coeff_6 * z^6
    let t115 = circuit_add(t113, t114); // Eval R_n_minus_1 step + (coeff_6 * z^6)
    let t116 = circuit_mul(in9, t5); // Eval R_n_minus_1 step coeff_7 * z^7
    let t117 = circuit_add(t115, t116); // Eval R_n_minus_1 step + (coeff_7 * z^7)
    let t118 = circuit_mul(in10, t6); // Eval R_n_minus_1 step coeff_8 * z^8
    let t119 = circuit_add(t117, t118); // Eval R_n_minus_1 step + (coeff_8 * z^8)
    let t120 = circuit_mul(in11, t7); // Eval R_n_minus_1 step coeff_9 * z^9
    let t121 = circuit_add(t119, t120); // Eval R_n_minus_1 step + (coeff_9 * z^9)
    let t122 = circuit_mul(in12, t8); // Eval R_n_minus_1 step coeff_10 * z^10
    let t123 = circuit_add(t121, t122); // Eval R_n_minus_1 step + (coeff_10 * z^10)
    let t124 = circuit_mul(in13, t9); // Eval R_n_minus_1 step coeff_11 * z^11
    let t125 = circuit_add(t123, t124); // Eval R_n_minus_1 step + (coeff_11 * z^11)
    let t126 = circuit_mul(in19, in17);
    let t127 = circuit_mul(t126, in15);
    let t128 = circuit_sub(t127, t125);
    let t129 = circuit_mul(t103, t128); // c_n_minus_1 * ((Π(n-1,k) (Pk(z)) - R_n_minus_1(z))
    let t130 = circuit_add(in18, t129); // previous_lhs + lhs_n_minus_1
    let t131 = circuit_mul(in1, t4); // Eval sparse poly P_irr step coeff_6 * z^6
    let t132 = circuit_add(in0, t131); // Eval sparse poly P_irr step + coeff_6 * z^6
    let t133 = circuit_add(t132, t10); // Eval sparse poly P_irr step + 1*z^12
    let t134 = circuit_mul(in21, in16); // Eval big_Q step coeff_1 * z^1
    let t135 = circuit_add(in20, t134); // Eval big_Q step + (coeff_1 * z^1)
    let t136 = circuit_mul(in22, t0); // Eval big_Q step coeff_2 * z^2
    let t137 = circuit_add(t135, t136); // Eval big_Q step + (coeff_2 * z^2)
    let t138 = circuit_mul(in23, t1); // Eval big_Q step coeff_3 * z^3
    let t139 = circuit_add(t137, t138); // Eval big_Q step + (coeff_3 * z^3)
    let t140 = circuit_mul(in24, t2); // Eval big_Q step coeff_4 * z^4
    let t141 = circuit_add(t139, t140); // Eval big_Q step + (coeff_4 * z^4)
    let t142 = circuit_mul(in25, t3); // Eval big_Q step coeff_5 * z^5
    let t143 = circuit_add(t141, t142); // Eval big_Q step + (coeff_5 * z^5)
    let t144 = circuit_mul(in26, t4); // Eval big_Q step coeff_6 * z^6
    let t145 = circuit_add(t143, t144); // Eval big_Q step + (coeff_6 * z^6)
    let t146 = circuit_mul(in27, t5); // Eval big_Q step coeff_7 * z^7
    let t147 = circuit_add(t145, t146); // Eval big_Q step + (coeff_7 * z^7)
    let t148 = circuit_mul(in28, t6); // Eval big_Q step coeff_8 * z^8
    let t149 = circuit_add(t147, t148); // Eval big_Q step + (coeff_8 * z^8)
    let t150 = circuit_mul(in29, t7); // Eval big_Q step coeff_9 * z^9
    let t151 = circuit_add(t149, t150); // Eval big_Q step + (coeff_9 * z^9)
    let t152 = circuit_mul(in30, t8); // Eval big_Q step coeff_10 * z^10
    let t153 = circuit_add(t151, t152); // Eval big_Q step + (coeff_10 * z^10)
    let t154 = circuit_mul(in31, t9); // Eval big_Q step coeff_11 * z^11
    let t155 = circuit_add(t153, t154); // Eval big_Q step + (coeff_11 * z^11)
    let t156 = circuit_mul(in32, t10); // Eval big_Q step coeff_12 * z^12
    let t157 = circuit_add(t155, t156); // Eval big_Q step + (coeff_12 * z^12)
    let t158 = circuit_mul(in33, t11); // Eval big_Q step coeff_13 * z^13
    let t159 = circuit_add(t157, t158); // Eval big_Q step + (coeff_13 * z^13)
    let t160 = circuit_mul(in34, t12); // Eval big_Q step coeff_14 * z^14
    let t161 = circuit_add(t159, t160); // Eval big_Q step + (coeff_14 * z^14)
    let t162 = circuit_mul(in35, t13); // Eval big_Q step coeff_15 * z^15
    let t163 = circuit_add(t161, t162); // Eval big_Q step + (coeff_15 * z^15)
    let t164 = circuit_mul(in36, t14); // Eval big_Q step coeff_16 * z^16
    let t165 = circuit_add(t163, t164); // Eval big_Q step + (coeff_16 * z^16)
    let t166 = circuit_mul(in37, t15); // Eval big_Q step coeff_17 * z^17
    let t167 = circuit_add(t165, t166); // Eval big_Q step + (coeff_17 * z^17)
    let t168 = circuit_mul(in38, t16); // Eval big_Q step coeff_18 * z^18
    let t169 = circuit_add(t167, t168); // Eval big_Q step + (coeff_18 * z^18)
    let t170 = circuit_mul(in39, t17); // Eval big_Q step coeff_19 * z^19
    let t171 = circuit_add(t169, t170); // Eval big_Q step + (coeff_19 * z^19)
    let t172 = circuit_mul(in40, t18); // Eval big_Q step coeff_20 * z^20
    let t173 = circuit_add(t171, t172); // Eval big_Q step + (coeff_20 * z^20)
    let t174 = circuit_mul(in41, t19); // Eval big_Q step coeff_21 * z^21
    let t175 = circuit_add(t173, t174); // Eval big_Q step + (coeff_21 * z^21)
    let t176 = circuit_mul(in42, t20); // Eval big_Q step coeff_22 * z^22
    let t177 = circuit_add(t175, t176); // Eval big_Q step + (coeff_22 * z^22)
    let t178 = circuit_mul(in43, t21); // Eval big_Q step coeff_23 * z^23
    let t179 = circuit_add(t177, t178); // Eval big_Q step + (coeff_23 * z^23)
    let t180 = circuit_mul(in44, t22); // Eval big_Q step coeff_24 * z^24
    let t181 = circuit_add(t179, t180); // Eval big_Q step + (coeff_24 * z^24)
    let t182 = circuit_mul(in45, t23); // Eval big_Q step coeff_25 * z^25
    let t183 = circuit_add(t181, t182); // Eval big_Q step + (coeff_25 * z^25)
    let t184 = circuit_mul(in46, t24); // Eval big_Q step coeff_26 * z^26
    let t185 = circuit_add(t183, t184); // Eval big_Q step + (coeff_26 * z^26)
    let t186 = circuit_mul(in47, t25); // Eval big_Q step coeff_27 * z^27
    let t187 = circuit_add(t185, t186); // Eval big_Q step + (coeff_27 * z^27)
    let t188 = circuit_mul(in48, t26); // Eval big_Q step coeff_28 * z^28
    let t189 = circuit_add(t187, t188); // Eval big_Q step + (coeff_28 * z^28)
    let t190 = circuit_mul(in49, t27); // Eval big_Q step coeff_29 * z^29
    let t191 = circuit_add(t189, t190); // Eval big_Q step + (coeff_29 * z^29)
    let t192 = circuit_mul(in50, t28); // Eval big_Q step coeff_30 * z^30
    let t193 = circuit_add(t191, t192); // Eval big_Q step + (coeff_30 * z^30)
    let t194 = circuit_mul(in51, t29); // Eval big_Q step coeff_31 * z^31
    let t195 = circuit_add(t193, t194); // Eval big_Q step + (coeff_31 * z^31)
    let t196 = circuit_mul(in52, t30); // Eval big_Q step coeff_32 * z^32
    let t197 = circuit_add(t195, t196); // Eval big_Q step + (coeff_32 * z^32)
    let t198 = circuit_mul(in53, t31); // Eval big_Q step coeff_33 * z^33
    let t199 = circuit_add(t197, t198); // Eval big_Q step + (coeff_33 * z^33)
    let t200 = circuit_mul(in54, t32); // Eval big_Q step coeff_34 * z^34
    let t201 = circuit_add(t199, t200); // Eval big_Q step + (coeff_34 * z^34)
    let t202 = circuit_mul(in55, t33); // Eval big_Q step coeff_35 * z^35
    let t203 = circuit_add(t201, t202); // Eval big_Q step + (coeff_35 * z^35)
    let t204 = circuit_mul(in56, t34); // Eval big_Q step coeff_36 * z^36
    let t205 = circuit_add(t203, t204); // Eval big_Q step + (coeff_36 * z^36)
    let t206 = circuit_mul(in57, t35); // Eval big_Q step coeff_37 * z^37
    let t207 = circuit_add(t205, t206); // Eval big_Q step + (coeff_37 * z^37)
    let t208 = circuit_mul(in58, t36); // Eval big_Q step coeff_38 * z^38
    let t209 = circuit_add(t207, t208); // Eval big_Q step + (coeff_38 * z^38)
    let t210 = circuit_mul(in59, t37); // Eval big_Q step coeff_39 * z^39
    let t211 = circuit_add(t209, t210); // Eval big_Q step + (coeff_39 * z^39)
    let t212 = circuit_mul(in60, t38); // Eval big_Q step coeff_40 * z^40
    let t213 = circuit_add(t211, t212); // Eval big_Q step + (coeff_40 * z^40)
    let t214 = circuit_mul(in61, t39); // Eval big_Q step coeff_41 * z^41
    let t215 = circuit_add(t213, t214); // Eval big_Q step + (coeff_41 * z^41)
    let t216 = circuit_mul(in62, t40); // Eval big_Q step coeff_42 * z^42
    let t217 = circuit_add(t215, t216); // Eval big_Q step + (coeff_42 * z^42)
    let t218 = circuit_mul(in63, t41); // Eval big_Q step coeff_43 * z^43
    let t219 = circuit_add(t217, t218); // Eval big_Q step + (coeff_43 * z^43)
    let t220 = circuit_mul(in64, t42); // Eval big_Q step coeff_44 * z^44
    let t221 = circuit_add(t219, t220); // Eval big_Q step + (coeff_44 * z^44)
    let t222 = circuit_mul(in65, t43); // Eval big_Q step coeff_45 * z^45
    let t223 = circuit_add(t221, t222); // Eval big_Q step + (coeff_45 * z^45)
    let t224 = circuit_mul(in66, t44); // Eval big_Q step coeff_46 * z^46
    let t225 = circuit_add(t223, t224); // Eval big_Q step + (coeff_46 * z^46)
    let t226 = circuit_mul(in67, t45); // Eval big_Q step coeff_47 * z^47
    let t227 = circuit_add(t225, t226); // Eval big_Q step + (coeff_47 * z^47)
    let t228 = circuit_mul(in68, t46); // Eval big_Q step coeff_48 * z^48
    let t229 = circuit_add(t227, t228); // Eval big_Q step + (coeff_48 * z^48)
    let t230 = circuit_mul(in69, t47); // Eval big_Q step coeff_49 * z^49
    let t231 = circuit_add(t229, t230); // Eval big_Q step + (coeff_49 * z^49)
    let t232 = circuit_mul(in70, t48); // Eval big_Q step coeff_50 * z^50
    let t233 = circuit_add(t231, t232); // Eval big_Q step + (coeff_50 * z^50)
    let t234 = circuit_mul(in71, t49); // Eval big_Q step coeff_51 * z^51
    let t235 = circuit_add(t233, t234); // Eval big_Q step + (coeff_51 * z^51)
    let t236 = circuit_mul(in72, t50); // Eval big_Q step coeff_52 * z^52
    let t237 = circuit_add(t235, t236); // Eval big_Q step + (coeff_52 * z^52)
    let t238 = circuit_mul(in73, t51); // Eval big_Q step coeff_53 * z^53
    let t239 = circuit_add(t237, t238); // Eval big_Q step + (coeff_53 * z^53)
    let t240 = circuit_mul(in74, t52); // Eval big_Q step coeff_54 * z^54
    let t241 = circuit_add(t239, t240); // Eval big_Q step + (coeff_54 * z^54)
    let t242 = circuit_mul(in75, t53); // Eval big_Q step coeff_55 * z^55
    let t243 = circuit_add(t241, t242); // Eval big_Q step + (coeff_55 * z^55)
    let t244 = circuit_mul(in76, t54); // Eval big_Q step coeff_56 * z^56
    let t245 = circuit_add(t243, t244); // Eval big_Q step + (coeff_56 * z^56)
    let t246 = circuit_mul(in77, t55); // Eval big_Q step coeff_57 * z^57
    let t247 = circuit_add(t245, t246); // Eval big_Q step + (coeff_57 * z^57)
    let t248 = circuit_mul(in78, t56); // Eval big_Q step coeff_58 * z^58
    let t249 = circuit_add(t247, t248); // Eval big_Q step + (coeff_58 * z^58)
    let t250 = circuit_mul(in79, t57); // Eval big_Q step coeff_59 * z^59
    let t251 = circuit_add(t249, t250); // Eval big_Q step + (coeff_59 * z^59)
    let t252 = circuit_mul(in80, t58); // Eval big_Q step coeff_60 * z^60
    let t253 = circuit_add(t251, t252); // Eval big_Q step + (coeff_60 * z^60)
    let t254 = circuit_mul(in81, t59); // Eval big_Q step coeff_61 * z^61
    let t255 = circuit_add(t253, t254); // Eval big_Q step + (coeff_61 * z^61)
    let t256 = circuit_mul(in82, t60); // Eval big_Q step coeff_62 * z^62
    let t257 = circuit_add(t255, t256); // Eval big_Q step + (coeff_62 * z^62)
    let t258 = circuit_mul(in83, t61); // Eval big_Q step coeff_63 * z^63
    let t259 = circuit_add(t257, t258); // Eval big_Q step + (coeff_63 * z^63)
    let t260 = circuit_mul(in84, t62); // Eval big_Q step coeff_64 * z^64
    let t261 = circuit_add(t259, t260); // Eval big_Q step + (coeff_64 * z^64)
    let t262 = circuit_mul(in85, t63); // Eval big_Q step coeff_65 * z^65
    let t263 = circuit_add(t261, t262); // Eval big_Q step + (coeff_65 * z^65)
    let t264 = circuit_mul(in86, t64); // Eval big_Q step coeff_66 * z^66
    let t265 = circuit_add(t263, t264); // Eval big_Q step + (coeff_66 * z^66)
    let t266 = circuit_mul(in87, t65); // Eval big_Q step coeff_67 * z^67
    let t267 = circuit_add(t265, t266); // Eval big_Q step + (coeff_67 * z^67)
    let t268 = circuit_mul(in88, t66); // Eval big_Q step coeff_68 * z^68
    let t269 = circuit_add(t267, t268); // Eval big_Q step + (coeff_68 * z^68)
    let t270 = circuit_mul(in89, t67); // Eval big_Q step coeff_69 * z^69
    let t271 = circuit_add(t269, t270); // Eval big_Q step + (coeff_69 * z^69)
    let t272 = circuit_mul(in90, t68); // Eval big_Q step coeff_70 * z^70
    let t273 = circuit_add(t271, t272); // Eval big_Q step + (coeff_70 * z^70)
    let t274 = circuit_mul(in91, t69); // Eval big_Q step coeff_71 * z^71
    let t275 = circuit_add(t273, t274); // Eval big_Q step + (coeff_71 * z^71)
    let t276 = circuit_mul(in92, t70); // Eval big_Q step coeff_72 * z^72
    let t277 = circuit_add(t275, t276); // Eval big_Q step + (coeff_72 * z^72)
    let t278 = circuit_mul(in93, t71); // Eval big_Q step coeff_73 * z^73
    let t279 = circuit_add(t277, t278); // Eval big_Q step + (coeff_73 * z^73)
    let t280 = circuit_mul(in94, t72); // Eval big_Q step coeff_74 * z^74
    let t281 = circuit_add(t279, t280); // Eval big_Q step + (coeff_74 * z^74)
    let t282 = circuit_mul(in95, t73); // Eval big_Q step coeff_75 * z^75
    let t283 = circuit_add(t281, t282); // Eval big_Q step + (coeff_75 * z^75)
    let t284 = circuit_mul(in96, t74); // Eval big_Q step coeff_76 * z^76
    let t285 = circuit_add(t283, t284); // Eval big_Q step + (coeff_76 * z^76)
    let t286 = circuit_mul(in97, t75); // Eval big_Q step coeff_77 * z^77
    let t287 = circuit_add(t285, t286); // Eval big_Q step + (coeff_77 * z^77)
    let t288 = circuit_mul(in98, t76); // Eval big_Q step coeff_78 * z^78
    let t289 = circuit_add(t287, t288); // Eval big_Q step + (coeff_78 * z^78)
    let t290 = circuit_mul(in99, t77); // Eval big_Q step coeff_79 * z^79
    let t291 = circuit_add(t289, t290); // Eval big_Q step + (coeff_79 * z^79)
    let t292 = circuit_mul(in100, t78); // Eval big_Q step coeff_80 * z^80
    let t293 = circuit_add(t291, t292); // Eval big_Q step + (coeff_80 * z^80)
    let t294 = circuit_mul(in101, t79); // Eval big_Q step coeff_81 * z^81
    let t295 = circuit_add(t293, t294); // Eval big_Q step + (coeff_81 * z^81)
    let t296 = circuit_mul(in102, t80); // Eval big_Q step coeff_82 * z^82
    let t297 = circuit_add(t295, t296); // Eval big_Q step + (coeff_82 * z^82)
    let t298 = circuit_mul(in103, t81); // Eval big_Q step coeff_83 * z^83
    let t299 = circuit_add(t297, t298); // Eval big_Q step + (coeff_83 * z^83)
    let t300 = circuit_mul(in104, t82); // Eval big_Q step coeff_84 * z^84
    let t301 = circuit_add(t299, t300); // Eval big_Q step + (coeff_84 * z^84)
    let t302 = circuit_mul(in105, t83); // Eval big_Q step coeff_85 * z^85
    let t303 = circuit_add(t301, t302); // Eval big_Q step + (coeff_85 * z^85)
    let t304 = circuit_mul(in106, t84); // Eval big_Q step coeff_86 * z^86
    let t305 = circuit_add(t303, t304); // Eval big_Q step + (coeff_86 * z^86)
    let t306 = circuit_mul(in107, t85); // Eval big_Q step coeff_87 * z^87
    let t307 = circuit_add(t305, t306); // Eval big_Q step + (coeff_87 * z^87)
    let t308 = circuit_mul(in108, t86); // Eval big_Q step coeff_88 * z^88
    let t309 = circuit_add(t307, t308); // Eval big_Q step + (coeff_88 * z^88)
    let t310 = circuit_mul(in109, t87); // Eval big_Q step coeff_89 * z^89
    let t311 = circuit_add(t309, t310); // Eval big_Q step + (coeff_89 * z^89)
    let t312 = circuit_mul(in110, t88); // Eval big_Q step coeff_90 * z^90
    let t313 = circuit_add(t311, t312); // Eval big_Q step + (coeff_90 * z^90)
    let t314 = circuit_mul(in111, t89); // Eval big_Q step coeff_91 * z^91
    let t315 = circuit_add(t313, t314); // Eval big_Q step + (coeff_91 * z^91)
    let t316 = circuit_mul(in112, t90); // Eval big_Q step coeff_92 * z^92
    let t317 = circuit_add(t315, t316); // Eval big_Q step + (coeff_92 * z^92)
    let t318 = circuit_mul(in113, t91); // Eval big_Q step coeff_93 * z^93
    let t319 = circuit_add(t317, t318); // Eval big_Q step + (coeff_93 * z^93)
    let t320 = circuit_mul(in114, t92); // Eval big_Q step coeff_94 * z^94
    let t321 = circuit_add(t319, t320); // Eval big_Q step + (coeff_94 * z^94)
    let t322 = circuit_mul(in115, t93); // Eval big_Q step coeff_95 * z^95
    let t323 = circuit_add(t321, t322); // Eval big_Q step + (coeff_95 * z^95)
    let t324 = circuit_mul(in116, t94); // Eval big_Q step coeff_96 * z^96
    let t325 = circuit_add(t323, t324); // Eval big_Q step + (coeff_96 * z^96)
    let t326 = circuit_mul(in117, t95); // Eval big_Q step coeff_97 * z^97
    let t327 = circuit_add(t325, t326); // Eval big_Q step + (coeff_97 * z^97)
    let t328 = circuit_mul(in118, t96); // Eval big_Q step coeff_98 * z^98
    let t329 = circuit_add(t327, t328); // Eval big_Q step + (coeff_98 * z^98)
    let t330 = circuit_mul(in119, t97); // Eval big_Q step coeff_99 * z^99
    let t331 = circuit_add(t329, t330); // Eval big_Q step + (coeff_99 * z^99)
    let t332 = circuit_mul(in120, t98); // Eval big_Q step coeff_100 * z^100
    let t333 = circuit_add(t331, t332); // Eval big_Q step + (coeff_100 * z^100)
    let t334 = circuit_mul(in121, t99); // Eval big_Q step coeff_101 * z^101
    let t335 = circuit_add(t333, t334); // Eval big_Q step + (coeff_101 * z^101)
    let t336 = circuit_mul(in122, t100); // Eval big_Q step coeff_102 * z^102
    let t337 = circuit_add(t335, t336); // Eval big_Q step + (coeff_102 * z^102)
    let t338 = circuit_mul(in123, t101); // Eval big_Q step coeff_103 * z^103
    let t339 = circuit_add(t337, t338); // Eval big_Q step + (coeff_103 * z^103)
    let t340 = circuit_mul(in124, t102); // Eval big_Q step coeff_104 * z^104
    let t341 = circuit_add(t339, t340); // Eval big_Q step + (coeff_104 * z^104)
    let t342 = circuit_mul(t341, t133); // Q(z) * P(z)
    let t343 = circuit_sub(t130, t342); // final_lhs - Q(z) * P(z)

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t343,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x2, 0x0, 0x0, 0x0]); // in0
    circuit_inputs = circuit_inputs
        .next(
            [
                0xb153ffffb9feffffffffaaa9,
                0x6730d2a0f6b0f6241eabfffe,
                0x434bacd764774b84f38512bf,
                0x1a0111ea397fe69a4b1ba7b6
            ]
        ); // in1
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w0); // in2
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w1); // in3
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w2); // in4
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w3); // in5
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w4); // in6
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w5); // in7
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w6); // in8
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w7); // in9
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w8); // in10
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w9); // in11
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w10); // in12
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w11); // in13
    circuit_inputs = circuit_inputs.next(c_n_minus_2); // in14
    circuit_inputs = circuit_inputs.next(w_of_z); // in15
    circuit_inputs = circuit_inputs.next(z); // in16
    circuit_inputs = circuit_inputs.next(c_inv_frob_1_of_z); // in17
    circuit_inputs = circuit_inputs.next(previous_lhs); // in18
    circuit_inputs = circuit_inputs.next(R_n_minus_2_of_z); // in19

    let mut Q = Q;
    while let Option::Some(val) = Q.pop_front() {
        circuit_inputs = circuit_inputs.next(val);
    };
    // in20 - in124

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let final_check: u384 = outputs.get_output(t343);
    return (final_check,);
}
fn run_BLS12_381_MP_CHECK_INIT_BIT_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    G2_line_0_2: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    G2_line_1_2: G2Line,
    R_i: E12D,
    c0: u384,
    z: u384,
    c_inv_of_z: u384
) -> (u384, u384) {
    // INPUT stack
    let (in0, in1, in2) = (CE::<CI<0>> {}, CE::<CI<1>> {}, CE::<CI<2>> {});
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let (in27, in28, in29) = (CE::<CI<27>> {}, CE::<CI<28>> {}, CE::<CI<29>> {});
    let (in30, in31, in32) = (CE::<CI<30>> {}, CE::<CI<31>> {}, CE::<CI<32>> {});
    let (in33, in34) = (CE::<CI<33>> {}, CE::<CI<34>> {});
    let t0 = circuit_mul(in33, in33); // Compute z^2
    let t1 = circuit_mul(t0, in33); // Compute z^3
    let t2 = circuit_mul(t1, in33); // Compute z^4
    let t3 = circuit_mul(t2, in33); // Compute z^5
    let t4 = circuit_mul(t3, in33); // Compute z^6
    let t5 = circuit_mul(t4, in33); // Compute z^7
    let t6 = circuit_mul(t5, in33); // Compute z^8
    let t7 = circuit_mul(t6, in33); // Compute z^9
    let t8 = circuit_mul(t7, in33); // Compute z^10
    let t9 = circuit_mul(t8, in33); // Compute z^11
    let t10 = circuit_mul(in21, in33); // Eval R step coeff_1 * z^1
    let t11 = circuit_add(in20, t10); // Eval R step + (coeff_1 * z^1)
    let t12 = circuit_mul(in22, t0); // Eval R step coeff_2 * z^2
    let t13 = circuit_add(t11, t12); // Eval R step + (coeff_2 * z^2)
    let t14 = circuit_mul(in23, t1); // Eval R step coeff_3 * z^3
    let t15 = circuit_add(t13, t14); // Eval R step + (coeff_3 * z^3)
    let t16 = circuit_mul(in24, t2); // Eval R step coeff_4 * z^4
    let t17 = circuit_add(t15, t16); // Eval R step + (coeff_4 * z^4)
    let t18 = circuit_mul(in25, t3); // Eval R step coeff_5 * z^5
    let t19 = circuit_add(t17, t18); // Eval R step + (coeff_5 * z^5)
    let t20 = circuit_mul(in26, t4); // Eval R step coeff_6 * z^6
    let t21 = circuit_add(t19, t20); // Eval R step + (coeff_6 * z^6)
    let t22 = circuit_mul(in27, t5); // Eval R step coeff_7 * z^7
    let t23 = circuit_add(t21, t22); // Eval R step + (coeff_7 * z^7)
    let t24 = circuit_mul(in28, t6); // Eval R step coeff_8 * z^8
    let t25 = circuit_add(t23, t24); // Eval R step + (coeff_8 * z^8)
    let t26 = circuit_mul(in29, t7); // Eval R step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval R step + (coeff_9 * z^9)
    let t28 = circuit_mul(in30, t8); // Eval R step coeff_10 * z^10
    let t29 = circuit_add(t27, t28); // Eval R step + (coeff_10 * z^10)
    let t30 = circuit_mul(in31, t9); // Eval R step coeff_11 * z^11
    let t31 = circuit_add(t29, t30); // Eval R step + (coeff_11 * z^11)
    let t32 = circuit_mul(in34, in34);
    let t33 = circuit_mul(in34, t32);
    let t34 = circuit_sub(in4, in5);
    let t35 = circuit_mul(t34, in0); // eval bls line by yInv
    let t36 = circuit_sub(in2, in3);
    let t37 = circuit_mul(t36, in1); // eval blsline by xNegOverY
    let t38 = circuit_mul(in5, in0); // eval bls line by yInv
    let t39 = circuit_mul(in3, in1); // eval bls line by xNegOverY
    let t40 = circuit_sub(in8, in9);
    let t41 = circuit_mul(t40, in0); // eval bls line by yInv
    let t42 = circuit_sub(in6, in7);
    let t43 = circuit_mul(t42, in1); // eval blsline by xNegOverY
    let t44 = circuit_mul(in9, in0); // eval bls line by yInv
    let t45 = circuit_mul(in7, in1); // eval bls line by xNegOverY
    let t46 = circuit_mul(t37, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t47 = circuit_add(t35, t46); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t48 = circuit_add(t47, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t49 = circuit_mul(t38, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t50 = circuit_add(t48, t49); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t51 = circuit_mul(t39, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t52 = circuit_add(t50, t51); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t53 = circuit_mul(t33, t52);
    let t54 = circuit_mul(t43, t0); // Eval sparse poly line_0p_2 step coeff_2 * z^2
    let t55 = circuit_add(t41, t54); // Eval sparse poly line_0p_2 step + coeff_2 * z^2
    let t56 = circuit_add(t55, t1); // Eval sparse poly line_0p_2 step + 1*z^3
    let t57 = circuit_mul(t44, t4); // Eval sparse poly line_0p_2 step coeff_6 * z^6
    let t58 = circuit_add(t56, t57); // Eval sparse poly line_0p_2 step + coeff_6 * z^6
    let t59 = circuit_mul(t45, t6); // Eval sparse poly line_0p_2 step coeff_8 * z^8
    let t60 = circuit_add(t58, t59); // Eval sparse poly line_0p_2 step + coeff_8 * z^8
    let t61 = circuit_mul(t53, t60);
    let t62 = circuit_sub(in14, in15);
    let t63 = circuit_mul(t62, in10); // eval bls line by yInv
    let t64 = circuit_sub(in12, in13);
    let t65 = circuit_mul(t64, in11); // eval blsline by xNegOverY
    let t66 = circuit_mul(in15, in10); // eval bls line by yInv
    let t67 = circuit_mul(in13, in11); // eval bls line by xNegOverY
    let t68 = circuit_sub(in18, in19);
    let t69 = circuit_mul(t68, in10); // eval bls line by yInv
    let t70 = circuit_sub(in16, in17);
    let t71 = circuit_mul(t70, in11); // eval blsline by xNegOverY
    let t72 = circuit_mul(in19, in10); // eval bls line by yInv
    let t73 = circuit_mul(in17, in11); // eval bls line by xNegOverY
    let t74 = circuit_mul(t65, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t75 = circuit_add(t63, t74); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t76 = circuit_add(t75, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t77 = circuit_mul(t66, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t78 = circuit_add(t76, t77); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t79 = circuit_mul(t67, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t80 = circuit_add(t78, t79); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t81 = circuit_mul(t61, t80);
    let t82 = circuit_mul(t71, t0); // Eval sparse poly line_1p_2 step coeff_2 * z^2
    let t83 = circuit_add(t69, t82); // Eval sparse poly line_1p_2 step + coeff_2 * z^2
    let t84 = circuit_add(t83, t1); // Eval sparse poly line_1p_2 step + 1*z^3
    let t85 = circuit_mul(t72, t4); // Eval sparse poly line_1p_2 step coeff_6 * z^6
    let t86 = circuit_add(t84, t85); // Eval sparse poly line_1p_2 step + coeff_6 * z^6
    let t87 = circuit_mul(t73, t6); // Eval sparse poly line_1p_2 step coeff_8 * z^8
    let t88 = circuit_add(t86, t87); // Eval sparse poly line_1p_2 step + coeff_8 * z^8
    let t89 = circuit_mul(t81, t88);
    let t90 = circuit_sub(t89, t31);
    let t91 = circuit_mul(in32, t90); // ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t91, t31,).new_inputs();
    // Prefill constants:

    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in0
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in1
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in2
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0_2.r0a0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0_2.r0a1); // in7
    circuit_inputs = circuit_inputs.next(G2_line_0_2.r1a0); // in8
    circuit_inputs = circuit_inputs.next(G2_line_0_2.r1a1); // in9
    circuit_inputs = circuit_inputs.next(yInv_1); // in10
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in11
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1_2.r0a0); // in16
    circuit_inputs = circuit_inputs.next(G2_line_1_2.r0a1); // in17
    circuit_inputs = circuit_inputs.next(G2_line_1_2.r1a0); // in18
    circuit_inputs = circuit_inputs.next(G2_line_1_2.r1a1); // in19
    circuit_inputs = circuit_inputs.next(R_i.w0); // in20
    circuit_inputs = circuit_inputs.next(R_i.w1); // in21
    circuit_inputs = circuit_inputs.next(R_i.w2); // in22
    circuit_inputs = circuit_inputs.next(R_i.w3); // in23
    circuit_inputs = circuit_inputs.next(R_i.w4); // in24
    circuit_inputs = circuit_inputs.next(R_i.w5); // in25
    circuit_inputs = circuit_inputs.next(R_i.w6); // in26
    circuit_inputs = circuit_inputs.next(R_i.w7); // in27
    circuit_inputs = circuit_inputs.next(R_i.w8); // in28
    circuit_inputs = circuit_inputs.next(R_i.w9); // in29
    circuit_inputs = circuit_inputs.next(R_i.w10); // in30
    circuit_inputs = circuit_inputs.next(R_i.w11); // in31
    circuit_inputs = circuit_inputs.next(c0); // in32
    circuit_inputs = circuit_inputs.next(z); // in33
    circuit_inputs = circuit_inputs.next(c_inv_of_z); // in34

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let new_lhs: u384 = outputs.get_output(t91);
    let f_i_plus_one_of_z: u384 = outputs.get_output(t31);
    return (new_lhs, f_i_plus_one_of_z);
}
fn run_BLS12_381_MP_CHECK_INIT_BIT_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    G2_line_0_2: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    G2_line_1_2: G2Line,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    R_i: E12D,
    c0: u384,
    z: u384,
    c_inv_of_z: u384
) -> (G2Point, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x3
    let in1 = CE::<CI<1>> {}; // 0x6
    let in2 = CE::<CI<2>> {}; // 0x0

    // INPUT stack
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let (in27, in28, in29) = (CE::<CI<27>> {}, CE::<CI<28>> {}, CE::<CI<29>> {});
    let (in30, in31, in32) = (CE::<CI<30>> {}, CE::<CI<31>> {}, CE::<CI<32>> {});
    let (in33, in34, in35) = (CE::<CI<33>> {}, CE::<CI<34>> {}, CE::<CI<35>> {});
    let (in36, in37, in38) = (CE::<CI<36>> {}, CE::<CI<37>> {}, CE::<CI<38>> {});
    let (in39, in40, in41) = (CE::<CI<39>> {}, CE::<CI<40>> {}, CE::<CI<41>> {});
    let (in42, in43) = (CE::<CI<42>> {}, CE::<CI<43>> {});
    let t0 = circuit_mul(in42, in42); // Compute z^2
    let t1 = circuit_mul(t0, in42); // Compute z^3
    let t2 = circuit_mul(t1, in42); // Compute z^4
    let t3 = circuit_mul(t2, in42); // Compute z^5
    let t4 = circuit_mul(t3, in42); // Compute z^6
    let t5 = circuit_mul(t4, in42); // Compute z^7
    let t6 = circuit_mul(t5, in42); // Compute z^8
    let t7 = circuit_mul(t6, in42); // Compute z^9
    let t8 = circuit_mul(t7, in42); // Compute z^10
    let t9 = circuit_mul(t8, in42); // Compute z^11
    let t10 = circuit_mul(in30, in42); // Eval R step coeff_1 * z^1
    let t11 = circuit_add(in29, t10); // Eval R step + (coeff_1 * z^1)
    let t12 = circuit_mul(in31, t0); // Eval R step coeff_2 * z^2
    let t13 = circuit_add(t11, t12); // Eval R step + (coeff_2 * z^2)
    let t14 = circuit_mul(in32, t1); // Eval R step coeff_3 * z^3
    let t15 = circuit_add(t13, t14); // Eval R step + (coeff_3 * z^3)
    let t16 = circuit_mul(in33, t2); // Eval R step coeff_4 * z^4
    let t17 = circuit_add(t15, t16); // Eval R step + (coeff_4 * z^4)
    let t18 = circuit_mul(in34, t3); // Eval R step coeff_5 * z^5
    let t19 = circuit_add(t17, t18); // Eval R step + (coeff_5 * z^5)
    let t20 = circuit_mul(in35, t4); // Eval R step coeff_6 * z^6
    let t21 = circuit_add(t19, t20); // Eval R step + (coeff_6 * z^6)
    let t22 = circuit_mul(in36, t5); // Eval R step coeff_7 * z^7
    let t23 = circuit_add(t21, t22); // Eval R step + (coeff_7 * z^7)
    let t24 = circuit_mul(in37, t6); // Eval R step coeff_8 * z^8
    let t25 = circuit_add(t23, t24); // Eval R step + (coeff_8 * z^8)
    let t26 = circuit_mul(in38, t7); // Eval R step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval R step + (coeff_9 * z^9)
    let t28 = circuit_mul(in39, t8); // Eval R step coeff_10 * z^10
    let t29 = circuit_add(t27, t28); // Eval R step + (coeff_10 * z^10)
    let t30 = circuit_mul(in40, t9); // Eval R step coeff_11 * z^11
    let t31 = circuit_add(t29, t30); // Eval R step + (coeff_11 * z^11)
    let t32 = circuit_mul(in43, in43);
    let t33 = circuit_mul(in43, t32);
    let t34 = circuit_sub(in7, in8);
    let t35 = circuit_mul(t34, in3); // eval bls line by yInv
    let t36 = circuit_sub(in5, in6);
    let t37 = circuit_mul(t36, in4); // eval blsline by xNegOverY
    let t38 = circuit_mul(in8, in3); // eval bls line by yInv
    let t39 = circuit_mul(in6, in4); // eval bls line by xNegOverY
    let t40 = circuit_sub(in11, in12);
    let t41 = circuit_mul(t40, in3); // eval bls line by yInv
    let t42 = circuit_sub(in9, in10);
    let t43 = circuit_mul(t42, in4); // eval blsline by xNegOverY
    let t44 = circuit_mul(in12, in3); // eval bls line by yInv
    let t45 = circuit_mul(in10, in4); // eval bls line by xNegOverY
    let t46 = circuit_mul(t37, t0); // Eval sparse poly line_0p_1 step coeff_2 * z^2
    let t47 = circuit_add(t35, t46); // Eval sparse poly line_0p_1 step + coeff_2 * z^2
    let t48 = circuit_add(t47, t1); // Eval sparse poly line_0p_1 step + 1*z^3
    let t49 = circuit_mul(t38, t4); // Eval sparse poly line_0p_1 step coeff_6 * z^6
    let t50 = circuit_add(t48, t49); // Eval sparse poly line_0p_1 step + coeff_6 * z^6
    let t51 = circuit_mul(t39, t6); // Eval sparse poly line_0p_1 step coeff_8 * z^8
    let t52 = circuit_add(t50, t51); // Eval sparse poly line_0p_1 step + coeff_8 * z^8
    let t53 = circuit_mul(t33, t52);
    let t54 = circuit_mul(t43, t0); // Eval sparse poly line_0p_2 step coeff_2 * z^2
    let t55 = circuit_add(t41, t54); // Eval sparse poly line_0p_2 step + coeff_2 * z^2
    let t56 = circuit_add(t55, t1); // Eval sparse poly line_0p_2 step + 1*z^3
    let t57 = circuit_mul(t44, t4); // Eval sparse poly line_0p_2 step coeff_6 * z^6
    let t58 = circuit_add(t56, t57); // Eval sparse poly line_0p_2 step + coeff_6 * z^6
    let t59 = circuit_mul(t45, t6); // Eval sparse poly line_0p_2 step coeff_8 * z^8
    let t60 = circuit_add(t58, t59); // Eval sparse poly line_0p_2 step + coeff_8 * z^8
    let t61 = circuit_mul(t53, t60);
    let t62 = circuit_sub(in17, in18);
    let t63 = circuit_mul(t62, in13); // eval bls line by yInv
    let t64 = circuit_sub(in15, in16);
    let t65 = circuit_mul(t64, in14); // eval blsline by xNegOverY
    let t66 = circuit_mul(in18, in13); // eval bls line by yInv
    let t67 = circuit_mul(in16, in14); // eval bls line by xNegOverY
    let t68 = circuit_sub(in21, in22);
    let t69 = circuit_mul(t68, in13); // eval bls line by yInv
    let t70 = circuit_sub(in19, in20);
    let t71 = circuit_mul(t70, in14); // eval blsline by xNegOverY
    let t72 = circuit_mul(in22, in13); // eval bls line by yInv
    let t73 = circuit_mul(in20, in14); // eval bls line by xNegOverY
    let t74 = circuit_mul(t65, t0); // Eval sparse poly line_1p_1 step coeff_2 * z^2
    let t75 = circuit_add(t63, t74); // Eval sparse poly line_1p_1 step + coeff_2 * z^2
    let t76 = circuit_add(t75, t1); // Eval sparse poly line_1p_1 step + 1*z^3
    let t77 = circuit_mul(t66, t4); // Eval sparse poly line_1p_1 step coeff_6 * z^6
    let t78 = circuit_add(t76, t77); // Eval sparse poly line_1p_1 step + coeff_6 * z^6
    let t79 = circuit_mul(t67, t6); // Eval sparse poly line_1p_1 step coeff_8 * z^8
    let t80 = circuit_add(t78, t79); // Eval sparse poly line_1p_1 step + coeff_8 * z^8
    let t81 = circuit_mul(t61, t80);
    let t82 = circuit_mul(t71, t0); // Eval sparse poly line_1p_2 step coeff_2 * z^2
    let t83 = circuit_add(t69, t82); // Eval sparse poly line_1p_2 step + coeff_2 * z^2
    let t84 = circuit_add(t83, t1); // Eval sparse poly line_1p_2 step + 1*z^3
    let t85 = circuit_mul(t72, t4); // Eval sparse poly line_1p_2 step coeff_6 * z^6
    let t86 = circuit_add(t84, t85); // Eval sparse poly line_1p_2 step + coeff_6 * z^6
    let t87 = circuit_mul(t73, t6); // Eval sparse poly line_1p_2 step coeff_8 * z^8
    let t88 = circuit_add(t86, t87); // Eval sparse poly line_1p_2 step + coeff_8 * z^8
    let t89 = circuit_mul(t81, t88);
    let t90 = circuit_add(in25, in26);
    let t91 = circuit_sub(in25, in26);
    let t92 = circuit_mul(t90, t91);
    let t93 = circuit_mul(in25, in26);
    let t94 = circuit_mul(t92, in0);
    let t95 = circuit_mul(t93, in1);
    let t96 = circuit_add(in27, in27); // Fp2 add coeff 0/1
    let t97 = circuit_add(in28, in28); // Fp2 add coeff 1/1
    let t98 = circuit_mul(t96, t96); // Fp2 Div x/y start : Fp2 Inv y start
    let t99 = circuit_mul(t97, t97);
    let t100 = circuit_add(t98, t99);
    let t101 = circuit_inverse(t100);
    let t102 = circuit_mul(t96, t101); // Fp2 Inv y real part end
    let t103 = circuit_mul(t97, t101);
    let t104 = circuit_sub(in2, t103); // Fp2 Inv y imag part end
    let t105 = circuit_mul(t94, t102); // Fp2 mul start
    let t106 = circuit_mul(t95, t104);
    let t107 = circuit_sub(t105, t106); // Fp2 mul real part end
    let t108 = circuit_mul(t94, t104);
    let t109 = circuit_mul(t95, t102);
    let t110 = circuit_add(t108, t109); // Fp2 mul imag part end
    let t111 = circuit_mul(t107, in25); // Fp2 mul start
    let t112 = circuit_mul(t110, in26);
    let t113 = circuit_sub(t111, t112); // Fp2 mul real part end
    let t114 = circuit_mul(t107, in26);
    let t115 = circuit_mul(t110, in25);
    let t116 = circuit_add(t114, t115); // Fp2 mul imag part end
    let t117 = circuit_sub(t113, in27); // Fp2 sub coeff 0/1
    let t118 = circuit_sub(t116, in28); // Fp2 sub coeff 1/1
    let t119 = circuit_add(t107, t110);
    let t120 = circuit_sub(t107, t110);
    let t121 = circuit_mul(t119, t120);
    let t122 = circuit_mul(t107, t110);
    let t123 = circuit_add(t122, t122);
    let t124 = circuit_add(in25, in25); // Fp2 add coeff 0/1
    let t125 = circuit_add(in26, in26); // Fp2 add coeff 1/1
    let t126 = circuit_sub(t121, t124); // Fp2 sub coeff 0/1
    let t127 = circuit_sub(t123, t125); // Fp2 sub coeff 1/1
    let t128 = circuit_sub(in25, t126); // Fp2 sub coeff 0/1
    let t129 = circuit_sub(in26, t127); // Fp2 sub coeff 1/1
    let t130 = circuit_mul(t128, t128); // Fp2 Div x/y start : Fp2 Inv y start
    let t131 = circuit_mul(t129, t129);
    let t132 = circuit_add(t130, t131);
    let t133 = circuit_inverse(t132);
    let t134 = circuit_mul(t128, t133); // Fp2 Inv y real part end
    let t135 = circuit_mul(t129, t133);
    let t136 = circuit_sub(in2, t135); // Fp2 Inv y imag part end
    let t137 = circuit_mul(t96, t134); // Fp2 mul start
    let t138 = circuit_mul(t97, t136);
    let t139 = circuit_sub(t137, t138); // Fp2 mul real part end
    let t140 = circuit_mul(t96, t136);
    let t141 = circuit_mul(t97, t134);
    let t142 = circuit_add(t140, t141); // Fp2 mul imag part end
    let t143 = circuit_sub(t139, t107); // Fp2 sub coeff 0/1
    let t144 = circuit_sub(t142, t110); // Fp2 sub coeff 1/1
    let t145 = circuit_mul(t143, in25); // Fp2 mul start
    let t146 = circuit_mul(t144, in26);
    let t147 = circuit_sub(t145, t146); // Fp2 mul real part end
    let t148 = circuit_mul(t143, in26);
    let t149 = circuit_mul(t144, in25);
    let t150 = circuit_add(t148, t149); // Fp2 mul imag part end
    let t151 = circuit_sub(t147, in27); // Fp2 sub coeff 0/1
    let t152 = circuit_sub(t150, in28); // Fp2 sub coeff 1/1
    let t153 = circuit_add(t143, t144);
    let t154 = circuit_sub(t143, t144);
    let t155 = circuit_mul(t153, t154);
    let t156 = circuit_mul(t143, t144);
    let t157 = circuit_add(t156, t156);
    let t158 = circuit_add(in25, t126); // Fp2 add coeff 0/1
    let t159 = circuit_add(in26, t127); // Fp2 add coeff 1/1
    let t160 = circuit_sub(t155, t158); // Fp2 sub coeff 0/1
    let t161 = circuit_sub(t157, t159); // Fp2 sub coeff 1/1
    let t162 = circuit_sub(in25, t160); // Fp2 sub coeff 0/1
    let t163 = circuit_sub(in26, t161); // Fp2 sub coeff 1/1
    let t164 = circuit_mul(t143, t162); // Fp2 mul start
    let t165 = circuit_mul(t144, t163);
    let t166 = circuit_sub(t164, t165); // Fp2 mul real part end
    let t167 = circuit_mul(t143, t163);
    let t168 = circuit_mul(t144, t162);
    let t169 = circuit_add(t167, t168); // Fp2 mul imag part end
    let t170 = circuit_sub(t166, in27); // Fp2 sub coeff 0/1
    let t171 = circuit_sub(t169, in28); // Fp2 sub coeff 1/1
    let t172 = circuit_sub(t117, t118);
    let t173 = circuit_mul(t172, in23); // eval bls line by yInv
    let t174 = circuit_sub(t107, t110);
    let t175 = circuit_mul(t174, in24); // eval blsline by xNegOverY
    let t176 = circuit_mul(t118, in23); // eval bls line by yInv
    let t177 = circuit_mul(t110, in24); // eval bls line by xNegOverY
    let t178 = circuit_sub(t151, t152);
    let t179 = circuit_mul(t178, in23); // eval bls line by yInv
    let t180 = circuit_sub(t143, t144);
    let t181 = circuit_mul(t180, in24); // eval blsline by xNegOverY
    let t182 = circuit_mul(t152, in23); // eval bls line by yInv
    let t183 = circuit_mul(t144, in24); // eval bls line by xNegOverY
    let t184 = circuit_mul(t175, t0); // Eval sparse poly line_2p_1 step coeff_2 * z^2
    let t185 = circuit_add(t173, t184); // Eval sparse poly line_2p_1 step + coeff_2 * z^2
    let t186 = circuit_add(t185, t1); // Eval sparse poly line_2p_1 step + 1*z^3
    let t187 = circuit_mul(t176, t4); // Eval sparse poly line_2p_1 step coeff_6 * z^6
    let t188 = circuit_add(t186, t187); // Eval sparse poly line_2p_1 step + coeff_6 * z^6
    let t189 = circuit_mul(t177, t6); // Eval sparse poly line_2p_1 step coeff_8 * z^8
    let t190 = circuit_add(t188, t189); // Eval sparse poly line_2p_1 step + coeff_8 * z^8
    let t191 = circuit_mul(t89, t190);
    let t192 = circuit_mul(t181, t0); // Eval sparse poly line_2p_2 step coeff_2 * z^2
    let t193 = circuit_add(t179, t192); // Eval sparse poly line_2p_2 step + coeff_2 * z^2
    let t194 = circuit_add(t193, t1); // Eval sparse poly line_2p_2 step + 1*z^3
    let t195 = circuit_mul(t182, t4); // Eval sparse poly line_2p_2 step coeff_6 * z^6
    let t196 = circuit_add(t194, t195); // Eval sparse poly line_2p_2 step + coeff_6 * z^6
    let t197 = circuit_mul(t183, t6); // Eval sparse poly line_2p_2 step coeff_8 * z^8
    let t198 = circuit_add(t196, t197); // Eval sparse poly line_2p_2 step + coeff_8 * z^8
    let t199 = circuit_mul(t191, t198);
    let t200 = circuit_sub(t199, t31);
    let t201 = circuit_mul(in41, t200); // ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t160, t161, t170, t171, t201, t31,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x3, 0x0, 0x0, 0x0]); // in0
    circuit_inputs = circuit_inputs.next([0x6, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in2
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in3
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in7
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in8
    circuit_inputs = circuit_inputs.next(G2_line_0_2.r0a0); // in9
    circuit_inputs = circuit_inputs.next(G2_line_0_2.r0a1); // in10
    circuit_inputs = circuit_inputs.next(G2_line_0_2.r1a0); // in11
    circuit_inputs = circuit_inputs.next(G2_line_0_2.r1a1); // in12
    circuit_inputs = circuit_inputs.next(yInv_1); // in13
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in16
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in17
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in18
    circuit_inputs = circuit_inputs.next(G2_line_1_2.r0a0); // in19
    circuit_inputs = circuit_inputs.next(G2_line_1_2.r0a1); // in20
    circuit_inputs = circuit_inputs.next(G2_line_1_2.r1a0); // in21
    circuit_inputs = circuit_inputs.next(G2_line_1_2.r1a1); // in22
    circuit_inputs = circuit_inputs.next(yInv_2); // in23
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in24
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in25
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in26
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in27
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in28
    circuit_inputs = circuit_inputs.next(R_i.w0); // in29
    circuit_inputs = circuit_inputs.next(R_i.w1); // in30
    circuit_inputs = circuit_inputs.next(R_i.w2); // in31
    circuit_inputs = circuit_inputs.next(R_i.w3); // in32
    circuit_inputs = circuit_inputs.next(R_i.w4); // in33
    circuit_inputs = circuit_inputs.next(R_i.w5); // in34
    circuit_inputs = circuit_inputs.next(R_i.w6); // in35
    circuit_inputs = circuit_inputs.next(R_i.w7); // in36
    circuit_inputs = circuit_inputs.next(R_i.w8); // in37
    circuit_inputs = circuit_inputs.next(R_i.w9); // in38
    circuit_inputs = circuit_inputs.next(R_i.w10); // in39
    circuit_inputs = circuit_inputs.next(R_i.w11); // in40
    circuit_inputs = circuit_inputs.next(c0); // in41
    circuit_inputs = circuit_inputs.next(z); // in42
    circuit_inputs = circuit_inputs.next(c_inv_of_z); // in43

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let Q0: G2Point = G2Point {
        x0: outputs.get_output(t160),
        x1: outputs.get_output(t161),
        y0: outputs.get_output(t170),
        y1: outputs.get_output(t171)
    };
    let new_lhs: u384 = outputs.get_output(t201);
    let f_i_plus_one_of_z: u384 = outputs.get_output(t31);
    return (Q0, new_lhs, f_i_plus_one_of_z);
}
fn run_BLS12_381_MP_CHECK_PREPARE_LAMBDA_ROOT_circuit(
    lambda_root_inverse: E12D, z: u384, scaling_factor: MillerLoopResultScalingFactor
) -> (u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x0
    let in1 = CE::<CI<1>> {}; // 0x2
    let in2 = CE::<
        CI<2>
    > {}; // 0x18089593cbf626353947d5b1fd0c6d66bb34bc7585f5abdf8f17b50e12c47d65ce514a7c167b027b600febdb244714c5
    let in3 = CE::<
        CI<3>
    > {}; // 0x5f19672fdf76ce51ba69c6076a0f77eaddb3a93be6f89688de17d813620a00022e01fffffffeffff
    let in4 = CE::<
        CI<4>
    > {}; // 0xd5e1c086ffe8016d063c6dad7a2fffc9072bb5785a686bcefeedc2e0124838bdccf325ee5d80be9902109f7dbc79812
    let in5 = CE::<
        CI<5>
    > {}; // 0x1a0111ea397fe699ec02408663d4de85aa0d857d89759ad4897d29650fb85f9b409427eb4f49fffd8bfd00000000aaad
    let in6 = CE::<
        CI<6>
    > {}; // 0x1a0111ea397fe6998ce8d956845e1033efa3bf761f6622e9abc9802928bfc912627c4fd7ed3ffffb5dfb00000001aaaf
    let in7 = CE::<
        CI<7>
    > {}; // 0xb659fb20274bfb1be8ff4d69163c08be7302c4818171fdd17d5be9b1d380acd8c747cdc4aff0e653631f5d3000f022c
    let in8 = CE::<CI<8>> {}; // -0x1 % p
    let in9 = CE::<
        CI<9>
    > {}; // 0xfc3e2b36c4e03288e9e902231f9fb854a14787b6c7b36fec0c8ec971f63c5f282d5ac14d6c7ec22cf78a126ddc4af3
    let in10 = CE::<
        CI<10>
    > {}; // 0x1f87c566d89c06511d3d204463f3f70a9428f0f6d8f66dfd8191d92e3ec78be505ab5829ad8fd8459ef1424dbb895e6
    let in11 = CE::<
        CI<11>
    > {}; // 0x1a0111ea397fe699ec02408663d4de85aa0d857d89759ad4897d29650fb85f9b409427eb4f49fffd8bfd00000000aaac
    let in12 = CE::<
        CI<12>
    > {}; // 0x6af0e0437ff400b6831e36d6bd17ffe48395dabc2d3435e77f76e17009241c5ee67992f72ec05f4c81084fbede3cc09
    let in13 = CE::<
        CI<13>
    > {}; // 0x5f19672fdf76ce51ba69c6076a0f77eaddb3a93be6f89688de17d813620a00022e01fffffffefffe
    let in14 = CE::<
        CI<14>
    > {}; // 0x144e4211384586c16bd3ad4afa99cc9170df3560e77982d0db45f3536814f0bd5871c1908bd478cd1ee605167ff82995
    let in15 = CE::<
        CI<15>
    > {}; // 0xe9b7238370b26e88c8bb2dfb1e7ec4b7d471f3cdb6df2e24f5b1405d978eb56923783226654f19a83cd0a2cfff0a87f

    // INPUT stack
    let (in16, in17, in18) = (CE::<CI<16>> {}, CE::<CI<17>> {}, CE::<CI<18>> {});
    let (in19, in20, in21) = (CE::<CI<19>> {}, CE::<CI<20>> {}, CE::<CI<21>> {});
    let (in22, in23, in24) = (CE::<CI<22>> {}, CE::<CI<23>> {}, CE::<CI<24>> {});
    let (in25, in26, in27) = (CE::<CI<25>> {}, CE::<CI<26>> {}, CE::<CI<27>> {});
    let (in28, in29, in30) = (CE::<CI<28>> {}, CE::<CI<29>> {}, CE::<CI<30>> {});
    let (in31, in32, in33) = (CE::<CI<31>> {}, CE::<CI<32>> {}, CE::<CI<33>> {});
    let in34 = CE::<CI<34>> {};
    let t0 = circuit_mul(in28, in28); // Compute z^2
    let t1 = circuit_mul(t0, in28); // Compute z^3
    let t2 = circuit_mul(t1, in28); // Compute z^4
    let t3 = circuit_mul(t2, in28); // Compute z^5
    let t4 = circuit_mul(t3, in28); // Compute z^6
    let t5 = circuit_mul(t4, in28); // Compute z^7
    let t6 = circuit_mul(t5, in28); // Compute z^8
    let t7 = circuit_mul(t6, in28); // Compute z^9
    let t8 = circuit_mul(t7, in28); // Compute z^10
    let t9 = circuit_mul(t8, in28); // Compute z^11
    let t10 = circuit_sub(in0, in17);
    let t11 = circuit_sub(in0, in19);
    let t12 = circuit_sub(in0, in21);
    let t13 = circuit_sub(in0, in23);
    let t14 = circuit_sub(in0, in25);
    let t15 = circuit_sub(in0, in27);
    let t16 = circuit_mul(t10, in28); // Eval C_inv step coeff_1 * z^1
    let t17 = circuit_add(in16, t16); // Eval C_inv step + (coeff_1 * z^1)
    let t18 = circuit_mul(in18, t0); // Eval C_inv step coeff_2 * z^2
    let t19 = circuit_add(t17, t18); // Eval C_inv step + (coeff_2 * z^2)
    let t20 = circuit_mul(t11, t1); // Eval C_inv step coeff_3 * z^3
    let t21 = circuit_add(t19, t20); // Eval C_inv step + (coeff_3 * z^3)
    let t22 = circuit_mul(in20, t2); // Eval C_inv step coeff_4 * z^4
    let t23 = circuit_add(t21, t22); // Eval C_inv step + (coeff_4 * z^4)
    let t24 = circuit_mul(t12, t3); // Eval C_inv step coeff_5 * z^5
    let t25 = circuit_add(t23, t24); // Eval C_inv step + (coeff_5 * z^5)
    let t26 = circuit_mul(in22, t4); // Eval C_inv step coeff_6 * z^6
    let t27 = circuit_add(t25, t26); // Eval C_inv step + (coeff_6 * z^6)
    let t28 = circuit_mul(t13, t5); // Eval C_inv step coeff_7 * z^7
    let t29 = circuit_add(t27, t28); // Eval C_inv step + (coeff_7 * z^7)
    let t30 = circuit_mul(in24, t6); // Eval C_inv step coeff_8 * z^8
    let t31 = circuit_add(t29, t30); // Eval C_inv step + (coeff_8 * z^8)
    let t32 = circuit_mul(t14, t7); // Eval C_inv step coeff_9 * z^9
    let t33 = circuit_add(t31, t32); // Eval C_inv step + (coeff_9 * z^9)
    let t34 = circuit_mul(in26, t8); // Eval C_inv step coeff_10 * z^10
    let t35 = circuit_add(t33, t34); // Eval C_inv step + (coeff_10 * z^10)
    let t36 = circuit_mul(t15, t9); // Eval C_inv step coeff_11 * z^11
    let t37 = circuit_add(t35, t36); // Eval C_inv step + (coeff_11 * z^11)
    let t38 = circuit_mul(in30, t0); // Eval sparse poly W step coeff_2 * z^2
    let t39 = circuit_add(in29, t38); // Eval sparse poly W step + coeff_2 * z^2
    let t40 = circuit_mul(in31, t2); // Eval sparse poly W step coeff_4 * z^4
    let t41 = circuit_add(t39, t40); // Eval sparse poly W step + coeff_4 * z^4
    let t42 = circuit_mul(in32, t4); // Eval sparse poly W step coeff_6 * z^6
    let t43 = circuit_add(t41, t42); // Eval sparse poly W step + coeff_6 * z^6
    let t44 = circuit_mul(in33, t6); // Eval sparse poly W step coeff_8 * z^8
    let t45 = circuit_add(t43, t44); // Eval sparse poly W step + coeff_8 * z^8
    let t46 = circuit_mul(in34, t8); // Eval sparse poly W step coeff_10 * z^10
    let t47 = circuit_add(t45, t46); // Eval sparse poly W step + coeff_10 * z^10
    let t48 = circuit_mul(in22, in1);
    let t49 = circuit_add(in16, t48);
    let t50 = circuit_mul(t10, in2);
    let t51 = circuit_mul(t13, in2);
    let t52 = circuit_add(t50, t51);
    let t53 = circuit_mul(in18, in3);
    let t54 = circuit_mul(t14, in4);
    let t55 = circuit_mul(in20, in5);
    let t56 = circuit_mul(in26, in6);
    let t57 = circuit_add(t55, t56);
    let t58 = circuit_mul(t12, in7);
    let t59 = circuit_mul(t15, in7);
    let t60 = circuit_add(t58, t59);
    let t61 = circuit_mul(in22, in8);
    let t62 = circuit_mul(t10, in9);
    let t63 = circuit_mul(t13, in10);
    let t64 = circuit_add(t62, t63);
    let t65 = circuit_mul(in18, in11);
    let t66 = circuit_mul(in24, in11);
    let t67 = circuit_add(t65, t66);
    let t68 = circuit_mul(t11, in12);
    let t69 = circuit_mul(in26, in13);
    let t70 = circuit_mul(t12, in14);
    let t71 = circuit_mul(t15, in15);
    let t72 = circuit_add(t70, t71);
    let t73 = circuit_mul(t52, in28); // Eval C_inv_frob_1 step coeff_1 * z^1
    let t74 = circuit_add(t49, t73); // Eval C_inv_frob_1 step + (coeff_1 * z^1)
    let t75 = circuit_mul(t53, t0); // Eval C_inv_frob_1 step coeff_2 * z^2
    let t76 = circuit_add(t74, t75); // Eval C_inv_frob_1 step + (coeff_2 * z^2)
    let t77 = circuit_mul(t54, t1); // Eval C_inv_frob_1 step coeff_3 * z^3
    let t78 = circuit_add(t76, t77); // Eval C_inv_frob_1 step + (coeff_3 * z^3)
    let t79 = circuit_mul(t57, t2); // Eval C_inv_frob_1 step coeff_4 * z^4
    let t80 = circuit_add(t78, t79); // Eval C_inv_frob_1 step + (coeff_4 * z^4)
    let t81 = circuit_mul(t60, t3); // Eval C_inv_frob_1 step coeff_5 * z^5
    let t82 = circuit_add(t80, t81); // Eval C_inv_frob_1 step + (coeff_5 * z^5)
    let t83 = circuit_mul(t61, t4); // Eval C_inv_frob_1 step coeff_6 * z^6
    let t84 = circuit_add(t82, t83); // Eval C_inv_frob_1 step + (coeff_6 * z^6)
    let t85 = circuit_mul(t64, t5); // Eval C_inv_frob_1 step coeff_7 * z^7
    let t86 = circuit_add(t84, t85); // Eval C_inv_frob_1 step + (coeff_7 * z^7)
    let t87 = circuit_mul(t67, t6); // Eval C_inv_frob_1 step coeff_8 * z^8
    let t88 = circuit_add(t86, t87); // Eval C_inv_frob_1 step + (coeff_8 * z^8)
    let t89 = circuit_mul(t68, t7); // Eval C_inv_frob_1 step coeff_9 * z^9
    let t90 = circuit_add(t88, t89); // Eval C_inv_frob_1 step + (coeff_9 * z^9)
    let t91 = circuit_mul(t69, t8); // Eval C_inv_frob_1 step coeff_10 * z^10
    let t92 = circuit_add(t90, t91); // Eval C_inv_frob_1 step + (coeff_10 * z^10)
    let t93 = circuit_mul(t72, t9); // Eval C_inv_frob_1 step coeff_11 * z^11
    let t94 = circuit_add(t92, t93); // Eval C_inv_frob_1 step + (coeff_11 * z^11)

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t37, t47, t94,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in0
    circuit_inputs = circuit_inputs.next([0x2, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs
        .next(
            [
                0x167b027b600febdb244714c5,
                0x8f17b50e12c47d65ce514a7c,
                0xfd0c6d66bb34bc7585f5abdf,
                0x18089593cbf626353947d5b1
            ]
        ); // in2
    circuit_inputs = circuit_inputs
        .next(
            [
                0x620a00022e01fffffffeffff,
                0xddb3a93be6f89688de17d813,
                0xdf76ce51ba69c6076a0f77ea,
                0x5f19672f
            ]
        ); // in3
    circuit_inputs = circuit_inputs
        .next(
            [
                0xe5d80be9902109f7dbc79812,
                0xefeedc2e0124838bdccf325e,
                0xd7a2fffc9072bb5785a686bc,
                0xd5e1c086ffe8016d063c6da
            ]
        ); // in4
    circuit_inputs = circuit_inputs
        .next(
            [
                0x4f49fffd8bfd00000000aaad,
                0x897d29650fb85f9b409427eb,
                0x63d4de85aa0d857d89759ad4,
                0x1a0111ea397fe699ec024086
            ]
        ); // in5
    circuit_inputs = circuit_inputs
        .next(
            [
                0xed3ffffb5dfb00000001aaaf,
                0xabc9802928bfc912627c4fd7,
                0x845e1033efa3bf761f6622e9,
                0x1a0111ea397fe6998ce8d956
            ]
        ); // in6
    circuit_inputs = circuit_inputs
        .next(
            [
                0x4aff0e653631f5d3000f022c,
                0x17d5be9b1d380acd8c747cdc,
                0x9163c08be7302c4818171fdd,
                0xb659fb20274bfb1be8ff4d6
            ]
        ); // in7
    circuit_inputs = circuit_inputs
        .next(
            [
                0xb153ffffb9feffffffffaaaa,
                0x6730d2a0f6b0f6241eabfffe,
                0x434bacd764774b84f38512bf,
                0x1a0111ea397fe69a4b1ba7b6
            ]
        ); // in8
    circuit_inputs = circuit_inputs
        .next(
            [
                0x4d6c7ec22cf78a126ddc4af3,
                0xec0c8ec971f63c5f282d5ac1,
                0x231f9fb854a14787b6c7b36f,
                0xfc3e2b36c4e03288e9e902
            ]
        ); // in9
    circuit_inputs = circuit_inputs
        .next(
            [
                0x9ad8fd8459ef1424dbb895e6,
                0xd8191d92e3ec78be505ab582,
                0x463f3f70a9428f0f6d8f66df,
                0x1f87c566d89c06511d3d204
            ]
        ); // in10
    circuit_inputs = circuit_inputs
        .next(
            [
                0x4f49fffd8bfd00000000aaac,
                0x897d29650fb85f9b409427eb,
                0x63d4de85aa0d857d89759ad4,
                0x1a0111ea397fe699ec024086
            ]
        ); // in11
    circuit_inputs = circuit_inputs
        .next(
            [
                0x72ec05f4c81084fbede3cc09,
                0x77f76e17009241c5ee67992f,
                0x6bd17ffe48395dabc2d3435e,
                0x6af0e0437ff400b6831e36d
            ]
        ); // in12
    circuit_inputs = circuit_inputs
        .next(
            [
                0x620a00022e01fffffffefffe,
                0xddb3a93be6f89688de17d813,
                0xdf76ce51ba69c6076a0f77ea,
                0x5f19672f
            ]
        ); // in13
    circuit_inputs = circuit_inputs
        .next(
            [
                0x8bd478cd1ee605167ff82995,
                0xdb45f3536814f0bd5871c190,
                0xfa99cc9170df3560e77982d0,
                0x144e4211384586c16bd3ad4a
            ]
        ); // in14
    circuit_inputs = circuit_inputs
        .next(
            [
                0x6654f19a83cd0a2cfff0a87f,
                0x4f5b1405d978eb5692378322,
                0xb1e7ec4b7d471f3cdb6df2e2,
                0xe9b7238370b26e88c8bb2df
            ]
        ); // in15
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w0); // in16
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w1); // in17
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w2); // in18
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w3); // in19
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w4); // in20
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w5); // in21
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w6); // in22
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w7); // in23
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w8); // in24
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w9); // in25
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w10); // in26
    circuit_inputs = circuit_inputs.next(lambda_root_inverse.w11); // in27
    circuit_inputs = circuit_inputs.next(z); // in28
    circuit_inputs = circuit_inputs.next(scaling_factor.w0); // in29
    circuit_inputs = circuit_inputs.next(scaling_factor.w2); // in30
    circuit_inputs = circuit_inputs.next(scaling_factor.w4); // in31
    circuit_inputs = circuit_inputs.next(scaling_factor.w6); // in32
    circuit_inputs = circuit_inputs.next(scaling_factor.w8); // in33
    circuit_inputs = circuit_inputs.next(scaling_factor.w10); // in34

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let c_inv_of_z: u384 = outputs.get_output(t37);
    let scaling_factor_of_z: u384 = outputs.get_output(t47);
    let c_inv_frob_1_of_z: u384 = outputs.get_output(t94);
    return (c_inv_of_z, scaling_factor_of_z, c_inv_frob_1_of_z);
}
fn run_BLS12_381_MP_CHECK_PREPARE_PAIRS_2P_circuit(
    p_0: G1Point, p_1: G1Point
) -> (BLSProcessedPair, BLSProcessedPair) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x0

    // INPUT stack
    let (in1, in2, in3) = (CE::<CI<1>> {}, CE::<CI<2>> {}, CE::<CI<3>> {});
    let in4 = CE::<CI<4>> {};
    let t0 = circuit_inverse(in2);
    let t1 = circuit_mul(in1, t0);
    let t2 = circuit_sub(in0, t1);
    let t3 = circuit_inverse(in4);
    let t4 = circuit_mul(in3, t3);
    let t5 = circuit_sub(in0, t4);

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t0, t2, t3, t5,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in0
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(p_0.x); // in1
    circuit_inputs = circuit_inputs.next(p_0.y); // in2
    circuit_inputs = circuit_inputs.next(p_1.x); // in3
    circuit_inputs = circuit_inputs.next(p_1.y); // in4

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let p_0: BLSProcessedPair = BLSProcessedPair {
        yInv: outputs.get_output(t0), xNegOverY: outputs.get_output(t2)
    };
    let p_1: BLSProcessedPair = BLSProcessedPair {
        yInv: outputs.get_output(t3), xNegOverY: outputs.get_output(t5)
    };
    return (p_0, p_1);
}
fn run_BLS12_381_MP_CHECK_PREPARE_PAIRS_3P_circuit(
    p_0: G1Point, p_1: G1Point, p_2: G1Point
) -> (BLSProcessedPair, BLSProcessedPair, BLSProcessedPair) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x0

    // INPUT stack
    let (in1, in2, in3) = (CE::<CI<1>> {}, CE::<CI<2>> {}, CE::<CI<3>> {});
    let (in4, in5, in6) = (CE::<CI<4>> {}, CE::<CI<5>> {}, CE::<CI<6>> {});
    let t0 = circuit_inverse(in2);
    let t1 = circuit_mul(in1, t0);
    let t2 = circuit_sub(in0, t1);
    let t3 = circuit_inverse(in4);
    let t4 = circuit_mul(in3, t3);
    let t5 = circuit_sub(in0, t4);
    let t6 = circuit_inverse(in6);
    let t7 = circuit_mul(in5, t6);
    let t8 = circuit_sub(in0, t7);

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into(
        [
            0xb153ffffb9feffffffffaaab,
            0x6730d2a0f6b0f6241eabfffe,
            0x434bacd764774b84f38512bf,
            0x1a0111ea397fe69a4b1ba7b6
        ]
    )
        .unwrap(); // BLS12_381 prime field modulus

    let mut circuit_inputs = (t0, t2, t3, t5, t6, t8,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in0
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(p_0.x); // in1
    circuit_inputs = circuit_inputs.next(p_0.y); // in2
    circuit_inputs = circuit_inputs.next(p_1.x); // in3
    circuit_inputs = circuit_inputs.next(p_1.y); // in4
    circuit_inputs = circuit_inputs.next(p_2.x); // in5
    circuit_inputs = circuit_inputs.next(p_2.y); // in6

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let p_0: BLSProcessedPair = BLSProcessedPair {
        yInv: outputs.get_output(t0), xNegOverY: outputs.get_output(t2)
    };
    let p_1: BLSProcessedPair = BLSProcessedPair {
        yInv: outputs.get_output(t3), xNegOverY: outputs.get_output(t5)
    };
    let p_2: BLSProcessedPair = BLSProcessedPair {
        yInv: outputs.get_output(t6), xNegOverY: outputs.get_output(t8)
    };
    return (p_0, p_1, p_2);
}
fn run_BN254_MP_CHECK_BIT00_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    G2_line_2nd_0_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    G2_line_2nd_0_1: G2Line,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    z: u384,
    ci: u384
) -> (u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1

    // INPUT stack
    let (in2, in3, in4) = (CE::<CI<2>> {}, CE::<CI<3>> {}, CE::<CI<4>> {});
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let t0 = circuit_mul(in36, in36); // Compute z^2
    let t1 = circuit_mul(t0, in36); // Compute z^3
    let t2 = circuit_mul(t1, in36); // Compute z^4
    let t3 = circuit_mul(t2, in36); // Compute z^5
    let t4 = circuit_mul(t3, in36); // Compute z^6
    let t5 = circuit_mul(t4, in36); // Compute z^7
    let t6 = circuit_mul(t5, in36); // Compute z^8
    let t7 = circuit_mul(t6, in36); // Compute z^9
    let t8 = circuit_mul(t7, in36); // Compute z^10
    let t9 = circuit_mul(t8, in36); // Compute z^11
    let t10 = circuit_mul(in37, in37); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in23, in23); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_mul(in0, in5);
    let t13 = circuit_add(in4, t12);
    let t14 = circuit_mul(t13, in3); // eval bn line by xNegOverY
    let t15 = circuit_mul(in0, in7);
    let t16 = circuit_add(in6, t15);
    let t17 = circuit_mul(t16, in2); // eval bn line by yInv
    let t18 = circuit_mul(in5, in3); // eval bn line by xNegOverY
    let t19 = circuit_mul(in7, in2); // eval bn line by yInv
    let t20 = circuit_mul(t14, in36); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t21 = circuit_add(in1, t20); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t22 = circuit_mul(t17, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t23 = circuit_add(t21, t22); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t24 = circuit_mul(t18, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t25 = circuit_add(t23, t24); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t26 = circuit_mul(t19, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t28 = circuit_mul(t11, t27); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t29 = circuit_mul(in0, in9);
    let t30 = circuit_add(in8, t29);
    let t31 = circuit_mul(t30, in13); // eval bn line by xNegOverY
    let t32 = circuit_mul(in0, in11);
    let t33 = circuit_add(in10, t32);
    let t34 = circuit_mul(t33, in12); // eval bn line by yInv
    let t35 = circuit_mul(in9, in13); // eval bn line by xNegOverY
    let t36 = circuit_mul(in11, in12); // eval bn line by yInv
    let t37 = circuit_mul(t31, in36); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t38 = circuit_add(in1, t37); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t39 = circuit_mul(t34, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t40 = circuit_add(t38, t39); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t41 = circuit_mul(t35, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t42 = circuit_add(t40, t41); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t43 = circuit_mul(t36, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t44 = circuit_add(t42, t43); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t45 = circuit_mul(t28, t44); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t46 = circuit_mul(
        t45, t45
    ); // Compute (f^2 * Π(i,k) (line_i,k(z))) ^ 2 = f^4 * (Π(i,k) (line_i,k(z)))^2
    let t47 = circuit_mul(in0, in15);
    let t48 = circuit_add(in14, t47);
    let t49 = circuit_mul(t48, in3); // eval bn line by xNegOverY
    let t50 = circuit_mul(in0, in17);
    let t51 = circuit_add(in16, t50);
    let t52 = circuit_mul(t51, in2); // eval bn line by yInv
    let t53 = circuit_mul(in15, in3); // eval bn line by xNegOverY
    let t54 = circuit_mul(in17, in2); // eval bn line by yInv
    let t55 = circuit_mul(t49, in36); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t56 = circuit_add(in1, t55); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t57 = circuit_mul(t52, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t58 = circuit_add(t56, t57); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t59 = circuit_mul(t53, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t60 = circuit_add(t58, t59); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t61 = circuit_mul(t54, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t62 = circuit_add(t60, t61); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t63 = circuit_mul(t46, t62); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t64 = circuit_mul(in0, in19);
    let t65 = circuit_add(in18, t64);
    let t66 = circuit_mul(t65, in13); // eval bn line by xNegOverY
    let t67 = circuit_mul(in0, in21);
    let t68 = circuit_add(in20, t67);
    let t69 = circuit_mul(t68, in12); // eval bn line by yInv
    let t70 = circuit_mul(in19, in13); // eval bn line by xNegOverY
    let t71 = circuit_mul(in21, in12); // eval bn line by yInv
    let t72 = circuit_mul(t66, in36); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t73 = circuit_add(in1, t72); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t74 = circuit_mul(t69, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t75 = circuit_add(t73, t74); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t76 = circuit_mul(t70, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t77 = circuit_add(t75, t76); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t78 = circuit_mul(t71, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t79 = circuit_add(t77, t78); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t80 = circuit_mul(t63, t79); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t81 = circuit_mul(in25, in36); // Eval f_i+1 step coeff_1 * z^1
    let t82 = circuit_add(in24, t81); // Eval f_i+1 step + (coeff_1 * z^1)
    let t83 = circuit_mul(in26, t0); // Eval f_i+1 step coeff_2 * z^2
    let t84 = circuit_add(t82, t83); // Eval f_i+1 step + (coeff_2 * z^2)
    let t85 = circuit_mul(in27, t1); // Eval f_i+1 step coeff_3 * z^3
    let t86 = circuit_add(t84, t85); // Eval f_i+1 step + (coeff_3 * z^3)
    let t87 = circuit_mul(in28, t2); // Eval f_i+1 step coeff_4 * z^4
    let t88 = circuit_add(t86, t87); // Eval f_i+1 step + (coeff_4 * z^4)
    let t89 = circuit_mul(in29, t3); // Eval f_i+1 step coeff_5 * z^5
    let t90 = circuit_add(t88, t89); // Eval f_i+1 step + (coeff_5 * z^5)
    let t91 = circuit_mul(in30, t4); // Eval f_i+1 step coeff_6 * z^6
    let t92 = circuit_add(t90, t91); // Eval f_i+1 step + (coeff_6 * z^6)
    let t93 = circuit_mul(in31, t5); // Eval f_i+1 step coeff_7 * z^7
    let t94 = circuit_add(t92, t93); // Eval f_i+1 step + (coeff_7 * z^7)
    let t95 = circuit_mul(in32, t6); // Eval f_i+1 step coeff_8 * z^8
    let t96 = circuit_add(t94, t95); // Eval f_i+1 step + (coeff_8 * z^8)
    let t97 = circuit_mul(in33, t7); // Eval f_i+1 step coeff_9 * z^9
    let t98 = circuit_add(t96, t97); // Eval f_i+1 step + (coeff_9 * z^9)
    let t99 = circuit_mul(in34, t8); // Eval f_i+1 step coeff_10 * z^10
    let t100 = circuit_add(t98, t99); // Eval f_i+1 step + (coeff_10 * z^10)
    let t101 = circuit_mul(in35, t9); // Eval f_i+1 step coeff_11 * z^11
    let t102 = circuit_add(t100, t101); // Eval f_i+1 step + (coeff_11 * z^11)
    let t103 = circuit_sub(t80, t102); // (Π(i,k) (Pk(z))) - Ri(z)
    let t104 = circuit_mul(t10, t103); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t105 = circuit_add(in22, t104); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t102, t105, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in2
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in7
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r0a0); // in8
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r0a1); // in9
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r1a0); // in10
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r1a1); // in11
    circuit_inputs = circuit_inputs.next(yInv_1); // in12
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in16
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in17
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r0a0); // in18
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r0a1); // in19
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r1a0); // in20
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r1a1); // in21
    circuit_inputs = circuit_inputs.next(lhs_i); // in22
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in23
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in24
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in25
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in26
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in27
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in28
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in29
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in30
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in31
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in33
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in34
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in35
    circuit_inputs = circuit_inputs.next(z); // in36
    circuit_inputs = circuit_inputs.next(ci); // in37

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t102);
    let lhs_i_plus_one: u384 = outputs.get_output(t105);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BN254_MP_CHECK_BIT00_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    G2_line_2nd_0_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    G2_line_2nd_0_1: G2Line,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    z: u384,
    ci: u384
) -> (G2Point, u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1
    let in2 = CE::<CI<2>> {}; // 0x3
    let in3 = CE::<CI<3>> {}; // 0x6
    let in4 = CE::<CI<4>> {}; // 0x0

    // INPUT stack
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let (in38, in39, in40) = (CE::<CI<38>> {}, CE::<CI<39>> {}, CE::<CI<40>> {});
    let (in41, in42, in43) = (CE::<CI<41>> {}, CE::<CI<42>> {}, CE::<CI<43>> {});
    let (in44, in45, in46) = (CE::<CI<44>> {}, CE::<CI<45>> {}, CE::<CI<46>> {});
    let t0 = circuit_mul(in45, in45); // Compute z^2
    let t1 = circuit_mul(t0, in45); // Compute z^3
    let t2 = circuit_mul(t1, in45); // Compute z^4
    let t3 = circuit_mul(t2, in45); // Compute z^5
    let t4 = circuit_mul(t3, in45); // Compute z^6
    let t5 = circuit_mul(t4, in45); // Compute z^7
    let t6 = circuit_mul(t5, in45); // Compute z^8
    let t7 = circuit_mul(t6, in45); // Compute z^9
    let t8 = circuit_mul(t7, in45); // Compute z^10
    let t9 = circuit_mul(t8, in45); // Compute z^11
    let t10 = circuit_mul(in46, in46); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in32, in32); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_mul(in0, in8);
    let t13 = circuit_add(in7, t12);
    let t14 = circuit_mul(t13, in6); // eval bn line by xNegOverY
    let t15 = circuit_mul(in0, in10);
    let t16 = circuit_add(in9, t15);
    let t17 = circuit_mul(t16, in5); // eval bn line by yInv
    let t18 = circuit_mul(in8, in6); // eval bn line by xNegOverY
    let t19 = circuit_mul(in10, in5); // eval bn line by yInv
    let t20 = circuit_mul(t14, in45); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t21 = circuit_add(in1, t20); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t22 = circuit_mul(t17, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t23 = circuit_add(t21, t22); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t24 = circuit_mul(t18, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t25 = circuit_add(t23, t24); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t26 = circuit_mul(t19, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t28 = circuit_mul(t11, t27); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t29 = circuit_mul(in0, in12);
    let t30 = circuit_add(in11, t29);
    let t31 = circuit_mul(t30, in16); // eval bn line by xNegOverY
    let t32 = circuit_mul(in0, in14);
    let t33 = circuit_add(in13, t32);
    let t34 = circuit_mul(t33, in15); // eval bn line by yInv
    let t35 = circuit_mul(in12, in16); // eval bn line by xNegOverY
    let t36 = circuit_mul(in14, in15); // eval bn line by yInv
    let t37 = circuit_mul(t31, in45); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t38 = circuit_add(in1, t37); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t39 = circuit_mul(t34, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t40 = circuit_add(t38, t39); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t41 = circuit_mul(t35, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t42 = circuit_add(t40, t41); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t43 = circuit_mul(t36, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t44 = circuit_add(t42, t43); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t45 = circuit_mul(t28, t44); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t46 = circuit_add(in27, in28); // Doubling slope numerator start
    let t47 = circuit_sub(in27, in28);
    let t48 = circuit_mul(t46, t47);
    let t49 = circuit_mul(in27, in28);
    let t50 = circuit_mul(t48, in2);
    let t51 = circuit_mul(t49, in3); // Doubling slope numerator end
    let t52 = circuit_add(in29, in29); // Fp2 add coeff 0/1
    let t53 = circuit_add(in30, in30); // Fp2 add coeff 1/1
    let t54 = circuit_mul(t52, t52); // Fp2 Div x/y start : Fp2 Inv y start
    let t55 = circuit_mul(t53, t53);
    let t56 = circuit_add(t54, t55);
    let t57 = circuit_inverse(t56);
    let t58 = circuit_mul(t52, t57); // Fp2 Inv y real part end
    let t59 = circuit_mul(t53, t57);
    let t60 = circuit_sub(in4, t59); // Fp2 Inv y imag part end
    let t61 = circuit_mul(t50, t58); // Fp2 mul start
    let t62 = circuit_mul(t51, t60);
    let t63 = circuit_sub(t61, t62); // Fp2 mul real part end
    let t64 = circuit_mul(t50, t60);
    let t65 = circuit_mul(t51, t58);
    let t66 = circuit_add(t64, t65); // Fp2 mul imag part end
    let t67 = circuit_add(t63, t66);
    let t68 = circuit_sub(t63, t66);
    let t69 = circuit_mul(t67, t68);
    let t70 = circuit_mul(t63, t66);
    let t71 = circuit_add(t70, t70);
    let t72 = circuit_add(in27, in27); // Fp2 add coeff 0/1
    let t73 = circuit_add(in28, in28); // Fp2 add coeff 1/1
    let t74 = circuit_sub(t69, t72); // Fp2 sub coeff 0/1
    let t75 = circuit_sub(t71, t73); // Fp2 sub coeff 1/1
    let t76 = circuit_sub(in27, t74); // Fp2 sub coeff 0/1
    let t77 = circuit_sub(in28, t75); // Fp2 sub coeff 1/1
    let t78 = circuit_mul(t63, t76); // Fp2 mul start
    let t79 = circuit_mul(t66, t77);
    let t80 = circuit_sub(t78, t79); // Fp2 mul real part end
    let t81 = circuit_mul(t63, t77);
    let t82 = circuit_mul(t66, t76);
    let t83 = circuit_add(t81, t82); // Fp2 mul imag part end
    let t84 = circuit_sub(t80, in29); // Fp2 sub coeff 0/1
    let t85 = circuit_sub(t83, in30); // Fp2 sub coeff 1/1
    let t86 = circuit_mul(t63, in27); // Fp2 mul start
    let t87 = circuit_mul(t66, in28);
    let t88 = circuit_sub(t86, t87); // Fp2 mul real part end
    let t89 = circuit_mul(t63, in28);
    let t90 = circuit_mul(t66, in27);
    let t91 = circuit_add(t89, t90); // Fp2 mul imag part end
    let t92 = circuit_sub(t88, in29); // Fp2 sub coeff 0/1
    let t93 = circuit_sub(t91, in30); // Fp2 sub coeff 1/1
    let t94 = circuit_mul(in0, t66);
    let t95 = circuit_add(t63, t94);
    let t96 = circuit_mul(t95, in26); // eval bn line by xNegOverY
    let t97 = circuit_mul(in0, t93);
    let t98 = circuit_add(t92, t97);
    let t99 = circuit_mul(t98, in25); // eval bn line by yInv
    let t100 = circuit_mul(t66, in26); // eval bn line by xNegOverY
    let t101 = circuit_mul(t93, in25); // eval bn line by yInv
    let t102 = circuit_mul(t96, in45); // Eval sparse poly line_2p_1 step coeff_1 * z^1
    let t103 = circuit_add(in1, t102); // Eval sparse poly line_2p_1 step + coeff_1 * z^1
    let t104 = circuit_mul(t99, t1); // Eval sparse poly line_2p_1 step coeff_3 * z^3
    let t105 = circuit_add(t103, t104); // Eval sparse poly line_2p_1 step + coeff_3 * z^3
    let t106 = circuit_mul(t100, t5); // Eval sparse poly line_2p_1 step coeff_7 * z^7
    let t107 = circuit_add(t105, t106); // Eval sparse poly line_2p_1 step + coeff_7 * z^7
    let t108 = circuit_mul(t101, t7); // Eval sparse poly line_2p_1 step coeff_9 * z^9
    let t109 = circuit_add(t107, t108); // Eval sparse poly line_2p_1 step + coeff_9 * z^9
    let t110 = circuit_mul(t45, t109); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t111 = circuit_mul(
        t110, t110
    ); // Compute (f^2 * Π(i,k) (line_i,k(z))) ^ 2 = f^4 * (Π(i,k) (line_i,k(z)))^2
    let t112 = circuit_mul(in0, in18);
    let t113 = circuit_add(in17, t112);
    let t114 = circuit_mul(t113, in6); // eval bn line by xNegOverY
    let t115 = circuit_mul(in0, in20);
    let t116 = circuit_add(in19, t115);
    let t117 = circuit_mul(t116, in5); // eval bn line by yInv
    let t118 = circuit_mul(in18, in6); // eval bn line by xNegOverY
    let t119 = circuit_mul(in20, in5); // eval bn line by yInv
    let t120 = circuit_mul(t114, in45); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t121 = circuit_add(in1, t120); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t122 = circuit_mul(t117, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t123 = circuit_add(t121, t122); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t124 = circuit_mul(t118, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t125 = circuit_add(t123, t124); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t126 = circuit_mul(t119, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t127 = circuit_add(t125, t126); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t128 = circuit_mul(t111, t127); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t129 = circuit_mul(in0, in22);
    let t130 = circuit_add(in21, t129);
    let t131 = circuit_mul(t130, in16); // eval bn line by xNegOverY
    let t132 = circuit_mul(in0, in24);
    let t133 = circuit_add(in23, t132);
    let t134 = circuit_mul(t133, in15); // eval bn line by yInv
    let t135 = circuit_mul(in22, in16); // eval bn line by xNegOverY
    let t136 = circuit_mul(in24, in15); // eval bn line by yInv
    let t137 = circuit_mul(t131, in45); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t138 = circuit_add(in1, t137); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t139 = circuit_mul(t134, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t140 = circuit_add(t138, t139); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t141 = circuit_mul(t135, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t142 = circuit_add(t140, t141); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t143 = circuit_mul(t136, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t144 = circuit_add(t142, t143); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t145 = circuit_mul(t128, t144); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t146 = circuit_add(t74, t75); // Doubling slope numerator start
    let t147 = circuit_sub(t74, t75);
    let t148 = circuit_mul(t146, t147);
    let t149 = circuit_mul(t74, t75);
    let t150 = circuit_mul(t148, in2);
    let t151 = circuit_mul(t149, in3); // Doubling slope numerator end
    let t152 = circuit_add(t84, t84); // Fp2 add coeff 0/1
    let t153 = circuit_add(t85, t85); // Fp2 add coeff 1/1
    let t154 = circuit_mul(t152, t152); // Fp2 Div x/y start : Fp2 Inv y start
    let t155 = circuit_mul(t153, t153);
    let t156 = circuit_add(t154, t155);
    let t157 = circuit_inverse(t156);
    let t158 = circuit_mul(t152, t157); // Fp2 Inv y real part end
    let t159 = circuit_mul(t153, t157);
    let t160 = circuit_sub(in4, t159); // Fp2 Inv y imag part end
    let t161 = circuit_mul(t150, t158); // Fp2 mul start
    let t162 = circuit_mul(t151, t160);
    let t163 = circuit_sub(t161, t162); // Fp2 mul real part end
    let t164 = circuit_mul(t150, t160);
    let t165 = circuit_mul(t151, t158);
    let t166 = circuit_add(t164, t165); // Fp2 mul imag part end
    let t167 = circuit_add(t163, t166);
    let t168 = circuit_sub(t163, t166);
    let t169 = circuit_mul(t167, t168);
    let t170 = circuit_mul(t163, t166);
    let t171 = circuit_add(t170, t170);
    let t172 = circuit_add(t74, t74); // Fp2 add coeff 0/1
    let t173 = circuit_add(t75, t75); // Fp2 add coeff 1/1
    let t174 = circuit_sub(t169, t172); // Fp2 sub coeff 0/1
    let t175 = circuit_sub(t171, t173); // Fp2 sub coeff 1/1
    let t176 = circuit_sub(t74, t174); // Fp2 sub coeff 0/1
    let t177 = circuit_sub(t75, t175); // Fp2 sub coeff 1/1
    let t178 = circuit_mul(t163, t176); // Fp2 mul start
    let t179 = circuit_mul(t166, t177);
    let t180 = circuit_sub(t178, t179); // Fp2 mul real part end
    let t181 = circuit_mul(t163, t177);
    let t182 = circuit_mul(t166, t176);
    let t183 = circuit_add(t181, t182); // Fp2 mul imag part end
    let t184 = circuit_sub(t180, t84); // Fp2 sub coeff 0/1
    let t185 = circuit_sub(t183, t85); // Fp2 sub coeff 1/1
    let t186 = circuit_mul(t163, t74); // Fp2 mul start
    let t187 = circuit_mul(t166, t75);
    let t188 = circuit_sub(t186, t187); // Fp2 mul real part end
    let t189 = circuit_mul(t163, t75);
    let t190 = circuit_mul(t166, t74);
    let t191 = circuit_add(t189, t190); // Fp2 mul imag part end
    let t192 = circuit_sub(t188, t84); // Fp2 sub coeff 0/1
    let t193 = circuit_sub(t191, t85); // Fp2 sub coeff 1/1
    let t194 = circuit_mul(in0, t166);
    let t195 = circuit_add(t163, t194);
    let t196 = circuit_mul(t195, in26); // eval bn line by xNegOverY
    let t197 = circuit_mul(in0, t193);
    let t198 = circuit_add(t192, t197);
    let t199 = circuit_mul(t198, in25); // eval bn line by yInv
    let t200 = circuit_mul(t166, in26); // eval bn line by xNegOverY
    let t201 = circuit_mul(t193, in25); // eval bn line by yInv
    let t202 = circuit_mul(t196, in45); // Eval sparse poly line_2p_1 step coeff_1 * z^1
    let t203 = circuit_add(in1, t202); // Eval sparse poly line_2p_1 step + coeff_1 * z^1
    let t204 = circuit_mul(t199, t1); // Eval sparse poly line_2p_1 step coeff_3 * z^3
    let t205 = circuit_add(t203, t204); // Eval sparse poly line_2p_1 step + coeff_3 * z^3
    let t206 = circuit_mul(t200, t5); // Eval sparse poly line_2p_1 step coeff_7 * z^7
    let t207 = circuit_add(t205, t206); // Eval sparse poly line_2p_1 step + coeff_7 * z^7
    let t208 = circuit_mul(t201, t7); // Eval sparse poly line_2p_1 step coeff_9 * z^9
    let t209 = circuit_add(t207, t208); // Eval sparse poly line_2p_1 step + coeff_9 * z^9
    let t210 = circuit_mul(t145, t209); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t211 = circuit_mul(in34, in45); // Eval f_i+1 step coeff_1 * z^1
    let t212 = circuit_add(in33, t211); // Eval f_i+1 step + (coeff_1 * z^1)
    let t213 = circuit_mul(in35, t0); // Eval f_i+1 step coeff_2 * z^2
    let t214 = circuit_add(t212, t213); // Eval f_i+1 step + (coeff_2 * z^2)
    let t215 = circuit_mul(in36, t1); // Eval f_i+1 step coeff_3 * z^3
    let t216 = circuit_add(t214, t215); // Eval f_i+1 step + (coeff_3 * z^3)
    let t217 = circuit_mul(in37, t2); // Eval f_i+1 step coeff_4 * z^4
    let t218 = circuit_add(t216, t217); // Eval f_i+1 step + (coeff_4 * z^4)
    let t219 = circuit_mul(in38, t3); // Eval f_i+1 step coeff_5 * z^5
    let t220 = circuit_add(t218, t219); // Eval f_i+1 step + (coeff_5 * z^5)
    let t221 = circuit_mul(in39, t4); // Eval f_i+1 step coeff_6 * z^6
    let t222 = circuit_add(t220, t221); // Eval f_i+1 step + (coeff_6 * z^6)
    let t223 = circuit_mul(in40, t5); // Eval f_i+1 step coeff_7 * z^7
    let t224 = circuit_add(t222, t223); // Eval f_i+1 step + (coeff_7 * z^7)
    let t225 = circuit_mul(in41, t6); // Eval f_i+1 step coeff_8 * z^8
    let t226 = circuit_add(t224, t225); // Eval f_i+1 step + (coeff_8 * z^8)
    let t227 = circuit_mul(in42, t7); // Eval f_i+1 step coeff_9 * z^9
    let t228 = circuit_add(t226, t227); // Eval f_i+1 step + (coeff_9 * z^9)
    let t229 = circuit_mul(in43, t8); // Eval f_i+1 step coeff_10 * z^10
    let t230 = circuit_add(t228, t229); // Eval f_i+1 step + (coeff_10 * z^10)
    let t231 = circuit_mul(in44, t9); // Eval f_i+1 step coeff_11 * z^11
    let t232 = circuit_add(t230, t231); // Eval f_i+1 step + (coeff_11 * z^11)
    let t233 = circuit_sub(t210, t232); // (Π(i,k) (Pk(z))) - Ri(z)
    let t234 = circuit_mul(t10, t233); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t235 = circuit_add(in31, t234); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t174, t175, t184, t185, t232, t235, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs.next([0x3, 0x0, 0x0, 0x0]); // in2
    circuit_inputs = circuit_inputs.next([0x6, 0x0, 0x0, 0x0]); // in3
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in4
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in5
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in7
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in8
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in9
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in10
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r0a0); // in11
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r0a1); // in12
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r1a0); // in13
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_0.r1a1); // in14
    circuit_inputs = circuit_inputs.next(yInv_1); // in15
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in16
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in17
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in18
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in19
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in20
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r0a0); // in21
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r0a1); // in22
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r1a0); // in23
    circuit_inputs = circuit_inputs.next(G2_line_2nd_0_1.r1a1); // in24
    circuit_inputs = circuit_inputs.next(yInv_2); // in25
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in26
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in27
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in28
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in29
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in30
    circuit_inputs = circuit_inputs.next(lhs_i); // in31
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in33
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in34
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in35
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in36
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in37
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in38
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in39
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in40
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in41
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in42
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in43
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in44
    circuit_inputs = circuit_inputs.next(z); // in45
    circuit_inputs = circuit_inputs.next(ci); // in46

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let Q0: G2Point = G2Point {
        x0: outputs.get_output(t174),
        x1: outputs.get_output(t175),
        y0: outputs.get_output(t184),
        y1: outputs.get_output(t185)
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t232);
    let lhs_i_plus_one: u384 = outputs.get_output(t235);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (Q0, f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BN254_MP_CHECK_BIT0_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    z: u384,
    ci: u384
) -> (u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1

    // INPUT stack
    let (in2, in3, in4) = (CE::<CI<2>> {}, CE::<CI<3>> {}, CE::<CI<4>> {});
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let in29 = CE::<CI<29>> {};
    let t0 = circuit_mul(in28, in28); // Compute z^2
    let t1 = circuit_mul(t0, in28); // Compute z^3
    let t2 = circuit_mul(t1, in28); // Compute z^4
    let t3 = circuit_mul(t2, in28); // Compute z^5
    let t4 = circuit_mul(t3, in28); // Compute z^6
    let t5 = circuit_mul(t4, in28); // Compute z^7
    let t6 = circuit_mul(t5, in28); // Compute z^8
    let t7 = circuit_mul(t6, in28); // Compute z^9
    let t8 = circuit_mul(t7, in28); // Compute z^10
    let t9 = circuit_mul(t8, in28); // Compute z^11
    let t10 = circuit_mul(in29, in29); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in15, in15); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_mul(in0, in5);
    let t13 = circuit_add(in4, t12);
    let t14 = circuit_mul(t13, in3); // eval bn line by xNegOverY
    let t15 = circuit_mul(in0, in7);
    let t16 = circuit_add(in6, t15);
    let t17 = circuit_mul(t16, in2); // eval bn line by yInv
    let t18 = circuit_mul(in5, in3); // eval bn line by xNegOverY
    let t19 = circuit_mul(in7, in2); // eval bn line by yInv
    let t20 = circuit_mul(t14, in28); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t21 = circuit_add(in1, t20); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t22 = circuit_mul(t17, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t23 = circuit_add(t21, t22); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t24 = circuit_mul(t18, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t25 = circuit_add(t23, t24); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t26 = circuit_mul(t19, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t28 = circuit_mul(t11, t27); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t29 = circuit_mul(in0, in11);
    let t30 = circuit_add(in10, t29);
    let t31 = circuit_mul(t30, in9); // eval bn line by xNegOverY
    let t32 = circuit_mul(in0, in13);
    let t33 = circuit_add(in12, t32);
    let t34 = circuit_mul(t33, in8); // eval bn line by yInv
    let t35 = circuit_mul(in11, in9); // eval bn line by xNegOverY
    let t36 = circuit_mul(in13, in8); // eval bn line by yInv
    let t37 = circuit_mul(t31, in28); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t38 = circuit_add(in1, t37); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t39 = circuit_mul(t34, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t40 = circuit_add(t38, t39); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t41 = circuit_mul(t35, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t42 = circuit_add(t40, t41); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t43 = circuit_mul(t36, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t44 = circuit_add(t42, t43); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t45 = circuit_mul(t28, t44); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t46 = circuit_mul(in17, in28); // Eval f_i+1 step coeff_1 * z^1
    let t47 = circuit_add(in16, t46); // Eval f_i+1 step + (coeff_1 * z^1)
    let t48 = circuit_mul(in18, t0); // Eval f_i+1 step coeff_2 * z^2
    let t49 = circuit_add(t47, t48); // Eval f_i+1 step + (coeff_2 * z^2)
    let t50 = circuit_mul(in19, t1); // Eval f_i+1 step coeff_3 * z^3
    let t51 = circuit_add(t49, t50); // Eval f_i+1 step + (coeff_3 * z^3)
    let t52 = circuit_mul(in20, t2); // Eval f_i+1 step coeff_4 * z^4
    let t53 = circuit_add(t51, t52); // Eval f_i+1 step + (coeff_4 * z^4)
    let t54 = circuit_mul(in21, t3); // Eval f_i+1 step coeff_5 * z^5
    let t55 = circuit_add(t53, t54); // Eval f_i+1 step + (coeff_5 * z^5)
    let t56 = circuit_mul(in22, t4); // Eval f_i+1 step coeff_6 * z^6
    let t57 = circuit_add(t55, t56); // Eval f_i+1 step + (coeff_6 * z^6)
    let t58 = circuit_mul(in23, t5); // Eval f_i+1 step coeff_7 * z^7
    let t59 = circuit_add(t57, t58); // Eval f_i+1 step + (coeff_7 * z^7)
    let t60 = circuit_mul(in24, t6); // Eval f_i+1 step coeff_8 * z^8
    let t61 = circuit_add(t59, t60); // Eval f_i+1 step + (coeff_8 * z^8)
    let t62 = circuit_mul(in25, t7); // Eval f_i+1 step coeff_9 * z^9
    let t63 = circuit_add(t61, t62); // Eval f_i+1 step + (coeff_9 * z^9)
    let t64 = circuit_mul(in26, t8); // Eval f_i+1 step coeff_10 * z^10
    let t65 = circuit_add(t63, t64); // Eval f_i+1 step + (coeff_10 * z^10)
    let t66 = circuit_mul(in27, t9); // Eval f_i+1 step coeff_11 * z^11
    let t67 = circuit_add(t65, t66); // Eval f_i+1 step + (coeff_11 * z^11)
    let t68 = circuit_sub(t45, t67); // (Π(i,k) (Pk(z))) - Ri(z)
    let t69 = circuit_mul(t10, t68); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t70 = circuit_add(in14, t69); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t67, t70, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in2
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in7
    circuit_inputs = circuit_inputs.next(yInv_1); // in8
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in9
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in10
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in11
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in13
    circuit_inputs = circuit_inputs.next(lhs_i); // in14
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in15
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in16
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in17
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in18
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in19
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in20
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in21
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in22
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in23
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in24
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in25
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in26
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in27
    circuit_inputs = circuit_inputs.next(z); // in28
    circuit_inputs = circuit_inputs.next(ci); // in29

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t67);
    let lhs_i_plus_one: u384 = outputs.get_output(t70);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BN254_MP_CHECK_BIT0_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    z: u384,
    ci: u384
) -> (G2Point, u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1
    let in2 = CE::<CI<2>> {}; // 0x3
    let in3 = CE::<CI<3>> {}; // 0x6
    let in4 = CE::<CI<4>> {}; // 0x0

    // INPUT stack
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let in38 = CE::<CI<38>> {};
    let t0 = circuit_mul(in37, in37); // Compute z^2
    let t1 = circuit_mul(t0, in37); // Compute z^3
    let t2 = circuit_mul(t1, in37); // Compute z^4
    let t3 = circuit_mul(t2, in37); // Compute z^5
    let t4 = circuit_mul(t3, in37); // Compute z^6
    let t5 = circuit_mul(t4, in37); // Compute z^7
    let t6 = circuit_mul(t5, in37); // Compute z^8
    let t7 = circuit_mul(t6, in37); // Compute z^9
    let t8 = circuit_mul(t7, in37); // Compute z^10
    let t9 = circuit_mul(t8, in37); // Compute z^11
    let t10 = circuit_mul(in38, in38); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in24, in24); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_mul(in0, in8);
    let t13 = circuit_add(in7, t12);
    let t14 = circuit_mul(t13, in6); // eval bn line by xNegOverY
    let t15 = circuit_mul(in0, in10);
    let t16 = circuit_add(in9, t15);
    let t17 = circuit_mul(t16, in5); // eval bn line by yInv
    let t18 = circuit_mul(in8, in6); // eval bn line by xNegOverY
    let t19 = circuit_mul(in10, in5); // eval bn line by yInv
    let t20 = circuit_mul(t14, in37); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t21 = circuit_add(in1, t20); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t22 = circuit_mul(t17, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t23 = circuit_add(t21, t22); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t24 = circuit_mul(t18, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t25 = circuit_add(t23, t24); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t26 = circuit_mul(t19, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t28 = circuit_mul(t11, t27); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t29 = circuit_mul(in0, in14);
    let t30 = circuit_add(in13, t29);
    let t31 = circuit_mul(t30, in12); // eval bn line by xNegOverY
    let t32 = circuit_mul(in0, in16);
    let t33 = circuit_add(in15, t32);
    let t34 = circuit_mul(t33, in11); // eval bn line by yInv
    let t35 = circuit_mul(in14, in12); // eval bn line by xNegOverY
    let t36 = circuit_mul(in16, in11); // eval bn line by yInv
    let t37 = circuit_mul(t31, in37); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t38 = circuit_add(in1, t37); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t39 = circuit_mul(t34, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t40 = circuit_add(t38, t39); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t41 = circuit_mul(t35, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t42 = circuit_add(t40, t41); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t43 = circuit_mul(t36, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t44 = circuit_add(t42, t43); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t45 = circuit_mul(t28, t44); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t46 = circuit_add(in19, in20); // Doubling slope numerator start
    let t47 = circuit_sub(in19, in20);
    let t48 = circuit_mul(t46, t47);
    let t49 = circuit_mul(in19, in20);
    let t50 = circuit_mul(t48, in2);
    let t51 = circuit_mul(t49, in3); // Doubling slope numerator end
    let t52 = circuit_add(in21, in21); // Fp2 add coeff 0/1
    let t53 = circuit_add(in22, in22); // Fp2 add coeff 1/1
    let t54 = circuit_mul(t52, t52); // Fp2 Div x/y start : Fp2 Inv y start
    let t55 = circuit_mul(t53, t53);
    let t56 = circuit_add(t54, t55);
    let t57 = circuit_inverse(t56);
    let t58 = circuit_mul(t52, t57); // Fp2 Inv y real part end
    let t59 = circuit_mul(t53, t57);
    let t60 = circuit_sub(in4, t59); // Fp2 Inv y imag part end
    let t61 = circuit_mul(t50, t58); // Fp2 mul start
    let t62 = circuit_mul(t51, t60);
    let t63 = circuit_sub(t61, t62); // Fp2 mul real part end
    let t64 = circuit_mul(t50, t60);
    let t65 = circuit_mul(t51, t58);
    let t66 = circuit_add(t64, t65); // Fp2 mul imag part end
    let t67 = circuit_add(t63, t66);
    let t68 = circuit_sub(t63, t66);
    let t69 = circuit_mul(t67, t68);
    let t70 = circuit_mul(t63, t66);
    let t71 = circuit_add(t70, t70);
    let t72 = circuit_add(in19, in19); // Fp2 add coeff 0/1
    let t73 = circuit_add(in20, in20); // Fp2 add coeff 1/1
    let t74 = circuit_sub(t69, t72); // Fp2 sub coeff 0/1
    let t75 = circuit_sub(t71, t73); // Fp2 sub coeff 1/1
    let t76 = circuit_sub(in19, t74); // Fp2 sub coeff 0/1
    let t77 = circuit_sub(in20, t75); // Fp2 sub coeff 1/1
    let t78 = circuit_mul(t63, t76); // Fp2 mul start
    let t79 = circuit_mul(t66, t77);
    let t80 = circuit_sub(t78, t79); // Fp2 mul real part end
    let t81 = circuit_mul(t63, t77);
    let t82 = circuit_mul(t66, t76);
    let t83 = circuit_add(t81, t82); // Fp2 mul imag part end
    let t84 = circuit_sub(t80, in21); // Fp2 sub coeff 0/1
    let t85 = circuit_sub(t83, in22); // Fp2 sub coeff 1/1
    let t86 = circuit_mul(t63, in19); // Fp2 mul start
    let t87 = circuit_mul(t66, in20);
    let t88 = circuit_sub(t86, t87); // Fp2 mul real part end
    let t89 = circuit_mul(t63, in20);
    let t90 = circuit_mul(t66, in19);
    let t91 = circuit_add(t89, t90); // Fp2 mul imag part end
    let t92 = circuit_sub(t88, in21); // Fp2 sub coeff 0/1
    let t93 = circuit_sub(t91, in22); // Fp2 sub coeff 1/1
    let t94 = circuit_mul(in0, t66);
    let t95 = circuit_add(t63, t94);
    let t96 = circuit_mul(t95, in18); // eval bn line by xNegOverY
    let t97 = circuit_mul(in0, t93);
    let t98 = circuit_add(t92, t97);
    let t99 = circuit_mul(t98, in17); // eval bn line by yInv
    let t100 = circuit_mul(t66, in18); // eval bn line by xNegOverY
    let t101 = circuit_mul(t93, in17); // eval bn line by yInv
    let t102 = circuit_mul(t96, in37); // Eval sparse poly line_2p_1 step coeff_1 * z^1
    let t103 = circuit_add(in1, t102); // Eval sparse poly line_2p_1 step + coeff_1 * z^1
    let t104 = circuit_mul(t99, t1); // Eval sparse poly line_2p_1 step coeff_3 * z^3
    let t105 = circuit_add(t103, t104); // Eval sparse poly line_2p_1 step + coeff_3 * z^3
    let t106 = circuit_mul(t100, t5); // Eval sparse poly line_2p_1 step coeff_7 * z^7
    let t107 = circuit_add(t105, t106); // Eval sparse poly line_2p_1 step + coeff_7 * z^7
    let t108 = circuit_mul(t101, t7); // Eval sparse poly line_2p_1 step coeff_9 * z^9
    let t109 = circuit_add(t107, t108); // Eval sparse poly line_2p_1 step + coeff_9 * z^9
    let t110 = circuit_mul(t45, t109); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t111 = circuit_mul(in26, in37); // Eval f_i+1 step coeff_1 * z^1
    let t112 = circuit_add(in25, t111); // Eval f_i+1 step + (coeff_1 * z^1)
    let t113 = circuit_mul(in27, t0); // Eval f_i+1 step coeff_2 * z^2
    let t114 = circuit_add(t112, t113); // Eval f_i+1 step + (coeff_2 * z^2)
    let t115 = circuit_mul(in28, t1); // Eval f_i+1 step coeff_3 * z^3
    let t116 = circuit_add(t114, t115); // Eval f_i+1 step + (coeff_3 * z^3)
    let t117 = circuit_mul(in29, t2); // Eval f_i+1 step coeff_4 * z^4
    let t118 = circuit_add(t116, t117); // Eval f_i+1 step + (coeff_4 * z^4)
    let t119 = circuit_mul(in30, t3); // Eval f_i+1 step coeff_5 * z^5
    let t120 = circuit_add(t118, t119); // Eval f_i+1 step + (coeff_5 * z^5)
    let t121 = circuit_mul(in31, t4); // Eval f_i+1 step coeff_6 * z^6
    let t122 = circuit_add(t120, t121); // Eval f_i+1 step + (coeff_6 * z^6)
    let t123 = circuit_mul(in32, t5); // Eval f_i+1 step coeff_7 * z^7
    let t124 = circuit_add(t122, t123); // Eval f_i+1 step + (coeff_7 * z^7)
    let t125 = circuit_mul(in33, t6); // Eval f_i+1 step coeff_8 * z^8
    let t126 = circuit_add(t124, t125); // Eval f_i+1 step + (coeff_8 * z^8)
    let t127 = circuit_mul(in34, t7); // Eval f_i+1 step coeff_9 * z^9
    let t128 = circuit_add(t126, t127); // Eval f_i+1 step + (coeff_9 * z^9)
    let t129 = circuit_mul(in35, t8); // Eval f_i+1 step coeff_10 * z^10
    let t130 = circuit_add(t128, t129); // Eval f_i+1 step + (coeff_10 * z^10)
    let t131 = circuit_mul(in36, t9); // Eval f_i+1 step coeff_11 * z^11
    let t132 = circuit_add(t130, t131); // Eval f_i+1 step + (coeff_11 * z^11)
    let t133 = circuit_sub(t110, t132); // (Π(i,k) (Pk(z))) - Ri(z)
    let t134 = circuit_mul(t10, t133); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t135 = circuit_add(in23, t134); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t74, t75, t84, t85, t132, t135, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs.next([0x3, 0x0, 0x0, 0x0]); // in2
    circuit_inputs = circuit_inputs.next([0x6, 0x0, 0x0, 0x0]); // in3
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in4
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in5
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in7
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in8
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in9
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in10
    circuit_inputs = circuit_inputs.next(yInv_1); // in11
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in16
    circuit_inputs = circuit_inputs.next(yInv_2); // in17
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in18
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in19
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in20
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in21
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in22
    circuit_inputs = circuit_inputs.next(lhs_i); // in23
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in24
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in25
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in26
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in27
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in28
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in29
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in30
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in31
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in33
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in34
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in35
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in36
    circuit_inputs = circuit_inputs.next(z); // in37
    circuit_inputs = circuit_inputs.next(ci); // in38

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let Q0: G2Point = G2Point {
        x0: outputs.get_output(t74),
        x1: outputs.get_output(t75),
        y0: outputs.get_output(t84),
        y1: outputs.get_output(t85)
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t132);
    let lhs_i_plus_one: u384 = outputs.get_output(t135);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (Q0, f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BN254_MP_CHECK_BIT1_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    Q_or_Q_neg_line0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    Q_or_Q_neg_line1: G2Line,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    c_or_cinv_of_z: u384,
    z: u384,
    ci: u384
) -> (u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1

    // INPUT stack
    let (in2, in3, in4) = (CE::<CI<2>> {}, CE::<CI<3>> {}, CE::<CI<4>> {});
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let in38 = CE::<CI<38>> {};
    let t0 = circuit_mul(in37, in37); // Compute z^2
    let t1 = circuit_mul(t0, in37); // Compute z^3
    let t2 = circuit_mul(t1, in37); // Compute z^4
    let t3 = circuit_mul(t2, in37); // Compute z^5
    let t4 = circuit_mul(t3, in37); // Compute z^6
    let t5 = circuit_mul(t4, in37); // Compute z^7
    let t6 = circuit_mul(t5, in37); // Compute z^8
    let t7 = circuit_mul(t6, in37); // Compute z^9
    let t8 = circuit_mul(t7, in37); // Compute z^10
    let t9 = circuit_mul(t8, in37); // Compute z^11
    let t10 = circuit_mul(in38, in38); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in23, in23); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_mul(in0, in5);
    let t13 = circuit_add(in4, t12);
    let t14 = circuit_mul(t13, in3); // eval bn line by xNegOverY
    let t15 = circuit_mul(in0, in7);
    let t16 = circuit_add(in6, t15);
    let t17 = circuit_mul(t16, in2); // eval bn line by yInv
    let t18 = circuit_mul(in5, in3); // eval bn line by xNegOverY
    let t19 = circuit_mul(in7, in2); // eval bn line by yInv
    let t20 = circuit_mul(in0, in9);
    let t21 = circuit_add(in8, t20);
    let t22 = circuit_mul(t21, in3); // eval bn line by xNegOverY
    let t23 = circuit_mul(in0, in11);
    let t24 = circuit_add(in10, t23);
    let t25 = circuit_mul(t24, in2); // eval bn line by yInv
    let t26 = circuit_mul(in9, in3); // eval bn line by xNegOverY
    let t27 = circuit_mul(in11, in2); // eval bn line by yInv
    let t28 = circuit_mul(t14, in37); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t29 = circuit_add(in1, t28); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t30 = circuit_mul(t17, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t31 = circuit_add(t29, t30); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t32 = circuit_mul(t18, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t33 = circuit_add(t31, t32); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t34 = circuit_mul(t19, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t35 = circuit_add(t33, t34); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t36 = circuit_mul(t11, t35); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t37 = circuit_mul(t22, in37); // Eval sparse poly line_0p_2 step coeff_1 * z^1
    let t38 = circuit_add(in1, t37); // Eval sparse poly line_0p_2 step + coeff_1 * z^1
    let t39 = circuit_mul(t25, t1); // Eval sparse poly line_0p_2 step coeff_3 * z^3
    let t40 = circuit_add(t38, t39); // Eval sparse poly line_0p_2 step + coeff_3 * z^3
    let t41 = circuit_mul(t26, t5); // Eval sparse poly line_0p_2 step coeff_7 * z^7
    let t42 = circuit_add(t40, t41); // Eval sparse poly line_0p_2 step + coeff_7 * z^7
    let t43 = circuit_mul(t27, t7); // Eval sparse poly line_0p_2 step coeff_9 * z^9
    let t44 = circuit_add(t42, t43); // Eval sparse poly line_0p_2 step + coeff_9 * z^9
    let t45 = circuit_mul(t36, t44); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t46 = circuit_mul(in0, in15);
    let t47 = circuit_add(in14, t46);
    let t48 = circuit_mul(t47, in13); // eval bn line by xNegOverY
    let t49 = circuit_mul(in0, in17);
    let t50 = circuit_add(in16, t49);
    let t51 = circuit_mul(t50, in12); // eval bn line by yInv
    let t52 = circuit_mul(in15, in13); // eval bn line by xNegOverY
    let t53 = circuit_mul(in17, in12); // eval bn line by yInv
    let t54 = circuit_mul(in0, in19);
    let t55 = circuit_add(in18, t54);
    let t56 = circuit_mul(t55, in13); // eval bn line by xNegOverY
    let t57 = circuit_mul(in0, in21);
    let t58 = circuit_add(in20, t57);
    let t59 = circuit_mul(t58, in12); // eval bn line by yInv
    let t60 = circuit_mul(in19, in13); // eval bn line by xNegOverY
    let t61 = circuit_mul(in21, in12); // eval bn line by yInv
    let t62 = circuit_mul(t48, in37); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t63 = circuit_add(in1, t62); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t64 = circuit_mul(t51, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t65 = circuit_add(t63, t64); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t66 = circuit_mul(t52, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t67 = circuit_add(t65, t66); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t68 = circuit_mul(t53, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t69 = circuit_add(t67, t68); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t70 = circuit_mul(t45, t69); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t71 = circuit_mul(t56, in37); // Eval sparse poly line_1p_2 step coeff_1 * z^1
    let t72 = circuit_add(in1, t71); // Eval sparse poly line_1p_2 step + coeff_1 * z^1
    let t73 = circuit_mul(t59, t1); // Eval sparse poly line_1p_2 step coeff_3 * z^3
    let t74 = circuit_add(t72, t73); // Eval sparse poly line_1p_2 step + coeff_3 * z^3
    let t75 = circuit_mul(t60, t5); // Eval sparse poly line_1p_2 step coeff_7 * z^7
    let t76 = circuit_add(t74, t75); // Eval sparse poly line_1p_2 step + coeff_7 * z^7
    let t77 = circuit_mul(t61, t7); // Eval sparse poly line_1p_2 step coeff_9 * z^9
    let t78 = circuit_add(t76, t77); // Eval sparse poly line_1p_2 step + coeff_9 * z^9
    let t79 = circuit_mul(t70, t78); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t80 = circuit_mul(t79, in36);
    let t81 = circuit_mul(in25, in37); // Eval f_i+1 step coeff_1 * z^1
    let t82 = circuit_add(in24, t81); // Eval f_i+1 step + (coeff_1 * z^1)
    let t83 = circuit_mul(in26, t0); // Eval f_i+1 step coeff_2 * z^2
    let t84 = circuit_add(t82, t83); // Eval f_i+1 step + (coeff_2 * z^2)
    let t85 = circuit_mul(in27, t1); // Eval f_i+1 step coeff_3 * z^3
    let t86 = circuit_add(t84, t85); // Eval f_i+1 step + (coeff_3 * z^3)
    let t87 = circuit_mul(in28, t2); // Eval f_i+1 step coeff_4 * z^4
    let t88 = circuit_add(t86, t87); // Eval f_i+1 step + (coeff_4 * z^4)
    let t89 = circuit_mul(in29, t3); // Eval f_i+1 step coeff_5 * z^5
    let t90 = circuit_add(t88, t89); // Eval f_i+1 step + (coeff_5 * z^5)
    let t91 = circuit_mul(in30, t4); // Eval f_i+1 step coeff_6 * z^6
    let t92 = circuit_add(t90, t91); // Eval f_i+1 step + (coeff_6 * z^6)
    let t93 = circuit_mul(in31, t5); // Eval f_i+1 step coeff_7 * z^7
    let t94 = circuit_add(t92, t93); // Eval f_i+1 step + (coeff_7 * z^7)
    let t95 = circuit_mul(in32, t6); // Eval f_i+1 step coeff_8 * z^8
    let t96 = circuit_add(t94, t95); // Eval f_i+1 step + (coeff_8 * z^8)
    let t97 = circuit_mul(in33, t7); // Eval f_i+1 step coeff_9 * z^9
    let t98 = circuit_add(t96, t97); // Eval f_i+1 step + (coeff_9 * z^9)
    let t99 = circuit_mul(in34, t8); // Eval f_i+1 step coeff_10 * z^10
    let t100 = circuit_add(t98, t99); // Eval f_i+1 step + (coeff_10 * z^10)
    let t101 = circuit_mul(in35, t9); // Eval f_i+1 step coeff_11 * z^11
    let t102 = circuit_add(t100, t101); // Eval f_i+1 step + (coeff_11 * z^11)
    let t103 = circuit_sub(t80, t102); // (Π(i,k) (Pk(z))) - Ri(z)
    let t104 = circuit_mul(t10, t103); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t105 = circuit_add(in22, t104); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t102, t105, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in2
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in7
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r0a0); // in8
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r0a1); // in9
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r1a0); // in10
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r1a1); // in11
    circuit_inputs = circuit_inputs.next(yInv_1); // in12
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in16
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in17
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r0a0); // in18
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r0a1); // in19
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r1a0); // in20
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r1a1); // in21
    circuit_inputs = circuit_inputs.next(lhs_i); // in22
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in23
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in24
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in25
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in26
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in27
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in28
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in29
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in30
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in31
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in32
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in33
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in34
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in35
    circuit_inputs = circuit_inputs.next(c_or_cinv_of_z); // in36
    circuit_inputs = circuit_inputs.next(z); // in37
    circuit_inputs = circuit_inputs.next(ci); // in38

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t102);
    let lhs_i_plus_one: u384 = outputs.get_output(t105);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BN254_MP_CHECK_BIT1_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    Q_or_Q_neg_line0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    Q_or_Q_neg_line1: G2Line,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    Q_or_Q_neg_2: G2Point,
    lhs_i: u384,
    f_i_of_z: u384,
    f_i_plus_one: E12D,
    c_or_cinv_of_z: u384,
    z: u384,
    ci: u384
) -> (G2Point, u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1
    let in2 = CE::<CI<2>> {}; // 0x0

    // INPUT stack
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let (in27, in28, in29) = (CE::<CI<27>> {}, CE::<CI<28>> {}, CE::<CI<29>> {});
    let (in30, in31, in32) = (CE::<CI<30>> {}, CE::<CI<31>> {}, CE::<CI<32>> {});
    let (in33, in34, in35) = (CE::<CI<33>> {}, CE::<CI<34>> {}, CE::<CI<35>> {});
    let (in36, in37, in38) = (CE::<CI<36>> {}, CE::<CI<37>> {}, CE::<CI<38>> {});
    let (in39, in40, in41) = (CE::<CI<39>> {}, CE::<CI<40>> {}, CE::<CI<41>> {});
    let (in42, in43, in44) = (CE::<CI<42>> {}, CE::<CI<43>> {}, CE::<CI<44>> {});
    let (in45, in46, in47) = (CE::<CI<45>> {}, CE::<CI<46>> {}, CE::<CI<47>> {});
    let (in48, in49) = (CE::<CI<48>> {}, CE::<CI<49>> {});
    let t0 = circuit_mul(in48, in48); // Compute z^2
    let t1 = circuit_mul(t0, in48); // Compute z^3
    let t2 = circuit_mul(t1, in48); // Compute z^4
    let t3 = circuit_mul(t2, in48); // Compute z^5
    let t4 = circuit_mul(t3, in48); // Compute z^6
    let t5 = circuit_mul(t4, in48); // Compute z^7
    let t6 = circuit_mul(t5, in48); // Compute z^8
    let t7 = circuit_mul(t6, in48); // Compute z^9
    let t8 = circuit_mul(t7, in48); // Compute z^10
    let t9 = circuit_mul(t8, in48); // Compute z^11
    let t10 = circuit_mul(in49, in49); // Compute c_i = (c_(i-1))^2
    let t11 = circuit_mul(in34, in34); // Square f evaluation in Z, the result of previous bit.
    let t12 = circuit_mul(in0, in6);
    let t13 = circuit_add(in5, t12);
    let t14 = circuit_mul(t13, in4); // eval bn line by xNegOverY
    let t15 = circuit_mul(in0, in8);
    let t16 = circuit_add(in7, t15);
    let t17 = circuit_mul(t16, in3); // eval bn line by yInv
    let t18 = circuit_mul(in6, in4); // eval bn line by xNegOverY
    let t19 = circuit_mul(in8, in3); // eval bn line by yInv
    let t20 = circuit_mul(in0, in10);
    let t21 = circuit_add(in9, t20);
    let t22 = circuit_mul(t21, in4); // eval bn line by xNegOverY
    let t23 = circuit_mul(in0, in12);
    let t24 = circuit_add(in11, t23);
    let t25 = circuit_mul(t24, in3); // eval bn line by yInv
    let t26 = circuit_mul(in10, in4); // eval bn line by xNegOverY
    let t27 = circuit_mul(in12, in3); // eval bn line by yInv
    let t28 = circuit_mul(t14, in48); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t29 = circuit_add(in1, t28); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t30 = circuit_mul(t17, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t31 = circuit_add(t29, t30); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t32 = circuit_mul(t18, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t33 = circuit_add(t31, t32); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t34 = circuit_mul(t19, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t35 = circuit_add(t33, t34); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t36 = circuit_mul(t11, t35); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t37 = circuit_mul(t22, in48); // Eval sparse poly line_0p_2 step coeff_1 * z^1
    let t38 = circuit_add(in1, t37); // Eval sparse poly line_0p_2 step + coeff_1 * z^1
    let t39 = circuit_mul(t25, t1); // Eval sparse poly line_0p_2 step coeff_3 * z^3
    let t40 = circuit_add(t38, t39); // Eval sparse poly line_0p_2 step + coeff_3 * z^3
    let t41 = circuit_mul(t26, t5); // Eval sparse poly line_0p_2 step coeff_7 * z^7
    let t42 = circuit_add(t40, t41); // Eval sparse poly line_0p_2 step + coeff_7 * z^7
    let t43 = circuit_mul(t27, t7); // Eval sparse poly line_0p_2 step coeff_9 * z^9
    let t44 = circuit_add(t42, t43); // Eval sparse poly line_0p_2 step + coeff_9 * z^9
    let t45 = circuit_mul(t36, t44); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_0(z)
    let t46 = circuit_mul(in0, in16);
    let t47 = circuit_add(in15, t46);
    let t48 = circuit_mul(t47, in14); // eval bn line by xNegOverY
    let t49 = circuit_mul(in0, in18);
    let t50 = circuit_add(in17, t49);
    let t51 = circuit_mul(t50, in13); // eval bn line by yInv
    let t52 = circuit_mul(in16, in14); // eval bn line by xNegOverY
    let t53 = circuit_mul(in18, in13); // eval bn line by yInv
    let t54 = circuit_mul(in0, in20);
    let t55 = circuit_add(in19, t54);
    let t56 = circuit_mul(t55, in14); // eval bn line by xNegOverY
    let t57 = circuit_mul(in0, in22);
    let t58 = circuit_add(in21, t57);
    let t59 = circuit_mul(t58, in13); // eval bn line by yInv
    let t60 = circuit_mul(in20, in14); // eval bn line by xNegOverY
    let t61 = circuit_mul(in22, in13); // eval bn line by yInv
    let t62 = circuit_mul(t48, in48); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t63 = circuit_add(in1, t62); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t64 = circuit_mul(t51, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t65 = circuit_add(t63, t64); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t66 = circuit_mul(t52, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t67 = circuit_add(t65, t66); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t68 = circuit_mul(t53, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t69 = circuit_add(t67, t68); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t70 = circuit_mul(t45, t69); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t71 = circuit_mul(t56, in48); // Eval sparse poly line_1p_2 step coeff_1 * z^1
    let t72 = circuit_add(in1, t71); // Eval sparse poly line_1p_2 step + coeff_1 * z^1
    let t73 = circuit_mul(t59, t1); // Eval sparse poly line_1p_2 step coeff_3 * z^3
    let t74 = circuit_add(t72, t73); // Eval sparse poly line_1p_2 step + coeff_3 * z^3
    let t75 = circuit_mul(t60, t5); // Eval sparse poly line_1p_2 step coeff_7 * z^7
    let t76 = circuit_add(t74, t75); // Eval sparse poly line_1p_2 step + coeff_7 * z^7
    let t77 = circuit_mul(t61, t7); // Eval sparse poly line_1p_2 step coeff_9 * z^9
    let t78 = circuit_add(t76, t77); // Eval sparse poly line_1p_2 step + coeff_9 * z^9
    let t79 = circuit_mul(t70, t78); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_1(z)
    let t80 = circuit_sub(in27, in31); // Fp2 sub coeff 0/1
    let t81 = circuit_sub(in28, in32); // Fp2 sub coeff 1/1
    let t82 = circuit_sub(in25, in29); // Fp2 sub coeff 0/1
    let t83 = circuit_sub(in26, in30); // Fp2 sub coeff 1/1
    let t84 = circuit_mul(t82, t82); // Fp2 Div x/y start : Fp2 Inv y start
    let t85 = circuit_mul(t83, t83);
    let t86 = circuit_add(t84, t85);
    let t87 = circuit_inverse(t86);
    let t88 = circuit_mul(t82, t87); // Fp2 Inv y real part end
    let t89 = circuit_mul(t83, t87);
    let t90 = circuit_sub(in2, t89); // Fp2 Inv y imag part end
    let t91 = circuit_mul(t80, t88); // Fp2 mul start
    let t92 = circuit_mul(t81, t90);
    let t93 = circuit_sub(t91, t92); // Fp2 mul real part end
    let t94 = circuit_mul(t80, t90);
    let t95 = circuit_mul(t81, t88);
    let t96 = circuit_add(t94, t95); // Fp2 mul imag part end
    let t97 = circuit_add(t93, t96);
    let t98 = circuit_sub(t93, t96);
    let t99 = circuit_mul(t97, t98);
    let t100 = circuit_mul(t93, t96);
    let t101 = circuit_add(t100, t100);
    let t102 = circuit_add(in25, in29); // Fp2 add coeff 0/1
    let t103 = circuit_add(in26, in30); // Fp2 add coeff 1/1
    let t104 = circuit_sub(t99, t102); // Fp2 sub coeff 0/1
    let t105 = circuit_sub(t101, t103); // Fp2 sub coeff 1/1
    let t106 = circuit_mul(t93, in25); // Fp2 mul start
    let t107 = circuit_mul(t96, in26);
    let t108 = circuit_sub(t106, t107); // Fp2 mul real part end
    let t109 = circuit_mul(t93, in26);
    let t110 = circuit_mul(t96, in25);
    let t111 = circuit_add(t109, t110); // Fp2 mul imag part end
    let t112 = circuit_sub(t108, in27); // Fp2 sub coeff 0/1
    let t113 = circuit_sub(t111, in28); // Fp2 sub coeff 1/1
    let t114 = circuit_add(in27, in27); // Fp2 add coeff 0/1
    let t115 = circuit_add(in28, in28); // Fp2 add coeff 1/1
    let t116 = circuit_sub(t104, in25); // Fp2 sub coeff 0/1
    let t117 = circuit_sub(t105, in26); // Fp2 sub coeff 1/1
    let t118 = circuit_mul(t116, t116); // Fp2 Div x/y start : Fp2 Inv y start
    let t119 = circuit_mul(t117, t117);
    let t120 = circuit_add(t118, t119);
    let t121 = circuit_inverse(t120);
    let t122 = circuit_mul(t116, t121); // Fp2 Inv y real part end
    let t123 = circuit_mul(t117, t121);
    let t124 = circuit_sub(in2, t123); // Fp2 Inv y imag part end
    let t125 = circuit_mul(t114, t122); // Fp2 mul start
    let t126 = circuit_mul(t115, t124);
    let t127 = circuit_sub(t125, t126); // Fp2 mul real part end
    let t128 = circuit_mul(t114, t124);
    let t129 = circuit_mul(t115, t122);
    let t130 = circuit_add(t128, t129); // Fp2 mul imag part end
    let t131 = circuit_add(t93, t127); // Fp2 add coeff 0/1
    let t132 = circuit_add(t96, t130); // Fp2 add coeff 1/1
    let t133 = circuit_sub(in2, t131); // Fp2 neg coeff 0/1
    let t134 = circuit_sub(in2, t132); // Fp2 neg coeff 1/1
    let t135 = circuit_add(t133, t134);
    let t136 = circuit_sub(t133, t134);
    let t137 = circuit_mul(t135, t136);
    let t138 = circuit_mul(t133, t134);
    let t139 = circuit_add(t138, t138);
    let t140 = circuit_sub(t137, in25); // Fp2 sub coeff 0/1
    let t141 = circuit_sub(t139, in26); // Fp2 sub coeff 1/1
    let t142 = circuit_sub(t140, t104); // Fp2 sub coeff 0/1
    let t143 = circuit_sub(t141, t105); // Fp2 sub coeff 1/1
    let t144 = circuit_sub(in25, t142); // Fp2 sub coeff 0/1
    let t145 = circuit_sub(in26, t143); // Fp2 sub coeff 1/1
    let t146 = circuit_mul(t133, t144); // Fp2 mul start
    let t147 = circuit_mul(t134, t145);
    let t148 = circuit_sub(t146, t147); // Fp2 mul real part end
    let t149 = circuit_mul(t133, t145);
    let t150 = circuit_mul(t134, t144);
    let t151 = circuit_add(t149, t150); // Fp2 mul imag part end
    let t152 = circuit_sub(t148, in27); // Fp2 sub coeff 0/1
    let t153 = circuit_sub(t151, in28); // Fp2 sub coeff 1/1
    let t154 = circuit_mul(t133, in25); // Fp2 mul start
    let t155 = circuit_mul(t134, in26);
    let t156 = circuit_sub(t154, t155); // Fp2 mul real part end
    let t157 = circuit_mul(t133, in26);
    let t158 = circuit_mul(t134, in25);
    let t159 = circuit_add(t157, t158); // Fp2 mul imag part end
    let t160 = circuit_sub(t156, in27); // Fp2 sub coeff 0/1
    let t161 = circuit_sub(t159, in28); // Fp2 sub coeff 1/1
    let t162 = circuit_mul(in0, t96);
    let t163 = circuit_add(t93, t162);
    let t164 = circuit_mul(t163, in24); // eval bn line by xNegOverY
    let t165 = circuit_mul(in0, t113);
    let t166 = circuit_add(t112, t165);
    let t167 = circuit_mul(t166, in23); // eval bn line by yInv
    let t168 = circuit_mul(t96, in24); // eval bn line by xNegOverY
    let t169 = circuit_mul(t113, in23); // eval bn line by yInv
    let t170 = circuit_mul(in0, t134);
    let t171 = circuit_add(t133, t170);
    let t172 = circuit_mul(t171, in24); // eval bn line by xNegOverY
    let t173 = circuit_mul(in0, t161);
    let t174 = circuit_add(t160, t173);
    let t175 = circuit_mul(t174, in23); // eval bn line by yInv
    let t176 = circuit_mul(t134, in24); // eval bn line by xNegOverY
    let t177 = circuit_mul(t161, in23); // eval bn line by yInv
    let t178 = circuit_mul(t164, in48); // Eval sparse poly line_2p_1 step coeff_1 * z^1
    let t179 = circuit_add(in1, t178); // Eval sparse poly line_2p_1 step + coeff_1 * z^1
    let t180 = circuit_mul(t167, t1); // Eval sparse poly line_2p_1 step coeff_3 * z^3
    let t181 = circuit_add(t179, t180); // Eval sparse poly line_2p_1 step + coeff_3 * z^3
    let t182 = circuit_mul(t168, t5); // Eval sparse poly line_2p_1 step coeff_7 * z^7
    let t183 = circuit_add(t181, t182); // Eval sparse poly line_2p_1 step + coeff_7 * z^7
    let t184 = circuit_mul(t169, t7); // Eval sparse poly line_2p_1 step coeff_9 * z^9
    let t185 = circuit_add(t183, t184); // Eval sparse poly line_2p_1 step + coeff_9 * z^9
    let t186 = circuit_mul(t79, t185); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t187 = circuit_mul(t172, in48); // Eval sparse poly line_2p_2 step coeff_1 * z^1
    let t188 = circuit_add(in1, t187); // Eval sparse poly line_2p_2 step + coeff_1 * z^1
    let t189 = circuit_mul(t175, t1); // Eval sparse poly line_2p_2 step coeff_3 * z^3
    let t190 = circuit_add(t188, t189); // Eval sparse poly line_2p_2 step + coeff_3 * z^3
    let t191 = circuit_mul(t176, t5); // Eval sparse poly line_2p_2 step coeff_7 * z^7
    let t192 = circuit_add(t190, t191); // Eval sparse poly line_2p_2 step + coeff_7 * z^7
    let t193 = circuit_mul(t177, t7); // Eval sparse poly line_2p_2 step coeff_9 * z^9
    let t194 = circuit_add(t192, t193); // Eval sparse poly line_2p_2 step + coeff_9 * z^9
    let t195 = circuit_mul(t186, t194); // Mul (f(z)^2 * Π_0_k-1(line_k(z))) * line_i_2(z)
    let t196 = circuit_mul(t195, in47);
    let t197 = circuit_mul(in36, in48); // Eval f_i+1 step coeff_1 * z^1
    let t198 = circuit_add(in35, t197); // Eval f_i+1 step + (coeff_1 * z^1)
    let t199 = circuit_mul(in37, t0); // Eval f_i+1 step coeff_2 * z^2
    let t200 = circuit_add(t198, t199); // Eval f_i+1 step + (coeff_2 * z^2)
    let t201 = circuit_mul(in38, t1); // Eval f_i+1 step coeff_3 * z^3
    let t202 = circuit_add(t200, t201); // Eval f_i+1 step + (coeff_3 * z^3)
    let t203 = circuit_mul(in39, t2); // Eval f_i+1 step coeff_4 * z^4
    let t204 = circuit_add(t202, t203); // Eval f_i+1 step + (coeff_4 * z^4)
    let t205 = circuit_mul(in40, t3); // Eval f_i+1 step coeff_5 * z^5
    let t206 = circuit_add(t204, t205); // Eval f_i+1 step + (coeff_5 * z^5)
    let t207 = circuit_mul(in41, t4); // Eval f_i+1 step coeff_6 * z^6
    let t208 = circuit_add(t206, t207); // Eval f_i+1 step + (coeff_6 * z^6)
    let t209 = circuit_mul(in42, t5); // Eval f_i+1 step coeff_7 * z^7
    let t210 = circuit_add(t208, t209); // Eval f_i+1 step + (coeff_7 * z^7)
    let t211 = circuit_mul(in43, t6); // Eval f_i+1 step coeff_8 * z^8
    let t212 = circuit_add(t210, t211); // Eval f_i+1 step + (coeff_8 * z^8)
    let t213 = circuit_mul(in44, t7); // Eval f_i+1 step coeff_9 * z^9
    let t214 = circuit_add(t212, t213); // Eval f_i+1 step + (coeff_9 * z^9)
    let t215 = circuit_mul(in45, t8); // Eval f_i+1 step coeff_10 * z^10
    let t216 = circuit_add(t214, t215); // Eval f_i+1 step + (coeff_10 * z^10)
    let t217 = circuit_mul(in46, t9); // Eval f_i+1 step coeff_11 * z^11
    let t218 = circuit_add(t216, t217); // Eval f_i+1 step + (coeff_11 * z^11)
    let t219 = circuit_sub(t196, t218); // (Π(i,k) (Pk(z))) - Ri(z)
    let t220 = circuit_mul(t10, t219); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t221 = circuit_add(in33, t220); // LHS = LHS + ci * ((Π(i,k) (Pk(z)) - Ri(z))

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t142, t143, t152, t153, t218, t221, t10,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in2
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in3
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in7
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in8
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r0a0); // in9
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r0a1); // in10
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r1a0); // in11
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line0.r1a1); // in12
    circuit_inputs = circuit_inputs.next(yInv_1); // in13
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in16
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in17
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in18
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r0a0); // in19
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r0a1); // in20
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r1a0); // in21
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_line1.r1a1); // in22
    circuit_inputs = circuit_inputs.next(yInv_2); // in23
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in24
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in25
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in26
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in27
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in28
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_2.x0); // in29
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_2.x1); // in30
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_2.y0); // in31
    circuit_inputs = circuit_inputs.next(Q_or_Q_neg_2.y1); // in32
    circuit_inputs = circuit_inputs.next(lhs_i); // in33
    circuit_inputs = circuit_inputs.next(f_i_of_z); // in34
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w0); // in35
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w1); // in36
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w2); // in37
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w3); // in38
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w4); // in39
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w5); // in40
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w6); // in41
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w7); // in42
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w8); // in43
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w9); // in44
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w10); // in45
    circuit_inputs = circuit_inputs.next(f_i_plus_one.w11); // in46
    circuit_inputs = circuit_inputs.next(c_or_cinv_of_z); // in47
    circuit_inputs = circuit_inputs.next(z); // in48
    circuit_inputs = circuit_inputs.next(ci); // in49

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let Q0: G2Point = G2Point {
        x0: outputs.get_output(t142),
        x1: outputs.get_output(t143),
        y0: outputs.get_output(t152),
        y1: outputs.get_output(t153)
    };
    let f_i_plus_one_of_z: u384 = outputs.get_output(t218);
    let lhs_i_plus_one: u384 = outputs.get_output(t221);
    let ci_plus_one: u384 = outputs.get_output(t10);
    return (Q0, f_i_plus_one_of_z, lhs_i_plus_one, ci_plus_one);
}
fn run_BN254_MP_CHECK_FINALIZE_BN_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    line_1_0: G2Line,
    line_2_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    line_1_1: G2Line,
    line_2_1: G2Line,
    R_n_minus_2: E12D,
    R_n_minus_1: E12D,
    c_n_minus_3: u384,
    w_of_z: u384,
    z: u384,
    c_inv_frob_1_of_z: u384,
    c_frob_2_of_z: u384,
    c_inv_frob_3_of_z: u384,
    previous_lhs: u384,
    R_n_minus_3_of_z: u384,
    Q: Array<u384>
) -> (u384,) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1
    let in2 = CE::<CI<2>> {}; // 0x52
    let in3 = CE::<CI<3>> {}; // -0x12 % p

    // INPUT stack
    let (in4, in5, in6) = (CE::<CI<4>> {}, CE::<CI<5>> {}, CE::<CI<6>> {});
    let (in7, in8, in9) = (CE::<CI<7>> {}, CE::<CI<8>> {}, CE::<CI<9>> {});
    let (in10, in11, in12) = (CE::<CI<10>> {}, CE::<CI<11>> {}, CE::<CI<12>> {});
    let (in13, in14, in15) = (CE::<CI<13>> {}, CE::<CI<14>> {}, CE::<CI<15>> {});
    let (in16, in17, in18) = (CE::<CI<16>> {}, CE::<CI<17>> {}, CE::<CI<18>> {});
    let (in19, in20, in21) = (CE::<CI<19>> {}, CE::<CI<20>> {}, CE::<CI<21>> {});
    let (in22, in23, in24) = (CE::<CI<22>> {}, CE::<CI<23>> {}, CE::<CI<24>> {});
    let (in25, in26, in27) = (CE::<CI<25>> {}, CE::<CI<26>> {}, CE::<CI<27>> {});
    let (in28, in29, in30) = (CE::<CI<28>> {}, CE::<CI<29>> {}, CE::<CI<30>> {});
    let (in31, in32, in33) = (CE::<CI<31>> {}, CE::<CI<32>> {}, CE::<CI<33>> {});
    let (in34, in35, in36) = (CE::<CI<34>> {}, CE::<CI<35>> {}, CE::<CI<36>> {});
    let (in37, in38, in39) = (CE::<CI<37>> {}, CE::<CI<38>> {}, CE::<CI<39>> {});
    let (in40, in41, in42) = (CE::<CI<40>> {}, CE::<CI<41>> {}, CE::<CI<42>> {});
    let (in43, in44, in45) = (CE::<CI<43>> {}, CE::<CI<44>> {}, CE::<CI<45>> {});
    let (in46, in47, in48) = (CE::<CI<46>> {}, CE::<CI<47>> {}, CE::<CI<48>> {});
    let (in49, in50, in51) = (CE::<CI<49>> {}, CE::<CI<50>> {}, CE::<CI<51>> {});
    let (in52, in53, in54) = (CE::<CI<52>> {}, CE::<CI<53>> {}, CE::<CI<54>> {});
    let (in55, in56, in57) = (CE::<CI<55>> {}, CE::<CI<56>> {}, CE::<CI<57>> {});
    let (in58, in59, in60) = (CE::<CI<58>> {}, CE::<CI<59>> {}, CE::<CI<60>> {});
    let (in61, in62, in63) = (CE::<CI<61>> {}, CE::<CI<62>> {}, CE::<CI<63>> {});
    let (in64, in65, in66) = (CE::<CI<64>> {}, CE::<CI<65>> {}, CE::<CI<66>> {});
    let (in67, in68, in69) = (CE::<CI<67>> {}, CE::<CI<68>> {}, CE::<CI<69>> {});
    let (in70, in71, in72) = (CE::<CI<70>> {}, CE::<CI<71>> {}, CE::<CI<72>> {});
    let (in73, in74, in75) = (CE::<CI<73>> {}, CE::<CI<74>> {}, CE::<CI<75>> {});
    let (in76, in77, in78) = (CE::<CI<76>> {}, CE::<CI<77>> {}, CE::<CI<78>> {});
    let (in79, in80, in81) = (CE::<CI<79>> {}, CE::<CI<80>> {}, CE::<CI<81>> {});
    let (in82, in83, in84) = (CE::<CI<82>> {}, CE::<CI<83>> {}, CE::<CI<84>> {});
    let (in85, in86, in87) = (CE::<CI<85>> {}, CE::<CI<86>> {}, CE::<CI<87>> {});
    let (in88, in89, in90) = (CE::<CI<88>> {}, CE::<CI<89>> {}, CE::<CI<90>> {});
    let (in91, in92, in93) = (CE::<CI<91>> {}, CE::<CI<92>> {}, CE::<CI<93>> {});
    let (in94, in95, in96) = (CE::<CI<94>> {}, CE::<CI<95>> {}, CE::<CI<96>> {});
    let (in97, in98, in99) = (CE::<CI<97>> {}, CE::<CI<98>> {}, CE::<CI<99>> {});
    let (in100, in101, in102) = (CE::<CI<100>> {}, CE::<CI<101>> {}, CE::<CI<102>> {});
    let (in103, in104, in105) = (CE::<CI<103>> {}, CE::<CI<104>> {}, CE::<CI<105>> {});
    let (in106, in107, in108) = (CE::<CI<106>> {}, CE::<CI<107>> {}, CE::<CI<108>> {});
    let (in109, in110, in111) = (CE::<CI<109>> {}, CE::<CI<110>> {}, CE::<CI<111>> {});
    let (in112, in113, in114) = (CE::<CI<112>> {}, CE::<CI<113>> {}, CE::<CI<114>> {});
    let (in115, in116, in117) = (CE::<CI<115>> {}, CE::<CI<116>> {}, CE::<CI<117>> {});
    let (in118, in119, in120) = (CE::<CI<118>> {}, CE::<CI<119>> {}, CE::<CI<120>> {});
    let (in121, in122, in123) = (CE::<CI<121>> {}, CE::<CI<122>> {}, CE::<CI<123>> {});
    let (in124, in125, in126) = (CE::<CI<124>> {}, CE::<CI<125>> {}, CE::<CI<126>> {});
    let (in127, in128, in129) = (CE::<CI<127>> {}, CE::<CI<128>> {}, CE::<CI<129>> {});
    let (in130, in131, in132) = (CE::<CI<130>> {}, CE::<CI<131>> {}, CE::<CI<132>> {});
    let (in133, in134, in135) = (CE::<CI<133>> {}, CE::<CI<134>> {}, CE::<CI<135>> {});
    let (in136, in137, in138) = (CE::<CI<136>> {}, CE::<CI<137>> {}, CE::<CI<138>> {});
    let (in139, in140, in141) = (CE::<CI<139>> {}, CE::<CI<140>> {}, CE::<CI<141>> {});
    let in142 = CE::<CI<142>> {};
    let t0 = circuit_mul(in50, in50); // Compute z^2
    let t1 = circuit_mul(t0, in50); // Compute z^3
    let t2 = circuit_mul(t1, in50); // Compute z^4
    let t3 = circuit_mul(t2, in50); // Compute z^5
    let t4 = circuit_mul(t3, in50); // Compute z^6
    let t5 = circuit_mul(t4, in50); // Compute z^7
    let t6 = circuit_mul(t5, in50); // Compute z^8
    let t7 = circuit_mul(t6, in50); // Compute z^9
    let t8 = circuit_mul(t7, in50); // Compute z^10
    let t9 = circuit_mul(t8, in50); // Compute z^11
    let t10 = circuit_mul(t9, in50); // Compute z^12
    let t11 = circuit_mul(t10, in50); // Compute z^13
    let t12 = circuit_mul(t11, in50); // Compute z^14
    let t13 = circuit_mul(t12, in50); // Compute z^15
    let t14 = circuit_mul(t13, in50); // Compute z^16
    let t15 = circuit_mul(t14, in50); // Compute z^17
    let t16 = circuit_mul(t15, in50); // Compute z^18
    let t17 = circuit_mul(t16, in50); // Compute z^19
    let t18 = circuit_mul(t17, in50); // Compute z^20
    let t19 = circuit_mul(t18, in50); // Compute z^21
    let t20 = circuit_mul(t19, in50); // Compute z^22
    let t21 = circuit_mul(t20, in50); // Compute z^23
    let t22 = circuit_mul(t21, in50); // Compute z^24
    let t23 = circuit_mul(t22, in50); // Compute z^25
    let t24 = circuit_mul(t23, in50); // Compute z^26
    let t25 = circuit_mul(t24, in50); // Compute z^27
    let t26 = circuit_mul(t25, in50); // Compute z^28
    let t27 = circuit_mul(t26, in50); // Compute z^29
    let t28 = circuit_mul(t27, in50); // Compute z^30
    let t29 = circuit_mul(t28, in50); // Compute z^31
    let t30 = circuit_mul(t29, in50); // Compute z^32
    let t31 = circuit_mul(t30, in50); // Compute z^33
    let t32 = circuit_mul(t31, in50); // Compute z^34
    let t33 = circuit_mul(t32, in50); // Compute z^35
    let t34 = circuit_mul(t33, in50); // Compute z^36
    let t35 = circuit_mul(t34, in50); // Compute z^37
    let t36 = circuit_mul(t35, in50); // Compute z^38
    let t37 = circuit_mul(t36, in50); // Compute z^39
    let t38 = circuit_mul(t37, in50); // Compute z^40
    let t39 = circuit_mul(t38, in50); // Compute z^41
    let t40 = circuit_mul(t39, in50); // Compute z^42
    let t41 = circuit_mul(t40, in50); // Compute z^43
    let t42 = circuit_mul(t41, in50); // Compute z^44
    let t43 = circuit_mul(t42, in50); // Compute z^45
    let t44 = circuit_mul(t43, in50); // Compute z^46
    let t45 = circuit_mul(t44, in50); // Compute z^47
    let t46 = circuit_mul(t45, in50); // Compute z^48
    let t47 = circuit_mul(t46, in50); // Compute z^49
    let t48 = circuit_mul(t47, in50); // Compute z^50
    let t49 = circuit_mul(t48, in50); // Compute z^51
    let t50 = circuit_mul(t49, in50); // Compute z^52
    let t51 = circuit_mul(t50, in50); // Compute z^53
    let t52 = circuit_mul(t51, in50); // Compute z^54
    let t53 = circuit_mul(t52, in50); // Compute z^55
    let t54 = circuit_mul(t53, in50); // Compute z^56
    let t55 = circuit_mul(t54, in50); // Compute z^57
    let t56 = circuit_mul(t55, in50); // Compute z^58
    let t57 = circuit_mul(t56, in50); // Compute z^59
    let t58 = circuit_mul(t57, in50); // Compute z^60
    let t59 = circuit_mul(t58, in50); // Compute z^61
    let t60 = circuit_mul(t59, in50); // Compute z^62
    let t61 = circuit_mul(t60, in50); // Compute z^63
    let t62 = circuit_mul(t61, in50); // Compute z^64
    let t63 = circuit_mul(t62, in50); // Compute z^65
    let t64 = circuit_mul(t63, in50); // Compute z^66
    let t65 = circuit_mul(t64, in50); // Compute z^67
    let t66 = circuit_mul(t65, in50); // Compute z^68
    let t67 = circuit_mul(t66, in50); // Compute z^69
    let t68 = circuit_mul(t67, in50); // Compute z^70
    let t69 = circuit_mul(t68, in50); // Compute z^71
    let t70 = circuit_mul(t69, in50); // Compute z^72
    let t71 = circuit_mul(t70, in50); // Compute z^73
    let t72 = circuit_mul(t71, in50); // Compute z^74
    let t73 = circuit_mul(t72, in50); // Compute z^75
    let t74 = circuit_mul(t73, in50); // Compute z^76
    let t75 = circuit_mul(t74, in50); // Compute z^77
    let t76 = circuit_mul(t75, in50); // Compute z^78
    let t77 = circuit_mul(t76, in50); // Compute z^79
    let t78 = circuit_mul(t77, in50); // Compute z^80
    let t79 = circuit_mul(t78, in50); // Compute z^81
    let t80 = circuit_mul(t79, in50); // Compute z^82
    let t81 = circuit_mul(t80, in50); // Compute z^83
    let t82 = circuit_mul(t81, in50); // Compute z^84
    let t83 = circuit_mul(t82, in50); // Compute z^85
    let t84 = circuit_mul(t83, in50); // Compute z^86
    let t85 = circuit_mul(in48, in48);
    let t86 = circuit_mul(t85, t85);
    let t87 = circuit_mul(in25, in50); // Eval R_n_minus_2 step coeff_1 * z^1
    let t88 = circuit_add(in24, t87); // Eval R_n_minus_2 step + (coeff_1 * z^1)
    let t89 = circuit_mul(in26, t0); // Eval R_n_minus_2 step coeff_2 * z^2
    let t90 = circuit_add(t88, t89); // Eval R_n_minus_2 step + (coeff_2 * z^2)
    let t91 = circuit_mul(in27, t1); // Eval R_n_minus_2 step coeff_3 * z^3
    let t92 = circuit_add(t90, t91); // Eval R_n_minus_2 step + (coeff_3 * z^3)
    let t93 = circuit_mul(in28, t2); // Eval R_n_minus_2 step coeff_4 * z^4
    let t94 = circuit_add(t92, t93); // Eval R_n_minus_2 step + (coeff_4 * z^4)
    let t95 = circuit_mul(in29, t3); // Eval R_n_minus_2 step coeff_5 * z^5
    let t96 = circuit_add(t94, t95); // Eval R_n_minus_2 step + (coeff_5 * z^5)
    let t97 = circuit_mul(in30, t4); // Eval R_n_minus_2 step coeff_6 * z^6
    let t98 = circuit_add(t96, t97); // Eval R_n_minus_2 step + (coeff_6 * z^6)
    let t99 = circuit_mul(in31, t5); // Eval R_n_minus_2 step coeff_7 * z^7
    let t100 = circuit_add(t98, t99); // Eval R_n_minus_2 step + (coeff_7 * z^7)
    let t101 = circuit_mul(in32, t6); // Eval R_n_minus_2 step coeff_8 * z^8
    let t102 = circuit_add(t100, t101); // Eval R_n_minus_2 step + (coeff_8 * z^8)
    let t103 = circuit_mul(in33, t7); // Eval R_n_minus_2 step coeff_9 * z^9
    let t104 = circuit_add(t102, t103); // Eval R_n_minus_2 step + (coeff_9 * z^9)
    let t105 = circuit_mul(in34, t8); // Eval R_n_minus_2 step coeff_10 * z^10
    let t106 = circuit_add(t104, t105); // Eval R_n_minus_2 step + (coeff_10 * z^10)
    let t107 = circuit_mul(in35, t9); // Eval R_n_minus_2 step coeff_11 * z^11
    let t108 = circuit_add(t106, t107); // Eval R_n_minus_2 step + (coeff_11 * z^11)
    let t109 = circuit_mul(in37, in50); // Eval R_n_minus_1 step coeff_1 * z^1
    let t110 = circuit_add(in36, t109); // Eval R_n_minus_1 step + (coeff_1 * z^1)
    let t111 = circuit_mul(in38, t0); // Eval R_n_minus_1 step coeff_2 * z^2
    let t112 = circuit_add(t110, t111); // Eval R_n_minus_1 step + (coeff_2 * z^2)
    let t113 = circuit_mul(in39, t1); // Eval R_n_minus_1 step coeff_3 * z^3
    let t114 = circuit_add(t112, t113); // Eval R_n_minus_1 step + (coeff_3 * z^3)
    let t115 = circuit_mul(in40, t2); // Eval R_n_minus_1 step coeff_4 * z^4
    let t116 = circuit_add(t114, t115); // Eval R_n_minus_1 step + (coeff_4 * z^4)
    let t117 = circuit_mul(in41, t3); // Eval R_n_minus_1 step coeff_5 * z^5
    let t118 = circuit_add(t116, t117); // Eval R_n_minus_1 step + (coeff_5 * z^5)
    let t119 = circuit_mul(in42, t4); // Eval R_n_minus_1 step coeff_6 * z^6
    let t120 = circuit_add(t118, t119); // Eval R_n_minus_1 step + (coeff_6 * z^6)
    let t121 = circuit_mul(in43, t5); // Eval R_n_minus_1 step coeff_7 * z^7
    let t122 = circuit_add(t120, t121); // Eval R_n_minus_1 step + (coeff_7 * z^7)
    let t123 = circuit_mul(in44, t6); // Eval R_n_minus_1 step coeff_8 * z^8
    let t124 = circuit_add(t122, t123); // Eval R_n_minus_1 step + (coeff_8 * z^8)
    let t125 = circuit_mul(in45, t7); // Eval R_n_minus_1 step coeff_9 * z^9
    let t126 = circuit_add(t124, t125); // Eval R_n_minus_1 step + (coeff_9 * z^9)
    let t127 = circuit_mul(in46, t8); // Eval R_n_minus_1 step coeff_10 * z^10
    let t128 = circuit_add(t126, t127); // Eval R_n_minus_1 step + (coeff_10 * z^10)
    let t129 = circuit_mul(in47, t9); // Eval R_n_minus_1 step coeff_11 * z^11
    let t130 = circuit_add(t128, t129); // Eval R_n_minus_1 step + (coeff_11 * z^11)
    let t131 = circuit_mul(in0, in7);
    let t132 = circuit_add(in6, t131);
    let t133 = circuit_mul(t132, in5); // eval bn line by xNegOverY
    let t134 = circuit_mul(in0, in9);
    let t135 = circuit_add(in8, t134);
    let t136 = circuit_mul(t135, in4); // eval bn line by yInv
    let t137 = circuit_mul(in7, in5); // eval bn line by xNegOverY
    let t138 = circuit_mul(in9, in4); // eval bn line by yInv
    let t139 = circuit_mul(in0, in11);
    let t140 = circuit_add(in10, t139);
    let t141 = circuit_mul(t140, in5); // eval bn line by xNegOverY
    let t142 = circuit_mul(in0, in13);
    let t143 = circuit_add(in12, t142);
    let t144 = circuit_mul(t143, in4); // eval bn line by yInv
    let t145 = circuit_mul(in11, in5); // eval bn line by xNegOverY
    let t146 = circuit_mul(in13, in4); // eval bn line by yInv
    let t147 = circuit_mul(in0, in17);
    let t148 = circuit_add(in16, t147);
    let t149 = circuit_mul(t148, in15); // eval bn line by xNegOverY
    let t150 = circuit_mul(in0, in19);
    let t151 = circuit_add(in18, t150);
    let t152 = circuit_mul(t151, in14); // eval bn line by yInv
    let t153 = circuit_mul(in17, in15); // eval bn line by xNegOverY
    let t154 = circuit_mul(in19, in14); // eval bn line by yInv
    let t155 = circuit_mul(in0, in21);
    let t156 = circuit_add(in20, t155);
    let t157 = circuit_mul(t156, in15); // eval bn line by xNegOverY
    let t158 = circuit_mul(in0, in23);
    let t159 = circuit_add(in22, t158);
    let t160 = circuit_mul(t159, in14); // eval bn line by yInv
    let t161 = circuit_mul(in21, in15); // eval bn line by xNegOverY
    let t162 = circuit_mul(in23, in14); // eval bn line by yInv
    let t163 = circuit_mul(t133, in50); // Eval sparse poly line_1 step coeff_1 * z^1
    let t164 = circuit_add(in1, t163); // Eval sparse poly line_1 step + coeff_1 * z^1
    let t165 = circuit_mul(t136, t1); // Eval sparse poly line_1 step coeff_3 * z^3
    let t166 = circuit_add(t164, t165); // Eval sparse poly line_1 step + coeff_3 * z^3
    let t167 = circuit_mul(t137, t5); // Eval sparse poly line_1 step coeff_7 * z^7
    let t168 = circuit_add(t166, t167); // Eval sparse poly line_1 step + coeff_7 * z^7
    let t169 = circuit_mul(t138, t7); // Eval sparse poly line_1 step coeff_9 * z^9
    let t170 = circuit_add(t168, t169); // Eval sparse poly line_1 step + coeff_9 * z^9
    let t171 = circuit_mul(in55, t170);
    let t172 = circuit_mul(t141, in50); // Eval sparse poly line_1 step coeff_1 * z^1
    let t173 = circuit_add(in1, t172); // Eval sparse poly line_1 step + coeff_1 * z^1
    let t174 = circuit_mul(t144, t1); // Eval sparse poly line_1 step coeff_3 * z^3
    let t175 = circuit_add(t173, t174); // Eval sparse poly line_1 step + coeff_3 * z^3
    let t176 = circuit_mul(t145, t5); // Eval sparse poly line_1 step coeff_7 * z^7
    let t177 = circuit_add(t175, t176); // Eval sparse poly line_1 step + coeff_7 * z^7
    let t178 = circuit_mul(t146, t7); // Eval sparse poly line_1 step coeff_9 * z^9
    let t179 = circuit_add(t177, t178); // Eval sparse poly line_1 step + coeff_9 * z^9
    let t180 = circuit_mul(t171, t179);
    let t181 = circuit_mul(t149, in50); // Eval sparse poly line_1 step coeff_1 * z^1
    let t182 = circuit_add(in1, t181); // Eval sparse poly line_1 step + coeff_1 * z^1
    let t183 = circuit_mul(t152, t1); // Eval sparse poly line_1 step coeff_3 * z^3
    let t184 = circuit_add(t182, t183); // Eval sparse poly line_1 step + coeff_3 * z^3
    let t185 = circuit_mul(t153, t5); // Eval sparse poly line_1 step coeff_7 * z^7
    let t186 = circuit_add(t184, t185); // Eval sparse poly line_1 step + coeff_7 * z^7
    let t187 = circuit_mul(t154, t7); // Eval sparse poly line_1 step coeff_9 * z^9
    let t188 = circuit_add(t186, t187); // Eval sparse poly line_1 step + coeff_9 * z^9
    let t189 = circuit_mul(t180, t188);
    let t190 = circuit_mul(t157, in50); // Eval sparse poly line_1 step coeff_1 * z^1
    let t191 = circuit_add(in1, t190); // Eval sparse poly line_1 step + coeff_1 * z^1
    let t192 = circuit_mul(t160, t1); // Eval sparse poly line_1 step coeff_3 * z^3
    let t193 = circuit_add(t191, t192); // Eval sparse poly line_1 step + coeff_3 * z^3
    let t194 = circuit_mul(t161, t5); // Eval sparse poly line_1 step coeff_7 * z^7
    let t195 = circuit_add(t193, t194); // Eval sparse poly line_1 step + coeff_7 * z^7
    let t196 = circuit_mul(t162, t7); // Eval sparse poly line_1 step coeff_9 * z^9
    let t197 = circuit_add(t195, t196); // Eval sparse poly line_1 step + coeff_9 * z^9
    let t198 = circuit_mul(t189, t197);
    let t199 = circuit_sub(t198, t108);
    let t200 = circuit_mul(t85, t199); // c_n_minus_2 * ((Π(n-2,k) (Pk(z)) - R_n_minus_2(z))
    let t201 = circuit_mul(t108, in51);
    let t202 = circuit_mul(t201, in52);
    let t203 = circuit_mul(t202, in53);
    let t204 = circuit_mul(t203, in49);
    let t205 = circuit_sub(t204, t130);
    let t206 = circuit_mul(t86, t205); // c_n_minus_1 * ((Π(n-1,k) (Pk(z)) - R_n_minus_1(z))
    let t207 = circuit_add(in54, t200);
    let t208 = circuit_add(t207, t206);
    let t209 = circuit_mul(in57, in50); // Eval big_Q step coeff_1 * z^1
    let t210 = circuit_add(in56, t209); // Eval big_Q step + (coeff_1 * z^1)
    let t211 = circuit_mul(in58, t0); // Eval big_Q step coeff_2 * z^2
    let t212 = circuit_add(t210, t211); // Eval big_Q step + (coeff_2 * z^2)
    let t213 = circuit_mul(in59, t1); // Eval big_Q step coeff_3 * z^3
    let t214 = circuit_add(t212, t213); // Eval big_Q step + (coeff_3 * z^3)
    let t215 = circuit_mul(in60, t2); // Eval big_Q step coeff_4 * z^4
    let t216 = circuit_add(t214, t215); // Eval big_Q step + (coeff_4 * z^4)
    let t217 = circuit_mul(in61, t3); // Eval big_Q step coeff_5 * z^5
    let t218 = circuit_add(t216, t217); // Eval big_Q step + (coeff_5 * z^5)
    let t219 = circuit_mul(in62, t4); // Eval big_Q step coeff_6 * z^6
    let t220 = circuit_add(t218, t219); // Eval big_Q step + (coeff_6 * z^6)
    let t221 = circuit_mul(in63, t5); // Eval big_Q step coeff_7 * z^7
    let t222 = circuit_add(t220, t221); // Eval big_Q step + (coeff_7 * z^7)
    let t223 = circuit_mul(in64, t6); // Eval big_Q step coeff_8 * z^8
    let t224 = circuit_add(t222, t223); // Eval big_Q step + (coeff_8 * z^8)
    let t225 = circuit_mul(in65, t7); // Eval big_Q step coeff_9 * z^9
    let t226 = circuit_add(t224, t225); // Eval big_Q step + (coeff_9 * z^9)
    let t227 = circuit_mul(in66, t8); // Eval big_Q step coeff_10 * z^10
    let t228 = circuit_add(t226, t227); // Eval big_Q step + (coeff_10 * z^10)
    let t229 = circuit_mul(in67, t9); // Eval big_Q step coeff_11 * z^11
    let t230 = circuit_add(t228, t229); // Eval big_Q step + (coeff_11 * z^11)
    let t231 = circuit_mul(in68, t10); // Eval big_Q step coeff_12 * z^12
    let t232 = circuit_add(t230, t231); // Eval big_Q step + (coeff_12 * z^12)
    let t233 = circuit_mul(in69, t11); // Eval big_Q step coeff_13 * z^13
    let t234 = circuit_add(t232, t233); // Eval big_Q step + (coeff_13 * z^13)
    let t235 = circuit_mul(in70, t12); // Eval big_Q step coeff_14 * z^14
    let t236 = circuit_add(t234, t235); // Eval big_Q step + (coeff_14 * z^14)
    let t237 = circuit_mul(in71, t13); // Eval big_Q step coeff_15 * z^15
    let t238 = circuit_add(t236, t237); // Eval big_Q step + (coeff_15 * z^15)
    let t239 = circuit_mul(in72, t14); // Eval big_Q step coeff_16 * z^16
    let t240 = circuit_add(t238, t239); // Eval big_Q step + (coeff_16 * z^16)
    let t241 = circuit_mul(in73, t15); // Eval big_Q step coeff_17 * z^17
    let t242 = circuit_add(t240, t241); // Eval big_Q step + (coeff_17 * z^17)
    let t243 = circuit_mul(in74, t16); // Eval big_Q step coeff_18 * z^18
    let t244 = circuit_add(t242, t243); // Eval big_Q step + (coeff_18 * z^18)
    let t245 = circuit_mul(in75, t17); // Eval big_Q step coeff_19 * z^19
    let t246 = circuit_add(t244, t245); // Eval big_Q step + (coeff_19 * z^19)
    let t247 = circuit_mul(in76, t18); // Eval big_Q step coeff_20 * z^20
    let t248 = circuit_add(t246, t247); // Eval big_Q step + (coeff_20 * z^20)
    let t249 = circuit_mul(in77, t19); // Eval big_Q step coeff_21 * z^21
    let t250 = circuit_add(t248, t249); // Eval big_Q step + (coeff_21 * z^21)
    let t251 = circuit_mul(in78, t20); // Eval big_Q step coeff_22 * z^22
    let t252 = circuit_add(t250, t251); // Eval big_Q step + (coeff_22 * z^22)
    let t253 = circuit_mul(in79, t21); // Eval big_Q step coeff_23 * z^23
    let t254 = circuit_add(t252, t253); // Eval big_Q step + (coeff_23 * z^23)
    let t255 = circuit_mul(in80, t22); // Eval big_Q step coeff_24 * z^24
    let t256 = circuit_add(t254, t255); // Eval big_Q step + (coeff_24 * z^24)
    let t257 = circuit_mul(in81, t23); // Eval big_Q step coeff_25 * z^25
    let t258 = circuit_add(t256, t257); // Eval big_Q step + (coeff_25 * z^25)
    let t259 = circuit_mul(in82, t24); // Eval big_Q step coeff_26 * z^26
    let t260 = circuit_add(t258, t259); // Eval big_Q step + (coeff_26 * z^26)
    let t261 = circuit_mul(in83, t25); // Eval big_Q step coeff_27 * z^27
    let t262 = circuit_add(t260, t261); // Eval big_Q step + (coeff_27 * z^27)
    let t263 = circuit_mul(in84, t26); // Eval big_Q step coeff_28 * z^28
    let t264 = circuit_add(t262, t263); // Eval big_Q step + (coeff_28 * z^28)
    let t265 = circuit_mul(in85, t27); // Eval big_Q step coeff_29 * z^29
    let t266 = circuit_add(t264, t265); // Eval big_Q step + (coeff_29 * z^29)
    let t267 = circuit_mul(in86, t28); // Eval big_Q step coeff_30 * z^30
    let t268 = circuit_add(t266, t267); // Eval big_Q step + (coeff_30 * z^30)
    let t269 = circuit_mul(in87, t29); // Eval big_Q step coeff_31 * z^31
    let t270 = circuit_add(t268, t269); // Eval big_Q step + (coeff_31 * z^31)
    let t271 = circuit_mul(in88, t30); // Eval big_Q step coeff_32 * z^32
    let t272 = circuit_add(t270, t271); // Eval big_Q step + (coeff_32 * z^32)
    let t273 = circuit_mul(in89, t31); // Eval big_Q step coeff_33 * z^33
    let t274 = circuit_add(t272, t273); // Eval big_Q step + (coeff_33 * z^33)
    let t275 = circuit_mul(in90, t32); // Eval big_Q step coeff_34 * z^34
    let t276 = circuit_add(t274, t275); // Eval big_Q step + (coeff_34 * z^34)
    let t277 = circuit_mul(in91, t33); // Eval big_Q step coeff_35 * z^35
    let t278 = circuit_add(t276, t277); // Eval big_Q step + (coeff_35 * z^35)
    let t279 = circuit_mul(in92, t34); // Eval big_Q step coeff_36 * z^36
    let t280 = circuit_add(t278, t279); // Eval big_Q step + (coeff_36 * z^36)
    let t281 = circuit_mul(in93, t35); // Eval big_Q step coeff_37 * z^37
    let t282 = circuit_add(t280, t281); // Eval big_Q step + (coeff_37 * z^37)
    let t283 = circuit_mul(in94, t36); // Eval big_Q step coeff_38 * z^38
    let t284 = circuit_add(t282, t283); // Eval big_Q step + (coeff_38 * z^38)
    let t285 = circuit_mul(in95, t37); // Eval big_Q step coeff_39 * z^39
    let t286 = circuit_add(t284, t285); // Eval big_Q step + (coeff_39 * z^39)
    let t287 = circuit_mul(in96, t38); // Eval big_Q step coeff_40 * z^40
    let t288 = circuit_add(t286, t287); // Eval big_Q step + (coeff_40 * z^40)
    let t289 = circuit_mul(in97, t39); // Eval big_Q step coeff_41 * z^41
    let t290 = circuit_add(t288, t289); // Eval big_Q step + (coeff_41 * z^41)
    let t291 = circuit_mul(in98, t40); // Eval big_Q step coeff_42 * z^42
    let t292 = circuit_add(t290, t291); // Eval big_Q step + (coeff_42 * z^42)
    let t293 = circuit_mul(in99, t41); // Eval big_Q step coeff_43 * z^43
    let t294 = circuit_add(t292, t293); // Eval big_Q step + (coeff_43 * z^43)
    let t295 = circuit_mul(in100, t42); // Eval big_Q step coeff_44 * z^44
    let t296 = circuit_add(t294, t295); // Eval big_Q step + (coeff_44 * z^44)
    let t297 = circuit_mul(in101, t43); // Eval big_Q step coeff_45 * z^45
    let t298 = circuit_add(t296, t297); // Eval big_Q step + (coeff_45 * z^45)
    let t299 = circuit_mul(in102, t44); // Eval big_Q step coeff_46 * z^46
    let t300 = circuit_add(t298, t299); // Eval big_Q step + (coeff_46 * z^46)
    let t301 = circuit_mul(in103, t45); // Eval big_Q step coeff_47 * z^47
    let t302 = circuit_add(t300, t301); // Eval big_Q step + (coeff_47 * z^47)
    let t303 = circuit_mul(in104, t46); // Eval big_Q step coeff_48 * z^48
    let t304 = circuit_add(t302, t303); // Eval big_Q step + (coeff_48 * z^48)
    let t305 = circuit_mul(in105, t47); // Eval big_Q step coeff_49 * z^49
    let t306 = circuit_add(t304, t305); // Eval big_Q step + (coeff_49 * z^49)
    let t307 = circuit_mul(in106, t48); // Eval big_Q step coeff_50 * z^50
    let t308 = circuit_add(t306, t307); // Eval big_Q step + (coeff_50 * z^50)
    let t309 = circuit_mul(in107, t49); // Eval big_Q step coeff_51 * z^51
    let t310 = circuit_add(t308, t309); // Eval big_Q step + (coeff_51 * z^51)
    let t311 = circuit_mul(in108, t50); // Eval big_Q step coeff_52 * z^52
    let t312 = circuit_add(t310, t311); // Eval big_Q step + (coeff_52 * z^52)
    let t313 = circuit_mul(in109, t51); // Eval big_Q step coeff_53 * z^53
    let t314 = circuit_add(t312, t313); // Eval big_Q step + (coeff_53 * z^53)
    let t315 = circuit_mul(in110, t52); // Eval big_Q step coeff_54 * z^54
    let t316 = circuit_add(t314, t315); // Eval big_Q step + (coeff_54 * z^54)
    let t317 = circuit_mul(in111, t53); // Eval big_Q step coeff_55 * z^55
    let t318 = circuit_add(t316, t317); // Eval big_Q step + (coeff_55 * z^55)
    let t319 = circuit_mul(in112, t54); // Eval big_Q step coeff_56 * z^56
    let t320 = circuit_add(t318, t319); // Eval big_Q step + (coeff_56 * z^56)
    let t321 = circuit_mul(in113, t55); // Eval big_Q step coeff_57 * z^57
    let t322 = circuit_add(t320, t321); // Eval big_Q step + (coeff_57 * z^57)
    let t323 = circuit_mul(in114, t56); // Eval big_Q step coeff_58 * z^58
    let t324 = circuit_add(t322, t323); // Eval big_Q step + (coeff_58 * z^58)
    let t325 = circuit_mul(in115, t57); // Eval big_Q step coeff_59 * z^59
    let t326 = circuit_add(t324, t325); // Eval big_Q step + (coeff_59 * z^59)
    let t327 = circuit_mul(in116, t58); // Eval big_Q step coeff_60 * z^60
    let t328 = circuit_add(t326, t327); // Eval big_Q step + (coeff_60 * z^60)
    let t329 = circuit_mul(in117, t59); // Eval big_Q step coeff_61 * z^61
    let t330 = circuit_add(t328, t329); // Eval big_Q step + (coeff_61 * z^61)
    let t331 = circuit_mul(in118, t60); // Eval big_Q step coeff_62 * z^62
    let t332 = circuit_add(t330, t331); // Eval big_Q step + (coeff_62 * z^62)
    let t333 = circuit_mul(in119, t61); // Eval big_Q step coeff_63 * z^63
    let t334 = circuit_add(t332, t333); // Eval big_Q step + (coeff_63 * z^63)
    let t335 = circuit_mul(in120, t62); // Eval big_Q step coeff_64 * z^64
    let t336 = circuit_add(t334, t335); // Eval big_Q step + (coeff_64 * z^64)
    let t337 = circuit_mul(in121, t63); // Eval big_Q step coeff_65 * z^65
    let t338 = circuit_add(t336, t337); // Eval big_Q step + (coeff_65 * z^65)
    let t339 = circuit_mul(in122, t64); // Eval big_Q step coeff_66 * z^66
    let t340 = circuit_add(t338, t339); // Eval big_Q step + (coeff_66 * z^66)
    let t341 = circuit_mul(in123, t65); // Eval big_Q step coeff_67 * z^67
    let t342 = circuit_add(t340, t341); // Eval big_Q step + (coeff_67 * z^67)
    let t343 = circuit_mul(in124, t66); // Eval big_Q step coeff_68 * z^68
    let t344 = circuit_add(t342, t343); // Eval big_Q step + (coeff_68 * z^68)
    let t345 = circuit_mul(in125, t67); // Eval big_Q step coeff_69 * z^69
    let t346 = circuit_add(t344, t345); // Eval big_Q step + (coeff_69 * z^69)
    let t347 = circuit_mul(in126, t68); // Eval big_Q step coeff_70 * z^70
    let t348 = circuit_add(t346, t347); // Eval big_Q step + (coeff_70 * z^70)
    let t349 = circuit_mul(in127, t69); // Eval big_Q step coeff_71 * z^71
    let t350 = circuit_add(t348, t349); // Eval big_Q step + (coeff_71 * z^71)
    let t351 = circuit_mul(in128, t70); // Eval big_Q step coeff_72 * z^72
    let t352 = circuit_add(t350, t351); // Eval big_Q step + (coeff_72 * z^72)
    let t353 = circuit_mul(in129, t71); // Eval big_Q step coeff_73 * z^73
    let t354 = circuit_add(t352, t353); // Eval big_Q step + (coeff_73 * z^73)
    let t355 = circuit_mul(in130, t72); // Eval big_Q step coeff_74 * z^74
    let t356 = circuit_add(t354, t355); // Eval big_Q step + (coeff_74 * z^74)
    let t357 = circuit_mul(in131, t73); // Eval big_Q step coeff_75 * z^75
    let t358 = circuit_add(t356, t357); // Eval big_Q step + (coeff_75 * z^75)
    let t359 = circuit_mul(in132, t74); // Eval big_Q step coeff_76 * z^76
    let t360 = circuit_add(t358, t359); // Eval big_Q step + (coeff_76 * z^76)
    let t361 = circuit_mul(in133, t75); // Eval big_Q step coeff_77 * z^77
    let t362 = circuit_add(t360, t361); // Eval big_Q step + (coeff_77 * z^77)
    let t363 = circuit_mul(in134, t76); // Eval big_Q step coeff_78 * z^78
    let t364 = circuit_add(t362, t363); // Eval big_Q step + (coeff_78 * z^78)
    let t365 = circuit_mul(in135, t77); // Eval big_Q step coeff_79 * z^79
    let t366 = circuit_add(t364, t365); // Eval big_Q step + (coeff_79 * z^79)
    let t367 = circuit_mul(in136, t78); // Eval big_Q step coeff_80 * z^80
    let t368 = circuit_add(t366, t367); // Eval big_Q step + (coeff_80 * z^80)
    let t369 = circuit_mul(in137, t79); // Eval big_Q step coeff_81 * z^81
    let t370 = circuit_add(t368, t369); // Eval big_Q step + (coeff_81 * z^81)
    let t371 = circuit_mul(in138, t80); // Eval big_Q step coeff_82 * z^82
    let t372 = circuit_add(t370, t371); // Eval big_Q step + (coeff_82 * z^82)
    let t373 = circuit_mul(in139, t81); // Eval big_Q step coeff_83 * z^83
    let t374 = circuit_add(t372, t373); // Eval big_Q step + (coeff_83 * z^83)
    let t375 = circuit_mul(in140, t82); // Eval big_Q step coeff_84 * z^84
    let t376 = circuit_add(t374, t375); // Eval big_Q step + (coeff_84 * z^84)
    let t377 = circuit_mul(in141, t83); // Eval big_Q step coeff_85 * z^85
    let t378 = circuit_add(t376, t377); // Eval big_Q step + (coeff_85 * z^85)
    let t379 = circuit_mul(in142, t84); // Eval big_Q step coeff_86 * z^86
    let t380 = circuit_add(t378, t379); // Eval big_Q step + (coeff_86 * z^86)
    let t381 = circuit_mul(in3, t4); // Eval sparse poly P_irr step coeff_6 * z^6
    let t382 = circuit_add(in2, t381); // Eval sparse poly P_irr step + coeff_6 * z^6
    let t383 = circuit_add(t382, t10); // Eval sparse poly P_irr step + 1*z^12
    let t384 = circuit_mul(t380, t383);
    let t385 = circuit_sub(t208, t384);

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t385,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs.next([0x52, 0x0, 0x0, 0x0]); // in2
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd35, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in3
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in4
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in5
    circuit_inputs = circuit_inputs.next(line_1_0.r0a0); // in6
    circuit_inputs = circuit_inputs.next(line_1_0.r0a1); // in7
    circuit_inputs = circuit_inputs.next(line_1_0.r1a0); // in8
    circuit_inputs = circuit_inputs.next(line_1_0.r1a1); // in9
    circuit_inputs = circuit_inputs.next(line_2_0.r0a0); // in10
    circuit_inputs = circuit_inputs.next(line_2_0.r0a1); // in11
    circuit_inputs = circuit_inputs.next(line_2_0.r1a0); // in12
    circuit_inputs = circuit_inputs.next(line_2_0.r1a1); // in13
    circuit_inputs = circuit_inputs.next(yInv_1); // in14
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in15
    circuit_inputs = circuit_inputs.next(line_1_1.r0a0); // in16
    circuit_inputs = circuit_inputs.next(line_1_1.r0a1); // in17
    circuit_inputs = circuit_inputs.next(line_1_1.r1a0); // in18
    circuit_inputs = circuit_inputs.next(line_1_1.r1a1); // in19
    circuit_inputs = circuit_inputs.next(line_2_1.r0a0); // in20
    circuit_inputs = circuit_inputs.next(line_2_1.r0a1); // in21
    circuit_inputs = circuit_inputs.next(line_2_1.r1a0); // in22
    circuit_inputs = circuit_inputs.next(line_2_1.r1a1); // in23
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w0); // in24
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w1); // in25
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w2); // in26
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w3); // in27
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w4); // in28
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w5); // in29
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w6); // in30
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w7); // in31
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w8); // in32
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w9); // in33
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w10); // in34
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w11); // in35
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w0); // in36
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w1); // in37
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w2); // in38
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w3); // in39
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w4); // in40
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w5); // in41
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w6); // in42
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w7); // in43
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w8); // in44
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w9); // in45
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w10); // in46
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w11); // in47
    circuit_inputs = circuit_inputs.next(c_n_minus_3); // in48
    circuit_inputs = circuit_inputs.next(w_of_z); // in49
    circuit_inputs = circuit_inputs.next(z); // in50
    circuit_inputs = circuit_inputs.next(c_inv_frob_1_of_z); // in51
    circuit_inputs = circuit_inputs.next(c_frob_2_of_z); // in52
    circuit_inputs = circuit_inputs.next(c_inv_frob_3_of_z); // in53
    circuit_inputs = circuit_inputs.next(previous_lhs); // in54
    circuit_inputs = circuit_inputs.next(R_n_minus_3_of_z); // in55

    let mut Q = Q;
    while let Option::Some(val) = Q.pop_front() {
        circuit_inputs = circuit_inputs.next(val);
    };
    // in56 - in142

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let final_check: u384 = outputs.get_output(t385);
    return (final_check,);
}
fn run_BN254_MP_CHECK_FINALIZE_BN_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    line_1_0: G2Line,
    line_2_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    line_1_1: G2Line,
    line_2_1: G2Line,
    original_Q2: G2Point,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    R_n_minus_2: E12D,
    R_n_minus_1: E12D,
    c_n_minus_3: u384,
    w_of_z: u384,
    z: u384,
    c_inv_frob_1_of_z: u384,
    c_frob_2_of_z: u384,
    c_inv_frob_3_of_z: u384,
    previous_lhs: u384,
    R_n_minus_3_of_z: u384,
    Q: Array<u384>
) -> (u384,) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x2fb347984f7911f74c0bec3cf559b143b78cc310c2c3330c99e39557176f553d
    let in1 = CE::<CI<1>> {}; // 0x16c9e55061ebae204ba4cc8bd75a079432ae2a1d0b7c9dce1665d51c640fcba2
    let in2 = CE::<CI<2>> {}; // 0x63cf305489af5dcdc5ec698b6e2f9b9dbaae0eda9c95998dc54014671a0135a
    let in3 = CE::<CI<3>> {}; // 0x7c03cbcac41049a0704b5a7ec796f2b21807dc98fa25bd282d37f632623b0e3
    let in4 = CE::<CI<4>> {}; // 0x30644e72e131a0295e6dd9e7e0acccb0c28f069fbb966e3de4bd44e5607cfd48
    let in5 = CE::<CI<5>> {}; // 0x1
    let in6 = CE::<CI<6>> {}; // 0x0
    let in7 = CE::<CI<7>> {}; // -0x9 % p
    let in8 = CE::<CI<8>> {}; // 0x52
    let in9 = CE::<CI<9>> {}; // -0x12 % p

    // INPUT stack
    let (in10, in11, in12) = (CE::<CI<10>> {}, CE::<CI<11>> {}, CE::<CI<12>> {});
    let (in13, in14, in15) = (CE::<CI<13>> {}, CE::<CI<14>> {}, CE::<CI<15>> {});
    let (in16, in17, in18) = (CE::<CI<16>> {}, CE::<CI<17>> {}, CE::<CI<18>> {});
    let (in19, in20, in21) = (CE::<CI<19>> {}, CE::<CI<20>> {}, CE::<CI<21>> {});
    let (in22, in23, in24) = (CE::<CI<22>> {}, CE::<CI<23>> {}, CE::<CI<24>> {});
    let (in25, in26, in27) = (CE::<CI<25>> {}, CE::<CI<26>> {}, CE::<CI<27>> {});
    let (in28, in29, in30) = (CE::<CI<28>> {}, CE::<CI<29>> {}, CE::<CI<30>> {});
    let (in31, in32, in33) = (CE::<CI<31>> {}, CE::<CI<32>> {}, CE::<CI<33>> {});
    let (in34, in35, in36) = (CE::<CI<34>> {}, CE::<CI<35>> {}, CE::<CI<36>> {});
    let (in37, in38, in39) = (CE::<CI<37>> {}, CE::<CI<38>> {}, CE::<CI<39>> {});
    let (in40, in41, in42) = (CE::<CI<40>> {}, CE::<CI<41>> {}, CE::<CI<42>> {});
    let (in43, in44, in45) = (CE::<CI<43>> {}, CE::<CI<44>> {}, CE::<CI<45>> {});
    let (in46, in47, in48) = (CE::<CI<46>> {}, CE::<CI<47>> {}, CE::<CI<48>> {});
    let (in49, in50, in51) = (CE::<CI<49>> {}, CE::<CI<50>> {}, CE::<CI<51>> {});
    let (in52, in53, in54) = (CE::<CI<52>> {}, CE::<CI<53>> {}, CE::<CI<54>> {});
    let (in55, in56, in57) = (CE::<CI<55>> {}, CE::<CI<56>> {}, CE::<CI<57>> {});
    let (in58, in59, in60) = (CE::<CI<58>> {}, CE::<CI<59>> {}, CE::<CI<60>> {});
    let (in61, in62, in63) = (CE::<CI<61>> {}, CE::<CI<62>> {}, CE::<CI<63>> {});
    let (in64, in65, in66) = (CE::<CI<64>> {}, CE::<CI<65>> {}, CE::<CI<66>> {});
    let (in67, in68, in69) = (CE::<CI<67>> {}, CE::<CI<68>> {}, CE::<CI<69>> {});
    let (in70, in71, in72) = (CE::<CI<70>> {}, CE::<CI<71>> {}, CE::<CI<72>> {});
    let (in73, in74, in75) = (CE::<CI<73>> {}, CE::<CI<74>> {}, CE::<CI<75>> {});
    let (in76, in77, in78) = (CE::<CI<76>> {}, CE::<CI<77>> {}, CE::<CI<78>> {});
    let (in79, in80, in81) = (CE::<CI<79>> {}, CE::<CI<80>> {}, CE::<CI<81>> {});
    let (in82, in83, in84) = (CE::<CI<82>> {}, CE::<CI<83>> {}, CE::<CI<84>> {});
    let (in85, in86, in87) = (CE::<CI<85>> {}, CE::<CI<86>> {}, CE::<CI<87>> {});
    let (in88, in89, in90) = (CE::<CI<88>> {}, CE::<CI<89>> {}, CE::<CI<90>> {});
    let (in91, in92, in93) = (CE::<CI<91>> {}, CE::<CI<92>> {}, CE::<CI<93>> {});
    let (in94, in95, in96) = (CE::<CI<94>> {}, CE::<CI<95>> {}, CE::<CI<96>> {});
    let (in97, in98, in99) = (CE::<CI<97>> {}, CE::<CI<98>> {}, CE::<CI<99>> {});
    let (in100, in101, in102) = (CE::<CI<100>> {}, CE::<CI<101>> {}, CE::<CI<102>> {});
    let (in103, in104, in105) = (CE::<CI<103>> {}, CE::<CI<104>> {}, CE::<CI<105>> {});
    let (in106, in107, in108) = (CE::<CI<106>> {}, CE::<CI<107>> {}, CE::<CI<108>> {});
    let (in109, in110, in111) = (CE::<CI<109>> {}, CE::<CI<110>> {}, CE::<CI<111>> {});
    let (in112, in113, in114) = (CE::<CI<112>> {}, CE::<CI<113>> {}, CE::<CI<114>> {});
    let (in115, in116, in117) = (CE::<CI<115>> {}, CE::<CI<116>> {}, CE::<CI<117>> {});
    let (in118, in119, in120) = (CE::<CI<118>> {}, CE::<CI<119>> {}, CE::<CI<120>> {});
    let (in121, in122, in123) = (CE::<CI<121>> {}, CE::<CI<122>> {}, CE::<CI<123>> {});
    let (in124, in125, in126) = (CE::<CI<124>> {}, CE::<CI<125>> {}, CE::<CI<126>> {});
    let (in127, in128, in129) = (CE::<CI<127>> {}, CE::<CI<128>> {}, CE::<CI<129>> {});
    let (in130, in131, in132) = (CE::<CI<130>> {}, CE::<CI<131>> {}, CE::<CI<132>> {});
    let (in133, in134, in135) = (CE::<CI<133>> {}, CE::<CI<134>> {}, CE::<CI<135>> {});
    let (in136, in137, in138) = (CE::<CI<136>> {}, CE::<CI<137>> {}, CE::<CI<138>> {});
    let (in139, in140, in141) = (CE::<CI<139>> {}, CE::<CI<140>> {}, CE::<CI<141>> {});
    let (in142, in143, in144) = (CE::<CI<142>> {}, CE::<CI<143>> {}, CE::<CI<144>> {});
    let (in145, in146, in147) = (CE::<CI<145>> {}, CE::<CI<146>> {}, CE::<CI<147>> {});
    let (in148, in149, in150) = (CE::<CI<148>> {}, CE::<CI<149>> {}, CE::<CI<150>> {});
    let (in151, in152, in153) = (CE::<CI<151>> {}, CE::<CI<152>> {}, CE::<CI<153>> {});
    let (in154, in155, in156) = (CE::<CI<154>> {}, CE::<CI<155>> {}, CE::<CI<156>> {});
    let (in157, in158, in159) = (CE::<CI<157>> {}, CE::<CI<158>> {}, CE::<CI<159>> {});
    let (in160, in161, in162) = (CE::<CI<160>> {}, CE::<CI<161>> {}, CE::<CI<162>> {});
    let (in163, in164, in165) = (CE::<CI<163>> {}, CE::<CI<164>> {}, CE::<CI<165>> {});
    let (in166, in167, in168) = (CE::<CI<166>> {}, CE::<CI<167>> {}, CE::<CI<168>> {});
    let (in169, in170, in171) = (CE::<CI<169>> {}, CE::<CI<170>> {}, CE::<CI<171>> {});
    let (in172, in173, in174) = (CE::<CI<172>> {}, CE::<CI<173>> {}, CE::<CI<174>> {});
    let (in175, in176, in177) = (CE::<CI<175>> {}, CE::<CI<176>> {}, CE::<CI<177>> {});
    let (in178, in179, in180) = (CE::<CI<178>> {}, CE::<CI<179>> {}, CE::<CI<180>> {});
    let (in181, in182, in183) = (CE::<CI<181>> {}, CE::<CI<182>> {}, CE::<CI<183>> {});
    let (in184, in185) = (CE::<CI<184>> {}, CE::<CI<185>> {});
    let t0 = circuit_mul(in66, in66); // Compute z^2
    let t1 = circuit_mul(t0, in66); // Compute z^3
    let t2 = circuit_mul(t1, in66); // Compute z^4
    let t3 = circuit_mul(t2, in66); // Compute z^5
    let t4 = circuit_mul(t3, in66); // Compute z^6
    let t5 = circuit_mul(t4, in66); // Compute z^7
    let t6 = circuit_mul(t5, in66); // Compute z^8
    let t7 = circuit_mul(t6, in66); // Compute z^9
    let t8 = circuit_mul(t7, in66); // Compute z^10
    let t9 = circuit_mul(t8, in66); // Compute z^11
    let t10 = circuit_mul(t9, in66); // Compute z^12
    let t11 = circuit_mul(t10, in66); // Compute z^13
    let t12 = circuit_mul(t11, in66); // Compute z^14
    let t13 = circuit_mul(t12, in66); // Compute z^15
    let t14 = circuit_mul(t13, in66); // Compute z^16
    let t15 = circuit_mul(t14, in66); // Compute z^17
    let t16 = circuit_mul(t15, in66); // Compute z^18
    let t17 = circuit_mul(t16, in66); // Compute z^19
    let t18 = circuit_mul(t17, in66); // Compute z^20
    let t19 = circuit_mul(t18, in66); // Compute z^21
    let t20 = circuit_mul(t19, in66); // Compute z^22
    let t21 = circuit_mul(t20, in66); // Compute z^23
    let t22 = circuit_mul(t21, in66); // Compute z^24
    let t23 = circuit_mul(t22, in66); // Compute z^25
    let t24 = circuit_mul(t23, in66); // Compute z^26
    let t25 = circuit_mul(t24, in66); // Compute z^27
    let t26 = circuit_mul(t25, in66); // Compute z^28
    let t27 = circuit_mul(t26, in66); // Compute z^29
    let t28 = circuit_mul(t27, in66); // Compute z^30
    let t29 = circuit_mul(t28, in66); // Compute z^31
    let t30 = circuit_mul(t29, in66); // Compute z^32
    let t31 = circuit_mul(t30, in66); // Compute z^33
    let t32 = circuit_mul(t31, in66); // Compute z^34
    let t33 = circuit_mul(t32, in66); // Compute z^35
    let t34 = circuit_mul(t33, in66); // Compute z^36
    let t35 = circuit_mul(t34, in66); // Compute z^37
    let t36 = circuit_mul(t35, in66); // Compute z^38
    let t37 = circuit_mul(t36, in66); // Compute z^39
    let t38 = circuit_mul(t37, in66); // Compute z^40
    let t39 = circuit_mul(t38, in66); // Compute z^41
    let t40 = circuit_mul(t39, in66); // Compute z^42
    let t41 = circuit_mul(t40, in66); // Compute z^43
    let t42 = circuit_mul(t41, in66); // Compute z^44
    let t43 = circuit_mul(t42, in66); // Compute z^45
    let t44 = circuit_mul(t43, in66); // Compute z^46
    let t45 = circuit_mul(t44, in66); // Compute z^47
    let t46 = circuit_mul(t45, in66); // Compute z^48
    let t47 = circuit_mul(t46, in66); // Compute z^49
    let t48 = circuit_mul(t47, in66); // Compute z^50
    let t49 = circuit_mul(t48, in66); // Compute z^51
    let t50 = circuit_mul(t49, in66); // Compute z^52
    let t51 = circuit_mul(t50, in66); // Compute z^53
    let t52 = circuit_mul(t51, in66); // Compute z^54
    let t53 = circuit_mul(t52, in66); // Compute z^55
    let t54 = circuit_mul(t53, in66); // Compute z^56
    let t55 = circuit_mul(t54, in66); // Compute z^57
    let t56 = circuit_mul(t55, in66); // Compute z^58
    let t57 = circuit_mul(t56, in66); // Compute z^59
    let t58 = circuit_mul(t57, in66); // Compute z^60
    let t59 = circuit_mul(t58, in66); // Compute z^61
    let t60 = circuit_mul(t59, in66); // Compute z^62
    let t61 = circuit_mul(t60, in66); // Compute z^63
    let t62 = circuit_mul(t61, in66); // Compute z^64
    let t63 = circuit_mul(t62, in66); // Compute z^65
    let t64 = circuit_mul(t63, in66); // Compute z^66
    let t65 = circuit_mul(t64, in66); // Compute z^67
    let t66 = circuit_mul(t65, in66); // Compute z^68
    let t67 = circuit_mul(t66, in66); // Compute z^69
    let t68 = circuit_mul(t67, in66); // Compute z^70
    let t69 = circuit_mul(t68, in66); // Compute z^71
    let t70 = circuit_mul(t69, in66); // Compute z^72
    let t71 = circuit_mul(t70, in66); // Compute z^73
    let t72 = circuit_mul(t71, in66); // Compute z^74
    let t73 = circuit_mul(t72, in66); // Compute z^75
    let t74 = circuit_mul(t73, in66); // Compute z^76
    let t75 = circuit_mul(t74, in66); // Compute z^77
    let t76 = circuit_mul(t75, in66); // Compute z^78
    let t77 = circuit_mul(t76, in66); // Compute z^79
    let t78 = circuit_mul(t77, in66); // Compute z^80
    let t79 = circuit_mul(t78, in66); // Compute z^81
    let t80 = circuit_mul(t79, in66); // Compute z^82
    let t81 = circuit_mul(t80, in66); // Compute z^83
    let t82 = circuit_mul(t81, in66); // Compute z^84
    let t83 = circuit_mul(t82, in66); // Compute z^85
    let t84 = circuit_mul(t83, in66); // Compute z^86
    let t85 = circuit_mul(t84, in66); // Compute z^87
    let t86 = circuit_mul(t85, in66); // Compute z^88
    let t87 = circuit_mul(t86, in66); // Compute z^89
    let t88 = circuit_mul(t87, in66); // Compute z^90
    let t89 = circuit_mul(t88, in66); // Compute z^91
    let t90 = circuit_mul(t89, in66); // Compute z^92
    let t91 = circuit_mul(t90, in66); // Compute z^93
    let t92 = circuit_mul(t91, in66); // Compute z^94
    let t93 = circuit_mul(t92, in66); // Compute z^95
    let t94 = circuit_mul(t93, in66); // Compute z^96
    let t95 = circuit_mul(t94, in66); // Compute z^97
    let t96 = circuit_mul(t95, in66); // Compute z^98
    let t97 = circuit_mul(t96, in66); // Compute z^99
    let t98 = circuit_mul(t97, in66); // Compute z^100
    let t99 = circuit_mul(t98, in66); // Compute z^101
    let t100 = circuit_mul(t99, in66); // Compute z^102
    let t101 = circuit_mul(t100, in66); // Compute z^103
    let t102 = circuit_mul(t101, in66); // Compute z^104
    let t103 = circuit_mul(t102, in66); // Compute z^105
    let t104 = circuit_mul(t103, in66); // Compute z^106
    let t105 = circuit_mul(t104, in66); // Compute z^107
    let t106 = circuit_mul(t105, in66); // Compute z^108
    let t107 = circuit_mul(t106, in66); // Compute z^109
    let t108 = circuit_mul(t107, in66); // Compute z^110
    let t109 = circuit_mul(t108, in66); // Compute z^111
    let t110 = circuit_mul(t109, in66); // Compute z^112
    let t111 = circuit_mul(t110, in66); // Compute z^113
    let t112 = circuit_mul(in64, in64);
    let t113 = circuit_mul(t112, t112);
    let t114 = circuit_mul(in41, in66); // Eval R_n_minus_2 step coeff_1 * z^1
    let t115 = circuit_add(in40, t114); // Eval R_n_minus_2 step + (coeff_1 * z^1)
    let t116 = circuit_mul(in42, t0); // Eval R_n_minus_2 step coeff_2 * z^2
    let t117 = circuit_add(t115, t116); // Eval R_n_minus_2 step + (coeff_2 * z^2)
    let t118 = circuit_mul(in43, t1); // Eval R_n_minus_2 step coeff_3 * z^3
    let t119 = circuit_add(t117, t118); // Eval R_n_minus_2 step + (coeff_3 * z^3)
    let t120 = circuit_mul(in44, t2); // Eval R_n_minus_2 step coeff_4 * z^4
    let t121 = circuit_add(t119, t120); // Eval R_n_minus_2 step + (coeff_4 * z^4)
    let t122 = circuit_mul(in45, t3); // Eval R_n_minus_2 step coeff_5 * z^5
    let t123 = circuit_add(t121, t122); // Eval R_n_minus_2 step + (coeff_5 * z^5)
    let t124 = circuit_mul(in46, t4); // Eval R_n_minus_2 step coeff_6 * z^6
    let t125 = circuit_add(t123, t124); // Eval R_n_minus_2 step + (coeff_6 * z^6)
    let t126 = circuit_mul(in47, t5); // Eval R_n_minus_2 step coeff_7 * z^7
    let t127 = circuit_add(t125, t126); // Eval R_n_minus_2 step + (coeff_7 * z^7)
    let t128 = circuit_mul(in48, t6); // Eval R_n_minus_2 step coeff_8 * z^8
    let t129 = circuit_add(t127, t128); // Eval R_n_minus_2 step + (coeff_8 * z^8)
    let t130 = circuit_mul(in49, t7); // Eval R_n_minus_2 step coeff_9 * z^9
    let t131 = circuit_add(t129, t130); // Eval R_n_minus_2 step + (coeff_9 * z^9)
    let t132 = circuit_mul(in50, t8); // Eval R_n_minus_2 step coeff_10 * z^10
    let t133 = circuit_add(t131, t132); // Eval R_n_minus_2 step + (coeff_10 * z^10)
    let t134 = circuit_mul(in51, t9); // Eval R_n_minus_2 step coeff_11 * z^11
    let t135 = circuit_add(t133, t134); // Eval R_n_minus_2 step + (coeff_11 * z^11)
    let t136 = circuit_mul(in53, in66); // Eval R_n_minus_1 step coeff_1 * z^1
    let t137 = circuit_add(in52, t136); // Eval R_n_minus_1 step + (coeff_1 * z^1)
    let t138 = circuit_mul(in54, t0); // Eval R_n_minus_1 step coeff_2 * z^2
    let t139 = circuit_add(t137, t138); // Eval R_n_minus_1 step + (coeff_2 * z^2)
    let t140 = circuit_mul(in55, t1); // Eval R_n_minus_1 step coeff_3 * z^3
    let t141 = circuit_add(t139, t140); // Eval R_n_minus_1 step + (coeff_3 * z^3)
    let t142 = circuit_mul(in56, t2); // Eval R_n_minus_1 step coeff_4 * z^4
    let t143 = circuit_add(t141, t142); // Eval R_n_minus_1 step + (coeff_4 * z^4)
    let t144 = circuit_mul(in57, t3); // Eval R_n_minus_1 step coeff_5 * z^5
    let t145 = circuit_add(t143, t144); // Eval R_n_minus_1 step + (coeff_5 * z^5)
    let t146 = circuit_mul(in58, t4); // Eval R_n_minus_1 step coeff_6 * z^6
    let t147 = circuit_add(t145, t146); // Eval R_n_minus_1 step + (coeff_6 * z^6)
    let t148 = circuit_mul(in59, t5); // Eval R_n_minus_1 step coeff_7 * z^7
    let t149 = circuit_add(t147, t148); // Eval R_n_minus_1 step + (coeff_7 * z^7)
    let t150 = circuit_mul(in60, t6); // Eval R_n_minus_1 step coeff_8 * z^8
    let t151 = circuit_add(t149, t150); // Eval R_n_minus_1 step + (coeff_8 * z^8)
    let t152 = circuit_mul(in61, t7); // Eval R_n_minus_1 step coeff_9 * z^9
    let t153 = circuit_add(t151, t152); // Eval R_n_minus_1 step + (coeff_9 * z^9)
    let t154 = circuit_mul(in62, t8); // Eval R_n_minus_1 step coeff_10 * z^10
    let t155 = circuit_add(t153, t154); // Eval R_n_minus_1 step + (coeff_10 * z^10)
    let t156 = circuit_mul(in63, t9); // Eval R_n_minus_1 step coeff_11 * z^11
    let t157 = circuit_add(t155, t156); // Eval R_n_minus_1 step + (coeff_11 * z^11)
    let t158 = circuit_sub(in6, in31);
    let t159 = circuit_sub(in6, in33);
    let t160 = circuit_mul(in30, in0); // Fp2 mul start
    let t161 = circuit_mul(t158, in1);
    let t162 = circuit_sub(t160, t161); // Fp2 mul real part end
    let t163 = circuit_mul(in30, in1);
    let t164 = circuit_mul(t158, in0);
    let t165 = circuit_add(t163, t164); // Fp2 mul imag part end
    let t166 = circuit_mul(in32, in2); // Fp2 mul start
    let t167 = circuit_mul(t159, in3);
    let t168 = circuit_sub(t166, t167); // Fp2 mul real part end
    let t169 = circuit_mul(in32, in3);
    let t170 = circuit_mul(t159, in2);
    let t171 = circuit_add(t169, t170); // Fp2 mul imag part end
    let t172 = circuit_mul(in30, in4); // Fp2 scalar mul coeff 0/1
    let t173 = circuit_mul(in31, in4); // Fp2 scalar mul coeff 1/1
    let t174 = circuit_mul(in32, in5); // Fp2 scalar mul coeff 0/1
    let t175 = circuit_mul(in33, in5); // Fp2 scalar mul coeff 1/1
    let t176 = circuit_sub(in38, t168); // Fp2 sub coeff 0/1
    let t177 = circuit_sub(in39, t171); // Fp2 sub coeff 1/1
    let t178 = circuit_sub(in36, t162); // Fp2 sub coeff 0/1
    let t179 = circuit_sub(in37, t165); // Fp2 sub coeff 1/1
    let t180 = circuit_mul(t178, t178); // Fp2 Div x/y start : Fp2 Inv y start
    let t181 = circuit_mul(t179, t179);
    let t182 = circuit_add(t180, t181);
    let t183 = circuit_inverse(t182);
    let t184 = circuit_mul(t178, t183); // Fp2 Inv y real part end
    let t185 = circuit_mul(t179, t183);
    let t186 = circuit_sub(in6, t185); // Fp2 Inv y imag part end
    let t187 = circuit_mul(t176, t184); // Fp2 mul start
    let t188 = circuit_mul(t177, t186);
    let t189 = circuit_sub(t187, t188); // Fp2 mul real part end
    let t190 = circuit_mul(t176, t186);
    let t191 = circuit_mul(t177, t184);
    let t192 = circuit_add(t190, t191); // Fp2 mul imag part end
    let t193 = circuit_add(t189, t192);
    let t194 = circuit_sub(t189, t192);
    let t195 = circuit_mul(t193, t194);
    let t196 = circuit_mul(t189, t192);
    let t197 = circuit_add(t196, t196);
    let t198 = circuit_add(in36, t162); // Fp2 add coeff 0/1
    let t199 = circuit_add(in37, t165); // Fp2 add coeff 1/1
    let t200 = circuit_sub(t195, t198); // Fp2 sub coeff 0/1
    let t201 = circuit_sub(t197, t199); // Fp2 sub coeff 1/1
    let t202 = circuit_sub(in36, t200); // Fp2 sub coeff 0/1
    let t203 = circuit_sub(in37, t201); // Fp2 sub coeff 1/1
    let t204 = circuit_mul(t189, t202); // Fp2 mul start
    let t205 = circuit_mul(t192, t203);
    let t206 = circuit_sub(t204, t205); // Fp2 mul real part end
    let t207 = circuit_mul(t189, t203);
    let t208 = circuit_mul(t192, t202);
    let t209 = circuit_add(t207, t208); // Fp2 mul imag part end
    let t210 = circuit_sub(t206, in38); // Fp2 sub coeff 0/1
    let t211 = circuit_sub(t209, in39); // Fp2 sub coeff 1/1
    let t212 = circuit_mul(t189, in36); // Fp2 mul start
    let t213 = circuit_mul(t192, in37);
    let t214 = circuit_sub(t212, t213); // Fp2 mul real part end
    let t215 = circuit_mul(t189, in37);
    let t216 = circuit_mul(t192, in36);
    let t217 = circuit_add(t215, t216); // Fp2 mul imag part end
    let t218 = circuit_sub(t214, in38); // Fp2 sub coeff 0/1
    let t219 = circuit_sub(t217, in39); // Fp2 sub coeff 1/1
    let t220 = circuit_sub(t210, t174); // Fp2 sub coeff 0/1
    let t221 = circuit_sub(t211, t175); // Fp2 sub coeff 1/1
    let t222 = circuit_sub(t200, t172); // Fp2 sub coeff 0/1
    let t223 = circuit_sub(t201, t173); // Fp2 sub coeff 1/1
    let t224 = circuit_mul(t222, t222); // Fp2 Div x/y start : Fp2 Inv y start
    let t225 = circuit_mul(t223, t223);
    let t226 = circuit_add(t224, t225);
    let t227 = circuit_inverse(t226);
    let t228 = circuit_mul(t222, t227); // Fp2 Inv y real part end
    let t229 = circuit_mul(t223, t227);
    let t230 = circuit_sub(in6, t229); // Fp2 Inv y imag part end
    let t231 = circuit_mul(t220, t228); // Fp2 mul start
    let t232 = circuit_mul(t221, t230);
    let t233 = circuit_sub(t231, t232); // Fp2 mul real part end
    let t234 = circuit_mul(t220, t230);
    let t235 = circuit_mul(t221, t228);
    let t236 = circuit_add(t234, t235); // Fp2 mul imag part end
    let t237 = circuit_mul(t233, t200); // Fp2 mul start
    let t238 = circuit_mul(t236, t201);
    let t239 = circuit_sub(t237, t238); // Fp2 mul real part end
    let t240 = circuit_mul(t233, t201);
    let t241 = circuit_mul(t236, t200);
    let t242 = circuit_add(t240, t241); // Fp2 mul imag part end
    let t243 = circuit_sub(t239, t210); // Fp2 sub coeff 0/1
    let t244 = circuit_sub(t242, t211); // Fp2 sub coeff 1/1
    let t245 = circuit_mul(in7, in13);
    let t246 = circuit_add(in12, t245);
    let t247 = circuit_mul(t246, in11); // eval bn line by xNegOverY
    let t248 = circuit_mul(in7, in15);
    let t249 = circuit_add(in14, t248);
    let t250 = circuit_mul(t249, in10); // eval bn line by yInv
    let t251 = circuit_mul(in13, in11); // eval bn line by xNegOverY
    let t252 = circuit_mul(in15, in10); // eval bn line by yInv
    let t253 = circuit_mul(in7, in17);
    let t254 = circuit_add(in16, t253);
    let t255 = circuit_mul(t254, in11); // eval bn line by xNegOverY
    let t256 = circuit_mul(in7, in19);
    let t257 = circuit_add(in18, t256);
    let t258 = circuit_mul(t257, in10); // eval bn line by yInv
    let t259 = circuit_mul(in17, in11); // eval bn line by xNegOverY
    let t260 = circuit_mul(in19, in10); // eval bn line by yInv
    let t261 = circuit_mul(in7, in23);
    let t262 = circuit_add(in22, t261);
    let t263 = circuit_mul(t262, in21); // eval bn line by xNegOverY
    let t264 = circuit_mul(in7, in25);
    let t265 = circuit_add(in24, t264);
    let t266 = circuit_mul(t265, in20); // eval bn line by yInv
    let t267 = circuit_mul(in23, in21); // eval bn line by xNegOverY
    let t268 = circuit_mul(in25, in20); // eval bn line by yInv
    let t269 = circuit_mul(in7, in27);
    let t270 = circuit_add(in26, t269);
    let t271 = circuit_mul(t270, in21); // eval bn line by xNegOverY
    let t272 = circuit_mul(in7, in29);
    let t273 = circuit_add(in28, t272);
    let t274 = circuit_mul(t273, in20); // eval bn line by yInv
    let t275 = circuit_mul(in27, in21); // eval bn line by xNegOverY
    let t276 = circuit_mul(in29, in20); // eval bn line by yInv
    let t277 = circuit_mul(in7, t192);
    let t278 = circuit_add(t189, t277);
    let t279 = circuit_mul(t278, in35); // eval bn line by xNegOverY
    let t280 = circuit_mul(in7, t219);
    let t281 = circuit_add(t218, t280);
    let t282 = circuit_mul(t281, in34); // eval bn line by yInv
    let t283 = circuit_mul(t192, in35); // eval bn line by xNegOverY
    let t284 = circuit_mul(t219, in34); // eval bn line by yInv
    let t285 = circuit_mul(in7, t236);
    let t286 = circuit_add(t233, t285);
    let t287 = circuit_mul(t286, in35); // eval bn line by xNegOverY
    let t288 = circuit_mul(in7, t244);
    let t289 = circuit_add(t243, t288);
    let t290 = circuit_mul(t289, in34); // eval bn line by yInv
    let t291 = circuit_mul(t236, in35); // eval bn line by xNegOverY
    let t292 = circuit_mul(t244, in34); // eval bn line by yInv
    let t293 = circuit_mul(t247, in66); // Eval sparse poly line_2 step coeff_1 * z^1
    let t294 = circuit_add(in5, t293); // Eval sparse poly line_2 step + coeff_1 * z^1
    let t295 = circuit_mul(t250, t1); // Eval sparse poly line_2 step coeff_3 * z^3
    let t296 = circuit_add(t294, t295); // Eval sparse poly line_2 step + coeff_3 * z^3
    let t297 = circuit_mul(t251, t5); // Eval sparse poly line_2 step coeff_7 * z^7
    let t298 = circuit_add(t296, t297); // Eval sparse poly line_2 step + coeff_7 * z^7
    let t299 = circuit_mul(t252, t7); // Eval sparse poly line_2 step coeff_9 * z^9
    let t300 = circuit_add(t298, t299); // Eval sparse poly line_2 step + coeff_9 * z^9
    let t301 = circuit_mul(in71, t300);
    let t302 = circuit_mul(t255, in66); // Eval sparse poly line_2 step coeff_1 * z^1
    let t303 = circuit_add(in5, t302); // Eval sparse poly line_2 step + coeff_1 * z^1
    let t304 = circuit_mul(t258, t1); // Eval sparse poly line_2 step coeff_3 * z^3
    let t305 = circuit_add(t303, t304); // Eval sparse poly line_2 step + coeff_3 * z^3
    let t306 = circuit_mul(t259, t5); // Eval sparse poly line_2 step coeff_7 * z^7
    let t307 = circuit_add(t305, t306); // Eval sparse poly line_2 step + coeff_7 * z^7
    let t308 = circuit_mul(t260, t7); // Eval sparse poly line_2 step coeff_9 * z^9
    let t309 = circuit_add(t307, t308); // Eval sparse poly line_2 step + coeff_9 * z^9
    let t310 = circuit_mul(t301, t309);
    let t311 = circuit_mul(t263, in66); // Eval sparse poly line_2 step coeff_1 * z^1
    let t312 = circuit_add(in5, t311); // Eval sparse poly line_2 step + coeff_1 * z^1
    let t313 = circuit_mul(t266, t1); // Eval sparse poly line_2 step coeff_3 * z^3
    let t314 = circuit_add(t312, t313); // Eval sparse poly line_2 step + coeff_3 * z^3
    let t315 = circuit_mul(t267, t5); // Eval sparse poly line_2 step coeff_7 * z^7
    let t316 = circuit_add(t314, t315); // Eval sparse poly line_2 step + coeff_7 * z^7
    let t317 = circuit_mul(t268, t7); // Eval sparse poly line_2 step coeff_9 * z^9
    let t318 = circuit_add(t316, t317); // Eval sparse poly line_2 step + coeff_9 * z^9
    let t319 = circuit_mul(t310, t318);
    let t320 = circuit_mul(t271, in66); // Eval sparse poly line_2 step coeff_1 * z^1
    let t321 = circuit_add(in5, t320); // Eval sparse poly line_2 step + coeff_1 * z^1
    let t322 = circuit_mul(t274, t1); // Eval sparse poly line_2 step coeff_3 * z^3
    let t323 = circuit_add(t321, t322); // Eval sparse poly line_2 step + coeff_3 * z^3
    let t324 = circuit_mul(t275, t5); // Eval sparse poly line_2 step coeff_7 * z^7
    let t325 = circuit_add(t323, t324); // Eval sparse poly line_2 step + coeff_7 * z^7
    let t326 = circuit_mul(t276, t7); // Eval sparse poly line_2 step coeff_9 * z^9
    let t327 = circuit_add(t325, t326); // Eval sparse poly line_2 step + coeff_9 * z^9
    let t328 = circuit_mul(t319, t327);
    let t329 = circuit_mul(t279, in66); // Eval sparse poly line_2 step coeff_1 * z^1
    let t330 = circuit_add(in5, t329); // Eval sparse poly line_2 step + coeff_1 * z^1
    let t331 = circuit_mul(t282, t1); // Eval sparse poly line_2 step coeff_3 * z^3
    let t332 = circuit_add(t330, t331); // Eval sparse poly line_2 step + coeff_3 * z^3
    let t333 = circuit_mul(t283, t5); // Eval sparse poly line_2 step coeff_7 * z^7
    let t334 = circuit_add(t332, t333); // Eval sparse poly line_2 step + coeff_7 * z^7
    let t335 = circuit_mul(t284, t7); // Eval sparse poly line_2 step coeff_9 * z^9
    let t336 = circuit_add(t334, t335); // Eval sparse poly line_2 step + coeff_9 * z^9
    let t337 = circuit_mul(t328, t336);
    let t338 = circuit_mul(t287, in66); // Eval sparse poly line_2 step coeff_1 * z^1
    let t339 = circuit_add(in5, t338); // Eval sparse poly line_2 step + coeff_1 * z^1
    let t340 = circuit_mul(t290, t1); // Eval sparse poly line_2 step coeff_3 * z^3
    let t341 = circuit_add(t339, t340); // Eval sparse poly line_2 step + coeff_3 * z^3
    let t342 = circuit_mul(t291, t5); // Eval sparse poly line_2 step coeff_7 * z^7
    let t343 = circuit_add(t341, t342); // Eval sparse poly line_2 step + coeff_7 * z^7
    let t344 = circuit_mul(t292, t7); // Eval sparse poly line_2 step coeff_9 * z^9
    let t345 = circuit_add(t343, t344); // Eval sparse poly line_2 step + coeff_9 * z^9
    let t346 = circuit_mul(t337, t345);
    let t347 = circuit_sub(t346, t135);
    let t348 = circuit_mul(t112, t347); // c_n_minus_2 * ((Π(n-2,k) (Pk(z)) - R_n_minus_2(z))
    let t349 = circuit_mul(t135, in67);
    let t350 = circuit_mul(t349, in68);
    let t351 = circuit_mul(t350, in69);
    let t352 = circuit_mul(t351, in65);
    let t353 = circuit_sub(t352, t157);
    let t354 = circuit_mul(t113, t353); // c_n_minus_1 * ((Π(n-1,k) (Pk(z)) - R_n_minus_1(z))
    let t355 = circuit_add(in70, t348);
    let t356 = circuit_add(t355, t354);
    let t357 = circuit_mul(in73, in66); // Eval big_Q step coeff_1 * z^1
    let t358 = circuit_add(in72, t357); // Eval big_Q step + (coeff_1 * z^1)
    let t359 = circuit_mul(in74, t0); // Eval big_Q step coeff_2 * z^2
    let t360 = circuit_add(t358, t359); // Eval big_Q step + (coeff_2 * z^2)
    let t361 = circuit_mul(in75, t1); // Eval big_Q step coeff_3 * z^3
    let t362 = circuit_add(t360, t361); // Eval big_Q step + (coeff_3 * z^3)
    let t363 = circuit_mul(in76, t2); // Eval big_Q step coeff_4 * z^4
    let t364 = circuit_add(t362, t363); // Eval big_Q step + (coeff_4 * z^4)
    let t365 = circuit_mul(in77, t3); // Eval big_Q step coeff_5 * z^5
    let t366 = circuit_add(t364, t365); // Eval big_Q step + (coeff_5 * z^5)
    let t367 = circuit_mul(in78, t4); // Eval big_Q step coeff_6 * z^6
    let t368 = circuit_add(t366, t367); // Eval big_Q step + (coeff_6 * z^6)
    let t369 = circuit_mul(in79, t5); // Eval big_Q step coeff_7 * z^7
    let t370 = circuit_add(t368, t369); // Eval big_Q step + (coeff_7 * z^7)
    let t371 = circuit_mul(in80, t6); // Eval big_Q step coeff_8 * z^8
    let t372 = circuit_add(t370, t371); // Eval big_Q step + (coeff_8 * z^8)
    let t373 = circuit_mul(in81, t7); // Eval big_Q step coeff_9 * z^9
    let t374 = circuit_add(t372, t373); // Eval big_Q step + (coeff_9 * z^9)
    let t375 = circuit_mul(in82, t8); // Eval big_Q step coeff_10 * z^10
    let t376 = circuit_add(t374, t375); // Eval big_Q step + (coeff_10 * z^10)
    let t377 = circuit_mul(in83, t9); // Eval big_Q step coeff_11 * z^11
    let t378 = circuit_add(t376, t377); // Eval big_Q step + (coeff_11 * z^11)
    let t379 = circuit_mul(in84, t10); // Eval big_Q step coeff_12 * z^12
    let t380 = circuit_add(t378, t379); // Eval big_Q step + (coeff_12 * z^12)
    let t381 = circuit_mul(in85, t11); // Eval big_Q step coeff_13 * z^13
    let t382 = circuit_add(t380, t381); // Eval big_Q step + (coeff_13 * z^13)
    let t383 = circuit_mul(in86, t12); // Eval big_Q step coeff_14 * z^14
    let t384 = circuit_add(t382, t383); // Eval big_Q step + (coeff_14 * z^14)
    let t385 = circuit_mul(in87, t13); // Eval big_Q step coeff_15 * z^15
    let t386 = circuit_add(t384, t385); // Eval big_Q step + (coeff_15 * z^15)
    let t387 = circuit_mul(in88, t14); // Eval big_Q step coeff_16 * z^16
    let t388 = circuit_add(t386, t387); // Eval big_Q step + (coeff_16 * z^16)
    let t389 = circuit_mul(in89, t15); // Eval big_Q step coeff_17 * z^17
    let t390 = circuit_add(t388, t389); // Eval big_Q step + (coeff_17 * z^17)
    let t391 = circuit_mul(in90, t16); // Eval big_Q step coeff_18 * z^18
    let t392 = circuit_add(t390, t391); // Eval big_Q step + (coeff_18 * z^18)
    let t393 = circuit_mul(in91, t17); // Eval big_Q step coeff_19 * z^19
    let t394 = circuit_add(t392, t393); // Eval big_Q step + (coeff_19 * z^19)
    let t395 = circuit_mul(in92, t18); // Eval big_Q step coeff_20 * z^20
    let t396 = circuit_add(t394, t395); // Eval big_Q step + (coeff_20 * z^20)
    let t397 = circuit_mul(in93, t19); // Eval big_Q step coeff_21 * z^21
    let t398 = circuit_add(t396, t397); // Eval big_Q step + (coeff_21 * z^21)
    let t399 = circuit_mul(in94, t20); // Eval big_Q step coeff_22 * z^22
    let t400 = circuit_add(t398, t399); // Eval big_Q step + (coeff_22 * z^22)
    let t401 = circuit_mul(in95, t21); // Eval big_Q step coeff_23 * z^23
    let t402 = circuit_add(t400, t401); // Eval big_Q step + (coeff_23 * z^23)
    let t403 = circuit_mul(in96, t22); // Eval big_Q step coeff_24 * z^24
    let t404 = circuit_add(t402, t403); // Eval big_Q step + (coeff_24 * z^24)
    let t405 = circuit_mul(in97, t23); // Eval big_Q step coeff_25 * z^25
    let t406 = circuit_add(t404, t405); // Eval big_Q step + (coeff_25 * z^25)
    let t407 = circuit_mul(in98, t24); // Eval big_Q step coeff_26 * z^26
    let t408 = circuit_add(t406, t407); // Eval big_Q step + (coeff_26 * z^26)
    let t409 = circuit_mul(in99, t25); // Eval big_Q step coeff_27 * z^27
    let t410 = circuit_add(t408, t409); // Eval big_Q step + (coeff_27 * z^27)
    let t411 = circuit_mul(in100, t26); // Eval big_Q step coeff_28 * z^28
    let t412 = circuit_add(t410, t411); // Eval big_Q step + (coeff_28 * z^28)
    let t413 = circuit_mul(in101, t27); // Eval big_Q step coeff_29 * z^29
    let t414 = circuit_add(t412, t413); // Eval big_Q step + (coeff_29 * z^29)
    let t415 = circuit_mul(in102, t28); // Eval big_Q step coeff_30 * z^30
    let t416 = circuit_add(t414, t415); // Eval big_Q step + (coeff_30 * z^30)
    let t417 = circuit_mul(in103, t29); // Eval big_Q step coeff_31 * z^31
    let t418 = circuit_add(t416, t417); // Eval big_Q step + (coeff_31 * z^31)
    let t419 = circuit_mul(in104, t30); // Eval big_Q step coeff_32 * z^32
    let t420 = circuit_add(t418, t419); // Eval big_Q step + (coeff_32 * z^32)
    let t421 = circuit_mul(in105, t31); // Eval big_Q step coeff_33 * z^33
    let t422 = circuit_add(t420, t421); // Eval big_Q step + (coeff_33 * z^33)
    let t423 = circuit_mul(in106, t32); // Eval big_Q step coeff_34 * z^34
    let t424 = circuit_add(t422, t423); // Eval big_Q step + (coeff_34 * z^34)
    let t425 = circuit_mul(in107, t33); // Eval big_Q step coeff_35 * z^35
    let t426 = circuit_add(t424, t425); // Eval big_Q step + (coeff_35 * z^35)
    let t427 = circuit_mul(in108, t34); // Eval big_Q step coeff_36 * z^36
    let t428 = circuit_add(t426, t427); // Eval big_Q step + (coeff_36 * z^36)
    let t429 = circuit_mul(in109, t35); // Eval big_Q step coeff_37 * z^37
    let t430 = circuit_add(t428, t429); // Eval big_Q step + (coeff_37 * z^37)
    let t431 = circuit_mul(in110, t36); // Eval big_Q step coeff_38 * z^38
    let t432 = circuit_add(t430, t431); // Eval big_Q step + (coeff_38 * z^38)
    let t433 = circuit_mul(in111, t37); // Eval big_Q step coeff_39 * z^39
    let t434 = circuit_add(t432, t433); // Eval big_Q step + (coeff_39 * z^39)
    let t435 = circuit_mul(in112, t38); // Eval big_Q step coeff_40 * z^40
    let t436 = circuit_add(t434, t435); // Eval big_Q step + (coeff_40 * z^40)
    let t437 = circuit_mul(in113, t39); // Eval big_Q step coeff_41 * z^41
    let t438 = circuit_add(t436, t437); // Eval big_Q step + (coeff_41 * z^41)
    let t439 = circuit_mul(in114, t40); // Eval big_Q step coeff_42 * z^42
    let t440 = circuit_add(t438, t439); // Eval big_Q step + (coeff_42 * z^42)
    let t441 = circuit_mul(in115, t41); // Eval big_Q step coeff_43 * z^43
    let t442 = circuit_add(t440, t441); // Eval big_Q step + (coeff_43 * z^43)
    let t443 = circuit_mul(in116, t42); // Eval big_Q step coeff_44 * z^44
    let t444 = circuit_add(t442, t443); // Eval big_Q step + (coeff_44 * z^44)
    let t445 = circuit_mul(in117, t43); // Eval big_Q step coeff_45 * z^45
    let t446 = circuit_add(t444, t445); // Eval big_Q step + (coeff_45 * z^45)
    let t447 = circuit_mul(in118, t44); // Eval big_Q step coeff_46 * z^46
    let t448 = circuit_add(t446, t447); // Eval big_Q step + (coeff_46 * z^46)
    let t449 = circuit_mul(in119, t45); // Eval big_Q step coeff_47 * z^47
    let t450 = circuit_add(t448, t449); // Eval big_Q step + (coeff_47 * z^47)
    let t451 = circuit_mul(in120, t46); // Eval big_Q step coeff_48 * z^48
    let t452 = circuit_add(t450, t451); // Eval big_Q step + (coeff_48 * z^48)
    let t453 = circuit_mul(in121, t47); // Eval big_Q step coeff_49 * z^49
    let t454 = circuit_add(t452, t453); // Eval big_Q step + (coeff_49 * z^49)
    let t455 = circuit_mul(in122, t48); // Eval big_Q step coeff_50 * z^50
    let t456 = circuit_add(t454, t455); // Eval big_Q step + (coeff_50 * z^50)
    let t457 = circuit_mul(in123, t49); // Eval big_Q step coeff_51 * z^51
    let t458 = circuit_add(t456, t457); // Eval big_Q step + (coeff_51 * z^51)
    let t459 = circuit_mul(in124, t50); // Eval big_Q step coeff_52 * z^52
    let t460 = circuit_add(t458, t459); // Eval big_Q step + (coeff_52 * z^52)
    let t461 = circuit_mul(in125, t51); // Eval big_Q step coeff_53 * z^53
    let t462 = circuit_add(t460, t461); // Eval big_Q step + (coeff_53 * z^53)
    let t463 = circuit_mul(in126, t52); // Eval big_Q step coeff_54 * z^54
    let t464 = circuit_add(t462, t463); // Eval big_Q step + (coeff_54 * z^54)
    let t465 = circuit_mul(in127, t53); // Eval big_Q step coeff_55 * z^55
    let t466 = circuit_add(t464, t465); // Eval big_Q step + (coeff_55 * z^55)
    let t467 = circuit_mul(in128, t54); // Eval big_Q step coeff_56 * z^56
    let t468 = circuit_add(t466, t467); // Eval big_Q step + (coeff_56 * z^56)
    let t469 = circuit_mul(in129, t55); // Eval big_Q step coeff_57 * z^57
    let t470 = circuit_add(t468, t469); // Eval big_Q step + (coeff_57 * z^57)
    let t471 = circuit_mul(in130, t56); // Eval big_Q step coeff_58 * z^58
    let t472 = circuit_add(t470, t471); // Eval big_Q step + (coeff_58 * z^58)
    let t473 = circuit_mul(in131, t57); // Eval big_Q step coeff_59 * z^59
    let t474 = circuit_add(t472, t473); // Eval big_Q step + (coeff_59 * z^59)
    let t475 = circuit_mul(in132, t58); // Eval big_Q step coeff_60 * z^60
    let t476 = circuit_add(t474, t475); // Eval big_Q step + (coeff_60 * z^60)
    let t477 = circuit_mul(in133, t59); // Eval big_Q step coeff_61 * z^61
    let t478 = circuit_add(t476, t477); // Eval big_Q step + (coeff_61 * z^61)
    let t479 = circuit_mul(in134, t60); // Eval big_Q step coeff_62 * z^62
    let t480 = circuit_add(t478, t479); // Eval big_Q step + (coeff_62 * z^62)
    let t481 = circuit_mul(in135, t61); // Eval big_Q step coeff_63 * z^63
    let t482 = circuit_add(t480, t481); // Eval big_Q step + (coeff_63 * z^63)
    let t483 = circuit_mul(in136, t62); // Eval big_Q step coeff_64 * z^64
    let t484 = circuit_add(t482, t483); // Eval big_Q step + (coeff_64 * z^64)
    let t485 = circuit_mul(in137, t63); // Eval big_Q step coeff_65 * z^65
    let t486 = circuit_add(t484, t485); // Eval big_Q step + (coeff_65 * z^65)
    let t487 = circuit_mul(in138, t64); // Eval big_Q step coeff_66 * z^66
    let t488 = circuit_add(t486, t487); // Eval big_Q step + (coeff_66 * z^66)
    let t489 = circuit_mul(in139, t65); // Eval big_Q step coeff_67 * z^67
    let t490 = circuit_add(t488, t489); // Eval big_Q step + (coeff_67 * z^67)
    let t491 = circuit_mul(in140, t66); // Eval big_Q step coeff_68 * z^68
    let t492 = circuit_add(t490, t491); // Eval big_Q step + (coeff_68 * z^68)
    let t493 = circuit_mul(in141, t67); // Eval big_Q step coeff_69 * z^69
    let t494 = circuit_add(t492, t493); // Eval big_Q step + (coeff_69 * z^69)
    let t495 = circuit_mul(in142, t68); // Eval big_Q step coeff_70 * z^70
    let t496 = circuit_add(t494, t495); // Eval big_Q step + (coeff_70 * z^70)
    let t497 = circuit_mul(in143, t69); // Eval big_Q step coeff_71 * z^71
    let t498 = circuit_add(t496, t497); // Eval big_Q step + (coeff_71 * z^71)
    let t499 = circuit_mul(in144, t70); // Eval big_Q step coeff_72 * z^72
    let t500 = circuit_add(t498, t499); // Eval big_Q step + (coeff_72 * z^72)
    let t501 = circuit_mul(in145, t71); // Eval big_Q step coeff_73 * z^73
    let t502 = circuit_add(t500, t501); // Eval big_Q step + (coeff_73 * z^73)
    let t503 = circuit_mul(in146, t72); // Eval big_Q step coeff_74 * z^74
    let t504 = circuit_add(t502, t503); // Eval big_Q step + (coeff_74 * z^74)
    let t505 = circuit_mul(in147, t73); // Eval big_Q step coeff_75 * z^75
    let t506 = circuit_add(t504, t505); // Eval big_Q step + (coeff_75 * z^75)
    let t507 = circuit_mul(in148, t74); // Eval big_Q step coeff_76 * z^76
    let t508 = circuit_add(t506, t507); // Eval big_Q step + (coeff_76 * z^76)
    let t509 = circuit_mul(in149, t75); // Eval big_Q step coeff_77 * z^77
    let t510 = circuit_add(t508, t509); // Eval big_Q step + (coeff_77 * z^77)
    let t511 = circuit_mul(in150, t76); // Eval big_Q step coeff_78 * z^78
    let t512 = circuit_add(t510, t511); // Eval big_Q step + (coeff_78 * z^78)
    let t513 = circuit_mul(in151, t77); // Eval big_Q step coeff_79 * z^79
    let t514 = circuit_add(t512, t513); // Eval big_Q step + (coeff_79 * z^79)
    let t515 = circuit_mul(in152, t78); // Eval big_Q step coeff_80 * z^80
    let t516 = circuit_add(t514, t515); // Eval big_Q step + (coeff_80 * z^80)
    let t517 = circuit_mul(in153, t79); // Eval big_Q step coeff_81 * z^81
    let t518 = circuit_add(t516, t517); // Eval big_Q step + (coeff_81 * z^81)
    let t519 = circuit_mul(in154, t80); // Eval big_Q step coeff_82 * z^82
    let t520 = circuit_add(t518, t519); // Eval big_Q step + (coeff_82 * z^82)
    let t521 = circuit_mul(in155, t81); // Eval big_Q step coeff_83 * z^83
    let t522 = circuit_add(t520, t521); // Eval big_Q step + (coeff_83 * z^83)
    let t523 = circuit_mul(in156, t82); // Eval big_Q step coeff_84 * z^84
    let t524 = circuit_add(t522, t523); // Eval big_Q step + (coeff_84 * z^84)
    let t525 = circuit_mul(in157, t83); // Eval big_Q step coeff_85 * z^85
    let t526 = circuit_add(t524, t525); // Eval big_Q step + (coeff_85 * z^85)
    let t527 = circuit_mul(in158, t84); // Eval big_Q step coeff_86 * z^86
    let t528 = circuit_add(t526, t527); // Eval big_Q step + (coeff_86 * z^86)
    let t529 = circuit_mul(in159, t85); // Eval big_Q step coeff_87 * z^87
    let t530 = circuit_add(t528, t529); // Eval big_Q step + (coeff_87 * z^87)
    let t531 = circuit_mul(in160, t86); // Eval big_Q step coeff_88 * z^88
    let t532 = circuit_add(t530, t531); // Eval big_Q step + (coeff_88 * z^88)
    let t533 = circuit_mul(in161, t87); // Eval big_Q step coeff_89 * z^89
    let t534 = circuit_add(t532, t533); // Eval big_Q step + (coeff_89 * z^89)
    let t535 = circuit_mul(in162, t88); // Eval big_Q step coeff_90 * z^90
    let t536 = circuit_add(t534, t535); // Eval big_Q step + (coeff_90 * z^90)
    let t537 = circuit_mul(in163, t89); // Eval big_Q step coeff_91 * z^91
    let t538 = circuit_add(t536, t537); // Eval big_Q step + (coeff_91 * z^91)
    let t539 = circuit_mul(in164, t90); // Eval big_Q step coeff_92 * z^92
    let t540 = circuit_add(t538, t539); // Eval big_Q step + (coeff_92 * z^92)
    let t541 = circuit_mul(in165, t91); // Eval big_Q step coeff_93 * z^93
    let t542 = circuit_add(t540, t541); // Eval big_Q step + (coeff_93 * z^93)
    let t543 = circuit_mul(in166, t92); // Eval big_Q step coeff_94 * z^94
    let t544 = circuit_add(t542, t543); // Eval big_Q step + (coeff_94 * z^94)
    let t545 = circuit_mul(in167, t93); // Eval big_Q step coeff_95 * z^95
    let t546 = circuit_add(t544, t545); // Eval big_Q step + (coeff_95 * z^95)
    let t547 = circuit_mul(in168, t94); // Eval big_Q step coeff_96 * z^96
    let t548 = circuit_add(t546, t547); // Eval big_Q step + (coeff_96 * z^96)
    let t549 = circuit_mul(in169, t95); // Eval big_Q step coeff_97 * z^97
    let t550 = circuit_add(t548, t549); // Eval big_Q step + (coeff_97 * z^97)
    let t551 = circuit_mul(in170, t96); // Eval big_Q step coeff_98 * z^98
    let t552 = circuit_add(t550, t551); // Eval big_Q step + (coeff_98 * z^98)
    let t553 = circuit_mul(in171, t97); // Eval big_Q step coeff_99 * z^99
    let t554 = circuit_add(t552, t553); // Eval big_Q step + (coeff_99 * z^99)
    let t555 = circuit_mul(in172, t98); // Eval big_Q step coeff_100 * z^100
    let t556 = circuit_add(t554, t555); // Eval big_Q step + (coeff_100 * z^100)
    let t557 = circuit_mul(in173, t99); // Eval big_Q step coeff_101 * z^101
    let t558 = circuit_add(t556, t557); // Eval big_Q step + (coeff_101 * z^101)
    let t559 = circuit_mul(in174, t100); // Eval big_Q step coeff_102 * z^102
    let t560 = circuit_add(t558, t559); // Eval big_Q step + (coeff_102 * z^102)
    let t561 = circuit_mul(in175, t101); // Eval big_Q step coeff_103 * z^103
    let t562 = circuit_add(t560, t561); // Eval big_Q step + (coeff_103 * z^103)
    let t563 = circuit_mul(in176, t102); // Eval big_Q step coeff_104 * z^104
    let t564 = circuit_add(t562, t563); // Eval big_Q step + (coeff_104 * z^104)
    let t565 = circuit_mul(in177, t103); // Eval big_Q step coeff_105 * z^105
    let t566 = circuit_add(t564, t565); // Eval big_Q step + (coeff_105 * z^105)
    let t567 = circuit_mul(in178, t104); // Eval big_Q step coeff_106 * z^106
    let t568 = circuit_add(t566, t567); // Eval big_Q step + (coeff_106 * z^106)
    let t569 = circuit_mul(in179, t105); // Eval big_Q step coeff_107 * z^107
    let t570 = circuit_add(t568, t569); // Eval big_Q step + (coeff_107 * z^107)
    let t571 = circuit_mul(in180, t106); // Eval big_Q step coeff_108 * z^108
    let t572 = circuit_add(t570, t571); // Eval big_Q step + (coeff_108 * z^108)
    let t573 = circuit_mul(in181, t107); // Eval big_Q step coeff_109 * z^109
    let t574 = circuit_add(t572, t573); // Eval big_Q step + (coeff_109 * z^109)
    let t575 = circuit_mul(in182, t108); // Eval big_Q step coeff_110 * z^110
    let t576 = circuit_add(t574, t575); // Eval big_Q step + (coeff_110 * z^110)
    let t577 = circuit_mul(in183, t109); // Eval big_Q step coeff_111 * z^111
    let t578 = circuit_add(t576, t577); // Eval big_Q step + (coeff_111 * z^111)
    let t579 = circuit_mul(in184, t110); // Eval big_Q step coeff_112 * z^112
    let t580 = circuit_add(t578, t579); // Eval big_Q step + (coeff_112 * z^112)
    let t581 = circuit_mul(in185, t111); // Eval big_Q step coeff_113 * z^113
    let t582 = circuit_add(t580, t581); // Eval big_Q step + (coeff_113 * z^113)
    let t583 = circuit_mul(in9, t4); // Eval sparse poly P_irr step coeff_6 * z^6
    let t584 = circuit_add(in8, t583); // Eval sparse poly P_irr step + coeff_6 * z^6
    let t585 = circuit_add(t584, t10); // Eval sparse poly P_irr step + 1*z^12
    let t586 = circuit_mul(t582, t585);
    let t587 = circuit_sub(t356, t586);

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t587,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0xc2c3330c99e39557176f553d, 0x4c0bec3cf559b143b78cc310, 0x2fb347984f7911f7, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs
        .next(
            [0xb7c9dce1665d51c640fcba2, 0x4ba4cc8bd75a079432ae2a1d, 0x16c9e55061ebae20, 0x0]
        ); // in1
    circuit_inputs = circuit_inputs
        .next(
            [0xa9c95998dc54014671a0135a, 0xdc5ec698b6e2f9b9dbaae0ed, 0x63cf305489af5dc, 0x0]
        ); // in2
    circuit_inputs = circuit_inputs
        .next(
            [0x8fa25bd282d37f632623b0e3, 0x704b5a7ec796f2b21807dc9, 0x7c03cbcac41049a, 0x0]
        ); // in3
    circuit_inputs = circuit_inputs
        .next(
            [0xbb966e3de4bd44e5607cfd48, 0x5e6dd9e7e0acccb0c28f069f, 0x30644e72e131a029, 0x0]
        ); // in4
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in5
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in6
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in7
    circuit_inputs = circuit_inputs.next([0x52, 0x0, 0x0, 0x0]); // in8
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd35, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in9
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in10
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in11
    circuit_inputs = circuit_inputs.next(line_1_0.r0a0); // in12
    circuit_inputs = circuit_inputs.next(line_1_0.r0a1); // in13
    circuit_inputs = circuit_inputs.next(line_1_0.r1a0); // in14
    circuit_inputs = circuit_inputs.next(line_1_0.r1a1); // in15
    circuit_inputs = circuit_inputs.next(line_2_0.r0a0); // in16
    circuit_inputs = circuit_inputs.next(line_2_0.r0a1); // in17
    circuit_inputs = circuit_inputs.next(line_2_0.r1a0); // in18
    circuit_inputs = circuit_inputs.next(line_2_0.r1a1); // in19
    circuit_inputs = circuit_inputs.next(yInv_1); // in20
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in21
    circuit_inputs = circuit_inputs.next(line_1_1.r0a0); // in22
    circuit_inputs = circuit_inputs.next(line_1_1.r0a1); // in23
    circuit_inputs = circuit_inputs.next(line_1_1.r1a0); // in24
    circuit_inputs = circuit_inputs.next(line_1_1.r1a1); // in25
    circuit_inputs = circuit_inputs.next(line_2_1.r0a0); // in26
    circuit_inputs = circuit_inputs.next(line_2_1.r0a1); // in27
    circuit_inputs = circuit_inputs.next(line_2_1.r1a0); // in28
    circuit_inputs = circuit_inputs.next(line_2_1.r1a1); // in29
    circuit_inputs = circuit_inputs.next(original_Q2.x0); // in30
    circuit_inputs = circuit_inputs.next(original_Q2.x1); // in31
    circuit_inputs = circuit_inputs.next(original_Q2.y0); // in32
    circuit_inputs = circuit_inputs.next(original_Q2.y1); // in33
    circuit_inputs = circuit_inputs.next(yInv_2); // in34
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in35
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in36
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in37
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in38
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in39
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w0); // in40
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w1); // in41
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w2); // in42
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w3); // in43
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w4); // in44
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w5); // in45
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w6); // in46
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w7); // in47
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w8); // in48
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w9); // in49
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w10); // in50
    circuit_inputs = circuit_inputs.next(R_n_minus_2.w11); // in51
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w0); // in52
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w1); // in53
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w2); // in54
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w3); // in55
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w4); // in56
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w5); // in57
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w6); // in58
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w7); // in59
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w8); // in60
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w9); // in61
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w10); // in62
    circuit_inputs = circuit_inputs.next(R_n_minus_1.w11); // in63
    circuit_inputs = circuit_inputs.next(c_n_minus_3); // in64
    circuit_inputs = circuit_inputs.next(w_of_z); // in65
    circuit_inputs = circuit_inputs.next(z); // in66
    circuit_inputs = circuit_inputs.next(c_inv_frob_1_of_z); // in67
    circuit_inputs = circuit_inputs.next(c_frob_2_of_z); // in68
    circuit_inputs = circuit_inputs.next(c_inv_frob_3_of_z); // in69
    circuit_inputs = circuit_inputs.next(previous_lhs); // in70
    circuit_inputs = circuit_inputs.next(R_n_minus_3_of_z); // in71

    let mut Q = Q;
    while let Option::Some(val) = Q.pop_front() {
        circuit_inputs = circuit_inputs.next(val);
    };
    // in72 - in185

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let final_check: u384 = outputs.get_output(t587);
    return (final_check,);
}
fn run_BN254_MP_CHECK_INIT_BIT_2P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    R_i: E12D,
    c0: u384,
    z: u384,
    c_inv_of_z: u384,
    previous_lhs: u384
) -> (u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1

    // INPUT stack
    let (in2, in3, in4) = (CE::<CI<2>> {}, CE::<CI<3>> {}, CE::<CI<4>> {});
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let in29 = CE::<CI<29>> {};
    let t0 = circuit_mul(in27, in27); // Compute z^2
    let t1 = circuit_mul(t0, in27); // Compute z^3
    let t2 = circuit_mul(t1, in27); // Compute z^4
    let t3 = circuit_mul(t2, in27); // Compute z^5
    let t4 = circuit_mul(t3, in27); // Compute z^6
    let t5 = circuit_mul(t4, in27); // Compute z^7
    let t6 = circuit_mul(t5, in27); // Compute z^8
    let t7 = circuit_mul(t6, in27); // Compute z^9
    let t8 = circuit_mul(t7, in27); // Compute z^10
    let t9 = circuit_mul(t8, in27); // Compute z^11
    let t10 = circuit_mul(in15, in27); // Eval R step coeff_1 * z^1
    let t11 = circuit_add(in14, t10); // Eval R step + (coeff_1 * z^1)
    let t12 = circuit_mul(in16, t0); // Eval R step coeff_2 * z^2
    let t13 = circuit_add(t11, t12); // Eval R step + (coeff_2 * z^2)
    let t14 = circuit_mul(in17, t1); // Eval R step coeff_3 * z^3
    let t15 = circuit_add(t13, t14); // Eval R step + (coeff_3 * z^3)
    let t16 = circuit_mul(in18, t2); // Eval R step coeff_4 * z^4
    let t17 = circuit_add(t15, t16); // Eval R step + (coeff_4 * z^4)
    let t18 = circuit_mul(in19, t3); // Eval R step coeff_5 * z^5
    let t19 = circuit_add(t17, t18); // Eval R step + (coeff_5 * z^5)
    let t20 = circuit_mul(in20, t4); // Eval R step coeff_6 * z^6
    let t21 = circuit_add(t19, t20); // Eval R step + (coeff_6 * z^6)
    let t22 = circuit_mul(in21, t5); // Eval R step coeff_7 * z^7
    let t23 = circuit_add(t21, t22); // Eval R step + (coeff_7 * z^7)
    let t24 = circuit_mul(in22, t6); // Eval R step coeff_8 * z^8
    let t25 = circuit_add(t23, t24); // Eval R step + (coeff_8 * z^8)
    let t26 = circuit_mul(in23, t7); // Eval R step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval R step + (coeff_9 * z^9)
    let t28 = circuit_mul(in24, t8); // Eval R step coeff_10 * z^10
    let t29 = circuit_add(t27, t28); // Eval R step + (coeff_10 * z^10)
    let t30 = circuit_mul(in25, t9); // Eval R step coeff_11 * z^11
    let t31 = circuit_add(t29, t30); // Eval R step + (coeff_11 * z^11)
    let t32 = circuit_mul(in28, in28);
    let t33 = circuit_mul(in26, in26);
    let t34 = circuit_mul(in0, in5);
    let t35 = circuit_add(in4, t34);
    let t36 = circuit_mul(t35, in3); // eval bn line by xNegOverY
    let t37 = circuit_mul(in0, in7);
    let t38 = circuit_add(in6, t37);
    let t39 = circuit_mul(t38, in2); // eval bn line by yInv
    let t40 = circuit_mul(in5, in3); // eval bn line by xNegOverY
    let t41 = circuit_mul(in7, in2); // eval bn line by yInv
    let t42 = circuit_mul(t36, in27); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t43 = circuit_add(in1, t42); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t44 = circuit_mul(t39, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t45 = circuit_add(t43, t44); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t46 = circuit_mul(t40, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t47 = circuit_add(t45, t46); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t48 = circuit_mul(t41, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t49 = circuit_add(t47, t48); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t50 = circuit_mul(t32, t49);
    let t51 = circuit_mul(in0, in11);
    let t52 = circuit_add(in10, t51);
    let t53 = circuit_mul(t52, in9); // eval bn line by xNegOverY
    let t54 = circuit_mul(in0, in13);
    let t55 = circuit_add(in12, t54);
    let t56 = circuit_mul(t55, in8); // eval bn line by yInv
    let t57 = circuit_mul(in11, in9); // eval bn line by xNegOverY
    let t58 = circuit_mul(in13, in8); // eval bn line by yInv
    let t59 = circuit_mul(t53, in27); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t60 = circuit_add(in1, t59); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t61 = circuit_mul(t56, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t62 = circuit_add(t60, t61); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t63 = circuit_mul(t57, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t64 = circuit_add(t62, t63); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t65 = circuit_mul(t58, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t66 = circuit_add(t64, t65); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t67 = circuit_mul(t50, t66);
    let t68 = circuit_sub(t67, t31);
    let t69 = circuit_mul(t33, t68); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t70 = circuit_add(t69, in29);

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t70, t33, t31,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in2
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in3
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in4
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in5
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in7
    circuit_inputs = circuit_inputs.next(yInv_1); // in8
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in9
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in10
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in11
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in13
    circuit_inputs = circuit_inputs.next(R_i.w0); // in14
    circuit_inputs = circuit_inputs.next(R_i.w1); // in15
    circuit_inputs = circuit_inputs.next(R_i.w2); // in16
    circuit_inputs = circuit_inputs.next(R_i.w3); // in17
    circuit_inputs = circuit_inputs.next(R_i.w4); // in18
    circuit_inputs = circuit_inputs.next(R_i.w5); // in19
    circuit_inputs = circuit_inputs.next(R_i.w6); // in20
    circuit_inputs = circuit_inputs.next(R_i.w7); // in21
    circuit_inputs = circuit_inputs.next(R_i.w8); // in22
    circuit_inputs = circuit_inputs.next(R_i.w9); // in23
    circuit_inputs = circuit_inputs.next(R_i.w10); // in24
    circuit_inputs = circuit_inputs.next(R_i.w11); // in25
    circuit_inputs = circuit_inputs.next(c0); // in26
    circuit_inputs = circuit_inputs.next(z); // in27
    circuit_inputs = circuit_inputs.next(c_inv_of_z); // in28
    circuit_inputs = circuit_inputs.next(previous_lhs); // in29

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let new_lhs: u384 = outputs.get_output(t70);
    let c_i: u384 = outputs.get_output(t33);
    let f_i_plus_one_of_z: u384 = outputs.get_output(t31);
    return (new_lhs, c_i, f_i_plus_one_of_z);
}
fn run_BN254_MP_CHECK_INIT_BIT_3P_2F_circuit(
    yInv_0: u384,
    xNegOverY_0: u384,
    G2_line_0: G2Line,
    yInv_1: u384,
    xNegOverY_1: u384,
    G2_line_1: G2Line,
    yInv_2: u384,
    xNegOverY_2: u384,
    Q_2: G2Point,
    R_i: E12D,
    c0: u384,
    z: u384,
    c_inv_of_z: u384,
    previous_lhs: u384
) -> (G2Point, u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // -0x9 % p
    let in1 = CE::<CI<1>> {}; // 0x1
    let in2 = CE::<CI<2>> {}; // 0x3
    let in3 = CE::<CI<3>> {}; // 0x6
    let in4 = CE::<CI<4>> {}; // 0x0

    // INPUT stack
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let in38 = CE::<CI<38>> {};
    let t0 = circuit_mul(in36, in36); // Compute z^2
    let t1 = circuit_mul(t0, in36); // Compute z^3
    let t2 = circuit_mul(t1, in36); // Compute z^4
    let t3 = circuit_mul(t2, in36); // Compute z^5
    let t4 = circuit_mul(t3, in36); // Compute z^6
    let t5 = circuit_mul(t4, in36); // Compute z^7
    let t6 = circuit_mul(t5, in36); // Compute z^8
    let t7 = circuit_mul(t6, in36); // Compute z^9
    let t8 = circuit_mul(t7, in36); // Compute z^10
    let t9 = circuit_mul(t8, in36); // Compute z^11
    let t10 = circuit_mul(in24, in36); // Eval R step coeff_1 * z^1
    let t11 = circuit_add(in23, t10); // Eval R step + (coeff_1 * z^1)
    let t12 = circuit_mul(in25, t0); // Eval R step coeff_2 * z^2
    let t13 = circuit_add(t11, t12); // Eval R step + (coeff_2 * z^2)
    let t14 = circuit_mul(in26, t1); // Eval R step coeff_3 * z^3
    let t15 = circuit_add(t13, t14); // Eval R step + (coeff_3 * z^3)
    let t16 = circuit_mul(in27, t2); // Eval R step coeff_4 * z^4
    let t17 = circuit_add(t15, t16); // Eval R step + (coeff_4 * z^4)
    let t18 = circuit_mul(in28, t3); // Eval R step coeff_5 * z^5
    let t19 = circuit_add(t17, t18); // Eval R step + (coeff_5 * z^5)
    let t20 = circuit_mul(in29, t4); // Eval R step coeff_6 * z^6
    let t21 = circuit_add(t19, t20); // Eval R step + (coeff_6 * z^6)
    let t22 = circuit_mul(in30, t5); // Eval R step coeff_7 * z^7
    let t23 = circuit_add(t21, t22); // Eval R step + (coeff_7 * z^7)
    let t24 = circuit_mul(in31, t6); // Eval R step coeff_8 * z^8
    let t25 = circuit_add(t23, t24); // Eval R step + (coeff_8 * z^8)
    let t26 = circuit_mul(in32, t7); // Eval R step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval R step + (coeff_9 * z^9)
    let t28 = circuit_mul(in33, t8); // Eval R step coeff_10 * z^10
    let t29 = circuit_add(t27, t28); // Eval R step + (coeff_10 * z^10)
    let t30 = circuit_mul(in34, t9); // Eval R step coeff_11 * z^11
    let t31 = circuit_add(t29, t30); // Eval R step + (coeff_11 * z^11)
    let t32 = circuit_mul(in37, in37);
    let t33 = circuit_mul(in35, in35);
    let t34 = circuit_mul(in0, in8);
    let t35 = circuit_add(in7, t34);
    let t36 = circuit_mul(t35, in6); // eval bn line by xNegOverY
    let t37 = circuit_mul(in0, in10);
    let t38 = circuit_add(in9, t37);
    let t39 = circuit_mul(t38, in5); // eval bn line by yInv
    let t40 = circuit_mul(in8, in6); // eval bn line by xNegOverY
    let t41 = circuit_mul(in10, in5); // eval bn line by yInv
    let t42 = circuit_mul(t36, in36); // Eval sparse poly line_0p_1 step coeff_1 * z^1
    let t43 = circuit_add(in1, t42); // Eval sparse poly line_0p_1 step + coeff_1 * z^1
    let t44 = circuit_mul(t39, t1); // Eval sparse poly line_0p_1 step coeff_3 * z^3
    let t45 = circuit_add(t43, t44); // Eval sparse poly line_0p_1 step + coeff_3 * z^3
    let t46 = circuit_mul(t40, t5); // Eval sparse poly line_0p_1 step coeff_7 * z^7
    let t47 = circuit_add(t45, t46); // Eval sparse poly line_0p_1 step + coeff_7 * z^7
    let t48 = circuit_mul(t41, t7); // Eval sparse poly line_0p_1 step coeff_9 * z^9
    let t49 = circuit_add(t47, t48); // Eval sparse poly line_0p_1 step + coeff_9 * z^9
    let t50 = circuit_mul(t32, t49);
    let t51 = circuit_mul(in0, in14);
    let t52 = circuit_add(in13, t51);
    let t53 = circuit_mul(t52, in12); // eval bn line by xNegOverY
    let t54 = circuit_mul(in0, in16);
    let t55 = circuit_add(in15, t54);
    let t56 = circuit_mul(t55, in11); // eval bn line by yInv
    let t57 = circuit_mul(in14, in12); // eval bn line by xNegOverY
    let t58 = circuit_mul(in16, in11); // eval bn line by yInv
    let t59 = circuit_mul(t53, in36); // Eval sparse poly line_1p_1 step coeff_1 * z^1
    let t60 = circuit_add(in1, t59); // Eval sparse poly line_1p_1 step + coeff_1 * z^1
    let t61 = circuit_mul(t56, t1); // Eval sparse poly line_1p_1 step coeff_3 * z^3
    let t62 = circuit_add(t60, t61); // Eval sparse poly line_1p_1 step + coeff_3 * z^3
    let t63 = circuit_mul(t57, t5); // Eval sparse poly line_1p_1 step coeff_7 * z^7
    let t64 = circuit_add(t62, t63); // Eval sparse poly line_1p_1 step + coeff_7 * z^7
    let t65 = circuit_mul(t58, t7); // Eval sparse poly line_1p_1 step coeff_9 * z^9
    let t66 = circuit_add(t64, t65); // Eval sparse poly line_1p_1 step + coeff_9 * z^9
    let t67 = circuit_mul(t50, t66);
    let t68 = circuit_add(in19, in20); // Doubling slope numerator start
    let t69 = circuit_sub(in19, in20);
    let t70 = circuit_mul(t68, t69);
    let t71 = circuit_mul(in19, in20);
    let t72 = circuit_mul(t70, in2);
    let t73 = circuit_mul(t71, in3); // Doubling slope numerator end
    let t74 = circuit_add(in21, in21); // Fp2 add coeff 0/1
    let t75 = circuit_add(in22, in22); // Fp2 add coeff 1/1
    let t76 = circuit_mul(t74, t74); // Fp2 Div x/y start : Fp2 Inv y start
    let t77 = circuit_mul(t75, t75);
    let t78 = circuit_add(t76, t77);
    let t79 = circuit_inverse(t78);
    let t80 = circuit_mul(t74, t79); // Fp2 Inv y real part end
    let t81 = circuit_mul(t75, t79);
    let t82 = circuit_sub(in4, t81); // Fp2 Inv y imag part end
    let t83 = circuit_mul(t72, t80); // Fp2 mul start
    let t84 = circuit_mul(t73, t82);
    let t85 = circuit_sub(t83, t84); // Fp2 mul real part end
    let t86 = circuit_mul(t72, t82);
    let t87 = circuit_mul(t73, t80);
    let t88 = circuit_add(t86, t87); // Fp2 mul imag part end
    let t89 = circuit_add(t85, t88);
    let t90 = circuit_sub(t85, t88);
    let t91 = circuit_mul(t89, t90);
    let t92 = circuit_mul(t85, t88);
    let t93 = circuit_add(t92, t92);
    let t94 = circuit_add(in19, in19); // Fp2 add coeff 0/1
    let t95 = circuit_add(in20, in20); // Fp2 add coeff 1/1
    let t96 = circuit_sub(t91, t94); // Fp2 sub coeff 0/1
    let t97 = circuit_sub(t93, t95); // Fp2 sub coeff 1/1
    let t98 = circuit_sub(in19, t96); // Fp2 sub coeff 0/1
    let t99 = circuit_sub(in20, t97); // Fp2 sub coeff 1/1
    let t100 = circuit_mul(t85, t98); // Fp2 mul start
    let t101 = circuit_mul(t88, t99);
    let t102 = circuit_sub(t100, t101); // Fp2 mul real part end
    let t103 = circuit_mul(t85, t99);
    let t104 = circuit_mul(t88, t98);
    let t105 = circuit_add(t103, t104); // Fp2 mul imag part end
    let t106 = circuit_sub(t102, in21); // Fp2 sub coeff 0/1
    let t107 = circuit_sub(t105, in22); // Fp2 sub coeff 1/1
    let t108 = circuit_mul(t85, in19); // Fp2 mul start
    let t109 = circuit_mul(t88, in20);
    let t110 = circuit_sub(t108, t109); // Fp2 mul real part end
    let t111 = circuit_mul(t85, in20);
    let t112 = circuit_mul(t88, in19);
    let t113 = circuit_add(t111, t112); // Fp2 mul imag part end
    let t114 = circuit_sub(t110, in21); // Fp2 sub coeff 0/1
    let t115 = circuit_sub(t113, in22); // Fp2 sub coeff 1/1
    let t116 = circuit_mul(in0, t88);
    let t117 = circuit_add(t85, t116);
    let t118 = circuit_mul(t117, in18); // eval bn line by xNegOverY
    let t119 = circuit_mul(in0, t115);
    let t120 = circuit_add(t114, t119);
    let t121 = circuit_mul(t120, in17); // eval bn line by yInv
    let t122 = circuit_mul(t88, in18); // eval bn line by xNegOverY
    let t123 = circuit_mul(t115, in17); // eval bn line by yInv
    let t124 = circuit_mul(t118, in36); // Eval sparse poly line_2p_1 step coeff_1 * z^1
    let t125 = circuit_add(in1, t124); // Eval sparse poly line_2p_1 step + coeff_1 * z^1
    let t126 = circuit_mul(t121, t1); // Eval sparse poly line_2p_1 step coeff_3 * z^3
    let t127 = circuit_add(t125, t126); // Eval sparse poly line_2p_1 step + coeff_3 * z^3
    let t128 = circuit_mul(t122, t5); // Eval sparse poly line_2p_1 step coeff_7 * z^7
    let t129 = circuit_add(t127, t128); // Eval sparse poly line_2p_1 step + coeff_7 * z^7
    let t130 = circuit_mul(t123, t7); // Eval sparse poly line_2p_1 step coeff_9 * z^9
    let t131 = circuit_add(t129, t130); // Eval sparse poly line_2p_1 step + coeff_9 * z^9
    let t132 = circuit_mul(t67, t131);
    let t133 = circuit_sub(t132, t31);
    let t134 = circuit_mul(t33, t133); // ci * ((Π(i,k) (Pk(z)) - Ri(z))
    let t135 = circuit_add(t134, in38);

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t96, t97, t106, t107, t135, t33, t31,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd3e, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in0
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs.next([0x3, 0x0, 0x0, 0x0]); // in2
    circuit_inputs = circuit_inputs.next([0x6, 0x0, 0x0, 0x0]); // in3
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in4
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(yInv_0); // in5
    circuit_inputs = circuit_inputs.next(xNegOverY_0); // in6
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a0); // in7
    circuit_inputs = circuit_inputs.next(G2_line_0.r0a1); // in8
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a0); // in9
    circuit_inputs = circuit_inputs.next(G2_line_0.r1a1); // in10
    circuit_inputs = circuit_inputs.next(yInv_1); // in11
    circuit_inputs = circuit_inputs.next(xNegOverY_1); // in12
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a0); // in13
    circuit_inputs = circuit_inputs.next(G2_line_1.r0a1); // in14
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a0); // in15
    circuit_inputs = circuit_inputs.next(G2_line_1.r1a1); // in16
    circuit_inputs = circuit_inputs.next(yInv_2); // in17
    circuit_inputs = circuit_inputs.next(xNegOverY_2); // in18
    circuit_inputs = circuit_inputs.next(Q_2.x0); // in19
    circuit_inputs = circuit_inputs.next(Q_2.x1); // in20
    circuit_inputs = circuit_inputs.next(Q_2.y0); // in21
    circuit_inputs = circuit_inputs.next(Q_2.y1); // in22
    circuit_inputs = circuit_inputs.next(R_i.w0); // in23
    circuit_inputs = circuit_inputs.next(R_i.w1); // in24
    circuit_inputs = circuit_inputs.next(R_i.w2); // in25
    circuit_inputs = circuit_inputs.next(R_i.w3); // in26
    circuit_inputs = circuit_inputs.next(R_i.w4); // in27
    circuit_inputs = circuit_inputs.next(R_i.w5); // in28
    circuit_inputs = circuit_inputs.next(R_i.w6); // in29
    circuit_inputs = circuit_inputs.next(R_i.w7); // in30
    circuit_inputs = circuit_inputs.next(R_i.w8); // in31
    circuit_inputs = circuit_inputs.next(R_i.w9); // in32
    circuit_inputs = circuit_inputs.next(R_i.w10); // in33
    circuit_inputs = circuit_inputs.next(R_i.w11); // in34
    circuit_inputs = circuit_inputs.next(c0); // in35
    circuit_inputs = circuit_inputs.next(z); // in36
    circuit_inputs = circuit_inputs.next(c_inv_of_z); // in37
    circuit_inputs = circuit_inputs.next(previous_lhs); // in38

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let Q0: G2Point = G2Point {
        x0: outputs.get_output(t96),
        x1: outputs.get_output(t97),
        y0: outputs.get_output(t106),
        y1: outputs.get_output(t107)
    };
    let new_lhs: u384 = outputs.get_output(t135);
    let c_i: u384 = outputs.get_output(t33);
    let f_i_plus_one_of_z: u384 = outputs.get_output(t31);
    return (Q0, new_lhs, c_i, f_i_plus_one_of_z);
}
fn run_BN254_MP_CHECK_PREPARE_LAMBDA_ROOT_circuit(
    lambda_root: E12D,
    z: u384,
    scaling_factor: MillerLoopResultScalingFactor,
    c_inv: E12D,
    c_0: u384
) -> (u384, u384, u384, u384, u384, u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x1
    let in1 = CE::<CI<1>> {}; // 0x12
    let in2 = CE::<CI<2>> {}; // 0x1d8c8daef3eee1e81b2522ec5eb28ded6895e1cdfde6a43f5daa971f3fa65955
    let in3 = CE::<CI<3>> {}; // 0x217e400dc9351e774e34e2ac06ead4000d14d1e242b29c567e9c385ce480a71a
    let in4 = CE::<CI<4>> {}; // 0x242b719062f6737b8481d22c6934ce844d72f250fd28d102c0d147b2f4d521a7
    let in5 = CE::<CI<5>> {}; // 0x359809094bd5c8e1b9c22d81246ffc2e794e17643ac198484b8d9094aa82536
    let in6 = CE::<CI<6>> {}; // 0x21436d48fcb50cc60dd4ef1e69a0c1f0dd2949fa6df7b44cbb259ef7cb58d5ed
    let in7 = CE::<CI<7>> {}; // 0x18857a58f3b5bb3038a4311a86919d9c7c6c15f88a4f4f0831364cf35f78f771
    let in8 = CE::<CI<8>> {}; // 0x2c84bbad27c3671562b7adefd44038ab3c0bbad96fc008e7d6998c82f7fc048b
    let in9 = CE::<CI<9>> {}; // 0xc33b1c70e4fd11b6d1eab6fcd18b99ad4afd096a8697e0c9c36d8ca3339a7b5
    let in10 = CE::<
        CI<10>
    > {}; // 0x1b007294a55accce13fe08bea73305ff6bdac77c5371c546d428780a6e3dcfa8
    let in11 = CE::<
        CI<11>
    > {}; // 0x215d42e7ac7bd17cefe88dd8e6965b3adae92c974f501fe811493d72543a3977
    let in12 = CE::<CI<12>> {}; // -0x1 % p
    let in13 = CE::<
        CI<13>
    > {}; // 0x246996f3b4fae7e6a6327cfe12150b8e747992778eeec7e5ca5cf05f80f362ac
    let in14 = CE::<
        CI<14>
    > {}; // 0x12d7c0c3ed42be419d2b22ca22ceca702eeb88c36a8b264dde75f4f798d6a3f2
    let in15 = CE::<
        CI<15>
    > {}; // 0x16c9e55061ebae204ba4cc8bd75a079432ae2a1d0b7c9dce1665d51c640fcba2
    let in16 = CE::<CI<16>> {}; // 0xc38dce27e3b2cae33ce738a184c89d94a0e78406b48f98a7b4f4463e3a7dba0
    let in17 = CE::<CI<17>> {}; // 0x7c03cbcac41049a0704b5a7ec796f2b21807dc98fa25bd282d37f632623b0e3
    let in18 = CE::<CI<18>> {}; // 0xf20e129e47c9363aa7b569817e0966cba582096fa7a164080faed1f0d24275a
    let in19 = CE::<
        CI<19>
    > {}; // 0x2c145edbe7fd8aee9f3a80b03b0b1c923685d2ea1bdec763c13b4711cd2b8126
    let in20 = CE::<CI<20>> {}; // 0x3df92c5b96e3914559897c6ad411fb25b75afb7f8b1c1a56586ff93e080f8bc
    let in21 = CE::<
        CI<21>
    > {}; // 0x12acf2ca76fd0675a27fb246c7729f7db080cb99678e2ac024c6b8ee6e0c2c4b
    let in22 = CE::<
        CI<22>
    > {}; // 0x1563dbde3bd6d35ba4523cf7da4e525e2ba6a3151500054667f8140c6a3f2d9f
    let in23 = CE::<
        CI<23>
    > {}; // 0x30644e72e131a0295e6dd9e7e0acccb0c28f069fbb966e3de4bd44e5607cfd49
    let in24 = CE::<
        CI<24>
    > {}; // 0x30644e72e131a0295e6dd9e7e0acccb0c28f069fbb966e3de4bd44e5607cfd48
    let in25 = CE::<CI<25>> {}; // 0x59e26bcea0d48bacd4f263f1acdb5c4f5763473177fffffe
    let in26 = CE::<CI<26>> {}; // 0x59e26bcea0d48bacd4f263f1acdb5c4f5763473177ffffff
    let in27 = CE::<
        CI<27>
    > {}; // 0x13d0c369615f7bb0b2bdfa8fef85fa07122bde8d67dfc8fabd3581ad840ddd76
    let in28 = CE::<
        CI<28>
    > {}; // 0x18a0f4219f4fdff6fc2bf531eb331a053a35744cac285af5685d3f90eacf7a66
    let in29 = CE::<CI<29>> {}; // 0xc3a5e9c462a654779c3e050c9ca2a428908a81264e2b5a5bf22f67654883ae6
    let in30 = CE::<
        CI<30>
    > {}; // 0x2ce02aa5f9bf8cd65bdd2055c255cf9d9e08c1d9345582cc92fd973c74bd77f4
    let in31 = CE::<
        CI<31>
    > {}; // 0x17ded419ed7be4f97fac149bfaefbac11b155498de227b850aea3f23790405d6
    let in32 = CE::<
        CI<32>
    > {}; // 0x1bfe7b214c0294242fb81a8dccd8a9b4441d64f34150a79753fb0cd31cc99cc0
    let in33 = CE::<CI<33>> {}; // 0x697b9c523e0390ed15da0ec97a9b8346513297b9efaf0f0f1a228f0d5662fbd
    let in34 = CE::<CI<34>> {}; // 0x7a0e052f2b1c443b5186d6ac4c723b85d3f78a3182d2db0c413901c32b0c6fe
    let in35 = CE::<
        CI<35>
    > {}; // 0x1b76a37fba85f3cd5dc79824a3792597356c892c39c0d06b220500933945267f
    let in36 = CE::<CI<36>> {}; // 0xabf8b60be77d7306cbeee33576139d7f03a5e397d439ec7694aa2bf4c0c101
    let in37 = CE::<
        CI<37>
    > {}; // 0x1c938b097fd2247905924b2691fb5e5685558c04009201927eeb0a69546f1fd1
    let in38 = CE::<CI<38>> {}; // 0x4f1de41b3d1766fa9f30e6dec26094f0fdf31bf98ff2631380cab2baaa586de
    let in39 = CE::<
        CI<39>
    > {}; // 0x2429efd69b073ae23e8c6565b7b72e1b0e78c27f038f14e77cfd95a083f4c261
    let in40 = CE::<
        CI<40>
    > {}; // 0x28a411b634f09b8fb14b900e9507e9327600ecc7d8cf6ebab94d0cb3b2594c64
    let in41 = CE::<
        CI<41>
    > {}; // 0x23d5e999e1910a12feb0f6ef0cd21d04a44a9e08737f96e55fe3ed9d730c239f
    let in42 = CE::<
        CI<42>
    > {}; // 0x1465d351952f0c0588982b28b4a8aea95364059e272122f5e8257f43bbb36087
    let in43 = CE::<
        CI<43>
    > {}; // 0x16db366a59b1dd0b9fb1b2282a48633d3e2ddaea200280211f25041384282499
    let in44 = CE::<
        CI<44>
    > {}; // 0x28c36e1fee7fdbe60337d84bbcba34a53a41f1ee50449cdc780cfbfaa5cc3649

    // INPUT stack
    let (in45, in46, in47) = (CE::<CI<45>> {}, CE::<CI<46>> {}, CE::<CI<47>> {});
    let (in48, in49, in50) = (CE::<CI<48>> {}, CE::<CI<49>> {}, CE::<CI<50>> {});
    let (in51, in52, in53) = (CE::<CI<51>> {}, CE::<CI<52>> {}, CE::<CI<53>> {});
    let (in54, in55, in56) = (CE::<CI<54>> {}, CE::<CI<55>> {}, CE::<CI<56>> {});
    let (in57, in58, in59) = (CE::<CI<57>> {}, CE::<CI<58>> {}, CE::<CI<59>> {});
    let (in60, in61, in62) = (CE::<CI<60>> {}, CE::<CI<61>> {}, CE::<CI<62>> {});
    let (in63, in64, in65) = (CE::<CI<63>> {}, CE::<CI<64>> {}, CE::<CI<65>> {});
    let (in66, in67, in68) = (CE::<CI<66>> {}, CE::<CI<67>> {}, CE::<CI<68>> {});
    let (in69, in70, in71) = (CE::<CI<69>> {}, CE::<CI<70>> {}, CE::<CI<71>> {});
    let (in72, in73, in74) = (CE::<CI<72>> {}, CE::<CI<73>> {}, CE::<CI<74>> {});
    let (in75, in76) = (CE::<CI<75>> {}, CE::<CI<76>> {});
    let t0 = circuit_mul(in57, in57); // Compute z^2
    let t1 = circuit_mul(t0, in57); // Compute z^3
    let t2 = circuit_mul(t1, in57); // Compute z^4
    let t3 = circuit_mul(t2, in57); // Compute z^5
    let t4 = circuit_mul(t3, in57); // Compute z^6
    let t5 = circuit_mul(t4, in57); // Compute z^7
    let t6 = circuit_mul(t5, in57); // Compute z^8
    let t7 = circuit_mul(t6, in57); // Compute z^9
    let t8 = circuit_mul(t7, in57); // Compute z^10
    let t9 = circuit_mul(t8, in57); // Compute z^11
    let t10 = circuit_mul(in46, in57); // Eval C step coeff_1 * z^1
    let t11 = circuit_add(in45, t10); // Eval C step + (coeff_1 * z^1)
    let t12 = circuit_mul(in47, t0); // Eval C step coeff_2 * z^2
    let t13 = circuit_add(t11, t12); // Eval C step + (coeff_2 * z^2)
    let t14 = circuit_mul(in48, t1); // Eval C step coeff_3 * z^3
    let t15 = circuit_add(t13, t14); // Eval C step + (coeff_3 * z^3)
    let t16 = circuit_mul(in49, t2); // Eval C step coeff_4 * z^4
    let t17 = circuit_add(t15, t16); // Eval C step + (coeff_4 * z^4)
    let t18 = circuit_mul(in50, t3); // Eval C step coeff_5 * z^5
    let t19 = circuit_add(t17, t18); // Eval C step + (coeff_5 * z^5)
    let t20 = circuit_mul(in51, t4); // Eval C step coeff_6 * z^6
    let t21 = circuit_add(t19, t20); // Eval C step + (coeff_6 * z^6)
    let t22 = circuit_mul(in52, t5); // Eval C step coeff_7 * z^7
    let t23 = circuit_add(t21, t22); // Eval C step + (coeff_7 * z^7)
    let t24 = circuit_mul(in53, t6); // Eval C step coeff_8 * z^8
    let t25 = circuit_add(t23, t24); // Eval C step + (coeff_8 * z^8)
    let t26 = circuit_mul(in54, t7); // Eval C step coeff_9 * z^9
    let t27 = circuit_add(t25, t26); // Eval C step + (coeff_9 * z^9)
    let t28 = circuit_mul(in55, t8); // Eval C step coeff_10 * z^10
    let t29 = circuit_add(t27, t28); // Eval C step + (coeff_10 * z^10)
    let t30 = circuit_mul(in56, t9); // Eval C step coeff_11 * z^11
    let t31 = circuit_add(t29, t30); // Eval C step + (coeff_11 * z^11)
    let t32 = circuit_mul(in59, t0); // Eval sparse poly W step coeff_2 * z^2
    let t33 = circuit_add(in58, t32); // Eval sparse poly W step + coeff_2 * z^2
    let t34 = circuit_mul(in60, t2); // Eval sparse poly W step coeff_4 * z^4
    let t35 = circuit_add(t33, t34); // Eval sparse poly W step + coeff_4 * z^4
    let t36 = circuit_mul(in61, t4); // Eval sparse poly W step coeff_6 * z^6
    let t37 = circuit_add(t35, t36); // Eval sparse poly W step + coeff_6 * z^6
    let t38 = circuit_mul(in62, t6); // Eval sparse poly W step coeff_8 * z^8
    let t39 = circuit_add(t37, t38); // Eval sparse poly W step + coeff_8 * z^8
    let t40 = circuit_mul(in63, t8); // Eval sparse poly W step coeff_10 * z^10
    let t41 = circuit_add(t39, t40); // Eval sparse poly W step + coeff_10 * z^10
    let t42 = circuit_mul(in65, in57); // Eval C_inv step coeff_1 * z^1
    let t43 = circuit_add(in64, t42); // Eval C_inv step + (coeff_1 * z^1)
    let t44 = circuit_mul(in66, t0); // Eval C_inv step coeff_2 * z^2
    let t45 = circuit_add(t43, t44); // Eval C_inv step + (coeff_2 * z^2)
    let t46 = circuit_mul(in67, t1); // Eval C_inv step coeff_3 * z^3
    let t47 = circuit_add(t45, t46); // Eval C_inv step + (coeff_3 * z^3)
    let t48 = circuit_mul(in68, t2); // Eval C_inv step coeff_4 * z^4
    let t49 = circuit_add(t47, t48); // Eval C_inv step + (coeff_4 * z^4)
    let t50 = circuit_mul(in69, t3); // Eval C_inv step coeff_5 * z^5
    let t51 = circuit_add(t49, t50); // Eval C_inv step + (coeff_5 * z^5)
    let t52 = circuit_mul(in70, t4); // Eval C_inv step coeff_6 * z^6
    let t53 = circuit_add(t51, t52); // Eval C_inv step + (coeff_6 * z^6)
    let t54 = circuit_mul(in71, t5); // Eval C_inv step coeff_7 * z^7
    let t55 = circuit_add(t53, t54); // Eval C_inv step + (coeff_7 * z^7)
    let t56 = circuit_mul(in72, t6); // Eval C_inv step coeff_8 * z^8
    let t57 = circuit_add(t55, t56); // Eval C_inv step + (coeff_8 * z^8)
    let t58 = circuit_mul(in73, t7); // Eval C_inv step coeff_9 * z^9
    let t59 = circuit_add(t57, t58); // Eval C_inv step + (coeff_9 * z^9)
    let t60 = circuit_mul(in74, t8); // Eval C_inv step coeff_10 * z^10
    let t61 = circuit_add(t59, t60); // Eval C_inv step + (coeff_10 * z^10)
    let t62 = circuit_mul(in75, t9); // Eval C_inv step coeff_11 * z^11
    let t63 = circuit_add(t61, t62); // Eval C_inv step + (coeff_11 * z^11)
    let t64 = circuit_mul(t31, t63);
    let t65 = circuit_sub(t64, in0); // c_of_z * c_inv_of_z - 1
    let t66 = circuit_mul(t65, in76); // c_0 * (c_of_z * c_inv_of_z - 1)
    let t67 = circuit_mul(in70, in1);
    let t68 = circuit_add(in64, t67);
    let t69 = circuit_mul(in65, in2);
    let t70 = circuit_mul(in71, in3);
    let t71 = circuit_add(t69, t70);
    let t72 = circuit_mul(in66, in4);
    let t73 = circuit_mul(in72, in5);
    let t74 = circuit_add(t72, t73);
    let t75 = circuit_mul(in67, in6);
    let t76 = circuit_mul(in73, in7);
    let t77 = circuit_add(t75, t76);
    let t78 = circuit_mul(in68, in8);
    let t79 = circuit_mul(in74, in9);
    let t80 = circuit_add(t78, t79);
    let t81 = circuit_mul(in69, in10);
    let t82 = circuit_mul(in75, in11);
    let t83 = circuit_add(t81, t82);
    let t84 = circuit_mul(in70, in12);
    let t85 = circuit_mul(in65, in13);
    let t86 = circuit_mul(in71, in14);
    let t87 = circuit_add(t85, t86);
    let t88 = circuit_mul(in66, in15);
    let t89 = circuit_mul(in72, in16);
    let t90 = circuit_add(t88, t89);
    let t91 = circuit_mul(in67, in17);
    let t92 = circuit_mul(in73, in18);
    let t93 = circuit_add(t91, t92);
    let t94 = circuit_mul(in68, in19);
    let t95 = circuit_mul(in74, in20);
    let t96 = circuit_add(t94, t95);
    let t97 = circuit_mul(in69, in21);
    let t98 = circuit_mul(in75, in22);
    let t99 = circuit_add(t97, t98);
    let t100 = circuit_mul(in46, in23);
    let t101 = circuit_mul(in47, in24);
    let t102 = circuit_mul(in48, in12);
    let t103 = circuit_mul(in49, in25);
    let t104 = circuit_mul(in50, in26);
    let t105 = circuit_mul(in52, in23);
    let t106 = circuit_mul(in53, in24);
    let t107 = circuit_mul(in54, in12);
    let t108 = circuit_mul(in55, in25);
    let t109 = circuit_mul(in56, in26);
    let t110 = circuit_mul(in70, in1);
    let t111 = circuit_add(in64, t110);
    let t112 = circuit_mul(in65, in27);
    let t113 = circuit_mul(in71, in28);
    let t114 = circuit_add(t112, t113);
    let t115 = circuit_mul(in66, in29);
    let t116 = circuit_mul(in72, in30);
    let t117 = circuit_add(t115, t116);
    let t118 = circuit_mul(in67, in18);
    let t119 = circuit_mul(in73, in31);
    let t120 = circuit_add(t118, t119);
    let t121 = circuit_mul(in68, in32);
    let t122 = circuit_mul(in74, in33);
    let t123 = circuit_add(t121, t122);
    let t124 = circuit_mul(in69, in34);
    let t125 = circuit_mul(in75, in35);
    let t126 = circuit_add(t124, t125);
    let t127 = circuit_mul(in70, in12);
    let t128 = circuit_mul(in65, in36);
    let t129 = circuit_mul(in71, in37);
    let t130 = circuit_add(t128, t129);
    let t131 = circuit_mul(in66, in38);
    let t132 = circuit_mul(in72, in39);
    let t133 = circuit_add(t131, t132);
    let t134 = circuit_mul(in67, in40);
    let t135 = circuit_mul(in73, in6);
    let t136 = circuit_add(t134, t135);
    let t137 = circuit_mul(in68, in41);
    let t138 = circuit_mul(in74, in42);
    let t139 = circuit_add(t137, t138);
    let t140 = circuit_mul(in69, in43);
    let t141 = circuit_mul(in75, in44);
    let t142 = circuit_add(t140, t141);
    let t143 = circuit_mul(t71, in57); // Eval C_inv_frob_1 step coeff_1 * z^1
    let t144 = circuit_add(t68, t143); // Eval C_inv_frob_1 step + (coeff_1 * z^1)
    let t145 = circuit_mul(t74, t0); // Eval C_inv_frob_1 step coeff_2 * z^2
    let t146 = circuit_add(t144, t145); // Eval C_inv_frob_1 step + (coeff_2 * z^2)
    let t147 = circuit_mul(t77, t1); // Eval C_inv_frob_1 step coeff_3 * z^3
    let t148 = circuit_add(t146, t147); // Eval C_inv_frob_1 step + (coeff_3 * z^3)
    let t149 = circuit_mul(t80, t2); // Eval C_inv_frob_1 step coeff_4 * z^4
    let t150 = circuit_add(t148, t149); // Eval C_inv_frob_1 step + (coeff_4 * z^4)
    let t151 = circuit_mul(t83, t3); // Eval C_inv_frob_1 step coeff_5 * z^5
    let t152 = circuit_add(t150, t151); // Eval C_inv_frob_1 step + (coeff_5 * z^5)
    let t153 = circuit_mul(t84, t4); // Eval C_inv_frob_1 step coeff_6 * z^6
    let t154 = circuit_add(t152, t153); // Eval C_inv_frob_1 step + (coeff_6 * z^6)
    let t155 = circuit_mul(t87, t5); // Eval C_inv_frob_1 step coeff_7 * z^7
    let t156 = circuit_add(t154, t155); // Eval C_inv_frob_1 step + (coeff_7 * z^7)
    let t157 = circuit_mul(t90, t6); // Eval C_inv_frob_1 step coeff_8 * z^8
    let t158 = circuit_add(t156, t157); // Eval C_inv_frob_1 step + (coeff_8 * z^8)
    let t159 = circuit_mul(t93, t7); // Eval C_inv_frob_1 step coeff_9 * z^9
    let t160 = circuit_add(t158, t159); // Eval C_inv_frob_1 step + (coeff_9 * z^9)
    let t161 = circuit_mul(t96, t8); // Eval C_inv_frob_1 step coeff_10 * z^10
    let t162 = circuit_add(t160, t161); // Eval C_inv_frob_1 step + (coeff_10 * z^10)
    let t163 = circuit_mul(t99, t9); // Eval C_inv_frob_1 step coeff_11 * z^11
    let t164 = circuit_add(t162, t163); // Eval C_inv_frob_1 step + (coeff_11 * z^11)
    let t165 = circuit_mul(t100, in57); // Eval C_frob_2 step coeff_1 * z^1
    let t166 = circuit_add(in45, t165); // Eval C_frob_2 step + (coeff_1 * z^1)
    let t167 = circuit_mul(t101, t0); // Eval C_frob_2 step coeff_2 * z^2
    let t168 = circuit_add(t166, t167); // Eval C_frob_2 step + (coeff_2 * z^2)
    let t169 = circuit_mul(t102, t1); // Eval C_frob_2 step coeff_3 * z^3
    let t170 = circuit_add(t168, t169); // Eval C_frob_2 step + (coeff_3 * z^3)
    let t171 = circuit_mul(t103, t2); // Eval C_frob_2 step coeff_4 * z^4
    let t172 = circuit_add(t170, t171); // Eval C_frob_2 step + (coeff_4 * z^4)
    let t173 = circuit_mul(t104, t3); // Eval C_frob_2 step coeff_5 * z^5
    let t174 = circuit_add(t172, t173); // Eval C_frob_2 step + (coeff_5 * z^5)
    let t175 = circuit_mul(in51, t4); // Eval C_frob_2 step coeff_6 * z^6
    let t176 = circuit_add(t174, t175); // Eval C_frob_2 step + (coeff_6 * z^6)
    let t177 = circuit_mul(t105, t5); // Eval C_frob_2 step coeff_7 * z^7
    let t178 = circuit_add(t176, t177); // Eval C_frob_2 step + (coeff_7 * z^7)
    let t179 = circuit_mul(t106, t6); // Eval C_frob_2 step coeff_8 * z^8
    let t180 = circuit_add(t178, t179); // Eval C_frob_2 step + (coeff_8 * z^8)
    let t181 = circuit_mul(t107, t7); // Eval C_frob_2 step coeff_9 * z^9
    let t182 = circuit_add(t180, t181); // Eval C_frob_2 step + (coeff_9 * z^9)
    let t183 = circuit_mul(t108, t8); // Eval C_frob_2 step coeff_10 * z^10
    let t184 = circuit_add(t182, t183); // Eval C_frob_2 step + (coeff_10 * z^10)
    let t185 = circuit_mul(t109, t9); // Eval C_frob_2 step coeff_11 * z^11
    let t186 = circuit_add(t184, t185); // Eval C_frob_2 step + (coeff_11 * z^11)
    let t187 = circuit_mul(t114, in57); // Eval C_inv_frob_3 step coeff_1 * z^1
    let t188 = circuit_add(t111, t187); // Eval C_inv_frob_3 step + (coeff_1 * z^1)
    let t189 = circuit_mul(t117, t0); // Eval C_inv_frob_3 step coeff_2 * z^2
    let t190 = circuit_add(t188, t189); // Eval C_inv_frob_3 step + (coeff_2 * z^2)
    let t191 = circuit_mul(t120, t1); // Eval C_inv_frob_3 step coeff_3 * z^3
    let t192 = circuit_add(t190, t191); // Eval C_inv_frob_3 step + (coeff_3 * z^3)
    let t193 = circuit_mul(t123, t2); // Eval C_inv_frob_3 step coeff_4 * z^4
    let t194 = circuit_add(t192, t193); // Eval C_inv_frob_3 step + (coeff_4 * z^4)
    let t195 = circuit_mul(t126, t3); // Eval C_inv_frob_3 step coeff_5 * z^5
    let t196 = circuit_add(t194, t195); // Eval C_inv_frob_3 step + (coeff_5 * z^5)
    let t197 = circuit_mul(t127, t4); // Eval C_inv_frob_3 step coeff_6 * z^6
    let t198 = circuit_add(t196, t197); // Eval C_inv_frob_3 step + (coeff_6 * z^6)
    let t199 = circuit_mul(t130, t5); // Eval C_inv_frob_3 step coeff_7 * z^7
    let t200 = circuit_add(t198, t199); // Eval C_inv_frob_3 step + (coeff_7 * z^7)
    let t201 = circuit_mul(t133, t6); // Eval C_inv_frob_3 step coeff_8 * z^8
    let t202 = circuit_add(t200, t201); // Eval C_inv_frob_3 step + (coeff_8 * z^8)
    let t203 = circuit_mul(t136, t7); // Eval C_inv_frob_3 step coeff_9 * z^9
    let t204 = circuit_add(t202, t203); // Eval C_inv_frob_3 step + (coeff_9 * z^9)
    let t205 = circuit_mul(t139, t8); // Eval C_inv_frob_3 step coeff_10 * z^10
    let t206 = circuit_add(t204, t205); // Eval C_inv_frob_3 step + (coeff_10 * z^10)
    let t207 = circuit_mul(t142, t9); // Eval C_inv_frob_3 step coeff_11 * z^11
    let t208 = circuit_add(t206, t207); // Eval C_inv_frob_3 step + (coeff_11 * z^11)

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t31, t41, t63, t66, t164, t186, t208,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x1, 0x0, 0x0, 0x0]); // in0
    circuit_inputs = circuit_inputs.next([0x12, 0x0, 0x0, 0x0]); // in1
    circuit_inputs = circuit_inputs
        .next(
            [0xfde6a43f5daa971f3fa65955, 0x1b2522ec5eb28ded6895e1cd, 0x1d8c8daef3eee1e8, 0x0]
        ); // in2
    circuit_inputs = circuit_inputs
        .next(
            [0x42b29c567e9c385ce480a71a, 0x4e34e2ac06ead4000d14d1e2, 0x217e400dc9351e77, 0x0]
        ); // in3
    circuit_inputs = circuit_inputs
        .next(
            [0xfd28d102c0d147b2f4d521a7, 0x8481d22c6934ce844d72f250, 0x242b719062f6737b, 0x0]
        ); // in4
    circuit_inputs = circuit_inputs
        .next(
            [0x43ac198484b8d9094aa82536, 0x1b9c22d81246ffc2e794e176, 0x359809094bd5c8e, 0x0]
        ); // in5
    circuit_inputs = circuit_inputs
        .next(
            [0x6df7b44cbb259ef7cb58d5ed, 0xdd4ef1e69a0c1f0dd2949fa, 0x21436d48fcb50cc6, 0x0]
        ); // in6
    circuit_inputs = circuit_inputs
        .next(
            [0x8a4f4f0831364cf35f78f771, 0x38a4311a86919d9c7c6c15f8, 0x18857a58f3b5bb30, 0x0]
        ); // in7
    circuit_inputs = circuit_inputs
        .next(
            [0x6fc008e7d6998c82f7fc048b, 0x62b7adefd44038ab3c0bbad9, 0x2c84bbad27c36715, 0x0]
        ); // in8
    circuit_inputs = circuit_inputs
        .next(
            [0xa8697e0c9c36d8ca3339a7b5, 0x6d1eab6fcd18b99ad4afd096, 0xc33b1c70e4fd11b, 0x0]
        ); // in9
    circuit_inputs = circuit_inputs
        .next(
            [0x5371c546d428780a6e3dcfa8, 0x13fe08bea73305ff6bdac77c, 0x1b007294a55accce, 0x0]
        ); // in10
    circuit_inputs = circuit_inputs
        .next(
            [0x4f501fe811493d72543a3977, 0xefe88dd8e6965b3adae92c97, 0x215d42e7ac7bd17c, 0x0]
        ); // in11
    circuit_inputs = circuit_inputs
        .next(
            [0x6871ca8d3c208c16d87cfd46, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0]
        ); // in12
    circuit_inputs = circuit_inputs
        .next(
            [0x8eeec7e5ca5cf05f80f362ac, 0xa6327cfe12150b8e74799277, 0x246996f3b4fae7e6, 0x0]
        ); // in13
    circuit_inputs = circuit_inputs
        .next(
            [0x6a8b264dde75f4f798d6a3f2, 0x9d2b22ca22ceca702eeb88c3, 0x12d7c0c3ed42be41, 0x0]
        ); // in14
    circuit_inputs = circuit_inputs
        .next(
            [0xb7c9dce1665d51c640fcba2, 0x4ba4cc8bd75a079432ae2a1d, 0x16c9e55061ebae20, 0x0]
        ); // in15
    circuit_inputs = circuit_inputs
        .next(
            [0x6b48f98a7b4f4463e3a7dba0, 0x33ce738a184c89d94a0e7840, 0xc38dce27e3b2cae, 0x0]
        ); // in16
    circuit_inputs = circuit_inputs
        .next(
            [0x8fa25bd282d37f632623b0e3, 0x704b5a7ec796f2b21807dc9, 0x7c03cbcac41049a, 0x0]
        ); // in17
    circuit_inputs = circuit_inputs
        .next(
            [0xfa7a164080faed1f0d24275a, 0xaa7b569817e0966cba582096, 0xf20e129e47c9363, 0x0]
        ); // in18
    circuit_inputs = circuit_inputs
        .next(
            [0x1bdec763c13b4711cd2b8126, 0x9f3a80b03b0b1c923685d2ea, 0x2c145edbe7fd8aee, 0x0]
        ); // in19
    circuit_inputs = circuit_inputs
        .next(
            [0xf8b1c1a56586ff93e080f8bc, 0x559897c6ad411fb25b75afb7, 0x3df92c5b96e3914, 0x0]
        ); // in20
    circuit_inputs = circuit_inputs
        .next(
            [0x678e2ac024c6b8ee6e0c2c4b, 0xa27fb246c7729f7db080cb99, 0x12acf2ca76fd0675, 0x0]
        ); // in21
    circuit_inputs = circuit_inputs
        .next(
            [0x1500054667f8140c6a3f2d9f, 0xa4523cf7da4e525e2ba6a315, 0x1563dbde3bd6d35b, 0x0]
        ); // in22
    circuit_inputs = circuit_inputs
        .next(
            [0xbb966e3de4bd44e5607cfd49, 0x5e6dd9e7e0acccb0c28f069f, 0x30644e72e131a029, 0x0]
        ); // in23
    circuit_inputs = circuit_inputs
        .next(
            [0xbb966e3de4bd44e5607cfd48, 0x5e6dd9e7e0acccb0c28f069f, 0x30644e72e131a029, 0x0]
        ); // in24
    circuit_inputs = circuit_inputs
        .next([0xacdb5c4f5763473177fffffe, 0x59e26bcea0d48bacd4f263f1, 0x0, 0x0]); // in25
    circuit_inputs = circuit_inputs
        .next([0xacdb5c4f5763473177ffffff, 0x59e26bcea0d48bacd4f263f1, 0x0, 0x0]); // in26
    circuit_inputs = circuit_inputs
        .next(
            [0x67dfc8fabd3581ad840ddd76, 0xb2bdfa8fef85fa07122bde8d, 0x13d0c369615f7bb0, 0x0]
        ); // in27
    circuit_inputs = circuit_inputs
        .next(
            [0xac285af5685d3f90eacf7a66, 0xfc2bf531eb331a053a35744c, 0x18a0f4219f4fdff6, 0x0]
        ); // in28
    circuit_inputs = circuit_inputs
        .next(
            [0x64e2b5a5bf22f67654883ae6, 0x79c3e050c9ca2a428908a812, 0xc3a5e9c462a6547, 0x0]
        ); // in29
    circuit_inputs = circuit_inputs
        .next(
            [0x345582cc92fd973c74bd77f4, 0x5bdd2055c255cf9d9e08c1d9, 0x2ce02aa5f9bf8cd6, 0x0]
        ); // in30
    circuit_inputs = circuit_inputs
        .next(
            [0xde227b850aea3f23790405d6, 0x7fac149bfaefbac11b155498, 0x17ded419ed7be4f9, 0x0]
        ); // in31
    circuit_inputs = circuit_inputs
        .next(
            [0x4150a79753fb0cd31cc99cc0, 0x2fb81a8dccd8a9b4441d64f3, 0x1bfe7b214c029424, 0x0]
        ); // in32
    circuit_inputs = circuit_inputs
        .next(
            [0x9efaf0f0f1a228f0d5662fbd, 0xd15da0ec97a9b8346513297b, 0x697b9c523e0390e, 0x0]
        ); // in33
    circuit_inputs = circuit_inputs
        .next(
            [0x182d2db0c413901c32b0c6fe, 0xb5186d6ac4c723b85d3f78a3, 0x7a0e052f2b1c443, 0x0]
        ); // in34
    circuit_inputs = circuit_inputs
        .next(
            [0x39c0d06b220500933945267f, 0x5dc79824a3792597356c892c, 0x1b76a37fba85f3cd, 0x0]
        ); // in35
    circuit_inputs = circuit_inputs
        .next(
            [0x97d439ec7694aa2bf4c0c101, 0x6cbeee33576139d7f03a5e3, 0xabf8b60be77d73, 0x0]
        ); // in36
    circuit_inputs = circuit_inputs
        .next(
            [0x9201927eeb0a69546f1fd1, 0x5924b2691fb5e5685558c04, 0x1c938b097fd22479, 0x0]
        ); // in37
    circuit_inputs = circuit_inputs
        .next(
            [0x98ff2631380cab2baaa586de, 0xa9f30e6dec26094f0fdf31bf, 0x4f1de41b3d1766f, 0x0]
        ); // in38
    circuit_inputs = circuit_inputs
        .next(
            [0x38f14e77cfd95a083f4c261, 0x3e8c6565b7b72e1b0e78c27f, 0x2429efd69b073ae2, 0x0]
        ); // in39
    circuit_inputs = circuit_inputs
        .next(
            [0xd8cf6ebab94d0cb3b2594c64, 0xb14b900e9507e9327600ecc7, 0x28a411b634f09b8f, 0x0]
        ); // in40
    circuit_inputs = circuit_inputs
        .next(
            [0x737f96e55fe3ed9d730c239f, 0xfeb0f6ef0cd21d04a44a9e08, 0x23d5e999e1910a12, 0x0]
        ); // in41
    circuit_inputs = circuit_inputs
        .next(
            [0x272122f5e8257f43bbb36087, 0x88982b28b4a8aea95364059e, 0x1465d351952f0c05, 0x0]
        ); // in42
    circuit_inputs = circuit_inputs
        .next(
            [0x200280211f25041384282499, 0x9fb1b2282a48633d3e2ddaea, 0x16db366a59b1dd0b, 0x0]
        ); // in43
    circuit_inputs = circuit_inputs
        .next(
            [0x50449cdc780cfbfaa5cc3649, 0x337d84bbcba34a53a41f1ee, 0x28c36e1fee7fdbe6, 0x0]
        ); // in44
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(lambda_root.w0); // in45
    circuit_inputs = circuit_inputs.next(lambda_root.w1); // in46
    circuit_inputs = circuit_inputs.next(lambda_root.w2); // in47
    circuit_inputs = circuit_inputs.next(lambda_root.w3); // in48
    circuit_inputs = circuit_inputs.next(lambda_root.w4); // in49
    circuit_inputs = circuit_inputs.next(lambda_root.w5); // in50
    circuit_inputs = circuit_inputs.next(lambda_root.w6); // in51
    circuit_inputs = circuit_inputs.next(lambda_root.w7); // in52
    circuit_inputs = circuit_inputs.next(lambda_root.w8); // in53
    circuit_inputs = circuit_inputs.next(lambda_root.w9); // in54
    circuit_inputs = circuit_inputs.next(lambda_root.w10); // in55
    circuit_inputs = circuit_inputs.next(lambda_root.w11); // in56
    circuit_inputs = circuit_inputs.next(z); // in57
    circuit_inputs = circuit_inputs.next(scaling_factor.w0); // in58
    circuit_inputs = circuit_inputs.next(scaling_factor.w2); // in59
    circuit_inputs = circuit_inputs.next(scaling_factor.w4); // in60
    circuit_inputs = circuit_inputs.next(scaling_factor.w6); // in61
    circuit_inputs = circuit_inputs.next(scaling_factor.w8); // in62
    circuit_inputs = circuit_inputs.next(scaling_factor.w10); // in63
    circuit_inputs = circuit_inputs.next(c_inv.w0); // in64
    circuit_inputs = circuit_inputs.next(c_inv.w1); // in65
    circuit_inputs = circuit_inputs.next(c_inv.w2); // in66
    circuit_inputs = circuit_inputs.next(c_inv.w3); // in67
    circuit_inputs = circuit_inputs.next(c_inv.w4); // in68
    circuit_inputs = circuit_inputs.next(c_inv.w5); // in69
    circuit_inputs = circuit_inputs.next(c_inv.w6); // in70
    circuit_inputs = circuit_inputs.next(c_inv.w7); // in71
    circuit_inputs = circuit_inputs.next(c_inv.w8); // in72
    circuit_inputs = circuit_inputs.next(c_inv.w9); // in73
    circuit_inputs = circuit_inputs.next(c_inv.w10); // in74
    circuit_inputs = circuit_inputs.next(c_inv.w11); // in75
    circuit_inputs = circuit_inputs.next(c_0); // in76

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let c_of_z: u384 = outputs.get_output(t31);
    let scaling_factor_of_z: u384 = outputs.get_output(t41);
    let c_inv_of_z: u384 = outputs.get_output(t63);
    let lhs: u384 = outputs.get_output(t66);
    let c_inv_frob_1_of_z: u384 = outputs.get_output(t164);
    let c_frob_2_of_z: u384 = outputs.get_output(t186);
    let c_inv_frob_3_of_z: u384 = outputs.get_output(t208);
    return (
        c_of_z,
        scaling_factor_of_z,
        c_inv_of_z,
        lhs,
        c_inv_frob_1_of_z,
        c_frob_2_of_z,
        c_inv_frob_3_of_z
    );
}
fn run_BN254_MP_CHECK_PREPARE_PAIRS_2P_circuit(
    p_0: G1Point, Qy0_0: u384, Qy1_0: u384, p_1: G1Point, Qy0_1: u384, Qy1_1: u384
) -> (BNProcessedPair, BNProcessedPair) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x0

    // INPUT stack
    let (in1, in2, in3) = (CE::<CI<1>> {}, CE::<CI<2>> {}, CE::<CI<3>> {});
    let (in4, in5, in6) = (CE::<CI<4>> {}, CE::<CI<5>> {}, CE::<CI<6>> {});
    let (in7, in8) = (CE::<CI<7>> {}, CE::<CI<8>> {});
    let t0 = circuit_inverse(in2);
    let t1 = circuit_mul(in1, t0);
    let t2 = circuit_sub(in0, t1);
    let t3 = circuit_sub(in0, in3);
    let t4 = circuit_sub(in0, in4);
    let t5 = circuit_inverse(in6);
    let t6 = circuit_mul(in5, t5);
    let t7 = circuit_sub(in0, t6);
    let t8 = circuit_sub(in0, in7);
    let t9 = circuit_sub(in0, in8);

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t0, t2, t3, t4, t5, t7, t8, t9,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in0
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(p_0.x); // in1
    circuit_inputs = circuit_inputs.next(p_0.y); // in2
    circuit_inputs = circuit_inputs.next(Qy0_0); // in3
    circuit_inputs = circuit_inputs.next(Qy1_0); // in4
    circuit_inputs = circuit_inputs.next(p_1.x); // in5
    circuit_inputs = circuit_inputs.next(p_1.y); // in6
    circuit_inputs = circuit_inputs.next(Qy0_1); // in7
    circuit_inputs = circuit_inputs.next(Qy1_1); // in8

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let p_0: BNProcessedPair = BNProcessedPair {
        yInv: outputs.get_output(t0),
        xNegOverY: outputs.get_output(t2),
        QyNeg0: outputs.get_output(t3),
        QyNeg1: outputs.get_output(t4)
    };
    let p_1: BNProcessedPair = BNProcessedPair {
        yInv: outputs.get_output(t5),
        xNegOverY: outputs.get_output(t7),
        QyNeg0: outputs.get_output(t8),
        QyNeg1: outputs.get_output(t9)
    };
    return (p_0, p_1);
}
fn run_BN254_MP_CHECK_PREPARE_PAIRS_3P_circuit(
    p_0: G1Point,
    Qy0_0: u384,
    Qy1_0: u384,
    p_1: G1Point,
    Qy0_1: u384,
    Qy1_1: u384,
    p_2: G1Point,
    Qy0_2: u384,
    Qy1_2: u384
) -> (BNProcessedPair, BNProcessedPair, BNProcessedPair) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x0

    // INPUT stack
    let (in1, in2, in3) = (CE::<CI<1>> {}, CE::<CI<2>> {}, CE::<CI<3>> {});
    let (in4, in5, in6) = (CE::<CI<4>> {}, CE::<CI<5>> {}, CE::<CI<6>> {});
    let (in7, in8, in9) = (CE::<CI<7>> {}, CE::<CI<8>> {}, CE::<CI<9>> {});
    let (in10, in11, in12) = (CE::<CI<10>> {}, CE::<CI<11>> {}, CE::<CI<12>> {});
    let t0 = circuit_inverse(in2);
    let t1 = circuit_mul(in1, t0);
    let t2 = circuit_sub(in0, t1);
    let t3 = circuit_sub(in0, in3);
    let t4 = circuit_sub(in0, in4);
    let t5 = circuit_inverse(in6);
    let t6 = circuit_mul(in5, t5);
    let t7 = circuit_sub(in0, t6);
    let t8 = circuit_sub(in0, in7);
    let t9 = circuit_sub(in0, in8);
    let t10 = circuit_inverse(in10);
    let t11 = circuit_mul(in9, t10);
    let t12 = circuit_sub(in0, t11);
    let t13 = circuit_sub(in0, in11);
    let t14 = circuit_sub(in0, in12);

    let modulus = TryInto::<
        _, CircuitModulus
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap(); // BN254 prime field modulus

    let mut circuit_inputs = (t0, t2, t3, t4, t5, t7, t8, t9, t10, t12, t13, t14,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next([0x0, 0x0, 0x0, 0x0]); // in0
    // Fill inputs:
    circuit_inputs = circuit_inputs.next(p_0.x); // in1
    circuit_inputs = circuit_inputs.next(p_0.y); // in2
    circuit_inputs = circuit_inputs.next(Qy0_0); // in3
    circuit_inputs = circuit_inputs.next(Qy1_0); // in4
    circuit_inputs = circuit_inputs.next(p_1.x); // in5
    circuit_inputs = circuit_inputs.next(p_1.y); // in6
    circuit_inputs = circuit_inputs.next(Qy0_1); // in7
    circuit_inputs = circuit_inputs.next(Qy1_1); // in8
    circuit_inputs = circuit_inputs.next(p_2.x); // in9
    circuit_inputs = circuit_inputs.next(p_2.y); // in10
    circuit_inputs = circuit_inputs.next(Qy0_2); // in11
    circuit_inputs = circuit_inputs.next(Qy1_2); // in12

    let outputs = match circuit_inputs.done().eval(modulus) {
        Result::Ok(outputs) => { outputs },
        Result::Err(_) => { panic!("Expected success") }
    };
    let p_0: BNProcessedPair = BNProcessedPair {
        yInv: outputs.get_output(t0),
        xNegOverY: outputs.get_output(t2),
        QyNeg0: outputs.get_output(t3),
        QyNeg1: outputs.get_output(t4)
    };
    let p_1: BNProcessedPair = BNProcessedPair {
        yInv: outputs.get_output(t5),
        xNegOverY: outputs.get_output(t7),
        QyNeg0: outputs.get_output(t8),
        QyNeg1: outputs.get_output(t9)
    };
    let p_2: BNProcessedPair = BNProcessedPair {
        yInv: outputs.get_output(t10),
        xNegOverY: outputs.get_output(t12),
        QyNeg0: outputs.get_output(t13),
        QyNeg1: outputs.get_output(t14)
    };
    return (p_0, p_1, p_2);
}

#[cfg(test)]
mod tests {
    use core::traits::TryInto;

    use core::circuit::{
        RangeCheck96, AddMod, MulMod, u96, CircuitElement, CircuitInput, circuit_add, circuit_sub,
        circuit_mul, circuit_inverse, EvalCircuitResult, EvalCircuitTrait, u384,
        CircuitOutputsTrait, CircuitModulus, AddInputResultTrait, CircuitInputs
    };
    use garaga::definitions::{
        G1Point, G2Point, E12D, E12DMulQuotient, G1G2Pair, BNProcessedPair, BLSProcessedPair,
        MillerLoopResultScalingFactor, G2Line
    };
    use garaga::ec_ops::{SlopeInterceptOutput, FunctionFeltEvaluations, FunctionFelt};

    use super::{
        run_BLS12_381_MP_CHECK_BIT00_2P_2F_circuit, run_BLS12_381_MP_CHECK_BIT00_3P_2F_circuit,
        run_BLS12_381_MP_CHECK_BIT0_2P_2F_circuit, run_BLS12_381_MP_CHECK_BIT0_3P_2F_circuit,
        run_BLS12_381_MP_CHECK_BIT1_2P_2F_circuit, run_BLS12_381_MP_CHECK_BIT1_3P_2F_circuit,
        run_BLS12_381_MP_CHECK_FINALIZE_BLS_2P_circuit,
        run_BLS12_381_MP_CHECK_FINALIZE_BLS_3P_circuit,
        run_BLS12_381_MP_CHECK_INIT_BIT_2P_2F_circuit,
        run_BLS12_381_MP_CHECK_INIT_BIT_3P_2F_circuit,
        run_BLS12_381_MP_CHECK_PREPARE_LAMBDA_ROOT_circuit,
        run_BLS12_381_MP_CHECK_PREPARE_PAIRS_2P_circuit,
        run_BLS12_381_MP_CHECK_PREPARE_PAIRS_3P_circuit, run_BN254_MP_CHECK_BIT00_2P_2F_circuit,
        run_BN254_MP_CHECK_BIT00_3P_2F_circuit, run_BN254_MP_CHECK_BIT0_2P_2F_circuit,
        run_BN254_MP_CHECK_BIT0_3P_2F_circuit, run_BN254_MP_CHECK_BIT1_2P_2F_circuit,
        run_BN254_MP_CHECK_BIT1_3P_2F_circuit, run_BN254_MP_CHECK_FINALIZE_BN_2P_2F_circuit,
        run_BN254_MP_CHECK_FINALIZE_BN_3P_2F_circuit, run_BN254_MP_CHECK_INIT_BIT_2P_2F_circuit,
        run_BN254_MP_CHECK_INIT_BIT_3P_2F_circuit, run_BN254_MP_CHECK_PREPARE_LAMBDA_ROOT_circuit,
        run_BN254_MP_CHECK_PREPARE_PAIRS_2P_circuit, run_BN254_MP_CHECK_PREPARE_PAIRS_3P_circuit
    };
}
