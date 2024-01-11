.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_Smell
/* 766D4 80085ED4 6C01828C */  lw         $v0, 0x16C($a0)
/* 766D8 80085ED8 00000000 */  nop
/* 766DC 80085EDC 6801428C */  lw         $v0, 0x168($v0)
/* 766E0 80085EE0 00000000 */  nop
/* 766E4 80085EE4 0400428C */  lw         $v0, 0x4($v0)
/* 766E8 80085EE8 00000000 */  nop
/* 766EC 80085EEC 0C004394 */  lhu        $v1, 0xC($v0)
/* 766F0 80085EF0 0400A28C */  lw         $v0, 0x4($a1)
/* 766F4 80085EF4 0800E003 */  jr         $ra
/* 766F8 80085EF8 2B104300 */   sltu      $v0, $v0, $v1
.size MONSENSE_Smell, . - MONSENSE_Smell
