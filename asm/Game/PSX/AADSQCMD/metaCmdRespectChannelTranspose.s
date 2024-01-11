.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdRespectChannelTranspose
/* 46D60 80056560 01000324 */  addiu      $v1, $zero, 0x1
/* 46D64 80056564 3D05A290 */  lbu        $v0, 0x53D($a1)
/* 46D68 80056568 3805A48C */  lw         $a0, 0x538($a1)
/* 46D6C 8005656C 04184300 */  sllv       $v1, $v1, $v0
/* 46D70 80056570 4E058294 */  lhu        $v0, 0x54E($a0)
/* 46D74 80056574 27180300 */  nor        $v1, $zero, $v1
/* 46D78 80056578 24104300 */  and        $v0, $v0, $v1
/* 46D7C 8005657C 0800E003 */  jr         $ra
/* 46D80 80056580 4E0582A4 */   sh        $v0, 0x54E($a0)
.size metaCmdRespectChannelTranspose, . - metaCmdRespectChannelTranspose
