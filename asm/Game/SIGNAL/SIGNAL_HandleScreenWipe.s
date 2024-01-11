.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleScreenWipe
/* EA00 8001E200 0600A294 */  lhu        $v0, 0x6($a1)
/* EA04 8001E204 00000000 */  nop
/* EA08 8001E208 94BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* EA0C 8001E20C 0600A284 */  lh         $v0, 0x6($a1)
/* EA10 8001E210 00000000 */  nop
/* EA14 8001E214 02004104 */  bgez       $v0, .L8001E220
/* EA18 8001E218 00000000 */   nop
/* EA1C 8001E21C 23100200 */  negu       $v0, $v0
.L8001E220:
/* EA20 8001E220 96BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCE)($gp)
/* EA24 8001E224 0400A294 */  lhu        $v0, 0x4($a1)
/* EA28 8001E228 00000000 */  nop
/* EA2C 8001E22C 98BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xD0)($gp)
/* EA30 8001E230 0800E003 */  jr         $ra
/* EA34 8001E234 01000224 */   addiu     $v0, $zero, 0x1
.size SIGNAL_HandleScreenWipe, . - SIGNAL_HandleScreenWipe
