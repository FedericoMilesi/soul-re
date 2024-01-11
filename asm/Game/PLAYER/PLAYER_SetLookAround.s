.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAYER_SetLookAround
/* 3620 80012E20 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3624 80012E24 1000B0AF */  sw         $s0, 0x10($sp)
/* 3628 80012E28 21808000 */  addu       $s0, $a0, $zero
/* 362C 80012E2C 1400BFAF */  sw         $ra, 0x14($sp)
/* 3630 80012E30 92D1000C */  jal        INSTANCE_Query
/* 3634 80012E34 01000524 */   addiu     $a1, $zero, 0x1
/* 3638 80012E38 01004230 */  andi       $v0, $v0, 0x1
/* 363C 80012E3C 05004010 */  beqz       $v0, .L80012E54
/* 3640 80012E40 00000000 */   nop
/* 3644 80012E44 D9D0020C */  jal        RAZIEL_SetLookAround
/* 3648 80012E48 21200002 */   addu      $a0, $s0, $zero
/* 364C 80012E4C 974B0008 */  j          .L80012E5C
/* 3650 80012E50 00000000 */   nop
.L80012E54:
/* 3654 80012E54 B3FC010C */  jal        MONAPI_SetLookAround
/* 3658 80012E58 21200002 */   addu      $a0, $s0, $zero
.L80012E5C:
/* 365C 80012E5C 1400BF8F */  lw         $ra, 0x14($sp)
/* 3660 80012E60 1000B08F */  lw         $s0, 0x10($sp)
/* 3664 80012E64 0800E003 */  jr         $ra
/* 3668 80012E68 1800BD27 */   addiu     $sp, $sp, 0x18
.size PLAYER_SetLookAround, . - PLAYER_SetLookAround
