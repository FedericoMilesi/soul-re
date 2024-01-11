.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ResolveObjectIntro
/* 52610 80061E10 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 52614 80061E14 21108000 */  addu       $v0, $a0, $zero
/* 52618 80061E18 1000BFAF */  sw         $ra, 0x10($sp)
/* 5261C 80061E1C 0400448C */  lw         $a0, 0x4($v0)
/* 52620 80061E20 0800458C */  lw         $a1, 0x8($v0)
/* 52624 80061E24 41D2000C */  jal        INSTANCE_FindIntro
/* 52628 80061E28 00000000 */   nop
/* 5262C 80061E2C 1000BF8F */  lw         $ra, 0x10($sp)
/* 52630 80061E30 00000000 */  nop
/* 52634 80061E34 0800E003 */  jr         $ra
/* 52638 80061E38 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_ResolveObjectIntro, . - EVENT_ResolveObjectIntro
