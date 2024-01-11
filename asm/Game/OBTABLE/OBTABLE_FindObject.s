.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_FindObject
/* 2EC50 8003E450 0CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x44)($gp)
/* 2EC54 8003E454 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2EC58 8003E458 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2EC5C 8003E45C 21988000 */  addu       $s3, $a0, $zero
/* 2EC60 8003E460 1800B2AF */  sw         $s2, 0x18($sp)
/* 2EC64 8003E464 30001224 */  addiu      $s2, $zero, 0x30
/* 2EC68 8003E468 2000BFAF */  sw         $ra, 0x20($sp)
/* 2EC6C 8003E46C 1400B1AF */  sw         $s1, 0x14($sp)
/* 2EC70 8003E470 1000B0AF */  sw         $s0, 0x10($sp)
/* 2EC74 8003E474 10005124 */  addiu      $s1, $v0, 0x10
.L8003E478:
/* 2EC78 8003E478 04002286 */  lh         $v0, 0x4($s1)
/* 2EC7C 8003E47C 00000000 */  nop
/* 2EC80 8003E480 13004010 */  beqz       $v0, .L8003E4D0
/* 2EC84 8003E484 00000000 */   nop
/* 2EC88 8003E488 0000308E */  lw         $s0, 0x0($s1)
/* 2EC8C 8003E48C B841010C */  jal        MEMPACK_MemoryValidFunc
/* 2EC90 8003E490 21200002 */   addu      $a0, $s0, $zero
/* 2EC94 8003E494 0E004010 */  beqz       $v0, .L8003E4D0
/* 2EC98 8003E498 00000000 */   nop
/* 2EC9C 8003E49C 2400048E */  lw         $a0, 0x24($s0)
/* 2ECA0 8003E4A0 0000638E */  lw         $v1, 0x0($s3)
/* 2ECA4 8003E4A4 0000828C */  lw         $v0, 0x0($a0)
/* 2ECA8 8003E4A8 00000000 */  nop
/* 2ECAC 8003E4AC 08006214 */  bne        $v1, $v0, .L8003E4D0
/* 2ECB0 8003E4B0 00000000 */   nop
/* 2ECB4 8003E4B4 0400638E */  lw         $v1, 0x4($s3)
/* 2ECB8 8003E4B8 0400828C */  lw         $v0, 0x4($a0)
/* 2ECBC 8003E4BC 00000000 */  nop
/* 2ECC0 8003E4C0 04006214 */  bne        $v1, $v0, .L8003E4D4
/* 2ECC4 8003E4C4 FFFF5226 */   addiu     $s2, $s2, -0x1
/* 2ECC8 8003E4C8 38F90008 */  j          .L8003E4E0
/* 2ECCC 8003E4CC 21100002 */   addu      $v0, $s0, $zero
.L8003E4D0:
/* 2ECD0 8003E4D0 FFFF5226 */  addiu      $s2, $s2, -0x1
.L8003E4D4:
/* 2ECD4 8003E4D4 E8FF4016 */  bnez       $s2, .L8003E478
/* 2ECD8 8003E4D8 24003126 */   addiu     $s1, $s1, 0x24
/* 2ECDC 8003E4DC 21100000 */  addu       $v0, $zero, $zero
.L8003E4E0:
/* 2ECE0 8003E4E0 2000BF8F */  lw         $ra, 0x20($sp)
/* 2ECE4 8003E4E4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2ECE8 8003E4E8 1800B28F */  lw         $s2, 0x18($sp)
/* 2ECEC 8003E4EC 1400B18F */  lw         $s1, 0x14($sp)
/* 2ECF0 8003E4F0 1000B08F */  lw         $s0, 0x10($sp)
/* 2ECF4 8003E4F4 0800E003 */  jr         $ra
/* 2ECF8 8003E4F8 2800BD27 */   addiu     $sp, $sp, 0x28
.size OBTABLE_FindObject, . - OBTABLE_FindObject
