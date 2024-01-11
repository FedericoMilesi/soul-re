.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Timer_GetFrameTime
/* 86BC0 800963C0 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 86BC4 800963C4 00000000 */  nop
/* 86BC8 800963C8 03006014 */  bnez       $v1, .L800963D8
/* 86BCC 800963CC 40100300 */   sll       $v0, $v1, 1
/* 86BD0 800963D0 FA580208 */  j          .L800963E8
/* 86BD4 800963D4 64000324 */   addiu     $v1, $zero, 0x64
.L800963D8:
/* 86BD8 800963D8 21104300 */  addu       $v0, $v0, $v1
/* 86BDC 800963DC C0100200 */  sll        $v0, $v0, 3
/* 86BE0 800963E0 21104300 */  addu       $v0, $v0, $v1
/* 86BE4 800963E4 821A0200 */  srl        $v1, $v0, 10
.L800963E8:
/* 86BE8 800963E8 00140300 */  sll        $v0, $v1, 16
/* 86BEC 800963EC 0200401C */  bgtz       $v0, .L800963F8
/* 86BF0 800963F0 01000324 */   addiu     $v1, $zero, 0x1
/* 86BF4 800963F4 00140300 */  sll        $v0, $v1, 16
.L800963F8:
/* 86BF8 800963F8 0800E003 */  jr         $ra
/* 86BFC 800963FC 03140200 */   sra       $v0, $v0, 16
.size G2Timer_GetFrameTime, . - G2Timer_GetFrameTime
