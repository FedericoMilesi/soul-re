.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razReaverBladeOff
/* 9651C 800A5D1C 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 96520 800A5D20 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 96524 800A5D24 05008010 */  beqz       $a0, .L800A5D3C
/* 96528 800A5D28 1000BFAF */   sw        $ra, 0x10($sp)
/* 9652C 800A5D2C 8000053C */  lui        $a1, (0x800109 >> 16)
/* 96530 800A5D30 0901A534 */  ori        $a1, $a1, (0x800109 & 0xFFFF)
/* 96534 800A5D34 A1D1000C */  jal        INSTANCE_Post
/* 96538 800A5D38 21300000 */   addu      $a2, $zero, $zero
.L800A5D3C:
/* 9653C 800A5D3C 1000BF8F */  lw         $ra, 0x10($sp)
/* 96540 800A5D40 00000000 */  nop
/* 96544 800A5D44 0800E003 */  jr         $ra
/* 96548 800A5D48 1800BD27 */   addiu     $sp, $sp, 0x18
.size razReaverBladeOff, . - razReaverBladeOff
