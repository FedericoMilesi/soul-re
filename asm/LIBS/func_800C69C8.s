.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C69C8
/* B71C8 800C69C8 0D80043C */  lui        $a0, %hi(_spu_RXX + 0x14)
/* B71CC 800C69CC 70ED848C */  lw         $a0, %lo(_spu_RXX + 0x14)($a0)
/* B71D0 800C69D0 FFF0033C */  lui        $v1, (0xF0FFFFFF >> 16)
/* B71D4 800C69D4 0000828C */  lw         $v0, 0x0($a0)
/* B71D8 800C69D8 FFFF6334 */  ori        $v1, $v1, (0xF0FFFFFF & 0xFFFF)
/* B71DC 800C69DC 24104300 */  and        $v0, $v0, $v1
/* B71E0 800C69E0 0020033C */  lui        $v1, (0x20000000 >> 16)
/* B71E4 800C69E4 25104300 */  or         $v0, $v0, $v1
/* B71E8 800C69E8 0800E003 */  jr         $ra
/* B71EC 800C69EC 000082AC */   sw        $v0, 0x0($a0)
.size func_800C69C8, . - func_800C69C8
