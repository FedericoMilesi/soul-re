.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ProcessEvents
/* 5219C 8006199C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 521A0 800619A0 1800B2AF */  sw         $s2, 0x18($sp)
/* 521A4 800619A4 21908000 */  addu       $s2, $a0, $zero
/* 521A8 800619A8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 521AC 800619AC 1400B1AF */  sw         $s1, 0x14($sp)
/* 521B0 800619B0 1000B0AF */  sw         $s0, 0x10($sp)
/* 521B4 800619B4 0000428E */  lw         $v0, 0x0($s2)
/* 521B8 800619B8 ECCB85AF */  sw         $a1, %gp_rel(CurrentPuzzleLevel)($gp)
/* 521BC 800619BC 19004018 */  blez       $v0, .L80061A24
/* 521C0 800619C0 21800000 */   addu      $s0, $zero, $zero
/* 521C4 800619C4 21884002 */  addu       $s1, $s2, $zero
.L800619C8:
/* 521C8 800619C8 0400248E */  lw         $a0, 0x4($s1)
/* 521CC 800619CC 00000000 */  nop
/* 521D0 800619D0 00008284 */  lh         $v0, 0x0($a0)
/* 521D4 800619D4 00000000 */  nop
/* 521D8 800619D8 05004004 */  bltz       $v0, .L800619F0
/* 521DC 800619DC 00000000 */   nop
/* 521E0 800619E0 9985010C */  jal        EVENT_Process
/* 521E4 800619E4 21280000 */   addu      $a1, $zero, $zero
/* 521E8 800619E8 84860108 */  j          .L80061A10
/* 521EC 800619EC 04003126 */   addiu     $s1, $s1, 0x4
.L800619F0:
/* 521F0 800619F0 05008290 */  lbu        $v0, 0x5($a0)
/* 521F4 800619F4 00000000 */  nop
/* 521F8 800619F8 04004010 */  beqz       $v0, .L80061A0C
/* 521FC 800619FC 00000000 */   nop
/* 52200 80061A00 21284000 */  addu       $a1, $v0, $zero
/* 52204 80061A04 F185010C */  jal        EVENT_ProcessPuppetShow
/* 52208 80061A08 FFFFA524 */   addiu     $a1, $a1, -0x1
.L80061A0C:
/* 5220C 80061A0C 04003126 */  addiu      $s1, $s1, 0x4
.L80061A10:
/* 52210 80061A10 0000428E */  lw         $v0, 0x0($s2)
/* 52214 80061A14 01001026 */  addiu      $s0, $s0, 0x1
/* 52218 80061A18 2A100202 */  slt        $v0, $s0, $v0
/* 5221C 80061A1C EAFF4014 */  bnez       $v0, .L800619C8
/* 52220 80061A20 00000000 */   nop
.L80061A24:
/* 52224 80061A24 8CCE8487 */  lh         $a0, %gp_rel(MovieToPlay)($gp)
/* 52228 80061A28 FFFF1024 */  addiu      $s0, $zero, -0x1
/* 5222C 80061A2C 06009010 */  beq        $a0, $s0, .L80061A48
/* 52230 80061A30 00000000 */   nop
/* 52234 80061A34 78DD020C */  jal        CINE_PlayIngame
/* 52238 80061A38 00000000 */   nop
/* 5223C 80061A3C 01000224 */  addiu      $v0, $zero, 0x1
/* 52240 80061A40 8CCE90A7 */  sh         $s0, %gp_rel(MovieToPlay)($gp)
/* 52244 80061A44 88CE82A7 */  sh         $v0, %gp_rel(MoviePlayed)($gp)
.L80061A48:
/* 52248 80061A48 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5224C 80061A4C 1800B28F */  lw         $s2, 0x18($sp)
/* 52250 80061A50 1400B18F */  lw         $s1, 0x14($sp)
/* 52254 80061A54 1000B08F */  lw         $s0, 0x10($sp)
/* 52258 80061A58 0800E003 */  jr         $ra
/* 5225C 80061A5C 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_ProcessEvents, . - EVENT_ProcessEvents
