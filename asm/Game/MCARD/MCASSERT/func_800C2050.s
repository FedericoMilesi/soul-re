.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C2050
/* B2850 800C2050 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2854 800C2054 0D80043C */  lui        $a0, %hi(Vcount + 0x14)
/* B2858 800C2058 C0E88424 */  addiu      $a0, $a0, %lo(Vcount + 0x14)
/* B285C 800C205C 1000BFAF */  sw         $ra, 0x10($sp)
/* B2860 800C2060 B208030C */  jal        func_800C22C8
/* B2864 800C2064 08000524 */   addiu     $a1, $zero, 0x8
/* B2868 800C2068 03000424 */  addiu      $a0, $zero, 0x3
/* B286C 800C206C 0D80023C */  lui        $v0, %hi(Vcount + 0x10)
/* B2870 800C2070 BCE8428C */  lw         $v0, %lo(Vcount + 0x10)($v0)
/* B2874 800C2074 0C80053C */  lui        $a1, %hi(func_800C209C)
/* B2878 800C2078 9C20A524 */  addiu      $a1, $a1, %lo(func_800C209C)
/* B287C 800C207C ABE6020C */  jal        func_800B9AAC
/* B2880 800C2080 000040AC */   sw        $zero, 0x0($v0)
/* B2884 800C2084 0C80023C */  lui        $v0, %hi(func_800C221C)
/* B2888 800C2088 1C224224 */  addiu      $v0, $v0, %lo(func_800C221C)
/* B288C 800C208C 1000BF8F */  lw         $ra, 0x10($sp)
/* B2890 800C2090 1800BD27 */  addiu      $sp, $sp, 0x18
/* B2894 800C2094 0800E003 */  jr         $ra
/* B2898 800C2098 00000000 */   nop
.size func_800C2050, . - func_800C2050
