.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_IntroduceBufferIntros
/* A626C 800B5A6C 44A8828F */  lw         $v0, %gp_rel(numbufferedIntros)($gp)
/* A6270 800B5A70 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A6274 800B5A74 2000B2AF */  sw         $s2, 0x20($sp)
/* A6278 800B5A78 21900000 */  addu       $s2, $zero, $zero
/* A627C 800B5A7C 2400BFAF */  sw         $ra, 0x24($sp)
/* A6280 800B5A80 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A6284 800B5A84 2A004010 */  beqz       $v0, .L800B5B30
/* A6288 800B5A88 1800B0AF */   sw        $s0, 0x18($sp)
.L800B5A8C:
/* A628C 800B5A8C 4000422A */  slti       $v0, $s2, 0x40
/* A6290 800B5A90 27004010 */  beqz       $v0, .L800B5B30
/* A6294 800B5A94 80181200 */   sll       $v1, $s2, 2
/* A6298 800B5A98 ECFD8227 */  addiu      $v0, $gp, %gp_rel(bufferSavedIntroArray)
/* A629C 800B5A9C 21886200 */  addu       $s1, $v1, $v0
/* A62A0 800B5AA0 0000308E */  lw         $s0, 0x0($s1)
/* A62A4 800B5AA4 00000000 */  nop
/* A62A8 800B5AA8 1D000012 */  beqz       $s0, .L800B5B20
/* A62AC 800B5AAC 01000224 */   addiu     $v0, $zero, 0x1
/* A62B0 800B5AB0 00000392 */  lbu        $v1, 0x0($s0)
/* A62B4 800B5AB4 00000000 */  nop
/* A62B8 800B5AB8 0B006214 */  bne        $v1, $v0, .L800B5AE8
/* A62BC 800B5ABC 00000000 */   nop
/* A62C0 800B5AC0 0E000486 */  lh         $a0, 0xE($s0)
/* A62C4 800B5AC4 3266010C */  jal        STREAM_GetStreamUnitWithID
/* A62C8 800B5AC8 00000000 */   nop
/* A62CC 800B5ACC 10004010 */  beqz       $v0, .L800B5B10
/* A62D0 800B5AD0 21200002 */   addu      $a0, $s0, $zero
/* A62D4 800B5AD4 21284000 */  addu       $a1, $v0, $zero
/* A62D8 800B5AD8 72D2000C */  jal        INSTANCE_IntroduceSavedInstance
/* A62DC 800B5ADC 1000A627 */   addiu     $a2, $sp, 0x10
/* A62E0 800B5AE0 C2D60208 */  j          .L800B5B08
/* A62E4 800B5AE4 00000000 */   nop
.L800B5AE8:
/* A62E8 800B5AE8 06000486 */  lh         $a0, 0x6($s0)
/* A62EC 800B5AEC 3266010C */  jal        STREAM_GetStreamUnitWithID
/* A62F0 800B5AF0 00000000 */   nop
/* A62F4 800B5AF4 06004010 */  beqz       $v0, .L800B5B10
/* A62F8 800B5AF8 21200002 */   addu      $a0, $s0, $zero
/* A62FC 800B5AFC 21284000 */  addu       $a1, $v0, $zero
/* A6300 800B5B00 8DD3000C */  jal        INSTANCE_IntroduceSavedInstanceWithIntro
/* A6304 800B5B04 1000A627 */   addiu     $a2, $sp, 0x10
.L800B5B08:
/* A6308 800B5B08 05004010 */  beqz       $v0, .L800B5B20
/* A630C 800B5B0C 00000000 */   nop
.L800B5B10:
/* A6310 800B5B10 44A8828F */  lw         $v0, %gp_rel(numbufferedIntros)($gp)
/* A6314 800B5B14 000020AE */  sw         $zero, 0x0($s1)
/* A6318 800B5B18 FFFF4224 */  addiu      $v0, $v0, -0x1
/* A631C 800B5B1C 44A882AF */  sw         $v0, %gp_rel(numbufferedIntros)($gp)
.L800B5B20:
/* A6320 800B5B20 44A8828F */  lw         $v0, %gp_rel(numbufferedIntros)($gp)
/* A6324 800B5B24 00000000 */  nop
/* A6328 800B5B28 D8FF4014 */  bnez       $v0, .L800B5A8C
/* A632C 800B5B2C 01005226 */   addiu     $s2, $s2, 0x1
.L800B5B30:
/* A6330 800B5B30 2400BF8F */  lw         $ra, 0x24($sp)
/* A6334 800B5B34 2000B28F */  lw         $s2, 0x20($sp)
/* A6338 800B5B38 1C00B18F */  lw         $s1, 0x1C($sp)
/* A633C 800B5B3C 1800B08F */  lw         $s0, 0x18($sp)
/* A6340 800B5B40 0800E003 */  jr         $ra
/* A6344 800B5B44 2800BD27 */   addiu     $sp, $sp, 0x28
.size SAVE_IntroduceBufferIntros, . - SAVE_IntroduceBufferIntros
