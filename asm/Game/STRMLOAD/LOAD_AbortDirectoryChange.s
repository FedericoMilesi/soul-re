.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_AbortDirectoryChange
/* 511A4 800609A4 44CB828F */  lw         $v0, %gp_rel(loadHead)($gp)
/* 511A8 800609A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 511AC 800609AC 1B004010 */  beqz       $v0, .L80060A1C
/* 511B0 800609B0 1000BFAF */   sw        $ra, 0x10($sp)
/* 511B4 800609B4 CADF000C */  jal        LOAD_HashUnit
/* 511B8 800609B8 00000000 */   nop
/* 511BC 800609BC 44CB858F */  lw         $a1, %gp_rel(loadHead)($gp)
/* 511C0 800609C0 00000000 */  nop
/* 511C4 800609C4 0000A48C */  lw         $a0, 0x0($a1)
/* 511C8 800609C8 00000000 */  nop
/* 511CC 800609CC 13008010 */  beqz       $a0, .L80060A1C
/* 511D0 800609D0 21184000 */   addu      $v1, $v0, $zero
/* 511D4 800609D4 0A000624 */  addiu      $a2, $zero, 0xA
.L800609D8:
/* 511D8 800609D8 04008284 */  lh         $v0, 0x4($a0)
/* 511DC 800609DC 00000000 */  nop
/* 511E0 800609E0 09004614 */  bne        $v0, $a2, .L80060A08
/* 511E4 800609E4 00000000 */   nop
/* 511E8 800609E8 0C00828C */  lw         $v0, 0xC($a0)
/* 511EC 800609EC 00000000 */  nop
/* 511F0 800609F0 05004314 */  bne        $v0, $v1, .L80060A08
/* 511F4 800609F4 00000000 */   nop
/* 511F8 800609F8 0E80010C */  jal        STREAM_RemoveQueueEntry
/* 511FC 800609FC 00000000 */   nop
/* 51200 80060A00 87820108 */  j          .L80060A1C
/* 51204 80060A04 00000000 */   nop
.L80060A08:
/* 51208 80060A08 21288000 */  addu       $a1, $a0, $zero
/* 5120C 80060A0C 0000848C */  lw         $a0, 0x0($a0)
/* 51210 80060A10 00000000 */  nop
/* 51214 80060A14 F0FF8014 */  bnez       $a0, .L800609D8
/* 51218 80060A18 00000000 */   nop
.L80060A1C:
/* 5121C 80060A1C 1000BF8F */  lw         $ra, 0x10($sp)
/* 51220 80060A20 00000000 */  nop
/* 51224 80060A24 0800E003 */  jr         $ra
/* 51228 80060A28 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_AbortDirectoryChange, . - LOAD_AbortDirectoryChange
