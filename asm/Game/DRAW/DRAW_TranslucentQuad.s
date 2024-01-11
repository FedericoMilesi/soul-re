.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_TranslucentQuad
/* 1B4BC 8002ACBC F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 1B4C0 8002ACC0 3800AD8F */  lw         $t5, 0x38($sp)
/* 1B4C4 8002ACC4 1800AE8F */  lw         $t6, 0x18($sp)
/* 1B4C8 8002ACC8 1C00AF8F */  lw         $t7, 0x1C($sp)
/* 1B4CC 8002ACCC 2000B88F */  lw         $t8, 0x20($sp)
/* 1B4D0 8002ACD0 2400B98F */  lw         $t9, 0x24($sp)
/* 1B4D4 8002ACD4 3400A98F */  lw         $t1, 0x34($sp)
/* 1B4D8 8002ACD8 0000B0AF */  sw         $s0, 0x0($sp)
/* 1B4DC 8002ACDC 0400B1AF */  sw         $s1, 0x4($sp)
/* 1B4E0 8002ACE0 3C00B18F */  lw         $s1, 0x3C($sp)
/* 1B4E4 8002ACE4 2800AA97 */  lhu        $t2, 0x28($sp)
/* 1B4E8 8002ACE8 2C00AB97 */  lhu        $t3, 0x2C($sp)
/* 1B4EC 8002ACEC 3000AC97 */  lhu        $t4, 0x30($sp)
/* 1B4F0 8002ACF0 0800A28D */  lw         $v0, 0x8($t5)
/* 1B4F4 8002ACF4 0400A88D */  lw         $t0, 0x4($t5)
/* 1B4F8 8002ACF8 D0FF4224 */  addiu      $v0, $v0, -0x30
/* 1B4FC 8002ACFC 2B100201 */  sltu       $v0, $t0, $v0
/* 1B500 8002AD00 23004010 */  beqz       $v0, .L8002AD90
/* 1B504 8002AD04 21808000 */   addu      $s0, $a0, $zero
/* 1B508 8002AD08 00E1033C */  lui        $v1, (0xE1000208 >> 16)
/* 1B50C 8002AD0C 08026334 */  ori        $v1, $v1, (0xE1000208 & 0xFFFF)
/* 1B510 8002AD10 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 1B514 8002AD14 00140900 */  sll        $v0, $t1, 16
/* 1B518 8002AD18 C3120200 */  sra        $v0, $v0, 11
/* 1B51C 8002AD1C 25104300 */  or         $v0, $v0, $v1
/* 1B520 8002AD20 040002AD */  sw         $v0, 0x4($t0)
/* 1B524 8002AD24 2A000224 */  addiu      $v0, $zero, 0x2A
/* 1B528 8002AD28 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 1B52C 8002AD2C 0B0002A1 */  sb         $v0, 0xB($t0)
/* 1B530 8002AD30 08000AA1 */  sb         $t2, 0x8($t0)
/* 1B534 8002AD34 09000BA1 */  sb         $t3, 0x9($t0)
/* 1B538 8002AD38 0A000CA1 */  sb         $t4, 0xA($t0)
/* 1B53C 8002AD3C 0C0010A5 */  sh         $s0, 0xC($t0)
/* 1B540 8002AD40 0E0005A5 */  sh         $a1, 0xE($t0)
/* 1B544 8002AD44 100006A5 */  sh         $a2, 0x10($t0)
/* 1B548 8002AD48 120007A5 */  sh         $a3, 0x12($t0)
/* 1B54C 8002AD4C 14000EA5 */  sh         $t6, 0x14($t0)
/* 1B550 8002AD50 16000FA5 */  sh         $t7, 0x16($t0)
/* 1B554 8002AD54 180018A5 */  sh         $t8, 0x18($t0)
/* 1B558 8002AD58 1A0019A5 */  sh         $t9, 0x1A($t0)
/* 1B55C 8002AD5C 0000228E */  lw         $v0, 0x0($s1)
/* 1B560 8002AD60 0006033C */  lui        $v1, (0x6000000 >> 16)
/* 1B564 8002AD64 24104400 */  and        $v0, $v0, $a0
/* 1B568 8002AD68 25104300 */  or         $v0, $v0, $v1
/* 1B56C 8002AD6C 24200401 */  and        $a0, $t0, $a0
/* 1B570 8002AD70 000002AD */  sw         $v0, 0x0($t0)
/* 1B574 8002AD74 000024AE */  sw         $a0, 0x0($s1)
/* 1B578 8002AD78 0400A28D */  lw         $v0, 0x4($t5)
/* 1B57C 8002AD7C 0000A38D */  lw         $v1, 0x0($t5)
/* 1B580 8002AD80 1C004224 */  addiu      $v0, $v0, 0x1C
/* 1B584 8002AD84 01006324 */  addiu      $v1, $v1, 0x1
/* 1B588 8002AD88 0400A2AD */  sw         $v0, 0x4($t5)
/* 1B58C 8002AD8C 0000A3AD */  sw         $v1, 0x0($t5)
.L8002AD90:
/* 1B590 8002AD90 0400B18F */  lw         $s1, 0x4($sp)
/* 1B594 8002AD94 0000B08F */  lw         $s0, 0x0($sp)
/* 1B598 8002AD98 0800E003 */  jr         $ra
/* 1B59C 8002AD9C 0800BD27 */   addiu     $sp, $sp, 0x8
.size DRAW_TranslucentQuad, . - DRAW_TranslucentQuad
