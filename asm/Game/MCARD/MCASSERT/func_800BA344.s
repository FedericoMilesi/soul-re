.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BA344
/* AAB44 800BA344 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AAB48 800BA348 1000B0AF */  sw         $s0, 0x10($sp)
/* AAB4C 800BA34C 0D80103C */  lui        $s0, %hi(GEnv + 0x2)
/* AAB50 800BA350 0EDA1026 */  addiu      $s0, $s0, %lo(GEnv + 0x2)
/* AAB54 800BA354 1800BFAF */  sw         $ra, 0x18($sp)
/* AAB58 800BA358 1400B1AF */  sw         $s1, 0x14($sp)
/* AAB5C 800BA35C 00000292 */  lbu        $v0, 0x0($s0)
/* AAB60 800BA360 00000000 */  nop
/* AAB64 800BA364 0200422C */  sltiu      $v0, $v0, 0x2
/* AAB68 800BA368 07004014 */  bnez       $v0, .L800BA388
/* AAB6C 800BA36C 21888000 */   addu      $s1, $a0, $zero
/* AAB70 800BA370 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AAB74 800BA374 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AAB78 800BA378 0180043C */  lui        $a0, %hi(D_800125F0)
/* AAB7C 800BA37C F0258424 */  addiu      $a0, $a0, %lo(D_800125F0)
/* AAB80 800BA380 09F84000 */  jalr       $v0
/* AAB84 800BA384 21282002 */   addu      $a1, $s1, $zero
.L800BA388:
/* AAB88 800BA388 0A00028E */  lw         $v0, 0xA($s0)
/* AAB8C 800BA38C 0A0011AE */  sw         $s1, 0xA($s0)
/* AAB90 800BA390 1800BF8F */  lw         $ra, 0x18($sp)
/* AAB94 800BA394 1400B18F */  lw         $s1, 0x14($sp)
/* AAB98 800BA398 1000B08F */  lw         $s0, 0x10($sp)
/* AAB9C 800BA39C 0800E003 */  jr         $ra
/* AABA0 800BA3A0 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BA344, . - func_800BA344
