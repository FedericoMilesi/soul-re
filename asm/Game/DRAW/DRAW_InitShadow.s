.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_InitShadow
/* 1B18C 8002A98C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1B190 8002A990 1800B2AF */  sw         $s2, 0x18($sp)
/* 1B194 8002A994 21900000 */  addu       $s2, $zero, $zero
/* 1B198 8002A998 2000B4AF */  sw         $s4, 0x20($sp)
/* 1B19C 8002A99C 1900143C */  lui        $s4, (0x199999 >> 16)
/* 1B1A0 8002A9A0 99999436 */  ori        $s4, $s4, (0x199999 & 0xFFFF)
/* 1B1A4 8002A9A4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1B1A8 8002A9A8 21984002 */  addu       $s3, $s2, $zero
/* 1B1AC 8002A9AC 1400B1AF */  sw         $s1, 0x14($sp)
/* 1B1B0 8002A9B0 8CB19127 */  addiu      $s1, $gp, %gp_rel(shadow_vertices)
/* 1B1B4 8002A9B4 2400BFAF */  sw         $ra, 0x24($sp)
/* 1B1B8 8002A9B8 1000B0AF */  sw         $s0, 0x10($sp)
.L8002A9BC:
/* 1B1BC 8002A9BC 02004106 */  bgez       $s2, .L8002A9C8
/* 1B1C0 8002A9C0 21204002 */   addu      $a0, $s2, $zero
/* 1B1C4 8002A9C4 FF0F4426 */  addiu      $a0, $s2, 0xFFF
.L8002A9C8:
/* 1B1C8 8002A9C8 03830400 */  sra        $s0, $a0, 12
/* 1B1CC 8002A9CC DCE4010C */  jal        func_80079370
/* 1B1D0 8002A9D0 21200002 */   addu      $a0, $s0, $zero
/* 1B1D4 8002A9D4 02004104 */  bgez       $v0, .L8002A9E0
/* 1B1D8 8002A9D8 00000000 */   nop
/* 1B1DC 8002A9DC 1F004224 */  addiu      $v0, $v0, 0x1F
.L8002A9E0:
/* 1B1E0 8002A9E0 43110200 */  sra        $v0, $v0, 5
/* 1B1E4 8002A9E4 000022A6 */  sh         $v0, 0x0($s1)
/* 1B1E8 8002A9E8 D0E4010C */  jal        func_80079340
/* 1B1EC 8002A9EC 21200002 */   addu      $a0, $s0, $zero
/* 1B1F0 8002A9F0 02004104 */  bgez       $v0, .L8002A9FC
/* 1B1F4 8002A9F4 00000000 */   nop
/* 1B1F8 8002A9F8 1F004224 */  addiu      $v0, $v0, 0x1F
.L8002A9FC:
/* 1B1FC 8002A9FC 21905402 */  addu       $s2, $s2, $s4
/* 1B200 8002AA00 43110200 */  sra        $v0, $v0, 5
/* 1B204 8002AA04 020022A6 */  sh         $v0, 0x2($s1)
/* 1B208 8002AA08 040020A6 */  sh         $zero, 0x4($s1)
/* 1B20C 8002AA0C 01007326 */  addiu      $s3, $s3, 0x1
/* 1B210 8002AA10 0A00622A */  slti       $v0, $s3, 0xA
/* 1B214 8002AA14 E9FF4014 */  bnez       $v0, .L8002A9BC
/* 1B218 8002AA18 08003126 */   addiu     $s1, $s1, 0x8
/* 1B21C 8002AA1C 8CB18297 */  lhu        $v0, %gp_rel(shadow_vertices)($gp)
/* 1B220 8002AA20 8EB18397 */  lhu        $v1, %gp_rel(shadow_vertices + 0x2)($gp)
/* 1B224 8002AA24 90B18497 */  lhu        $a0, %gp_rel(shadow_vertices + 0x4)($gp)
/* 1B228 8002AA28 2400BF8F */  lw         $ra, 0x24($sp)
/* 1B22C 8002AA2C 2000B48F */  lw         $s4, 0x20($sp)
/* 1B230 8002AA30 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1B234 8002AA34 1800B28F */  lw         $s2, 0x18($sp)
/* 1B238 8002AA38 1400B18F */  lw         $s1, 0x14($sp)
/* 1B23C 8002AA3C 1000B08F */  lw         $s0, 0x10($sp)
/* 1B240 8002AA40 DCB182A7 */  sh         $v0, %gp_rel(shadow_vertices + 0x50)($gp)
/* 1B244 8002AA44 DEB183A7 */  sh         $v1, %gp_rel(shadow_vertices + 0x52)($gp)
/* 1B248 8002AA48 E0B184A7 */  sh         $a0, %gp_rel(shadow_vertices + 0x54)($gp)
/* 1B24C 8002AA4C 0800E003 */  jr         $ra
/* 1B250 8002AA50 2800BD27 */   addiu     $sp, $sp, 0x28
.size DRAW_InitShadow, . - DRAW_InitShadow
