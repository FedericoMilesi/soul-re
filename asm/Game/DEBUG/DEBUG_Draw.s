.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_Draw
/* 3DF0 800135F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3DF4 800135F4 1000BFAF */  sw         $ra, 0x10($sp)
/* 3DF8 800135F8 72018584 */  lh         $a1, 0x172($a0)
/* 3DFC 800135FC 00000000 */  nop
/* 3E00 80013600 0700A010 */  beqz       $a1, .L80013620
/* 3E04 80013604 01000224 */   addiu     $v0, $zero, 0x1
/* 3E08 80013608 C7018390 */  lbu        $v1, 0x1C7($a0)
/* 3E0C 8001360C 00000000 */  nop
/* 3E10 80013610 03006210 */  beq        $v1, $v0, .L80013620
/* 3E14 80013614 04000224 */   addiu     $v0, $zero, 0x4
/* 3E18 80013618 0300A214 */  bne        $a1, $v0, .L80013628
/* 3E1C 8001361C 00000000 */   nop
.L80013620:
/* 3E20 80013620 7E50000C */  jal        DEBUG_DisplayStatus
/* 3E24 80013624 00000000 */   nop
.L80013628:
/* 3E28 80013628 1000BF8F */  lw         $ra, 0x10($sp)
/* 3E2C 8001362C 00000000 */  nop
/* 3E30 80013630 0800E003 */  jr         $ra
/* 3E34 80013634 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_Draw, . - DEBUG_Draw
