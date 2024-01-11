.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUD_Setup_Chit_Count
/* 6CC84 8007C484 6666023C */  lui        $v0, (0x66666667 >> 16)
/* 6CC88 8007C488 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
/* 6CC8C 8007C48C 18008200 */  mult       $a0, $v0
/* 6CC90 8007C490 C3170400 */  sra        $v0, $a0, 31
/* 6CC94 8007C494 E4EC84A7 */  sh         $a0, %gp_rel(HUD_Count_Overall)($gp)
/* 6CC98 8007C498 10280000 */  mfhi       $a1
/* 6CC9C 8007C49C 43180500 */  sra        $v1, $a1, 1
/* 6CCA0 8007C4A0 23186200 */  subu       $v1, $v1, $v0
/* 6CCA4 8007C4A4 80100300 */  sll        $v0, $v1, 2
/* 6CCA8 8007C4A8 21104300 */  addu       $v0, $v0, $v1
/* 6CCAC 8007C4AC 23208200 */  subu       $a0, $a0, $v0
/* 6CCB0 8007C4B0 E2EC84A7 */  sh         $a0, %gp_rel(HUD_Count)($gp)
/* 6CCB4 8007C4B4 0800E003 */  jr         $ra
/* 6CCB8 8007C4B8 00000000 */   nop
.size HUD_Setup_Chit_Count, . - HUD_Setup_Chit_Count
