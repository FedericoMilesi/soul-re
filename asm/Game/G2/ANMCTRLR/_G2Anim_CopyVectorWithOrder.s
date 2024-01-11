.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_CopyVectorWithOrder
/* 81E9C 8009169C 01000224 */  addiu      $v0, $zero, 0x1
/* 81EA0 800916A0 0C00C210 */  beq        $a2, $v0, .L800916D4
/* 81EA4 800916A4 15000224 */   addiu     $v0, $zero, 0x15
/* 81EA8 800916A8 1300C214 */  bne        $a2, $v0, .L800916F8
/* 81EAC 800916AC 00000000 */   nop
/* 81EB0 800916B0 00008294 */  lhu        $v0, 0x0($a0)
/* 81EB4 800916B4 00000000 */  nop
/* 81EB8 800916B8 0000A2A4 */  sh         $v0, 0x0($a1)
/* 81EBC 800916BC 02008294 */  lhu        $v0, 0x2($a0)
/* 81EC0 800916C0 00000000 */  nop
/* 81EC4 800916C4 0200A2A4 */  sh         $v0, 0x2($a1)
/* 81EC8 800916C8 04008294 */  lhu        $v0, 0x4($a0)
/* 81ECC 800916CC BD450208 */  j          .L800916F4
/* 81ED0 800916D0 0600A6A4 */   sh        $a2, 0x6($a1)
.L800916D4:
/* 81ED4 800916D4 04008294 */  lhu        $v0, 0x4($a0)
/* 81ED8 800916D8 00000000 */  nop
/* 81EDC 800916DC 0000A2A4 */  sh         $v0, 0x0($a1)
/* 81EE0 800916E0 02008294 */  lhu        $v0, 0x2($a0)
/* 81EE4 800916E4 00000000 */  nop
/* 81EE8 800916E8 0200A2A4 */  sh         $v0, 0x2($a1)
/* 81EEC 800916EC 00008294 */  lhu        $v0, 0x0($a0)
/* 81EF0 800916F0 0600A6A4 */  sh         $a2, 0x6($a1)
.L800916F4:
/* 81EF4 800916F4 0400A2A4 */  sh         $v0, 0x4($a1)
.L800916F8:
/* 81EF8 800916F8 0800E003 */  jr         $ra
/* 81EFC 800916FC 00000000 */   nop
.size _G2Anim_CopyVectorWithOrder, . - _G2Anim_CopyVectorWithOrder
