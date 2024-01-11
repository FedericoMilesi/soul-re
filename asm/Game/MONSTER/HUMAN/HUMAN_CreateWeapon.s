.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_CreateWeapon
/* 6D5E0 8007CDE0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6D5E4 8007CDE4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6D5E8 8007CDE8 21888000 */  addu       $s1, $a0, $zero
/* 6D5EC 8007CDEC 0D80023C */  lui        $v0, %hi(objectAccess)
/* 6D5F0 8007CDF0 3CA24224 */  addiu      $v0, $v0, %lo(objectAccess)
/* 6D5F4 8007CDF4 C0280500 */  sll        $a1, $a1, 3
/* 6D5F8 8007CDF8 2128A200 */  addu       $a1, $a1, $v0
/* 6D5FC 8007CDFC 2400BFAF */  sw         $ra, 0x24($sp)
/* 6D600 8007CE00 2000B2AF */  sw         $s2, 0x20($sp)
/* 6D604 8007CE04 1800B0AF */  sw         $s0, 0x18($sp)
/* 6D608 8007CE08 0400A58C */  lw         $a1, 0x4($a1)
/* 6D60C 8007CE0C 00000000 */  nop
/* 6D610 8007CE10 1600A010 */  beqz       $a1, .L8007CE6C
/* 6D614 8007CE14 2190C000 */   addu      $s2, $a2, $zero
/* 6D618 8007CE18 ACCF000C */  jal        INSTANCE_BirthObject
/* 6D61C 8007CE1C 21300000 */   addu      $a2, $zero, $zero
/* 6D620 8007CE20 21804000 */  addu       $s0, $v0, $zero
/* 6D624 8007CE24 11000012 */  beqz       $s0, .L8007CE6C
/* 6D628 8007CE28 21200000 */   addu      $a0, $zero, $zero
/* 6D62C 8007CE2C 21288000 */  addu       $a1, $a0, $zero
/* 6D630 8007CE30 21308000 */  addu       $a2, $a0, $zero
/* 6D634 8007CE34 21382002 */  addu       $a3, $s1, $zero
/* 6D638 8007CE38 21C4010C */  jal        SetObjectData
/* 6D63C 8007CE3C 1000B2AF */   sw        $s2, 0x10($sp)
/* 6D640 8007CE40 21200002 */  addu       $a0, $s0, $zero
/* 6D644 8007CE44 8000053C */  lui        $a1, (0x800002 >> 16)
/* 6D648 8007CE48 0200A534 */  ori        $a1, $a1, (0x800002 & 0xFFFF)
/* 6D64C 8007CE4C A1D1000C */  jal        INSTANCE_Post
/* 6D650 8007CE50 21304000 */   addu      $a2, $v0, $zero
/* 6D654 8007CE54 21100002 */  addu       $v0, $s0, $zero
/* 6D658 8007CE58 1800438C */  lw         $v1, 0x18($v0)
/* 6D65C 8007CE5C 0200043C */  lui        $a0, (0x20000 >> 16)
/* 6D660 8007CE60 25186400 */  or         $v1, $v1, $a0
/* 6D664 8007CE64 A7F30108 */  j          .L8007CE9C
/* 6D668 8007CE68 180043AC */   sw        $v1, 0x18($v0)
.L8007CE6C:
/* 6D66C 8007CE6C 0020053C */  lui        $a1, (0x20000080 >> 16)
/* 6D670 8007CE70 8000A534 */  ori        $a1, $a1, (0x20000080 & 0xFFFF)
/* 6D674 8007CE74 21100000 */  addu       $v0, $zero, $zero
/* 6D678 8007CE78 0880033C */  lui        $v1, %hi(HUMAN_WaitForWeapon)
/* 6D67C 8007CE7C 70CD6324 */  addiu      $v1, $v1, %lo(HUMAN_WaitForWeapon)
/* 6D680 8007CE80 080123AE */  sw         $v1, 0x108($s1)
/* 6D684 8007CE84 1400238E */  lw         $v1, 0x14($s1)
/* 6D688 8007CE88 1800248E */  lw         $a0, 0x18($s1)
/* 6D68C 8007CE8C 00086334 */  ori        $v1, $v1, 0x800
/* 6D690 8007CE90 25208500 */  or         $a0, $a0, $a1
/* 6D694 8007CE94 140023AE */  sw         $v1, 0x14($s1)
/* 6D698 8007CE98 180024AE */  sw         $a0, 0x18($s1)
.L8007CE9C:
/* 6D69C 8007CE9C 2400BF8F */  lw         $ra, 0x24($sp)
/* 6D6A0 8007CEA0 2000B28F */  lw         $s2, 0x20($sp)
/* 6D6A4 8007CEA4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6D6A8 8007CEA8 1800B08F */  lw         $s0, 0x18($sp)
/* 6D6AC 8007CEAC 0800E003 */  jr         $ra
/* 6D6B0 8007CEB0 2800BD27 */   addiu     $sp, $sp, 0x28
.size HUMAN_CreateWeapon, . - HUMAN_CreateWeapon
