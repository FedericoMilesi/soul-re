.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BBE10
/* AC610 800BBE10 0010023C */  lui        $v0, (0x10000000 >> 16)
/* AC614 800BBE14 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* AC618 800BBE18 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* AC61C 800BBE1C 25208200 */  or         $a0, $a0, $v0
/* AC620 800BBE20 000064AC */  sw         $a0, 0x0($v1)
/* AC624 800BBE24 0D80023C */  lui        $v0, %hi(GEnv + 0x104)
/* AC628 800BBE28 10DB428C */  lw         $v0, %lo(GEnv + 0x104)($v0)
/* AC62C 800BBE2C FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* AC630 800BBE30 0000428C */  lw         $v0, 0x0($v0)
/* AC634 800BBE34 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* AC638 800BBE38 0800E003 */  jr         $ra
/* AC63C 800BBE3C 24104300 */   and       $v0, $v0, $v1
.size func_800BBE10, . - func_800BBE10
