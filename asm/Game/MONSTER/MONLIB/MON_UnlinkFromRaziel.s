.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_UnlinkFromRaziel
/* 74A48 80084248 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 74A4C 8008424C 1000B0AF */  sw         $s0, 0x10($sp)
/* 74A50 80084250 21808000 */  addu       $s0, $a0, $zero
/* 74A54 80084254 1800BFAF */  sw         $ra, 0x18($sp)
/* 74A58 80084258 1400B1AF */  sw         $s1, 0x14($sp)
/* 74A5C 8008425C 6C01028E */  lw         $v0, 0x16C($s0)
/* 74A60 80084260 00000000 */  nop
/* 74A64 80084264 C400428C */  lw         $v0, 0xC4($v0)
/* 74A68 80084268 00000000 */  nop
/* 74A6C 8008426C 0400518C */  lw         $s1, 0x4($v0)
/* 74A70 80084270 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 74A74 80084274 00000000 */   nop
/* 74A78 80084278 21200002 */  addu       $a0, $s0, $zero
/* 74A7C 8008427C 91FE010C */  jal        MON_SwitchState
/* 74A80 80084280 04000524 */   addiu     $a1, $zero, 0x4
/* 74A84 80084284 07000524 */  addiu      $a1, $zero, 0x7
/* 74A88 80084288 92D1000C */  jal        INSTANCE_Query
/* 74A8C 8008428C 21202002 */   addu      $a0, $s1, $zero
/* 74A90 80084290 21184000 */  addu       $v1, $v0, $zero
/* 74A94 80084294 0B006010 */  beqz       $v1, .L800842C4
/* 74A98 80084298 21202002 */   addu      $a0, $s1, $zero
/* 74A9C 8008429C 00006294 */  lhu        $v0, 0x0($v1)
/* 74AA0 800842A0 00000000 */  nop
/* 74AA4 800842A4 740002A6 */  sh         $v0, 0x74($s0)
/* 74AA8 800842A8 02006294 */  lhu        $v0, 0x2($v1)
/* 74AAC 800842AC 00000000 */  nop
/* 74AB0 800842B0 760002A6 */  sh         $v0, 0x76($s0)
/* 74AB4 800842B4 04006294 */  lhu        $v0, 0x4($v1)
/* 74AB8 800842B8 00000000 */  nop
/* 74ABC 800842BC 00084224 */  addiu      $v0, $v0, 0x800
/* 74AC0 800842C0 780002A6 */  sh         $v0, 0x78($s0)
.L800842C4:
/* 74AC4 800842C4 0001053C */  lui        $a1, (0x1000006 >> 16)
/* 74AC8 800842C8 0600A534 */  ori        $a1, $a1, (0x1000006 & 0xFFFF)
/* 74ACC 800842CC A1D1000C */  jal        INSTANCE_Post
/* 74AD0 800842D0 21300002 */   addu      $a2, $s0, $zero
/* 74AD4 800842D4 1800BF8F */  lw         $ra, 0x18($sp)
/* 74AD8 800842D8 1400B18F */  lw         $s1, 0x14($sp)
/* 74ADC 800842DC 1000B08F */  lw         $s0, 0x10($sp)
/* 74AE0 800842E0 0800E003 */  jr         $ra
/* 74AE4 800842E4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_UnlinkFromRaziel, . - MON_UnlinkFromRaziel
