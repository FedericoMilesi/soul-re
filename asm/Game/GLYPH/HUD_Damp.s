.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUD_Damp
/* 6CC04 8007C404 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6CC08 8007C408 21188000 */  addu       $v1, $a0, $zero
/* 6CC0C 8007C40C 1800A227 */  addiu      $v0, $sp, 0x18
/* 6CC10 8007C410 003C0700 */  sll        $a3, $a3, 16
/* 6CC14 8007C414 033C0700 */  sra        $a3, $a3, 16
/* 6CC18 8007C418 1400A7AF */  sw         $a3, 0x14($sp)
/* 6CC1C 8007C41C 2138C000 */  addu       $a3, $a2, $zero
/* 6CC20 8007C420 00340500 */  sll        $a2, $a1, 16
/* 6CC24 8007C424 01000424 */  addiu      $a0, $zero, 0x1
/* 6CC28 8007C428 21286000 */  addu       $a1, $v1, $zero
/* 6CC2C 8007C42C 03340600 */  sra        $a2, $a2, 16
/* 6CC30 8007C430 2000BFAF */  sw         $ra, 0x20($sp)
/* 6CC34 8007C434 605C000C */  jal        CriticalDampValue
/* 6CC38 8007C438 1000A2AF */   sw        $v0, 0x10($sp)
/* 6CC3C 8007C43C 2000BF8F */  lw         $ra, 0x20($sp)
/* 6CC40 8007C440 00000000 */  nop
/* 6CC44 8007C444 0800E003 */  jr         $ra
/* 6CC48 8007C448 2800BD27 */   addiu     $sp, $sp, 0x28
.size HUD_Damp, . - HUD_Damp
