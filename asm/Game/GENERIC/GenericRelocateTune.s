.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GenericRelocateTune
/* 2F42C 8003EC2C 1C00838C */  lw         $v1, 0x1C($a0)
/* 2F430 8003EC30 00000000 */  nop
/* 2F434 8003EC34 06006010 */  beqz       $v1, .L8003EC50
/* 2F438 8003EC38 00000000 */   nop
/* 2F43C 8003EC3C 0400628C */  lw         $v0, 0x4($v1)
/* 2F440 8003EC40 00000000 */  nop
/* 2F444 8003EC44 02004010 */  beqz       $v0, .L8003EC50
/* 2F448 8003EC48 21104500 */   addu      $v0, $v0, $a1
/* 2F44C 8003EC4C 040062AC */  sw         $v0, 0x4($v1)
.L8003EC50:
/* 2F450 8003EC50 0800E003 */  jr         $ra
/* 2F454 8003EC54 00000000 */   nop
.size GenericRelocateTune, . - GenericRelocateTune
