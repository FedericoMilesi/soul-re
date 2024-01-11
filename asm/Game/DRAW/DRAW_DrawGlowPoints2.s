.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_DrawGlowPoints2
/* 1C638 8002BE38 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1C63C 8002BE3C 6800B0AF */  sw         $s0, 0x68($sp)
/* 1C640 8002BE40 21808000 */  addu       $s0, $a0, $zero
/* 1C644 8002BE44 6C00B1AF */  sw         $s1, 0x6C($sp)
/* 1C648 8002BE48 2188C000 */  addu       $s1, $a2, $zero
/* 1C64C 8002BE4C 7400B3AF */  sw         $s3, 0x74($sp)
/* 1C650 8002BE50 2198E000 */  addu       $s3, $a3, $zero
/* 1C654 8002BE54 2130A000 */  addu       $a2, $a1, $zero
/* 1C658 8002BE58 F0AC858F */  lw         $a1, %gp_rel(theCamera + 0x60)($gp)
/* 1C65C 8002BE5C 7800B4AF */  sw         $s4, 0x78($sp)
/* 1C660 8002BE60 9800B48F */  lw         $s4, 0x98($sp)
/* 1C664 8002BE64 2800A727 */  addiu      $a3, $sp, 0x28
/* 1C668 8002BE68 7C00BFAF */  sw         $ra, 0x7C($sp)
/* 1C66C 8002BE6C 00F3000C */  jal        PIPE3D_Segment2ScreenPt
/* 1C670 8002BE70 7000B2AF */   sw        $s2, 0x70($sp)
/* 1C674 8002BE74 14005224 */  addiu      $s2, $v0, 0x14
/* 1C678 8002BE78 21200002 */  addu       $a0, $s0, $zero
/* 1C67C 8002BE7C 21302002 */  addu       $a2, $s1, $zero
/* 1C680 8002BE80 F0AC858F */  lw         $a1, %gp_rel(theCamera + 0x60)($gp)
/* 1C684 8002BE84 00F3000C */  jal        PIPE3D_Segment2ScreenPt
/* 1C688 8002BE88 3000A727 */   addiu     $a3, $sp, 0x30
/* 1C68C 8002BE8C 14005024 */  addiu      $s0, $v0, 0x14
/* 1C690 8002BE90 2A105002 */  slt        $v0, $s2, $s0
/* 1C694 8002BE94 02004010 */  beqz       $v0, .L8002BEA0
/* 1C698 8002BE98 00000000 */   nop
/* 1C69C 8002BE9C 21900002 */  addu       $s2, $s0, $zero
.L8002BEA0:
/* 1C6A0 8002BEA0 3700401A */  blez       $s2, .L8002BF80
/* 1C6A4 8002BEA4 00000000 */   nop
/* 1C6A8 8002BEA8 2800A687 */  lh         $a2, 0x28($sp)
/* 1C6AC 8002BEAC 3000A787 */  lh         $a3, 0x30($sp)
/* 1C6B0 8002BEB0 2A00A287 */  lh         $v0, 0x2A($sp)
/* 1C6B4 8002BEB4 3200A387 */  lh         $v1, 0x32($sp)
/* 1C6B8 8002BEB8 2320E600 */  subu       $a0, $a3, $a2
/* 1C6BC 8002BEBC 23286200 */  subu       $a1, $v1, $v0
/* 1C6C0 8002BEC0 3800A6AF */  sw         $a2, 0x38($sp)
/* 1C6C4 8002BEC4 3C00A2AF */  sw         $v0, 0x3C($sp)
/* 1C6C8 8002BEC8 4800A7AF */  sw         $a3, 0x48($sp)
/* 1C6CC 8002BECC 4C00A3AF */  sw         $v1, 0x4C($sp)
/* 1C6D0 8002BED0 5800A4AF */  sw         $a0, 0x58($sp)
/* 1C6D4 8002BED4 E2E8000C */  jal        MATH3D_veclen2
/* 1C6D8 8002BED8 5C00A5AF */   sw        $a1, 0x5C($sp)
/* 1C6DC 8002BEDC 21885400 */  addu       $s1, $v0, $s4
/* 1C6E0 8002BEE0 5800A58F */  lw         $a1, 0x58($sp)
/* 1C6E4 8002BEE4 5C00A48F */  lw         $a0, 0x5C($sp)
/* 1C6E8 8002BEE8 26F3020C */  jal        ratan2
/* 1C6EC 8002BEEC 23280500 */   negu      $a1, $a1
/* 1C6F0 8002BEF0 21385002 */  addu       $a3, $s2, $s0
/* 1C6F4 8002BEF4 4800A38F */  lw         $v1, 0x48($sp)
/* 1C6F8 8002BEF8 3800A58F */  lw         $a1, 0x38($sp)
/* 1C6FC 8002BEFC 4C00A48F */  lw         $a0, 0x4C($sp)
/* 1C700 8002BF00 3C00A68F */  lw         $a2, 0x3C($sp)
/* 1C704 8002BF04 0A005226 */  addiu      $s2, $s2, 0xA
/* 1C708 8002BF08 6000A0AF */  sw         $zero, 0x60($sp)
/* 1C70C 8002BF0C 21186500 */  addu       $v1, $v1, $a1
/* 1C710 8002BF10 21208600 */  addu       $a0, $a0, $a2
/* 1C714 8002BF14 C22F0300 */  srl        $a1, $v1, 31
/* 1C718 8002BF18 5800A3AF */  sw         $v1, 0x58($sp)
/* 1C71C 8002BF1C 21186500 */  addu       $v1, $v1, $a1
/* 1C720 8002BF20 43180300 */  sra        $v1, $v1, 1
/* 1C724 8002BF24 5800A3AF */  sw         $v1, 0x58($sp)
/* 1C728 8002BF28 C21F0400 */  srl        $v1, $a0, 31
/* 1C72C 8002BF2C 5C00A4AF */  sw         $a0, 0x5C($sp)
/* 1C730 8002BF30 21208300 */  addu       $a0, $a0, $v1
/* 1C734 8002BF34 43200400 */  sra        $a0, $a0, 1
/* 1C738 8002BF38 FF0F4330 */  andi       $v1, $v0, 0xFFF
/* 1C73C 8002BF3C C2170700 */  srl        $v0, $a3, 31
/* 1C740 8002BF40 2138E200 */  addu       $a3, $a3, $v0
/* 1C744 8002BF44 43380700 */  sra        $a3, $a3, 1
/* 1C748 8002BF48 80280700 */  sll        $a1, $a3, 2
/* 1C74C 8002BF4C 000C422A */  slti       $v0, $s2, 0xC00
/* 1C750 8002BF50 0B004010 */  beqz       $v0, .L8002BF80
/* 1C754 8002BF54 5C00A4AF */   sw        $a0, 0x5C($sp)
/* 1C758 8002BF58 5800A427 */  addiu      $a0, $sp, 0x58
/* 1C75C 8002BF5C 9000A78F */  lw         $a3, 0x90($sp)
/* 1C760 8002BF60 9400A28F */  lw         $v0, 0x94($sp)
/* 1C764 8002BF64 21306002 */  addu       $a2, $s3, $zero
/* 1C768 8002BF68 1000B2AF */  sw         $s2, 0x10($sp)
/* 1C76C 8002BF6C 1800B1AF */  sw         $s1, 0x18($sp)
/* 1C770 8002BF70 1C00B4AF */  sw         $s4, 0x1C($sp)
/* 1C774 8002BF74 2000A3AF */  sw         $v1, 0x20($sp)
/* 1C778 8002BF78 23AE000C */  jal        DRAW_CreateAGlowingCircle
/* 1C77C 8002BF7C 1400A2AF */   sw        $v0, 0x14($sp)
.L8002BF80:
/* 1C780 8002BF80 0400628E */  lw         $v0, 0x4($s3)
/* 1C784 8002BF84 7C00BF8F */  lw         $ra, 0x7C($sp)
/* 1C788 8002BF88 7800B48F */  lw         $s4, 0x78($sp)
/* 1C78C 8002BF8C 7400B38F */  lw         $s3, 0x74($sp)
/* 1C790 8002BF90 7000B28F */  lw         $s2, 0x70($sp)
/* 1C794 8002BF94 6C00B18F */  lw         $s1, 0x6C($sp)
/* 1C798 8002BF98 6800B08F */  lw         $s0, 0x68($sp)
/* 1C79C 8002BF9C 0800E003 */  jr         $ra
/* 1C7A0 8002BFA0 8000BD27 */   addiu     $sp, $sp, 0x80
.size DRAW_DrawGlowPoints2, . - DRAW_DrawGlowPoints2
