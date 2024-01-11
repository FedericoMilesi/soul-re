.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MISSILE_Find
/* 6E280 8007DA80 4C01868C */  lw         $a2, 0x14C($a0)
/* 6E284 8007DA84 0D80043C */  lui        $a0, %hi(objectAccess)
/* 6E288 8007DA88 0D80033C */  lui        $v1, %hi(MISSILE_objectTable)
/* 6E28C 8007DA8C 0900A290 */  lbu        $v0, 0x9($a1)
/* 6E290 8007DA90 A4C46324 */  addiu      $v1, $v1, %lo(MISSILE_objectTable)
/* 6E294 8007DA94 40100200 */  sll        $v0, $v0, 1
/* 6E298 8007DA98 21104300 */  addu       $v0, $v0, $v1
/* 6E29C 8007DA9C 00004290 */  lbu        $v0, 0x0($v0)
/* 6E2A0 8007DAA0 3CA28424 */  addiu      $a0, $a0, %lo(objectAccess)
/* 6E2A4 8007DAA4 C0100200 */  sll        $v0, $v0, 3
/* 6E2A8 8007DAA8 21104400 */  addu       $v0, $v0, $a0
/* 6E2AC 8007DAAC 0400438C */  lw         $v1, 0x4($v0)
/* 6E2B0 8007DAB0 0E00C010 */  beqz       $a2, .L8007DAEC
/* 6E2B4 8007DAB4 00000000 */   nop
/* 6E2B8 8007DAB8 0600A590 */  lbu        $a1, 0x6($a1)
.L8007DABC:
/* 6E2BC 8007DABC 5401C28C */  lw         $v0, 0x154($a2)
/* 6E2C0 8007DAC0 00000000 */  nop
/* 6E2C4 8007DAC4 05004514 */  bne        $v0, $a1, .L8007DADC
/* 6E2C8 8007DAC8 00000000 */   nop
/* 6E2CC 8007DACC 1C00C28C */  lw         $v0, 0x1C($a2)
/* 6E2D0 8007DAD0 00000000 */  nop
/* 6E2D4 8007DAD4 07004310 */  beq        $v0, $v1, .L8007DAF4
/* 6E2D8 8007DAD8 2110C000 */   addu      $v0, $a2, $zero
.L8007DADC:
/* 6E2DC 8007DADC 5001C68C */  lw         $a2, 0x150($a2)
/* 6E2E0 8007DAE0 00000000 */  nop
/* 6E2E4 8007DAE4 F5FFC014 */  bnez       $a2, .L8007DABC
/* 6E2E8 8007DAE8 00000000 */   nop
.L8007DAEC:
/* 6E2EC 8007DAEC 0800E003 */  jr         $ra
/* 6E2F0 8007DAF0 21100000 */   addu      $v0, $zero, $zero
.L8007DAF4:
/* 6E2F4 8007DAF4 0800E003 */  jr         $ra
/* 6E2F8 8007DAF8 00000000 */   nop
.size MISSILE_Find, . - MISSILE_Find
