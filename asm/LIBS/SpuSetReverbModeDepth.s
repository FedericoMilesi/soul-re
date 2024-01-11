.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetReverbModeDepth
/* B0224 800BFA24 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B0228 800BFA28 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B022C 800BFA2C 00000000 */  nop
/* B0230 800BFA30 840144A4 */  sh         $a0, 0x184($v0)
/* B0234 800BFA34 860145A4 */  sh         $a1, 0x186($v0)
/* B0238 800BFA38 0D80023C */  lui        $v0, %hi(_spu_rev_attr_dup2)
/* B023C 800BFA3C 04ED4224 */  addiu      $v0, $v0, %lo(_spu_rev_attr_dup2)
/* B0240 800BFA40 000044A4 */  sh         $a0, 0x0($v0)
/* B0244 800BFA44 0800E003 */  jr         $ra
/* B0248 800BFA48 020045A4 */   sh        $a1, 0x2($v0)
/* B024C 800BFA4C 00000000 */  nop
/* B0250 800BFA50 00000000 */  nop
.size SpuSetReverbModeDepth, . - SpuSetReverbModeDepth
