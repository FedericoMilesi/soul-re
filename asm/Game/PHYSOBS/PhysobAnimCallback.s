.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysobAnimCallback
/* 5DA38 8006D238 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 5DA3C 8006D23C 21188000 */  addu       $v1, $a0, $zero
/* 5DA40 8006D240 2000B2AF */  sw         $s2, 0x20($sp)
/* 5DA44 8006D244 2190E000 */  addu       $s2, $a3, $zero
/* 5DA48 8006D248 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5DA4C 8006D24C 3C00B18F */  lw         $s1, 0x3C($sp)
/* 5DA50 8006D250 01000224 */  addiu      $v0, $zero, 0x1
/* 5DA54 8006D254 2400BFAF */  sw         $ra, 0x24($sp)
/* 5DA58 8006D258 1400C214 */  bne        $a2, $v0, .L8006D2AC
/* 5DA5C 8006D25C 1800B0AF */   sw        $s0, 0x18($sp)
/* 5DA60 8006D260 04204500 */  sllv       $a0, $a1, $v0
/* 5DA64 8006D264 21208500 */  addu       $a0, $a0, $a1
/* 5DA68 8006D268 00210400 */  sll        $a0, $a0, 4
/* 5DA6C 8006D26C 24008424 */  addiu      $a0, $a0, 0x24
/* 5DA70 8006D270 6C01308E */  lw         $s0, 0x16C($s1)
/* 5DA74 8006D274 7B40020C */  jal        G2AnimSection_SetPaused
/* 5DA78 8006D278 21206400 */   addu      $a0, $v1, $a0
/* 5DA7C 8006D27C 0000028E */  lw         $v0, 0x0($s0)
/* 5DA80 8006D280 1000033C */  lui        $v1, (0x100000 >> 16)
/* 5DA84 8006D284 25104300 */  or         $v0, $v0, $v1
/* 5DA88 8006D288 0800033C */  lui        $v1, (0x80000 >> 16)
/* 5DA8C 8006D28C 000002AE */  sw         $v0, 0x0($s0)
/* 5DA90 8006D290 24104300 */  and        $v0, $v0, $v1
/* 5DA94 8006D294 0B004010 */  beqz       $v0, .L8006D2C4
/* 5DA98 8006D298 21104002 */   addu      $v0, $s2, $zero
/* 5DA9C 8006D29C 85D1000C */  jal        INSTANCE_KillInstance
/* 5DAA0 8006D2A0 21202002 */   addu      $a0, $s1, $zero
/* 5DAA4 8006D2A4 B1B40108 */  j          .L8006D2C4
/* 5DAA8 8006D2A8 21104002 */   addu      $v0, $s2, $zero
.L8006D2AC:
/* 5DAAC 8006D2AC 21206000 */  addu       $a0, $v1, $zero
/* 5DAB0 8006D2B0 3800A28F */  lw         $v0, 0x38($sp)
/* 5DAB4 8006D2B4 21384002 */  addu       $a3, $s2, $zero
/* 5DAB8 8006D2B8 1400B1AF */  sw         $s1, 0x14($sp)
/* 5DABC 8006D2BC 72D6000C */  jal        INSTANCE_DefaultAnimCallback
/* 5DAC0 8006D2C0 1000A2AF */   sw        $v0, 0x10($sp)
.L8006D2C4:
/* 5DAC4 8006D2C4 2400BF8F */  lw         $ra, 0x24($sp)
/* 5DAC8 8006D2C8 2000B28F */  lw         $s2, 0x20($sp)
/* 5DACC 8006D2CC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5DAD0 8006D2D0 1800B08F */  lw         $s0, 0x18($sp)
/* 5DAD4 8006D2D4 0800E003 */  jr         $ra
/* 5DAD8 8006D2D8 2800BD27 */   addiu     $sp, $sp, 0x28
.size PhysobAnimCallback, . - PhysobAnimCallback
