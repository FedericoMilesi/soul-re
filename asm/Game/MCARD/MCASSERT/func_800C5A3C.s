.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C5A3C
/* B623C 800C5A3C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B6240 800C5A40 2000B2AF */  sw         $s2, 0x20($sp)
/* B6244 800C5A44 21908000 */  addu       $s2, $a0, $zero
/* B6248 800C5A48 21200000 */  addu       $a0, $zero, $zero
/* B624C 800C5A4C 2400BFAF */  sw         $ra, 0x24($sp)
/* B6250 800C5A50 1C00B1AF */  sw         $s1, 0x1C($sp)
/* B6254 800C5A54 46F8020C */  jal        func_800BE118
/* B6258 800C5A58 1800B0AF */   sw        $s0, 0x18($sp)
/* B625C 800C5A5C 4BF8020C */  jal        func_800BE12C
/* B6260 800C5A60 21200000 */   addu      $a0, $zero, $zero
/* B6264 800C5A64 0D80023C */  lui        $v0, %hi(CD_read_dma_mode)
/* B6268 800C5A68 40E4428C */  lw         $v0, %lo(CD_read_dma_mode)($v0)
/* B626C 800C5A6C 00000000 */  nop
/* B6270 800C5A70 01004230 */  andi       $v0, $v0, 0x1
/* B6274 800C5A74 03004010 */  beqz       $v0, .L800C5A84
/* B6278 800C5A78 00000000 */   nop
/* B627C 800C5A7C 4FF9020C */  jal        func_800BE53C
/* B6280 800C5A80 21200000 */   addu      $a0, $zero, $zero
.L800C5A84:
/* B6284 800C5A84 03F8020C */  jal        func_800BE00C
/* B6288 800C5A88 00000000 */   nop
/* B628C 800C5A8C 10004230 */  andi       $v0, $v0, 0x10
/* B6290 800C5A90 16004010 */  beqz       $v0, .L800C5AEC
/* B6294 800C5A94 00000000 */   nop
/* B6298 800C5A98 5EF2020C */  jal        func_800BC978
/* B629C 800C5A9C FFFF0424 */   addiu     $a0, $zero, -0x1
/* B62A0 800C5AA0 3F004230 */  andi       $v0, $v0, 0x3F
/* B62A4 800C5AA4 05004014 */  bnez       $v0, .L800C5ABC
/* B62A8 800C5AA8 01000424 */   addiu     $a0, $zero, 0x1
/* B62AC 800C5AAC 0180043C */  lui        $a0, %hi(D_80012CCC)
/* B62B0 800C5AB0 9901030C */  jal        func_800C0664
/* B62B4 800C5AB4 CC2C8424 */   addiu     $a0, $a0, %lo(D_80012CCC)
/* B62B8 800C5AB8 01000424 */  addiu      $a0, $zero, 0x1
.L800C5ABC:
/* B62BC 800C5ABC 9FF8020C */  jal        func_800BE27C
/* B62C0 800C5AC0 21280000 */   addu      $a1, $zero, $zero
/* B62C4 800C5AC4 5EF2020C */  jal        func_800BC978
/* B62C8 800C5AC8 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B62CC 800C5ACC 0D80033C */  lui        $v1, %hi(CD_intstr + 0x274)
/* B62D0 800C5AD0 9CEC6324 */  addiu      $v1, $v1, %lo(CD_intstr + 0x274)
/* B62D4 800C5AD4 1C0062AC */  sw         $v0, 0x1C($v1)
/* B62D8 800C5AD8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* B62DC 800C5ADC 140062AC */  sw         $v0, 0x14($v1)
/* B62E0 800C5AE0 1400628C */  lw         $v0, 0x14($v1)
/* B62E4 800C5AE4 03170308 */  j          .L800C5C0C
/* B62E8 800C5AE8 00000000 */   nop
.L800C5AEC:
/* B62EC 800C5AEC 10004012 */  beqz       $s2, .L800C5B30
/* B62F0 800C5AF0 00000000 */   nop
/* B62F4 800C5AF4 0180043C */  lui        $a0, %hi(D_80012CE4)
/* B62F8 800C5AF8 9901030C */  jal        func_800C0664
/* B62FC 800C5AFC E42C8424 */   addiu     $a0, $a0, %lo(D_80012CE4)
/* B6300 800C5B00 09000424 */  addiu      $a0, $zero, 0x9
/* B6304 800C5B04 21280000 */  addu       $a1, $zero, $zero
/* B6308 800C5B08 50F8020C */  jal        func_800BE140
/* B630C 800C5B0C 21300000 */   addu      $a2, $zero, $zero
/* B6310 800C5B10 0BF8020C */  jal        func_800BE02C
/* B6314 800C5B14 00000000 */   nop
/* B6318 800C5B18 02000424 */  addiu      $a0, $zero, 0x2
/* B631C 800C5B1C 21284000 */  addu       $a1, $v0, $zero
/* B6320 800C5B20 50F8020C */  jal        func_800BE140
/* B6324 800C5B24 21300000 */   addu      $a2, $zero, $zero
/* B6328 800C5B28 13004010 */  beqz       $v0, .L800C5B78
/* B632C 800C5B2C 00000000 */   nop
.L800C5B30:
/* B6330 800C5B30 29F8020C */  jal        func_800BE0A4
/* B6334 800C5B34 00000000 */   nop
/* B6338 800C5B38 0D80113C */  lui        $s1, %hi(CD_intstr + 0x280)
/* B633C 800C5B3C A8EC3126 */  addiu      $s1, $s1, %lo(CD_intstr + 0x280)
/* B6340 800C5B40 0000308E */  lw         $s0, 0x0($s1)
/* B6344 800C5B44 00000000 */  nop
/* B6348 800C5B48 1000B0A3 */  sb         $s0, 0x10($sp)
/* B634C 800C5B4C 07F8020C */  jal        func_800BE01C
/* B6350 800C5B50 FF001032 */   andi      $s0, $s0, 0xFF
/* B6354 800C5B54 03000216 */  bne        $s0, $v0, .L800C5B64
/* B6358 800C5B58 0E000424 */   addiu     $a0, $zero, 0xE
/* B635C 800C5B5C 0D004012 */  beqz       $s2, .L800C5B94
/* B6360 800C5B60 00000000 */   nop
.L800C5B64:
/* B6364 800C5B64 1000A527 */  addiu      $a1, $sp, 0x10
/* B6368 800C5B68 50F8020C */  jal        func_800BE140
/* B636C 800C5B6C 21300000 */   addu      $a2, $zero, $zero
/* B6370 800C5B70 08004014 */  bnez       $v0, .L800C5B94
/* B6374 800C5B74 00000000 */   nop
.L800C5B78:
/* B6378 800C5B78 0D80023C */  lui        $v0, %hi(CD_intstr + 0x274)
/* B637C 800C5B7C 9CEC4224 */  addiu      $v0, $v0, %lo(CD_intstr + 0x274)
/* B6380 800C5B80 FFFF0324 */  addiu      $v1, $zero, -0x1
/* B6384 800C5B84 140043AC */  sw         $v1, 0x14($v0)
/* B6388 800C5B88 1400428C */  lw         $v0, 0x14($v0)
/* B638C 800C5B8C 03170308 */  j          .L800C5C0C
/* B6390 800C5B90 00000000 */   nop
.L800C5B94:
/* B6394 800C5B94 0BF8020C */  jal        func_800BE02C
/* B6398 800C5B98 00000000 */   nop
/* B639C 800C5B9C 56FC020C */  jal        func_800BF158
/* B63A0 800C5BA0 21204000 */   addu      $a0, $v0, $zero
/* B63A4 800C5BA4 0C80043C */  lui        $a0, %hi(func_800C56F8)
/* B63A8 800C5BA8 F8568424 */  addiu      $a0, $a0, %lo(func_800C56F8)
/* B63AC 800C5BAC 0D80103C */  lui        $s0, %hi(CD_intstr + 0x274)
/* B63B0 800C5BB0 9CEC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x274)
/* B63B4 800C5BB4 4BF8020C */  jal        func_800BE12C
/* B63B8 800C5BB8 200002AE */   sw        $v0, 0x20($s0)
/* B63BC 800C5BBC 0D80023C */  lui        $v0, %hi(CD_read_dma_mode)
/* B63C0 800C5BC0 40E4428C */  lw         $v0, %lo(CD_read_dma_mode)($v0)
/* B63C4 800C5BC4 00000000 */  nop
/* B63C8 800C5BC8 01004230 */  andi       $v0, $v0, 0x1
/* B63CC 800C5BCC 05004010 */  beqz       $v0, .L800C5BE4
/* B63D0 800C5BD0 06000424 */   addiu     $a0, $zero, 0x6
/* B63D4 800C5BD4 0C80043C */  lui        $a0, %hi(func_800C596C)
/* B63D8 800C5BD8 4FF9020C */  jal        func_800BE53C
/* B63DC 800C5BDC 6C598424 */   addiu     $a0, $a0, %lo(func_800C596C)
/* B63E0 800C5BE0 06000424 */  addiu      $a0, $zero, 0x6
.L800C5BE4:
/* B63E4 800C5BE4 0400028E */  lw         $v0, 0x4($s0)
/* B63E8 800C5BE8 21280000 */  addu       $a1, $zero, $zero
/* B63EC 800C5BEC 9FF8020C */  jal        func_800BE27C
/* B63F0 800C5BF0 080002AE */   sw        $v0, 0x8($s0)
/* B63F4 800C5BF4 0000028E */  lw         $v0, 0x0($s0)
/* B63F8 800C5BF8 FFFF0424 */  addiu      $a0, $zero, -0x1
/* B63FC 800C5BFC 5EF2020C */  jal        func_800BC978
/* B6400 800C5C00 140002AE */   sw        $v0, 0x14($s0)
/* B6404 800C5C04 180002AE */  sw         $v0, 0x18($s0)
/* B6408 800C5C08 1400028E */  lw         $v0, 0x14($s0)
.L800C5C0C:
/* B640C 800C5C0C 2400BF8F */  lw         $ra, 0x24($sp)
/* B6410 800C5C10 2000B28F */  lw         $s2, 0x20($sp)
/* B6414 800C5C14 1C00B18F */  lw         $s1, 0x1C($sp)
/* B6418 800C5C18 1800B08F */  lw         $s0, 0x18($sp)
/* B641C 800C5C1C 0800E003 */  jr         $ra
/* B6420 800C5C20 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800C5A3C, . - func_800C5A3C
