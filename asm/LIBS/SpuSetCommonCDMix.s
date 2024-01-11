.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetCommonCDMix
/* B02E4 800BFAE4 07008014 */  bnez       $a0, .L800BFB04
/* B02E8 800BFAE8 00000000 */   nop
/* B02EC 800BFAEC 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B02F0 800BFAF0 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B02F4 800BFAF4 00000000 */  nop
/* B02F8 800BFAF8 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B02FC 800BFAFC C7FE0208 */  j          .L800BFB1C
/* B0300 800BFB00 FEFF4230 */   andi      $v0, $v0, 0xFFFE
.L800BFB04:
/* B0304 800BFB04 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B0308 800BFB08 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B030C 800BFB0C 00000000 */  nop
/* B0310 800BFB10 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B0314 800BFB14 00000000 */  nop
/* B0318 800BFB18 01004234 */  ori        $v0, $v0, 0x1
.L800BFB1C:
/* B031C 800BFB1C 0800E003 */  jr         $ra
/* B0320 800BFB20 AA0162A4 */   sh        $v0, 0x1AA($v1)
.size SpuSetCommonCDMix, . - SpuSetCommonCDMix
