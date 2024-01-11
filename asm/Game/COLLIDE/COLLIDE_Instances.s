.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel COLLIDE_Instances
/* 12CE4 800224E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12CE8 800224E8 1400B1AF */  sw         $s1, 0x14($sp)
/* 12CEC 800224EC 21888000 */  addu       $s1, $a0, $zero
/* 12CF0 800224F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 12CF4 800224F4 2180A000 */  addu       $s0, $a1, $zero
/* 12CF8 800224F8 47003012 */  beq        $s1, $s0, .L80022618
/* 12CFC 800224FC 1800BFAF */   sw        $ra, 0x18($sp)
/* 12D00 80022500 25D6000C */  jal        INSTANCE_Linked
/* 12D04 80022504 00000000 */   nop
/* 12D08 80022508 43004014 */  bnez       $v0, .L80022618
/* 12D0C 8002250C 00000000 */   nop
/* 12D10 80022510 5C002586 */  lh         $a1, 0x5C($s1)
/* 12D14 80022514 5C000286 */  lh         $v0, 0x5C($s0)
/* 12D18 80022518 5E002786 */  lh         $a3, 0x5E($s1)
/* 12D1C 8002251C 60002686 */  lh         $a2, 0x60($s1)
/* 12D20 80022520 26012386 */  lh         $v1, 0x126($s1)
/* 12D24 80022524 1C00048E */  lw         $a0, 0x1C($s0)
/* 12D28 80022528 2328A200 */  subu       $a1, $a1, $v0
/* 12D2C 8002252C 5E000286 */  lh         $v0, 0x5E($s0)
/* 12D30 80022530 43280500 */  sra        $a1, $a1, 1
/* 12D34 80022534 2338E200 */  subu       $a3, $a3, $v0
/* 12D38 80022538 60000286 */  lh         $v0, 0x60($s0)
/* 12D3C 8002253C 80180300 */  sll        $v1, $v1, 2
/* 12D40 80022540 2330C200 */  subu       $a2, $a2, $v0
/* 12D44 80022544 1C00228E */  lw         $v0, 0x1C($s1)
/* 12D48 80022548 0C00848C */  lw         $a0, 0xC($a0)
/* 12D4C 8002254C 0C00428C */  lw         $v0, 0xC($v0)
/* 12D50 80022550 43380700 */  sra        $a3, $a3, 1
/* 12D54 80022554 21186200 */  addu       $v1, $v1, $v0
/* 12D58 80022558 26010286 */  lh         $v0, 0x126($s0)
/* 12D5C 8002255C 0000638C */  lw         $v1, 0x0($v1)
/* 12D60 80022560 80100200 */  sll        $v0, $v0, 2
/* 12D64 80022564 21104400 */  addu       $v0, $v0, $a0
/* 12D68 80022568 0000448C */  lw         $a0, 0x0($v0)
/* 12D6C 8002256C 24006284 */  lh         $v0, 0x24($v1)
/* 12D70 80022570 24008384 */  lh         $v1, 0x24($a0)
/* 12D74 80022574 43300600 */  sra        $a2, $a2, 1
/* 12D78 80022578 21104300 */  addu       $v0, $v0, $v1
/* 12D7C 8002257C 43100200 */  sra        $v0, $v0, 1
/* 12D80 80022580 00488548 */  mtc2       $a1, $9 # handwritten instruction
/* 12D84 80022584 00508748 */  mtc2       $a3, $10 # handwritten instruction
/* 12D88 80022588 00588648 */  mtc2       $a2, $11 # handwritten instruction
/* 12D8C 8002258C 00000000 */  nop
/* 12D90 80022590 2804A04A */  SQR        0
/* 12D94 80022594 00C80548 */  mfc2       $a1, $25 # handwritten instruction
/* 12D98 80022598 00D00748 */  mfc2       $a3, $26 # handwritten instruction
/* 12D9C 8002259C 00D80648 */  mfc2       $a2, $27 # handwritten instruction
/* 12DA0 800225A0 2028A700 */  add        $a1, $a1, $a3 # handwritten instruction
/* 12DA4 800225A4 2028A600 */  add        $a1, $a1, $a2 # handwritten instruction
/* 12DA8 800225A8 18004200 */  mult       $v0, $v0
/* 12DAC 800225AC 12400000 */  mflo       $t0
/* 12DB0 800225B0 2B28A800 */  sltu       $a1, $a1, $t0
/* 12DB4 800225B4 1800A010 */  beqz       $a1, .L80022618
/* 12DB8 800225B8 00000000 */   nop
/* 12DBC 800225BC 4000228E */  lw         $v0, 0x40($s1)
/* 12DC0 800225C0 00000000 */  nop
/* 12DC4 800225C4 14004010 */  beqz       $v0, .L80022618
/* 12DC8 800225C8 00000000 */   nop
/* 12DCC 800225CC 4400228E */  lw         $v0, 0x44($s1)
/* 12DD0 800225D0 00000000 */  nop
/* 12DD4 800225D4 10004010 */  beqz       $v0, .L80022618
/* 12DD8 800225D8 00000000 */   nop
/* 12DDC 800225DC 4000028E */  lw         $v0, 0x40($s0)
/* 12DE0 800225E0 00000000 */  nop
/* 12DE4 800225E4 0C004010 */  beqz       $v0, .L80022618
/* 12DE8 800225E8 00000000 */   nop
/* 12DEC 800225EC 4400028E */  lw         $v0, 0x44($s0)
/* 12DF0 800225F0 00000000 */  nop
/* 12DF4 800225F4 08004010 */  beqz       $v0, .L80022618
/* 12DF8 800225F8 21202002 */   addu      $a0, $s1, $zero
/* 12DFC 800225FC 21280002 */  addu       $a1, $s0, $zero
/* 12E00 80022600 E585000C */  jal        COLLIDE_Instance1SpheresToInstance2
/* 12E04 80022604 01000624 */   addiu     $a2, $zero, 0x1
/* 12E08 80022608 21200002 */  addu       $a0, $s0, $zero
/* 12E0C 8002260C 21282002 */  addu       $a1, $s1, $zero
/* 12E10 80022610 E585000C */  jal        COLLIDE_Instance1SpheresToInstance2
/* 12E14 80022614 21300000 */   addu      $a2, $zero, $zero
.L80022618:
/* 12E18 80022618 1800BF8F */  lw         $ra, 0x18($sp)
/* 12E1C 8002261C 1400B18F */  lw         $s1, 0x14($sp)
/* 12E20 80022620 1000B08F */  lw         $s0, 0x10($sp)
/* 12E24 80022624 0800E003 */  jr         $ra
/* 12E28 80022628 2000BD27 */   addiu     $sp, $sp, 0x20
.size COLLIDE_Instances, . - COLLIDE_Instances
