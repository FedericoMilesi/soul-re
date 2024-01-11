.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoulReaverProcess
/* 6AA00 8007A200 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6AA04 8007A204 1000BFAF */  sw         $ra, 0x10($sp)
/* 6AA08 8007A208 6C01828C */  lw         $v0, 0x16C($a0)
/* 6AA0C 8007A20C 00000000 */  nop
/* 6AA10 8007A210 00004290 */  lbu        $v0, 0x0($v0)
/* 6AA14 8007A214 00000000 */  nop
/* 6AA18 8007A218 06004010 */  beqz       $v0, .L8007A234
/* 6AA1C 8007A21C 00000000 */   nop
/* 6AA20 8007A220 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6AA24 8007A224 00000000 */  nop
/* 6AA28 8007A228 3800428C */  lw         $v0, 0x38($v0)
/* 6AA2C 8007A22C 00000000 */  nop
/* 6AA30 8007A230 380082AC */  sw         $v0, 0x38($a0)
.L8007A234:
/* 6AA34 8007A234 67EA010C */  jal        _SoulReaverAnimate
/* 6AA38 8007A238 00000000 */   nop
/* 6AA3C 8007A23C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6AA40 8007A240 00000000 */  nop
/* 6AA44 8007A244 0800E003 */  jr         $ra
/* 6AA48 8007A248 1800BD27 */   addiu     $sp, $sp, 0x18
.size SoulReaverProcess, . - SoulReaverProcess
