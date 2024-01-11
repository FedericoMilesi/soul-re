.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetTimer
/* A38C4 800B30C4 00230400 */  sll        $a0, $a0, 12
/* A38C8 800B30C8 78FB84AF */  sw         $a0, %gp_rel(Raziel + 0x548)($gp)
/* A38CC 800B30CC 0800E003 */  jr         $ra
/* A38D0 800B30D0 00000000 */   nop
.size SetTimer, . - SetTimer
