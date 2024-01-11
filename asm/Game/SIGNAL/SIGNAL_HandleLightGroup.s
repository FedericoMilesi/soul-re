.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleLightGroup
/* E3F8 8001DBF8 04008010 */  beqz       $a0, .L8001DC0C
/* E3FC 8001DBFC 00000000 */   nop
/* E400 8001DC00 0400A290 */  lbu        $v0, 0x4($a1)
/* E404 8001DC04 00000000 */  nop
/* E408 8001DC08 620082A0 */  sb         $v0, 0x62($a0)
.L8001DC0C:
/* E40C 8001DC0C 0800E003 */  jr         $ra
/* E410 8001DC10 01000224 */   addiu     $v0, $zero, 0x1
.size SIGNAL_HandleLightGroup, . - SIGNAL_HandleLightGroup
