.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnMessageQueue
/* 6150C 80070D0C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 61510 80070D10 2110A000 */  addu       $v0, $a1, $zero
/* 61514 80070D14 1000BFAF */  sw         $ra, 0x10($sp)
/* 61518 80070D18 0000458C */  lw         $a1, 0x0($v0)
/* 6151C 80070D1C 0400468C */  lw         $a2, 0x4($v0)
/* 61520 80070D20 4EC3010C */  jal        EnMessageQueueData
/* 61524 80070D24 00000000 */   nop
/* 61528 80070D28 1000BF8F */  lw         $ra, 0x10($sp)
/* 6152C 80070D2C 00000000 */  nop
/* 61530 80070D30 0800E003 */  jr         $ra
/* 61534 80070D34 1800BD27 */   addiu     $sp, $sp, 0x18
.size EnMessageQueue, . - EnMessageQueue
