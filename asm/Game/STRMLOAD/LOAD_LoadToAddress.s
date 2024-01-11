.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_LoadToAddress
/* 50F40 80060740 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 50F44 80060744 1800B0AF */  sw         $s0, 0x18($sp)
/* 50F48 80060748 2180A000 */  addu       $s0, $a1, $zero
/* 50F4C 8006074C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 50F50 80060750 2188C000 */  addu       $s1, $a2, $zero
/* 50F54 80060754 21280000 */  addu       $a1, $zero, $zero
/* 50F58 80060758 2130A000 */  addu       $a2, $a1, $zero
/* 50F5C 8006075C 2138A000 */  addu       $a3, $a1, $zero
/* 50F60 80060760 2000BFAF */  sw         $ra, 0x20($sp)
/* 50F64 80060764 1000A0AF */  sw         $zero, 0x10($sp)
/* 50F68 80060768 7081010C */  jal        STREAM_SetUpQueueEntry
/* 50F6C 8006076C 1400A0AF */   sw        $zero, 0x14($sp)
/* 50F70 80060770 01000324 */  addiu      $v1, $zero, 0x1
/* 50F74 80060774 140050AC */  sw         $s0, 0x14($v0)
/* 50F78 80060778 040043A4 */  sh         $v1, 0x4($v0)
/* 50F7C 8006077C 060051A0 */  sb         $s1, 0x6($v0)
/* 50F80 80060780 070040A0 */  sb         $zero, 0x7($v0)
.L80060784:
/* 50F84 80060784 7580010C */  jal        STREAM_PollLoadQueue
/* 50F88 80060788 00000000 */   nop
/* 50F8C 8006078C FDFF4014 */  bnez       $v0, .L80060784
/* 50F90 80060790 00000000 */   nop
/* 50F94 80060794 2000BF8F */  lw         $ra, 0x20($sp)
/* 50F98 80060798 1C00B18F */  lw         $s1, 0x1C($sp)
/* 50F9C 8006079C 1800B08F */  lw         $s0, 0x18($sp)
/* 50FA0 800607A0 0800E003 */  jr         $ra
/* 50FA4 800607A4 2800BD27 */   addiu     $sp, $sp, 0x28
.size LOAD_LoadToAddress, . - LOAD_LoadToAddress
