.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetSwitchPhysOb
/* 5A0D0 800698D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5A0D4 800698D4 1800B0AF */  sw         $s0, 0x18($sp)
/* 5A0D8 800698D8 21808000 */  addu       $s0, $a0, $zero
/* 5A0DC 800698DC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5A0E0 800698E0 CFA3010C */  jal        CheckPhysObFamily
/* 5A0E4 800698E4 02000524 */   addiu     $a1, $zero, 0x2
/* 5A0E8 800698E8 1B004010 */  beqz       $v0, .L80069958
/* 5A0EC 800698EC 00000000 */   nop
/* 5A0F0 800698F0 6C01038E */  lw         $v1, 0x16C($s0)
/* 5A0F4 800698F4 00000000 */  nop
/* 5A0F8 800698F8 0000628C */  lw         $v0, 0x0($v1)
/* 5A0FC 800698FC 2400058E */  lw         $a1, 0x24($s0)
/* 5A100 80069900 00084234 */  ori        $v0, $v0, 0x800
/* 5A104 80069904 000062AC */  sw         $v0, 0x0($v1)
/* 5A108 80069908 6C01028E */  lw         $v0, 0x16C($s0)
/* 5A10C 8006990C 00000000 */  nop
/* 5A110 80069910 04004294 */  lhu        $v0, 0x4($v0)
/* 5A114 80069914 00000000 */  nop
/* 5A118 80069918 02004230 */  andi       $v0, $v0, 0x2
/* 5A11C 8006991C 0E004010 */  beqz       $v0, .L80069958
/* 5A120 80069920 00000000 */   nop
/* 5A124 80069924 1000A290 */  lbu        $v0, 0x10($a1)
/* 5A128 80069928 00000000 */  nop
/* 5A12C 8006992C 0A004010 */  beqz       $v0, .L80069958
/* 5A130 80069930 21200002 */   addu      $a0, $s0, $zero
/* 5A134 80069934 21304000 */  addu       $a2, $v0, $zero
/* 5A138 80069938 21280000 */  addu       $a1, $zero, $zero
/* 5A13C 8006993C 1000A0AF */  sw         $zero, 0x10($sp)
/* 5A140 80069940 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5A144 80069944 2138A000 */   addu      $a3, $a1, $zero
/* 5A148 80069948 21200002 */  addu       $a0, $s0, $zero
/* 5A14C 8006994C 21280000 */  addu       $a1, $zero, $zero
/* 5A150 80069950 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5A154 80069954 01000624 */   addiu     $a2, $zero, 0x1
.L80069958:
/* 5A158 80069958 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5A15C 8006995C 1800B08F */  lw         $s0, 0x18($sp)
/* 5A160 80069960 0800E003 */  jr         $ra
/* 5A164 80069964 2000BD27 */   addiu     $sp, $sp, 0x20
.size ResetSwitchPhysOb, . - ResetSwitchPhysOb
