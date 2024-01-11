.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleStartPlayerControl
/* E944 8001E144 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* E948 8001E148 7FFF0324 */  addiu      $v1, $zero, -0x81
/* E94C 8001E14C 24104300 */  and        $v0, $v0, $v1
/* E950 8001E150 EFFF0324 */  addiu      $v1, $zero, -0x11
/* E954 8001E154 24104300 */  and        $v0, $v0, $v1
/* E958 8001E158 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* E95C 8001E15C 0800E003 */  jr         $ra
/* E960 8001E160 01000224 */   addiu     $v0, $zero, 0x1
.size SIGNAL_HandleStartPlayerControl, . - SIGNAL_HandleStartPlayerControl
