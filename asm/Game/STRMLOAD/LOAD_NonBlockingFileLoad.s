.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_NonBlockingFileLoad
/* 50FEC 800607EC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 50FF0 800607F0 2118A000 */  addu       $v1, $a1, $zero
/* 50FF4 800607F4 2140C000 */  addu       $t0, $a2, $zero
/* 50FF8 800607F8 3800A28F */  lw         $v0, 0x38($sp)
/* 50FFC 800607FC 3C00A593 */  lbu        $a1, 0x3C($sp)
/* 51000 80060800 21306000 */  addu       $a2, $v1, $zero
/* 51004 80060804 1000A7AF */  sw         $a3, 0x10($sp)
/* 51008 80060808 21380001 */  addu       $a3, $t0, $zero
/* 5100C 8006080C 2000BFAF */  sw         $ra, 0x20($sp)
/* 51010 80060810 1800A0AF */  sw         $zero, 0x18($sp)
/* 51014 80060814 B081010C */  jal        STREAM_QueueNonblockingLoads
/* 51018 80060818 1400A2AF */   sw        $v0, 0x14($sp)
/* 5101C 8006081C 2000BF8F */  lw         $ra, 0x20($sp)
/* 51020 80060820 00000000 */  nop
/* 51024 80060824 0800E003 */  jr         $ra
/* 51028 80060828 2800BD27 */   addiu     $sp, $sp, 0x28
.size LOAD_NonBlockingFileLoad, . - LOAD_NonBlockingFileLoad
