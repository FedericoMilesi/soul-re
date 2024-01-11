.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_RemoveQueueEntry
/* 50838 80060038 48CB828F */  lw         $v0, %gp_rel(loadTail)($gp)
/* 5083C 8006003C 00000000 */  nop
/* 50840 80060040 02004414 */  bne        $v0, $a0, .L8006004C
/* 50844 80060044 00000000 */   nop
/* 50848 80060048 48CB85AF */  sw         $a1, %gp_rel(loadTail)($gp)
.L8006004C:
/* 5084C 8006004C 0600A014 */  bnez       $a1, .L80060068
/* 50850 80060050 00000000 */   nop
/* 50854 80060054 0000828C */  lw         $v0, 0x0($a0)
/* 50858 80060058 00000000 */  nop
/* 5085C 8006005C 44CB82AF */  sw         $v0, %gp_rel(loadHead)($gp)
/* 50860 80060060 1D800108 */  j          .L80060074
/* 50864 80060064 00000000 */   nop
.L80060068:
/* 50868 80060068 0000828C */  lw         $v0, 0x0($a0)
/* 5086C 8006006C 00000000 */  nop
/* 50870 80060070 0000A2AC */  sw         $v0, 0x0($a1)
.L80060074:
/* 50874 80060074 40CB838F */  lw         $v1, %gp_rel(loadFree)($gp)
/* 50878 80060078 4CCB828F */  lw         $v0, %gp_rel(numLoads)($gp)
/* 5087C 8006007C 40CB84AF */  sw         $a0, %gp_rel(loadFree)($gp)
/* 50880 80060080 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 50884 80060084 000083AC */  sw         $v1, 0x0($a0)
/* 50888 80060088 4CCB82AF */  sw         $v0, %gp_rel(numLoads)($gp)
/* 5088C 8006008C 0800E003 */  jr         $ra
/* 50890 80060090 00000000 */   nop
.size STREAM_RemoveQueueEntry, . - STREAM_RemoveQueueEntry
