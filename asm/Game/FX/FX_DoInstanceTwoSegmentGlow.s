.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DoInstanceTwoSegmentGlow
/* 3BE94 8004B694 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3BE98 8004B698 4000A38F */  lw         $v1, 0x40($sp)
/* 3BE9C 8004B69C 2000B0AF */  sw         $s0, 0x20($sp)
/* 3BEA0 8004B6A0 2380C500 */  subu       $s0, $a2, $a1
/* 3BEA4 8004B6A4 03000106 */  bgez       $s0, .L8004B6B4
/* 3BEA8 8004B6A8 2400BFAF */   sw        $ra, 0x24($sp)
/* 3BEAC 8004B6AC 2128C000 */  addu       $a1, $a2, $zero
/* 3BEB0 8004B6B0 23801000 */  negu       $s0, $s0
.L8004B6B4:
/* 3BEB4 8004B6B4 2130E000 */  addu       $a2, $a3, $zero
/* 3BEB8 8004B6B8 3C00A28F */  lw         $v0, 0x3C($sp)
/* 3BEBC 8004B6BC 3800A78F */  lw         $a3, 0x38($sp)
/* 3BEC0 8004B6C0 1400A3AF */  sw         $v1, 0x14($sp)
/* 3BEC4 8004B6C4 1800A3AF */  sw         $v1, 0x18($sp)
/* 3BEC8 8004B6C8 462D010C */  jal        FX_DoInstanceOneSegmentGlow
/* 3BECC 8004B6CC 1000A2AF */   sw        $v0, 0x10($sp)
/* 3BED0 8004B6D0 02000324 */  addiu      $v1, $zero, 0x2
/* 3BED4 8004B6D4 240043A0 */  sb         $v1, 0x24($v0)
/* 3BED8 8004B6D8 250050A0 */  sb         $s0, 0x25($v0)
/* 3BEDC 8004B6DC 2400BF8F */  lw         $ra, 0x24($sp)
/* 3BEE0 8004B6E0 2000B08F */  lw         $s0, 0x20($sp)
/* 3BEE4 8004B6E4 0800E003 */  jr         $ra
/* 3BEE8 8004B6E8 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_DoInstanceTwoSegmentGlow, . - FX_DoInstanceTwoSegmentGlow
