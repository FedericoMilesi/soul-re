.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_CombatEntry
/* 7A60C 80089E0C FBFF053C */  lui        $a1, (0xFFFBFFFF >> 16)
/* 7A610 80089E10 6C01848C */  lw         $a0, 0x16C($a0)
/* 7A614 80089E14 FFFFA534 */  ori        $a1, $a1, (0xFFFBFFFF & 0xFFFF)
/* 7A618 80089E18 0000828C */  lw         $v0, 0x0($a0)
/* 7A61C 80089E1C 0002033C */  lui        $v1, (0x2000000 >> 16)
/* 7A620 80089E20 080183AC */  sw         $v1, 0x108($a0)
/* 7A624 80089E24 0100033C */  lui        $v1, (0x10000 >> 16)
/* 7A628 80089E28 24104500 */  and        $v0, $v0, $a1
/* 7A62C 80089E2C 25104300 */  or         $v0, $v0, $v1
/* 7A630 80089E30 0800E003 */  jr         $ra
/* 7A634 80089E34 000082AC */   sw        $v0, 0x0($a0)
.size MON_CombatEntry, . - MON_CombatEntry
