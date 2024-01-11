.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80078CF4
/* 694F4 80078CF4 04009984 */  lh         $t9, 0x4($a0)
/* 694F8 80078CF8 02009884 */  lh         $t8, 0x2($a0)
/* 694FC 80078CFC 00008F84 */  lh         $t7, 0x0($a0)
/* 69500 80078D00 0C80033C */  lui        $v1, (0x800CABF4 >> 16)
/* 69504 80078D04 F4AB6334 */  ori        $v1, $v1, (0x800CABF4 & 0xFFFF)
/* 69508 80078D08 FF072833 */  andi       $t0, $t9, 0x7FF
/* 6950C 80078D0C 40400800 */  sll        $t0, $t0, 1
/* 69510 80078D10 21400301 */  addu       $t0, $t0, $v1
/* 69514 80078D14 00000D85 */  lh         $t5, 0x0($t0)
/* 69518 80078D18 00080A85 */  lh         $t2, 0x800($t0)
/* 6951C 80078D1C 00082B33 */  andi       $t3, $t9, 0x800
/* 69520 80078D20 03006011 */  beqz       $t3, .L80078D30
/* 69524 80078D24 00000000 */   nop
/* 69528 80078D28 22680D00 */  sub        $t5, $zero, $t5 # handwritten instruction
/* 6952C 80078D2C 22500A00 */  sub        $t2, $zero, $t2 # handwritten instruction
.L80078D30:
/* 69530 80078D30 25600F03 */  or         $t4, $t8, $t7
/* 69534 80078D34 E4FF8011 */  beqz       $t4, .L80078CC8
/* 69538 80078D38 00000000 */   nop
/* 6953C 80078D3C FF070833 */  andi       $t0, $t8, 0x7FF
/* 69540 80078D40 40400800 */  sll        $t0, $t0, 1
/* 69544 80078D44 21400301 */  addu       $t0, $t0, $v1
/* 69548 80078D48 00000C85 */  lh         $t4, 0x0($t0)
/* 6954C 80078D4C 00080985 */  lh         $t1, 0x800($t0)
/* 69550 80078D50 00080B33 */  andi       $t3, $t8, 0x800
/* 69554 80078D54 03006011 */  beqz       $t3, .L80078D64
/* 69558 80078D58 00000000 */   nop
/* 6955C 80078D5C 22480900 */  sub        $t1, $zero, $t1 # handwritten instruction
/* 69560 80078D60 22600C00 */  sub        $t4, $zero, $t4 # handwritten instruction
.L80078D64:
/* 69564 80078D64 FF07E831 */  andi       $t0, $t7, 0x7FF
/* 69568 80078D68 40400800 */  sll        $t0, $t0, 1
/* 6956C 80078D6C 21400301 */  addu       $t0, $t0, $v1
/* 69570 80078D70 00000B85 */  lh         $t3, 0x0($t0)
/* 69574 80078D74 00080885 */  lh         $t0, 0x800($t0)
/* 69578 80078D78 0008EE31 */  andi       $t6, $t7, 0x800
/* 6957C 80078D7C 0300C011 */  beqz       $t6, .L80078D8C
/* 69580 80078D80 00000000 */   nop
/* 69584 80078D84 22580B00 */  sub        $t3, $zero, $t3 # handwritten instruction
/* 69588 80078D88 22400800 */  sub        $t0, $zero, $t0 # handwritten instruction
.L80078D8C:
/* 6958C 80078D8C 00488948 */  mtc2       $t1, $9 # handwritten instruction
/* 69590 80078D90 00508A48 */  mtc2       $t2, $10 # handwritten instruction
/* 69594 80078D94 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 69598 80078D98 00408848 */  mtc2       $t0, $8 # handwritten instruction
/* 6959C 80078D9C 18002A01 */  mult       $t1, $t2
/* 695A0 80078DA0 00000000 */  nop
/* 695A4 80078DA4 3D00984B */  GPF        1
/* 695A8 80078DA8 0400ACA4 */  sh         $t4, 0x4($a1)
/* 695AC 80078DAC 00500E48 */  mfc2       $t6, $10 # handwritten instruction
/* 695B0 80078DB0 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 695B4 80078DB4 00580F48 */  mfc2       $t7, $11 # handwritten instruction
/* 695B8 80078DB8 1000A4A4 */  sh         $a0, 0x10($a1)
/* 695BC 80078DBC 12100000 */  mflo       $v0
/* 695C0 80078DC0 00488948 */  mtc2       $t1, $9 # handwritten instruction
/* 695C4 80078DC4 00508A48 */  mtc2       $t2, $10 # handwritten instruction
/* 695C8 80078DC8 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 695CC 80078DCC 00408B48 */  mtc2       $t3, $8 # handwritten instruction
/* 695D0 80078DD0 18002D01 */  mult       $t1, $t5
/* 695D4 80078DD4 00000000 */  nop
/* 695D8 80078DD8 3D00984B */  GPF        1
/* 695DC 80078DDC 03130200 */  sra        $v0, $v0, 12
/* 695E0 80078DE0 0000A2A4 */  sh         $v0, 0x0($a1)
/* 695E4 80078DE4 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 695E8 80078DE8 00501848 */  mfc2       $t8, $10 # handwritten instruction
/* 695EC 80078DEC 00581948 */  mfc2       $t9, $11 # handwritten instruction
/* 695F0 80078DF0 22200400 */  sub        $a0, $zero, $a0 # handwritten instruction
/* 695F4 80078DF4 0A00A4A4 */  sh         $a0, 0xA($a1)
/* 695F8 80078DF8 12100000 */  mflo       $v0
/* 695FC 80078DFC 00488E48 */  mtc2       $t6, $9 # handwritten instruction
/* 69600 80078E00 00508F48 */  mtc2       $t7, $10 # handwritten instruction
/* 69604 80078E04 00589848 */  mtc2       $t8, $11 # handwritten instruction
/* 69608 80078E08 00408C48 */  mtc2       $t4, $8 # handwritten instruction
/* 6960C 80078E0C 18002C03 */  mult       $t9, $t4
/* 69610 80078E10 00000000 */  nop
/* 69614 80078E14 3D00984B */  GPF        1
/* 69618 80078E18 03130200 */  sra        $v0, $v0, 12
/* 6961C 80078E1C 22100200 */  sub        $v0, $zero, $v0 # handwritten instruction
/* 69620 80078E20 0200A2A4 */  sh         $v0, 0x2($a1)
/* 69624 80078E24 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 69628 80078E28 00500848 */  mfc2       $t0, $10 # handwritten instruction
/* 6962C 80078E2C 00580948 */  mfc2       $t1, $11 # handwritten instruction
/* 69630 80078E30 12100000 */  mflo       $v0
/* 69634 80078E34 03130200 */  sra        $v0, $v0, 12
/* 69638 80078E38 20502F01 */  add        $t2, $t1, $t7 # handwritten instruction
/* 6963C 80078E3C 22582403 */  sub        $t3, $t9, $a0 # handwritten instruction
/* 69640 80078E40 2260C201 */  sub        $t4, $t6, $v0 # handwritten instruction
/* 69644 80078E44 20681801 */  add        $t5, $t0, $t8 # handwritten instruction
/* 69648 80078E48 0600AAA4 */  sh         $t2, 0x6($a1)
/* 6964C 80078E4C 0C00ABA4 */  sh         $t3, 0xC($a1)
/* 69650 80078E50 0800ACA4 */  sh         $t4, 0x8($a1)
/* 69654 80078E54 0E00ADA4 */  sh         $t5, 0xE($a1)
/* 69658 80078E58 0800E003 */  jr         $ra
/* 6965C 80078E5C 00000000 */   nop
.size func_80078CF4, . - func_80078CF4
