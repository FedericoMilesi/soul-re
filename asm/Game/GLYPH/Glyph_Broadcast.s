.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Glyph_Broadcast
/* 6C448 8007BC48 E8EC828F */  lw         $v0, %gp_rel(blast_range)($gp)
/* 6C44C 8007BC4C ECEC838F */  lw         $v1, %gp_rel(fx_radius_old)($gp)
/* 6C450 8007BC50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6C454 8007BC54 3400B7AF */  sw         $s7, 0x34($sp)
/* 6C458 8007BC58 D2BD9787 */  lh         $s7, %gp_rel(gameTrackerX + 0xA)($gp)
/* 6C45C 8007BC5C 3000B6AF */  sw         $s6, 0x30($sp)
/* 6C460 8007BC60 21B08000 */  addu       $s6, $a0, $zero
/* 6C464 8007BC64 2800B4AF */  sw         $s4, 0x28($sp)
/* 6C468 8007BC68 21A00000 */  addu       $s4, $zero, $zero
/* 6C46C 8007BC6C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 6C470 8007BC70 2400B3AF */  sw         $s3, 0x24($sp)
/* 6C474 8007BC74 03AB0200 */  sra        $s5, $v0, 12
/* 6C478 8007BC78 C0101500 */  sll        $v0, $s5, 3
/* 6C47C 8007BC7C 23205500 */  subu       $a0, $v0, $s5
/* 6C480 8007BC80 F4A4828F */  lw         $v0, %gp_rel(fx_blastring)($gp)
/* 6C484 8007BC84 21988002 */  addu       $s3, $s4, $zero
/* 6C488 8007BC88 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 6C48C 8007BC8C 3800BEAF */  sw         $fp, 0x38($sp)
/* 6C490 8007BC90 2000B2AF */  sw         $s2, 0x20($sp)
/* 6C494 8007BC94 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6C498 8007BC98 1800B0AF */  sw         $s0, 0x18($sp)
/* 6C49C 8007BC9C 3C00428C */  lw         $v0, 0x3C($v0)
/* 6C4A0 8007BCA0 03F30300 */  sra        $fp, $v1, 12
/* 6C4A4 8007BCA4 03130200 */  sra        $v0, $v0, 12
/* 6C4A8 8007BCA8 02008104 */  bgez       $a0, .L8007BCB4
/* 6C4AC 8007BCAC 1000A2AF */   sw        $v0, 0x10($sp)
/* 6C4B0 8007BCB0 07008424 */  addiu      $a0, $a0, 0x7
.L8007BCB4:
/* 6C4B4 8007BCB4 FFFFA324 */  addiu      $v1, $a1, -0x1
/* 6C4B8 8007BCB8 0700622C */  sltiu      $v0, $v1, 0x7
/* 6C4BC 8007BCBC 20004010 */  beqz       $v0, .L8007BD40
/* 6C4C0 8007BCC0 C3A80400 */   sra       $s5, $a0, 3
/* 6C4C4 8007BCC4 0180023C */  lui        $v0, %hi(jtbl_80011DF8)
/* 6C4C8 8007BCC8 F81D4224 */  addiu      $v0, $v0, %lo(jtbl_80011DF8)
/* 6C4CC 8007BCCC 80180300 */  sll        $v1, $v1, 2
/* 6C4D0 8007BCD0 21186200 */  addu       $v1, $v1, $v0
/* 6C4D4 8007BCD4 0000628C */  lw         $v0, 0x0($v1)
/* 6C4D8 8007BCD8 00000000 */  nop
/* 6C4DC 8007BCDC 08004000 */  jr         $v0
/* 6C4E0 8007BCE0 00000000 */   nop
jlabel .L8007BCE4
/* 6C4E4 8007BCE4 0A001424 */  addiu      $s4, $zero, 0xA
/* 6C4E8 8007BCE8 0800133C */  lui        $s3, (0x80006 >> 16)
/* 6C4EC 8007BCEC 50EF0108 */  j          .L8007BD40
/* 6C4F0 8007BCF0 06007336 */   ori       $s3, $s3, (0x80006 & 0xFFFF)
jlabel .L8007BCF4
/* 6C4F4 8007BCF4 0A001424 */  addiu      $s4, $zero, 0xA
/* 6C4F8 8007BCF8 0800133C */  lui        $s3, (0x80004 >> 16)
/* 6C4FC 8007BCFC 50EF0108 */  j          .L8007BD40
/* 6C500 8007BD00 04007336 */   ori       $s3, $s3, (0x80004 & 0xFFFF)
jlabel .L8007BD04
/* 6C504 8007BD04 2A001424 */  addiu      $s4, $zero, 0x2A
/* 6C508 8007BD08 0800133C */  lui        $s3, (0x80005 >> 16)
/* 6C50C 8007BD0C 50EF0108 */  j          .L8007BD40
/* 6C510 8007BD10 05007336 */   ori       $s3, $s3, (0x80005 & 0xFFFF)
jlabel .L8007BD14
/* 6C514 8007BD14 0A001424 */  addiu      $s4, $zero, 0xA
/* 6C518 8007BD18 0800133C */  lui        $s3, (0x80002 >> 16)
/* 6C51C 8007BD1C 50EF0108 */  j          .L8007BD40
/* 6C520 8007BD20 02007336 */   ori       $s3, $s3, (0x80002 & 0xFFFF)
jlabel .L8007BD24
/* 6C524 8007BD24 0A001424 */  addiu      $s4, $zero, 0xA
/* 6C528 8007BD28 0800133C */  lui        $s3, (0x80001 >> 16)
/* 6C52C 8007BD2C 50EF0108 */  j          .L8007BD40
/* 6C530 8007BD30 01007336 */   ori       $s3, $s3, (0x80001 & 0xFFFF)
jlabel .L8007BD34
/* 6C534 8007BD34 0A001424 */  addiu      $s4, $zero, 0xA
/* 6C538 8007BD38 0800133C */  lui        $s3, (0x80003 >> 16)
/* 6C53C 8007BD3C 03007336 */  ori        $s3, $s3, (0x80003 & 0xFFFF)
.L8007BD40:
/* 6C540 8007BD40 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 6C544 8007BD44 00000000 */  nop
/* 6C548 8007BD48 0400528C */  lw         $s2, 0x4($v0)
/* 6C54C 8007BD4C 00000000 */  nop
/* 6C550 8007BD50 47004012 */  beqz       $s2, .L8007BE70
/* 6C554 8007BD54 21204002 */   addu      $a0, $s2, $zero
.L8007BD58:
/* 6C558 8007BD58 92D1000C */  jal        INSTANCE_Query
/* 6C55C 8007BD5C 01000524 */   addiu     $a1, $zero, 0x1
/* 6C560 8007BD60 3F005612 */  beq        $s2, $s6, .L8007BE60
/* 6C564 8007BD64 21804000 */   addu      $s0, $v0, $zero
/* 6C568 8007BD68 24101402 */  and        $v0, $s0, $s4
/* 6C56C 8007BD6C 3C004010 */  beqz       $v0, .L8007BE60
/* 6C570 8007BD70 21204002 */   addu      $a0, $s2, $zero
/* 6C574 8007BD74 E5D1000C */  jal        INSTANCE_InPlane
/* 6C578 8007BD78 2128E002 */   addu      $a1, $s7, $zero
/* 6C57C 8007BD7C 38004010 */  beqz       $v0, .L8007BE60
/* 6C580 8007BD80 20000224 */   addiu     $v0, $zero, 0x20
/* 6C584 8007BD84 06000216 */  bne        $s0, $v0, .L8007BDA0
/* 6C588 8007BD88 21204002 */   addu      $a0, $s2, $zero
/* 6C58C 8007BD8C 92D1000C */  jal        INSTANCE_Query
/* 6C590 8007BD90 02000524 */   addiu     $a1, $zero, 0x2
/* 6C594 8007BD94 00404230 */  andi       $v0, $v0, 0x4000
/* 6C598 8007BD98 31004010 */  beqz       $v0, .L8007BE60
/* 6C59C 8007BD9C 00000000 */   nop
.L8007BDA0:
/* 6C5A0 8007BDA0 4400468E */  lw         $a2, 0x44($s2)
/* 6C5A4 8007BDA4 00000000 */  nop
/* 6C5A8 8007BDA8 2D00C010 */  beqz       $a2, .L8007BE60
/* 6C5AC 8007BDAC 00000000 */   nop
/* 6C5B0 8007BDB0 4000438E */  lw         $v1, 0x40($s2)
/* 6C5B4 8007BDB4 00000000 */  nop
/* 6C5B8 8007BDB8 29006010 */  beqz       $v1, .L8007BE60
/* 6C5BC 8007BDBC 00000000 */   nop
/* 6C5C0 8007BDC0 1400628C */  lw         $v0, 0x14($v1)
/* 6C5C4 8007BDC4 1800638C */  lw         $v1, 0x18($v1)
/* 6C5C8 8007BDC8 5C00C486 */  lh         $a0, 0x5C($s6)
/* 6C5CC 8007BDCC 5E00C586 */  lh         $a1, 0x5E($s6)
/* 6C5D0 8007BDD0 1400D08C */  lw         $s0, 0x14($a2)
/* 6C5D4 8007BDD4 1800D18C */  lw         $s1, 0x18($a2)
/* 6C5D8 8007BDD8 23204400 */  subu       $a0, $v0, $a0
/* 6C5DC 8007BDDC E2E8000C */  jal        MATH3D_veclen2
/* 6C5E0 8007BDE0 23286500 */   subu      $a1, $v1, $a1
/* 6C5E4 8007BDE4 5C00C486 */  lh         $a0, 0x5C($s6)
/* 6C5E8 8007BDE8 5E00C586 */  lh         $a1, 0x5E($s6)
/* 6C5EC 8007BDEC 23200402 */  subu       $a0, $s0, $a0
/* 6C5F0 8007BDF0 23282502 */  subu       $a1, $s1, $a1
/* 6C5F4 8007BDF4 E2E8000C */  jal        MATH3D_veclen2
/* 6C5F8 8007BDF8 21804000 */   addu      $s0, $v0, $zero
/* 6C5FC 8007BDFC 1000A78F */  lw         $a3, 0x10($sp)
/* 6C600 8007BE00 00000000 */  nop
/* 6C604 8007BE04 2A80F000 */  slt        $s0, $a3, $s0
/* 6C608 8007BE08 15000016 */  bnez       $s0, .L8007BE60
/* 6C60C 8007BE0C 2A10C203 */   slt       $v0, $fp, $v0
/* 6C610 8007BE10 13004010 */  beqz       $v0, .L8007BE60
/* 6C614 8007BE14 00000000 */   nop
/* 6C618 8007BE18 4000428E */  lw         $v0, 0x40($s2)
/* 6C61C 8007BE1C 6000C486 */  lh         $a0, 0x60($s6)
/* 6C620 8007BE20 1C00438C */  lw         $v1, 0x1C($v0)
/* 6C624 8007BE24 00000000 */  nop
/* 6C628 8007BE28 23106400 */  subu       $v0, $v1, $a0
/* 6C62C 8007BE2C 05004004 */  bltz       $v0, .L8007BE44
/* 6C630 8007BE30 2A105500 */   slt       $v0, $v0, $s5
/* 6C634 8007BE34 07004014 */  bnez       $v0, .L8007BE54
/* 6C638 8007BE38 21204002 */   addu      $a0, $s2, $zero
/* 6C63C 8007BE3C 98EF0108 */  j          .L8007BE60
/* 6C640 8007BE40 00000000 */   nop
.L8007BE44:
/* 6C644 8007BE44 23108300 */  subu       $v0, $a0, $v1
/* 6C648 8007BE48 2A105500 */  slt        $v0, $v0, $s5
/* 6C64C 8007BE4C 04004010 */  beqz       $v0, .L8007BE60
/* 6C650 8007BE50 21204002 */   addu      $a0, $s2, $zero
.L8007BE54:
/* 6C654 8007BE54 21286002 */  addu       $a1, $s3, $zero
/* 6C658 8007BE58 A1D1000C */  jal        INSTANCE_Post
/* 6C65C 8007BE5C 21300000 */   addu      $a2, $zero, $zero
.L8007BE60:
/* 6C660 8007BE60 0800528E */  lw         $s2, 0x8($s2)
/* 6C664 8007BE64 00000000 */  nop
/* 6C668 8007BE68 BBFF4016 */  bnez       $s2, .L8007BD58
/* 6C66C 8007BE6C 21204002 */   addu      $a0, $s2, $zero
jlabel .L8007BE70
/* 6C670 8007BE70 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 6C674 8007BE74 3800BE8F */  lw         $fp, 0x38($sp)
/* 6C678 8007BE78 3400B78F */  lw         $s7, 0x34($sp)
/* 6C67C 8007BE7C 3000B68F */  lw         $s6, 0x30($sp)
/* 6C680 8007BE80 2C00B58F */  lw         $s5, 0x2C($sp)
/* 6C684 8007BE84 2800B48F */  lw         $s4, 0x28($sp)
/* 6C688 8007BE88 2400B38F */  lw         $s3, 0x24($sp)
/* 6C68C 8007BE8C 2000B28F */  lw         $s2, 0x20($sp)
/* 6C690 8007BE90 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6C694 8007BE94 1800B08F */  lw         $s0, 0x18($sp)
/* 6C698 8007BE98 0800E003 */  jr         $ra
/* 6C69C 8007BE9C 4000BD27 */   addiu     $sp, $sp, 0x40
.size Glyph_Broadcast, . - Glyph_Broadcast
