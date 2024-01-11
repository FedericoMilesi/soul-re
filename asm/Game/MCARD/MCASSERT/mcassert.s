.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mcassert
/* AA238 800B9A38 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA23C 800B9A3C 21388000 */  addu       $a3, $a0, $zero
/* AA240 800B9A40 0600E010 */  beqz       $a3, .L800B9A5C
/* AA244 800B9A44 1000BFAF */   sw        $ra, 0x10($sp)
/* AA248 800B9A48 0180043C */  lui        $a0, %hi(D_800124AC)
/* AA24C 800B9A4C 06D1010C */  jal        printf
/* AA250 800B9A50 AC248424 */   addiu     $a0, $a0, %lo(D_800124AC)
/* AA254 800B9A54 9AE60208 */  j          .L800B9A68
/* AA258 800B9A58 00000000 */   nop
.L800B9A5C:
/* AA25C 800B9A5C 0180043C */  lui        $a0, %hi(D_800124B8)
/* AA260 800B9A60 06D1010C */  jal        printf
/* AA264 800B9A64 B8248424 */   addiu     $a0, $a0, %lo(D_800124B8)
.L800B9A68:
/* AA268 800B9A68 CD010100 */  break      1, 7
/* AA26C 800B9A6C 1000BF8F */  lw         $ra, 0x10($sp)
/* AA270 800B9A70 00000000 */  nop
/* AA274 800B9A74 0800E003 */  jr         $ra
/* AA278 800B9A78 1800BD27 */   addiu     $sp, $sp, 0x18
.size mcassert, . - mcassert
