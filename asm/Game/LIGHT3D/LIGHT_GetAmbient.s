.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LIGHT_GetAmbient
/* 26850 80036050 1C00A28C */  lw         $v0, 0x1C($a1)
/* 26854 80036054 00000000 */  nop
/* 26858 80036058 2C00428C */  lw         $v0, 0x2C($v0)
/* 2685C 8003605C 00000000 */  nop
/* 26860 80036060 00084230 */  andi       $v0, $v0, 0x800
/* 26864 80036064 02004010 */  beqz       $v0, .L80036070
/* 26868 80036068 30000324 */   addiu     $v1, $zero, 0x30
/* 2686C 8003606C 21180000 */  addu       $v1, $zero, $zero
.L80036070:
/* 26870 80036070 020083A0 */  sb         $v1, 0x2($a0)
/* 26874 80036074 010083A0 */  sb         $v1, 0x1($a0)
/* 26878 80036078 0800E003 */  jr         $ra
/* 2687C 8003607C 000083A0 */   sb        $v1, 0x0($a0)
.size LIGHT_GetAmbient, . - LIGHT_GetAmbient
