.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_AddInstanceToInstanceList
/* 584A0 80067CA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 584A4 80067CA4 1800B2AF */  sw         $s2, 0x18($sp)
/* 584A8 80067CA8 21908000 */  addu       $s2, $a0, $zero
/* 584AC 80067CAC 1400B1AF */  sw         $s1, 0x14($sp)
/* 584B0 80067CB0 21880000 */  addu       $s1, $zero, $zero
/* 584B4 80067CB4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 584B8 80067CB8 1000B0AF */  sw         $s0, 0x10($sp)
.L80067CBC:
/* 584BC 80067CBC 80191100 */  sll        $v1, $s1, 6
/* 584C0 80067CC0 3CC78227 */  addiu      $v0, $gp, %gp_rel(StreamTracker)
/* 584C4 80067CC4 21206200 */  addu       $a0, $v1, $v0
/* 584C8 80067CC8 04008384 */  lh         $v1, 0x4($a0)
/* 584CC 80067CCC 02000224 */  addiu      $v0, $zero, 0x2
/* 584D0 80067CD0 24006214 */  bne        $v1, $v0, .L80067D64
/* 584D4 80067CD4 00000000 */   nop
/* 584D8 80067CD8 0800908C */  lw         $s0, 0x8($a0)
/* 584DC 80067CDC 00000000 */  nop
/* 584E0 80067CE0 DC00048E */  lw         $a0, 0xDC($s0)
/* 584E4 80067CE4 00000000 */  nop
/* 584E8 80067CE8 03008010 */  beqz       $a0, .L80067CF8
/* 584EC 80067CEC 00000000 */   nop
/* 584F0 80067CF0 FF9E010C */  jal        EVENT_UpdatePuzzleWithInstance
/* 584F4 80067CF4 21284002 */   addu      $a1, $s2, $zero
.L80067CF8:
/* 584F8 80067CF8 0000038E */  lw         $v1, 0x0($s0)
/* 584FC 80067CFC 00000000 */  nop
/* 58500 80067D00 4400628C */  lw         $v0, 0x44($v1)
/* 58504 80067D04 00000000 */  nop
/* 58508 80067D08 16004018 */  blez       $v0, .L80067D64
/* 5850C 80067D0C 21280000 */   addu      $a1, $zero, $zero
/* 58510 80067D10 2130A000 */  addu       $a2, $a1, $zero
.L80067D14:
/* 58514 80067D14 4800628C */  lw         $v0, 0x48($v1)
/* 58518 80067D18 00000000 */  nop
/* 5851C 80067D1C 21204600 */  addu       $a0, $v0, $a2
/* 58520 80067D20 1A008284 */  lh         $v0, 0x1A($a0)
/* 58524 80067D24 00000000 */  nop
/* 58528 80067D28 07004004 */  bltz       $v0, .L80067D48
/* 5852C 80067D2C 00000000 */   nop
/* 58530 80067D30 1C00838C */  lw         $v1, 0x1C($a0)
/* 58534 80067D34 3C00428E */  lw         $v0, 0x3C($s2)
/* 58538 80067D38 00000000 */  nop
/* 5853C 80067D3C 02006214 */  bne        $v1, $v0, .L80067D48
/* 58540 80067D40 00000000 */   nop
/* 58544 80067D44 200092AC */  sw         $s2, 0x20($a0)
.L80067D48:
/* 58548 80067D48 0000038E */  lw         $v1, 0x0($s0)
/* 5854C 80067D4C 00000000 */  nop
/* 58550 80067D50 4400628C */  lw         $v0, 0x44($v1)
/* 58554 80067D54 0100A524 */  addiu      $a1, $a1, 0x1
/* 58558 80067D58 2A10A200 */  slt        $v0, $a1, $v0
/* 5855C 80067D5C EDFF4014 */  bnez       $v0, .L80067D14
/* 58560 80067D60 2400C624 */   addiu     $a2, $a2, 0x24
.L80067D64:
/* 58564 80067D64 01003126 */  addiu      $s1, $s1, 0x1
/* 58568 80067D68 1000222A */  slti       $v0, $s1, 0x10
/* 5856C 80067D6C D3FF4014 */  bnez       $v0, .L80067CBC
/* 58570 80067D70 00000000 */   nop
/* 58574 80067D74 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 58578 80067D78 1800B28F */  lw         $s2, 0x18($sp)
/* 5857C 80067D7C 1400B18F */  lw         $s1, 0x14($sp)
/* 58580 80067D80 1000B08F */  lw         $s0, 0x10($sp)
/* 58584 80067D84 0800E003 */  jr         $ra
/* 58588 80067D88 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_AddInstanceToInstanceList, . - EVENT_AddInstanceToInstanceList
