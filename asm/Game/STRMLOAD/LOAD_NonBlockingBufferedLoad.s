.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_NonBlockingBufferedLoad
/* 5102C 8006082C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 51030 80060830 2110A000 */  addu       $v0, $a1, $zero
/* 51034 80060834 2118C000 */  addu       $v1, $a2, $zero
/* 51038 80060838 21280000 */  addu       $a1, $zero, $zero
/* 5103C 8006083C 21304000 */  addu       $a2, $v0, $zero
/* 51040 80060840 1000A7AF */  sw         $a3, 0x10($sp)
/* 51044 80060844 21386000 */  addu       $a3, $v1, $zero
/* 51048 80060848 2000BFAF */  sw         $ra, 0x20($sp)
/* 5104C 8006084C 1400A0AF */  sw         $zero, 0x14($sp)
/* 51050 80060850 B081010C */  jal        STREAM_QueueNonblockingLoads
/* 51054 80060854 1800A0AF */   sw        $zero, 0x18($sp)
/* 51058 80060858 2000BF8F */  lw         $ra, 0x20($sp)
/* 5105C 8006085C 00000000 */  nop
/* 51060 80060860 0800E003 */  jr         $ra
/* 51064 80060864 2800BD27 */   addiu     $sp, $sp, 0x28
.size LOAD_NonBlockingBufferedLoad, . - LOAD_NonBlockingBufferedLoad
