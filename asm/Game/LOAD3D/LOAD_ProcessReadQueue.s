.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_ProcessReadQueue
/* 27FBC 800377BC 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 27FC0 800377C0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 27FC4 800377C4 0D004104 */  bgez       $v0, .L800377FC
/* 27FC8 800377C8 2800BFAF */   sw        $ra, 0x28($sp)
/* 27FCC 800377CC 0D80043C */  lui        $a0, %hi(D_800D0934)
/* 27FD0 800377D0 2CBC888F */  lw         $t0, %gp_rel(loadStatus + 0x98)($gp)
/* 27FD4 800377D4 A8BB858F */  lw         $a1, %gp_rel(loadStatus + 0x14)($gp)
/* 27FD8 800377D8 C0BB868F */  lw         $a2, %gp_rel(loadStatus + 0x2C)($gp)
/* 27FDC 800377DC 9CBB828F */  lw         $v0, %gp_rel(loadStatus + 0x8)($gp)
/* 27FE0 800377E0 28BC838F */  lw         $v1, %gp_rel(loadStatus + 0x94)($gp)
/* 27FE4 800377E4 30BC878F */  lw         $a3, %gp_rel(loadStatus + 0x9C)($gp)
/* 27FE8 800377E8 34098424 */  addiu      $a0, $a0, %lo(D_800D0934)
/* 27FEC 800377EC 1000A8AF */  sw         $t0, 0x10($sp)
/* 27FF0 800377F0 1400A2AF */  sw         $v0, 0x14($sp)
/* 27FF4 800377F4 C3B5000C */  jal        FONT_Print
/* 27FF8 800377F8 1800A3AF */   sw        $v1, 0x18($sp)
.L800377FC:
/* 27FFC 800377FC A8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x14)($gp)
/* 28000 80037800 03000224 */  addiu      $v0, $zero, 0x3
/* 28004 80037804 0E006210 */  beq        $v1, $v0, .L80037840
/* 28008 80037808 04006228 */   slti      $v0, $v1, 0x4
/* 2800C 8003780C 05004010 */  beqz       $v0, .L80037824
/* 28010 80037810 01000224 */   addiu     $v0, $zero, 0x1
/* 28014 80037814 12006210 */  beq        $v1, $v0, .L80037860
/* 28018 80037818 00000000 */   nop
/* 2801C 8003781C 1EDE0008 */  j          .L80037878
/* 28020 80037820 00000000 */   nop
.L80037824:
/* 28024 80037824 05000224 */  addiu      $v0, $zero, 0x5
/* 28028 80037828 11006210 */  beq        $v1, $v0, .L80037870
/* 2802C 8003782C 06000224 */   addiu     $v0, $zero, 0x6
/* 28030 80037830 07006210 */  beq        $v1, $v0, .L80037850
/* 28034 80037834 00000000 */   nop
/* 28038 80037838 1EDE0008 */  j          .L80037878
/* 2803C 8003783C 00000000 */   nop
.L80037840:
/* 28040 80037840 81DD000C */  jal        LOAD_DoCDReading
/* 28044 80037844 00000000 */   nop
/* 28048 80037848 1EDE0008 */  j          .L80037878
/* 2804C 8003784C 00000000 */   nop
.L80037850:
/* 28050 80037850 ACDD000C */  jal        LOAD_DoCDBufferedReading
/* 28054 80037854 00000000 */   nop
/* 28058 80037858 1EDE0008 */  j          .L80037878
/* 2805C 8003785C 00000000 */   nop
.L80037860:
/* 28060 80037860 B3DD000C */  jal        LOAD_SetupFileToDoCDReading
/* 28064 80037864 00000000 */   nop
/* 28068 80037868 1EDE0008 */  j          .L80037878
/* 2806C 8003786C 00000000 */   nop
.L80037870:
/* 28070 80037870 D2DD000C */  jal        LOAD_SetupFileToDoBufferedCDReading
/* 28074 80037874 00000000 */   nop
.L80037878:
/* 28078 80037878 A8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x14)($gp)
/* 2807C 8003787C 07000224 */  addiu      $v0, $zero, 0x7
/* 28080 80037880 04006214 */  bne        $v1, $v0, .L80037894
/* 28084 80037884 01000224 */   addiu     $v0, $zero, 0x1
/* 28088 80037888 A8BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x14)($gp)
/* 2808C 8003788C 54DE0008 */  j          .L80037950
/* 28090 80037890 00000000 */   nop
.L80037894:
/* 28094 80037894 CCBB828F */  lw         $v0, %gp_rel(loadStatus + 0x38)($gp)
/* 28098 80037898 00000000 */  nop
/* 2809C 8003789C 2C004010 */  beqz       $v0, .L80037950
/* 280A0 800378A0 00000000 */   nop
/* 280A4 800378A4 6FF7000C */  jal        TIMER_GetTimeMS
/* 280A8 800378A8 00000000 */   nop
/* 280AC 800378AC CCBB838F */  lw         $v1, %gp_rel(loadStatus + 0x38)($gp)
/* 280B0 800378B0 00000000 */  nop
/* 280B4 800378B4 23104300 */  subu       $v0, $v0, $v1
/* 280B8 800378B8 D1204228 */  slti       $v0, $v0, 0x20D1
/* 280BC 800378BC 24004014 */  bnez       $v0, .L80037950
/* 280C0 800378C0 00000000 */   nop
/* 280C4 800378C4 A8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x14)($gp)
/* 280C8 800378C8 03000224 */  addiu      $v0, $zero, 0x3
/* 280CC 800378CC 05006210 */  beq        $v1, $v0, .L800378E4
/* 280D0 800378D0 21200000 */   addu      $a0, $zero, $zero
/* 280D4 800378D4 A8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x14)($gp)
/* 280D8 800378D8 06000224 */  addiu      $v0, $zero, 0x6
/* 280DC 800378DC 15006214 */  bne        $v1, $v0, .L80037934
/* 280E0 800378E0 00000000 */   nop
.L800378E4:
/* 280E4 800378E4 C0BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x2C)($gp)
/* 280E8 800378E8 0EF8020C */  jal        CdReset
/* 280EC 800378EC 00000000 */   nop
/* 280F0 800378F0 B5E0000C */  jal        LOAD_InitCdStreamMode
/* 280F4 800378F4 00000000 */   nop
/* 280F8 800378F8 2000A527 */  addiu      $a1, $sp, 0x20
/* 280FC 800378FC 28BC848F */  lw         $a0, %gp_rel(loadStatus + 0x94)($gp)
/* 28100 80037900 01000224 */  addiu      $v0, $zero, 0x1
/* 28104 80037904 C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 28108 80037908 15FC020C */  jal        CdIntToPos
/* 2810C 8003790C 00000000 */   nop
/* 28110 80037910 06000424 */  addiu      $a0, $zero, 0x6
/* 28114 80037914 2000A527 */  addiu      $a1, $sp, 0x20
/* 28118 80037918 50F8020C */  jal        CdControl
/* 2811C 8003791C 21300000 */   addu      $a2, $zero, $zero
/* 28120 80037920 6FF7000C */  jal        TIMER_GetTimeMS
/* 28124 80037924 00000000 */   nop
/* 28128 80037928 CCBB82AF */  sw         $v0, %gp_rel(loadStatus + 0x38)($gp)
/* 2812C 8003792C 54DE0008 */  j          .L80037950
/* 28130 80037930 00000000 */   nop
.L80037934:
/* 28134 80037934 FDDC020C */  jal        VOICEXA_IsPlaying
/* 28138 80037938 00000000 */   nop
/* 2813C 8003793C 03004014 */  bnez       $v0, .L8003794C
/* 28140 80037940 09000424 */   addiu     $a0, $zero, 0x9
/* 28144 80037944 9FF8020C */  jal        CdControlF
/* 28148 80037948 21280000 */   addu      $a1, $zero, $zero
.L8003794C:
/* 2814C 8003794C CCBB80AF */  sw         $zero, %gp_rel(loadStatus + 0x38)($gp)
.L80037950:
/* 28150 80037950 2800BF8F */  lw         $ra, 0x28($sp)
/* 28154 80037954 00000000 */  nop
/* 28158 80037958 0800E003 */  jr         $ra
/* 2815C 8003795C 3000BD27 */   addiu     $sp, $sp, 0x30
.size LOAD_ProcessReadQueue, . - LOAD_ProcessReadQueue
