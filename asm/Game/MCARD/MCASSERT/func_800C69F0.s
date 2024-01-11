.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C69F0
/* B71F0 800C69F0 0D80043C */  lui        $a0, %hi(_spu_RXX + 0x14)
/* B71F4 800C69F4 70ED848C */  lw         $a0, %lo(_spu_RXX + 0x14)($a0)
/* B71F8 800C69F8 FFF0033C */  lui        $v1, (0xF0FFFFFF >> 16)
/* B71FC 800C69FC 0000828C */  lw         $v0, 0x0($a0)
/* B7200 800C6A00 FFFF6334 */  ori        $v1, $v1, (0xF0FFFFFF & 0xFFFF)
/* B7204 800C6A04 24104300 */  and        $v0, $v0, $v1
/* B7208 800C6A08 0022033C */  lui        $v1, (0x22000000 >> 16)
/* B720C 800C6A0C 25104300 */  or         $v0, $v0, $v1
/* B7210 800C6A10 0800E003 */  jr         $ra
/* B7214 800C6A14 000082AC */   sw        $v0, 0x0($a0)
.size func_800C69F0, . - func_800C69F0
