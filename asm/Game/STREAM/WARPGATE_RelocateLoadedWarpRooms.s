.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_RelocateLoadedWarpRooms
/* 4BA20 8005B220 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4BA24 8005B224 2000B4AF */  sw         $s4, 0x20($sp)
/* 4BA28 8005B228 21A08000 */  addu       $s4, $a0, $zero
/* 4BA2C 8005B22C 2400B5AF */  sw         $s5, 0x24($sp)
/* 4BA30 8005B230 21A8A000 */  addu       $s5, $a1, $zero
/* 4BA34 8005B234 1800B2AF */  sw         $s2, 0x18($sp)
/* 4BA38 8005B238 21900000 */  addu       $s2, $zero, $zero
/* 4BA3C 8005B23C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4BA40 8005B240 02001324 */  addiu      $s3, $zero, 0x2
/* 4BA44 8005B244 1400B1AF */  sw         $s1, 0x14($sp)
/* 4BA48 8005B248 48C79127 */  addiu      $s1, $gp, %gp_rel(StreamTracker + 0xC)
/* 4BA4C 8005B24C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4BA50 8005B250 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
/* 4BA54 8005B254 2800BFAF */  sw         $ra, 0x28($sp)
.L8005B258:
/* 4BA58 8005B258 04000286 */  lh         $v0, 0x4($s0)
/* 4BA5C 8005B25C 00000000 */  nop
/* 4BA60 8005B260 0B005314 */  bne        $v0, $s3, .L8005B290
/* 4BA64 8005B264 00000000 */   nop
/* 4BA68 8005B268 09001412 */  beq        $s0, $s4, .L8005B290
/* 4BA6C 8005B26C 00000000 */   nop
/* 4BA70 8005B270 06000296 */  lhu        $v0, 0x6($s0)
/* 4BA74 8005B274 00000000 */  nop
/* 4BA78 8005B278 01004230 */  andi       $v0, $v0, 0x1
/* 4BA7C 8005B27C 04004010 */  beqz       $v0, .L8005B290
/* 4BA80 8005B280 21202002 */   addu      $a0, $s1, $zero
/* 4BA84 8005B284 2128A002 */  addu       $a1, $s5, $zero
/* 4BA88 8005B288 A76A010C */  jal        STREAM_LoadLevel
/* 4BA8C 8005B28C 21300000 */   addu      $a2, $zero, $zero
.L8005B290:
/* 4BA90 8005B290 40003126 */  addiu      $s1, $s1, 0x40
/* 4BA94 8005B294 01005226 */  addiu      $s2, $s2, 0x1
/* 4BA98 8005B298 1000422A */  slti       $v0, $s2, 0x10
/* 4BA9C 8005B29C EEFF4014 */  bnez       $v0, .L8005B258
/* 4BAA0 8005B2A0 40001026 */   addiu     $s0, $s0, 0x40
/* 4BAA4 8005B2A4 2800BF8F */  lw         $ra, 0x28($sp)
/* 4BAA8 8005B2A8 2400B58F */  lw         $s5, 0x24($sp)
/* 4BAAC 8005B2AC 2000B48F */  lw         $s4, 0x20($sp)
/* 4BAB0 8005B2B0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4BAB4 8005B2B4 1800B28F */  lw         $s2, 0x18($sp)
/* 4BAB8 8005B2B8 1400B18F */  lw         $s1, 0x14($sp)
/* 4BABC 8005B2BC 1000B08F */  lw         $s0, 0x10($sp)
/* 4BAC0 8005B2C0 0800E003 */  jr         $ra
/* 4BAC4 8005B2C4 3000BD27 */   addiu     $sp, $sp, 0x30
.size WARPGATE_RelocateLoadedWarpRooms, . - WARPGATE_RelocateLoadedWarpRooms
