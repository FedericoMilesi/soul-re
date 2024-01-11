.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAYER_OkToLookAround
/* 35D4 80012DD4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 35D8 80012DD8 1000B0AF */  sw         $s0, 0x10($sp)
/* 35DC 80012DDC 21808000 */  addu       $s0, $a0, $zero
/* 35E0 80012DE0 1400BFAF */  sw         $ra, 0x14($sp)
/* 35E4 80012DE4 92D1000C */  jal        INSTANCE_Query
/* 35E8 80012DE8 01000524 */   addiu     $a1, $zero, 0x1
/* 35EC 80012DEC 01004230 */  andi       $v0, $v0, 0x1
/* 35F0 80012DF0 05004014 */  bnez       $v0, .L80012E08
/* 35F4 80012DF4 00000000 */   nop
/* 35F8 80012DF8 CBFC010C */  jal        MONAPI_OkToLookAround
/* 35FC 80012DFC 21200002 */   addu      $a0, $s0, $zero
/* 3600 80012E00 844B0008 */  j          .L80012E10
/* 3604 80012E04 00000000 */   nop
.L80012E08:
/* 3608 80012E08 16D1020C */  jal        RAZIEL_OkToLookAround
/* 360C 80012E0C 21200002 */   addu      $a0, $s0, $zero
.L80012E10:
/* 3610 80012E10 1400BF8F */  lw         $ra, 0x14($sp)
/* 3614 80012E14 1000B08F */  lw         $s0, 0x10($sp)
/* 3618 80012E18 0800E003 */  jr         $ra
/* 361C 80012E1C 1800BD27 */   addiu     $sp, $sp, 0x18
.size PLAYER_OkToLookAround, . - PLAYER_OkToLookAround
