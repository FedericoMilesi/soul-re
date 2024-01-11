.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_ReadFile
/* 510F8 800608F8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 510FC 800608FC 2000A227 */  addiu      $v0, $sp, 0x20
/* 51100 80060900 FF00A530 */  andi       $a1, $a1, 0xFF
/* 51104 80060904 21300000 */  addu       $a2, $zero, $zero
/* 51108 80060908 2138C000 */  addu       $a3, $a2, $zero
/* 5110C 8006090C 2800BFAF */  sw         $ra, 0x28($sp)
/* 51110 80060910 1000A0AF */  sw         $zero, 0x10($sp)
/* 51114 80060914 1400A2AF */  sw         $v0, 0x14($sp)
/* 51118 80060918 B081010C */  jal        STREAM_QueueNonblockingLoads
/* 5111C 8006091C 1800A0AF */   sw        $zero, 0x18($sp)
.L80060920:
/* 51120 80060920 7580010C */  jal        STREAM_PollLoadQueue
/* 51124 80060924 00000000 */   nop
/* 51128 80060928 FDFF4014 */  bnez       $v0, .L80060920
/* 5112C 8006092C 00000000 */   nop
/* 51130 80060930 2000A28F */  lw         $v0, 0x20($sp)
/* 51134 80060934 2800BF8F */  lw         $ra, 0x28($sp)
/* 51138 80060938 00000000 */  nop
/* 5113C 8006093C 0800E003 */  jr         $ra
/* 51140 80060940 3000BD27 */   addiu     $sp, $sp, 0x30
.size LOAD_ReadFile, . - LOAD_ReadFile
