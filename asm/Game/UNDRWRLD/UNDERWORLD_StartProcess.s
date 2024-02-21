.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_StartProcess
/* A5038 800B4838 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A503C 800B483C 0400053C */  lui        $a1, (0x40001 >> 16)
/* A5040 800B4840 0100A534 */  ori        $a1, $a1, (0x40001 & 0xFFFF)
/* A5044 800B4844 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* A5048 800B4848 1000BFAF */  sw         $ra, 0x10($sp)
/* A504C 800B484C A1D1000C */  jal        INSTANCE_Post
/* A5050 800B4850 21300000 */   addu      $a2, $zero, $zero
/* A5054 800B4854 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* A5058 800B4858 00000000 */  nop
/* A505C 800B485C 3800448C */  lw         $a0, 0x38($v0)
/* A5060 800B4860 3A6C010C */  jal        STREAM_DumpAllLevels
/* A5064 800B4864 01000524 */   addiu     $a1, $zero, 0x1
/* A5068 800B4868 78D3020C */  jal        UNDERWORLD_InitDisplayProcess
/* A506C 800B486C 00000000 */   nop
/* A5070 800B4870 0D80043C */  lui        $a0, %hi(D_800D1DC8)
/* A5074 800B4874 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* A5078 800B4878 A8D3020C */  jal        UNDERWORLD_LoadLevel
/* A507C 800B487C C81D8424 */   addiu     $a0, $a0, %lo(D_800D1DC8)
/* A5080 800B4880 2CA8848F */  lw         $a0, %gp_rel(ScreenMorphArray)($gp)
/* A5084 800B4884 00000000 */  nop
/* A5088 800B4888 04008010 */  beqz       $a0, .L800B489C
/* A508C 800B488C 00000000 */   nop
/* A5090 800B4890 2641010C */  jal        MEMPACK_Free
/* A5094 800B4894 00000000 */   nop
/* A5098 800B4898 2CA880AF */  sw         $zero, %gp_rel(ScreenMorphArray)($gp)
.L800B489C:
/* A509C 800B489C 1000BF8F */  lw         $ra, 0x10($sp)
/* A50A0 800B48A0 00000000 */  nop
/* A50A4 800B48A4 0800E003 */  jr         $ra
/* A50A8 800B48A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size UNDERWORLD_StartProcess, . - UNDERWORLD_StartProcess
