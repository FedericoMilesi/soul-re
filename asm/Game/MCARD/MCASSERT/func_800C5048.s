.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C5048
/* B5848 800C5048 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B584C 800C504C 1000BFAF */  sw         $ra, 0x10($sp)
/* B5850 800C5050 0D80013C */  lui        $at, %hi(CD_cbready)
/* B5854 800C5054 88E920AC */  sw         $zero, %lo(CD_cbready)($at)
/* B5858 800C5058 0D80013C */  lui        $at, %hi(CD_cbsync)
/* B585C 800C505C 84E920AC */  sw         $zero, %lo(CD_cbsync)($at)
/* B5860 800C5060 0D80013C */  lui        $at, %hi(CD_status1)
/* B5864 800C5064 94E920AC */  sw         $zero, %lo(CD_status1)($at)
/* B5868 800C5068 0D80013C */  lui        $at, %hi(CD_status)
/* B586C 800C506C 9FE6020C */  jal        func_800B9A7C
/* B5870 800C5070 90E920AC */   sw        $zero, %lo(CD_status)($at)
/* B5874 800C5074 0C80053C */  lui        $a1, %hi(func_800C55D4)
/* B5878 800C5078 D455A524 */  addiu      $a1, $a1, %lo(func_800C55D4)
/* B587C 800C507C ABE6020C */  jal        func_800B9AAC
/* B5880 800C5080 02000424 */   addiu     $a0, $zero, 0x2
/* B5884 800C5084 1000BF8F */  lw         $ra, 0x10($sp)
/* B5888 800C5088 1800BD27 */  addiu      $sp, $sp, 0x18
/* B588C 800C508C 0800E003 */  jr         $ra
/* B5890 800C5090 00000000 */   nop
.size func_800C5048, . - func_800C5048
