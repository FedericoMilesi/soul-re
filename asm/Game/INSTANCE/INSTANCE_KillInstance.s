.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_KillInstance
/* 24E14 80034614 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 24E18 80034618 1000BFAF */  sw         $ra, 0x10($sp)
/* 24E1C 8003461C 1400828C */  lw         $v0, 0x14($a0)
/* 24E20 80034620 00000000 */  nop
/* 24E24 80034624 20004230 */  andi       $v0, $v0, 0x20
/* 24E28 80034628 03004014 */  bnez       $v0, .L80034638
/* 24E2C 8003462C 00000000 */   nop
/* 24E30 80034630 39D1000C */  jal        INSTANCE_PlainDeath
/* 24E34 80034634 00000000 */   nop
.L80034638:
/* 24E38 80034638 1000BF8F */  lw         $ra, 0x10($sp)
/* 24E3C 8003463C 00000000 */  nop
/* 24E40 80034640 0800E003 */  jr         $ra
/* 24E44 80034644 1800BD27 */   addiu     $sp, $sp, 0x18
.size INSTANCE_KillInstance, . - INSTANCE_KillInstance
