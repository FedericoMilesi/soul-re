.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_FlatQuad
/* 1B414 8002AC14 2400A98F */  lw         $t1, 0x24($sp)
/* 1B418 8002AC18 1000A38F */  lw         $v1, 0x10($sp)
/* 1B41C 8002AC1C 1400AA8F */  lw         $t2, 0x14($sp)
/* 1B420 8002AC20 1800AB8F */  lw         $t3, 0x18($sp)
/* 1B424 8002AC24 1C00AC8F */  lw         $t4, 0x1C($sp)
/* 1B428 8002AC28 2000AD8F */  lw         $t5, 0x20($sp)
/* 1B42C 8002AC2C 2800AE8F */  lw         $t6, 0x28($sp)
/* 1B430 8002AC30 0800228D */  lw         $v0, 0x8($t1)
/* 1B434 8002AC34 0400288D */  lw         $t0, 0x4($t1)
/* 1B438 8002AC38 D0FF4224 */  addiu      $v0, $v0, -0x30
/* 1B43C 8002AC3C 2B100201 */  sltu       $v0, $t0, $v0
/* 1B440 8002AC40 1C004010 */  beqz       $v0, .L8002ACB4
/* 1B444 8002AC44 00000000 */   nop
/* 1B448 8002AC48 0000828C */  lw         $v0, 0x0($a0)
/* 1B44C 8002AC4C FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 1B450 8002AC50 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 1B454 8002AC54 080005A5 */  sh         $a1, 0x8($t0)
/* 1B458 8002AC58 0A0006A5 */  sh         $a2, 0xA($t0)
/* 1B45C 8002AC5C 0C0007A5 */  sh         $a3, 0xC($t0)
/* 1B460 8002AC60 0E0003A5 */  sh         $v1, 0xE($t0)
/* 1B464 8002AC64 10000AA5 */  sh         $t2, 0x10($t0)
/* 1B468 8002AC68 12000BA5 */  sh         $t3, 0x12($t0)
/* 1B46C 8002AC6C 14000CA5 */  sh         $t4, 0x14($t0)
/* 1B470 8002AC70 16000DA5 */  sh         $t5, 0x16($t0)
/* 1B474 8002AC74 040002AD */  sw         $v0, 0x4($t0)
/* 1B478 8002AC78 28000224 */  addiu      $v0, $zero, 0x28
/* 1B47C 8002AC7C 070002A1 */  sb         $v0, 0x7($t0)
/* 1B480 8002AC80 0000C28D */  lw         $v0, 0x0($t6)
/* 1B484 8002AC84 0005033C */  lui        $v1, (0x5000000 >> 16)
/* 1B488 8002AC88 24104400 */  and        $v0, $v0, $a0
/* 1B48C 8002AC8C 25104300 */  or         $v0, $v0, $v1
/* 1B490 8002AC90 24200401 */  and        $a0, $t0, $a0
/* 1B494 8002AC94 000002AD */  sw         $v0, 0x0($t0)
/* 1B498 8002AC98 0000C4AD */  sw         $a0, 0x0($t6)
/* 1B49C 8002AC9C 0400228D */  lw         $v0, 0x4($t1)
/* 1B4A0 8002ACA0 0000238D */  lw         $v1, 0x0($t1)
/* 1B4A4 8002ACA4 18004224 */  addiu      $v0, $v0, 0x18
/* 1B4A8 8002ACA8 01006324 */  addiu      $v1, $v1, 0x1
/* 1B4AC 8002ACAC 040022AD */  sw         $v0, 0x4($t1)
/* 1B4B0 8002ACB0 000023AD */  sw         $v1, 0x0($t1)
.L8002ACB4:
/* 1B4B4 8002ACB4 0800E003 */  jr         $ra
/* 1B4B8 8002ACB8 00000000 */   nop
.size DRAW_FlatQuad, . - DRAW_FlatQuad
