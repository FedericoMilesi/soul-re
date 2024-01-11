.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel draw_menu_item
/* 45D8 80013DD8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 45DC 80013DDC 1800B2AF */  sw         $s2, 0x18($sp)
/* 45E0 80013DE0 2190A000 */  addu       $s2, $a1, $zero
/* 45E4 80013DE4 1000B0AF */  sw         $s0, 0x10($sp)
/* 45E8 80013DE8 2180C000 */  addu       $s0, $a2, $zero
/* 45EC 80013DEC 2000BFAF */  sw         $ra, 0x20($sp)
/* 45F0 80013DF0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 45F4 80013DF4 1400B1AF */  sw         $s1, 0x14($sp)
.L80013DF8:
/* 45F8 80013DF8 684F000C */  jal        find_eol
/* 45FC 80013DFC 21200002 */   addu      $a0, $s0, $zero
/* 4600 80013E00 21884000 */  addu       $s1, $v0, $zero
/* 4604 80013E04 00003392 */  lbu        $s3, 0x0($s1)
/* 4608 80013E08 000020A2 */  sb         $zero, 0x0($s1)
/* 460C 80013E0C 0800428E */  lw         $v0, 0x8($s2)
/* 4610 80013E10 00000000 */  nop
/* 4614 80013E14 0A004010 */  beqz       $v0, .L80013E40
/* 4618 80013E18 00000000 */   nop
/* 461C 80013E1C FBB5000C */  jal        FONT_GetStringWidth
/* 4620 80013E20 21200002 */   addu      $a0, $s0, $zero
/* 4624 80013E24 43100200 */  sra        $v0, $v0, 1
/* 4628 80013E28 00004496 */  lhu        $a0, 0x0($s2)
/* 462C 80013E2C 04004586 */  lh         $a1, 0x4($s2)
/* 4630 80013E30 23208200 */  subu       $a0, $a0, $v0
/* 4634 80013E34 00240400 */  sll        $a0, $a0, 16
/* 4638 80013E38 924F0008 */  j          .L80013E48
/* 463C 80013E3C 03240400 */   sra       $a0, $a0, 16
.L80013E40:
/* 4640 80013E40 00004486 */  lh         $a0, 0x0($s2)
/* 4644 80013E44 04004586 */  lh         $a1, 0x4($s2)
.L80013E48:
/* 4648 80013E48 3CB6000C */  jal        FONT_SetCursor
/* 464C 80013E4C 00000000 */   nop
/* 4650 80013E50 0C8A828F */  lw         $v0, %gp_rel(currentMenu)($gp)
/* 4654 80013E54 00000000 */  nop
/* 4658 80013E58 0000438C */  lw         $v1, 0x0($v0)
/* 465C 80013E5C 06000224 */  addiu      $v0, $zero, 0x6
/* 4660 80013E60 05006210 */  beq        $v1, $v0, .L80013E78
/* 4664 80013E64 00000000 */   nop
/* 4668 80013E68 C3B5000C */  jal        FONT_Print
/* 466C 80013E6C 21200002 */   addu      $a0, $s0, $zero
/* 4670 80013E70 A14F0008 */  j          .L80013E84
/* 4674 80013E74 FF006232 */   andi      $v0, $s3, 0xFF
.L80013E78:
/* 4678 80013E78 E7B5000C */  jal        FONT_Print2
/* 467C 80013E7C 21200002 */   addu      $a0, $s0, $zero
/* 4680 80013E80 FF006232 */  andi       $v0, $s3, 0xFF
.L80013E84:
/* 4684 80013E84 08004010 */  beqz       $v0, .L80013EA8
/* 4688 80013E88 01003026 */   addiu     $s0, $s1, 0x1
/* 468C 80013E8C 000033A2 */  sb         $s3, 0x0($s1)
/* 4690 80013E90 0400428E */  lw         $v0, 0x4($s2)
/* 4694 80013E94 C48B838F */  lw         $v1, %gp_rel(cem_line_leading)($gp)
/* 4698 80013E98 00000000 */  nop
/* 469C 80013E9C 21104300 */  addu       $v0, $v0, $v1
/* 46A0 80013EA0 7E4F0008 */  j          .L80013DF8
/* 46A4 80013EA4 040042AE */   sw        $v0, 0x4($s2)
.L80013EA8:
/* 46A8 80013EA8 0400428E */  lw         $v0, 0x4($s2)
/* 46AC 80013EAC C88B838F */  lw         $v1, %gp_rel(cem_item_leading)($gp)
/* 46B0 80013EB0 00000000 */  nop
/* 46B4 80013EB4 21104300 */  addu       $v0, $v0, $v1
/* 46B8 80013EB8 040042AE */  sw         $v0, 0x4($s2)
/* 46BC 80013EBC 2000BF8F */  lw         $ra, 0x20($sp)
/* 46C0 80013EC0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 46C4 80013EC4 1800B28F */  lw         $s2, 0x18($sp)
/* 46C8 80013EC8 1400B18F */  lw         $s1, 0x14($sp)
/* 46CC 80013ECC 1000B08F */  lw         $s0, 0x10($sp)
/* 46D0 80013ED0 0800E003 */  jr         $ra
/* 46D4 80013ED4 2800BD27 */   addiu     $sp, $sp, 0x28
.size draw_menu_item, . - draw_menu_item
