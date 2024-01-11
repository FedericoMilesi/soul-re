.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FindObjectName
/* 49334 80058B34 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 49338 80058B38 1400B1AF */  sw         $s1, 0x14($sp)
/* 4933C 80058B3C 0CBE918F */  lw         $s1, %gp_rel(gameTrackerX + 0x44)($gp)
/* 49340 80058B40 1800B2AF */  sw         $s2, 0x18($sp)
/* 49344 80058B44 21908000 */  addu       $s2, $a0, $zero
/* 49348 80058B48 1000B0AF */  sw         $s0, 0x10($sp)
/* 4934C 80058B4C 21800000 */  addu       $s0, $zero, $zero
/* 49350 80058B50 1C00BFAF */  sw         $ra, 0x1C($sp)
.L80058B54:
/* 49354 80058B54 14002286 */  lh         $v0, 0x14($s1)
/* 49358 80058B58 00000000 */  nop
/* 4935C 80058B5C 05004010 */  beqz       $v0, .L80058B74
/* 49360 80058B60 21202002 */   addu      $a0, $s1, $zero
/* 49364 80058B64 1CD2010C */  jal        strcmpi
/* 49368 80058B68 21284002 */   addu      $a1, $s2, $zero
/* 4936C 80058B6C 06004010 */  beqz       $v0, .L80058B88
/* 49370 80058B70 21100002 */   addu      $v0, $s0, $zero
.L80058B74:
/* 49374 80058B74 01001026 */  addiu      $s0, $s0, 0x1
/* 49378 80058B78 3000022A */  slti       $v0, $s0, 0x30
/* 4937C 80058B7C F5FF4014 */  bnez       $v0, .L80058B54
/* 49380 80058B80 24003126 */   addiu     $s1, $s1, 0x24
/* 49384 80058B84 FFFF0224 */  addiu      $v0, $zero, -0x1
.L80058B88:
/* 49388 80058B88 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4938C 80058B8C 1800B28F */  lw         $s2, 0x18($sp)
/* 49390 80058B90 1400B18F */  lw         $s1, 0x14($sp)
/* 49394 80058B94 1000B08F */  lw         $s0, 0x10($sp)
/* 49398 80058B98 0800E003 */  jr         $ra
/* 4939C 80058B9C 2000BD27 */   addiu     $sp, $sp, 0x20
.size FindObjectName, . - FindObjectName
