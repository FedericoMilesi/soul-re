.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUD_Update
/* 6CCBC 8007C4BC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6CCC0 8007C4C0 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 6CCC4 8007C4C4 06000224 */  addiu      $v0, $zero, 0x6
/* 6CCC8 8007C4C8 08006214 */  bne        $v1, $v0, .L8007C4EC
/* 6CCCC 8007C4CC 2000BFAF */   sw        $ra, 0x20($sp)
/* 6CCD0 8007C4D0 FCEC8287 */  lh         $v0, %gp_rel(HUD_State)($gp)
/* 6CCD4 8007C4D4 00000000 */  nop
/* 6CCD8 8007C4D8 04004014 */  bnez       $v0, .L8007C4EC
/* 6CCDC 8007C4DC 0A000224 */   addiu     $v0, $zero, 0xA
/* 6CCE0 8007C4E0 FCEC82A7 */  sh         $v0, %gp_rel(HUD_State)($gp)
/* 6CCE4 8007C4E4 4FF10108 */  j          .L8007C53C
/* 6CCE8 8007C4E8 00000000 */   nop
.L8007C4EC:
/* 6CCEC 8007C4EC 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 6CCF0 8007C4F0 06000224 */  addiu      $v0, $zero, 0x6
/* 6CCF4 8007C4F4 0A006210 */  beq        $v1, $v0, .L8007C520
/* 6CCF8 8007C4F8 00000000 */   nop
/* 6CCFC 8007C4FC FCEC8297 */  lhu        $v0, %gp_rel(HUD_State)($gp)
/* 6CD00 8007C500 00000000 */  nop
/* 6CD04 8007C504 F6FF4224 */  addiu      $v0, $v0, -0xA
/* 6CD08 8007C508 0200422C */  sltiu      $v0, $v0, 0x2
/* 6CD0C 8007C50C 0B004010 */  beqz       $v0, .L8007C53C
/* 6CD10 8007C510 0C000224 */   addiu     $v0, $zero, 0xC
/* 6CD14 8007C514 FCEC82A7 */  sh         $v0, %gp_rel(HUD_State)($gp)
/* 6CD18 8007C518 4FF10108 */  j          .L8007C53C
/* 6CD1C 8007C51C 00000000 */   nop
.L8007C520:
/* 6CD20 8007C520 FCEC8387 */  lh         $v1, %gp_rel(HUD_State)($gp)
/* 6CD24 8007C524 00000000 */  nop
/* 6CD28 8007C528 02006228 */  slti       $v0, $v1, 0x2
/* 6CD2C 8007C52C 03004014 */  bnez       $v0, .L8007C53C
/* 6CD30 8007C530 07006228 */   slti      $v0, $v1, 0x7
/* 6CD34 8007C534 6A004014 */  bnez       $v0, .L8007C6E0
/* 6CD38 8007C538 00000000 */   nop
.L8007C53C:
/* 6CD3C 8007C53C FEEC8287 */  lh         $v0, %gp_rel(HUD_Wait)($gp)
/* 6CD40 8007C540 FEEC8397 */  lhu        $v1, %gp_rel(HUD_Wait)($gp)
/* 6CD44 8007C544 04004018 */  blez       $v0, .L8007C558
/* 6CD48 8007C548 FFFF6224 */   addiu     $v0, $v1, -0x1
/* 6CD4C 8007C54C FEEC82A7 */  sh         $v0, %gp_rel(HUD_Wait)($gp)
/* 6CD50 8007C550 B8F10108 */  j          .L8007C6E0
/* 6CD54 8007C554 00000000 */   nop
.L8007C558:
/* 6CD58 8007C558 FCEC8387 */  lh         $v1, %gp_rel(HUD_State)($gp)
/* 6CD5C 8007C55C 00000000 */  nop
/* 6CD60 8007C560 0D00622C */  sltiu      $v0, $v1, 0xD
/* 6CD64 8007C564 08004010 */  beqz       $v0, .L8007C588
/* 6CD68 8007C568 0180023C */   lui       $v0, %hi(jtbl_80011E38)
/* 6CD6C 8007C56C 381E4224 */  addiu      $v0, $v0, %lo(jtbl_80011E38)
/* 6CD70 8007C570 80180300 */  sll        $v1, $v1, 2
/* 6CD74 8007C574 21186200 */  addu       $v1, $v1, $v0
/* 6CD78 8007C578 0000628C */  lw         $v0, 0x0($v1)
/* 6CD7C 8007C57C 00000000 */  nop
/* 6CD80 8007C580 08004000 */  jr         $v0
/* 6CD84 8007C584 00000000 */   nop
jlabel .L8007C588
/* 6CD88 8007C588 E2EC8387 */  lh         $v1, %gp_rel(HUD_Count)($gp)
/* 6CD8C 8007C58C 18FC0224 */  addiu      $v0, $zero, -0x3E8
/* 6CD90 8007C590 F8EC82A7 */  sh         $v0, %gp_rel(HUD_Position)($gp)
/* 6CD94 8007C594 05000224 */  addiu      $v0, $zero, 0x5
/* 6CD98 8007C598 F4EC80A7 */  sh         $zero, %gp_rel(HUD_Rotation)($gp)
/* 6CD9C 8007C59C F6EC80A7 */  sh         $zero, %gp_rel(HUD_Rot_vel)($gp)
/* 6CDA0 8007C5A0 FAEC80A7 */  sh         $zero, %gp_rel(HUD_Pos_vel)($gp)
/* 6CDA4 8007C5A4 4E006214 */  bne        $v1, $v0, .L8007C6E0
/* 6CDA8 8007C5A8 00000000 */   nop
/* 6CDAC 8007C5AC E2EC80A7 */  sh         $zero, %gp_rel(HUD_Count)($gp)
/* 6CDB0 8007C5B0 B8F10108 */  j          .L8007C6E0
/* 6CDB4 8007C5B4 00000000 */   nop
jlabel .L8007C5B8
/* 6CDB8 8007C5B8 F8EC8427 */  addiu      $a0, $gp, %gp_rel(HUD_Position)
/* 6CDBC 8007C5BC 21280000 */  addu       $a1, $zero, $zero
/* 6CDC0 8007C5C0 FAEC8627 */  addiu      $a2, $gp, %gp_rel(HUD_Pos_vel)
/* 6CDC4 8007C5C4 01F1010C */  jal        HUD_Damp
/* 6CDC8 8007C5C8 60000724 */   addiu     $a3, $zero, 0x60
/* 6CDCC 8007C5CC F8EC8287 */  lh         $v0, %gp_rel(HUD_Position)($gp)
/* 6CDD0 8007C5D0 00000000 */  nop
/* 6CDD4 8007C5D4 0B004004 */  bltz       $v0, .L8007C604
/* 6CDD8 8007C5D8 0A000224 */   addiu     $v0, $zero, 0xA
/* 6CDDC 8007C5DC FCEC8387 */  lh         $v1, %gp_rel(HUD_State)($gp)
/* 6CDE0 8007C5E0 F8EC80A7 */  sh         $zero, %gp_rel(HUD_Position)($gp)
/* 6CDE4 8007C5E4 06006210 */  beq        $v1, $v0, .L8007C600
/* 6CDE8 8007C5E8 0B000224 */   addiu     $v0, $zero, 0xB
/* 6CDEC 8007C5EC E2EC8287 */  lh         $v0, %gp_rel(HUD_Count)($gp)
/* 6CDF0 8007C5F0 00000000 */  nop
/* 6CDF4 8007C5F4 0200401C */  bgtz       $v0, .L8007C600
/* 6CDF8 8007C5F8 02000224 */   addiu     $v0, $zero, 0x2
/* 6CDFC 8007C5FC 03000224 */  addiu      $v0, $zero, 0x3
.L8007C600:
/* 6CE00 8007C600 FCEC82A7 */  sh         $v0, %gp_rel(HUD_State)($gp)
.L8007C604:
/* 6CE04 8007C604 FCEC8387 */  lh         $v1, %gp_rel(HUD_State)($gp)
/* 6CE08 8007C608 0A000224 */  addiu      $v0, $zero, 0xA
/* 6CE0C 8007C60C 34006214 */  bne        $v1, $v0, .L8007C6E0
/* 6CE10 8007C610 05000424 */   addiu     $a0, $zero, 0x5
/* 6CE14 8007C614 D8EC8527 */  addiu      $a1, $gp, %gp_rel(MANNA_Position)
/* 6CE18 8007C618 18000624 */  addiu      $a2, $zero, 0x18
/* 6CE1C 8007C61C DAEC8727 */  addiu      $a3, $gp, %gp_rel(MANNA_Pos_vel)
/* 6CE20 8007C620 2110A603 */  addu       $v0, $sp, $a2
/* 6CE24 8007C624 1000A2AF */  sw         $v0, 0x10($sp)
/* 6CE28 8007C628 0C000224 */  addiu      $v0, $zero, 0xC
/* 6CE2C 8007C62C F0EC80AF */  sw         $zero, %gp_rel(MANNA_Pickup_Time)($gp)
/* 6CE30 8007C630 605C000C */  jal        CriticalDampValue
/* 6CE34 8007C634 1400A2AF */   sw        $v0, 0x14($sp)
/* 6CE38 8007C638 B8F10108 */  j          .L8007C6E0
/* 6CE3C 8007C63C 00000000 */   nop
jlabel .L8007C640
/* 6CE40 8007C640 F4EC8427 */  addiu      $a0, $gp, %gp_rel(HUD_Rotation)
/* 6CE44 8007C644 33030524 */  addiu      $a1, $zero, 0x333
/* 6CE48 8007C648 F6EC8627 */  addiu      $a2, $gp, %gp_rel(HUD_Rot_vel)
/* 6CE4C 8007C64C 01F1010C */  jal        HUD_Damp
/* 6CE50 8007C650 50000724 */   addiu     $a3, $zero, 0x50
/* 6CE54 8007C654 F4EC8287 */  lh         $v0, %gp_rel(HUD_Rotation)($gp)
/* 6CE58 8007C658 00000000 */  nop
/* 6CE5C 8007C65C 33034228 */  slti       $v0, $v0, 0x333
/* 6CE60 8007C660 1F004014 */  bnez       $v0, .L8007C6E0
/* 6CE64 8007C664 33030224 */   addiu     $v0, $zero, 0x333
/* 6CE68 8007C668 F4EC82A7 */  sh         $v0, %gp_rel(HUD_Rotation)($gp)
/* 6CE6C 8007C66C 03000224 */  addiu      $v0, $zero, 0x3
/* 6CE70 8007C670 FCEC82A7 */  sh         $v0, %gp_rel(HUD_State)($gp)
/* 6CE74 8007C674 B8F10108 */  j          .L8007C6E0
/* 6CE78 8007C678 00000000 */   nop
jlabel .L8007C67C
/* 6CE7C 8007C67C 06000224 */  addiu      $v0, $zero, 0x6
/* 6CE80 8007C680 FCEC82A7 */  sh         $v0, %gp_rel(HUD_State)($gp)
/* 6CE84 8007C684 0A000224 */  addiu      $v0, $zero, 0xA
/* 6CE88 8007C688 FEEC82A7 */  sh         $v0, %gp_rel(HUD_Wait)($gp)
/* 6CE8C 8007C68C E2EC8297 */  lhu        $v0, %gp_rel(HUD_Count)($gp)
/* 6CE90 8007C690 E4EC8397 */  lhu        $v1, %gp_rel(HUD_Count_Overall)($gp)
/* 6CE94 8007C694 F4EC80A7 */  sh         $zero, %gp_rel(HUD_Rotation)($gp)
/* 6CE98 8007C698 F8A480A7 */  sh         $zero, %gp_rel(HUD_Captured)($gp)
/* 6CE9C 8007C69C 01004224 */  addiu      $v0, $v0, 0x1
/* 6CEA0 8007C6A0 01006324 */  addiu      $v1, $v1, 0x1
/* 6CEA4 8007C6A4 E2EC82A7 */  sh         $v0, %gp_rel(HUD_Count)($gp)
/* 6CEA8 8007C6A8 E4EC83A7 */  sh         $v1, %gp_rel(HUD_Count_Overall)($gp)
/* 6CEAC 8007C6AC B8F10108 */  j          .L8007C6E0
/* 6CEB0 8007C6B0 00000000 */   nop
jlabel .L8007C6B4
/* 6CEB4 8007C6B4 F8EC8427 */  addiu      $a0, $gp, %gp_rel(HUD_Position)
/* 6CEB8 8007C6B8 18FC0524 */  addiu      $a1, $zero, -0x3E8
/* 6CEBC 8007C6BC FAEC8627 */  addiu      $a2, $gp, %gp_rel(HUD_Pos_vel)
/* 6CEC0 8007C6C0 01F1010C */  jal        HUD_Damp
/* 6CEC4 8007C6C4 60000724 */   addiu     $a3, $zero, 0x60
/* 6CEC8 8007C6C8 F8EC8287 */  lh         $v0, %gp_rel(HUD_Position)($gp)
/* 6CECC 8007C6CC 00000000 */  nop
/* 6CED0 8007C6D0 19FC4228 */  slti       $v0, $v0, -0x3E7
/* 6CED4 8007C6D4 02004010 */  beqz       $v0, .L8007C6E0
/* 6CED8 8007C6D8 00000000 */   nop
/* 6CEDC 8007C6DC FCEC80A7 */  sh         $zero, %gp_rel(HUD_State)($gp)
jlabel .L8007C6E0
/* 6CEE0 8007C6E0 2000BF8F */  lw         $ra, 0x20($sp)
/* 6CEE4 8007C6E4 00000000 */  nop
/* 6CEE8 8007C6E8 0800E003 */  jr         $ra
/* 6CEEC 8007C6EC 2800BD27 */   addiu     $sp, $sp, 0x28
.size HUD_Update, . - HUD_Update
