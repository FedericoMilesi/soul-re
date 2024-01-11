.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndUpdateVolPanPitch
/* 310CC 800408CC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 310D0 800408D0 0B008010 */  beqz       $a0, .L80040900
/* 310D4 800408D4 1000BFAF */   sw        $ra, 0x10($sp)
/* 310D8 800408D8 88BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C0)($gp)
/* 310DC 800408DC 00000000 */  nop
/* 310E0 800408E0 07004010 */  beqz       $v0, .L80040900
/* 310E4 800408E4 003C0700 */   sll       $a3, $a3, 16
/* 310E8 800408E8 FFFFA530 */  andi       $a1, $a1, 0xFFFF
/* 310EC 800408EC FFFFC630 */  andi       $a2, $a2, 0xFFFF
/* 310F0 800408F0 875C010C */  jal        aadSetSfxVolPanPitch
/* 310F4 800408F4 033C0700 */   sra       $a3, $a3, 16
/* 310F8 800408F8 41020108 */  j          .L80040904
/* 310FC 800408FC 00000000 */   nop
.L80040900:
/* 31100 80040900 21100000 */  addu       $v0, $zero, $zero
.L80040904:
/* 31104 80040904 1000BF8F */  lw         $ra, 0x10($sp)
/* 31108 80040908 00000000 */  nop
/* 3110C 8004090C 0800E003 */  jr         $ra
/* 31110 80040910 1800BD27 */   addiu     $sp, $sp, 0x18
.size SndUpdateVolPanPitch, . - SndUpdateVolPanPitch
