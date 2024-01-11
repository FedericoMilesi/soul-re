.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C17E4
/* B1FE4 800C17E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B1FE8 800C17E8 1800B0AF */  sw         $s0, 0x18($sp)
/* B1FEC 800C17EC 21808000 */  addu       $s0, $a0, $zero
/* B1FF0 800C17F0 0E000424 */  addiu      $a0, $zero, 0xE
/* B1FF4 800C17F4 1000A527 */  addiu      $a1, $sp, 0x10
/* B1FF8 800C17F8 21300000 */  addu       $a2, $zero, $zero
/* B1FFC 800C17FC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* B2000 800C1800 50F8020C */  jal        func_800BE140
/* B2004 800C1804 1000B0A3 */   sb        $s0, 0x10($sp)
/* B2008 800C1808 00010232 */  andi       $v0, $s0, 0x100
/* B200C 800C180C 0E004010 */  beqz       $v0, .L800C1848
/* B2010 800C1810 20000232 */   andi      $v0, $s0, 0x20
/* B2014 800C1814 04004010 */  beqz       $v0, .L800C1828
/* B2018 800C1818 01000224 */   addiu     $v0, $zero, 0x1
/* B201C 800C181C 0E80013C */  lui        $at, %hi(StMode)
/* B2020 800C1820 0C060308 */  j          .L800C1830
/* B2024 800C1824 B8FD20AC */   sw        $zero, %lo(StMode)($at)
.L800C1828:
/* B2028 800C1828 0E80013C */  lui        $at, %hi(StMode)
/* B202C 800C182C B8FD22AC */  sw         $v0, %lo(StMode)($at)
.L800C1830:
/* B2030 800C1830 0C80043C */  lui        $a0, %hi(func_800C1D44)
/* B2034 800C1834 4FF9020C */  jal        func_800BE53C
/* B2038 800C1838 441D8424 */   addiu     $a0, $a0, %lo(func_800C1D44)
/* B203C 800C183C 0C80043C */  lui        $a0, %hi(func_800C1868)
/* B2040 800C1840 4BF8020C */  jal        func_800BE12C
/* B2044 800C1844 68188424 */   addiu     $a0, $a0, %lo(func_800C1868)
.L800C1848:
/* B2048 800C1848 1B000424 */  addiu      $a0, $zero, 0x1B
/* B204C 800C184C 21280000 */  addu       $a1, $zero, $zero
/* B2050 800C1850 50F8020C */  jal        func_800BE140
/* B2054 800C1854 21300000 */   addu      $a2, $zero, $zero
/* B2058 800C1858 1C00BF8F */  lw         $ra, 0x1C($sp)
/* B205C 800C185C 1800B08F */  lw         $s0, 0x18($sp)
/* B2060 800C1860 0800E003 */  jr         $ra
/* B2064 800C1864 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800C17E4, . - func_800C17E4
