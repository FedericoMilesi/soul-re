.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1C34
/* B2434 800C1C34 0E80013C */  lui        $at, %hi(StSTART_FLAG)
/* B2438 800C1C38 1CFD24AC */  sw         $a0, %lo(StSTART_FLAG)($at)
/* B243C 800C1C3C 0E80013C */  lui        $at, %hi(StStartFrame)
/* B2440 800C1C40 44FD25AC */  sw         $a1, %lo(StStartFrame)($at)
/* B2444 800C1C44 0E80013C */  lui        $at, %hi(StEndFrame)
/* B2448 800C1C48 0800E003 */  jr         $ra
/* B244C 800C1C4C 18FD26AC */   sw        $a2, %lo(StEndFrame)($at)
/* B2450 800C1C50 00000000 */  nop
.size func_800C1C34, . - func_800C1C34
