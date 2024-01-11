.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_Flush
/* 1E060 8002D860 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1E064 8002D864 F4B9838F */  lw         $v1, %gp_rel(fontTracker + 0x608)($gp)
/* 1E068 8002D868 0A000224 */  addiu      $v0, $zero, 0xA
/* 1E06C 8002D86C ECB982AF */  sw         $v0, %gp_rel(fontTracker + 0x600)($gp)
/* 1E070 8002D870 10000224 */  addiu      $v0, $zero, 0x10
/* 1E074 8002D874 2000BFAF */  sw         $ra, 0x20($sp)
/* 1E078 8002D878 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1E07C 8002D87C 1800B2AF */  sw         $s2, 0x18($sp)
/* 1E080 8002D880 1400B1AF */  sw         $s1, 0x14($sp)
/* 1E084 8002D884 1000B0AF */  sw         $s0, 0x10($sp)
/* 1E088 8002D888 F0B982AF */  sw         $v0, %gp_rel(fontTracker + 0x604)($gp)
/* 1E08C 8002D88C 11006010 */  beqz       $v1, .L8002D8D4
/* 1E090 8002D890 21886000 */   addu      $s1, $v1, $zero
/* 1E094 8002D894 ECB98227 */  addiu      $v0, $gp, %gp_rel(fontTracker + 0x600)
/* 1E098 8002D898 00FA5024 */  addiu      $s0, $v0, -0x600
/* 1E09C 8002D89C 20001324 */  addiu      $s3, $zero, 0x20
/* 1E0A0 8002D8A0 40001224 */  addiu      $s2, $zero, 0x40
.L8002D8A4:
/* 1E0A4 8002D8A4 04000292 */  lbu        $v0, 0x4($s0)
/* 1E0A8 8002D8A8 00000000 */  nop
/* 1E0AC 8002D8AC 05005310 */  beq        $v0, $s3, .L8002D8C4
/* 1E0B0 8002D8B0 00000000 */   nop
/* 1E0B4 8002D8B4 03005210 */  beq        $v0, $s2, .L8002D8C4
/* 1E0B8 8002D8B8 00000000 */   nop
/* 1E0BC 8002D8BC 37B4000C */  jal        FONT_DrawChar
/* 1E0C0 8002D8C0 21200002 */   addu      $a0, $s0, $zero
.L8002D8C4:
/* 1E0C4 8002D8C4 FFFF3126 */  addiu      $s1, $s1, -0x1
/* 1E0C8 8002D8C8 F6FF2016 */  bnez       $s1, .L8002D8A4
/* 1E0CC 8002D8CC 06001026 */   addiu     $s0, $s0, 0x6
/* 1E0D0 8002D8D0 F4B980AF */  sw         $zero, %gp_rel(fontTracker + 0x608)($gp)
.L8002D8D4:
/* 1E0D4 8002D8D4 2000BF8F */  lw         $ra, 0x20($sp)
/* 1E0D8 8002D8D8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1E0DC 8002D8DC 1800B28F */  lw         $s2, 0x18($sp)
/* 1E0E0 8002D8E0 1400B18F */  lw         $s1, 0x14($sp)
/* 1E0E4 8002D8E4 1000B08F */  lw         $s0, 0x10($sp)
/* 1E0E8 8002D8E8 0800E003 */  jr         $ra
/* 1E0EC 8002D8EC 2800BD27 */   addiu     $sp, $sp, 0x28
.size FONT_Flush, . - FONT_Flush
