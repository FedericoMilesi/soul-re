.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadInitReverb
/* 44CC4 800544C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 44CC8 800544C8 1400BFAF */  sw         $ra, 0x14($sp)
/* 44CCC 800544CC 6051010C */  jal        aadGetReverbMode
/* 44CD0 800544D0 1000B0AF */   sw        $s0, 0x10($sp)
/* 44CD4 800544D4 5C00030C */  jal        func_800C0170
/* 44CD8 800544D8 21204000 */   addu      $a0, $v0, $zero
/* 44CDC 800544DC 21200000 */  addu       $a0, $zero, $zero
/* 44CE0 800544E0 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 44CE4 800544E4 F0FF020C */  jal        func_800BFFC0
/* 44CE8 800544E8 FFFFA534 */   ori       $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 44CEC 800544EC 2151010C */  jal        aadWaitForSramTransferComplete
/* 44CF0 800544F0 00000000 */   nop
/* 44CF4 800544F4 05004010 */  beqz       $v0, .L8005450C
/* 44CF8 800544F8 00000000 */   nop
/* 44CFC 800544FC 6051010C */  jal        aadGetReverbMode
/* 44D00 80054500 00000000 */   nop
/* 44D04 80054504 5CFF020C */  jal        func_800BFD70
/* 44D08 80054508 21204000 */   addu      $a0, $v0, $zero
.L8005450C:
/* 44D0C 8005450C 6E51010C */  jal        aadGetReverbDepth
/* 44D10 80054510 00000000 */   nop
/* 44D14 80054514 00840200 */  sll        $s0, $v0, 16
/* 44D18 80054518 6E51010C */  jal        aadGetReverbDepth
/* 44D1C 8005451C 03841000 */   sra       $s0, $s0, 16
/* 44D20 80054520 21200002 */  addu       $a0, $s0, $zero
/* 44D24 80054524 00140200 */  sll        $v0, $v0, 16
/* 44D28 80054528 89FE020C */  jal        func_800BFA24
/* 44D2C 8005452C 032C0200 */   sra       $a1, $v0, 16
/* 44D30 80054530 FCFF020C */  jal        func_800BFFF0
/* 44D34 80054534 01000424 */   addiu     $a0, $zero, 0x1
/* 44D38 80054538 1400BF8F */  lw         $ra, 0x14($sp)
/* 44D3C 8005453C 1000B08F */  lw         $s0, 0x10($sp)
/* 44D40 80054540 0800E003 */  jr         $ra
/* 44D44 80054544 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadInitReverb, . - aadInitReverb
