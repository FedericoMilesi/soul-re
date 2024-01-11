.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetNoPtCollideInFamily
/* 650D0 800748D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 650D4 800748D4 1400BFAF */  sw         $ra, 0x14($sp)
/* 650D8 800748D8 1000B0AF */  sw         $s0, 0x10($sp)
/* 650DC 800748DC 1400828C */  lw         $v0, 0x14($a0)
/* 650E0 800748E0 4C01908C */  lw         $s0, 0x14C($a0)
/* 650E4 800748E4 40004234 */  ori        $v0, $v0, 0x40
/* 650E8 800748E8 07000012 */  beqz       $s0, .L80074908
/* 650EC 800748EC 140082AC */   sw        $v0, 0x14($a0)
.L800748F0:
/* 650F0 800748F0 34D2010C */  jal        SetNoPtCollideInFamily
/* 650F4 800748F4 21200002 */   addu      $a0, $s0, $zero
/* 650F8 800748F8 5001108E */  lw         $s0, 0x150($s0)
/* 650FC 800748FC 00000000 */  nop
/* 65100 80074900 FBFF0016 */  bnez       $s0, .L800748F0
/* 65104 80074904 00000000 */   nop
.L80074908:
/* 65108 80074908 1400BF8F */  lw         $ra, 0x14($sp)
/* 6510C 8007490C 1000B08F */  lw         $s0, 0x10($sp)
/* 65110 80074910 0800E003 */  jr         $ra
/* 65114 80074914 1800BD27 */   addiu     $sp, $sp, 0x18
.size SetNoPtCollideInFamily, . - SetNoPtCollideInFamily
