.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONAPI_AddToGenerator
/* 6FCCC 8007F4CC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6FCD0 8007F4D0 1800B2AF */  sw         $s2, 0x18($sp)
/* 6FCD4 8007F4D4 21908000 */  addu       $s2, $a0, $zero
/* 6FCD8 8007F4D8 40A8848F */  lw         $a0, %gp_rel(GlobalSave)($gp)
/* 6FCDC 8007F4DC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6FCE0 8007F4E0 1400B1AF */  sw         $s1, 0x14($sp)
/* 6FCE4 8007F4E4 1000B0AF */  sw         $s0, 0x10($sp)
/* 6FCE8 8007F4E8 0E009080 */  lb         $s0, 0xE($a0)
/* 6FCEC 8007F4EC 0E008390 */  lbu        $v1, 0xE($a0)
/* 6FCF0 8007F4F0 0900022A */  slti       $v0, $s0, 0x9
/* 6FCF4 8007F4F4 17004010 */  beqz       $v0, .L8007F554
/* 6FCF8 8007F4F8 01006224 */   addiu     $v0, $v1, 0x1
/* 6FCFC 8007F4FC C0801000 */  sll        $s0, $s0, 3
/* 6FD00 8007F500 10001026 */  addiu      $s0, $s0, 0x10
/* 6FD04 8007F504 6C01518E */  lw         $s1, 0x16C($s2)
/* 6FD08 8007F508 21809000 */  addu       $s0, $a0, $s0
/* 6FD0C 8007F50C 0E0082A0 */  sb         $v0, 0xE($a0)
/* 6FD10 8007F510 9006020C */  jal        MON_GetTime
/* 6FD14 8007F514 21204002 */   addu      $a0, $s2, $zero
/* 6FD18 8007F518 4A012486 */  lh         $a0, 0x14A($s1)
/* 6FD1C 8007F51C 00000000 */  nop
/* 6FD20 8007F520 40190400 */  sll        $v1, $a0, 5
/* 6FD24 8007F524 23186400 */  subu       $v1, $v1, $a0
/* 6FD28 8007F528 80180300 */  sll        $v1, $v1, 2
/* 6FD2C 8007F52C 21186400 */  addu       $v1, $v1, $a0
/* 6FD30 8007F530 C0180300 */  sll        $v1, $v1, 3
/* 6FD34 8007F534 21104300 */  addu       $v0, $v0, $v1
/* 6FD38 8007F538 000002AE */  sw         $v0, 0x0($s0)
/* 6FD3C 8007F53C 3C004296 */  lhu        $v0, 0x3C($s2)
/* 6FD40 8007F540 00000000 */  nop
/* 6FD44 8007F544 040002A6 */  sh         $v0, 0x4($s0)
/* 6FD48 8007F548 34004296 */  lhu        $v0, 0x34($s2)
/* 6FD4C 8007F54C 00000000 */  nop
/* 6FD50 8007F550 060002A6 */  sh         $v0, 0x6($s0)
.L8007F554:
/* 6FD54 8007F554 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6FD58 8007F558 1800B28F */  lw         $s2, 0x18($sp)
/* 6FD5C 8007F55C 1400B18F */  lw         $s1, 0x14($sp)
/* 6FD60 8007F560 1000B08F */  lw         $s0, 0x10($sp)
/* 6FD64 8007F564 0800E003 */  jr         $ra
/* 6FD68 8007F568 2000BD27 */   addiu     $sp, $sp, 0x20
.size MONAPI_AddToGenerator, . - MONAPI_AddToGenerator
