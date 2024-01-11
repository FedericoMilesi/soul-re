.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSetStartAndEndSegment
/* 63094 80072894 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 63098 80072898 00340600 */  sll        $a2, $a2, 16
/* 6309C 8007289C 003C0700 */  sll        $a3, $a3, 16
/* 630A0 800728A0 03340600 */  sra        $a2, $a2, 16
/* 630A4 800728A4 1000BFAF */  sw         $ra, 0x10($sp)
/* 630A8 800728A8 0000848C */  lw         $a0, 0x0($a0)
/* 630AC 800728AC 1ACA010C */  jal        G2EmulationInstanceSetStartAndEndSegment
/* 630B0 800728B0 033C0700 */   sra       $a3, $a3, 16
/* 630B4 800728B4 1000BF8F */  lw         $ra, 0x10($sp)
/* 630B8 800728B8 00000000 */  nop
/* 630BC 800728BC 0800E003 */  jr         $ra
/* 630C0 800728C0 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationSetStartAndEndSegment, . - G2EmulationSetStartAndEndSegment
