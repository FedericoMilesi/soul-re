.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleFogFar
/* E878 8001E078 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* E87C 8001E07C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E880 8001E080 1800BFAF */  sw         $ra, 0x18($sp)
/* E884 8001E084 1400B1AF */  sw         $s1, 0x14($sp)
/* E888 8001E088 1000B0AF */  sw         $s0, 0x10($sp)
/* E88C 8001E08C 3800448C */  lw         $a0, 0x38($v0)
/* E890 8001E090 1C66010C */  jal        STREAM_GetLevelWithID
/* E894 8001E094 2188A000 */   addu      $s1, $a1, $zero
/* E898 8001E098 21804000 */  addu       $s0, $v0, $zero
/* E89C 8001E09C 04002296 */  lhu        $v0, 0x4($s1)
/* E8A0 8001E0A0 46000496 */  lhu        $a0, 0x46($s0)
/* E8A4 8001E0A4 440002A6 */  sh         $v0, 0x44($s0)
/* E8A8 8001E0A8 F8AC868F */  lw         $a2, %gp_rel(theCamera + 0x68)($gp)
/* E8AC 8001E0AC C8F3020C */  jal        SetFogNearFar
/* E8B0 8001E0B0 FFFF4530 */   andi      $a1, $v0, 0xFFFF
/* E8B4 8001E0B4 6DDC000C */  jal        LIGHT_CalcDQPTable
/* E8B8 8001E0B8 21200002 */   addu      $a0, $s0, $zero
/* E8BC 8001E0BC 1800BF8F */  lw         $ra, 0x18($sp)
/* E8C0 8001E0C0 1400B18F */  lw         $s1, 0x14($sp)
/* E8C4 8001E0C4 1000B08F */  lw         $s0, 0x10($sp)
/* E8C8 8001E0C8 01000224 */  addiu      $v0, $zero, 0x1
/* E8CC 8001E0CC 0800E003 */  jr         $ra
/* E8D0 8001E0D0 2000BD27 */   addiu     $sp, $sp, 0x20
.size SIGNAL_HandleFogFar, . - SIGNAL_HandleFogFar
