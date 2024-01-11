.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetLookFocusAndDistance
/* 919C 8001899C 0000A294 */  lhu        $v0, 0x0($a1)
/* 91A0 800189A0 00000000 */  nop
/* 91A4 800189A4 AA0182A4 */  sh         $v0, 0x1AA($a0)
/* 91A8 800189A8 0400A294 */  lhu        $v0, 0x4($a1)
/* 91AC 800189AC 00000000 */  nop
/* 91B0 800189B0 AC0182A4 */  sh         $v0, 0x1AC($a0)
/* 91B4 800189B4 0800A294 */  lhu        $v0, 0x8($a1)
/* 91B8 800189B8 8EAC86A7 */  sh         $a2, %gp_rel(Camera_lookDist)($gp)
/* 91BC 800189BC 0800E003 */  jr         $ra
/* 91C0 800189C0 AE0182A4 */   sh        $v0, 0x1AE($a0)
.size CAMERA_SetLookFocusAndDistance, . - CAMERA_SetLookFocusAndDistance
