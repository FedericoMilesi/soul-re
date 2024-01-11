.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleScreenWipeColor
/* EA40 8001E240 0400A290 */  lbu        $v0, 0x4($a1)
/* EA44 8001E244 00000000 */  nop
/* EA48 8001E248 90BE82A3 */  sb         $v0, %gp_rel(gameTrackerX + 0xC8)($gp)
/* EA4C 8001E24C 0500A290 */  lbu        $v0, 0x5($a1)
/* EA50 8001E250 00000000 */  nop
/* EA54 8001E254 91BE82A3 */  sb         $v0, %gp_rel(gameTrackerX + 0xC9)($gp)
/* EA58 8001E258 0600A290 */  lbu        $v0, 0x6($a1)
/* EA5C 8001E25C 00000000 */  nop
/* EA60 8001E260 92BE82A3 */  sb         $v0, %gp_rel(gameTrackerX + 0xCA)($gp)
/* EA64 8001E264 0800E003 */  jr         $ra
/* EA68 8001E268 01000224 */   addiu     $v0, $zero, 0x1
.size SIGNAL_HandleScreenWipeColor, . - SIGNAL_HandleScreenWipeColor
