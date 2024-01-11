.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_HashName
/* 285D4 80037DD4 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 285D8 80037DD8 2400B5AF */  sw         $s5, 0x24($sp)
/* 285DC 80037DDC 21A80000 */  addu       $s5, $zero, $zero
/* 285E0 80037DE0 2800B6AF */  sw         $s6, 0x28($sp)
/* 285E4 80037DE4 21B0A002 */  addu       $s6, $s5, $zero
/* 285E8 80037DE8 2000B4AF */  sw         $s4, 0x20($sp)
/* 285EC 80037DEC 21A0A002 */  addu       $s4, $s5, $zero
/* 285F0 80037DF0 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 285F4 80037DF4 21B8A002 */  addu       $s7, $s5, $zero
/* 285F8 80037DF8 3400BFAF */  sw         $ra, 0x34($sp)
/* 285FC 80037DFC 3000BEAF */  sw         $fp, 0x30($sp)
/* 28600 80037E00 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 28604 80037E04 1800B2AF */  sw         $s2, 0x18($sp)
/* 28608 80037E08 1400B1AF */  sw         $s1, 0x14($sp)
/* 2860C 80037E0C 1000B0AF */  sw         $s0, 0x10($sp)
/* 28610 80037E10 ACF4020C */  jal        func_800BD2B0
/* 28614 80037E14 3800A4AF */   sw        $a0, 0x38($sp)
/* 28618 80037E18 FFFF5224 */  addiu      $s2, $v0, -0x1
/* 2861C 80037E1C 3800A48F */  lw         $a0, 0x38($sp)
/* 28620 80037E20 0CF4020C */  jal        func_800BD030
/* 28624 80037E24 2E000524 */   addiu     $a1, $zero, 0x2E
/* 28628 80037E28 21984000 */  addu       $s3, $v0, $zero
/* 2862C 80037E2C 13006012 */  beqz       $s3, .L80037E7C
/* 28630 80037E30 21F0E002 */   addu      $fp, $s7, $zero
/* 28634 80037E34 01007326 */  addiu      $s3, $s3, 0x1
/* 28638 80037E38 2180A002 */  addu       $s0, $s5, $zero
/* 2863C 80037E3C E8939127 */  addiu      $s1, $gp, %gp_rel(HashExtensions)
.L80037E40:
/* 28640 80037E40 21206002 */  addu       $a0, $s3, $zero
/* 28644 80037E44 1CD2010C */  jal        strcmpi
/* 28648 80037E48 21282002 */   addu      $a1, $s1, $zero
/* 2864C 80037E4C 03004014 */  bnez       $v0, .L80037E5C
/* 28650 80037E50 00000000 */   nop
/* 28654 80037E54 9BDF0008 */  j          .L80037E6C
/* 28658 80037E58 21B80002 */   addu      $s7, $s0, $zero
.L80037E5C:
/* 2865C 80037E5C 01001026 */  addiu      $s0, $s0, 0x1
/* 28660 80037E60 0700022A */  slti       $v0, $s0, 0x7
/* 28664 80037E64 F6FF4014 */  bnez       $v0, .L80037E40
/* 28668 80037E68 04003126 */   addiu     $s1, $s1, 0x4
.L80037E6C:
/* 2866C 80037E6C 0700022A */  slti       $v0, $s0, 0x7
/* 28670 80037E70 03004010 */  beqz       $v0, .L80037E80
/* 28674 80037E74 2A105E02 */   slt       $v0, $s2, $fp
/* 28678 80037E78 FCFF5226 */  addiu      $s2, $s2, -0x4
.L80037E7C:
/* 2867C 80037E7C 2A105E02 */  slt        $v0, $s2, $fp
.L80037E80:
/* 28680 80037E80 18004014 */  bnez       $v0, .L80037EE4
/* 28684 80037E84 C0161400 */   sll       $v0, $s4, 27
/* 28688 80037E88 5C000424 */  addiu      $a0, $zero, 0x5C
.L80037E8C:
/* 2868C 80037E8C 3800A68F */  lw         $a2, 0x38($sp)
/* 28690 80037E90 00000000 */  nop
/* 28694 80037E94 2110D200 */  addu       $v0, $a2, $s2
/* 28698 80037E98 00004390 */  lbu        $v1, 0x0($v0)
/* 2869C 80037E9C 00000000 */  nop
/* 286A0 80037EA0 0C006410 */  beq        $v1, $a0, .L80037ED4
/* 286A4 80037EA4 9FFF6224 */   addiu     $v0, $v1, -0x61
/* 286A8 80037EA8 1A00422C */  sltiu      $v0, $v0, 0x1A
/* 286AC 80037EAC 02004010 */  beqz       $v0, .L80037EB8
/* 286B0 80037EB0 00000000 */   nop
/* 286B4 80037EB4 DF006330 */  andi       $v1, $v1, 0xDF
.L80037EB8:
/* 286B8 80037EB8 E6FF6324 */  addiu      $v1, $v1, -0x1A
/* 286BC 80037EBC FF006230 */  andi       $v0, $v1, 0xFF
/* 286C0 80037EC0 18005400 */  mult       $v0, $s4
/* 286C4 80037EC4 21A8A202 */  addu       $s5, $s5, $v0
/* 286C8 80037EC8 01009426 */  addiu      $s4, $s4, 0x1
/* 286CC 80037ECC 12300000 */  mflo       $a2
/* 286D0 80037ED0 26B0C602 */  xor        $s6, $s6, $a2
.L80037ED4:
/* 286D4 80037ED4 FFFF5226 */  addiu      $s2, $s2, -0x1
/* 286D8 80037ED8 2A105E02 */  slt        $v0, $s2, $fp
/* 286DC 80037EDC EBFF4010 */  beqz       $v0, .L80037E8C
/* 286E0 80037EE0 C0161400 */   sll       $v0, $s4, 27
.L80037EE4:
/* 286E4 80037EE4 C01B1500 */  sll        $v1, $s5, 15
/* 286E8 80037EE8 25104300 */  or         $v0, $v0, $v1
/* 286EC 80037EEC C0181600 */  sll        $v1, $s6, 3
/* 286F0 80037EF0 25104300 */  or         $v0, $v0, $v1
/* 286F4 80037EF4 25105700 */  or         $v0, $v0, $s7
/* 286F8 80037EF8 3400BF8F */  lw         $ra, 0x34($sp)
/* 286FC 80037EFC 3000BE8F */  lw         $fp, 0x30($sp)
/* 28700 80037F00 2C00B78F */  lw         $s7, 0x2C($sp)
/* 28704 80037F04 2800B68F */  lw         $s6, 0x28($sp)
/* 28708 80037F08 2400B58F */  lw         $s5, 0x24($sp)
/* 2870C 80037F0C 2000B48F */  lw         $s4, 0x20($sp)
/* 28710 80037F10 1C00B38F */  lw         $s3, 0x1C($sp)
/* 28714 80037F14 1800B28F */  lw         $s2, 0x18($sp)
/* 28718 80037F18 1400B18F */  lw         $s1, 0x14($sp)
/* 2871C 80037F1C 1000B08F */  lw         $s0, 0x10($sp)
/* 28720 80037F20 0800E003 */  jr         $ra
/* 28724 80037F24 3800BD27 */   addiu     $sp, $sp, 0x38
.size LOAD_HashName, . - LOAD_HashName
