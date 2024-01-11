.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3528
/* B3D28 800C3528 280085AC */  sw         $a1, 0x28($a0)
/* B3D2C 800C352C 0800E003 */  jr         $ra
/* B3D30 800C3530 340086A0 */   sb        $a2, 0x34($a0)
.size func_800C3528, . - func_800C3528
