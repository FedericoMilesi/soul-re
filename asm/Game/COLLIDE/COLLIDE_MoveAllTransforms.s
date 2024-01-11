.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_MoveAllTransforms
/* F648 8001EE48 4400878C */  lw         $a3, 0x44($a0)
/* F64C 8001EE4C 00000000 */  nop
/* F650 8001EE50 2F00E010 */  beqz       $a3, .L8001EF10
/* F654 8001EE54 00000000 */   nop
/* F658 8001EE58 0000A984 */  lh         $t1, 0x0($a1)
/* F65C 8001EE5C 1C00868C */  lw         $a2, 0x1C($a0)
/* F660 8001EE60 0200A884 */  lh         $t0, 0x2($a1)
/* F664 8001EE64 1000C28C */  lw         $v0, 0x10($a2)
/* F668 8001EE68 0400A584 */  lh         $a1, 0x4($a1)
/* F66C 8001EE6C 10004010 */  beqz       $v0, .L8001EEB0
/* F670 8001EE70 0040033C */   lui       $v1, (0x40000000 >> 16)
/* F674 8001EE74 2C00C28C */  lw         $v0, 0x2C($a2)
/* F678 8001EE78 00000000 */  nop
/* F67C 8001EE7C 24104300 */  and        $v0, $v0, $v1
/* F680 8001EE80 0B004014 */  bnez       $v0, .L8001EEB0
/* F684 8001EE84 00000000 */   nop
/* F688 8001EE88 26018284 */  lh         $v0, 0x126($a0)
/* F68C 8001EE8C 0C00C38C */  lw         $v1, 0xC($a2)
/* F690 8001EE90 80100200 */  sll        $v0, $v0, 2
/* F694 8001EE94 21104300 */  addu       $v0, $v0, $v1
/* F698 8001EE98 0000428C */  lw         $v0, 0x0($v0)
/* F69C 8001EE9C 00000000 */  nop
/* F6A0 8001EEA0 1800428C */  lw         $v0, 0x18($v0)
/* F6A4 8001EEA4 E0FFE324 */  addiu      $v1, $a3, -0x20
/* F6A8 8001EEA8 B47B0008 */  j          .L8001EED0
/* F6AC 8001EEAC 01004224 */   addiu     $v0, $v0, 0x1
.L8001EEB0:
/* F6B0 8001EEB0 1C00838C */  lw         $v1, 0x1C($a0)
/* F6B4 8001EEB4 26018284 */  lh         $v0, 0x126($a0)
/* F6B8 8001EEB8 0C00638C */  lw         $v1, 0xC($v1)
/* F6BC 8001EEBC 80100200 */  sll        $v0, $v0, 2
/* F6C0 8001EEC0 21104300 */  addu       $v0, $v0, $v1
/* F6C4 8001EEC4 0000428C */  lw         $v0, 0x0($v0)
/* F6C8 8001EEC8 4400838C */  lw         $v1, 0x44($a0)
/* F6CC 8001EECC 1800428C */  lw         $v0, 0x18($v0)
.L8001EED0:
/* F6D0 8001EED0 00000000 */  nop
/* F6D4 8001EED4 21304000 */  addu       $a2, $v0, $zero
/* F6D8 8001EED8 0D00C010 */  beqz       $a2, .L8001EF10
/* F6DC 8001EEDC 1C006424 */   addiu     $a0, $v1, 0x1C
.L8001EEE0:
/* F6E0 8001EEE0 FFFFC624 */  addiu      $a2, $a2, -0x1
/* F6E4 8001EEE4 F8FF828C */  lw         $v0, -0x8($a0)
/* F6E8 8001EEE8 0000838C */  lw         $v1, 0x0($a0)
/* F6EC 8001EEEC 21104900 */  addu       $v0, $v0, $t1
/* F6F0 8001EEF0 F8FF82AC */  sw         $v0, -0x8($a0)
/* F6F4 8001EEF4 FCFF828C */  lw         $v0, -0x4($a0)
/* F6F8 8001EEF8 21186500 */  addu       $v1, $v1, $a1
/* F6FC 8001EEFC 000083AC */  sw         $v1, 0x0($a0)
/* F700 8001EF00 21104800 */  addu       $v0, $v0, $t0
/* F704 8001EF04 FCFF82AC */  sw         $v0, -0x4($a0)
/* F708 8001EF08 F5FFC014 */  bnez       $a2, .L8001EEE0
/* F70C 8001EF0C 20008424 */   addiu     $a0, $a0, 0x20
.L8001EF10:
/* F710 8001EF10 0800E003 */  jr         $ra
/* F714 8001EF14 00000000 */   nop
.size COLLIDE_MoveAllTransforms, . - COLLIDE_MoveAllTransforms
