.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _G2AnimController_GetVector
/* 823A0 80091BA0 1400828C */  lw         $v0, 0x14($a0)
/* 823A4 80091BA4 18008394 */  lhu        $v1, 0x18($a0)
/* 823A8 80091BA8 0000A2AC */  sw         $v0, 0x0($a1)
/* 823AC 80091BAC 0400A3A4 */  sh         $v1, 0x4($a1)
/* 823B0 80091BB0 08008294 */  lhu        $v0, 0x8($a0)
/* 823B4 80091BB4 00000000 */  nop
/* 823B8 80091BB8 00404230 */  andi       $v0, $v0, 0x4000
/* 823BC 80091BBC 18004010 */  beqz       $v0, .L80091C20
/* 823C0 80091BC0 1A008224 */   addiu     $v0, $a0, 0x1A
/* 823C4 80091BC4 0C008384 */  lh         $v1, 0xC($a0)
/* 823C8 80091BC8 0000AC94 */  lhu        $t4, 0x0($a1)
/* 823CC 80091BCC 0200AD94 */  lhu        $t5, 0x2($a1)
/* 823D0 80091BD0 0400AE94 */  lhu        $t6, 0x4($a1)
/* 823D4 80091BD4 00C88C48 */  mtc2       $t4, $25 # handwritten instruction
/* 823D8 80091BD8 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 823DC 80091BDC 00D88E48 */  mtc2       $t6, $27 # handwritten instruction
/* 823E0 80091BE0 00004C94 */  lhu        $t4, 0x0($v0)
/* 823E4 80091BE4 02004D94 */  lhu        $t5, 0x2($v0)
/* 823E8 80091BE8 04004E94 */  lhu        $t6, 0x4($v0)
/* 823EC 80091BEC 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 823F0 80091BF0 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 823F4 80091BF4 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 823F8 80091BF8 00408348 */  mtc2       $v1, $8 # handwritten instruction
/* 823FC 80091BFC 00000000 */  nop
/* 82400 80091C00 00000000 */  nop
/* 82404 80091C04 3E00A84B */  GPL        1
/* 82408 80091C08 00C80C48 */  mfc2       $t4, $25 # handwritten instruction
/* 8240C 80091C0C 00D00D48 */  mfc2       $t5, $26 # handwritten instruction
/* 82410 80091C10 00D80E48 */  mfc2       $t6, $27 # handwritten instruction
/* 82414 80091C14 0000ACA4 */  sh         $t4, 0x0($a1)
/* 82418 80091C18 0200ADA4 */  sh         $t5, 0x2($a1)
/* 8241C 80091C1C 0400AEA4 */  sh         $t6, 0x4($a1)
.L80091C20:
/* 82420 80091C20 0800E003 */  jr         $ra
/* 82424 80091C24 00000000 */   nop
.size _G2AnimController_GetVector, . - _G2AnimController_GetVector
