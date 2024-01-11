.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StopGlowEffect
/* 3C010 8004B810 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3C014 8004B814 1400B1AF */  sw         $s1, 0x14($sp)
/* 3C018 8004B818 21888000 */  addu       $s1, $a0, $zero
/* 3C01C 8004B81C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3C020 8004B820 1800B2AF */  sw         $s2, 0x18($sp)
/* 3C024 8004B824 16002012 */  beqz       $s1, .L8004B880
/* 3C028 8004B828 1000B0AF */   sw        $s0, 0x10($sp)
/* 3C02C 8004B82C 0500A010 */  beqz       $a1, .L8004B844
/* 3C030 8004B830 40110500 */   sll       $v0, $a1, 5
/* 3C034 8004B834 21104500 */  addu       $v0, $v0, $a1
/* 3C038 8004B838 2A0022A6 */  sh         $v0, 0x2A($s1)
/* 3C03C 8004B83C 202E0108 */  j          .L8004B880
/* 3C040 8004B840 0E0022A6 */   sh        $v0, 0xE($s1)
.L8004B844:
/* 3C044 8004B844 649A848F */  lw         $a0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3C048 8004B848 00000000 */  nop
/* 3C04C 8004B84C 0C008010 */  beqz       $a0, .L8004B880
/* 3C050 8004B850 83001224 */   addiu     $s2, $zero, 0x83
.L8004B854:
/* 3C054 8004B854 0C008290 */  lbu        $v0, 0xC($a0)
/* 3C058 8004B858 0000908C */  lw         $s0, 0x0($a0)
/* 3C05C 8004B85C 05005214 */  bne        $v0, $s2, .L8004B874
/* 3C060 8004B860 00000000 */   nop
/* 3C064 8004B864 03009114 */  bne        $a0, $s1, .L8004B874
/* 3C068 8004B868 00000000 */   nop
/* 3C06C 8004B86C 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3C070 8004B870 00000000 */   nop
.L8004B874:
/* 3C074 8004B874 21200002 */  addu       $a0, $s0, $zero
/* 3C078 8004B878 F6FF8014 */  bnez       $a0, .L8004B854
/* 3C07C 8004B87C 00000000 */   nop
.L8004B880:
/* 3C080 8004B880 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 3C084 8004B884 1800B28F */  lw         $s2, 0x18($sp)
/* 3C088 8004B888 1400B18F */  lw         $s1, 0x14($sp)
/* 3C08C 8004B88C 1000B08F */  lw         $s0, 0x10($sp)
/* 3C090 8004B890 0800E003 */  jr         $ra
/* 3C094 8004B894 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_StopGlowEffect, . - FX_StopGlowEffect
