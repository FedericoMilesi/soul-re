.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleFogNear
/* E824 8001E024 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* E828 8001E028 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E82C 8001E02C 1400BFAF */  sw         $ra, 0x14($sp)
/* E830 8001E030 1000B0AF */  sw         $s0, 0x10($sp)
/* E834 8001E034 3800448C */  lw         $a0, 0x38($v0)
/* E838 8001E038 1C66010C */  jal        STREAM_GetLevelWithID
/* E83C 8001E03C 2180A000 */   addu      $s0, $a1, $zero
/* E840 8001E040 04000396 */  lhu        $v1, 0x4($s0)
/* E844 8001E044 21804000 */  addu       $s0, $v0, $zero
/* E848 8001E048 44000596 */  lhu        $a1, 0x44($s0)
/* E84C 8001E04C 460003A6 */  sh         $v1, 0x46($s0)
/* E850 8001E050 F8AC868F */  lw         $a2, %gp_rel(theCamera + 0x68)($gp)
/* E854 8001E054 C8F3020C */  jal        func_800BCF20
/* E858 8001E058 FFFF6430 */   andi      $a0, $v1, 0xFFFF
/* E85C 8001E05C 6DDC000C */  jal        LIGHT_CalcDQPTable
/* E860 8001E060 21200002 */   addu      $a0, $s0, $zero
/* E864 8001E064 1400BF8F */  lw         $ra, 0x14($sp)
/* E868 8001E068 1000B08F */  lw         $s0, 0x10($sp)
/* E86C 8001E06C 01000224 */  addiu      $v0, $zero, 0x1
/* E870 8001E070 0800E003 */  jr         $ra
/* E874 8001E074 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleFogNear, . - SIGNAL_HandleFogNear
