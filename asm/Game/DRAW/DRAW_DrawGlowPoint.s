.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_DrawGlowPoint
/* 1C7A4 8002BFA4 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 1C7A8 8002BFA8 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 1C7AC 8002BFAC 2198C000 */  addu       $s3, $a2, $zero
/* 1C7B0 8002BFB0 2130A000 */  addu       $a2, $a1, $zero
/* 1C7B4 8002BFB4 F4BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x22C)($gp)
/* 1C7B8 8002BFB8 F0AC858F */  lw         $a1, %gp_rel(theCamera + 0x60)($gp)
/* 1C7BC 8002BFBC 4000B0AF */  sw         $s0, 0x40($sp)
/* 1C7C0 8002BFC0 6C00B08F */  lw         $s0, 0x6C($sp)
/* 1C7C4 8002BFC4 5000B4AF */  sw         $s4, 0x50($sp)
/* 1C7C8 8002BFC8 21A0E000 */  addu       $s4, $a3, $zero
/* 1C7CC 8002BFCC 4400B1AF */  sw         $s1, 0x44($sp)
/* 1C7D0 8002BFD0 7000B18F */  lw         $s1, 0x70($sp)
/* 1C7D4 8002BFD4 2800A727 */  addiu      $a3, $sp, 0x28
/* 1C7D8 8002BFD8 5400BFAF */  sw         $ra, 0x54($sp)
/* 1C7DC 8002BFDC 4800B2AF */  sw         $s2, 0x48($sp)
/* 1C7E0 8002BFE0 FF074230 */  andi       $v0, $v0, 0x7FF
/* 1C7E4 8002BFE4 00F3000C */  jal        PIPE3D_Segment2ScreenPt
/* 1C7E8 8002BFE8 40900200 */   sll       $s2, $v0, 1
/* 1C7EC 8002BFEC 21204000 */  addu       $a0, $v0, $zero
/* 1C7F0 8002BFF0 14008824 */  addiu      $t0, $a0, 0x14
/* 1C7F4 8002BFF4 80280800 */  sll        $a1, $t0, 2
/* 1C7F8 8002BFF8 1500A018 */  blez       $a1, .L8002C050
/* 1C7FC 8002BFFC 1E008824 */   addiu     $t0, $a0, 0x1E
/* 1C800 8002C000 2800A287 */  lh         $v0, 0x28($sp)
/* 1C804 8002C004 2A00A387 */  lh         $v1, 0x2A($sp)
/* 1C808 8002C008 3000A2AF */  sw         $v0, 0x30($sp)
/* 1C80C 8002C00C 000C0229 */  slti       $v0, $t0, 0xC00
/* 1C810 8002C010 0F004010 */  beqz       $v0, .L8002C050
/* 1C814 8002C014 3400A3AF */   sw        $v1, 0x34($sp)
/* 1C818 8002C018 3000A427 */  addiu      $a0, $sp, 0x30
/* 1C81C 8002C01C 21306002 */  addu       $a2, $s3, $zero
/* 1C820 8002C020 6800A28F */  lw         $v0, 0x68($sp)
/* 1C824 8002C024 21388002 */  addu       $a3, $s4, $zero
/* 1C828 8002C028 1000A8AF */  sw         $t0, 0x10($sp)
/* 1C82C 8002C02C 2000B2AF */  sw         $s2, 0x20($sp)
/* 1C830 8002C030 1400A2AF */  sw         $v0, 0x14($sp)
/* 1C834 8002C034 00141000 */  sll        $v0, $s0, 16
/* 1C838 8002C038 03140200 */  sra        $v0, $v0, 16
/* 1C83C 8002C03C 1800A2AF */  sw         $v0, 0x18($sp)
/* 1C840 8002C040 00141100 */  sll        $v0, $s1, 16
/* 1C844 8002C044 03140200 */  sra        $v0, $v0, 16
/* 1C848 8002C048 23AE000C */  jal        DRAW_CreateAGlowingCircle
/* 1C84C 8002C04C 1C00A2AF */   sw        $v0, 0x1C($sp)
.L8002C050:
/* 1C850 8002C050 0400628E */  lw         $v0, 0x4($s3)
/* 1C854 8002C054 5400BF8F */  lw         $ra, 0x54($sp)
/* 1C858 8002C058 5000B48F */  lw         $s4, 0x50($sp)
/* 1C85C 8002C05C 4C00B38F */  lw         $s3, 0x4C($sp)
/* 1C860 8002C060 4800B28F */  lw         $s2, 0x48($sp)
/* 1C864 8002C064 4400B18F */  lw         $s1, 0x44($sp)
/* 1C868 8002C068 4000B08F */  lw         $s0, 0x40($sp)
/* 1C86C 8002C06C 0800E003 */  jr         $ra
/* 1C870 8002C070 5800BD27 */   addiu     $sp, $sp, 0x58
.size DRAW_DrawGlowPoint, . - DRAW_DrawGlowPoint
