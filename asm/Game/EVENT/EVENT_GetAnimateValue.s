.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetAnimateValue
/* 57D48 80067548 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 57D4C 8006754C 1000BFAF */  sw         $ra, 0x10($sp)
/* 57D50 80067550 0400828C */  lw         $v0, 0x4($a0)
/* 57D54 80067554 0000848C */  lw         $a0, 0x0($a0)
/* 57D58 80067558 01004324 */  addiu      $v1, $v0, 0x1
/* 57D5C 8006755C 2B00622C */  sltiu      $v0, $v1, 0x2B
/* 57D60 80067560 13004010 */  beqz       $v0, .L800675B0
/* 57D64 80067564 21280000 */   addu      $a1, $zero, $zero
/* 57D68 80067568 0180023C */  lui        $v0, %hi(jtbl_80011AD0)
/* 57D6C 8006756C D01A4224 */  addiu      $v0, $v0, %lo(jtbl_80011AD0)
/* 57D70 80067570 80180300 */  sll        $v1, $v1, 2
/* 57D74 80067574 21186200 */  addu       $v1, $v1, $v0
/* 57D78 80067578 0000628C */  lw         $v0, 0x0($v1)
/* 57D7C 8006757C 00000000 */  nop
/* 57D80 80067580 08004000 */  jr         $v0
/* 57D84 80067584 00000000 */   nop
jlabel .L80067588
/* 57D88 80067588 6C9D0108 */  j          .L800675B0
/* 57D8C 8006758C 01000524 */   addiu     $a1, $zero, 0x1
jlabel .L80067590
/* 57D90 80067590 6C9D0108 */  j          .L800675B0
/* 57D94 80067594 21280000 */   addu      $a1, $zero, $zero
jlabel .L80067598
/* 57D98 80067598 699D0108 */  j          .L800675A4
/* 57D9C 8006759C 12000524 */   addiu     $a1, $zero, 0x12
jlabel .L800675A0
/* 57DA0 800675A0 11000524 */  addiu      $a1, $zero, 0x11
.L800675A4:
/* 57DA4 800675A4 92D1000C */  jal        INSTANCE_Query
/* 57DA8 800675A8 00000000 */   nop
/* 57DAC 800675AC 21284000 */  addu       $a1, $v0, $zero
jlabel .L800675B0
/* 57DB0 800675B0 1000BF8F */  lw         $ra, 0x10($sp)
/* 57DB4 800675B4 2110A000 */  addu       $v0, $a1, $zero
/* 57DB8 800675B8 0800E003 */  jr         $ra
/* 57DBC 800675BC 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_GetAnimateValue, . - EVENT_GetAnimateValue
