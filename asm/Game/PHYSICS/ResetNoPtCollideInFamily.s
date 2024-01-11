.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetNoPtCollideInFamily
/* 65118 80074918 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6511C 8007491C BFFF0324 */  addiu      $v1, $zero, -0x41
/* 65120 80074920 1400BFAF */  sw         $ra, 0x14($sp)
/* 65124 80074924 1000B0AF */  sw         $s0, 0x10($sp)
/* 65128 80074928 1400828C */  lw         $v0, 0x14($a0)
/* 6512C 8007492C 4C01908C */  lw         $s0, 0x14C($a0)
/* 65130 80074930 24104300 */  and        $v0, $v0, $v1
/* 65134 80074934 07000012 */  beqz       $s0, .L80074954
/* 65138 80074938 140082AC */   sw        $v0, 0x14($a0)
.L8007493C:
/* 6513C 8007493C 46D2010C */  jal        ResetNoPtCollideInFamily
/* 65140 80074940 21200002 */   addu      $a0, $s0, $zero
/* 65144 80074944 5001108E */  lw         $s0, 0x150($s0)
/* 65148 80074948 00000000 */  nop
/* 6514C 8007494C FBFF0016 */  bnez       $s0, .L8007493C
/* 65150 80074950 00000000 */   nop
.L80074954:
/* 65154 80074954 1400BF8F */  lw         $ra, 0x14($sp)
/* 65158 80074958 1000B08F */  lw         $s0, 0x10($sp)
/* 6515C 8007495C 0800E003 */  jr         $ra
/* 65160 80074960 1800BD27 */   addiu     $sp, $sp, 0x18
.size ResetNoPtCollideInFamily, . - ResetNoPtCollideInFamily
