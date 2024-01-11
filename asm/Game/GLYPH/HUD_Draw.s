.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUD_Draw
/* 6CEF0 8007C6F0 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 6CEF4 8007C6F4 2CB1838F */  lw         $v1, %gp_rel(theCamera + 0x49C)($gp)
/* 6CEF8 8007C6F8 0080023C */  lui        $v0, (0x80000000 >> 16)
/* 6CEFC 8007C6FC 6000BFAF */  sw         $ra, 0x60($sp)
/* 6CF00 8007C700 5C00B3AF */  sw         $s3, 0x5C($sp)
/* 6CF04 8007C704 5800B2AF */  sw         $s2, 0x58($sp)
/* 6CF08 8007C708 5400B1AF */  sw         $s1, 0x54($sp)
/* 6CF0C 8007C70C 24186200 */  and        $v1, $v1, $v0
/* 6CF10 8007C710 07006014 */  bnez       $v1, .L8007C730
/* 6CF14 8007C714 5000B0AF */   sw        $s0, 0x50($sp)
/* 6CF18 8007C718 10ED828F */  lw         $v0, %gp_rel(warpDraw)($gp)
/* 6CF1C 8007C71C 00000000 */  nop
/* 6CF20 8007C720 5E004010 */  beqz       $v0, .L8007C89C
/* 6CF24 8007C724 00000000 */   nop
/* 6CF28 8007C728 0C006010 */  beqz       $v1, .L8007C75C
/* 6CF2C 8007C72C 00000000 */   nop
.L8007C730:
/* 6CF30 8007C730 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6CF34 8007C734 10ED828F */  lw         $v0, %gp_rel(warpDraw)($gp)
/* 6CF38 8007C738 02190300 */  srl        $v1, $v1, 4
/* 6CF3C 8007C73C 21104300 */  addu       $v0, $v0, $v1
/* 6CF40 8007C740 10ED82AF */  sw         $v0, %gp_rel(warpDraw)($gp)
/* 6CF44 8007C744 01104228 */  slti       $v0, $v0, 0x1001
/* 6CF48 8007C748 0C004014 */  bnez       $v0, .L8007C77C
/* 6CF4C 8007C74C 00100224 */   addiu     $v0, $zero, 0x1000
/* 6CF50 8007C750 10ED82AF */  sw         $v0, %gp_rel(warpDraw)($gp)
/* 6CF54 8007C754 DFF10108 */  j          .L8007C77C
/* 6CF58 8007C758 00000000 */   nop
.L8007C75C:
/* 6CF5C 8007C75C 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6CF60 8007C760 10ED838F */  lw         $v1, %gp_rel(warpDraw)($gp)
/* 6CF64 8007C764 02110200 */  srl        $v0, $v0, 4
/* 6CF68 8007C768 23186200 */  subu       $v1, $v1, $v0
/* 6CF6C 8007C76C 10ED83AF */  sw         $v1, %gp_rel(warpDraw)($gp)
/* 6CF70 8007C770 02006104 */  bgez       $v1, .L8007C77C
/* 6CF74 8007C774 00000000 */   nop
/* 6CF78 8007C778 10ED80AF */  sw         $zero, %gp_rel(warpDraw)($gp)
.L8007C77C:
/* 6CF7C 8007C77C DCEB010C */  jal        HUD_GetPlayerScreenPt
/* 6CF80 8007C780 3000A427 */   addiu     $a0, $sp, 0x30
/* 6CF84 8007C784 14ED848F */  lw         $a0, %gp_rel(glowdeg)($gp)
/* 6CF88 8007C788 DCE4010C */  jal        func_80079370
/* 6CF8C 8007C78C 00000000 */   nop
/* 6CF90 8007C790 6666033C */  lui        $v1, (0x66666667 >> 16)
/* 6CF94 8007C794 10ED848F */  lw         $a0, %gp_rel(warpDraw)($gp)
/* 6CF98 8007C798 67666334 */  ori        $v1, $v1, (0x66666667 & 0xFFFF)
/* 6CF9C 8007C79C 18008300 */  mult       $a0, $v1
/* 6CFA0 8007C7A0 10280000 */  mfhi       $a1
/* 6CFA4 8007C7A4 5555033C */  lui        $v1, (0x55555556 >> 16)
/* 6CFA8 8007C7A8 56556334 */  ori        $v1, $v1, (0x55555556 & 0xFFFF)
/* 6CFAC 8007C7AC 18008300 */  mult       $a0, $v1
/* 6CFB0 8007C7B0 C3270400 */  sra        $a0, $a0, 31
/* 6CFB4 8007C7B4 10400000 */  mfhi       $t0
/* 6CFB8 8007C7B8 83180500 */  sra        $v1, $a1, 2
/* 6CFBC 8007C7BC 23186400 */  subu       $v1, $v1, $a0
/* 6CFC0 8007C7C0 18006200 */  mult       $v1, $v0
/* 6CFC4 8007C7C4 12100000 */  mflo       $v0
/* 6CFC8 8007C7C8 02004104 */  bgez       $v0, .L8007C7D4
/* 6CFCC 8007C7CC 23180401 */   subu      $v1, $t0, $a0
/* 6CFD0 8007C7D0 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8007C7D4:
/* 6CFD4 8007C7D4 03130200 */  sra        $v0, $v0, 12
/* 6CFD8 8007C7D8 21286200 */  addu       $a1, $v1, $v0
/* 6CFDC 8007C7DC 0200A104 */  bgez       $a1, .L8007C7E8
/* 6CFE0 8007C7E0 00000000 */   nop
/* 6CFE4 8007C7E4 21280000 */  addu       $a1, $zero, $zero
.L8007C7E8:
/* 6CFE8 8007C7E8 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6CFEC 8007C7EC 14ED828F */  lw         $v0, %gp_rel(glowdeg)($gp)
/* 6CFF0 8007C7F0 18ED848F */  lw         $a0, %gp_rel(hud_warp_arrow_flash)($gp)
/* 6CFF4 8007C7F4 42190600 */  srl        $v1, $a2, 5
/* 6CFF8 8007C7F8 21104300 */  addu       $v0, $v0, $v1
/* 6CFFC 8007C7FC 14ED82AF */  sw         $v0, %gp_rel(glowdeg)($gp)
/* 6D000 8007C800 08008018 */  blez       $a0, .L8007C824
/* 6D004 8007C804 C2100600 */   srl       $v0, $a2, 3
/* 6D008 8007C808 23108200 */  subu       $v0, $a0, $v0
/* 6D00C 8007C80C 18ED82AF */  sw         $v0, %gp_rel(hud_warp_arrow_flash)($gp)
/* 6D010 8007C810 13004104 */  bgez       $v0, .L8007C860
/* 6D014 8007C814 2180A400 */   addu      $s0, $a1, $a0
/* 6D018 8007C818 18ED80AF */  sw         $zero, %gp_rel(hud_warp_arrow_flash)($gp)
/* 6D01C 8007C81C 0AF20108 */  j          .L8007C828
/* 6D020 8007C820 00000000 */   nop
.L8007C824:
/* 6D024 8007C824 2180A000 */  addu       $s0, $a1, $zero
.L8007C828:
/* 6D028 8007C828 18ED838F */  lw         $v1, %gp_rel(hud_warp_arrow_flash)($gp)
/* 6D02C 8007C82C 00000000 */  nop
/* 6D030 8007C830 0C006104 */  bgez       $v1, .L8007C864
/* 6D034 8007C834 2140A000 */   addu      $t0, $a1, $zero
/* 6D038 8007C838 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6D03C 8007C83C 00000000 */  nop
/* 6D040 8007C840 C2100200 */  srl        $v0, $v0, 3
/* 6D044 8007C844 21106200 */  addu       $v0, $v1, $v0
/* 6D048 8007C848 18ED82AF */  sw         $v0, %gp_rel(hud_warp_arrow_flash)($gp)
/* 6D04C 8007C84C 05004018 */  blez       $v0, .L8007C864
/* 6D050 8007C850 2340A300 */   subu      $t0, $a1, $v1
/* 6D054 8007C854 18ED80AF */  sw         $zero, %gp_rel(hud_warp_arrow_flash)($gp)
/* 6D058 8007C858 1AF20108 */  j          .L8007C868
/* 6D05C 8007C85C C0FF0624 */   addiu     $a2, $zero, -0x40
.L8007C860:
/* 6D060 8007C860 2140A000 */  addu       $t0, $a1, $zero
.L8007C864:
/* 6D064 8007C864 C0FF0624 */  addiu      $a2, $zero, -0x40
.L8007C868:
/* 6D068 8007C868 3000A487 */  lh         $a0, 0x30($sp)
/* 6D06C 8007C86C 3200A587 */  lh         $a1, 0x32($sp)
/* 6D070 8007C870 20000724 */  addiu      $a3, $zero, 0x20
/* 6D074 8007C874 1000A8AF */  sw         $t0, 0x10($sp)
/* 6D078 8007C878 841A010C */  jal        FX_MakeWarpArrow
/* 6D07C 8007C87C 21208600 */   addu      $a0, $a0, $a2
/* 6D080 8007C880 40000624 */  addiu      $a2, $zero, 0x40
/* 6D084 8007C884 3000A487 */  lh         $a0, 0x30($sp)
/* 6D088 8007C888 3200A587 */  lh         $a1, 0x32($sp)
/* 6D08C 8007C88C 20000724 */  addiu      $a3, $zero, 0x20
/* 6D090 8007C890 1000B0AF */  sw         $s0, 0x10($sp)
/* 6D094 8007C894 841A010C */  jal        FX_MakeWarpArrow
/* 6D098 8007C898 21208600 */   addu      $a0, $a0, $a2
.L8007C89C:
/* 6D09C 8007C89C 2FF1010C */  jal        HUD_Update
/* 6D0A0 8007C8A0 00000000 */   nop
/* 6D0A4 8007C8A4 D8EC8287 */  lh         $v0, %gp_rel(MANNA_Position)($gp)
/* 6D0A8 8007C8A8 87000324 */  addiu      $v1, $zero, 0x87
/* 6D0AC 8007C8AC 2800A0A7 */  sh         $zero, 0x28($sp)
/* 6D0B0 8007C8B0 2A00A0A7 */  sh         $zero, 0x2A($sp)
/* 6D0B4 8007C8B4 C1FF4228 */  slti       $v0, $v0, -0x3F
/* 6D0B8 8007C8B8 31004014 */  bnez       $v0, .L8007C980
/* 6D0BC 8007C8BC 2C00A3A7 */   sh        $v1, 0x2C($sp)
/* 6D0C0 8007C8C0 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6D0C4 8007C8C4 ECB9928F */  lw         $s2, %gp_rel(fontTracker + 0x600)($gp)
/* 6D0C8 8007C8C8 F0B9938F */  lw         $s3, %gp_rel(fontTracker + 0x604)($gp)
/* 6D0CC 8007C8CC 92D1000C */  jal        INSTANCE_Query
/* 6D0D0 8007C8D0 20000524 */   addiu     $a1, $zero, 0x20
/* 6D0D4 8007C8D4 2D000524 */  addiu      $a1, $zero, 0x2D
/* 6D0D8 8007C8D8 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6D0DC 8007C8DC 92D1000C */  jal        INSTANCE_Query
/* 6D0E0 8007C8E0 21884000 */   addu      $s1, $v0, $zero
/* 6D0E4 8007C8E4 17000524 */  addiu      $a1, $zero, 0x17
/* 6D0E8 8007C8E8 33000624 */  addiu      $a2, $zero, 0x33
/* 6D0EC 8007C8EC 20000724 */  addiu      $a3, $zero, 0x20
/* 6D0F0 8007C8F0 D8EC8487 */  lh         $a0, %gp_rel(MANNA_Position)($gp)
/* 6D0F4 8007C8F4 BC1A010C */  jal        FX_MakeMannaIcon
/* 6D0F8 8007C8F8 21804000 */   addu      $s0, $v0, $zero
/* 6D0FC 8007C8FC 18B6000C */  jal        FONT_Flush
/* 6D100 8007C900 00000000 */   nop
/* 6D104 8007C904 D8EC8497 */  lhu        $a0, %gp_rel(MANNA_Position)($gp)
/* 6D108 8007C908 20000524 */  addiu      $a1, $zero, 0x20
/* 6D10C 8007C90C 3A008424 */  addiu      $a0, $a0, 0x3A
/* 6D110 8007C910 00240400 */  sll        $a0, $a0, 16
/* 6D114 8007C914 3CB6000C */  jal        FONT_SetCursor
/* 6D118 8007C918 03240400 */   sra       $a0, $a0, 16
/* 6D11C 8007C91C E0EC8587 */  lh         $a1, %gp_rel(glyph_cost)($gp)
/* 6D120 8007C920 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6D124 8007C924 0500A210 */  beq        $a1, $v0, .L8007C93C
/* 6D128 8007C928 2A103002 */   slt       $v0, $s1, $s0
/* 6D12C 8007C92C 0D80043C */  lui        $a0, %hi(HUD_Captured + 0x4)
/* 6D130 8007C930 C3B5000C */  jal        FONT_Print
/* 6D134 8007C934 941A8424 */   addiu     $a0, $a0, %lo(HUD_Captured + 0x4)
/* 6D138 8007C938 2A103002 */  slt        $v0, $s1, $s0
.L8007C93C:
/* 6D13C 8007C93C 03004014 */  bnez       $v0, .L8007C94C
/* 6D140 8007C940 00000000 */   nop
/* 6D144 8007C944 BEB6000C */  jal        FONT_SetColorIndex
/* 6D148 8007C948 02000424 */   addiu     $a0, $zero, 0x2
.L8007C94C:
/* 6D14C 8007C94C 0D80043C */  lui        $a0, %hi(HUD_Captured + 0x8)
/* 6D150 8007C950 981A8424 */  addiu      $a0, $a0, %lo(HUD_Captured + 0x8)
/* 6D154 8007C954 C3B5000C */  jal        FONT_Print
/* 6D158 8007C958 21282002 */   addu      $a1, $s1, $zero
/* 6D15C 8007C95C BEB6000C */  jal        FONT_SetColorIndex
/* 6D160 8007C960 21200000 */   addu      $a0, $zero, $zero
/* 6D164 8007C964 00241200 */  sll        $a0, $s2, 16
/* 6D168 8007C968 03240400 */  sra        $a0, $a0, 16
/* 6D16C 8007C96C 002C1300 */  sll        $a1, $s3, 16
/* 6D170 8007C970 3CB6000C */  jal        FONT_SetCursor
/* 6D174 8007C974 032C0500 */   sra       $a1, $a1, 16
/* 6D178 8007C978 18B6000C */  jal        FONT_Flush
/* 6D17C 8007C97C 00000000 */   nop
.L8007C980:
/* 6D180 8007C980 F8EC8287 */  lh         $v0, %gp_rel(HUD_Position)($gp)
/* 6D184 8007C984 00000000 */  nop
/* 6D188 8007C988 19FC4228 */  slti       $v0, $v0, -0x3E7
/* 6D18C 8007C98C 7E004014 */  bnez       $v0, .L8007CB88
/* 6D190 8007C990 00000000 */   nop
/* 6D194 8007C994 F8A48287 */  lh         $v0, %gp_rel(HUD_Captured)($gp)
/* 6D198 8007C998 00000000 */  nop
/* 6D19C 8007C99C 3B004010 */  beqz       $v0, .L8007CA8C
/* 6D1A0 8007C9A0 06000224 */   addiu     $v0, $zero, 0x6
/* 6D1A4 8007C9A4 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 6D1A8 8007C9A8 00000000 */  nop
/* 6D1AC 8007C9AC 37006210 */  beq        $v1, $v0, .L8007CA8C
/* 6D1B0 8007C9B0 00040224 */   addiu     $v0, $zero, 0x400
/* 6D1B4 8007C9B4 4800A2A7 */  sh         $v0, 0x48($sp)
/* 6D1B8 8007C9B8 00FA0224 */  addiu      $v0, $zero, -0x600
/* 6D1BC 8007C9BC 3800A2A7 */  sh         $v0, 0x38($sp)
/* 6D1C0 8007C9C0 FCEC8287 */  lh         $v0, %gp_rel(HUD_State)($gp)
/* 6D1C4 8007C9C4 000A0324 */  addiu      $v1, $zero, 0xA00
/* 6D1C8 8007C9C8 4A00A0A7 */  sh         $zero, 0x4A($sp)
/* 6D1CC 8007C9CC 4C00A0A7 */  sh         $zero, 0x4C($sp)
/* 6D1D0 8007C9D0 04004228 */  slti       $v0, $v0, 0x4
/* 6D1D4 8007C9D4 03004010 */  beqz       $v0, .L8007C9E4
/* 6D1D8 8007C9D8 3C00A3A7 */   sh        $v1, 0x3C($sp)
/* 6D1DC 8007C9DC 7AF20108 */  j          .L8007C9E8
/* 6D1E0 8007C9E0 20010224 */   addiu     $v0, $zero, 0x120
.L8007C9E4:
/* 6D1E4 8007C9E4 60020224 */  addiu      $v0, $zero, 0x260
.L8007C9E8:
/* 6D1E8 8007C9E8 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 6D1EC 8007C9EC 01000424 */  addiu      $a0, $zero, 0x1
/* 6D1F0 8007C9F0 00ED8527 */  addiu      $a1, $gp, %gp_rel(HUD_Cap_Pos)
/* 6D1F4 8007C9F4 3800A627 */  addiu      $a2, $sp, 0x38
/* 6D1F8 8007C9F8 08ED8727 */  addiu      $a3, $gp, %gp_rel(HUD_Cap_Vel)
/* 6D1FC 8007C9FC 4000A227 */  addiu      $v0, $sp, 0x40
/* 6D200 8007CA00 1000A2AF */  sw         $v0, 0x10($sp)
/* 6D204 8007CA04 80000224 */  addiu      $v0, $zero, 0x80
/* 6D208 8007CA08 CD5C000C */  jal        CriticalDampPosition
/* 6D20C 8007CA0C 1400A2AF */   sw        $v0, 0x14($sp)
/* 6D210 8007CA10 08ED8287 */  lh         $v0, %gp_rel(HUD_Cap_Vel)($gp)
/* 6D214 8007CA14 00000000 */  nop
/* 6D218 8007CA18 14004014 */  bnez       $v0, .L8007CA6C
/* 6D21C 8007CA1C 21280000 */   addu      $a1, $zero, $zero
/* 6D220 8007CA20 0AED8287 */  lh         $v0, %gp_rel(HUD_Cap_Vel + 0x2)($gp)
/* 6D224 8007CA24 00000000 */  nop
/* 6D228 8007CA28 11004014 */  bnez       $v0, .L8007CA70
/* 6D22C 8007CA2C 4800A627 */   addiu     $a2, $sp, 0x48
/* 6D230 8007CA30 0CED8287 */  lh         $v0, %gp_rel(HUD_Cap_Vel + 0x4)($gp)
/* 6D234 8007CA34 00000000 */  nop
/* 6D238 8007CA38 0D004014 */  bnez       $v0, .L8007CA70
/* 6D23C 8007CA3C 03000224 */   addiu     $v0, $zero, 0x3
/* 6D240 8007CA40 FCEC8387 */  lh         $v1, %gp_rel(HUD_State)($gp)
/* 6D244 8007CA44 00000000 */  nop
/* 6D248 8007CA48 03006214 */  bne        $v1, $v0, .L8007CA58
/* 6D24C 8007CA4C 04000224 */   addiu     $v0, $zero, 0x4
/* 6D250 8007CA50 99F20108 */  j          .L8007CA64
/* 6D254 8007CA54 04000224 */   addiu     $v0, $zero, 0x4
.L8007CA58:
/* 6D258 8007CA58 04006214 */  bne        $v1, $v0, .L8007CA6C
/* 6D25C 8007CA5C 21280000 */   addu      $a1, $zero, $zero
/* 6D260 8007CA60 05000224 */  addiu      $v0, $zero, 0x5
.L8007CA64:
/* 6D264 8007CA64 FCEC82A7 */  sh         $v0, %gp_rel(HUD_State)($gp)
/* 6D268 8007CA68 21280000 */  addu       $a1, $zero, $zero
.L8007CA6C:
/* 6D26C 8007CA6C 4800A627 */  addiu      $a2, $sp, 0x48
.L8007CA70:
/* 6D270 8007CA70 00ED8727 */  addiu      $a3, $gp, %gp_rel(HUD_Cap_Pos)
/* 6D274 8007CA74 0D80023C */  lui        $v0, %hi(objectAccess + 0xAC)
/* 6D278 8007CA78 E8A2448C */  lw         $a0, %lo(objectAccess + 0xAC)($v0)
/* 6D27C 8007CA7C 2800A227 */  addiu      $v0, $sp, 0x28
/* 6D280 8007CA80 1000A2AF */  sw         $v0, 0x10($sp)
/* 6D284 8007CA84 5838010C */  jal        FX_DrawModel
/* 6D288 8007CA88 1400A0AF */   sw        $zero, 0x14($sp)
.L8007CA8C:
/* 6D28C 8007CA8C F4EC8397 */  lhu        $v1, %gp_rel(HUD_Rotation)($gp)
/* 6D290 8007CA90 00040224 */  addiu      $v0, $zero, 0x400
/* 6D294 8007CA94 1800A2A7 */  sh         $v0, 0x18($sp)
/* 6D298 8007CA98 60020224 */  addiu      $v0, $zero, 0x260
/* 6D29C 8007CA9C 2200A2A7 */  sh         $v0, 0x22($sp)
/* 6D2A0 8007CAA0 000A0224 */  addiu      $v0, $zero, 0xA00
/* 6D2A4 8007CAA4 2400A2A7 */  sh         $v0, 0x24($sp)
/* 6D2A8 8007CAA8 F8EC8297 */  lhu        $v0, %gp_rel(HUD_Position)($gp)
/* 6D2AC 8007CAAC 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 6D2B0 8007CAB0 2C00A0A7 */  sh         $zero, 0x2C($sp)
/* 6D2B4 8007CAB4 1C00A3A7 */  sh         $v1, 0x1C($sp)
/* 6D2B8 8007CAB8 E2EC8387 */  lh         $v1, %gp_rel(HUD_Count)($gp)
/* 6D2BC 8007CABC 00FA4224 */  addiu      $v0, $v0, -0x600
/* 6D2C0 8007CAC0 06006014 */  bnez       $v1, .L8007CADC
/* 6D2C4 8007CAC4 2000A2A7 */   sh        $v0, 0x20($sp)
/* 6D2C8 8007CAC8 E4EC8287 */  lh         $v0, %gp_rel(HUD_Count_Overall)($gp)
/* 6D2CC 8007CACC 00000000 */  nop
/* 6D2D0 8007CAD0 0F004228 */  slti       $v0, $v0, 0xF
/* 6D2D4 8007CAD4 2C004010 */  beqz       $v0, .L8007CB88
/* 6D2D8 8007CAD8 00000000 */   nop
.L8007CADC:
/* 6D2DC 8007CADC 21800000 */  addu       $s0, $zero, $zero
/* 6D2E0 8007CAE0 0D80023C */  lui        $v0, %hi(objectAccess)
/* 6D2E4 8007CAE4 3CA25224 */  addiu      $s2, $v0, %lo(objectAccess)
/* 6D2E8 8007CAE8 0180023C */  lui        $v0, %hi(jtbl_80011E70)
/* 6D2EC 8007CAEC 701E5124 */  addiu      $s1, $v0, %lo(jtbl_80011E70)
/* 6D2F0 8007CAF0 0500022E */  sltiu      $v0, $s0, 0x5
.L8007CAF4:
/* 6D2F4 8007CAF4 10004010 */  beqz       $v0, .L8007CB38
/* 6D2F8 8007CAF8 21280000 */   addu      $a1, $zero, $zero
/* 6D2FC 8007CAFC 0000228E */  lw         $v0, 0x0($s1)
/* 6D300 8007CB00 00000000 */  nop
/* 6D304 8007CB04 08004000 */  jr         $v0
/* 6D308 8007CB08 00000000 */   nop
jlabel .L8007CB0C
/* 6D30C 8007CB0C CDF20108 */  j          .L8007CB34
/* 6D310 8007CB10 1C00A0A7 */   sh        $zero, 0x1C($sp)
jlabel .L8007CB14
/* 6D314 8007CB14 CCF20108 */  j          .L8007CB30
/* 6D318 8007CB18 CD0C0224 */   addiu     $v0, $zero, 0xCCD
jlabel .L8007CB1C
/* 6D31C 8007CB1C CCF20108 */  j          .L8007CB30
/* 6D320 8007CB20 9A090224 */   addiu     $v0, $zero, 0x99A
jlabel .L8007CB24
/* 6D324 8007CB24 CCF20108 */  j          .L8007CB30
/* 6D328 8007CB28 66060224 */   addiu     $v0, $zero, 0x666
jlabel .L8007CB2C
/* 6D32C 8007CB2C 33030224 */  addiu      $v0, $zero, 0x333
.L8007CB30:
/* 6D330 8007CB30 1C00A2A7 */  sh         $v0, 0x1C($sp)
.L8007CB34:
/* 6D334 8007CB34 21280000 */  addu       $a1, $zero, $zero
.L8007CB38:
/* 6D338 8007CB38 1800A627 */  addiu      $a2, $sp, 0x18
/* 6D33C 8007CB3C 2000A727 */  addiu      $a3, $sp, 0x20
/* 6D340 8007CB40 04003126 */  addiu      $s1, $s1, 0x4
/* 6D344 8007CB44 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 6D348 8007CB48 F4EC8397 */  lhu        $v1, %gp_rel(HUD_Rotation)($gp)
/* 6D34C 8007CB4C C400448E */  lw         $a0, 0xC4($s2)
/* 6D350 8007CB50 23104300 */  subu       $v0, $v0, $v1
/* 6D354 8007CB54 E2EC8387 */  lh         $v1, %gp_rel(HUD_Count)($gp)
/* 6D358 8007CB58 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 6D35C 8007CB5C 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 6D360 8007CB60 2800A227 */  addiu      $v0, $sp, 0x28
/* 6D364 8007CB64 1000A2AF */  sw         $v0, 0x10($sp)
/* 6D368 8007CB68 2A180302 */  slt        $v1, $s0, $v1
/* 6D36C 8007CB6C 01006338 */  xori       $v1, $v1, 0x1
/* 6D370 8007CB70 5838010C */  jal        FX_DrawModel
/* 6D374 8007CB74 1400A3AF */   sw        $v1, 0x14($sp)
/* 6D378 8007CB78 01001026 */  addiu      $s0, $s0, 0x1
/* 6D37C 8007CB7C 0500022A */  slti       $v0, $s0, 0x5
/* 6D380 8007CB80 DCFF4014 */  bnez       $v0, .L8007CAF4
/* 6D384 8007CB84 0500022E */   sltiu     $v0, $s0, 0x5
.L8007CB88:
/* 6D388 8007CB88 6000BF8F */  lw         $ra, 0x60($sp)
/* 6D38C 8007CB8C 5C00B38F */  lw         $s3, 0x5C($sp)
/* 6D390 8007CB90 5800B28F */  lw         $s2, 0x58($sp)
/* 6D394 8007CB94 5400B18F */  lw         $s1, 0x54($sp)
/* 6D398 8007CB98 5000B08F */  lw         $s0, 0x50($sp)
/* 6D39C 8007CB9C 0800E003 */  jr         $ra
/* 6D3A0 8007CBA0 6800BD27 */   addiu     $sp, $sp, 0x68
.size HUD_Draw, . - HUD_Draw
