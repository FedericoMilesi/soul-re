.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSetTotalSections
/* 63148 80072948 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6314C 8007294C 002C0500 */  sll        $a1, $a1, 16
/* 63150 80072950 032C0500 */  sra        $a1, $a1, 16
/* 63154 80072954 1000BFAF */  sw         $ra, 0x10($sp)
/* 63158 80072958 040085AC */  sw         $a1, 0x4($a0)
/* 6315C 8007295C 0000848C */  lw         $a0, 0x0($a0)
/* 63160 80072960 31CA010C */  jal        G2EmulationInstanceSetTotalSections
/* 63164 80072964 00000000 */   nop
/* 63168 80072968 1000BF8F */  lw         $ra, 0x10($sp)
/* 6316C 8007296C 00000000 */  nop
/* 63170 80072970 0800E003 */  jr         $ra
/* 63174 80072974 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationSetTotalSections, . - G2EmulationSetTotalSections
