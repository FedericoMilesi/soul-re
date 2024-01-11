.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CheckIfPointOnLine
/* B2EC 8001AAEC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B2F0 8001AAF0 1000B0AF */  sw         $s0, 0x10($sp)
/* B2F4 8001AAF4 21808000 */  addu       $s0, $a0, $zero
/* B2F8 8001AAF8 1400B1AF */  sw         $s1, 0x14($sp)
/* B2FC 8001AAFC 2188A000 */  addu       $s1, $a1, $zero
/* B300 8001AB00 1800B2AF */  sw         $s2, 0x18($sp)
/* B304 8001AB04 2190C000 */  addu       $s2, $a2, $zero
/* B308 8001AB08 1C00BFAF */  sw         $ra, 0x1C($sp)
/* B30C 8001AB0C 00000486 */  lh         $a0, 0x0($s0)
/* B310 8001AB10 00002586 */  lh         $a1, 0x0($s1)
/* B314 8001AB14 00004686 */  lh         $a2, 0x0($s2)
/* B318 8001AB18 AA6A000C */  jal        CAMERA_CheckPoint
/* B31C 8001AB1C 00000000 */   nop
/* B320 8001AB20 10004014 */  bnez       $v0, .L8001AB64
/* B324 8001AB24 21100000 */   addu      $v0, $zero, $zero
/* B328 8001AB28 02000486 */  lh         $a0, 0x2($s0)
/* B32C 8001AB2C 02002586 */  lh         $a1, 0x2($s1)
/* B330 8001AB30 02004686 */  lh         $a2, 0x2($s2)
/* B334 8001AB34 AA6A000C */  jal        CAMERA_CheckPoint
/* B338 8001AB38 00000000 */   nop
/* B33C 8001AB3C 08004014 */  bnez       $v0, .L8001AB60
/* B340 8001AB40 00000000 */   nop
/* B344 8001AB44 04000486 */  lh         $a0, 0x4($s0)
/* B348 8001AB48 04002586 */  lh         $a1, 0x4($s1)
/* B34C 8001AB4C 04004686 */  lh         $a2, 0x4($s2)
/* B350 8001AB50 AA6A000C */  jal        CAMERA_CheckPoint
/* B354 8001AB54 00000000 */   nop
/* B358 8001AB58 D96A0008 */  j          .L8001AB64
/* B35C 8001AB5C 0100422C */   sltiu     $v0, $v0, 0x1
.L8001AB60:
/* B360 8001AB60 21100000 */  addu       $v0, $zero, $zero
.L8001AB64:
/* B364 8001AB64 1C00BF8F */  lw         $ra, 0x1C($sp)
/* B368 8001AB68 1800B28F */  lw         $s2, 0x18($sp)
/* B36C 8001AB6C 1400B18F */  lw         $s1, 0x14($sp)
/* B370 8001AB70 1000B08F */  lw         $s0, 0x10($sp)
/* B374 8001AB74 0800E003 */  jr         $ra
/* B378 8001AB78 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_CheckIfPointOnLine, . - CAMERA_CheckIfPointOnLine
