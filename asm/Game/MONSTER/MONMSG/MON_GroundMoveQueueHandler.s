.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_GroundMoveQueueHandler
/* 75184 80084984 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 75188 80084988 1400B1AF */  sw         $s1, 0x14($sp)
/* 7518C 8008498C 21888000 */  addu       $s1, $a0, $zero
/* 75190 80084990 1000B0AF */  sw         $s0, 0x10($sp)
/* 75194 80084994 21800000 */  addu       $s0, $zero, $zero
/* 75198 80084998 1800B2AF */  sw         $s2, 0x18($sp)
/* 7519C 8008499C 0104123C */  lui        $s2, (0x4010080 >> 16)
/* 751A0 800849A0 80005236 */  ori        $s2, $s2, (0x4010080 & 0xFFFF)
/* 751A4 800849A4 2000BFAF */  sw         $ra, 0x20($sp)
/* 751A8 800849A8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 751AC 800849AC 6C01338E */  lw         $s3, 0x16C($s1)
.L800849B0:
/* 751B0 800849B0 27C3010C */  jal        DeMessageQueue
/* 751B4 800849B4 08006426 */   addiu     $a0, $s3, 0x8
/* 751B8 800849B8 21284000 */  addu       $a1, $v0, $zero
/* 751BC 800849BC 0C00A010 */  beqz       $a1, .L800849F0
/* 751C0 800849C0 21100002 */   addu      $v0, $s0, $zero
/* 751C4 800849C4 0000A28C */  lw         $v0, 0x0($a1)
/* 751C8 800849C8 00000000 */  nop
/* 751CC 800849CC 04005214 */  bne        $v0, $s2, .L800849E0
/* 751D0 800849D0 00000000 */   nop
/* 751D4 800849D4 0104103C */  lui        $s0, (0x4010080 >> 16)
/* 751D8 800849D8 6C120208 */  j          .L800849B0
/* 751DC 800849DC 80001036 */   ori       $s0, $s0, (0x4010080 & 0xFFFF)
.L800849E0:
/* 751E0 800849E0 1413020C */  jal        MON_IdleMessageHandler
/* 751E4 800849E4 21202002 */   addu      $a0, $s1, $zero
/* 751E8 800849E8 6C120208 */  j          .L800849B0
/* 751EC 800849EC 00000000 */   nop
.L800849F0:
/* 751F0 800849F0 2000BF8F */  lw         $ra, 0x20($sp)
/* 751F4 800849F4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 751F8 800849F8 1800B28F */  lw         $s2, 0x18($sp)
/* 751FC 800849FC 1400B18F */  lw         $s1, 0x14($sp)
/* 75200 80084A00 1000B08F */  lw         $s0, 0x10($sp)
/* 75204 80084A04 0800E003 */  jr         $ra
/* 75208 80084A08 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_GroundMoveQueueHandler, . - MON_GroundMoveQueueHandler
