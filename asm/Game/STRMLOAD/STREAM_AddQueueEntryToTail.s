.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_AddQueueEntryToTail
/* 50894 80060094 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 50898 80060098 1000B0AF */  sw         $s0, 0x10($sp)
/* 5089C 8006009C 40CB908F */  lw         $s0, %gp_rel(loadFree)($gp)
/* 508A0 800600A0 00000000 */  nop
/* 508A4 800600A4 04000016 */  bnez       $s0, .L800600B8
/* 508A8 800600A8 1400BFAF */   sw        $ra, 0x14($sp)
/* 508AC 800600AC 0D80043C */  lui        $a0, %hi(gCurDir + 0x4)
/* 508B0 800600B0 2B52000C */  jal        DEBUG_FatalError
/* 508B4 800600B4 80198424 */   addiu     $a0, $a0, %lo(gCurDir + 0x4)
.L800600B8:
/* 508B8 800600B8 0000028E */  lw         $v0, 0x0($s0)
/* 508BC 800600BC 48CB838F */  lw         $v1, %gp_rel(loadTail)($gp)
/* 508C0 800600C0 000000AE */  sw         $zero, 0x0($s0)
/* 508C4 800600C4 40CB82AF */  sw         $v0, %gp_rel(loadFree)($gp)
/* 508C8 800600C8 03006010 */  beqz       $v1, .L800600D8
/* 508CC 800600CC 00000000 */   nop
/* 508D0 800600D0 37800108 */  j          .L800600DC
/* 508D4 800600D4 000070AC */   sw        $s0, 0x0($v1)
.L800600D8:
/* 508D8 800600D8 44CB90AF */  sw         $s0, %gp_rel(loadHead)($gp)
.L800600DC:
/* 508DC 800600DC 4CCB828F */  lw         $v0, %gp_rel(numLoads)($gp)
/* 508E0 800600E0 1400BF8F */  lw         $ra, 0x14($sp)
/* 508E4 800600E4 48CB90AF */  sw         $s0, %gp_rel(loadTail)($gp)
/* 508E8 800600E8 01004224 */  addiu      $v0, $v0, 0x1
/* 508EC 800600EC 4CCB82AF */  sw         $v0, %gp_rel(numLoads)($gp)
/* 508F0 800600F0 21100002 */  addu       $v0, $s0, $zero
/* 508F4 800600F4 1000B08F */  lw         $s0, 0x10($sp)
/* 508F8 800600F8 0800E003 */  jr         $ra
/* 508FC 800600FC 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_AddQueueEntryToTail, . - STREAM_AddQueueEntryToTail
