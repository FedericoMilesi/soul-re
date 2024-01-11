.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SphereWorldPos
/* 73DA4 800835A4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 73DA8 800835A8 1400B1AF */  sw         $s1, 0x14($sp)
/* 73DAC 800835AC 21888000 */  addu       $s1, $a0, $zero
/* 73DB0 800835B0 1000B0AF */  sw         $s0, 0x10($sp)
/* 73DB4 800835B4 2180C000 */  addu       $s0, $a2, $zero
/* 73DB8 800835B8 1800BFAF */  sw         $ra, 0x18($sp)
/* 73DBC 800835BC 0EF3020C */  jal        func_800BCC38
/* 73DC0 800835C0 0800A524 */   addiu     $a1, $a1, 0x8
/* 73DC4 800835C4 00000296 */  lhu        $v0, 0x0($s0)
/* 73DC8 800835C8 14002396 */  lhu        $v1, 0x14($s1)
/* 73DCC 800835CC 00000000 */  nop
/* 73DD0 800835D0 21104300 */  addu       $v0, $v0, $v1
/* 73DD4 800835D4 000002A6 */  sh         $v0, 0x0($s0)
/* 73DD8 800835D8 02000296 */  lhu        $v0, 0x2($s0)
/* 73DDC 800835DC 18002396 */  lhu        $v1, 0x18($s1)
/* 73DE0 800835E0 00000000 */  nop
/* 73DE4 800835E4 21104300 */  addu       $v0, $v0, $v1
/* 73DE8 800835E8 020002A6 */  sh         $v0, 0x2($s0)
/* 73DEC 800835EC 04000296 */  lhu        $v0, 0x4($s0)
/* 73DF0 800835F0 1C002396 */  lhu        $v1, 0x1C($s1)
/* 73DF4 800835F4 00000000 */  nop
/* 73DF8 800835F8 21104300 */  addu       $v0, $v0, $v1
/* 73DFC 800835FC 040002A6 */  sh         $v0, 0x4($s0)
/* 73E00 80083600 1800BF8F */  lw         $ra, 0x18($sp)
/* 73E04 80083604 1400B18F */  lw         $s1, 0x14($sp)
/* 73E08 80083608 1000B08F */  lw         $s0, 0x10($sp)
/* 73E0C 8008360C 0800E003 */  jr         $ra
/* 73E10 80083610 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_SphereWorldPos, . - MON_SphereWorldPos
