.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadSetMasterVolume
/* 4260C 80051E0C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 42610 80051E10 00240400 */  sll        $a0, $a0, 16
/* 42614 80051E14 03240400 */  sra        $a0, $a0, 16
/* 42618 80051E18 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 4261C 80051E1C 21288000 */  addu       $a1, $a0, $zero
/* 42620 80051E20 1000BFAF */  sw         $ra, 0x10($sp)
/* 42624 80051E24 C4FF020C */  jal        SpuSetCommonMasterVolume
/* 42628 80051E28 0C0044AC */   sw        $a0, 0xC($v0)
/* 4262C 80051E2C 1000BF8F */  lw         $ra, 0x10($sp)
/* 42630 80051E30 00000000 */  nop
/* 42634 80051E34 0800E003 */  jr         $ra
/* 42638 80051E38 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadSetMasterVolume, . - aadSetMasterVolume
