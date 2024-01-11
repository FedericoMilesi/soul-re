.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_InMorphDoFadeValues
/* 4D044 8005C844 6210033C */  lui        $v1, (0x10624DD3 >> 16)
/* 4D048 8005C848 D0BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4D04C 8005C84C D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
/* 4D050 8005C850 00130200 */  sll        $v0, $v0, 12
/* 4D054 8005C854 18004300 */  mult       $v0, $v1
/* 4D058 8005C858 C3170200 */  sra        $v0, $v0, 31
/* 4D05C 8005C85C 10280000 */  mfhi       $a1
/* 4D060 8005C860 83190500 */  sra        $v1, $a1, 6
/* 4D064 8005C864 23206200 */  subu       $a0, $v1, $v0
/* 4D068 8005C868 00100224 */  addiu      $v0, $zero, 0x1000
/* 4D06C 8005C86C D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4D070 8005C870 00000000 */  nop
/* 4D074 8005C874 05006014 */  bnez       $v1, .L8005C88C
/* 4D078 8005C878 23104400 */   subu      $v0, $v0, $a0
/* 4D07C 8005C87C ECBF84A7 */  sh         $a0, %gp_rel(gameTrackerX + 0x224)($gp)
/* 4D080 8005C880 EEBF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x226)($gp)
/* 4D084 8005C884 0800E003 */  jr         $ra
/* 4D088 8005C888 00000000 */   nop
.L8005C88C:
/* 4D08C 8005C88C ECBF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x224)($gp)
/* 4D090 8005C890 EEBF84A7 */  sh         $a0, %gp_rel(gameTrackerX + 0x226)($gp)
/* 4D094 8005C894 0800E003 */  jr         $ra
/* 4D098 8005C898 00000000 */   nop
.size MORPH_InMorphDoFadeValues, . - MORPH_InMorphDoFadeValues
