.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetGraphDebug
/* AAAE8 800BA2E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AAAEC 800BA2EC 0D80033C */  lui        $v1, %hi(GEnv + 0x2)
/* AAAF0 800BA2F0 0EDA6324 */  addiu      $v1, $v1, %lo(GEnv + 0x2)
/* AAAF4 800BA2F4 1400BFAF */  sw         $ra, 0x14($sp)
/* AAAF8 800BA2F8 1000B0AF */  sw         $s0, 0x10($sp)
/* AAAFC 800BA2FC 00007090 */  lbu        $s0, 0x0($v1)
/* AAB00 800BA300 000064A0 */  sb         $a0, 0x0($v1)
/* AAB04 800BA304 FF008430 */  andi       $a0, $a0, 0xFF
/* AAB08 800BA308 0A008010 */  beqz       $a0, .L800BA334
/* AAB0C 800BA30C 21100002 */   addu      $v0, $s0, $zero
/* AAB10 800BA310 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AAB14 800BA314 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AAB18 800BA318 00006590 */  lbu        $a1, 0x0($v1)
/* AAB1C 800BA31C FEFF6690 */  lbu        $a2, -0x2($v1)
/* AAB20 800BA320 01006790 */  lbu        $a3, 0x1($v1)
/* AAB24 800BA324 0180043C */  lui        $a0, %hi(D_800125B0)
/* AAB28 800BA328 09F84000 */  jalr       $v0
/* AAB2C 800BA32C B0258424 */   addiu     $a0, $a0, %lo(D_800125B0)
/* AAB30 800BA330 21100002 */  addu       $v0, $s0, $zero
.L800BA334:
/* AAB34 800BA334 1400BF8F */  lw         $ra, 0x14($sp)
/* AAB38 800BA338 1000B08F */  lw         $s0, 0x10($sp)
/* AAB3C 800BA33C 0800E003 */  jr         $ra
/* AAB40 800BA340 1800BD27 */   addiu     $sp, $sp, 0x18
.size SetGraphDebug, . - SetGraphDebug
