.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_InitializeChannel_Linear
/* 80C2C 8009042C 0400838C */  lw         $v1, 0x4($a0)
/* 80C30 80090430 00000000 */  nop
/* 80C34 80090434 00006294 */  lhu        $v0, 0x0($v1)
/* 80C38 80090438 02006694 */  lhu        $a2, 0x2($v1)
/* 80C3C 8009043C FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 80C40 80090440 01004224 */  addiu      $v0, $v0, 0x1
/* 80C44 80090444 40100200 */  sll        $v0, $v0, 1
/* 80C48 80090448 21186200 */  addu       $v1, $v1, $v0
/* 80C4C 8009044C 0000A6A4 */  sh         $a2, 0x0($a1)
/* 80C50 80090450 0800E003 */  jr         $ra
/* 80C54 80090454 040083AC */   sw        $v1, 0x4($a0)
.size _G2Anim_InitializeChannel_Linear, . - _G2Anim_InitializeChannel_Linear
