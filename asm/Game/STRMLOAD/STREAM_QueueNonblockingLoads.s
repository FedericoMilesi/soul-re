.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_QueueNonblockingLoads
/* 50EC0 800606C0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 50EC4 800606C4 1800B0AF */  sw         $s0, 0x18($sp)
/* 50EC8 800606C8 2180A000 */  addu       $s0, $a1, $zero
/* 50ECC 800606CC 3C00A38F */  lw         $v1, 0x3C($sp)
/* 50ED0 800606D0 2128C000 */  addu       $a1, $a2, $zero
/* 50ED4 800606D4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 50ED8 800606D8 4000B18F */  lw         $s1, 0x40($sp)
/* 50EDC 800606DC E0A3828F */  lw         $v0, %gp_rel(loadFromHead)($gp)
/* 50EE0 800606E0 2130E000 */  addu       $a2, $a3, $zero
/* 50EE4 800606E4 E0A380AF */  sw         $zero, %gp_rel(loadFromHead)($gp)
/* 50EE8 800606E8 1000A3AF */  sw         $v1, 0x10($sp)
/* 50EEC 800606EC 1400A2AF */  sw         $v0, 0x14($sp)
/* 50EF0 800606F0 3800A78F */  lw         $a3, 0x38($sp)
/* 50EF4 800606F4 2000BFAF */  sw         $ra, 0x20($sp)
/* 50EF8 800606F8 7081010C */  jal        STREAM_SetUpQueueEntry
/* 50EFC 800606FC FF001032 */   andi      $s0, $s0, 0xFF
/* 50F00 80060700 21184000 */  addu       $v1, $v0, $zero
/* 50F04 80060704 01000224 */  addiu      $v0, $zero, 0x1
/* 50F08 80060708 140060AC */  sw         $zero, 0x14($v1)
/* 50F0C 8006070C 070062A0 */  sb         $v0, 0x7($v1)
/* 50F10 80060710 240070AC */  sw         $s0, 0x24($v1)
/* 50F14 80060714 03000016 */  bnez       $s0, .L80060724
/* 50F18 80060718 060071A0 */   sb        $s1, 0x6($v1)
/* 50F1C 8006071C CA810108 */  j          .L80060728
/* 50F20 80060720 05000224 */   addiu     $v0, $zero, 0x5
.L80060724:
/* 50F24 80060724 01000224 */  addiu      $v0, $zero, 0x1
.L80060728:
/* 50F28 80060728 040062A4 */  sh         $v0, 0x4($v1)
/* 50F2C 8006072C 2000BF8F */  lw         $ra, 0x20($sp)
/* 50F30 80060730 1C00B18F */  lw         $s1, 0x1C($sp)
/* 50F34 80060734 1800B08F */  lw         $s0, 0x18($sp)
/* 50F38 80060738 0800E003 */  jr         $ra
/* 50F3C 8006073C 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_QueueNonblockingLoads, . - STREAM_QueueNonblockingLoads
