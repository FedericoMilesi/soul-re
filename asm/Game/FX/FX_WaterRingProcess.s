.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_WaterRingProcess
/* 36BA8 800463A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 36BAC 800463AC 1000BFAF */  sw         $ra, 0x10($sp)
/* 36BB0 800463B0 3C008294 */  lhu        $v0, 0x3C($a0)
/* 36BB4 800463B4 3E008394 */  lhu        $v1, 0x3E($a0)
/* 36BB8 800463B8 F8FF4224 */  addiu      $v0, $v0, -0x8
/* 36BBC 800463BC 3C0082A4 */  sh         $v0, 0x3C($a0)
/* 36BC0 800463C0 44008294 */  lhu        $v0, 0x44($a0)
/* 36BC4 800463C4 F8FF6324 */  addiu      $v1, $v1, -0x8
/* 36BC8 800463C8 3E0083A4 */  sh         $v1, 0x3E($a0)
/* 36BCC 800463CC 46008394 */  lhu        $v1, 0x46($a0)
/* 36BD0 800463D0 08004224 */  addiu      $v0, $v0, 0x8
/* 36BD4 800463D4 440082A4 */  sh         $v0, 0x44($a0)
/* 36BD8 800463D8 4C008294 */  lhu        $v0, 0x4C($a0)
/* 36BDC 800463DC F8FF6324 */  addiu      $v1, $v1, -0x8
/* 36BE0 800463E0 460083A4 */  sh         $v1, 0x46($a0)
/* 36BE4 800463E4 4E008394 */  lhu        $v1, 0x4E($a0)
/* 36BE8 800463E8 F8FF4224 */  addiu      $v0, $v0, -0x8
/* 36BEC 800463EC 4C0082A4 */  sh         $v0, 0x4C($a0)
/* 36BF0 800463F0 54008294 */  lhu        $v0, 0x54($a0)
/* 36BF4 800463F4 08006324 */  addiu      $v1, $v1, 0x8
/* 36BF8 800463F8 4E0083A4 */  sh         $v1, 0x4E($a0)
/* 36BFC 800463FC 56008394 */  lhu        $v1, 0x56($a0)
/* 36C00 80046400 08004224 */  addiu      $v0, $v0, 0x8
/* 36C04 80046404 08006324 */  addiu      $v1, $v1, 0x8
/* 36C08 80046408 540082A4 */  sh         $v0, 0x54($a0)
/* 36C0C 8004640C E620010C */  jal        FX_StandardFXPrimProcess
/* 36C10 80046410 560083A4 */   sh        $v1, 0x56($a0)
/* 36C14 80046414 1000BF8F */  lw         $ra, 0x10($sp)
/* 36C18 80046418 00000000 */  nop
/* 36C1C 8004641C 0800E003 */  jr         $ra
/* 36C20 80046420 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_WaterRingProcess, . - FX_WaterRingProcess
