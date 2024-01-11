.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1868
/* B2068 800C1868 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B206C 800C186C 1000BFAF */  sw         $ra, 0x10($sp)
/* B2070 800C1870 0503030C */  jal        StCdInterrupt
/* B2074 800C1874 00000000 */   nop
/* B2078 800C1878 1000BF8F */  lw         $ra, 0x10($sp)
/* B207C 800C187C 1800BD27 */  addiu      $sp, $sp, 0x18
/* B2080 800C1880 0800E003 */  jr         $ra
/* B2084 800C1884 00000000 */   nop
/* B2088 800C1888 00000000 */  nop
/* B208C 800C188C 00000000 */  nop
/* B2090 800C1890 00000000 */  nop
.size func_800C1868, . - func_800C1868
