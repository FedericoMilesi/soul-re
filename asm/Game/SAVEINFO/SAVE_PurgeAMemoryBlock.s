.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_PurgeAMemoryBlock
/* A5CA0 800B54A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A5CA4 800B54A4 E0FD848F */  lw         $a0, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A5CA8 800B54A8 E4FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A5CAC 800B54AC 21280000 */  addu       $a1, $zero, $zero
/* A5CB0 800B54B0 2B108200 */  sltu       $v0, $a0, $v0
/* A5CB4 800B54B4 1E004010 */  beqz       $v0, .L800B5530
/* A5CB8 800B54B8 1000BFAF */   sw        $ra, 0x10($sp)
/* A5CBC 800B54BC 01000724 */  addiu      $a3, $zero, 0x1
/* A5CC0 800B54C0 07000624 */  addiu      $a2, $zero, 0x7
.L800B54C4:
/* A5CC4 800B54C4 00008390 */  lbu        $v1, 0x0($a0)
/* A5CC8 800B54C8 00000000 */  nop
/* A5CCC 800B54CC 06006714 */  bne        $v1, $a3, .L800B54E8
/* A5CD0 800B54D0 00000000 */   nop
/* A5CD4 800B54D4 2400828C */  lw         $v0, 0x24($a0)
/* A5CD8 800B54D8 00000000 */  nop
/* A5CDC 800B54DC 00014230 */  andi       $v0, $v0, 0x100
/* A5CE0 800B54E0 08004014 */  bnez       $v0, .L800B5504
/* A5CE4 800B54E4 00000000 */   nop
.L800B54E8:
/* A5CE8 800B54E8 0A006614 */  bne        $v1, $a2, .L800B5514
/* A5CEC 800B54EC 00000000 */   nop
/* A5CF0 800B54F0 1000828C */  lw         $v0, 0x10($a0)
/* A5CF4 800B54F4 00000000 */  nop
/* A5CF8 800B54F8 00014230 */  andi       $v0, $v0, 0x100
/* A5CFC 800B54FC 05004010 */  beqz       $v0, .L800B5514
/* A5D00 800B5500 00000000 */   nop
.L800B5504:
/* A5D04 800B5504 08D8020C */  jal        SAVE_DeleteBlock
/* A5D08 800B5508 00000000 */   nop
/* A5D0C 800B550C 4CD50208 */  j          .L800B5530
/* A5D10 800B5510 01000524 */   addiu     $a1, $zero, 0x1
.L800B5514:
/* A5D14 800B5514 01008290 */  lbu        $v0, 0x1($a0)
/* A5D18 800B5518 E4FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A5D1C 800B551C 80100200 */  sll        $v0, $v0, 2
/* A5D20 800B5520 21208200 */  addu       $a0, $a0, $v0
/* A5D24 800B5524 2B188300 */  sltu       $v1, $a0, $v1
/* A5D28 800B5528 E6FF6014 */  bnez       $v1, .L800B54C4
/* A5D2C 800B552C 00000000 */   nop
.L800B5530:
/* A5D30 800B5530 1000BF8F */  lw         $ra, 0x10($sp)
/* A5D34 800B5534 2110A000 */  addu       $v0, $a1, $zero
/* A5D38 800B5538 0800E003 */  jr         $ra
/* A5D3C 800B553C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_PurgeAMemoryBlock, . - SAVE_PurgeAMemoryBlock
