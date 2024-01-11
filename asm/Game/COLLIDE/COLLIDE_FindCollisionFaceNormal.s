.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_FindCollisionFaceNormal
/* 154C4 80024CC4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 154C8 80024CC8 2000B2AF */  sw         $s2, 0x20($sp)
/* 154CC 80024CCC 2190A000 */  addu       $s2, $a1, $zero
/* 154D0 80024CD0 2400BFAF */  sw         $ra, 0x24($sp)
/* 154D4 80024CD4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 154D8 80024CD8 1800B0AF */  sw         $s0, 0x18($sp)
/* 154DC 80024CDC 07008390 */  lbu        $v1, 0x7($a0)
/* 154E0 80024CE0 01000224 */  addiu      $v0, $zero, 0x1
/* 154E4 80024CE4 3F006210 */  beq        $v1, $v0, .L80024DE4
/* 154E8 80024CE8 21300000 */   addu      $a2, $zero, $zero
/* 154EC 80024CEC 03000224 */  addiu      $v0, $zero, 0x3
/* 154F0 80024CF0 1C006214 */  bne        $v1, $v0, .L80024D64
/* 154F4 80024CF4 02000224 */   addiu     $v0, $zero, 0x2
/* 154F8 80024CF8 0C00858C */  lw         $a1, 0xC($a0)
/* 154FC 80024CFC 00000000 */  nop
/* 15500 80024D00 0A00A394 */  lhu        $v1, 0xA($a1)
/* 15504 80024D04 FFFF0234 */  ori        $v0, $zero, 0xFFFF
/* 15508 80024D08 0D006210 */  beq        $v1, $v0, .L80024D40
/* 1550C 80024D0C 00000000 */   nop
/* 15510 80024D10 0000828C */  lw         $v0, 0x0($a0)
/* 15514 80024D14 00000000 */  nop
/* 15518 80024D18 0000428C */  lw         $v0, 0x0($v0)
/* 1551C 80024D1C 00000000 */  nop
/* 15520 80024D20 3400428C */  lw         $v0, 0x34($v0)
/* 15524 80024D24 00000000 */  nop
/* 15528 80024D28 21104300 */  addu       $v0, $v0, $v1
/* 1552C 80024D2C 0A004294 */  lhu        $v0, 0xA($v0)
/* 15530 80024D30 00000000 */  nop
/* 15534 80024D34 00204230 */  andi       $v0, $v0, 0x2000
/* 15538 80024D38 2A004014 */  bnez       $v0, .L80024DE4
/* 1553C 80024D3C 00000000 */   nop
.L80024D40:
/* 15540 80024D40 0000828C */  lw         $v0, 0x0($a0)
/* 15544 80024D44 00000000 */  nop
/* 15548 80024D48 0000428C */  lw         $v0, 0x0($v0)
/* 1554C 80024D4C 0800A484 */  lh         $a0, 0x8($a1)
/* 15550 80024D50 2400458C */  lw         $a1, 0x24($v0)
/* 15554 80024D54 C27A000C */  jal        COLLIDE_GetNormal
/* 15558 80024D58 21304002 */   addu      $a2, $s2, $zero
/* 1555C 80024D5C 79930008 */  j          .L80024DE4
/* 15560 80024D60 01000624 */   addiu     $a2, $zero, 0x1
.L80024D64:
/* 15564 80024D64 13006214 */  bne        $v1, $v0, .L80024DB4
/* 15568 80024D68 21100000 */   addu      $v0, $zero, $zero
/* 1556C 80024D6C 0C00858C */  lw         $a1, 0xC($a0)
/* 15570 80024D70 10004014 */  bnez       $v0, .L80024DB4
/* 15574 80024D74 1000B027 */   addiu     $s0, $sp, 0x10
/* 15578 80024D78 1400918C */  lw         $s1, 0x14($a0)
/* 1557C 80024D7C 00000000 */  nop
/* 15580 80024D80 1C00238E */  lw         $v1, 0x1C($s1)
/* 15584 80024D84 26012286 */  lh         $v0, 0x126($s1)
/* 15588 80024D88 0C00638C */  lw         $v1, 0xC($v1)
/* 1558C 80024D8C 80100200 */  sll        $v0, $v0, 2
/* 15590 80024D90 21104300 */  addu       $v0, $v0, $v1
/* 15594 80024D94 0000428C */  lw         $v0, 0x0($v0)
/* 15598 80024D98 0800A484 */  lh         $a0, 0x8($a1)
/* 1559C 80024D9C 0C00458C */  lw         $a1, 0xC($v0)
/* 155A0 80024DA0 C27A000C */  jal        COLLIDE_GetNormal
/* 155A4 80024DA4 21300002 */   addu      $a2, $s0, $zero
/* 155A8 80024DA8 4000248E */  lw         $a0, 0x40($s1)
/* 155AC 80024DAC 76930008 */  j          .L80024DD8
/* 155B0 80024DB0 21280002 */   addu      $a1, $s0, $zero
.L80024DB4:
/* 155B4 80024DB4 0400828C */  lw         $v0, 0x4($a0)
/* 155B8 80024DB8 FFFF033C */  lui        $v1, (0xFFFF0000 >> 16)
/* 155BC 80024DBC 24104300 */  and        $v0, $v0, $v1
/* 155C0 80024DC0 0105033C */  lui        $v1, (0x5010000 >> 16)
/* 155C4 80024DC4 07004314 */  bne        $v0, $v1, .L80024DE4
/* 155C8 80024DC8 18008524 */   addiu     $a1, $a0, 0x18
/* 155CC 80024DCC 1400828C */  lw         $v0, 0x14($a0)
/* 155D0 80024DD0 00000000 */  nop
/* 155D4 80024DD4 4000448C */  lw         $a0, 0x40($v0)
.L80024DD8:
/* 155D8 80024DD8 0EF3020C */  jal        func_800BCC38
/* 155DC 80024DDC 21304002 */   addu      $a2, $s2, $zero
/* 155E0 80024DE0 01000624 */  addiu      $a2, $zero, 0x1
.L80024DE4:
/* 155E4 80024DE4 2400BF8F */  lw         $ra, 0x24($sp)
/* 155E8 80024DE8 2000B28F */  lw         $s2, 0x20($sp)
/* 155EC 80024DEC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 155F0 80024DF0 1800B08F */  lw         $s0, 0x18($sp)
/* 155F4 80024DF4 2110C000 */  addu       $v0, $a2, $zero
/* 155F8 80024DF8 0800E003 */  jr         $ra
/* 155FC 80024DFC 2800BD27 */   addiu     $sp, $sp, 0x28
.size COLLIDE_FindCollisionFaceNormal, . - COLLIDE_FindCollisionFaceNormal
