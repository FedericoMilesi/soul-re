.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawSync
/* AAC3C 800BA43C 0D80023C */  lui        $v0, %hi(GEnv + 0x2)
/* AAC40 800BA440 0EDA4290 */  lbu        $v0, %lo(GEnv + 0x2)($v0)
/* AAC44 800BA444 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AAC48 800BA448 1000B0AF */  sw         $s0, 0x10($sp)
/* AAC4C 800BA44C 21808000 */  addu       $s0, $a0, $zero
/* AAC50 800BA450 0200422C */  sltiu      $v0, $v0, 0x2
/* AAC54 800BA454 08004014 */  bnez       $v0, .L800BA478
/* AAC58 800BA458 1400BFAF */   sw        $ra, 0x14($sp)
/* AAC5C 800BA45C 0180043C */  lui        $a0, %hi(D_80012620)
/* AAC60 800BA460 20268424 */  addiu      $a0, $a0, %lo(D_80012620)
/* AAC64 800BA464 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AAC68 800BA468 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AAC6C 800BA46C 00000000 */  nop
/* AAC70 800BA470 09F84000 */  jalr       $v0
/* AAC74 800BA474 21280002 */   addu      $a1, $s0, $zero
.L800BA478:
/* AAC78 800BA478 0D80023C */  lui        $v0, %hi(D_800CDA04)
/* AAC7C 800BA47C 04DA428C */  lw         $v0, %lo(D_800CDA04)($v0)
/* AAC80 800BA480 00000000 */  nop
/* AAC84 800BA484 3C00428C */  lw         $v0, 0x3C($v0)
/* AAC88 800BA488 00000000 */  nop
/* AAC8C 800BA48C 09F84000 */  jalr       $v0
/* AAC90 800BA490 21200002 */   addu      $a0, $s0, $zero
/* AAC94 800BA494 1400BF8F */  lw         $ra, 0x14($sp)
/* AAC98 800BA498 1000B08F */  lw         $s0, 0x10($sp)
/* AAC9C 800BA49C 0800E003 */  jr         $ra
/* AACA0 800BA4A0 1800BD27 */   addiu     $sp, $sp, 0x18
.size DrawSync, . - DrawSync
