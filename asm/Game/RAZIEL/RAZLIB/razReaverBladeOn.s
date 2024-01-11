.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razReaverBladeOn
/* 9654C 800A5D4C 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 96550 800A5D50 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 96554 800A5D54 09004010 */  beqz       $v0, .L800A5D7C
/* 96558 800A5D58 1000BFAF */   sw        $ra, 0x10($sp)
/* 9655C 800A5D5C 2197020C */  jal        razGetHeldItem
/* 96560 800A5D60 00000000 */   nop
/* 96564 800A5D64 05004014 */  bnez       $v0, .L800A5D7C
/* 96568 800A5D68 8000053C */   lui       $a1, (0x800108 >> 16)
/* 9656C 800A5D6C 0801A534 */  ori        $a1, $a1, (0x800108 & 0xFFFF)
/* 96570 800A5D70 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 96574 800A5D74 A1D1000C */  jal        INSTANCE_Post
/* 96578 800A5D78 21300000 */   addu      $a2, $zero, $zero
.L800A5D7C:
/* 9657C 800A5D7C 1000BF8F */  lw         $ra, 0x10($sp)
/* 96580 800A5D80 00000000 */  nop
/* 96584 800A5D84 0800E003 */  jr         $ra
/* 96588 800A5D88 1800BD27 */   addiu     $sp, $sp, 0x18
.size razReaverBladeOn, . - razReaverBladeOn
