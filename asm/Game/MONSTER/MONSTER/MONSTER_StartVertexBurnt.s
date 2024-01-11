.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSTER_StartVertexBurnt
/* 7CE54 8008C654 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 7CE58 8008C658 4800B2AF */  sw         $s2, 0x48($sp)
/* 7CE5C 8008C65C 21908000 */  addu       $s2, $a0, $zero
/* 7CE60 8008C660 5000B4AF */  sw         $s4, 0x50($sp)
/* 7CE64 8008C664 21A0A000 */  addu       $s4, $a1, $zero
/* 7CE68 8008C668 4000B0AF */  sw         $s0, 0x40($sp)
/* 7CE6C 8008C66C 5800BFAF */  sw         $ra, 0x58($sp)
/* 7CE70 8008C670 5400B5AF */  sw         $s5, 0x54($sp)
/* 7CE74 8008C674 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 7CE78 8008C678 4400B1AF */  sw         $s1, 0x44($sp)
/* 7CE7C 8008C67C 1C00438E */  lw         $v1, 0x1C($s2)
/* 7CE80 8008C680 26014286 */  lh         $v0, 0x126($s2)
/* 7CE84 8008C684 0C00638C */  lw         $v1, 0xC($v1)
/* 7CE88 8008C688 80100200 */  sll        $v0, $v0, 2
/* 7CE8C 8008C68C 21104300 */  addu       $v0, $v0, $v1
/* 7CE90 8008C690 9802438E */  lw         $v1, 0x298($s2)
/* 7CE94 8008C694 0000518C */  lw         $s1, 0x0($v0)
/* 7CE98 8008C698 07006014 */  bnez       $v1, .L8008C6B8
/* 7CE9C 8008C69C 2180C000 */   addu      $s0, $a2, $zero
/* 7CEA0 8008C6A0 7B30020C */  jal        MONSTER_InitVertexColors
/* 7CEA4 8008C6A4 21282002 */   addu      $a1, $s1, $zero
/* 7CEA8 8008C6A8 9802428E */  lw         $v0, 0x298($s2)
/* 7CEAC 8008C6AC 00000000 */  nop
/* 7CEB0 8008C6B0 3F004010 */  beqz       $v0, .L8008C7B0
/* 7CEB4 8008C6B4 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8008C6B8:
/* 7CEB8 8008C6B8 21204002 */  addu       $a0, $s2, $zero
/* 7CEBC 8008C6BC 2000B327 */  addiu      $s3, $sp, 0x20
/* 7CEC0 8008C6C0 21286002 */  addu       $a1, $s3, $zero
/* 7CEC4 8008C6C4 0980023C */  lui        $v0, %hi(ProcessBurntMess)
/* 7CEC8 8008C6C8 A8C55524 */  addiu      $s5, $v0, %lo(ProcessBurntMess)
/* 7CECC 8008C6CC 2130A002 */  addu       $a2, $s5, $zero
/* 7CED0 8008C6D0 1000A727 */  addiu      $a3, $sp, 0x10
/* 7CED4 8008C6D4 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 7CED8 8008C6D8 0100023C */  lui        $v0, (0x10000 >> 16)
/* 7CEDC 8008C6DC 0300888A */  lwl        $t0, 0x3($s4)
/* 7CEE0 8008C6E0 0000889A */  lwr        $t0, 0x0($s4)
/* 7CEE4 8008C6E4 0700898A */  lwl        $t1, 0x7($s4)
/* 7CEE8 8008C6E8 0400899A */  lwr        $t1, 0x4($s4)
/* 7CEEC 8008C6EC 2300A8AB */  swl        $t0, 0x23($sp)
/* 7CEF0 8008C6F0 2000A8BB */  swr        $t0, 0x20($sp)
/* 7CEF4 8008C6F4 2700A9AB */  swl        $t1, 0x27($sp)
/* 7CEF8 8008C6F8 2400A9BB */  swr        $t1, 0x24($sp)
/* 7CEFC 8008C6FC 1000A3AF */  sw         $v1, 0x10($sp)
/* 7CF00 8008C700 1400A2AF */  sw         $v0, 0x14($sp)
/* 7CF04 8008C704 1800A3AF */  sw         $v1, 0x18($sp)
/* 7CF08 8008C708 C62F020C */  jal        MONSTER_ProcessClosestVerts
/* 7CF0C 8008C70C 1C00B0AF */   sw        $s0, 0x1C($sp)
/* 7CF10 8008C710 0000028E */  lw         $v0, 0x0($s0)
/* 7CF14 8008C714 1400A38F */  lw         $v1, 0x14($sp)
/* 7CF18 8008C718 43100200 */  sra        $v0, $v0, 1
/* 7CF1C 8008C71C 2A104300 */  slt        $v0, $v0, $v1
/* 7CF20 8008C720 20004010 */  beqz       $v0, .L8008C7A4
/* 7CF24 8008C724 00000000 */   nop
/* 7CF28 8008C728 1800A28F */  lw         $v0, 0x18($sp)
/* 7CF2C 8008C72C 4000508E */  lw         $s0, 0x40($s2)
/* 7CF30 8008C730 0400318E */  lw         $s1, 0x4($s1)
/* 7CF34 8008C734 40110200 */  sll        $v0, $v0, 5
/* 7CF38 8008C738 21800202 */  addu       $s0, $s0, $v0
/* 7CF3C 8008C73C 52F2020C */  jal        SetRotMatrix
/* 7CF40 8008C740 21200002 */   addu      $a0, $s0, $zero
/* 7CF44 8008C744 4AF2020C */  jal        SetTransMatrix
/* 7CF48 8008C748 21200002 */   addu      $a0, $s0, $zero
/* 7CF4C 8008C74C 2800A527 */  addiu      $a1, $sp, 0x28
/* 7CF50 8008C750 1000A48F */  lw         $a0, 0x10($sp)
/* 7CF54 8008C754 3800A627 */  addiu      $a2, $sp, 0x38
/* 7CF58 8008C758 C0200400 */  sll        $a0, $a0, 3
/* 7CF5C 8008C75C 98F4020C */  jal        RotTrans
/* 7CF60 8008C760 21202402 */   addu      $a0, $s1, $a0
/* 7CF64 8008C764 2800A297 */  lhu        $v0, 0x28($sp)
/* 7CF68 8008C768 2C00A397 */  lhu        $v1, 0x2C($sp)
/* 7CF6C 8008C76C 3000A597 */  lhu        $a1, 0x30($sp)
/* 7CF70 8008C770 21206002 */  addu       $a0, $s3, $zero
/* 7CF74 8008C774 1400A0AF */  sw         $zero, 0x14($sp)
/* 7CF78 8008C778 2000A2A7 */  sh         $v0, 0x20($sp)
/* 7CF7C 8008C77C 2200A3A7 */  sh         $v1, 0x22($sp)
/* 7CF80 8008C780 CF29010C */  jal        FX_MakeHitFX
/* 7CF84 8008C784 2400A5A7 */   sh        $a1, 0x24($sp)
/* 7CF88 8008C788 21204002 */  addu       $a0, $s2, $zero
/* 7CF8C 8008C78C 21286002 */  addu       $a1, $s3, $zero
/* 7CF90 8008C790 2130A002 */  addu       $a2, $s5, $zero
/* 7CF94 8008C794 C62F020C */  jal        MONSTER_ProcessClosestVerts
/* 7CF98 8008C798 1000A727 */   addiu     $a3, $sp, 0x10
/* 7CF9C 8008C79C EB310208 */  j          .L8008C7AC
/* 7CFA0 8008C7A0 00000000 */   nop
.L8008C7A4:
/* 7CFA4 8008C7A4 CF29010C */  jal        FX_MakeHitFX
/* 7CFA8 8008C7A8 21206002 */   addu      $a0, $s3, $zero
.L8008C7AC:
/* 7CFAC 8008C7AC 1000A28F */  lw         $v0, 0x10($sp)
.L8008C7B0:
/* 7CFB0 8008C7B0 5800BF8F */  lw         $ra, 0x58($sp)
/* 7CFB4 8008C7B4 5400B58F */  lw         $s5, 0x54($sp)
/* 7CFB8 8008C7B8 5000B48F */  lw         $s4, 0x50($sp)
/* 7CFBC 8008C7BC 4C00B38F */  lw         $s3, 0x4C($sp)
/* 7CFC0 8008C7C0 4800B28F */  lw         $s2, 0x48($sp)
/* 7CFC4 8008C7C4 4400B18F */  lw         $s1, 0x44($sp)
/* 7CFC8 8008C7C8 4000B08F */  lw         $s0, 0x40($sp)
/* 7CFCC 8008C7CC 0800E003 */  jr         $ra
/* 7CFD0 8008C7D0 6000BD27 */   addiu     $sp, $sp, 0x60
.size MONSTER_StartVertexBurnt, . - MONSTER_StartVertexBurnt
