.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdReadSync
/* B65C0 800C5DC0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B65C4 800C5DC4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B65C8 800C5DC8 21988000 */  addu       $s3, $a0, $zero
/* B65CC 800C5DCC 2000B4AF */  sw         $s4, 0x20($sp)
/* B65D0 800C5DD0 21A0A000 */  addu       $s4, $a1, $zero
/* B65D4 800C5DD4 1400B1AF */  sw         $s1, 0x14($sp)
/* B65D8 800C5DD8 0D80113C */  lui        $s1, %hi(CD_intstr + 0x290)
/* B65DC 800C5DDC B8EC3126 */  addiu      $s1, $s1, %lo(CD_intstr + 0x290)
/* B65E0 800C5DE0 1800B2AF */  sw         $s2, 0x18($sp)
/* B65E4 800C5DE4 08003226 */  addiu      $s2, $s1, 0x8
/* B65E8 800C5DE8 2400BFAF */  sw         $ra, 0x24($sp)
/* B65EC 800C5DEC 1000B0AF */  sw         $s0, 0x10($sp)
.L800C5DF0:
/* B65F0 800C5DF0 5EF2020C */  jal        VSync
/* B65F4 800C5DF4 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B65F8 800C5DF8 0000238E */  lw         $v1, 0x0($s1)
/* B65FC 800C5DFC 00000000 */  nop
/* B6600 800C5E00 B0046324 */  addiu      $v1, $v1, 0x4B0
/* B6604 800C5E04 2A186200 */  slt        $v1, $v1, $v0
/* B6608 800C5E08 13006014 */  bnez       $v1, .L800C5E58
/* B660C 800C5E0C FFFF1024 */   addiu     $s0, $zero, -0x1
/* B6610 800C5E10 F8FF228E */  lw         $v0, -0x8($s1)
/* B6614 800C5E14 00000000 */  nop
/* B6618 800C5E18 09004004 */  bltz       $v0, .L800C5E40
/* B661C 800C5E1C 00000000 */   nop
/* B6620 800C5E20 5EF2020C */  jal        VSync
/* B6624 800C5E24 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B6628 800C5E28 FCFF238E */  lw         $v1, -0x4($s1)
/* B662C 800C5E2C 00000000 */  nop
/* B6630 800C5E30 3C006324 */  addiu      $v1, $v1, 0x3C
/* B6634 800C5E34 2A186200 */  slt        $v1, $v1, $v0
/* B6638 800C5E38 06006010 */  beqz       $v1, .L800C5E54
/* B663C 800C5E3C 00000000 */   nop
.L800C5E40:
/* B6640 800C5E40 8F16030C */  jal        func_800C5A3C
/* B6644 800C5E44 01000424 */   addiu     $a0, $zero, 0x1
/* B6648 800C5E48 E4FF308E */  lw         $s0, -0x1C($s1)
/* B664C 800C5E4C 96170308 */  j          .L800C5E58
/* B6650 800C5E50 00000000 */   nop
.L800C5E54:
/* B6654 800C5E54 F8FF308E */  lw         $s0, -0x8($s1)
.L800C5E58:
/* B6658 800C5E58 09006016 */  bnez       $s3, .L800C5E80
/* B665C 800C5E5C 01000424 */   addiu     $a0, $zero, 0x1
/* B6660 800C5E60 0000428E */  lw         $v0, 0x0($s2)
/* B6664 800C5E64 00000000 */  nop
/* B6668 800C5E68 03004010 */  beqz       $v0, .L800C5E78
/* B666C 800C5E6C 00000000 */   nop
/* B6670 800C5E70 DFFF0012 */  beqz       $s0, .L800C5DF0
/* B6674 800C5E74 00000000 */   nop
.L800C5E78:
/* B6678 800C5E78 DDFF001E */  bgtz       $s0, .L800C5DF0
/* B667C 800C5E7C 01000424 */   addiu     $a0, $zero, 0x1
.L800C5E80:
/* B6680 800C5E80 3EF8020C */  jal        CdReady
/* B6684 800C5E84 21288002 */   addu      $a1, $s4, $zero
/* B6688 800C5E88 0000428E */  lw         $v0, 0x0($s2)
/* B668C 800C5E8C 00000000 */  nop
/* B6690 800C5E90 04004010 */  beqz       $v0, .L800C5EA4
/* B6694 800C5E94 21100002 */   addu      $v0, $s0, $zero
/* B6698 800C5E98 02000016 */  bnez       $s0, .L800C5EA4
/* B669C 800C5E9C 01001024 */   addiu     $s0, $zero, 0x1
/* B66A0 800C5EA0 21100002 */  addu       $v0, $s0, $zero
.L800C5EA4:
/* B66A4 800C5EA4 2400BF8F */  lw         $ra, 0x24($sp)
/* B66A8 800C5EA8 2000B48F */  lw         $s4, 0x20($sp)
/* B66AC 800C5EAC 1C00B38F */  lw         $s3, 0x1C($sp)
/* B66B0 800C5EB0 1800B28F */  lw         $s2, 0x18($sp)
/* B66B4 800C5EB4 1400B18F */  lw         $s1, 0x14($sp)
/* B66B8 800C5EB8 1000B08F */  lw         $s0, 0x10($sp)
/* B66BC 800C5EBC 0800E003 */  jr         $ra
/* B66C0 800C5EC0 2800BD27 */   addiu     $sp, $sp, 0x28
.size CdReadSync, . - CdReadSync
