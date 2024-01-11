.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB380
/* ABB80 800BB380 0200A010 */  beqz       $a1, .L800BB38C
/* ABB84 800BB384 00E1033C */   lui       $v1, (0xE1000200 >> 16)
/* ABB88 800BB388 00026334 */  ori        $v1, $v1, (0xE1000200 & 0xFFFF)
.L800BB38C:
/* ABB8C 800BB38C 02008010 */  beqz       $a0, .L800BB398
/* ABB90 800BB390 FF09C230 */   andi      $v0, $a2, 0x9FF
/* ABB94 800BB394 00044234 */  ori        $v0, $v0, 0x400
.L800BB398:
/* ABB98 800BB398 0800E003 */  jr         $ra
/* ABB9C 800BB39C 25106200 */   or        $v0, $v1, $v0
.size func_800BB380, . - func_800BB380
