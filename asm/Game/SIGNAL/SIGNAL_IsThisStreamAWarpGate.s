.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_IsThisStreamAWarpGate
/* EC90 8001E490 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* EC94 8001E494 3000B0AF */  sw         $s0, 0x30($sp)
/* EC98 8001E498 21800000 */  addu       $s0, $zero, $zero
/* EC9C 8001E49C 0C008524 */  addiu      $a1, $a0, 0xC
/* ECA0 8001E4A0 3400BFAF */  sw         $ra, 0x34($sp)
/* ECA4 8001E4A4 1CF4020C */  jal        strcpy
/* ECA8 8001E4A8 1000A427 */   addiu     $a0, $sp, 0x10
/* ECAC 8001E4AC 1000A427 */  addiu      $a0, $sp, 0x10
/* ECB0 8001E4B0 0CF4020C */  jal        strchr
/* ECB4 8001E4B4 2C000524 */   addiu     $a1, $zero, 0x2C
/* ECB8 8001E4B8 02004010 */  beqz       $v0, .L8001E4C4
/* ECBC 8001E4BC 1000A427 */   addiu     $a0, $sp, 0x10
/* ECC0 8001E4C0 000040A0 */  sb         $zero, 0x0($v0)
.L8001E4C4:
/* ECC4 8001E4C4 0D80053C */  lui        $a1, %hi(D_800D0410)
/* ECC8 8001E4C8 1CD2010C */  jal        strcmpi
/* ECCC 8001E4CC 1004A524 */   addiu     $a1, $a1, %lo(D_800D0410)
/* ECD0 8001E4D0 03004014 */  bnez       $v0, .L8001E4E0
/* ECD4 8001E4D4 21100002 */   addu      $v0, $s0, $zero
/* ECD8 8001E4D8 01001024 */  addiu      $s0, $zero, 0x1
/* ECDC 8001E4DC 21100002 */  addu       $v0, $s0, $zero
.L8001E4E0:
/* ECE0 8001E4E0 3400BF8F */  lw         $ra, 0x34($sp)
/* ECE4 8001E4E4 3000B08F */  lw         $s0, 0x30($sp)
/* ECE8 8001E4E8 0800E003 */  jr         $ra
/* ECEC 8001E4EC 3800BD27 */   addiu     $sp, $sp, 0x38
.size SIGNAL_IsThisStreamAWarpGate, . - SIGNAL_IsThisStreamAWarpGate
