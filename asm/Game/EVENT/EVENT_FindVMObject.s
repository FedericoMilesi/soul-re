.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_FindVMObject
/* 5858C 80067D8C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 58590 80067D90 2000B4AF */  sw         $s4, 0x20($sp)
/* 58594 80067D94 21A0A000 */  addu       $s4, $a1, $zero
/* 58598 80067D98 2400BFAF */  sw         $ra, 0x24($sp)
/* 5859C 80067D9C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 585A0 80067DA0 1800B2AF */  sw         $s2, 0x18($sp)
/* 585A4 80067DA4 1400B1AF */  sw         $s1, 0x14($sp)
/* 585A8 80067DA8 1000B0AF */  sw         $s0, 0x10($sp)
/* 585AC 80067DAC 0800918C */  lw         $s1, 0x8($a0)
/* 585B0 80067DB0 21900000 */  addu       $s2, $zero, $zero
/* 585B4 80067DB4 0800228E */  lw         $v0, 0x8($s1)
/* 585B8 80067DB8 00000000 */  nop
/* 585BC 80067DBC 12004018 */  blez       $v0, .L80067E08
/* 585C0 80067DC0 21984002 */   addu      $s3, $s2, $zero
/* 585C4 80067DC4 21804002 */  addu       $s0, $s2, $zero
.L80067DC8:
/* 585C8 80067DC8 0C00228E */  lw         $v0, 0xC($s1)
/* 585CC 80067DCC 00000000 */  nop
/* 585D0 80067DD0 21100202 */  addu       $v0, $s0, $v0
/* 585D4 80067DD4 3800448C */  lw         $a0, 0x38($v0)
/* 585D8 80067DD8 1CD2010C */  jal        strcmpi
/* 585DC 80067DDC 21288002 */   addu      $a1, $s4, $zero
/* 585E0 80067DE0 04004014 */  bnez       $v0, .L80067DF4
/* 585E4 80067DE4 01005226 */   addiu     $s2, $s2, 0x1
/* 585E8 80067DE8 0C00228E */  lw         $v0, 0xC($s1)
/* 585EC 80067DEC 829F0108 */  j          .L80067E08
/* 585F0 80067DF0 21985000 */   addu      $s3, $v0, $s0
.L80067DF4:
/* 585F4 80067DF4 0800228E */  lw         $v0, 0x8($s1)
/* 585F8 80067DF8 00000000 */  nop
/* 585FC 80067DFC 2A104202 */  slt        $v0, $s2, $v0
/* 58600 80067E00 F1FF4014 */  bnez       $v0, .L80067DC8
/* 58604 80067E04 3C001026 */   addiu     $s0, $s0, 0x3C
.L80067E08:
/* 58608 80067E08 21106002 */  addu       $v0, $s3, $zero
/* 5860C 80067E0C 2400BF8F */  lw         $ra, 0x24($sp)
/* 58610 80067E10 2000B48F */  lw         $s4, 0x20($sp)
/* 58614 80067E14 1C00B38F */  lw         $s3, 0x1C($sp)
/* 58618 80067E18 1800B28F */  lw         $s2, 0x18($sp)
/* 5861C 80067E1C 1400B18F */  lw         $s1, 0x14($sp)
/* 58620 80067E20 1000B08F */  lw         $s0, 0x10($sp)
/* 58624 80067E24 0800E003 */  jr         $ra
/* 58628 80067E28 2800BD27 */   addiu     $sp, $sp, 0x28
.size EVENT_FindVMObject, . - EVENT_FindVMObject
