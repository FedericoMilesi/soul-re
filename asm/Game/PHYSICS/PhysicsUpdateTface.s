.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysicsUpdateTface
/* 66D18 80076518 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 66D1C 8007651C 5000B0AF */  sw         $s0, 0x50($sp)
/* 66D20 80076520 21808000 */  addu       $s0, $a0, $zero
/* 66D24 80076524 4000A227 */  addiu      $v0, $sp, 0x40
/* 66D28 80076528 2800A2AF */  sw         $v0, 0x28($sp)
/* 66D2C 8007652C 4800A227 */  addiu      $v0, $sp, 0x48
/* 66D30 80076530 5400BFAF */  sw         $ra, 0x54($sp)
/* 66D34 80076534 2400A2AF */  sw         $v0, 0x24($sp)
/* 66D38 80076538 5C000296 */  lhu        $v0, 0x5C($s0)
/* 66D3C 8007653C 00000000 */  nop
/* 66D40 80076540 4800A2A7 */  sh         $v0, 0x48($sp)
/* 66D44 80076544 4000A2A7 */  sh         $v0, 0x40($sp)
/* 66D48 80076548 5E000296 */  lhu        $v0, 0x5E($s0)
/* 66D4C 8007654C 00000000 */  nop
/* 66D50 80076550 4A00A2A7 */  sh         $v0, 0x4A($sp)
/* 66D54 80076554 4200A2A7 */  sh         $v0, 0x42($sp)
/* 66D58 80076558 60000396 */  lhu        $v1, 0x60($s0)
/* 66D5C 8007655C 00000000 */  nop
/* 66D60 80076560 4C00A3A7 */  sh         $v1, 0x4C($sp)
/* 66D64 80076564 4400A3A7 */  sh         $v1, 0x44($sp)
/* 66D68 80076568 0000A294 */  lhu        $v0, 0x0($a1)
/* 66D6C 8007656C 00000000 */  nop
/* 66D70 80076570 21106200 */  addu       $v0, $v1, $v0
/* 66D74 80076574 4400A2A7 */  sh         $v0, 0x44($sp)
/* 66D78 80076578 0200A294 */  lhu        $v0, 0x2($a1)
/* 66D7C 8007657C 1000A527 */  addiu      $a1, $sp, 0x10
/* 66D80 80076580 23186200 */  subu       $v1, $v1, $v0
/* 66D84 80076584 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 66D88 80076588 4C00A3A7 */   sh        $v1, 0x4C($sp)
/* 66D8C 8007658C 1000A387 */  lh         $v1, 0x10($sp)
/* 66D90 80076590 03000224 */  addiu      $v0, $zero, 0x3
/* 66D94 80076594 12006214 */  bne        $v1, $v0, .L800765E0
/* 66D98 80076598 00000000 */   nop
/* 66D9C 8007659C B400038E */  lw         $v1, 0xB4($s0)
/* 66DA0 800765A0 1400A28F */  lw         $v0, 0x14($sp)
/* 66DA4 800765A4 00000000 */  nop
/* 66DA8 800765A8 0B006210 */  beq        $v1, $v0, .L800765D8
/* 66DAC 800765AC 00000000 */   nop
/* 66DB0 800765B0 B80003AE */  sw         $v1, 0xB8($s0)
/* 66DB4 800765B4 1400A28F */  lw         $v0, 0x14($sp)
/* 66DB8 800765B8 00000000 */  nop
/* 66DBC 800765BC B40002AE */  sw         $v0, 0xB4($s0)
/* 66DC0 800765C0 1800A28F */  lw         $v0, 0x18($sp)
/* 66DC4 800765C4 00000000 */  nop
/* 66DC8 800765C8 BC0002AE */  sw         $v0, 0xBC($s0)
/* 66DCC 800765CC 1200A287 */  lh         $v0, 0x12($sp)
/* 66DD0 800765D0 00000000 */  nop
/* 66DD4 800765D4 C40002AE */  sw         $v0, 0xC4($s0)
.L800765D8:
/* 66DD8 800765D8 81D90108 */  j          .L80076604
/* 66DDC 800765DC 01000224 */   addiu     $v0, $zero, 0x1
.L800765E0:
/* 66DE0 800765E0 B400028E */  lw         $v0, 0xB4($s0)
/* 66DE4 800765E4 00000000 */  nop
/* 66DE8 800765E8 05004010 */  beqz       $v0, .L80076600
/* 66DEC 800765EC 00000000 */   nop
/* 66DF0 800765F0 B80002AE */  sw         $v0, 0xB8($s0)
/* 66DF4 800765F4 B40000AE */  sw         $zero, 0xB4($s0)
/* 66DF8 800765F8 BC0000AE */  sw         $zero, 0xBC($s0)
/* 66DFC 800765FC C40000AE */  sw         $zero, 0xC4($s0)
.L80076600:
/* 66E00 80076600 21100000 */  addu       $v0, $zero, $zero
.L80076604:
/* 66E04 80076604 5400BF8F */  lw         $ra, 0x54($sp)
/* 66E08 80076608 5000B08F */  lw         $s0, 0x50($sp)
/* 66E0C 8007660C 0800E003 */  jr         $ra
/* 66E10 80076610 5800BD27 */   addiu     $sp, $sp, 0x58
.size PhysicsUpdateTface, . - PhysicsUpdateTface
