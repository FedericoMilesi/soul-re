.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_AnimCallback
/* 70774 8007FF74 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 70778 8007FF78 1800B0AF */  sw         $s0, 0x18($sp)
/* 7077C 8007FF7C 2180E000 */  addu       $s0, $a3, $zero
/* 70780 8007FF80 3400A78F */  lw         $a3, 0x34($sp)
/* 70784 8007FF84 02000224 */  addiu      $v0, $zero, 0x2
/* 70788 8007FF88 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7078C 8007FF8C 6C01E88C */  lw         $t0, 0x16C($a3)
/* 70790 8007FF90 1500C210 */  beq        $a2, $v0, .L8007FFE8
/* 70794 8007FF94 0300C22C */   sltiu     $v0, $a2, 0x3
/* 70798 8007FF98 05004010 */  beqz       $v0, .L8007FFB0
/* 7079C 8007FF9C 01000224 */   addiu     $v0, $zero, 0x1
/* 707A0 8007FFA0 0800C210 */  beq        $a2, $v0, .L8007FFC4
/* 707A4 8007FFA4 FFFB033C */   lui       $v1, (0xFBFFFFFF >> 16)
/* 707A8 8007FFA8 FFFF0108 */  j          .L8007FFFC
/* 707AC 8007FFAC 00000000 */   nop
.L8007FFB0:
/* 707B0 8007FFB0 04000224 */  addiu      $v0, $zero, 0x4
/* 707B4 8007FFB4 1700C210 */  beq        $a2, $v0, .L80080014
/* 707B8 8007FFB8 21100002 */   addu      $v0, $s0, $zero
/* 707BC 8007FFBC FFFF0108 */  j          .L8007FFFC
/* 707C0 8007FFC0 00000000 */   nop
.L8007FFC4:
/* 707C4 8007FFC4 1800E28C */  lw         $v0, 0x18($a3)
/* 707C8 8007FFC8 00000000 */  nop
/* 707CC 8007FFCC 10004234 */  ori        $v0, $v0, 0x10
/* 707D0 8007FFD0 1800E2AC */  sw         $v0, 0x18($a3)
/* 707D4 8007FFD4 0000028D */  lw         $v0, 0x0($t0)
/* 707D8 8007FFD8 FFFF6334 */  ori        $v1, $v1, (0xFBFFFFFF & 0xFFFF)
/* 707DC 8007FFDC 24104300 */  and        $v0, $v0, $v1
/* 707E0 8007FFE0 04000208 */  j          .L80080010
/* 707E4 8007FFE4 000002AD */   sw        $v0, 0x0($t0)
.L8007FFE8:
/* 707E8 8007FFE8 1800E28C */  lw         $v0, 0x18($a3)
/* 707EC 8007FFEC 00000000 */  nop
/* 707F0 8007FFF0 02004234 */  ori        $v0, $v0, 0x2
/* 707F4 8007FFF4 04000208 */  j          .L80080010
/* 707F8 8007FFF8 1800E2AC */   sw        $v0, 0x18($a3)
.L8007FFFC:
/* 707FC 8007FFFC 3000A28F */  lw         $v0, 0x30($sp)
/* 70800 80080000 1400A7AF */  sw         $a3, 0x14($sp)
/* 70804 80080004 21380002 */  addu       $a3, $s0, $zero
/* 70808 80080008 72D6000C */  jal        INSTANCE_DefaultAnimCallback
/* 7080C 8008000C 1000A2AF */   sw        $v0, 0x10($sp)
.L80080010:
/* 70810 80080010 21100002 */  addu       $v0, $s0, $zero
.L80080014:
/* 70814 80080014 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 70818 80080018 1800B08F */  lw         $s0, 0x18($sp)
/* 7081C 8008001C 0800E003 */  jr         $ra
/* 70820 80080020 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_AnimCallback, . - MON_AnimCallback
