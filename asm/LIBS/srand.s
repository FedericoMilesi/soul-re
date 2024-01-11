.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel srand
/* AD118 800BC918 0E80013C */  lui        $at, %hi(GsOUT_PACKET_P_dup1)
/* AD11C 800BC91C 0800E003 */  jr         $ra
/* AD120 800BC920 68D624AC */   sw        $a0, %lo(GsOUT_PACKET_P_dup1)($at)
/* AD124 800BC924 00000000 */  nop
.size srand, . - srand
