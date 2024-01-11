.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetCommonMasterVolume
/* B0710 800BFF10 FF7F8430 */  andi       $a0, $a0, 0x7FFF
/* B0714 800BFF14 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B0718 800BFF18 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B071C 800BFF1C FF7FA530 */  andi       $a1, $a1, 0x7FFF
/* B0720 800BFF20 800144A4 */  sh         $a0, 0x180($v0)
/* B0724 800BFF24 0800E003 */  jr         $ra
/* B0728 800BFF28 820145A4 */   sh        $a1, 0x182($v0)
/* B072C 800BFF2C 00000000 */  nop
.size SpuSetCommonMasterVolume, . - SpuSetCommonMasterVolume
