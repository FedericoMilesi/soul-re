.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_RelocateCameraSpline
/* E964 8001E164 0800838C */  lw         $v1, 0x8($a0)
/* E968 8001E168 00000000 */  nop
/* E96C 8001E16C 02006010 */  beqz       $v1, .L8001E178
/* E970 8001E170 21100000 */   addu      $v0, $zero, $zero
/* E974 8001E174 21106500 */  addu       $v0, $v1, $a1
.L8001E178:
/* E978 8001E178 0800E003 */  jr         $ra
/* E97C 8001E17C 080082AC */   sw        $v0, 0x8($a0)
.size SIGNAL_RelocateCameraSpline, . - SIGNAL_RelocateCameraSpline
