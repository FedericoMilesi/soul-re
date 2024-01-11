.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_IsControllerInterpolating
/* 80FE0 800907E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80FE4 800907E4 1000BFAF */  sw         $ra, 0x10($sp)
/* 80FE8 800907E8 02008224 */  addiu      $v0, $a0, 0x2
/* 80FEC 800907EC 2120A000 */  addu       $a0, $a1, $zero
/* 80FF0 800907F0 2128C000 */  addu       $a1, $a2, $zero
/* 80FF4 800907F4 0F48020C */  jal        _G2AnimControllerST_FindInList
/* 80FF8 800907F8 21304000 */   addu      $a2, $v0, $zero
/* 80FFC 800907FC 06004010 */  beqz       $v0, .L80090818
/* 81000 80090800 00000000 */   nop
/* 81004 80090804 08004394 */  lhu        $v1, 0x8($v0)
/* 81008 80090808 00000000 */  nop
/* 8100C 8009080C 00406230 */  andi       $v0, $v1, 0x4000
/* 81010 80090810 03004014 */  bnez       $v0, .L80090820
/* 81014 80090814 00206230 */   andi      $v0, $v1, 0x2000
.L80090818:
/* 81018 80090818 09420208 */  j          .L80090824
/* 8101C 8009081C 21100000 */   addu      $v0, $zero, $zero
.L80090820:
/* 81020 80090820 0100422C */  sltiu      $v0, $v0, 0x1
.L80090824:
/* 81024 80090824 1000BF8F */  lw         $ra, 0x10($sp)
/* 81028 80090828 00000000 */  nop
/* 8102C 8009082C 0800E003 */  jr         $ra
/* 81030 80090830 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_IsControllerInterpolating, . - G2Anim_IsControllerInterpolating
