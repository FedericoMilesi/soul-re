.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_QueueHandler
/* 7E090 8008D890 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7E094 8008D894 1000B0AF */  sw         $s0, 0x10($sp)
/* 7E098 8008D898 21808000 */  addu       $s0, $a0, $zero
/* 7E09C 8008D89C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7E0A0 8008D8A0 0001113C */  lui        $s1, (0x100000D >> 16)
/* 7E0A4 8008D8A4 0D003136 */  ori        $s1, $s1, (0x100000D & 0xFFFF)
/* 7E0A8 8008D8A8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7E0AC 8008D8AC 17001324 */  addiu      $s3, $zero, 0x17
/* 7E0B0 8008D8B0 2000BFAF */  sw         $ra, 0x20($sp)
/* 7E0B4 8008D8B4 1800B2AF */  sw         $s2, 0x18($sp)
/* 7E0B8 8008D8B8 6C01128E */  lw         $s2, 0x16C($s0)
.L8008D8BC:
/* 7E0BC 8008D8BC 27C3010C */  jal        DeMessageQueue
/* 7E0C0 8008D8C0 08004426 */   addiu     $a0, $s2, 0x8
/* 7E0C4 8008D8C4 21284000 */  addu       $a1, $v0, $zero
/* 7E0C8 8008D8C8 1100A010 */  beqz       $a1, .L8008D910
/* 7E0CC 8008D8CC 00000000 */   nop
/* 7E0D0 8008D8D0 0000A28C */  lw         $v0, 0x0($a1)
/* 7E0D4 8008D8D4 00000000 */  nop
/* 7E0D8 8008D8D8 09005114 */  bne        $v0, $s1, .L8008D900
/* 7E0DC 8008D8DC 00000000 */   nop
/* 7E0E0 8008D8E0 9801028E */  lw         $v0, 0x198($s0)
/* 7E0E4 8008D8E4 00000000 */  nop
/* 7E0E8 8008D8E8 F4FF5310 */  beq        $v0, $s3, .L8008D8BC
/* 7E0EC 8008D8EC 21200002 */   addu      $a0, $s0, $zero
/* 7E0F0 8008D8F0 91FE010C */  jal        MON_SwitchState
/* 7E0F4 8008D8F4 17000524 */   addiu     $a1, $zero, 0x17
/* 7E0F8 8008D8F8 2F360208 */  j          .L8008D8BC
/* 7E0FC 8008D8FC 00000000 */   nop
.L8008D900:
/* 7E100 8008D900 6513020C */  jal        MON_DefaultMessageHandler
/* 7E104 8008D904 21200002 */   addu      $a0, $s0, $zero
/* 7E108 8008D908 2F360208 */  j          .L8008D8BC
/* 7E10C 8008D90C 00000000 */   nop
.L8008D910:
/* 7E110 8008D910 2000BF8F */  lw         $ra, 0x20($sp)
/* 7E114 8008D914 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7E118 8008D918 1800B28F */  lw         $s2, 0x18($sp)
/* 7E11C 8008D91C 1400B18F */  lw         $s1, 0x14($sp)
/* 7E120 8008D920 1000B08F */  lw         $s0, 0x10($sp)
/* 7E124 8008D924 0800E003 */  jr         $ra
/* 7E128 8008D928 2800BD27 */   addiu     $sp, $sp, 0x28
.size SOUL_QueueHandler, . - SOUL_QueueHandler
