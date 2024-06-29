from starkware.cairo.common.registers import get_fp_and_pc, get_label_location
from modulo_circuit import (
    ExtensionFieldModuloCircuit,
    ModuloCircuit,
    get_void_modulo_circuit,
    get_void_extension_field_modulo_circuit,
)
from definitions import bn, bls

func get_FP12_MUL_circuit(curve_id: felt) -> (circuit: ExtensionFieldModuloCircuit*) {
    if (curve_id == bn.CURVE_ID) {
        return get_BN254_FP12_MUL_circuit();
    }
    if (curve_id == bls.CURVE_ID) {
        return get_BLS12_381_FP12_MUL_circuit();
    }
    return get_void_extension_field_modulo_circuit();
}
func get_BLS12_381_FP12_MUL_circuit() -> (circuit: ExtensionFieldModuloCircuit*) {
    alloc_locals;
    let (__fp__, _) = get_fp_and_pc();
    let (constants_ptr: felt*) = get_label_location(constants_ptr_loc);
    let (add_offsets_ptr: felt*) = get_label_location(add_offsets_ptr_loc);
    let (mul_offsets_ptr: felt*) = get_label_location(mul_offsets_ptr_loc);
    let (output_offsets_ptr: felt*) = get_label_location(output_offsets_ptr_loc);
    let (poseidon_indexes_ptr: felt*) = get_label_location(poseidon_indexes_ptr_loc);
    let constants_ptr_len = 4;
    let input_len = 96;
    let commitments_len = 92;
    let witnesses_len = 0;
    let output_len = 48;
    let continuous_output = 1;
    let add_mod_n = 47;
    let mul_mod_n = 71;
    let n_assert_eq = 1;
    let N_Euclidean_equations = 1;
    let name = 'fp12_mul';
    let curve_id = 1;
    local circuit: ExtensionFieldModuloCircuit = ExtensionFieldModuloCircuit(
        constants_ptr,
        add_offsets_ptr,
        mul_offsets_ptr,
        output_offsets_ptr,
        poseidon_indexes_ptr,
        constants_ptr_len,
        input_len,
        commitments_len,
        witnesses_len,
        output_len,
        continuous_output,
        add_mod_n,
        mul_mod_n,
        n_assert_eq,
        N_Euclidean_equations,
        name,
        curve_id,
    );
    return (&circuit,);

    constants_ptr_loc:
    dw 2;
    dw 0;
    dw 0;
    dw 0;
    dw 54880396502181392957329877673;
    dw 31935979117156477062286671870;
    dw 20826981314825584179608359615;
    dw 8047903782086192180586325942;
    dw 1;
    dw 0;
    dw 0;
    dw 0;
    dw 0;
    dw 0;
    dw 0;
    dw 0;

    add_offsets_ptr_loc:
    dw 16;
    dw 258;
    dw 262;
    dw 262;
    dw 266;
    dw 270;
    dw 270;
    dw 274;
    dw 278;
    dw 278;
    dw 282;
    dw 286;
    dw 286;
    dw 290;
    dw 294;
    dw 294;
    dw 298;
    dw 302;
    dw 302;
    dw 306;
    dw 310;
    dw 310;
    dw 314;
    dw 318;
    dw 318;
    dw 322;
    dw 326;
    dw 326;
    dw 330;
    dw 334;
    dw 334;
    dw 338;
    dw 342;
    dw 64;
    dw 346;
    dw 350;
    dw 350;
    dw 354;
    dw 358;
    dw 358;
    dw 362;
    dw 366;
    dw 366;
    dw 370;
    dw 374;
    dw 374;
    dw 378;
    dw 382;
    dw 382;
    dw 386;
    dw 390;
    dw 390;
    dw 394;
    dw 398;
    dw 398;
    dw 402;
    dw 406;
    dw 406;
    dw 410;
    dw 414;
    dw 414;
    dw 418;
    dw 422;
    dw 422;
    dw 426;
    dw 430;
    dw 160;
    dw 490;
    dw 494;
    dw 494;
    dw 498;
    dw 502;
    dw 502;
    dw 506;
    dw 510;
    dw 510;
    dw 514;
    dw 518;
    dw 518;
    dw 522;
    dw 526;
    dw 526;
    dw 530;
    dw 534;
    dw 534;
    dw 538;
    dw 542;
    dw 542;
    dw 546;
    dw 550;
    dw 550;
    dw 554;
    dw 558;
    dw 558;
    dw 562;
    dw 566;
    dw 0;
    dw 570;
    dw 574;
    dw 574;
    dw 578;
    dw 582;
    dw 442;
    dw 586;
    dw 590;
    dw 590;
    dw 594;
    dw 598;
    dw 598;
    dw 602;
    dw 606;
    dw 606;
    dw 610;
    dw 614;
    dw 614;
    dw 618;
    dw 622;
    dw 622;
    dw 626;
    dw 630;
    dw 630;
    dw 634;
    dw 638;
    dw 638;
    dw 642;
    dw 646;
    dw 646;
    dw 650;
    dw 654;
    dw 654;
    dw 658;
    dw 662;
    dw 662;
    dw 666;
    dw 670;
    dw 674;
    dw 670;
    dw 678;
    dw 12;
    dw 678;
    dw 438;
    dw 16;
    dw 258;
    dw 262;

    mul_offsets_ptr_loc:
    dw 204;
    dw 204;
    dw 214;
    dw 214;
    dw 204;
    dw 218;
    dw 218;
    dw 204;
    dw 222;
    dw 222;
    dw 204;
    dw 226;
    dw 226;
    dw 204;
    dw 230;
    dw 230;
    dw 204;
    dw 234;
    dw 234;
    dw 204;
    dw 238;
    dw 238;
    dw 204;
    dw 242;
    dw 242;
    dw 204;
    dw 246;
    dw 246;
    dw 204;
    dw 250;
    dw 250;
    dw 204;
    dw 254;
    dw 20;
    dw 204;
    dw 258;
    dw 24;
    dw 214;
    dw 266;
    dw 28;
    dw 218;
    dw 274;
    dw 32;
    dw 222;
    dw 282;
    dw 36;
    dw 226;
    dw 290;
    dw 40;
    dw 230;
    dw 298;
    dw 44;
    dw 234;
    dw 306;
    dw 48;
    dw 238;
    dw 314;
    dw 52;
    dw 242;
    dw 322;
    dw 56;
    dw 246;
    dw 330;
    dw 60;
    dw 250;
    dw 338;
    dw 68;
    dw 204;
    dw 346;
    dw 72;
    dw 214;
    dw 354;
    dw 76;
    dw 218;
    dw 362;
    dw 80;
    dw 222;
    dw 370;
    dw 84;
    dw 226;
    dw 378;
    dw 88;
    dw 230;
    dw 386;
    dw 92;
    dw 234;
    dw 394;
    dw 96;
    dw 238;
    dw 402;
    dw 100;
    dw 242;
    dw 410;
    dw 104;
    dw 246;
    dw 418;
    dw 108;
    dw 250;
    dw 426;
    dw 342;
    dw 430;
    dw 434;
    dw 209;
    dw 434;
    dw 438;
    dw 209;
    dw 112;
    dw 442;
    dw 209;
    dw 116;
    dw 446;
    dw 209;
    dw 120;
    dw 450;
    dw 209;
    dw 124;
    dw 454;
    dw 209;
    dw 128;
    dw 458;
    dw 209;
    dw 132;
    dw 462;
    dw 209;
    dw 136;
    dw 466;
    dw 209;
    dw 140;
    dw 470;
    dw 209;
    dw 144;
    dw 474;
    dw 209;
    dw 148;
    dw 478;
    dw 209;
    dw 152;
    dw 482;
    dw 209;
    dw 156;
    dw 486;
    dw 164;
    dw 204;
    dw 490;
    dw 168;
    dw 214;
    dw 498;
    dw 172;
    dw 218;
    dw 506;
    dw 176;
    dw 222;
    dw 514;
    dw 180;
    dw 226;
    dw 522;
    dw 184;
    dw 230;
    dw 530;
    dw 188;
    dw 234;
    dw 538;
    dw 192;
    dw 238;
    dw 546;
    dw 196;
    dw 242;
    dw 554;
    dw 200;
    dw 246;
    dw 562;
    dw 4;
    dw 230;
    dw 570;
    dw 8;
    dw 254;
    dw 578;
    dw 446;
    dw 204;
    dw 586;
    dw 450;
    dw 214;
    dw 594;
    dw 454;
    dw 218;
    dw 602;
    dw 458;
    dw 222;
    dw 610;
    dw 462;
    dw 226;
    dw 618;
    dw 466;
    dw 230;
    dw 626;
    dw 470;
    dw 234;
    dw 634;
    dw 474;
    dw 238;
    dw 642;
    dw 478;
    dw 242;
    dw 650;
    dw 482;
    dw 246;
    dw 658;
    dw 486;
    dw 250;
    dw 666;
    dw 566;
    dw 582;
    dw 674;
    dw 204;
    dw 204;
    dw 214;

    output_offsets_ptr_loc:
    dw 112;

    poseidon_indexes_ptr_loc:
    dw 220;
}

