.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SwitchStateDoEntry
/* 70340 8007FB40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 70344 8007FB44 1400B1AF */  sw         $s1, 0x14($sp)
/* 70348 8007FB48 21888000 */  addu       $s1, $a0, $zero
/* 7034C 8007FB4C 1800BFAF */  sw         $ra, 0x18($sp)
/* 70350 8007FB50 1000B0AF */  sw         $s0, 0x10($sp)
/* 70354 8007FB54 6C01308E */  lw         $s0, 0x16C($s1)
/* 70358 8007FB58 91FE010C */  jal        MON_SwitchState
/* 7035C 8007FB5C 00000000 */   nop
/* 70360 8007FB60 0C000012 */  beqz       $s0, .L8007FB94
/* 70364 8007FB64 00000000 */   nop
/* 70368 8007FB68 9801258E */  lw         $a1, 0x198($s1)
/* 7036C 8007FB6C 2534020C */  jal        MONTABLE_GetStateFuncs
/* 70370 8007FB70 21202002 */   addu      $a0, $s1, $zero
/* 70374 8007FB74 0000428C */  lw         $v0, 0x0($v0)
/* 70378 8007FB78 00000000 */  nop
/* 7037C 8007FB7C 09F84000 */  jalr       $v0
/* 70380 8007FB80 21202002 */   addu      $a0, $s1, $zero
/* 70384 8007FB84 0000028E */  lw         $v0, 0x0($s0)
/* 70388 8007FB88 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 7038C 8007FB8C 24104300 */  and        $v0, $v0, $v1
/* 70390 8007FB90 000002AE */  sw         $v0, 0x0($s0)
.L8007FB94:
/* 70394 8007FB94 1800BF8F */  lw         $ra, 0x18($sp)
/* 70398 8007FB98 1400B18F */  lw         $s1, 0x14($sp)
/* 7039C 8007FB9C 1000B08F */  lw         $s0, 0x10($sp)
/* 703A0 8007FBA0 0800E003 */  jr         $ra
/* 703A4 8007FBA4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_SwitchStateDoEntry, . - MON_SwitchStateDoEntry
