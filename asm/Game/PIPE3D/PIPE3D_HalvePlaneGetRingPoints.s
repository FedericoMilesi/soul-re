.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_HalvePlaneGetRingPoints
/* 2CE54 8003C654 48FFBD27 */  addiu      $sp, $sp, -0xB8
/* 2CE58 8003C658 B000BEAF */  sw         $fp, 0xB0($sp)
/* 2CE5C 8003C65C 21F0A000 */  addu       $fp, $a1, $zero
/* 2CE60 8003C660 A800B6AF */  sw         $s6, 0xA8($sp)
/* 2CE64 8003C664 21B0C000 */  addu       $s6, $a2, $zero
/* 2CE68 8003C668 AC00B7AF */  sw         $s7, 0xAC($sp)
/* 2CE6C 8003C66C 21B8E000 */  addu       $s7, $a3, $zero
/* 2CE70 8003C670 A400B5AF */  sw         $s5, 0xA4($sp)
/* 2CE74 8003C674 21A8C002 */  addu       $s5, $s6, $zero
/* 2CE78 8003C678 B400BFAF */  sw         $ra, 0xB4($sp)
/* 2CE7C 8003C67C A000B4AF */  sw         $s4, 0xA0($sp)
/* 2CE80 8003C680 9C00B3AF */  sw         $s3, 0x9C($sp)
/* 2CE84 8003C684 9800B2AF */  sw         $s2, 0x98($sp)
/* 2CE88 8003C688 9400B1AF */  sw         $s1, 0x94($sp)
/* 2CE8C 8003C68C 9000B0AF */  sw         $s0, 0x90($sp)
/* 2CE90 8003C690 1C00838C */  lw         $v1, 0x1C($a0)
/* 2CE94 8003C694 26018284 */  lh         $v0, 0x126($a0)
/* 2CE98 8003C698 CC00B28F */  lw         $s2, 0xCC($sp)
/* 2CE9C 8003C69C 4000938C */  lw         $s3, 0x40($a0)
/* 2CEA0 8003C6A0 0C00638C */  lw         $v1, 0xC($v1)
/* 2CEA4 8003C6A4 80100200 */  sll        $v0, $v0, 2
/* 2CEA8 8003C6A8 21104300 */  addu       $v0, $v0, $v1
/* 2CEAC 8003C6AC 0000518C */  lw         $s1, 0x0($v0)
/* 2CEB0 8003C6B0 0D004292 */  lbu        $v0, 0xD($s2)
/* 2CEB4 8003C6B4 0400348E */  lw         $s4, 0x4($s1)
/* 2CEB8 8003C6B8 03004014 */  bnez       $v0, .L8003C6C8
/* 2CEBC 8003C6BC 8000A527 */   addiu     $a1, $sp, 0x80
/* 2CEC0 8003C6C0 B3F10008 */  j          .L8003C6CC
/* 2CEC4 8003C6C4 14004426 */   addiu     $a0, $s2, 0x14
.L8003C6C8:
/* 2CEC8 8003C6C8 34018424 */  addiu      $a0, $a0, 0x134
.L8003C6CC:
/* 2CECC 8003C6CC 00008294 */  lhu        $v0, 0x0($a0)
/* 2CED0 8003C6D0 00000000 */  nop
/* 2CED4 8003C6D4 0000A2A4 */  sh         $v0, 0x0($a1)
/* 2CED8 8003C6D8 02008294 */  lhu        $v0, 0x2($a0)
/* 2CEDC 8003C6DC 0000A384 */  lh         $v1, 0x0($a1)
/* 2CEE0 8003C6E0 0200A2A4 */  sh         $v0, 0x2($a1)
/* 2CEE4 8003C6E4 04008294 */  lhu        $v0, 0x4($a0)
/* 2CEE8 8003C6E8 00000000 */  nop
/* 2CEEC 8003C6EC 0400A2A4 */  sh         $v0, 0x4($a1)
/* 2CEF0 8003C6F0 0800828C */  lw         $v0, 0x8($a0)
/* 2CEF4 8003C6F4 00000000 */  nop
/* 2CEF8 8003C6F8 18006200 */  mult       $v1, $v0
/* 2CEFC 8003C6FC 12400000 */  mflo       $t0
/* 2CF00 8003C700 03130800 */  sra        $v0, $t0, 12
/* 2CF04 8003C704 23100200 */  negu       $v0, $v0
/* 2CF08 8003C708 8800A2A7 */  sh         $v0, 0x88($sp)
/* 2CF0C 8003C70C 0200A294 */  lhu        $v0, 0x2($a1)
/* 2CF10 8003C710 0800838C */  lw         $v1, 0x8($a0)
/* 2CF14 8003C714 00140200 */  sll        $v0, $v0, 16
/* 2CF18 8003C718 03140200 */  sra        $v0, $v0, 16
/* 2CF1C 8003C71C 18004300 */  mult       $v0, $v1
/* 2CF20 8003C720 12400000 */  mflo       $t0
/* 2CF24 8003C724 03130800 */  sra        $v0, $t0, 12
/* 2CF28 8003C728 23100200 */  negu       $v0, $v0
/* 2CF2C 8003C72C 8A00A2A7 */  sh         $v0, 0x8A($sp)
/* 2CF30 8003C730 0400A294 */  lhu        $v0, 0x4($a1)
/* 2CF34 8003C734 0800838C */  lw         $v1, 0x8($a0)
/* 2CF38 8003C738 00140200 */  sll        $v0, $v0, 16
/* 2CF3C 8003C73C 03140200 */  sra        $v0, $v0, 16
/* 2CF40 8003C740 18004300 */  mult       $v0, $v1
/* 2CF44 8003C744 8800A627 */  addiu      $a2, $sp, 0x88
/* 2CF48 8003C748 2000A427 */  addiu      $a0, $sp, 0x20
/* 2CF4C 8003C74C 12400000 */  mflo       $t0
/* 2CF50 8003C750 03130800 */  sra        $v0, $t0, 12
/* 2CF54 8003C754 23100200 */  negu       $v0, $v0
/* 2CF58 8003C758 85EE000C */  jal        PIPE3D_CalcWorldToSplitPlaneTransform
/* 2CF5C 8003C75C 8C00A2A7 */   sh        $v0, 0x8C($sp)
/* 2CF60 8003C760 4000B027 */  addiu      $s0, $sp, 0x40
/* 2CF64 8003C764 21200002 */  addu       $a0, $s0, $zero
/* 2CF68 8003C768 F5EA000C */  jal        PIPE3D_InvertTransform
/* 2CF6C 8003C76C 2000A527 */   addiu     $a1, $sp, 0x20
/* 2CF70 8003C770 0D004392 */  lbu        $v1, 0xD($s2)
/* 2CF74 8003C774 02000224 */  addiu      $v0, $zero, 0x2
/* 2CF78 8003C778 06006214 */  bne        $v1, $v0, .L8003C794
/* 2CF7C 8003C77C 2120C003 */   addu      $a0, $fp, $zero
/* 2CF80 8003C780 6000A427 */  addiu      $a0, $sp, 0x60
/* 2CF84 8003C784 F5EA000C */  jal        PIPE3D_InvertTransform
/* 2CF88 8003C788 2000A527 */   addiu     $a1, $sp, 0x20
/* 2CF8C 8003C78C E8F10008 */  j          .L8003C7A0
/* 2CF90 8003C790 00000000 */   nop
.L8003C794:
/* 2CF94 8003C794 21280002 */  addu       $a1, $s0, $zero
/* 2CF98 8003C798 59FD020C */  jal        func_800BF564
/* 2CF9C 8003C79C 6000A627 */   addiu     $a2, $sp, 0x60
.L8003C7A0:
/* 2CFA0 8003C7A0 14006012 */  beqz       $s3, .L8003C7F4
/* 2CFA4 8003C7A4 21208002 */   addu      $a0, $s4, $zero
/* 2CFA8 8003C7A8 2128A002 */  addu       $a1, $s5, $zero
/* 2CFAC 8003C7AC 21302002 */  addu       $a2, $s1, $zero
/* 2CFB0 8003C7B0 2000A727 */  addiu      $a3, $sp, 0x20
/* 2CFB4 8003C7B4 1000B3AF */  sw         $s3, 0x10($sp)
/* 2CFB8 8003C7B8 2DF0000C */  jal        PIPE3D_TransformSplitInstanceVertices
/* 2CFBC 8003C7BC 1400A0AF */   sw        $zero, 0x14($sp)
/* 2CFC0 8003C7C0 21202002 */  addu       $a0, $s1, $zero
/* 2CFC4 8003C7C4 C800A28F */  lw         $v0, 0xC8($sp)
/* 2CFC8 8003C7C8 2128C002 */  addu       $a1, $s6, $zero
/* 2CFCC 8003C7CC 1000A2AF */  sw         $v0, 0x10($sp)
/* 2CFD0 8003C7D0 2000428E */  lw         $v0, 0x20($s2)
/* 2CFD4 8003C7D4 6000A627 */  addiu      $a2, $sp, 0x60
/* 2CFD8 8003C7D8 6C9080AF */  sw         $zero, %gp_rel(draw_belowSplit)($gp)
/* 2CFDC 8003C7DC 1400A2AF */  sw         $v0, 0x14($sp)
/* 2CFE0 8003C7E0 0D004292 */  lbu        $v0, 0xD($s2)
/* 2CFE4 8003C7E4 2138E002 */  addu       $a3, $s7, $zero
/* 2CFE8 8003C7E8 C3AC000C */  jal        DRAW_DrawRingPoints
/* 2CFEC 8003C7EC 1800A2AF */   sw        $v0, 0x18($sp)
/* 2CFF0 8003C7F0 0400E2AE */  sw         $v0, 0x4($s7)
.L8003C7F4:
/* 2CFF4 8003C7F4 B400BF8F */  lw         $ra, 0xB4($sp)
/* 2CFF8 8003C7F8 B000BE8F */  lw         $fp, 0xB0($sp)
/* 2CFFC 8003C7FC AC00B78F */  lw         $s7, 0xAC($sp)
/* 2D000 8003C800 A800B68F */  lw         $s6, 0xA8($sp)
/* 2D004 8003C804 A400B58F */  lw         $s5, 0xA4($sp)
/* 2D008 8003C808 A000B48F */  lw         $s4, 0xA0($sp)
/* 2D00C 8003C80C 9C00B38F */  lw         $s3, 0x9C($sp)
/* 2D010 8003C810 9800B28F */  lw         $s2, 0x98($sp)
/* 2D014 8003C814 9400B18F */  lw         $s1, 0x94($sp)
/* 2D018 8003C818 9000B08F */  lw         $s0, 0x90($sp)
/* 2D01C 8003C81C 0800E003 */  jr         $ra
/* 2D020 8003C820 B800BD27 */   addiu     $sp, $sp, 0xB8
.size PIPE3D_HalvePlaneGetRingPoints, . - PIPE3D_HalvePlaneGetRingPoints
