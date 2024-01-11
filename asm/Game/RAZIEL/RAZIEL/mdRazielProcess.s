.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mdRazielProcess
/* A4518 800B3D18 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A451C 800B3D1C 1000B0AF */  sw         $s0, 0x10($sp)
/* A4520 800B3D20 21808000 */  addu       $s0, $a0, $zero
/* A4524 800B3D24 1800B2AF */  sw         $s2, 0x18($sp)
/* A4528 800B3D28 2190A000 */  addu       $s2, $a1, $zero
/* A452C 800B3D2C 1400B1AF */  sw         $s1, 0x14($sp)
/* A4530 800B3D30 1C00BFAF */  sw         $ra, 0x1C($sp)
/* A4534 800B3D34 F4CA020C */  jal        ProcessTimers
/* A4538 800B3D38 2188C000 */   addu      $s1, $a2, $zero
/* A453C 800B3D3C BA9E020C */  jal        razClearPlayerEvent
/* A4540 800B3D40 00000000 */   nop
/* A4544 800B3D44 02C3010C */  jal        ProcessRazControl
/* A4548 800B3D48 21202002 */   addu      $a0, $s1, $zero
/* A454C 800B3D4C 21200002 */  addu       $a0, $s0, $zero
/* A4550 800B3D50 21284002 */  addu       $a1, $s2, $zero
/* A4554 800B3D54 21302002 */  addu       $a2, $s1, $zero
/* A4558 800B3D58 04C7020C */  jal        SetStates
/* A455C 800B3D5C FFFF0724 */   addiu     $a3, $zero, -0x1
/* A4560 800B3D60 3ACA020C */  jal        ProcessHints
/* A4564 800B3D64 00000000 */   nop
/* A4568 800B3D68 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* A456C 800B3D6C 376F000C */  jal        CAMERA_Control
/* A4570 800B3D70 21280002 */   addu      $a1, $s0, $zero
/* A4574 800B3D74 E00000A6 */  sh         $zero, 0xE0($s0)
/* A4578 800B3D78 E20000A6 */  sh         $zero, 0xE2($s0)
/* A457C 800B3D7C E40000A6 */  sh         $zero, 0xE4($s0)
/* A4580 800B3D80 3CFA848F */  lw         $a0, %gp_rel(Raziel + 0x40C)($gp)
/* A4584 800B3D84 D0FB80A7 */  sh         $zero, %gp_rel(Raziel + 0x5A0)($gp)
/* A4588 800B3D88 D2FB80A7 */  sh         $zero, %gp_rel(Raziel + 0x5A2)($gp)
/* A458C 800B3D8C D4FB80A7 */  sh         $zero, %gp_rel(Raziel + 0x5A4)($gp)
/* A4590 800B3D90 F8F980AF */  sw         $zero, %gp_rel(Raziel + 0x3C8)($gp)
/* A4594 800B3D94 03008010 */  beqz       $a0, .L800B3DA4
/* A4598 800B3D98 00000000 */   nop
/* A459C 800B3D9C 22EB010C */  jal        GlyphProcess
/* A45A0 800B3DA0 21284002 */   addu      $a1, $s2, $zero
.L800B3DA4:
/* A45A4 800B3DA4 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* A45A8 800B3DA8 5CAB838F */  lw         $v1, %gp_rel(debugRazielFlags2)($gp)
/* A45AC 800B3DAC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* A45B0 800B3DB0 1800B28F */  lw         $s2, 0x18($sp)
/* A45B4 800B3DB4 1400B18F */  lw         $s1, 0x14($sp)
/* A45B8 800B3DB8 1000B08F */  lw         $s0, 0x10($sp)
/* A45BC 800B3DBC 38FA82AF */  sw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* A45C0 800B3DC0 25104300 */  or         $v0, $v0, $v1
/* A45C4 800B3DC4 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* A45C8 800B3DC8 0800E003 */  jr         $ra
/* A45CC 800B3DCC 2000BD27 */   addiu     $sp, $sp, 0x20
.size mdRazielProcess, . - mdRazielProcess
