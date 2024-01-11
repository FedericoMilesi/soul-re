.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetPrim
/* 32F00 80042700 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 32F04 80042704 1000BFAF */  sw         $ra, 0x10($sp)
/* 32F08 80042708 FB3E010C */  jal        LIST_GetFunc
/* 32F0C 8004270C A06D8424 */   addiu     $a0, $a0, 0x6DA0
/* 32F10 80042710 21204000 */  addu       $a0, $v0, $zero
/* 32F14 80042714 0F008014 */  bnez       $a0, .L80042754
/* 32F18 80042718 00000000 */   nop
/* 32F1C 8004271C BCC3828F */  lw         $v0, %gp_rel(FX_LastUsedPrim)($gp)
/* 32F20 80042720 00000000 */  nop
/* 32F24 80042724 09004010 */  beqz       $v0, .L8004274C
/* 32F28 80042728 00000000 */   nop
/* 32F2C 8004272C 21204000 */  addu       $a0, $v0, $zero
/* 32F30 80042730 0000828C */  lw         $v0, 0x0($a0)
/* 32F34 80042734 00000000 */  nop
/* 32F38 80042738 0000438C */  lw         $v1, 0x0($v0)
/* 32F3C 8004273C BCC382AF */  sw         $v0, %gp_rel(FX_LastUsedPrim)($gp)
/* 32F40 80042740 02006014 */  bnez       $v1, .L8004274C
/* 32F44 80042744 040040AC */   sw        $zero, 0x4($v0)
/* 32F48 80042748 BCC380AF */  sw         $zero, %gp_rel(FX_LastUsedPrim)($gp)
.L8004274C:
/* 32F4C 8004274C 04008010 */  beqz       $a0, .L80042760
/* 32F50 80042750 00000000 */   nop
.L80042754:
/* 32F54 80042754 140080AC */  sw         $zero, 0x14($a0)
/* 32F58 80042758 0C0080AC */  sw         $zero, 0xC($a0)
/* 32F5C 8004275C 180080AC */  sw         $zero, 0x18($a0)
.L80042760:
/* 32F60 80042760 1000BF8F */  lw         $ra, 0x10($sp)
/* 32F64 80042764 21108000 */  addu       $v0, $a0, $zero
/* 32F68 80042768 0800E003 */  jr         $ra
/* 32F6C 8004276C 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_GetPrim, . - FX_GetPrim
