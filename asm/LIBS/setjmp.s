.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setjmp
/* B26E4 800C1EE4 00009FAC */  sw         $ra, 0x0($a0)
/* B26E8 800C1EE8 2C009CAC */  sw         $gp, 0x2C($a0)
/* B26EC 800C1EEC 04009DAC */  sw         $sp, 0x4($a0)
/* B26F0 800C1EF0 08009EAC */  sw         $fp, 0x8($a0)
/* B26F4 800C1EF4 0C0090AC */  sw         $s0, 0xC($a0)
/* B26F8 800C1EF8 100091AC */  sw         $s1, 0x10($a0)
/* B26FC 800C1EFC 140092AC */  sw         $s2, 0x14($a0)
/* B2700 800C1F00 180093AC */  sw         $s3, 0x18($a0)
/* B2704 800C1F04 1C0094AC */  sw         $s4, 0x1C($a0)
/* B2708 800C1F08 200095AC */  sw         $s5, 0x20($a0)
/* B270C 800C1F0C 240096AC */  sw         $s6, 0x24($a0)
/* B2710 800C1F10 280097AC */  sw         $s7, 0x28($a0)
/* B2714 800C1F14 21100000 */  addu       $v0, $zero, $zero
/* B2718 800C1F18 0800E003 */  jr         $ra
/* B271C 800C1F1C 00000000 */   nop
.size setjmp, . - setjmp
