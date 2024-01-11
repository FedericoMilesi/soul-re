.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C55C8
/* B5DC8 800C55C8 0D80013C */  lui        $at, %hi(CD_intstr + 0x204)
/* B5DCC 800C55CC 0800E003 */  jr         $ra
/* B5DD0 800C55D0 2CEC24AC */   sw        $a0, %lo(CD_intstr + 0x204)($at)
.size func_800C55C8, . - func_800C55C8
