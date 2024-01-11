.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PadInfoAct
/* AE4AC 800BDCAC 0D80023C */  lui        $v0, %hi(_padFuncPort2Info)
/* AE4B0 800BDCB0 18E9428C */  lw         $v0, %lo(_padFuncPort2Info)($v0)
/* AE4B4 800BDCB4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AE4B8 800BDCB8 1000B0AF */  sw         $s0, 0x10($sp)
/* AE4BC 800BDCBC 2180A000 */  addu       $s0, $a1, $zero
/* AE4C0 800BDCC0 1400B1AF */  sw         $s1, 0x14($sp)
/* AE4C4 800BDCC4 1800BFAF */  sw         $ra, 0x18($sp)
/* AE4C8 800BDCC8 09F84000 */  jalr       $v0
/* AE4CC 800BDCCC 2188C000 */   addu      $s1, $a2, $zero
/* AE4D0 800BDCD0 04000106 */  bgez       $s0, .L800BDCE4
/* AE4D4 800BDCD4 21184000 */   addu      $v1, $v0, $zero
/* AE4D8 800BDCD8 E9006290 */  lbu        $v0, 0xE9($v1)
/* AE4DC 800BDCDC 5BF70208 */  j          .L800BDD6C
/* AE4E0 800BDCE0 00000000 */   nop
.L800BDCE4:
/* AE4E4 800BDCE4 E9006290 */  lbu        $v0, 0xE9($v1)
/* AE4E8 800BDCE8 00000000 */  nop
/* AE4EC 800BDCEC 2A100202 */  slt        $v0, $s0, $v0
/* AE4F0 800BDCF0 1D004010 */  beqz       $v0, .L800BDD68
/* AE4F4 800BDCF4 80101000 */   sll       $v0, $s0, 2
/* AE4F8 800BDCF8 0400638C */  lw         $v1, 0x4($v1)
/* AE4FC 800BDCFC 21105000 */  addu       $v0, $v0, $s0
/* AE500 800BDD00 FFFF2626 */  addiu      $a2, $s1, -0x1
/* AE504 800BDD04 21186200 */  addu       $v1, $v1, $v0
/* AE508 800BDD08 0500C22C */  sltiu      $v0, $a2, 0x5
/* AE50C 800BDD0C 16004010 */  beqz       $v0, .L800BDD68
/* AE510 800BDD10 80100600 */   sll       $v0, $a2, 2
/* AE514 800BDD14 0180013C */  lui        $at, %hi(jtbl_80012774)
/* AE518 800BDD18 21082200 */  addu       $at, $at, $v0
/* AE51C 800BDD1C 7427228C */  lw         $v0, %lo(jtbl_80012774)($at)
/* AE520 800BDD20 00000000 */  nop
/* AE524 800BDD24 08004000 */  jr         $v0
/* AE528 800BDD28 00000000 */   nop
jlabel .L800BDD2C
/* AE52C 800BDD2C 00006290 */  lbu        $v0, 0x0($v1)
/* AE530 800BDD30 5BF70208 */  j          .L800BDD6C
/* AE534 800BDD34 00000000 */   nop
jlabel .L800BDD38
/* AE538 800BDD38 01006290 */  lbu        $v0, 0x1($v1)
/* AE53C 800BDD3C 5BF70208 */  j          .L800BDD6C
/* AE540 800BDD40 00000000 */   nop
jlabel .L800BDD44
/* AE544 800BDD44 02006290 */  lbu        $v0, 0x2($v1)
/* AE548 800BDD48 5BF70208 */  j          .L800BDD6C
/* AE54C 800BDD4C 00000000 */   nop
jlabel .L800BDD50
/* AE550 800BDD50 03006290 */  lbu        $v0, 0x3($v1)
/* AE554 800BDD54 5BF70208 */  j          .L800BDD6C
/* AE558 800BDD58 00000000 */   nop
jlabel .L800BDD5C
/* AE55C 800BDD5C 04006290 */  lbu        $v0, 0x4($v1)
/* AE560 800BDD60 5BF70208 */  j          .L800BDD6C
/* AE564 800BDD64 00000000 */   nop
.L800BDD68:
/* AE568 800BDD68 21100000 */  addu       $v0, $zero, $zero
.L800BDD6C:
/* AE56C 800BDD6C 1800BF8F */  lw         $ra, 0x18($sp)
/* AE570 800BDD70 1400B18F */  lw         $s1, 0x14($sp)
/* AE574 800BDD74 1000B08F */  lw         $s0, 0x10($sp)
/* AE578 800BDD78 0800E003 */  jr         $ra
/* AE57C 800BDD7C 2000BD27 */   addiu     $sp, $sp, 0x20
.size PadInfoAct, . - PadInfoAct
