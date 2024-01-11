.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fx_calc_points
/* 3EBD8 8004E3D8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3EBDC 8004E3DC 1400B1AF */  sw         $s1, 0x14($sp)
/* 3EBE0 8004E3E0 21888000 */  addu       $s1, $a0, $zero
/* 3EBE4 8004E3E4 1000B0AF */  sw         $s0, 0x10($sp)
/* 3EBE8 8004E3E8 2180A000 */  addu       $s0, $a1, $zero
/* 3EBEC 8004E3EC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3EBF0 8004E3F0 2198C000 */  addu       $s3, $a2, $zero
/* 3EBF4 8004E3F4 2000B4AF */  sw         $s4, 0x20($sp)
/* 3EBF8 8004E3F8 21A0E000 */  addu       $s4, $a3, $zero
/* 3EBFC 8004E3FC 1800B2AF */  sw         $s2, 0x18($sp)
/* 3EC00 8004E400 3800B28F */  lw         $s2, 0x38($sp)
/* 3EC04 8004E404 2400BFAF */  sw         $ra, 0x24($sp)
/* 3EC08 8004E408 DCE4010C */  jal        func_80079370
/* 3EC0C 8004E40C 21200002 */   addu      $a0, $s0, $zero
/* 3EC10 8004E410 21200002 */  addu       $a0, $s0, $zero
/* 3EC14 8004E414 D0E4010C */  jal        func_80079340
/* 3EC18 8004E418 21804000 */   addu      $s0, $v0, $zero
/* 3EC1C 8004E41C 18001302 */  mult       $s0, $s3
/* 3EC20 8004E420 12480000 */  mflo       $t1
/* 3EC24 8004E424 00000000 */  nop
/* 3EC28 8004E428 00000000 */  nop
/* 3EC2C 8004E42C 18001402 */  mult       $s0, $s4
/* 3EC30 8004E430 12200000 */  mflo       $a0
/* 3EC34 8004E434 00000000 */  nop
/* 3EC38 8004E438 00000000 */  nop
/* 3EC3C 8004E43C 18001202 */  mult       $s0, $s2
/* 3EC40 8004E440 12380000 */  mflo       $a3
/* 3EC44 8004E444 00000000 */  nop
/* 3EC48 8004E448 00000000 */  nop
/* 3EC4C 8004E44C 18005300 */  mult       $v0, $s3
/* 3EC50 8004E450 12180000 */  mflo       $v1
/* 3EC54 8004E454 00000000 */  nop
/* 3EC58 8004E458 00000000 */  nop
/* 3EC5C 8004E45C 18005400 */  mult       $v0, $s4
/* 3EC60 8004E460 12280000 */  mflo       $a1
/* 3EC64 8004E464 00000000 */  nop
/* 3EC68 8004E468 00000000 */  nop
/* 3EC6C 8004E46C 18005200 */  mult       $v0, $s2
/* 3EC70 8004E470 03130900 */  sra        $v0, $t1, 12
/* 3EC74 8004E474 000022A6 */  sh         $v0, 0x0($s1)
/* 3EC78 8004E478 03130400 */  sra        $v0, $a0, 12
/* 3EC7C 8004E47C 080022A6 */  sh         $v0, 0x8($s1)
/* 3EC80 8004E480 03130300 */  sra        $v0, $v1, 12
/* 3EC84 8004E484 020022A6 */  sh         $v0, 0x2($s1)
/* 3EC88 8004E488 03130500 */  sra        $v0, $a1, 12
/* 3EC8C 8004E48C 0A0022A6 */  sh         $v0, 0xA($s1)
/* 3EC90 8004E490 03130700 */  sra        $v0, $a3, 12
/* 3EC94 8004E494 100022A6 */  sh         $v0, 0x10($s1)
/* 3EC98 8004E498 12300000 */  mflo       $a2
/* 3EC9C 8004E49C 03130600 */  sra        $v0, $a2, 12
/* 3ECA0 8004E4A0 120022A6 */  sh         $v0, 0x12($s1)
/* 3ECA4 8004E4A4 000020CA */  lwc2       $0, 0x0($s1)
/* 3ECA8 8004E4A8 040021CA */  lwc2       $1, 0x4($s1)
/* 3ECAC 8004E4AC 080022CA */  lwc2       $2, 0x8($s1)
/* 3ECB0 8004E4B0 0C0023CA */  lwc2       $3, 0xC($s1)
/* 3ECB4 8004E4B4 100024CA */  lwc2       $4, 0x10($s1)
/* 3ECB8 8004E4B8 140025CA */  lwc2       $5, 0x14($s1)
/* 3ECBC 8004E4BC 00000000 */  nop
/* 3ECC0 8004E4C0 00000000 */  nop
/* 3ECC4 8004E4C4 3000284A */  RTPT
/* 3ECC8 8004E4C8 2400BF8F */  lw         $ra, 0x24($sp)
/* 3ECCC 8004E4CC 2000B48F */  lw         $s4, 0x20($sp)
/* 3ECD0 8004E4D0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3ECD4 8004E4D4 1800B28F */  lw         $s2, 0x18($sp)
/* 3ECD8 8004E4D8 1400B18F */  lw         $s1, 0x14($sp)
/* 3ECDC 8004E4DC 1000B08F */  lw         $s0, 0x10($sp)
/* 3ECE0 8004E4E0 0800E003 */  jr         $ra
/* 3ECE4 8004E4E4 2800BD27 */   addiu     $sp, $sp, 0x28
.size fx_calc_points, . - fx_calc_points
