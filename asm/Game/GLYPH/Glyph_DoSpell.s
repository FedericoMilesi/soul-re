.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Glyph_DoSpell
/* 6C6A0 8007BEA0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 6C6A4 8007BEA4 7C00B1AF */  sw         $s1, 0x7C($sp)
/* 6C6A8 8007BEA8 2188A000 */  addu       $s1, $a1, $zero
/* 6C6AC 8007BEAC 9800BEAF */  sw         $fp, 0x98($sp)
/* 6C6B0 8007BEB0 21F00000 */  addu       $fp, $zero, $zero
/* 6C6B4 8007BEB4 8C00B5AF */  sw         $s5, 0x8C($sp)
/* 6C6B8 8007BEB8 21A8C003 */  addu       $s5, $fp, $zero
/* 6C6BC 8007BEBC 2138C003 */  addu       $a3, $fp, $zero
/* 6C6C0 8007BEC0 9400B7AF */  sw         $s7, 0x94($sp)
/* 6C6C4 8007BEC4 21B8C003 */  addu       $s7, $fp, $zero
/* 6C6C8 8007BEC8 9000B6AF */  sw         $s6, 0x90($sp)
/* 6C6CC 8007BECC 21B0C003 */  addu       $s6, $fp, $zero
/* 6C6D0 8007BED0 8800B4AF */  sw         $s4, 0x88($sp)
/* 6C6D4 8007BED4 21A0C003 */  addu       $s4, $fp, $zero
/* 6C6D8 8007BED8 8400B3AF */  sw         $s3, 0x84($sp)
/* 6C6DC 8007BEDC 2198C003 */  addu       $s3, $fp, $zero
/* 6C6E0 8007BEE0 9C00BFAF */  sw         $ra, 0x9C($sp)
/* 6C6E4 8007BEE4 8000B2AF */  sw         $s2, 0x80($sp)
/* 6C6E8 8007BEE8 7800B0AF */  sw         $s0, 0x78($sp)
/* 6C6EC 8007BEEC A000A4AF */  sw         $a0, 0xA0($sp)
/* 6C6F0 8007BEF0 1C00828C */  lw         $v0, 0x1C($a0)
/* 6C6F4 8007BEF4 2190C003 */  addu       $s2, $fp, $zero
/* 6C6F8 8007BEF8 1C00508C */  lw         $s0, 0x1C($v0)
/* 6C6FC 8007BEFC 5000A427 */  addiu      $a0, $sp, 0x50
/* 6C700 8007BF00 F0A480A7 */  sh         $zero, %gp_rel(fx_going)($gp)
/* 6C704 8007BF04 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 6C708 8007BF08 7000A7AF */   sw        $a3, 0x70($sp)
/* 6C70C 8007BF0C FFFF2326 */  addiu      $v1, $s1, -0x1
/* 6C710 8007BF10 7000A78F */  lw         $a3, 0x70($sp)
/* 6C714 8007BF14 40100300 */  sll        $v0, $v1, 1
/* 6C718 8007BF18 ECEC80AF */  sw         $zero, %gp_rel(fx_radius_old)($gp)
/* 6C71C 8007BF1C 21800202 */  addu       $s0, $s0, $v0
/* 6C720 8007BF20 0C000486 */  lh         $a0, 0xC($s0)
/* 6C724 8007BF24 2180C003 */  addu       $s0, $fp, $zero
/* 6C728 8007BF28 E8EC84AF */  sw         $a0, %gp_rel(blast_range)($gp)
/* 6C72C 8007BF2C 02008104 */  bgez       $a0, .L8007BF38
/* 6C730 8007BF30 21108000 */   addu      $v0, $a0, $zero
/* 6C734 8007BF34 03008224 */  addiu      $v0, $a0, 0x3
.L8007BF38:
/* 6C738 8007BF38 83100200 */  sra        $v0, $v0, 2
/* 6C73C 8007BF3C 23888200 */  subu       $s1, $a0, $v0
/* 6C740 8007BF40 0700622C */  sltiu      $v0, $v1, 0x7
/* 6C744 8007BF44 51004010 */  beqz       $v0, .L8007C08C
/* 6C748 8007BF48 0180023C */   lui       $v0, %hi(jtbl_80011E18)
/* 6C74C 8007BF4C 181E4224 */  addiu      $v0, $v0, %lo(jtbl_80011E18)
/* 6C750 8007BF50 80180300 */  sll        $v1, $v1, 2
/* 6C754 8007BF54 21186200 */  addu       $v1, $v1, $v0
/* 6C758 8007BF58 0000628C */  lw         $v0, 0x0($v1)
/* 6C75C 8007BF5C 00000000 */  nop
/* 6C760 8007BF60 08004000 */  jr         $v0
/* 6C764 8007BF64 00000000 */   nop
jlabel .L8007BF68
/* 6C768 8007BF68 01001E24 */  addiu      $fp, $zero, 0x1
/* 6C76C 8007BF6C FF00073C */  lui        $a3, (0xFFFFFF >> 16)
/* 6C770 8007BF70 FFFFE734 */  ori        $a3, $a3, (0xFFFFFF & 0xFFFF)
/* 6C774 8007BF74 00FE1724 */  addiu      $s7, $zero, -0x200
/* 6C778 8007BF78 21B00000 */  addu       $s6, $zero, $zero
/* 6C77C 8007BF7C 00021424 */  addiu      $s4, $zero, 0x200
/* 6C780 8007BF80 1000153C */  lui        $s5, (0x100000 >> 16)
/* 6C784 8007BF84 80021324 */  addiu      $s3, $zero, 0x280
/* 6C788 8007BF88 06000224 */  addiu      $v0, $zero, 0x6
/* 6C78C 8007BF8C F0A482A7 */  sh         $v0, %gp_rel(fx_going)($gp)
/* 6C790 8007BF90 23F00108 */  j          .L8007C08C
/* 6C794 8007BF94 40031224 */   addiu     $s2, $zero, 0x340
jlabel .L8007BF98
/* 6C798 8007BF98 01001E24 */  addiu      $fp, $zero, 0x1
/* 6C79C 8007BF9C FF00073C */  lui        $a3, (0xFF0000 >> 16)
/* 6C7A0 8007BFA0 00FE1724 */  addiu      $s7, $zero, -0x200
/* 6C7A4 8007BFA4 21B00000 */  addu       $s6, $zero, $zero
/* 6C7A8 8007BFA8 00021424 */  addiu      $s4, $zero, 0x200
/* 6C7AC 8007BFAC 1000153C */  lui        $s5, (0x100000 >> 16)
/* 6C7B0 8007BFB0 80021324 */  addiu      $s3, $zero, 0x280
/* 6C7B4 8007BFB4 04000224 */  addiu      $v0, $zero, 0x4
/* 6C7B8 8007BFB8 F0A482A7 */  sh         $v0, %gp_rel(fx_going)($gp)
/* 6C7BC 8007BFBC 23F00108 */  j          .L8007C08C
/* 6C7C0 8007BFC0 40031224 */   addiu     $s2, $zero, 0x340
jlabel .L8007BFC4
/* 6C7C4 8007BFC4 01001E24 */  addiu      $fp, $zero, 0x1
/* 6C7C8 8007BFC8 1000153C */  lui        $s5, (0x100000 >> 16)
/* 6C7CC 8007BFCC FF000724 */  addiu      $a3, $zero, 0xFF
/* 6C7D0 8007BFD0 00FE1724 */  addiu      $s7, $zero, -0x200
/* 6C7D4 8007BFD4 21B00000 */  addu       $s6, $zero, $zero
/* 6C7D8 8007BFD8 00021424 */  addiu      $s4, $zero, 0x200
/* 6C7DC 8007BFDC 80021324 */  addiu      $s3, $zero, 0x280
/* 6C7E0 8007BFE0 05000224 */  addiu      $v0, $zero, 0x5
/* 6C7E4 8007BFE4 F0A482A7 */  sh         $v0, %gp_rel(fx_going)($gp)
/* 6C7E8 8007BFE8 23F00108 */  j          .L8007C08C
/* 6C7EC 8007BFEC 40031224 */   addiu     $s2, $zero, 0x340
jlabel .L8007BFF0
/* 6C7F0 8007BFF0 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 6C7F4 8007BFF4 3C000524 */  addiu      $a1, $zero, 0x3C
/* 6C7F8 8007BFF8 205C000C */  jal        CAMERA_SetShake
/* 6C7FC 8007BFFC 00080624 */   addiu     $a2, $zero, 0x800
/* 6C800 8007C000 80021E24 */  addiu      $fp, $zero, 0x280
/* 6C804 8007C004 1400153C */  lui        $s5, (0x140000 >> 16)
/* 6C808 8007C008 A000073C */  lui        $a3, (0xA0A0A0 >> 16)
/* 6C80C 8007C00C A0A0E734 */  ori        $a3, $a3, (0xA0A0A0 & 0xFFFF)
/* 6C810 8007C010 21A00000 */  addu       $s4, $zero, $zero
/* 6C814 8007C014 21B08002 */  addu       $s6, $s4, $zero
/* 6C818 8007C018 21B88002 */  addu       $s7, $s4, $zero
/* 6C81C 8007C01C 2198C003 */  addu       $s3, $fp, $zero
/* 6C820 8007C020 02000224 */  addiu      $v0, $zero, 0x2
/* 6C824 8007C024 F0A482A7 */  sh         $v0, %gp_rel(fx_going)($gp)
/* 6C828 8007C028 23F00108 */  j          .L8007C08C
/* 6C82C 8007C02C 40031224 */   addiu     $s2, $zero, 0x340
jlabel .L8007C030
/* 6C830 8007C030 01001E24 */  addiu      $fp, $zero, 0x1
/* 6C834 8007C034 C000073C */  lui        $a3, (0xC0C0C0 >> 16)
/* 6C838 8007C038 C0C0E734 */  ori        $a3, $a3, (0xC0C0C0 & 0xFFFF)
/* 6C83C 8007C03C 00FF1724 */  addiu      $s7, $zero, -0x100
/* 6C840 8007C040 00011624 */  addiu      $s6, $zero, 0x100
/* 6C844 8007C044 00031424 */  addiu      $s4, $zero, 0x300
/* 6C848 8007C048 2000153C */  lui        $s5, (0x200000 >> 16)
/* 6C84C 8007C04C 80FD1324 */  addiu      $s3, $zero, -0x280
/* 6C850 8007C050 F0A49EA7 */  sh         $fp, %gp_rel(fx_going)($gp)
/* 6C854 8007C054 23F00108 */  j          .L8007C08C
/* 6C858 8007C058 21900000 */   addu      $s2, $zero, $zero
jlabel .L8007C05C
/* 6C85C 8007C05C 01001E24 */  addiu      $fp, $zero, 0x1
/* 6C860 8007C060 FF00073C */  lui        $a3, (0xFFFFFF >> 16)
/* 6C864 8007C064 FFFFE734 */  ori        $a3, $a3, (0xFFFFFF & 0xFFFF)
/* 6C868 8007C068 21B80000 */  addu       $s7, $zero, $zero
/* 6C86C 8007C06C 40001624 */  addiu      $s6, $zero, 0x40
/* 6C870 8007C070 80001424 */  addiu      $s4, $zero, 0x80
/* 6C874 8007C074 1000153C */  lui        $s5, (0x100000 >> 16)
/* 6C878 8007C078 80021324 */  addiu      $s3, $zero, 0x280
/* 6C87C 8007C07C 40031224 */  addiu      $s2, $zero, 0x340
/* 6C880 8007C080 03000224 */  addiu      $v0, $zero, 0x3
/* 6C884 8007C084 F0A482A7 */  sh         $v0, %gp_rel(fx_going)($gp)
/* 6C888 8007C088 05001024 */  addiu      $s0, $zero, 0x5
jlabel .L8007C08C
/* 6C88C 8007C08C F0A48287 */  lh         $v0, %gp_rel(fx_going)($gp)
/* 6C890 8007C090 00000000 */  nop
/* 6C894 8007C094 1C004010 */  beqz       $v0, .L8007C108
/* 6C898 8007C098 21200000 */   addu      $a0, $zero, $zero
/* 6C89C 8007C09C 5000A627 */  addiu      $a2, $sp, 0x50
/* 6C8A0 8007C0A0 A000A88F */  lw         $t0, 0xA0($sp)
/* 6C8A4 8007C0A4 E8EC838F */  lw         $v1, %gp_rel(blast_range)($gp)
/* 6C8A8 8007C0A8 00F80224 */  addiu      $v0, $zero, -0x800
/* 6C8AC 8007C0AC 2800A2AF */  sw         $v0, 0x28($sp)
/* 6C8B0 8007C0B0 9DFF0224 */  addiu      $v0, $zero, -0x63
/* 6C8B4 8007C0B4 3800A7AF */  sw         $a3, 0x38($sp)
/* 6C8B8 8007C0B8 FFFF0724 */  addiu      $a3, $zero, -0x1
/* 6C8BC 8007C0BC 1000BEAF */  sw         $fp, 0x10($sp)
/* 6C8C0 8007C0C0 1800B1AF */  sw         $s1, 0x18($sp)
/* 6C8C4 8007C0C4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6C8C8 8007C0C8 2000B2AF */  sw         $s2, 0x20($sp)
/* 6C8CC 8007C0CC 2400B5AF */  sw         $s5, 0x24($sp)
/* 6C8D0 8007C0D0 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 6C8D4 8007C0D4 3000B6AF */  sw         $s6, 0x30($sp)
/* 6C8D8 8007C0D8 3400B4AF */  sw         $s4, 0x34($sp)
/* 6C8DC 8007C0DC 3C00A0AF */  sw         $zero, 0x3C($sp)
/* 6C8E0 8007C0E0 4000B0AF */  sw         $s0, 0x40($sp)
/* 6C8E4 8007C0E4 4400A2AF */  sw         $v0, 0x44($sp)
/* 6C8E8 8007C0E8 4800A0AF */  sw         $zero, 0x48($sp)
/* 6C8EC 8007C0EC 5C000525 */  addiu      $a1, $t0, 0x5C
/* 6C8F0 8007C0F0 CE2F010C */  jal        FX_DoBlastRing
/* 6C8F4 8007C0F4 1400A3AF */   sw        $v1, 0x14($sp)
/* 6C8F8 8007C0F8 F4A482AF */  sw         $v0, %gp_rel(fx_blastring)($gp)
/* 6C8FC 8007C0FC 02004014 */  bnez       $v0, .L8007C108
/* 6C900 8007C100 00000000 */   nop
/* 6C904 8007C104 F0A480A7 */  sh         $zero, %gp_rel(fx_going)($gp)
.L8007C108:
/* 6C908 8007C108 E8EC828F */  lw         $v0, %gp_rel(blast_range)($gp)
/* 6C90C 8007C10C 9C00BF8F */  lw         $ra, 0x9C($sp)
/* 6C910 8007C110 9800BE8F */  lw         $fp, 0x98($sp)
/* 6C914 8007C114 9400B78F */  lw         $s7, 0x94($sp)
/* 6C918 8007C118 9000B68F */  lw         $s6, 0x90($sp)
/* 6C91C 8007C11C 8C00B58F */  lw         $s5, 0x8C($sp)
/* 6C920 8007C120 8800B48F */  lw         $s4, 0x88($sp)
/* 6C924 8007C124 8400B38F */  lw         $s3, 0x84($sp)
/* 6C928 8007C128 8000B28F */  lw         $s2, 0x80($sp)
/* 6C92C 8007C12C 7C00B18F */  lw         $s1, 0x7C($sp)
/* 6C930 8007C130 7800B08F */  lw         $s0, 0x78($sp)
/* 6C934 8007C134 00130200 */  sll        $v0, $v0, 12
/* 6C938 8007C138 E8EC82AF */  sw         $v0, %gp_rel(blast_range)($gp)
/* 6C93C 8007C13C 0800E003 */  jr         $ra
/* 6C940 8007C140 A000BD27 */   addiu     $sp, $sp, 0xA0
.size Glyph_DoSpell, . - Glyph_DoSpell
