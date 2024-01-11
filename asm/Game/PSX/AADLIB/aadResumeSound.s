.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadResumeSound
/* 4558C 80054D8C D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 45590 80054D90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 45594 80054D94 1800BFAF */  sw         $ra, 0x18($sp)
/* 45598 80054D98 1400B1AF */  sw         $s1, 0x14($sp)
/* 4559C 80054D9C 1000B0AF */  sw         $s0, 0x10($sp)
/* 455A0 80054DA0 2400838C */  lw         $v1, 0x24($a0)
/* 455A4 80054DA4 00000000 */  nop
/* 455A8 80054DA8 08006230 */  andi       $v0, $v1, 0x8
/* 455AC 80054DAC 15004010 */  beqz       $v0, .L80054E04
/* 455B0 80054DB0 F3FF0224 */   addiu     $v0, $zero, -0xD
/* 455B4 80054DB4 24106200 */  and        $v0, $v1, $v0
/* 455B8 80054DB8 240082AC */  sw         $v0, 0x24($a0)
/* 455BC 80054DBC 21800000 */  addu       $s0, $zero, $zero
/* 455C0 80054DC0 21880002 */  addu       $s1, $s0, $zero
.L80054DC4:
/* 455C4 80054DC4 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 455C8 80054DC8 00000000 */  nop
/* 455CC 80054DCC 21107100 */  addu       $v0, $v1, $s1
/* 455D0 80054DD0 EE014294 */  lhu        $v0, 0x1EE($v0)
/* 455D4 80054DD4 00000000 */  nop
/* 455D8 80054DD8 02004230 */  andi       $v0, $v0, 0x2
/* 455DC 80054DDC 05004014 */  bnez       $v0, .L80054DF4
/* 455E0 80054DE0 40101000 */   sll       $v0, $s0, 1
/* 455E4 80054DE4 21106200 */  addu       $v0, $v1, $v0
/* 455E8 80054DE8 94044594 */  lhu        $a1, 0x494($v0)
/* 455EC 80054DEC 9DFE020C */  jal        func_800BFA74
/* 455F0 80054DF0 21200002 */   addu      $a0, $s0, $zero
.L80054DF4:
/* 455F4 80054DF4 01001026 */  addiu      $s0, $s0, 0x1
/* 455F8 80054DF8 1800022A */  slti       $v0, $s0, 0x18
/* 455FC 80054DFC F1FF4014 */  bnez       $v0, .L80054DC4
/* 45600 80054E00 1C003126 */   addiu     $s1, $s1, 0x1C
.L80054E04:
/* 45604 80054E04 1800BF8F */  lw         $ra, 0x18($sp)
/* 45608 80054E08 1400B18F */  lw         $s1, 0x14($sp)
/* 4560C 80054E0C 1000B08F */  lw         $s0, 0x10($sp)
/* 45610 80054E10 0800E003 */  jr         $ra
/* 45614 80054E14 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadResumeSound, . - aadResumeSound
