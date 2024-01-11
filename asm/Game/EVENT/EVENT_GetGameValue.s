.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetGameValue
/* 53508 80062D08 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5350C 80062D0C 1000BFAF */  sw         $ra, 0x10($sp)
/* 53510 80062D10 0000848C */  lw         $a0, 0x0($a0)
/* 53514 80062D14 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 53518 80062D18 17008210 */  beq        $a0, $v0, .L80062D78
/* 5351C 80062D1C 21180000 */   addu      $v1, $zero, $zero
/* 53520 80062D20 02000224 */  addiu      $v0, $zero, 0x2
/* 53524 80062D24 1B008214 */  bne        $a0, $v0, .L80062D94
/* 53528 80062D28 00000000 */   nop
/* 5352C 80062D2C BEB7000C */  jal        GAMELOOP_GetTimeOfDay
/* 53530 80062D30 00000000 */   nop
/* 53534 80062D34 21184000 */  addu       $v1, $v0, $zero
/* 53538 80062D38 BC020224 */  addiu      $v0, $zero, 0x2BC
/* 5353C 80062D3C 10006210 */  beq        $v1, $v0, .L80062D80
/* 53540 80062D40 BD026228 */   slti      $v0, $v1, 0x2BD
/* 53544 80062D44 05004010 */  beqz       $v0, .L80062D5C
/* 53548 80062D48 58020224 */   addiu     $v0, $zero, 0x258
/* 5354C 80062D4C 0A006210 */  beq        $v1, $v0, .L80062D78
/* 53550 80062D50 00000000 */   nop
/* 53554 80062D54 658B0108 */  j          .L80062D94
/* 53558 80062D58 00000000 */   nop
.L80062D5C:
/* 5355C 80062D5C 08070224 */  addiu      $v0, $zero, 0x708
/* 53560 80062D60 09006210 */  beq        $v1, $v0, .L80062D88
/* 53564 80062D64 6C070224 */   addiu     $v0, $zero, 0x76C
/* 53568 80062D68 09006210 */  beq        $v1, $v0, .L80062D90
/* 5356C 80062D6C 00000000 */   nop
/* 53570 80062D70 658B0108 */  j          .L80062D94
/* 53574 80062D74 00000000 */   nop
.L80062D78:
/* 53578 80062D78 658B0108 */  j          .L80062D94
/* 5357C 80062D7C 01000324 */   addiu     $v1, $zero, 0x1
.L80062D80:
/* 53580 80062D80 658B0108 */  j          .L80062D94
/* 53584 80062D84 02000324 */   addiu     $v1, $zero, 0x2
.L80062D88:
/* 53588 80062D88 658B0108 */  j          .L80062D94
/* 5358C 80062D8C 03000324 */   addiu     $v1, $zero, 0x3
.L80062D90:
/* 53590 80062D90 04000324 */  addiu      $v1, $zero, 0x4
.L80062D94:
/* 53594 80062D94 1000BF8F */  lw         $ra, 0x10($sp)
/* 53598 80062D98 21106000 */  addu       $v0, $v1, $zero
/* 5359C 80062D9C 0800E003 */  jr         $ra
/* 535A0 80062DA0 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_GetGameValue, . - EVENT_GetGameValue
