.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetInterpController_Quat
/* 813A0 80090BA0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 813A4 80090BA4 1400B1AF */  sw         $s1, 0x14($sp)
/* 813A8 80090BA8 21888000 */  addu       $s1, $a0, $zero
/* 813AC 80090BAC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 813B0 80090BB0 3800B38F */  lw         $s3, 0x38($sp)
/* 813B4 80090BB4 1800B2AF */  sw         $s2, 0x18($sp)
/* 813B8 80090BB8 2190E000 */  addu       $s2, $a3, $zero
/* 813BC 80090BBC 2000BFAF */  sw         $ra, 0x20($sp)
/* 813C0 80090BC0 0A47020C */  jal        _G2Anim_FindController
/* 813C4 80090BC4 1000B0AF */   sw        $s0, 0x10($sp)
/* 813C8 80090BC8 21804000 */  addu       $s0, $v0, $zero
/* 813CC 80090BCC 21200002 */  addu       $a0, $s0, $zero
/* 813D0 80090BD0 21282002 */  addu       $a1, $s1, $zero
/* 813D4 80090BD4 A047020C */  jal        _G2AnimController_GetCurrentInterpQuat
/* 813D8 80090BD8 14000626 */   addiu     $a2, $s0, 0x14
/* 813DC 80090BDC 0000438E */  lw         $v1, 0x0($s2)
/* 813E0 80090BE0 0400448E */  lw         $a0, 0x4($s2)
/* 813E4 80090BE4 08000292 */  lbu        $v0, 0x8($s0)
/* 813E8 80090BE8 0C0000A6 */  sh         $zero, 0xC($s0)
/* 813EC 80090BEC 00404234 */  ori        $v0, $v0, 0x4000
/* 813F0 80090BF0 1C0003AE */  sw         $v1, 0x1C($s0)
/* 813F4 80090BF4 200004AE */  sw         $a0, 0x20($s0)
/* 813F8 80090BF8 080002A6 */  sh         $v0, 0x8($s0)
/* 813FC 80090BFC 0A0013A6 */  sh         $s3, 0xA($s0)
/* 81400 80090C00 2000BF8F */  lw         $ra, 0x20($sp)
/* 81404 80090C04 1C00B38F */  lw         $s3, 0x1C($sp)
/* 81408 80090C08 1800B28F */  lw         $s2, 0x18($sp)
/* 8140C 80090C0C 1400B18F */  lw         $s1, 0x14($sp)
/* 81410 80090C10 1000B08F */  lw         $s0, 0x10($sp)
/* 81414 80090C14 0800E003 */  jr         $ra
/* 81418 80090C18 2800BD27 */   addiu     $sp, $sp, 0x28
.size G2Anim_SetInterpController_Quat, . - G2Anim_SetInterpController_Quat
