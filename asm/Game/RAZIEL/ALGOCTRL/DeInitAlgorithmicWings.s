.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeInitAlgorithmicWings
/* 924EC 800A1CEC 7CA7828F */  lw         $v0, %gp_rel(AlgoControlFlag)($gp)
/* 924F0 800A1CF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 924F4 800A1CF4 1400B1AF */  sw         $s1, 0x14($sp)
/* 924F8 800A1CF8 21888000 */  addu       $s1, $a0, $zero
/* 924FC 800A1CFC 1800BFAF */  sw         $ra, 0x18($sp)
/* 92500 800A1D00 01004230 */  andi       $v0, $v0, 0x1
/* 92504 800A1D04 18004010 */  beqz       $v0, .L800A1D68
/* 92508 800A1D08 1000B0AF */   sw        $s0, 0x10($sp)
/* 9250C 800A1D0C 33001024 */  addiu      $s0, $zero, 0x33
/* 92510 800A1D10 C8012426 */  addiu      $a0, $s1, 0x1C8
.L800A1D14:
/* 92514 800A1D14 FF000532 */  andi       $a1, $s0, 0xFF
/* 92518 800A1D18 8D41020C */  jal        G2Anim_DisableController
/* 9251C 800A1D1C 08000624 */   addiu     $a2, $zero, 0x8
/* 92520 800A1D20 01001026 */  addiu      $s0, $s0, 0x1
/* 92524 800A1D24 FF000232 */  andi       $v0, $s0, 0xFF
/* 92528 800A1D28 3600422C */  sltiu      $v0, $v0, 0x36
/* 9252C 800A1D2C F9FF4014 */  bnez       $v0, .L800A1D14
/* 92530 800A1D30 C8012426 */   addiu     $a0, $s1, 0x1C8
/* 92534 800A1D34 3B001024 */  addiu      $s0, $zero, 0x3B
.L800A1D38:
/* 92538 800A1D38 FF000532 */  andi       $a1, $s0, 0xFF
/* 9253C 800A1D3C 8D41020C */  jal        G2Anim_DisableController
/* 92540 800A1D40 08000624 */   addiu     $a2, $zero, 0x8
/* 92544 800A1D44 01001026 */  addiu      $s0, $s0, 0x1
/* 92548 800A1D48 FF000232 */  andi       $v0, $s0, 0xFF
/* 9254C 800A1D4C 3E00422C */  sltiu      $v0, $v0, 0x3E
/* 92550 800A1D50 F9FF4014 */  bnez       $v0, .L800A1D38
/* 92554 800A1D54 C8012426 */   addiu     $a0, $s1, 0x1C8
/* 92558 800A1D58 7CA7828F */  lw         $v0, %gp_rel(AlgoControlFlag)($gp)
/* 9255C 800A1D5C FEFF0324 */  addiu      $v1, $zero, -0x2
/* 92560 800A1D60 24104300 */  and        $v0, $v0, $v1
/* 92564 800A1D64 7CA782AF */  sw         $v0, %gp_rel(AlgoControlFlag)($gp)
.L800A1D68:
/* 92568 800A1D68 1800BF8F */  lw         $ra, 0x18($sp)
/* 9256C 800A1D6C 1400B18F */  lw         $s1, 0x14($sp)
/* 92570 800A1D70 1000B08F */  lw         $s0, 0x10($sp)
/* 92574 800A1D74 0800E003 */  jr         $ra
/* 92578 800A1D78 2000BD27 */   addiu     $sp, $sp, 0x20
.size DeInitAlgorithmicWings, . - DeInitAlgorithmicWings
