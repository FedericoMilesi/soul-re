.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_LoadTIM
/* 288B0 800380B0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 288B4 800380B4 2140A000 */  addu       $t0, $a1, $zero
/* 288B8 800380B8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 288BC 800380BC 2188E000 */  addu       $s1, $a3, $zero
/* 288C0 800380C0 1800B0AF */  sw         $s0, 0x18($sp)
/* 288C4 800380C4 08008524 */  addiu      $a1, $a0, 0x8
/* 288C8 800380C8 2000BFAF */  sw         $ra, 0x20($sp)
/* 288CC 800380CC FCFFA28C */  lw         $v0, -0x4($a1)
/* 288D0 800380D0 08000324 */  addiu      $v1, $zero, 0x8
/* 288D4 800380D4 03004314 */  bne        $v0, $v1, .L800380E4
/* 288D8 800380D8 21800000 */   addu      $s0, $zero, $zero
/* 288DC 800380DC 0C00B024 */  addiu      $s0, $a1, 0xC
/* 288E0 800380E0 2C00A524 */  addiu      $a1, $a1, 0x2C
.L800380E4:
/* 288E4 800380E4 1000A8A7 */  sh         $t0, 0x10($sp)
/* 288E8 800380E8 1200A6A7 */  sh         $a2, 0x12($sp)
/* 288EC 800380EC 0800A294 */  lhu        $v0, 0x8($a1)
/* 288F0 800380F0 1000A427 */  addiu      $a0, $sp, 0x10
/* 288F4 800380F4 1400A2A7 */  sh         $v0, 0x14($sp)
/* 288F8 800380F8 0A00A294 */  lhu        $v0, 0xA($a1)
/* 288FC 800380FC 0C00A524 */  addiu      $a1, $a1, 0xC
/* 28900 80038100 94E9020C */  jal        func_800BA650
/* 28904 80038104 1600A2A7 */   sh        $v0, 0x16($sp)
/* 28908 80038108 0C000012 */  beqz       $s0, .L8003813C
/* 2890C 8003810C 21200000 */   addu      $a0, $zero, $zero
/* 28910 80038110 3800A28F */  lw         $v0, 0x38($sp)
/* 28914 80038114 1000B1A7 */  sh         $s1, 0x10($sp)
/* 28918 80038118 1200A2A7 */  sh         $v0, 0x12($sp)
/* 2891C 8003811C 10000224 */  addiu      $v0, $zero, 0x10
/* 28920 80038120 1400A2A7 */  sh         $v0, 0x14($sp)
/* 28924 80038124 01000224 */  addiu      $v0, $zero, 0x1
/* 28928 80038128 0FE9020C */  jal        func_800BA43C
/* 2892C 8003812C 1600A2A7 */   sh        $v0, 0x16($sp)
/* 28930 80038130 1000A427 */  addiu      $a0, $sp, 0x10
/* 28934 80038134 94E9020C */  jal        func_800BA650
/* 28938 80038138 21280002 */   addu      $a1, $s0, $zero
.L8003813C:
/* 2893C 8003813C 2000BF8F */  lw         $ra, 0x20($sp)
/* 28940 80038140 1C00B18F */  lw         $s1, 0x1C($sp)
/* 28944 80038144 1800B08F */  lw         $s0, 0x18($sp)
/* 28948 80038148 0800E003 */  jr         $ra
/* 2894C 8003814C 2800BD27 */   addiu     $sp, $sp, 0x28
.size LOAD_LoadTIM, . - LOAD_LoadTIM
