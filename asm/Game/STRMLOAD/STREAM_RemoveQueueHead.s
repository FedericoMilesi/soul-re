.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_RemoveQueueHead
/* 507F8 8005FFF8 44CB848F */  lw         $a0, %gp_rel(loadHead)($gp)
/* 507FC 8005FFFC 00000000 */  nop
/* 50800 80060000 0000828C */  lw         $v0, 0x0($a0)
/* 50804 80060004 00000000 */  nop
/* 50808 80060008 44CB82AF */  sw         $v0, %gp_rel(loadHead)($gp)
/* 5080C 8006000C 02004014 */  bnez       $v0, .L80060018
/* 50810 80060010 00000000 */   nop
/* 50814 80060014 48CB80AF */  sw         $zero, %gp_rel(loadTail)($gp)
.L80060018:
/* 50818 80060018 40CB838F */  lw         $v1, %gp_rel(loadFree)($gp)
/* 5081C 8006001C 4CCB828F */  lw         $v0, %gp_rel(numLoads)($gp)
/* 50820 80060020 40CB84AF */  sw         $a0, %gp_rel(loadFree)($gp)
/* 50824 80060024 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 50828 80060028 000083AC */  sw         $v1, 0x0($a0)
/* 5082C 8006002C 4CCB82AF */  sw         $v0, %gp_rel(numLoads)($gp)
/* 50830 80060030 0800E003 */  jr         $ra
/* 50834 80060034 00000000 */   nop
.size STREAM_RemoveQueueHead, . - STREAM_RemoveQueueHead
