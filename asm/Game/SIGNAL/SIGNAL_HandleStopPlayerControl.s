.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleStopPlayerControl
/* E92C 8001E12C 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* E930 8001E130 00000000 */  nop
/* E934 8001E134 90004234 */  ori        $v0, $v0, 0x90
/* E938 8001E138 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* E93C 8001E13C 0800E003 */  jr         $ra
/* E940 8001E140 01000224 */   addiu     $v0, $zero, 0x1
.size SIGNAL_HandleStopPlayerControl, . - SIGNAL_HandleStopPlayerControl