func get_BN254_FP12_MUL_circuit() -> (circuit: ExtensionFieldModuloCircuit*) {
    alloc_locals;
    let (__fp__, _) = get_fp_and_pc();
    let (constants_ptr: felt*) = get_label_location(constants_ptr_loc);
    let (add_offsets_ptr: felt*) = get_label_location(add_offsets_ptr_loc);
    let (mul_offsets_ptr: felt*) = get_label_location(mul_offsets_ptr_loc);
    let (output_offsets_ptr: felt*) = get_label_location(output_offsets_ptr_loc);
    let (poseidon_indexes_ptr: felt*) = get_label_location(poseidon_indexes_ptr_loc);
    let constants_ptr_len = 4;
    let input_len = 96;
    let commitments_len = 92;
    let witnesses_len = 0;
    let output_len = 48;
    let continuous_output = 1;
    let add_mod_n = 47;
    let mul_mod_n = 71;
    let n_assert_eq = 1;
    let N_Euclidean_equations = 1;
    let name = 'fp12_mul';
    let curve_id = 0;
    local circuit: ExtensionFieldModuloCircuit = ExtensionFieldModuloCircuit(
        constants_ptr,
        add_offsets_ptr,
        mul_offsets_ptr,
        output_offsets_ptr,
        poseidon_indexes_ptr,
        constants_ptr_len,
        input_len,
        commitments_len,
        witnesses_len,
        output_len,
        continuous_output,
        add_mod_n,
        mul_mod_n,
        n_assert_eq,
        N_Euclidean_equations,
        name,
        curve_id,
    );
    return (&circuit,);

    constants_ptr_loc:
    dw 82;
    dw 0;
    dw 0;
    dw 0;
    dw 32324006162389411176778628405;
    dw 57042285082623239461879769745;
    dw 3486998266802970665;
    dw 0;
    dw 1;
    dw 0;
    dw 0;
    dw 0;
    dw 0;
    dw 0;
    dw 0;
    dw 0;

    add_offsets_ptr_loc:
    dw 16;
    dw 258;
    dw 262;
    dw 262;
    dw 266;
    dw 270;
    dw 270;
    dw 274;
    dw 278;
    dw 278;
    dw 282;
    dw 286;
    dw 286;
    dw 290;
    dw 294;
    dw 294;
    dw 298;
    dw 302;
    dw 302;
    dw 306;
    dw 310;
    dw 310;
    dw 314;
    dw 318;
    dw 318;
    dw 322;
    dw 326;
    dw 326;
    dw 330;
    dw 334;
    dw 334;
    dw 338;
    dw 342;
    dw 64;
    dw 346;
    dw 350;
    dw 350;
    dw 354;
    dw 358;
    dw 358;
    dw 362;
    dw 366;
    dw 366;
    dw 370;
    dw 374;
    dw 374;
    dw 378;
    dw 382;
    dw 382;
    dw 386;
    dw 390;
    dw 390;
    dw 394;
    dw 398;
    dw 398;
    dw 402;
    dw 406;
    dw 406;
    dw 410;
    dw 414;
    dw 414;
    dw 418;
    dw 422;
    dw 422;
    dw 426;
    dw 430;
    dw 160;
    dw 490;
    dw 494;
    dw 494;
    dw 498;
    dw 502;
    dw 502;
    dw 506;
    dw 510;
    dw 510;
    dw 514;
    dw 518;
    dw 518;
    dw 522;
    dw 526;
    dw 526;
    dw 530;
    dw 534;
    dw 534;
    dw 538;
    dw 542;
    dw 542;
    dw 546;
    dw 550;
    dw 550;
    dw 554;
    dw 558;
    dw 558;
    dw 562;
    dw 566;
    dw 0;
    dw 570;
    dw 574;
    dw 574;
    dw 578;
    dw 582;
    dw 442;
    dw 586;
    dw 590;
    dw 590;
    dw 594;
    dw 598;
    dw 598;
    dw 602;
    dw 606;
    dw 606;
    dw 610;
    dw 614;
    dw 614;
    dw 618;
    dw 622;
    dw 622;
    dw 626;
    dw 630;
    dw 630;
    dw 634;
    dw 638;
    dw 638;
    dw 642;
    dw 646;
    dw 646;
    dw 650;
    dw 654;
    dw 654;
    dw 658;
    dw 662;
    dw 662;
    dw 666;
    dw 670;
    dw 674;
    dw 670;
    dw 678;
    dw 12;
    dw 678;
    dw 438;
    dw 16;
    dw 258;
    dw 262;

    mul_offsets_ptr_loc:
    dw 204;
    dw 204;
    dw 214;
    dw 214;
    dw 204;
    dw 218;
    dw 218;
    dw 204;
    dw 222;
    dw 222;
    dw 204;
    dw 226;
    dw 226;
    dw 204;
    dw 230;
    dw 230;
    dw 204;
    dw 234;
    dw 234;
    dw 204;
    dw 238;
    dw 238;
    dw 204;
    dw 242;
    dw 242;
    dw 204;
    dw 246;
    dw 246;
    dw 204;
    dw 250;
    dw 250;
    dw 204;
    dw 254;
    dw 20;
    dw 204;
    dw 258;
    dw 24;
    dw 214;
    dw 266;
    dw 28;
    dw 218;
    dw 274;
    dw 32;
    dw 222;
    dw 282;
    dw 36;
    dw 226;
    dw 290;
    dw 40;
    dw 230;
    dw 298;
    dw 44;
    dw 234;
    dw 306;
    dw 48;
    dw 238;
    dw 314;
    dw 52;
    dw 242;
    dw 322;
    dw 56;
    dw 246;
    dw 330;
    dw 60;
    dw 250;
    dw 338;
    dw 68;
    dw 204;
    dw 346;
    dw 72;
    dw 214;
    dw 354;
    dw 76;
    dw 218;
    dw 362;
    dw 80;
    dw 222;
    dw 370;
    dw 84;
    dw 226;
    dw 378;
    dw 88;
    dw 230;
    dw 386;
    dw 92;
    dw 234;
    dw 394;
    dw 96;
    dw 238;
    dw 402;
    dw 100;
    dw 242;
    dw 410;
    dw 104;
    dw 246;
    dw 418;
    dw 108;
    dw 250;
    dw 426;
    dw 342;
    dw 430;
    dw 434;
    dw 209;
    dw 434;
    dw 438;
    dw 209;
    dw 112;
    dw 442;
    dw 209;
    dw 116;
    dw 446;
    dw 209;
    dw 120;
    dw 450;
    dw 209;
    dw 124;
    dw 454;
    dw 209;
    dw 128;
    dw 458;
    dw 209;
    dw 132;
    dw 462;
    dw 209;
    dw 136;
    dw 466;
    dw 209;
    dw 140;
    dw 470;
    dw 209;
    dw 144;
    dw 474;
    dw 209;
    dw 148;
    dw 478;
    dw 209;
    dw 152;
    dw 482;
    dw 209;
    dw 156;
    dw 486;
    dw 164;
    dw 204;
    dw 490;
    dw 168;
    dw 214;
    dw 498;
    dw 172;
    dw 218;
    dw 506;
    dw 176;
    dw 222;
    dw 514;
    dw 180;
    dw 226;
    dw 522;
    dw 184;
    dw 230;
    dw 530;
    dw 188;
    dw 234;
    dw 538;
    dw 192;
    dw 238;
    dw 546;
    dw 196;
    dw 242;
    dw 554;
    dw 200;
    dw 246;
    dw 562;
    dw 4;
    dw 230;
    dw 570;
    dw 8;
    dw 254;
    dw 578;
    dw 446;
    dw 204;
    dw 586;
    dw 450;
    dw 214;
    dw 594;
    dw 454;
    dw 218;
    dw 602;
    dw 458;
    dw 222;
    dw 610;
    dw 462;
    dw 226;
    dw 618;
    dw 466;
    dw 230;
    dw 626;
    dw 470;
    dw 234;
    dw 634;
    dw 474;
    dw 238;
    dw 642;
    dw 478;
    dw 242;
    dw 650;
    dw 482;
    dw 246;
    dw 658;
    dw 486;
    dw 250;
    dw 666;
    dw 566;
    dw 582;
    dw 674;
    dw 204;
    dw 204;
    dw 214;

    output_offsets_ptr_loc:
    dw 112;

    poseidon_indexes_ptr_loc:
    dw 220;
}
