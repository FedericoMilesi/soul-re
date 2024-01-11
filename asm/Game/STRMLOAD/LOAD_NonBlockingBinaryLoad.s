.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_NonBlockingBinaryLoad
/* 50FA8 800607A8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 50FAC 800607AC 2140A000 */  addu       $t0, $a1, $zero
/* 50FB0 800607B0 2148C000 */  addu       $t1, $a2, $zero
/* 50FB4 800607B4 01000224 */  addiu      $v0, $zero, 0x1
/* 50FB8 800607B8 3800A38F */  lw         $v1, 0x38($sp)
/* 50FBC 800607BC 3C00A593 */  lbu        $a1, 0x3C($sp)
/* 50FC0 800607C0 21300001 */  addu       $a2, $t0, $zero
/* 50FC4 800607C4 1000A7AF */  sw         $a3, 0x10($sp)
/* 50FC8 800607C8 21382001 */  addu       $a3, $t1, $zero
/* 50FCC 800607CC 2000BFAF */  sw         $ra, 0x20($sp)
/* 50FD0 800607D0 1800A2AF */  sw         $v0, 0x18($sp)
/* 50FD4 800607D4 B081010C */  jal        STREAM_QueueNonblockingLoads
/* 50FD8 800607D8 1400A3AF */   sw        $v1, 0x14($sp)
/* 50FDC 800607DC 2000BF8F */  lw         $ra, 0x20($sp)
/* 50FE0 800607E0 00000000 */  nop
/* 50FE4 800607E4 0800E003 */  jr         $ra
/* 50FE8 800607E8 2800BD27 */   addiu     $sp, $sp, 0x28
.size LOAD_NonBlockingBinaryLoad, . - LOAD_NonBlockingBinaryLoad
