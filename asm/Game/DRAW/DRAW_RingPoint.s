.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DRAW_RingPoint
/* 1B9FC 8002B1FC C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 1BA00 8002B200 3000B2AF */  sw         $s2, 0x30($sp)
/* 1BA04 8002B204 2190C000 */  addu       $s2, $a2, $zero
/* 1BA08 8002B208 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 1BA0C 8002B20C 2188E000 */  addu       $s1, $a3, $zero
/* 1BA10 8002B210 3400BFAF */  sw         $ra, 0x34($sp)
/* 1BA14 8002B214 3AF2020C */  jal        rand
/* 1BA18 8002B218 2800B0AF */   sw        $s0, 0x28($sp)
/* 1BA1C 8002B21C 3F004230 */  andi       $v0, $v0, 0x3F
/* 1BA20 8002B220 18004228 */  slti       $v0, $v0, 0x18
/* 1BA24 8002B224 33004014 */  bnez       $v0, .L8002B2F4
/* 1BA28 8002B228 00000000 */   nop
/* 1BA2C 8002B22C 3AF2020C */  jal        rand
/* 1BA30 8002B230 00000000 */   nop
/* 1BA34 8002B234 1F004230 */  andi       $v0, $v0, 0x1F
/* 1BA38 8002B238 F1FF4224 */  addiu      $v0, $v0, -0xF
/* 1BA3C 8002B23C 3AF2020C */  jal        rand
/* 1BA40 8002B240 000022A6 */   sh        $v0, 0x0($s1)
/* 1BA44 8002B244 1F004230 */  andi       $v0, $v0, 0x1F
/* 1BA48 8002B248 F1FF4224 */  addiu      $v0, $v0, -0xF
/* 1BA4C 8002B24C 3AF2020C */  jal        rand
/* 1BA50 8002B250 020022A6 */   sh        $v0, 0x2($s1)
/* 1BA54 8002B254 0F004230 */  andi       $v0, $v0, 0xF
/* 1BA58 8002B258 2000B027 */  addiu      $s0, $sp, 0x20
/* 1BA5C 8002B25C 040022A6 */  sh         $v0, 0x4($s1)
/* 1BA60 8002B260 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 1BA64 8002B264 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 1BA68 8002B268 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1BA6C 8002B26C 00000CA6 */  sh         $t4, 0x0($s0)
/* 1BA70 8002B270 02000DA6 */  sh         $t5, 0x2($s0)
/* 1BA74 8002B274 04000EA6 */  sh         $t6, 0x4($s0)
/* 1BA78 8002B278 3AF2020C */  jal        rand
/* 1BA7C 8002B27C 00000000 */   nop
/* 1BA80 8002B280 2000A397 */  lhu        $v1, 0x20($sp)
/* 1BA84 8002B284 03004230 */  andi       $v0, $v0, 0x3
/* 1BA88 8002B288 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 1BA8C 8002B28C 21186200 */  addu       $v1, $v1, $v0
/* 1BA90 8002B290 3AF2020C */  jal        rand
/* 1BA94 8002B294 2000A3A7 */   sh        $v1, 0x20($sp)
/* 1BA98 8002B298 2200A397 */  lhu        $v1, 0x22($sp)
/* 1BA9C 8002B29C 03004230 */  andi       $v0, $v0, 0x3
/* 1BAA0 8002B2A0 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 1BAA4 8002B2A4 21186200 */  addu       $v1, $v1, $v0
/* 1BAA8 8002B2A8 3AF2020C */  jal        rand
/* 1BAAC 8002B2AC 2200A3A7 */   sh        $v1, 0x22($sp)
/* 1BAB0 8002B2B0 03004230 */  andi       $v0, $v0, 0x3
/* 1BAB4 8002B2B4 21200002 */  addu       $a0, $s0, $zero
/* 1BAB8 8002B2B8 21282002 */  addu       $a1, $s1, $zero
/* 1BABC 8002B2BC 21380000 */  addu       $a3, $zero, $zero
/* 1BAC0 8002B2C0 2400A397 */  lhu        $v1, 0x24($sp)
/* 1BAC4 8002B2C4 4800A68F */  lw         $a2, 0x48($sp)
/* 1BAC8 8002B2C8 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 1BACC 8002B2CC 21186200 */  addu       $v1, $v1, $v0
/* 1BAD0 8002B2D0 0A000224 */  addiu      $v0, $zero, 0xA
/* 1BAD4 8002B2D4 2400A3A7 */  sh         $v1, 0x24($sp)
/* 1BAD8 8002B2D8 1400A2AF */  sw         $v0, 0x14($sp)
/* 1BADC 8002B2DC 07000224 */  addiu      $v0, $zero, 0x7
/* 1BAE0 8002B2E0 1800A2AF */  sw         $v0, 0x18($sp)
/* 1BAE4 8002B2E4 01000224 */  addiu      $v0, $zero, 0x1
/* 1BAE8 8002B2E8 1000B2AF */  sw         $s2, 0x10($sp)
/* 1BAEC 8002B2EC 9622010C */  jal        FX_Dot
/* 1BAF0 8002B2F0 1C00A2AF */   sw        $v0, 0x1C($sp)
.L8002B2F4:
/* 1BAF4 8002B2F4 3400BF8F */  lw         $ra, 0x34($sp)
/* 1BAF8 8002B2F8 3000B28F */  lw         $s2, 0x30($sp)
/* 1BAFC 8002B2FC 2C00B18F */  lw         $s1, 0x2C($sp)
/* 1BB00 8002B300 2800B08F */  lw         $s0, 0x28($sp)
/* 1BB04 8002B304 0800E003 */  jr         $ra
/* 1BB08 8002B308 3800BD27 */   addiu     $sp, $sp, 0x38
.size DRAW_RingPoint, . - DRAW_RingPoint
