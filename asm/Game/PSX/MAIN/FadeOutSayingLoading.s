.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FadeOutSayingLoading
/* 29484 80038C84 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 29488 80038C88 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 2948C 80038C8C 21888000 */  addu       $s1, $a0, $zero
/* 29490 80038C90 3800B0AF */  sw         $s0, 0x38($sp)
/* 29494 80038C94 21800000 */  addu       $s0, $zero, $zero
/* 29498 80038C98 21200002 */  addu       $a0, $s0, $zero
/* 2949C 80038C9C F0000324 */  addiu      $v1, $zero, 0xF0
/* 294A0 80038CA0 4800B4AF */  sw         $s4, 0x48($sp)
/* 294A4 80038CA4 01001424 */  addiu      $s4, $zero, 0x1
/* 294A8 80038CA8 21280002 */  addu       $a1, $s0, $zero
/* 294AC 80038CAC 00020624 */  addiu      $a2, $zero, 0x200
/* 294B0 80038CB0 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 294B4 80038CB4 4400B3AF */  sw         $s3, 0x44($sp)
/* 294B8 80038CB8 4000B2AF */  sw         $s2, 0x40($sp)
/* 294BC 80038CBC 4000228E */  lw         $v0, 0x40($s1)
/* 294C0 80038CC0 D401338E */  lw         $s3, 0x1D4($s1)
/* 294C4 80038CC4 0400528C */  lw         $s2, 0x4($v0)
/* 294C8 80038CC8 00020224 */  addiu      $v0, $zero, 0x200
/* 294CC 80038CCC 1800A2AF */  sw         $v0, 0x18($sp)
/* 294D0 80038CD0 02000224 */  addiu      $v0, $zero, 0x2
/* 294D4 80038CD4 1000A0AF */  sw         $zero, 0x10($sp)
/* 294D8 80038CD8 1400A3AF */  sw         $v1, 0x14($sp)
/* 294DC 80038CDC 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 294E0 80038CE0 2000A0AF */  sw         $zero, 0x20($sp)
/* 294E4 80038CE4 2400A0AF */  sw         $zero, 0x24($sp)
/* 294E8 80038CE8 2800A0AF */  sw         $zero, 0x28($sp)
/* 294EC 80038CEC 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 294F0 80038CF0 4000228E */  lw         $v0, 0x40($s1)
/* 294F4 80038CF4 21380002 */  addu       $a3, $s0, $zero
/* 294F8 80038CF8 3400B3AF */  sw         $s3, 0x34($sp)
/* 294FC 80038CFC 2FAB000C */  jal        DRAW_TranslucentQuad
/* 29500 80038D00 3000A2AF */   sw        $v0, 0x30($sp)
/* 29504 80038D04 18B6000C */  jal        FONT_Flush
/* 29508 80038D08 10001026 */   addiu     $s0, $s0, 0x10
.L80038D0C:
/* 2950C 80038D0C 0001022A */  slti       $v0, $s0, 0x100
/* 29510 80038D10 02004014 */  bnez       $v0, .L80038D1C
/* 29514 80038D14 00000000 */   nop
/* 29518 80038D18 FF001024 */  addiu      $s0, $zero, 0xFF
.L80038D1C:
/* 2951C 80038D1C 3000228E */  lw         $v0, 0x30($s1)
/* 29520 80038D20 00000000 */  nop
/* 29524 80038D24 23108202 */  subu       $v0, $s4, $v0
/* 29528 80038D28 300022AE */  sw         $v0, 0x30($s1)
/* 2952C 80038D2C 080050A2 */  sb         $s0, 0x8($s2)
/* 29530 80038D30 090050A2 */  sb         $s0, 0x9($s2)
/* 29534 80038D34 0A0050A2 */  sb         $s0, 0xA($s2)
.L80038D38:
/* 29538 80038D38 1C01248E */  lw         $a0, 0x11C($s1)
/* 2953C 80038D3C 8494000C */  jal        func_80025210
/* 29540 80038D40 00000000 */   nop
/* 29544 80038D44 FCFF4014 */  bnez       $v0, .L80038D38
/* 29548 80038D48 00000000 */   nop
/* 2954C 80038D4C 3000228E */  lw         $v0, 0x30($s1)
/* 29550 80038D50 00000000 */  nop
/* 29554 80038D54 40200200 */  sll        $a0, $v0, 1
/* 29558 80038D58 21208200 */  addu       $a0, $a0, $v0
/* 2955C 80038D5C C0200400 */  sll        $a0, $a0, 3
/* 29560 80038D60 23208200 */  subu       $a0, $a0, $v0
/* 29564 80038D64 80200400 */  sll        $a0, $a0, 2
/* 29568 80038D68 88BC8227 */  addiu      $v0, $gp, %gp_rel(draw)
/* 2956C 80038D6C 38EA020C */  jal        func_800BA8E0
/* 29570 80038D70 21208200 */   addu      $a0, $a0, $v0
.L80038D74:
/* 29574 80038D74 1801248E */  lw         $a0, 0x118($s1)
/* 29578 80038D78 8494000C */  jal        func_80025210
/* 2957C 80038D7C 00000000 */   nop
/* 29580 80038D80 FCFF4014 */  bnez       $v0, .L80038D74
/* 29584 80038D84 21200000 */   addu      $a0, $zero, $zero
/* 29588 80038D88 0400228E */  lw         $v0, 0x4($s1)
/* 2958C 80038D8C 28022326 */  addiu      $v1, $s1, 0x228
/* 29590 80038D90 1C0123AE */  sw         $v1, 0x11C($s1)
/* 29594 80038D94 23108202 */  subu       $v0, $s4, $v0
/* 29598 80038D98 5EF2020C */  jal        func_800BC978
/* 2959C 80038D9C 040022AE */   sw        $v0, 0x4($s1)
/* 295A0 80038DA0 1CEA020C */  jal        func_800BA870
/* 295A4 80038DA4 FC2F6426 */   addiu     $a0, $s3, 0x2FFC
/* 295A8 80038DA8 FF000224 */  addiu      $v0, $zero, 0xFF
/* 295AC 80038DAC D7FF0216 */  bne        $s0, $v0, .L80038D0C
/* 295B0 80038DB0 10001026 */   addiu     $s0, $s0, 0x10
/* 295B4 80038DB4 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 295B8 80038DB8 4800B48F */  lw         $s4, 0x48($sp)
/* 295BC 80038DBC 4400B38F */  lw         $s3, 0x44($sp)
/* 295C0 80038DC0 4000B28F */  lw         $s2, 0x40($sp)
/* 295C4 80038DC4 3C00B18F */  lw         $s1, 0x3C($sp)
/* 295C8 80038DC8 3800B08F */  lw         $s0, 0x38($sp)
/* 295CC 80038DCC 0800E003 */  jr         $ra
/* 295D0 80038DD0 5000BD27 */   addiu     $sp, $sp, 0x50
.size FadeOutSayingLoading, . - FadeOutSayingLoading
