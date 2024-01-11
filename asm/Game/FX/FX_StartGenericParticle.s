.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartGenericParticle
/* 3CCD8 8004C4D8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3CCDC 8004C4DC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3CCE0 8004C4E0 2198C000 */  addu       $s3, $a2, $zero
/* 3CCE4 8004C4E4 2000B4AF */  sw         $s4, 0x20($sp)
/* 3CCE8 8004C4E8 21A0E000 */  addu       $s4, $a3, $zero
/* 3CCEC 8004C4EC 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3CCF0 8004C4F0 90A2468C */  lw         $a2, %lo(objectAccess + 0x54)($v0)
/* 3CCF4 8004C4F4 3800A78F */  lw         $a3, 0x38($sp)
/* 3CCF8 8004C4F8 1800B2AF */  sw         $s2, 0x18($sp)
/* 3CCFC 8004C4FC 21900000 */  addu       $s2, $zero, $zero
/* 3CD00 8004C500 2400BFAF */  sw         $ra, 0x24($sp)
/* 3CD04 8004C504 1400B1AF */  sw         $s1, 0x14($sp)
/* 3CD08 8004C508 0C00C010 */  beqz       $a2, .L8004C53C
/* 3CD0C 8004C50C 1000B0AF */   sw        $s0, 0x10($sp)
/* 3CD10 8004C510 40100500 */  sll        $v0, $a1, 1
/* 3CD14 8004C514 1C00C38C */  lw         $v1, 0x1C($a2)
/* 3CD18 8004C518 21104500 */  addu       $v0, $v0, $a1
/* 3CD1C 8004C51C 0000638C */  lw         $v1, 0x0($v1)
/* 3CD20 8004C520 00110200 */  sll        $v0, $v0, 4
/* 3CD24 8004C524 0700E010 */  beqz       $a3, .L8004C544
/* 3CD28 8004C528 21886200 */   addu      $s1, $v1, $v0
/* 3CD2C 8004C52C 02002292 */  lbu        $v0, 0x2($s1)
/* 3CD30 8004C530 00000000 */  nop
/* 3CD34 8004C534 03004014 */  bnez       $v0, .L8004C544
/* 3CD38 8004C538 00000000 */   nop
.L8004C53C:
/* 3CD3C 8004C53C 02320108 */  j          .L8004C808
/* 3CD40 8004C540 21100000 */   addu      $v0, $zero, $zero
.L8004C544:
/* 3CD44 8004C544 1F002282 */  lb         $v0, 0x1F($s1)
/* 3CD48 8004C548 00000000 */  nop
/* 3CD4C 8004C54C 05004010 */  beqz       $v0, .L8004C564
/* 3CD50 8004C550 00000000 */   nop
/* 3CD54 8004C554 4C01848C */  lw         $a0, 0x14C($a0)
/* 3CD58 8004C558 00000000 */  nop
/* 3CD5C 8004C55C AA008010 */  beqz       $a0, .L8004C808
/* 3CD60 8004C560 21100000 */   addu      $v0, $zero, $zero
.L8004C564:
/* 3CD64 8004C564 1B002382 */  lb         $v1, 0x1B($s1)
/* 3CD68 8004C568 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3CD6C 8004C56C 09006210 */  beq        $v1, $v0, .L8004C594
/* 3CD70 8004C570 00000000 */   nop
/* 3CD74 8004C574 13002282 */  lb         $v0, 0x13($s1)
/* 3CD78 8004C578 00000000 */  nop
/* 3CD7C 8004C57C 02004010 */  beqz       $v0, .L8004C588
/* 3CD80 8004C580 2190C000 */   addu      $s2, $a2, $zero
/* 3CD84 8004C584 1C00928C */  lw         $s2, 0x1C($a0)
.L8004C588:
/* 3CD88 8004C588 00000000 */  nop
/* 3CD8C 8004C58C 9E004012 */  beqz       $s2, .L8004C808
/* 3CD90 8004C590 21100000 */   addu      $v0, $zero, $zero
.L8004C594:
/* 3CD94 8004C594 DC09010C */  jal        FX_GetParticle
/* 3CD98 8004C598 21280000 */   addu      $a1, $zero, $zero
/* 3CD9C 8004C59C 21804000 */  addu       $s0, $v0, $zero
/* 3CDA0 8004C5A0 99000012 */  beqz       $s0, .L8004C808
/* 3CDA4 8004C5A4 21100002 */   addu      $v0, $s0, $zero
/* 3CDA8 8004C5A8 24002292 */  lbu        $v0, 0x24($s1)
/* 3CDAC 8004C5AC 00000000 */  nop
/* 3CDB0 8004C5B0 460002A2 */  sb         $v0, 0x46($s0)
/* 3CDB4 8004C5B4 00002296 */  lhu        $v0, 0x0($s1)
/* 3CDB8 8004C5B8 00000000 */  nop
/* 3CDBC 8004C5BC 1C0002A6 */  sh         $v0, 0x1C($s0)
/* 3CDC0 8004C5C0 03002292 */  lbu        $v0, 0x3($s1)
/* 3CDC4 8004C5C4 00000000 */  nop
/* 3CDC8 8004C5C8 0D0002A2 */  sb         $v0, 0xD($s0)
/* 3CDCC 8004C5CC 04002296 */  lhu        $v0, 0x4($s1)
/* 3CDD0 8004C5D0 04006016 */  bnez       $s3, .L8004C5E4
/* 3CDD4 8004C5D4 200002A6 */   sh        $v0, 0x20($s0)
/* 3CDD8 8004C5D8 06002292 */  lbu        $v0, 0x6($s1)
/* 3CDDC 8004C5DC 7A310108 */  j          .L8004C5E8
/* 3CDE0 8004C5E0 3A0002A2 */   sb        $v0, 0x3A($s0)
.L8004C5E4:
/* 3CDE4 8004C5E4 3A0013A2 */  sb         $s3, 0x3A($s0)
.L8004C5E8:
/* 3CDE8 8004C5E8 07002292 */  lbu        $v0, 0x7($s1)
/* 3CDEC 8004C5EC 00000000 */  nop
/* 3CDF0 8004C5F0 470002A2 */  sb         $v0, 0x47($s0)
/* 3CDF4 8004C5F4 0B00288A */  lwl        $t0, 0xB($s1)
/* 3CDF8 8004C5F8 0800289A */  lwr        $t0, 0x8($s1)
/* 3CDFC 8004C5FC 0C002986 */  lh         $t1, 0xC($s1)
/* 3CE00 8004C600 270008AA */  swl        $t0, 0x27($s0)
/* 3CE04 8004C604 240008BA */  swr        $t0, 0x24($s0)
/* 3CE08 8004C608 280009A6 */  sh         $t1, 0x28($s0)
/* 3CE0C 8004C60C 10002292 */  lbu        $v0, 0x10($s1)
/* 3CE10 8004C610 00000000 */  nop
/* 3CE14 8004C614 00160200 */  sll        $v0, $v0, 24
/* 3CE18 8004C618 03160200 */  sra        $v0, $v0, 24
/* 3CE1C 8004C61C 2C0002A6 */  sh         $v0, 0x2C($s0)
/* 3CE20 8004C620 11002292 */  lbu        $v0, 0x11($s1)
/* 3CE24 8004C624 00000000 */  nop
/* 3CE28 8004C628 00160200 */  sll        $v0, $v0, 24
/* 3CE2C 8004C62C 03160200 */  sra        $v0, $v0, 24
/* 3CE30 8004C630 2E0002A6 */  sh         $v0, 0x2E($s0)
/* 3CE34 8004C634 12002292 */  lbu        $v0, 0x12($s1)
/* 3CE38 8004C638 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 3CE3C 8004C63C 00160200 */  sll        $v0, $v0, 24
/* 3CE40 8004C640 03160200 */  sra        $v0, $v0, 24
/* 3CE44 8004C644 300002A6 */  sh         $v0, 0x30($s0)
/* 3CE48 8004C648 1400228E */  lw         $v0, 0x14($s1)
/* 3CE4C 8004C64C FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 3CE50 8004C650 24104300 */  and        $v0, $v0, $v1
/* 3CE54 8004C654 3C0002AE */  sw         $v0, 0x3C($s0)
/* 3CE58 8004C658 1800228E */  lw         $v0, 0x18($s1)
/* 3CE5C 8004C65C 00000000 */  nop
/* 3CE60 8004C660 24104300 */  and        $v0, $v0, $v1
/* 3CE64 8004C664 03008012 */  beqz       $s4, .L8004C674
/* 3CE68 8004C668 400002AE */   sw        $v0, 0x40($s0)
/* 3CE6C 8004C66C A0310108 */  j          .L8004C680
/* 3CE70 8004C670 0E0014A6 */   sh        $s4, 0xE($s0)
.L8004C674:
/* 3CE74 8004C674 1C002296 */  lhu        $v0, 0x1C($s1)
/* 3CE78 8004C678 00000000 */  nop
/* 3CE7C 8004C67C 0E0002A6 */  sh         $v0, 0xE($s0)
.L8004C680:
/* 3CE80 8004C680 1E002292 */  lbu        $v0, 0x1E($s1)
/* 3CE84 8004C684 00000000 */  nop
/* 3CE88 8004C688 1E0002A6 */  sh         $v0, 0x1E($s0)
/* 3CE8C 8004C68C 20002296 */  lhu        $v0, 0x20($s1)
/* 3CE90 8004C690 00000000 */  nop
/* 3CE94 8004C694 480002A6 */  sh         $v0, 0x48($s0)
/* 3CE98 8004C698 2E002296 */  lhu        $v0, 0x2E($s1)
/* 3CE9C 8004C69C 00000000 */  nop
/* 3CEA0 8004C6A0 320002A6 */  sh         $v0, 0x32($s0)
/* 3CEA4 8004C6A4 26002296 */  lhu        $v0, 0x26($s1)
/* 3CEA8 8004C6A8 00000000 */  nop
/* 3CEAC 8004C6AC 220002A6 */  sh         $v0, 0x22($s0)
/* 3CEB0 8004C6B0 28002296 */  lhu        $v0, 0x28($s1)
/* 3CEB4 8004C6B4 00000000 */  nop
/* 3CEB8 8004C6B8 340002A6 */  sh         $v0, 0x34($s0)
/* 3CEBC 8004C6BC 2A002296 */  lhu        $v0, 0x2A($s1)
/* 3CEC0 8004C6C0 00000000 */  nop
/* 3CEC4 8004C6C4 360002A6 */  sh         $v0, 0x36($s0)
/* 3CEC8 8004C6C8 2C002296 */  lhu        $v0, 0x2C($s1)
/* 3CECC 8004C6CC 00000000 */  nop
/* 3CED0 8004C6D0 380002A6 */  sh         $v0, 0x38($s0)
/* 3CED4 8004C6D4 25002292 */  lbu        $v0, 0x25($s1)
/* 3CED8 8004C6D8 00000000 */  nop
/* 3CEDC 8004C6DC 3B0002A2 */  sb         $v0, 0x3B($s0)
/* 3CEE0 8004C6E0 22002386 */  lh         $v1, 0x22($s1)
/* 3CEE4 8004C6E4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3CEE8 8004C6E8 0C006214 */  bne        $v1, $v0, .L8004C71C
/* 3CEEC 8004C6EC 00000000 */   nop
/* 3CEF0 8004C6F0 1E002292 */  lbu        $v0, 0x1E($s1)
/* 3CEF4 8004C6F4 00000000 */  nop
/* 3CEF8 8004C6F8 08004010 */  beqz       $v0, .L8004C71C
/* 3CEFC 8004C6FC 00100224 */   addiu     $v0, $zero, 0x1000
/* 3CF00 8004C700 48000486 */  lh         $a0, 0x48($s0)
/* 3CF04 8004C704 1E002392 */  lbu        $v1, 0x1E($s1)
/* 3CF08 8004C708 23104400 */  subu       $v0, $v0, $a0
/* 3CF0C 8004C70C 1A004300 */  div        $zero, $v0, $v1
/* 3CF10 8004C710 12100000 */  mflo       $v0
/* 3CF14 8004C714 CA310108 */  j          .L8004C728
/* 3CF18 8004C718 4A0002A6 */   sh        $v0, 0x4A($s0)
.L8004C71C:
/* 3CF1C 8004C71C 22002296 */  lhu        $v0, 0x22($s1)
/* 3CF20 8004C720 00000000 */  nop
/* 3CF24 8004C724 4A0002A6 */  sh         $v0, 0x4A($s0)
.L8004C728:
/* 3CF28 8004C728 1B002682 */  lb         $a2, 0x1B($s1)
/* 3CF2C 8004C72C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3CF30 8004C730 0B00C210 */  beq        $a2, $v0, .L8004C760
/* 3CF34 8004C734 00000000 */   nop
/* 3CF38 8004C738 17002582 */  lb         $a1, 0x17($s1)
/* 3CF3C 8004C73C 9D19010C */  jal        FX_GetTextureObject
/* 3CF40 8004C740 21204002 */   addu      $a0, $s2, $zero
/* 3CF44 8004C744 0003043C */  lui        $a0, (0x3000000 >> 16)
/* 3CF48 8004C748 100002AE */  sw         $v0, 0x10($s0)
/* 3CF4C 8004C74C 0C00428C */  lw         $v0, 0xC($v0)
/* 3CF50 8004C750 3C00038E */  lw         $v1, 0x3C($s0)
/* 3CF54 8004C754 24104400 */  and        $v0, $v0, $a0
/* 3CF58 8004C758 25186200 */  or         $v1, $v1, $v0
/* 3CF5C 8004C75C 3C0003AE */  sw         $v1, 0x3C($s0)
.L8004C760:
/* 3CF60 8004C760 03002292 */  lbu        $v0, 0x3($s1)
/* 3CF64 8004C764 01000324 */  addiu      $v1, $zero, 0x1
/* 3CF68 8004C768 03004314 */  bne        $v0, $v1, .L8004C778
/* 3CF6C 8004C76C 0580023C */   lui       $v0, %hi(FX_AttachedParticlePrimProcess)
/* 3CF70 8004C770 08874224 */  addiu      $v0, $v0, %lo(FX_AttachedParticlePrimProcess)
/* 3CF74 8004C774 180002AE */  sw         $v0, 0x18($s0)
.L8004C778:
/* 3CF78 8004C778 0E002292 */  lbu        $v0, 0xE($s1)
/* 3CF7C 8004C77C 00000000 */  nop
/* 3CF80 8004C780 05004314 */  bne        $v0, $v1, .L8004C798
/* 3CF84 8004C784 00000000 */   nop
/* 3CF88 8004C788 2A000296 */  lhu        $v0, 0x2A($s0)
/* 3CF8C 8004C78C 00000000 */  nop
/* 3CF90 8004C790 01004234 */  ori        $v0, $v0, 0x1
/* 3CF94 8004C794 2A0002A6 */  sh         $v0, 0x2A($s0)
.L8004C798:
/* 3CF98 8004C798 0F002292 */  lbu        $v0, 0xF($s1)
/* 3CF9C 8004C79C 00000000 */  nop
/* 3CFA0 8004C7A0 05004010 */  beqz       $v0, .L8004C7B8
/* 3CFA4 8004C7A4 00000000 */   nop
/* 3CFA8 8004C7A8 2A000296 */  lhu        $v0, 0x2A($s0)
/* 3CFAC 8004C7AC 00000000 */  nop
/* 3CFB0 8004C7B0 02004234 */  ori        $v0, $v0, 0x2
/* 3CFB4 8004C7B4 2A0002A6 */  sh         $v0, 0x2A($s0)
.L8004C7B8:
/* 3CFB8 8004C7B8 0E002392 */  lbu        $v1, 0xE($s1)
/* 3CFBC 8004C7BC 02000224 */  addiu      $v0, $zero, 0x2
/* 3CFC0 8004C7C0 0E006214 */  bne        $v1, $v0, .L8004C7FC
/* 3CFC4 8004C7C4 00000000 */   nop
/* 3CFC8 8004C7C8 D6EA010C */  jal        SoulReaverFire
/* 3CFCC 8004C7CC 00000000 */   nop
/* 3CFD0 8004C7D0 0A004010 */  beqz       $v0, .L8004C7FC
/* 3CFD4 8004C7D4 3C000326 */   addiu     $v1, $s0, 0x3C
/* 3CFD8 8004C7D8 3C000292 */  lbu        $v0, 0x3C($s0)
/* 3CFDC 8004C7DC 02006490 */  lbu        $a0, 0x2($v1)
/* 3CFE0 8004C7E0 020062A0 */  sb         $v0, 0x2($v1)
/* 3CFE4 8004C7E4 40000292 */  lbu        $v0, 0x40($s0)
/* 3CFE8 8004C7E8 40000326 */  addiu      $v1, $s0, 0x40
/* 3CFEC 8004C7EC 3C0004A2 */  sb         $a0, 0x3C($s0)
/* 3CFF0 8004C7F0 02006490 */  lbu        $a0, 0x2($v1)
/* 3CFF4 8004C7F4 020062A0 */  sb         $v0, 0x2($v1)
/* 3CFF8 8004C7F8 400004A2 */  sb         $a0, 0x40($s0)
.L8004C7FC:
/* 3CFFC 8004C7FC 1B2D010C */  jal        FX_InsertGeneralEffect
/* 3D000 8004C800 21200002 */   addu      $a0, $s0, $zero
/* 3D004 8004C804 21100002 */  addu       $v0, $s0, $zero
.L8004C808:
/* 3D008 8004C808 2400BF8F */  lw         $ra, 0x24($sp)
/* 3D00C 8004C80C 2000B48F */  lw         $s4, 0x20($sp)
/* 3D010 8004C810 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3D014 8004C814 1800B28F */  lw         $s2, 0x18($sp)
/* 3D018 8004C818 1400B18F */  lw         $s1, 0x14($sp)
/* 3D01C 8004C81C 1000B08F */  lw         $s0, 0x10($sp)
/* 3D020 8004C820 0800E003 */  jr         $ra
/* 3D024 8004C824 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_StartGenericParticle, . - FX_StartGenericParticle
