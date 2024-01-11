.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_ClearAlarm
/* 807AC 8008FFAC 1800828C */  lw         $v0, 0x18($a0)
/* 807B0 8008FFB0 27280500 */  nor        $a1, $zero, $a1
/* 807B4 8008FFB4 24104500 */  and        $v0, $v0, $a1
/* 807B8 8008FFB8 0800E003 */  jr         $ra
/* 807BC 8008FFBC 180082AC */   sw        $v0, 0x18($a0)
.size G2AnimSection_ClearAlarm, . - G2AnimSection_ClearAlarm
