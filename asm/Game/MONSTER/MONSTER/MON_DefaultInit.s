.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_DefaultInit
/* 7D4E4 8008CCE4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7D4E8 8008CCE8 1800B2AF */  sw         $s2, 0x18($sp)
/* 7D4EC 8008CCEC 21908000 */  addu       $s2, $a0, $zero
/* 7D4F0 8008CCF0 2000BFAF */  sw         $ra, 0x20($sp)
/* 7D4F4 8008CCF4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7D4F8 8008CCF8 1400B1AF */  sw         $s1, 0x14($sp)
/* 7D4FC 8008CCFC 1000B0AF */  sw         $s0, 0x10($sp)
/* 7D500 8008CD00 6C01538E */  lw         $s3, 0x16C($s2)
/* 7D504 8008CD04 0001033C */  lui        $v1, (0x1000000 >> 16)
/* 7D508 8008CD08 0000628E */  lw         $v0, 0x0($s3)
/* 7D50C 8008CD0C 2400518E */  lw         $s1, 0x24($s2)
/* 7D510 8008CD10 24104300 */  and        $v0, $v0, $v1
/* 7D514 8008CD14 03004010 */  beqz       $v0, .L8008CD24
/* 7D518 8008CD18 00000000 */   nop
/* 7D51C 8008CD1C 5BFD010C */  jal        MONAPI_CheckGenerator
/* 7D520 8008CD20 00000000 */   nop
.L8008CD24:
/* 7D524 8008CD24 9304020C */  jal        MON_OnGround
/* 7D528 8008CD28 21204002 */   addu      $a0, $s2, $zero
/* 7D52C 8008CD2C 04004010 */  beqz       $v0, .L8008CD40
/* 7D530 8008CD30 FDFF0324 */   addiu     $v1, $zero, -0x3
/* 7D534 8008CD34 0000628E */  lw         $v0, 0x0($s3)
/* 7D538 8008CD38 53330208 */  j          .L8008CD4C
/* 7D53C 8008CD3C 02004234 */   ori       $v0, $v0, 0x2
.L8008CD40:
/* 7D540 8008CD40 0000628E */  lw         $v0, 0x0($s3)
/* 7D544 8008CD44 00000000 */  nop
/* 7D548 8008CD48 24104300 */  and        $v0, $v0, $v1
.L8008CD4C:
/* 7D54C 8008CD4C 000062AE */  sw         $v0, 0x0($s3)
/* 7D550 8008CD50 0001438E */  lw         $v1, 0x100($s2)
/* 7D554 8008CD54 00000000 */  nop
/* 7D558 8008CD58 16006010 */  beqz       $v1, .L8008CDB4
/* 7D55C 8008CD5C 00000000 */   nop
/* 7D560 8008CD60 26014286 */  lh         $v0, 0x126($s2)
/* 7D564 8008CD64 00000000 */  nop
/* 7D568 8008CD68 C0100200 */  sll        $v0, $v0, 3
/* 7D56C 8008CD6C 21106200 */  addu       $v0, $v1, $v0
/* 7D570 8008CD70 0400448C */  lw         $a0, 0x4($v0)
/* 7D574 8008CD74 0000428C */  lw         $v0, 0x0($v0)
/* 7D578 8008CD78 0E008010 */  beqz       $a0, .L8008CDB4
/* 7D57C 8008CD7C 00000000 */   nop
/* 7D580 8008CD80 01000524 */  addiu      $a1, $zero, 0x1
/* 7D584 8008CD84 21184500 */  addu       $v1, $v0, $a1
.L8008CD88:
/* 7D588 8008CD88 02006290 */  lbu        $v0, 0x2($v1)
/* 7D58C 8008CD8C 00000000 */  nop
/* 7D590 8008CD90 05004510 */  beq        $v0, $a1, .L8008CDA8
/* 7D594 8008CD94 00000000 */   nop
/* 7D598 8008CD98 00006290 */  lbu        $v0, 0x0($v1)
/* 7D59C 8008CD9C 00000000 */  nop
/* 7D5A0 8008CDA0 A5004230 */  andi       $v0, $v0, 0xA5
/* 7D5A4 8008CDA4 000062A0 */  sb         $v0, 0x0($v1)
.L8008CDA8:
/* 7D5A8 8008CDA8 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 7D5AC 8008CDAC F6FF8014 */  bnez       $a0, .L8008CD88
/* 7D5B0 8008CDB0 08006324 */   addiu     $v1, $v1, 0x8
.L8008CDB4:
/* 7D5B4 8008CDB4 1A002292 */  lbu        $v0, 0x1A($s1)
/* 7D5B8 8008CDB8 00000000 */  nop
/* 7D5BC 8008CDBC 09004010 */  beqz       $v0, .L8008CDE4
/* 7D5C0 8008CDC0 C8015026 */   addiu     $s0, $s2, 0x1C8
/* 7D5C4 8008CDC4 21200002 */  addu       $a0, $s0, $zero
/* 7D5C8 8008CDC8 21284000 */  addu       $a1, $v0, $zero
/* 7D5CC 8008CDCC 1641020C */  jal        G2Anim_AttachControllerToSeg
/* 7D5D0 8008CDD0 0E000624 */   addiu     $a2, $zero, 0xE
/* 7D5D4 8008CDD4 21200002 */  addu       $a0, $s0, $zero
/* 7D5D8 8008CDD8 1A002592 */  lbu        $a1, 0x1A($s1)
/* 7D5DC 8008CDDC 8D41020C */  jal        G2Anim_DisableController
/* 7D5E0 8008CDE0 0E000624 */   addiu     $a2, $zero, 0xE
.L8008CDE4:
/* 7D5E4 8008CDE4 22002392 */  lbu        $v1, 0x22($s1)
/* 7D5E8 8008CDE8 00000000 */  nop
/* 7D5EC 8008CDEC 0D006010 */  beqz       $v1, .L8008CE24
/* 7D5F0 8008CDF0 00000000 */   nop
/* 7D5F4 8008CDF4 1A002292 */  lbu        $v0, 0x1A($s1)
/* 7D5F8 8008CDF8 00000000 */  nop
/* 7D5FC 8008CDFC 09006210 */  beq        $v1, $v0, .L8008CE24
/* 7D600 8008CE00 C8015026 */   addiu     $s0, $s2, 0x1C8
/* 7D604 8008CE04 21200002 */  addu       $a0, $s0, $zero
/* 7D608 8008CE08 21286000 */  addu       $a1, $v1, $zero
/* 7D60C 8008CE0C 1641020C */  jal        G2Anim_AttachControllerToSeg
/* 7D610 8008CE10 0E000624 */   addiu     $a2, $zero, 0xE
/* 7D614 8008CE14 21200002 */  addu       $a0, $s0, $zero
/* 7D618 8008CE18 22002592 */  lbu        $a1, 0x22($s1)
/* 7D61C 8008CE1C 8D41020C */  jal        G2Anim_DisableController
/* 7D620 8008CE20 0E000624 */   addiu     $a2, $zero, 0xE
.L8008CE24:
/* 7D624 8008CE24 1C00428E */  lw         $v0, 0x1C($s2)
/* 7D628 8008CE28 00000000 */  nop
/* 7D62C 8008CE2C 0000428C */  lw         $v0, 0x0($v0)
/* 7D630 8008CE30 0800033C */  lui        $v1, (0x80000 >> 16)
/* 7D634 8008CE34 24104300 */  and        $v0, $v0, $v1
/* 7D638 8008CE38 1B004014 */  bnez       $v0, .L8008CEA8
/* 7D63C 8008CE3C 00000000 */   nop
/* 7D640 8008CE40 98AD828F */  lw         $v0, %gp_rel(theCamera + 0x108)($gp)
/* 7D644 8008CE44 00000000 */  nop
/* 7D648 8008CE48 3800448C */  lw         $a0, 0x38($v0)
/* 7D64C 8008CE4C 1C66010C */  jal        STREAM_GetLevelWithID
/* 7D650 8008CE50 00000000 */   nop
/* 7D654 8008CE54 21804000 */  addu       $s0, $v0, $zero
/* 7D658 8008CE58 5C004386 */  lh         $v1, 0x5C($s2)
/* 7D65C 8008CE5C 90AC8487 */  lh         $a0, %gp_rel(theCamera)($gp)
/* 7D660 8008CE60 5E004786 */  lh         $a3, 0x5E($s2)
/* 7D664 8008CE64 92AC8587 */  lh         $a1, %gp_rel(theCamera + 0x2)($gp)
/* 7D668 8008CE68 94AC8687 */  lh         $a2, %gp_rel(theCamera + 0x4)($gp)
/* 7D66C 8008CE6C 23206400 */  subu       $a0, $v1, $a0
/* 7D670 8008CE70 60004386 */  lh         $v1, 0x60($s2)
/* 7D674 8008CE74 2328E500 */  subu       $a1, $a3, $a1
/* 7D678 8008CE78 B7E6000C */  jal        MATH3D_LengthXYZ
/* 7D67C 8008CE7C 23306600 */   subu      $a2, $v1, $a2
/* 7D680 8008CE80 46000396 */  lhu        $v1, 0x46($s0)
/* 7D684 8008CE84 00000000 */  nop
/* 7D688 8008CE88 2A104300 */  slt        $v0, $v0, $v1
/* 7D68C 8008CE8C 06004010 */  beqz       $v0, .L8008CEA8
/* 7D690 8008CE90 00100224 */   addiu     $v0, $zero, 0x1000
/* 7D694 8008CE94 040142A6 */  sh         $v0, 0x104($s2)
/* 7D698 8008CE98 21204002 */  addu       $a0, $s2, $zero
/* 7D69C 8008CE9C 21280000 */  addu       $a1, $zero, $zero
/* 7D6A0 8008CEA0 7810020C */  jal        MON_StartSpecialFade
/* 7D6A4 8008CEA4 14000624 */   addiu     $a2, $zero, 0x14
.L8008CEA8:
/* 7D6A8 8008CEA8 1400428E */  lw         $v0, 0x14($s2)
/* 7D6AC 8008CEAC 00000000 */  nop
/* 7D6B0 8008CEB0 02004230 */  andi       $v0, $v0, 0x2
/* 7D6B4 8008CEB4 15004014 */  bnez       $v0, .L8008CF0C
/* 7D6B8 8008CEB8 21280000 */   addu      $a1, $zero, $zero
/* 7D6BC 8008CEBC 5A016392 */  lbu        $v1, 0x15A($s3)
/* 7D6C0 8008CEC0 04000224 */  addiu      $v0, $zero, 0x4
/* 7D6C4 8008CEC4 03006214 */  bne        $v1, $v0, .L8008CED4
/* 7D6C8 8008CEC8 10000224 */   addiu     $v0, $zero, 0x10
/* 7D6CC 8008CECC C3330208 */  j          .L8008CF0C
/* 7D6D0 8008CED0 14000524 */   addiu     $a1, $zero, 0x14
.L8008CED4:
/* 7D6D4 8008CED4 03006214 */  bne        $v1, $v0, .L8008CEE4
/* 7D6D8 8008CED8 0D000224 */   addiu     $v0, $zero, 0xD
/* 7D6DC 8008CEDC C3330208 */  j          .L8008CF0C
/* 7D6E0 8008CEE0 1A000524 */   addiu     $a1, $zero, 0x1A
.L8008CEE4:
/* 7D6E4 8008CEE4 03006214 */  bne        $v1, $v0, .L8008CEF4
/* 7D6E8 8008CEE8 17000524 */   addiu     $a1, $zero, 0x17
/* 7D6EC 8008CEEC C3330208 */  j          .L8008CF0C
/* 7D6F0 8008CEF0 540160A6 */   sh        $zero, 0x154($s3)
.L8008CEF4:
/* 7D6F4 8008CEF4 0000628E */  lw         $v0, 0x0($s3)
/* 7D6F8 8008CEF8 00000000 */  nop
/* 7D6FC 8008CEFC 02004230 */  andi       $v0, $v0, 0x2
/* 7D700 8008CF00 02004010 */  beqz       $v0, .L8008CF0C
/* 7D704 8008CF04 04000524 */   addiu     $a1, $zero, 0x4
/* 7D708 8008CF08 02000524 */  addiu      $a1, $zero, 0x2
.L8008CF0C:
/* 7D70C 8008CF0C 91FE010C */  jal        MON_SwitchState
/* 7D710 8008CF10 21204002 */   addu      $a0, $s2, $zero
/* 7D714 8008CF14 2000BF8F */  lw         $ra, 0x20($sp)
/* 7D718 8008CF18 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7D71C 8008CF1C 1800B28F */  lw         $s2, 0x18($sp)
/* 7D720 8008CF20 1400B18F */  lw         $s1, 0x14($sp)
/* 7D724 8008CF24 1000B08F */  lw         $s0, 0x10($sp)
/* 7D728 8008CF28 0800E003 */  jr         $ra
/* 7D72C 8008CF2C 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_DefaultInit, . - MON_DefaultInit
