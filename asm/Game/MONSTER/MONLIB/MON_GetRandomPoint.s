.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_GetRandomPoint
/* 716B4 80080EB4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 716B8 80080EB8 1800B2AF */  sw         $s2, 0x18($sp)
/* 716BC 80080EBC 21908000 */  addu       $s2, $a0, $zero
/* 716C0 80080EC0 1400B1AF */  sw         $s1, 0x14($sp)
/* 716C4 80080EC4 2188A000 */  addu       $s1, $a1, $zero
/* 716C8 80080EC8 1000B0AF */  sw         $s0, 0x10($sp)
/* 716CC 80080ECC 2180C000 */  addu       $s0, $a2, $zero
/* 716D0 80080ED0 2000BFAF */  sw         $ra, 0x20($sp)
/* 716D4 80080ED4 3AF2020C */  jal        rand
/* 716D8 80080ED8 1C00B3AF */   sw        $s3, 0x1C($sp)
/* 716DC 80080EDC 00841000 */  sll        $s0, $s0, 16
/* 716E0 80080EE0 03841000 */  sra        $s0, $s0, 16
/* 716E4 80080EE4 1A005000 */  div        $zero, $v0, $s0
/* 716E8 80080EE8 10980000 */  mfhi       $s3
/* 716EC 80080EEC 3AF2020C */  jal        rand
/* 716F0 80080EF0 00000000 */   nop
/* 716F4 80080EF4 21804000 */  addu       $s0, $v0, $zero
/* 716F8 80080EF8 DCE4010C */  jal        rcos
/* 716FC 80080EFC 21200002 */   addu      $a0, $s0, $zero
/* 71700 80080F00 18006202 */  mult       $s3, $v0
/* 71704 80080F04 21200002 */  addu       $a0, $s0, $zero
/* 71708 80080F08 00002296 */  lhu        $v0, 0x0($s1)
/* 7170C 80080F0C 12180000 */  mflo       $v1
/* 71710 80080F10 031B0300 */  sra        $v1, $v1, 12
/* 71714 80080F14 21104300 */  addu       $v0, $v0, $v1
/* 71718 80080F18 D0E4010C */  jal        rsin
/* 7171C 80080F1C 000042A6 */   sh        $v0, 0x0($s2)
/* 71720 80080F20 18006202 */  mult       $s3, $v0
/* 71724 80080F24 02002296 */  lhu        $v0, 0x2($s1)
/* 71728 80080F28 12180000 */  mflo       $v1
/* 7172C 80080F2C 031B0300 */  sra        $v1, $v1, 12
/* 71730 80080F30 21104300 */  addu       $v0, $v0, $v1
/* 71734 80080F34 020042A6 */  sh         $v0, 0x2($s2)
/* 71738 80080F38 04002296 */  lhu        $v0, 0x4($s1)
/* 7173C 80080F3C 00000000 */  nop
/* 71740 80080F40 040042A6 */  sh         $v0, 0x4($s2)
/* 71744 80080F44 2000BF8F */  lw         $ra, 0x20($sp)
/* 71748 80080F48 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7174C 80080F4C 1800B28F */  lw         $s2, 0x18($sp)
/* 71750 80080F50 1400B18F */  lw         $s1, 0x14($sp)
/* 71754 80080F54 1000B08F */  lw         $s0, 0x10($sp)
/* 71758 80080F58 0800E003 */  jr         $ra
/* 7175C 80080F5C 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_GetRandomPoint, . - MON_GetRandomPoint
