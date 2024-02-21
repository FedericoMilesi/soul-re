.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_DisplayFrame
/* 1FF5C 8002F75C A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 1FF60 8002F760 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 1FF64 8002F764 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 1FF68 8002F768 5C00BFAF */  sw         $ra, 0x5C($sp)
/* 1FF6C 8002F76C 5800BEAF */  sw         $fp, 0x58($sp)
/* 1FF70 8002F770 5400B7AF */  sw         $s7, 0x54($sp)
/* 1FF74 8002F774 5000B6AF */  sw         $s6, 0x50($sp)
/* 1FF78 8002F778 4C00B5AF */  sw         $s5, 0x4C($sp)
/* 1FF7C 8002F77C 4800B4AF */  sw         $s4, 0x48($sp)
/* 1FF80 8002F780 4400B3AF */  sw         $s3, 0x44($sp)
/* 1FF84 8002F784 4000B2AF */  sw         $s2, 0x40($sp)
/* 1FF88 8002F788 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 1FF8C 8002F78C 3800B0AF */  sw         $s0, 0x38($sp)
/* 1FF90 8002F790 6000A4AF */  sw         $a0, 0x60($sp)
/* 1FF94 8002F794 D401888C */  lw         $t0, 0x1D4($a0)
/* 1FF98 8002F798 24104300 */  and        $v0, $v0, $v1
/* 1FF9C 8002F79C 05004010 */  beqz       $v0, .L8002F7B4
/* 1FFA0 8002F7A0 2000A8AF */   sw        $t0, 0x20($sp)
/* 1FFA4 8002F7A4 3CBA8287 */  lh         $v0, %gp_rel(pause_redraw_flag)($gp)
/* 1FFA8 8002F7A8 00000000 */  nop
/* 1FFAC 8002F7AC 72014010 */  beqz       $v0, .L8002FD78
/* 1FFB0 8002F7B0 00000000 */   nop
.L8002F7B4:
/* 1FFB4 8002F7B4 3CBA8287 */  lh         $v0, %gp_rel(pause_redraw_flag)($gp)
/* 1FFB8 8002F7B8 00000000 */  nop
/* 1FFBC 8002F7BC 1A004010 */  beqz       $v0, .L8002F828
/* 1FFC0 8002F7C0 21200000 */   addu      $a0, $zero, $zero
/* 1FFC4 8002F7C4 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1FFC8 8002F7C8 00000000 */  nop
/* 1FFCC 8002F7CC 0400428C */  lw         $v0, 0x4($v0)
/* 1FFD0 8002F7D0 0FE9020C */  jal        DrawSync
/* 1FFD4 8002F7D4 3000A2AF */   sw        $v0, 0x30($sp)
/* 1FFD8 8002F7D8 4FC0000C */  jal        Switch_For_Redraw
/* 1FFDC 8002F7DC 00000000 */   nop
/* 1FFE0 8002F7E0 6000A88F */  lw         $t0, 0x60($sp)
/* 1FFE4 8002F7E4 9CBF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 1FFE8 8002F7E8 D401088D */  lw         $t0, 0x1D4($t0)
/* 1FFEC 8002F7EC 000C0524 */  addiu      $a1, $zero, 0xC00
/* 1FFF0 8002F7F0 DAE9020C */  jal        ClearOTagR
/* 1FFF4 8002F7F4 2000A8AF */   sw        $t0, 0x20($sp)
/* 1FFF8 8002F7F8 40BA838F */  lw         $v1, %gp_rel(pause_redraw_prim)($gp)
/* 1FFFC 8002F7FC 00000000 */  nop
/* 20000 8002F800 04006010 */  beqz       $v1, .L8002F814
/* 20004 8002F804 00000000 */   nop
/* 20008 8002F808 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 2000C 8002F80C 0FBE0008 */  j          .L8002F83C
/* 20010 8002F810 040043AC */   sw        $v1, 0x4($v0)
.L8002F814:
/* 20014 8002F814 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 20018 8002F818 00000000 */  nop
/* 2001C 8002F81C 0C006224 */  addiu      $v0, $v1, 0xC
/* 20020 8002F820 0FBE0008 */  j          .L8002F83C
/* 20024 8002F824 040062AC */   sw        $v0, 0x4($v1)
.L8002F828:
/* 20028 8002F828 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 2002C 8002F82C 00000000 */  nop
/* 20030 8002F830 0400428C */  lw         $v0, 0x4($v0)
/* 20034 8002F834 00000000 */  nop
/* 20038 8002F838 40BA82AF */  sw         $v0, %gp_rel(pause_redraw_prim)($gp)
.L8002F83C:
/* 2003C 8002F83C F0BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x128)($gp)
/* 20040 8002F840 C8BD8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX)
/* 20044 8002F844 24C080AF */  sw         $zero, %gp_rel(gameTrackerX + 0x25C)($gp)
/* 20048 8002F848 01004224 */  addiu      $v0, $v0, 0x1
/* 2004C 8002F84C F0BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x128)($gp)
/* 20050 8002F850 A0BD000C */  jal        GAMELOOP_SetupRenderFunction
/* 20054 8002F854 00000000 */   nop
/* 20058 8002F858 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 2005C 8002F85C 00000000 */  nop
/* 20060 8002F860 04004294 */  lhu        $v0, 0x4($v0)
/* 20064 8002F864 00000000 */  nop
/* 20068 8002F868 01004230 */  andi       $v0, $v0, 0x1
/* 2006C 8002F86C 14004014 */  bnez       $v0, .L8002F8C0
/* 20070 8002F870 0B000224 */   addiu     $v0, $zero, 0xB
/* 20074 8002F874 6000A88F */  lw         $t0, 0x60($sp)
/* 20078 8002F878 00000000 */  nop
/* 2007C 8002F87C D0000385 */  lh         $v1, 0xD0($t0)
/* 20080 8002F880 00000000 */  nop
/* 20084 8002F884 05006214 */  bne        $v1, $v0, .L8002F89C
/* 20088 8002F888 00000000 */   nop
/* 2008C 8002F88C CC000285 */  lh         $v0, 0xCC($t0)
/* 20090 8002F890 00000000 */  nop
/* 20094 8002F894 0A004014 */  bnez       $v0, .L8002F8C0
/* 20098 8002F898 00000000 */   nop
.L8002F89C:
/* 2009C 8002F89C C400028D */  lw         $v0, 0xC4($t0)
/* 200A0 8002F8A0 00000000 */  nop
/* 200A4 8002F8A4 00084230 */  andi       $v0, $v0, 0x800
/* 200A8 8002F8A8 05004010 */  beqz       $v0, .L8002F8C0
/* 200AC 8002F8AC 00000000 */   nop
/* 200B0 8002F8B0 08BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 200B4 8002F8B4 2000A58F */  lw         $a1, 0x20($sp)
/* 200B8 8002F8B8 ED36010C */  jal        FX_Spiral
/* 200BC 8002F8BC 00000000 */   nop
.L8002F8C0:
/* 200C0 8002F8C0 3CBA8287 */  lh         $v0, %gp_rel(pause_redraw_flag)($gp)
/* 200C4 8002F8C4 00000000 */  nop
/* 200C8 8002F8C8 03004014 */  bnez       $v0, .L8002F8D8
/* 200CC 8002F8CC 00000000 */   nop
/* 200D0 8002F8D0 BCF1010C */  jal        HUD_Draw
/* 200D4 8002F8D4 00000000 */   nop
.L8002F8D8:
/* 200D8 8002F8D8 A7BD000C */  jal        GAMELOOP_GetMainRenderUnit
/* 200DC 8002F8DC 00000000 */   nop
/* 200E0 8002F8E0 6000A88F */  lw         $t0, 0x60($sp)
/* 200E4 8002F8E4 21F04000 */  addu       $fp, $v0, $zero
/* 200E8 8002F8E8 C000038D */  lw         $v1, 0xC0($t0)
/* 200EC 8002F8EC 0800C88F */  lw         $t0, 0x8($fp)
/* 200F0 8002F8F0 04006330 */  andi       $v1, $v1, 0x4
/* 200F4 8002F8F4 05006010 */  beqz       $v1, .L8002F90C
/* 200F8 8002F8F8 2400A8AF */   sw        $t0, 0x24($sp)
/* 200FC 8002F8FC 9800058D */  lw         $a1, 0x98($t0)
/* 20100 8002F900 0D80043C */  lui        $a0, %hi(D_800D0780)
/* 20104 8002F904 C3B5000C */  jal        FONT_Print
/* 20108 8002F908 80078424 */   addiu     $a0, $a0, %lo(D_800D0780)
.L8002F90C:
/* 2010C 8002F90C 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 20110 8002F910 0000C297 */  lhu        $v0, 0x0($fp)
/* 20114 8002F914 40010324 */  addiu      $v1, $zero, 0x140
/* 20118 8002F918 34AD83AF */  sw         $v1, %gp_rel(theCamera + 0xA4)($gp)
/* 2011C 8002F91C F0000324 */  addiu      $v1, $zero, 0xF0
/* 20120 8002F920 30AD80AF */  sw         $zero, %gp_rel(theCamera + 0xA0)($gp)
/* 20124 8002F924 38AD80AF */  sw         $zero, %gp_rel(theCamera + 0xA8)($gp)
/* 20128 8002F928 3CAD83AF */  sw         $v1, %gp_rel(theCamera + 0xAC)($gp)
/* 2012C 8002F92C 4CBA82A7 */  sh         $v0, %gp_rel(RENDER_currentStreamUnitID)($gp)
/* 20130 8002F930 C053000C */  jal        CAMERA_SetViewVolume
/* 20134 8002F934 00000000 */   nop
/* 20138 8002F938 2400A48F */  lw         $a0, 0x24($sp)
/* 2013C 8002F93C B841010C */  jal        MEMPACK_MemoryValidFunc
/* 20140 8002F940 00000000 */   nop
/* 20144 8002F944 13004010 */  beqz       $v0, .L8002F994
/* 20148 8002F948 00000000 */   nop
/* 2014C 8002F94C 2400A88F */  lw         $t0, 0x24($sp)
/* 20150 8002F950 00000000 */  nop
/* 20154 8002F954 44000395 */  lhu        $v1, 0x44($t0)
/* 20158 8002F958 F4AC828F */  lw         $v0, %gp_rel(theCamera + 0x64)($gp)
/* 2015C 8002F95C 00000000 */  nop
/* 20160 8002F960 02006210 */  beq        $v1, $v0, .L8002F96C
/* 20164 8002F964 00000000 */   nop
/* 20168 8002F968 F4AC83AF */  sw         $v1, %gp_rel(theCamera + 0x64)($gp)
.L8002F96C:
/* 2016C 8002F96C 6000A88F */  lw         $t0, 0x60($sp)
/* 20170 8002F970 00000000 */  nop
/* 20174 8002F974 C000028D */  lw         $v0, 0xC0($t0)
/* 20178 8002F978 00000000 */  nop
/* 2017C 8002F97C 00804230 */  andi       $v0, $v0, 0x8000
/* 20180 8002F980 04004014 */  bnez       $v0, .L8002F994
/* 20184 8002F984 00000000 */   nop
/* 20188 8002F988 2000A58F */  lw         $a1, 0x20($sp)
/* 2018C 8002F98C 07BB000C */  jal        MainRenderLevel
/* 20190 8002F990 2120C003 */   addu      $a0, $fp, $zero
.L8002F994:
/* 20194 8002F994 2400A88F */  lw         $t0, 0x24($sp)
/* 20198 8002F998 00000000 */  nop
/* 2019C 8002F99C 0000028D */  lw         $v0, 0x0($t0)
/* 201A0 8002F9A0 00000000 */  nop
/* 201A4 8002F9A4 3000428C */  lw         $v0, 0x30($v0)
/* 201A8 8002F9A8 00000000 */  nop
/* 201AC 8002F9AC 0000488C */  lw         $t0, 0x0($v0)
/* 201B0 8002F9B0 00000000 */  nop
/* 201B4 8002F9B4 2C00A8AF */  sw         $t0, 0x2C($sp)
/* 201B8 8002F9B8 04004824 */  addiu      $t0, $v0, 0x4
/* 201BC 8002F9BC 2800A8AF */  sw         $t0, 0x28($sp)
/* 201C0 8002F9C0 2C00A88F */  lw         $t0, 0x2C($sp)
/* 201C4 8002F9C4 00000000 */  nop
/* 201C8 8002F9C8 B9000019 */  blez       $t0, .L8002FCB0
/* 201CC 8002F9CC 21B00000 */   addu      $s6, $zero, $zero
/* 201D0 8002F9D0 22005724 */  addiu      $s7, $v0, 0x22
.L8002F9D4:
/* 201D4 8002F9D4 F6FFE88E */  lw         $t0, -0xA($s7)
/* 201D8 8002F9D8 0A00F38E */  lw         $s3, 0xA($s7)
/* 201DC 8002F9DC 00000000 */  nop
/* 201E0 8002F9E0 06006012 */  beqz       $s3, .L8002F9FC
/* 201E4 8002F9E4 3400A8AF */   sw        $t0, 0x34($sp)
/* 201E8 8002F9E8 2000638E */  lw         $v1, 0x20($s3)
/* 201EC 8002F9EC F0BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x128)($gp)
/* 201F0 8002F9F0 00000000 */  nop
/* 201F4 8002F9F4 A5006210 */  beq        $v1, $v0, .L8002FC8C
/* 201F8 8002F9F8 00000000 */   nop
.L8002F9FC:
/* 201FC 8002F9FC 30AD8827 */  addiu      $t0, $gp, %gp_rel(theCamera + 0xA0)
/* 20200 8002FA00 00020224 */  addiu      $v0, $zero, 0x200
/* 20204 8002FA04 1800A2A7 */  sh         $v0, 0x18($sp)
/* 20208 8002FA08 F0000224 */  addiu      $v0, $zero, 0xF0
/* 2020C 8002FA0C 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 20210 8002FA10 00FE0224 */  addiu      $v0, $zero, -0x200
/* 20214 8002FA14 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 20218 8002FA18 10FF0224 */  addiu      $v0, $zero, -0xF0
/* 2021C 8002FA1C 1E00A2A7 */  sh         $v0, 0x1E($sp)
/* 20220 8002FA20 40010224 */  addiu      $v0, $zero, 0x140
/* 20224 8002FA24 34AD82AF */  sw         $v0, %gp_rel(theCamera + 0xA4)($gp)
/* 20228 8002FA28 F0000224 */  addiu      $v0, $zero, 0xF0
/* 2022C 8002FA2C 30AD80AF */  sw         $zero, %gp_rel(theCamera + 0xA0)($gp)
/* 20230 8002FA30 38AD80AF */  sw         $zero, %gp_rel(theCamera + 0xA8)($gp)
/* 20234 8002FA34 3CAD82AF */  sw         $v0, %gp_rel(theCamera + 0xAC)($gp)
/* 20238 8002FA38 C053000C */  jal        CAMERA_SetViewVolume
/* 2023C 8002FA3C 60FF0425 */   addiu     $a0, $t0, -0xA0
/* 20240 8002FA40 2400A88F */  lw         $t0, 0x24($sp)
/* 20244 8002FA44 21A80000 */  addu       $s5, $zero, $zero
/* 20248 8002FA48 0000028D */  lw         $v0, 0x0($t0)
/* 2024C 8002FA4C 2190A002 */  addu       $s2, $s5, $zero
/* 20250 8002FA50 3000428C */  lw         $v0, 0x30($v0)
/* 20254 8002FA54 2C00A88F */  lw         $t0, 0x2C($sp)
/* 20258 8002FA58 00000000 */  nop
/* 2025C 8002FA5C 31000019 */  blez       $t0, .L8002FB24
/* 20260 8002FA60 04005424 */   addiu     $s4, $v0, 0x4
/* 20264 8002FA64 2C005124 */  addiu      $s1, $v0, 0x2C
.L8002FA68:
/* 20268 8002FA68 ECFF228E */  lw         $v0, -0x14($s1)
/* 2026C 8002FA6C 3400A88F */  lw         $t0, 0x34($sp)
/* 20270 8002FA70 00000000 */  nop
/* 20274 8002FA74 24004814 */  bne        $v0, $t0, .L8002FB08
/* 20278 8002FA78 21208002 */   addu      $a0, $s4, $zero
/* 2027C 8002FA7C 7C7A010C */  jal        STREAM_GetClipRect
/* 20280 8002FA80 1800A527 */   addiu     $a1, $sp, 0x18
/* 20284 8002FA84 03004010 */  beqz       $v0, .L8002FA94
/* 20288 8002FA88 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 2028C 8002FA8C C2BE0008 */  j          .L8002FB08
/* 20290 8002FA90 01001224 */   addiu     $s2, $zero, 0x1
.L8002FA94:
/* 20294 8002FA94 2CB1828F */  lw         $v0, %gp_rel(theCamera + 0x49C)($gp)
/* 20298 8002FA98 00000000 */  nop
/* 2029C 8002FA9C 24104300 */  and        $v0, $v0, $v1
/* 202A0 8002FAA0 19004010 */  beqz       $v0, .L8002FB08
/* 202A4 8002FAA4 00000000 */   nop
/* 202A8 8002FAA8 0000228E */  lw         $v0, 0x0($s1)
/* 202AC 8002FAAC F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 202B0 8002FAB0 0000508C */  lw         $s0, 0x0($v0)
/* 202B4 8002FAB4 92D1000C */  jal        INSTANCE_Query
/* 202B8 8002FAB8 22000524 */   addiu     $a1, $zero, 0x22
/* 202BC 8002FABC F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 202C0 8002FAC0 00000000 */  nop
/* 202C4 8002FAC4 3800638C */  lw         $v1, 0x38($v1)
/* 202C8 8002FAC8 00000000 */  nop
/* 202CC 8002FACC 07000312 */  beq        $s0, $v1, .L8002FAEC
/* 202D0 8002FAD0 00000000 */   nop
/* 202D4 8002FAD4 0C004010 */  beqz       $v0, .L8002FB08
/* 202D8 8002FAD8 00000000 */   nop
/* 202DC 8002FADC 3800428C */  lw         $v0, 0x38($v0)
/* 202E0 8002FAE0 00000000 */  nop
/* 202E4 8002FAE4 08000216 */  bne        $s0, $v0, .L8002FB08
/* 202E8 8002FAE8 00000000 */   nop
.L8002FAEC:
/* 202EC 8002FAEC 01001224 */  addiu      $s2, $zero, 0x1
/* 202F0 8002FAF0 00020224 */  addiu      $v0, $zero, 0x200
/* 202F4 8002FAF4 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 202F8 8002FAF8 F0000224 */  addiu      $v0, $zero, 0xF0
/* 202FC 8002FAFC 1800A0A7 */  sh         $zero, 0x18($sp)
/* 20300 8002FB00 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 20304 8002FB04 1E00A2A7 */  sh         $v0, 0x1E($sp)
.L8002FB08:
/* 20308 8002FB08 0100B526 */  addiu      $s5, $s5, 0x1
/* 2030C 8002FB0C 5C003126 */  addiu      $s1, $s1, 0x5C
/* 20310 8002FB10 2C00A88F */  lw         $t0, 0x2C($sp)
/* 20314 8002FB14 00000000 */  nop
/* 20318 8002FB18 2A10A802 */  slt        $v0, $s5, $t0
/* 2031C 8002FB1C D2FF4014 */  bnez       $v0, .L8002FA68
/* 20320 8002FB20 5C009426 */   addiu     $s4, $s4, 0x5C
.L8002FB24:
/* 20324 8002FB24 4F004012 */  beqz       $s2, .L8002FC64
/* 20328 8002FB28 00000000 */   nop
/* 2032C 8002FB2C 1800A487 */  lh         $a0, 0x18($sp)
/* 20330 8002FB30 00000000 */  nop
/* 20334 8002FB34 80100400 */  sll        $v0, $a0, 2
/* 20338 8002FB38 21104400 */  addu       $v0, $v0, $a0
/* 2033C 8002FB3C 80190200 */  sll        $v1, $v0, 6
/* 20340 8002FB40 02006104 */  bgez       $v1, .L8002FB4C
/* 20344 8002FB44 00000000 */   nop
/* 20348 8002FB48 FF016324 */  addiu      $v1, $v1, 0x1FF
.L8002FB4C:
/* 2034C 8002FB4C 1C00A287 */  lh         $v0, 0x1C($sp)
/* 20350 8002FB50 1A00A587 */  lh         $a1, 0x1A($sp)
/* 20354 8002FB54 431A0300 */  sra        $v1, $v1, 9
/* 20358 8002FB58 30AD83AF */  sw         $v1, %gp_rel(theCamera + 0xA0)($gp)
/* 2035C 8002FB5C 21108200 */  addu       $v0, $a0, $v0
/* 20360 8002FB60 80180200 */  sll        $v1, $v0, 2
/* 20364 8002FB64 21186200 */  addu       $v1, $v1, $v0
/* 20368 8002FB68 80110300 */  sll        $v0, $v1, 6
/* 2036C 8002FB6C 38AD85AF */  sw         $a1, %gp_rel(theCamera + 0xA8)($gp)
/* 20370 8002FB70 02004104 */  bgez       $v0, .L8002FB7C
/* 20374 8002FB74 00000000 */   nop
/* 20378 8002FB78 FF014224 */  addiu      $v0, $v0, 0x1FF
.L8002FB7C:
/* 2037C 8002FB7C 30AD8827 */  addiu      $t0, $gp, %gp_rel(theCamera + 0xA0)
/* 20380 8002FB80 1E00A387 */  lh         $v1, 0x1E($sp)
/* 20384 8002FB84 43120200 */  sra        $v0, $v0, 9
/* 20388 8002FB88 34AD82AF */  sw         $v0, %gp_rel(theCamera + 0xA4)($gp)
/* 2038C 8002FB8C 2118A300 */  addu       $v1, $a1, $v1
/* 20390 8002FB90 3CAD83AF */  sw         $v1, %gp_rel(theCamera + 0xAC)($gp)
/* 20394 8002FB94 C053000C */  jal        CAMERA_SetViewVolume
/* 20398 8002FB98 60FF0425 */   addiu     $a0, $t0, -0xA0
/* 2039C 8002FB9C F0AC848F */  lw         $a0, %gp_rel(theCamera + 0x60)($gp)
/* 203A0 8002FBA0 52F2020C */  jal        SetRotMatrix
/* 203A4 8002FBA4 00000000 */   nop
/* 203A8 8002FBA8 F0AC848F */  lw         $a0, %gp_rel(theCamera + 0x60)($gp)
/* 203AC 8002FBAC 4AF2020C */  jal        SetTransMatrix
/* 203B0 8002FBB0 00000000 */   nop
/* 203B4 8002FBB4 0000E296 */  lhu        $v0, 0x0($s7)
/* 203B8 8002FBB8 00000000 */  nop
/* 203BC 8002FBBC 01004230 */  andi       $v0, $v0, 0x1
/* 203C0 8002FBC0 18004010 */  beqz       $v0, .L8002FC24
/* 203C4 8002FBC4 00000000 */   nop
/* 203C8 8002FBC8 0600C297 */  lhu        $v0, 0x6($fp)
/* 203CC 8002FBCC 00000000 */  nop
/* 203D0 8002FBD0 08004230 */  andi       $v0, $v0, 0x8
/* 203D4 8002FBD4 0F004010 */  beqz       $v0, .L8002FC14
/* 203D8 8002FBD8 00000000 */   nop
/* 203DC 8002FBDC 07006012 */  beqz       $s3, .L8002FBFC
/* 203E0 8002FBE0 2130C003 */   addu      $a2, $fp, $zero
/* 203E4 8002FBE4 2000628E */  lw         $v0, 0x20($s3)
/* 203E8 8002FBE8 F0BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x128)($gp)
/* 203EC 8002FBEC 00000000 */  nop
/* 203F0 8002FBF0 26004310 */  beq        $v0, $v1, .L8002FC8C
/* 203F4 8002FBF4 00000000 */   nop
/* 203F8 8002FBF8 200063AE */  sw         $v1, 0x20($s3)
.L8002FBFC:
/* 203FC 8002FBFC 2000A48F */  lw         $a0, 0x20($sp)
/* 20400 8002FC00 2800A58F */  lw         $a1, 0x28($sp)
/* 20404 8002FC04 9D7D010C */  jal        STREAM_RenderWarpGate
/* 20408 8002FC08 1800A727 */   addiu     $a3, $sp, 0x18
/* 2040C 8002FC0C 23BF0008 */  j          .L8002FC8C
/* 20410 8002FC10 00000000 */   nop
.L8002FC14:
/* 20414 8002FC14 4F6D010C */  jal        WARPGATE_IsItActive
/* 20418 8002FC18 2120C003 */   addu      $a0, $fp, $zero
/* 2041C 8002FC1C 23BF0008 */  j          .L8002FC8C
/* 20420 8002FC20 00000000 */   nop
.L8002FC24:
/* 20424 8002FC24 19006012 */  beqz       $s3, .L8002FC8C
/* 20428 8002FC28 00000000 */   nop
/* 2042C 8002FC2C 2000628E */  lw         $v0, 0x20($s3)
/* 20430 8002FC30 F0BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x128)($gp)
/* 20434 8002FC34 00000000 */  nop
/* 20438 8002FC38 14004310 */  beq        $v0, $v1, .L8002FC8C
/* 2043C 8002FC3C 21306002 */   addu      $a2, $s3, $zero
/* 20440 8002FC40 2138C003 */  addu       $a3, $fp, $zero
/* 20444 8002FC44 2000A48F */  lw         $a0, 0x20($sp)
/* 20448 8002FC48 2800A58F */  lw         $a1, 0x28($sp)
/* 2044C 8002FC4C 1800A227 */  addiu      $v0, $sp, 0x18
/* 20450 8002FC50 2000C3AC */  sw         $v1, 0x20($a2)
/* 20454 8002FC54 F27C010C */  jal        STREAM_RenderAdjacantUnit
/* 20458 8002FC58 1000A2AF */   sw        $v0, 0x10($sp)
/* 2045C 8002FC5C 23BF0008 */  j          .L8002FC8C
/* 20460 8002FC60 00000000 */   nop
.L8002FC64:
/* 20464 8002FC64 09006012 */  beqz       $s3, .L8002FC8C
/* 20468 8002FC68 00000000 */   nop
/* 2046C 8002FC6C 2000628E */  lw         $v0, 0x20($s3)
/* 20470 8002FC70 F0BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x128)($gp)
/* 20474 8002FC74 00000000 */  nop
/* 20478 8002FC78 04004310 */  beq        $v0, $v1, .L8002FC8C
/* 2047C 8002FC7C 00000000 */   nop
/* 20480 8002FC80 200063AE */  sw         $v1, 0x20($s3)
/* 20484 8002FC84 47BC000C */  jal        StreamIntroInstancesForUnit
/* 20488 8002FC88 21206002 */   addu      $a0, $s3, $zero
.L8002FC8C:
/* 2048C 8002FC8C 2800A88F */  lw         $t0, 0x28($sp)
/* 20490 8002FC90 0100D626 */  addiu      $s6, $s6, 0x1
/* 20494 8002FC94 5C000825 */  addiu      $t0, $t0, 0x5C
/* 20498 8002FC98 2800A8AF */  sw         $t0, 0x28($sp)
/* 2049C 8002FC9C 2C00A88F */  lw         $t0, 0x2C($sp)
/* 204A0 8002FCA0 00000000 */  nop
/* 204A4 8002FCA4 2A10C802 */  slt        $v0, $s6, $t0
/* 204A8 8002FCA8 4AFF4014 */  bnez       $v0, .L8002F9D4
/* 204AC 8002FCAC 5C00F726 */   addiu     $s7, $s7, 0x5C
.L8002FCB0:
/* 204B0 8002FCB0 21B00000 */  addu       $s6, $zero, $zero
/* 204B4 8002FCB4 02001124 */  addiu      $s1, $zero, 0x2
/* 204B8 8002FCB8 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
.L8002FCBC:
/* 204BC 8002FCBC 04000286 */  lh         $v0, 0x4($s0)
/* 204C0 8002FCC0 00000000 */  nop
/* 204C4 8002FCC4 09005114 */  bne        $v0, $s1, .L8002FCEC
/* 204C8 8002FCC8 00000000 */   nop
/* 204CC 8002FCCC 2000028E */  lw         $v0, 0x20($s0)
/* 204D0 8002FCD0 F0BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x128)($gp)
/* 204D4 8002FCD4 00000000 */  nop
/* 204D8 8002FCD8 04004310 */  beq        $v0, $v1, .L8002FCEC
/* 204DC 8002FCDC 00000000 */   nop
/* 204E0 8002FCE0 200003AE */  sw         $v1, 0x20($s0)
/* 204E4 8002FCE4 47BC000C */  jal        StreamIntroInstancesForUnit
/* 204E8 8002FCE8 21200002 */   addu      $a0, $s0, $zero
.L8002FCEC:
/* 204EC 8002FCEC 0100D626 */  addiu      $s6, $s6, 0x1
/* 204F0 8002FCF0 1000C22A */  slti       $v0, $s6, 0x10
/* 204F4 8002FCF4 F1FF4014 */  bnez       $v0, .L8002FCBC
/* 204F8 8002FCF8 40001026 */   addiu     $s0, $s0, 0x40
/* 204FC 8002FCFC 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 20500 8002FD00 40010224 */  addiu      $v0, $zero, 0x140
/* 20504 8002FD04 34AD82AF */  sw         $v0, %gp_rel(theCamera + 0xA4)($gp)
/* 20508 8002FD08 F0000224 */  addiu      $v0, $zero, 0xF0
/* 2050C 8002FD0C 30AD80AF */  sw         $zero, %gp_rel(theCamera + 0xA0)($gp)
/* 20510 8002FD10 38AD80AF */  sw         $zero, %gp_rel(theCamera + 0xA8)($gp)
/* 20514 8002FD14 3CAD82AF */  sw         $v0, %gp_rel(theCamera + 0xAC)($gp)
/* 20518 8002FD18 C053000C */  jal        CAMERA_SetViewVolume
/* 2051C 8002FD1C 00000000 */   nop
/* 20520 8002FD20 3CBA8287 */  lh         $v0, %gp_rel(pause_redraw_flag)($gp)
/* 20524 8002FD24 00000000 */  nop
/* 20528 8002FD28 13004010 */  beqz       $v0, .L8002FD78
/* 2052C 8002FD2C 00000000 */   nop
/* 20530 8002FD30 2000A48F */  lw         $a0, 0x20($sp)
/* 20534 8002FD34 56BD000C */  jal        GAMELOOP_AddClearPrim
/* 20538 8002FD38 01000524 */   addiu     $a1, $zero, 0x1
/* 2053C 8002FD3C 72C0000C */  jal        SaveOT
/* 20540 8002FD40 00000000 */   nop
/* 20544 8002FD44 9CBF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 20548 8002FD48 DAE9020C */  jal        ClearOTagR
/* 2054C 8002FD4C 000C0524 */   addiu     $a1, $zero, 0xC00
/* 20550 8002FD50 4FC0000C */  jal        Switch_For_Redraw
/* 20554 8002FD54 00000000 */   nop
/* 20558 8002FD58 6000A88F */  lw         $t0, 0x60($sp)
/* 2055C 8002FD5C 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 20560 8002FD60 D401088D */  lw         $t0, 0x1D4($t0)
/* 20564 8002FD64 00000000 */  nop
/* 20568 8002FD68 2000A8AF */  sw         $t0, 0x20($sp)
/* 2056C 8002FD6C 3000A88F */  lw         $t0, 0x30($sp)
/* 20570 8002FD70 3CBA80A7 */  sh         $zero, %gp_rel(pause_redraw_flag)($gp)
/* 20574 8002FD74 040048AC */  sw         $t0, 0x4($v0)
.L8002FD78:
/* 20578 8002FD78 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 2057C 8002FD7C 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 20580 8002FD80 24104300 */  and        $v0, $v0, $v1
/* 20584 8002FD84 03004010 */  beqz       $v0, .L8002FD94
/* 20588 8002FD88 00000000 */   nop
/* 2058C 8002FD8C BCF1010C */  jal        HUD_Draw
/* 20590 8002FD90 00000000 */   nop
.L8002FD94:
/* 20594 8002FD94 6000A48F */  lw         $a0, 0x60($sp)
/* 20598 8002FD98 2000A58F */  lw         $a1, 0x20($sp)
/* 2059C 8002FD9C 7C4D000C */  jal        DEBUG_Draw
/* 205A0 8002FDA0 00000000 */   nop
/* 205A4 8002FDA4 18B6000C */  jal        FONT_Flush
/* 205A8 8002FDA8 00000000 */   nop
/* 205AC 8002FDAC 2000A48F */  lw         $a0, 0x20($sp)
/* 205B0 8002FDB0 80BD000C */  jal        GAMELOOP_SwitchTheDrawBuffer
/* 205B4 8002FDB4 00000000 */   nop
/* 205B8 8002FDB8 EBF4020C */  jal        GetRCnt
/* 205BC 8002FDBC 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 205C0 8002FDC0 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 205C4 8002FDC4 5890848F */  lw         $a0, %gp_rel(gameTimer)($gp)
/* 205C8 8002FDC8 6000A88F */  lw         $t0, 0x60($sp)
/* 205CC 8002FDCC 00240400 */  sll        $a0, $a0, 16
/* 205D0 8002FDD0 3401058D */  lw         $a1, 0x134($t0)
/* 205D4 8002FDD4 6802038D */  lw         $v1, 0x268($t0)
/* 205D8 8002FDD8 25104400 */  or         $v0, $v0, $a0
/* 205DC 8002FDDC 2B186500 */  sltu       $v1, $v1, $a1
/* 205E0 8002FDE0 0A006014 */  bnez       $v1, .L8002FE0C
/* 205E4 8002FDE4 580202AD */   sw        $v0, 0x258($t0)
.L8002FDE8:
/* 205E8 8002FDE8 6000A88F */  lw         $t0, 0x60($sp)
/* 205EC 8002FDEC 00000000 */  nop
/* 205F0 8002FDF0 1801048D */  lw         $a0, 0x118($t0)
/* 205F4 8002FDF4 8494000C */  jal        CheckVolatile
/* 205F8 8002FDF8 00000000 */   nop
/* 205FC 8002FDFC 0F004010 */  beqz       $v0, .L8002FE3C
/* 20600 8002FE00 00000000 */   nop
/* 20604 8002FE04 7ABF0008 */  j          .L8002FDE8
/* 20608 8002FE08 00000000 */   nop
.L8002FE0C:
/* 2060C 8002FE0C 6000A88F */  lw         $t0, 0x60($sp)
/* 20610 8002FE10 00000000 */  nop
/* 20614 8002FE14 1801048D */  lw         $a0, 0x118($t0)
/* 20618 8002FE18 00000000 */  nop
/* 2061C 8002FE1C 08008010 */  beqz       $a0, .L8002FE40
/* 20620 8002FE20 00000000 */   nop
/* 20624 8002FE24 68EA020C */  jal        PutDispEnv
/* 20628 8002FE28 00000000 */   nop
/* 2062C 8002FE2C 6000A88F */  lw         $t0, 0x60($sp)
/* 20630 8002FE30 00000000 */  nop
/* 20634 8002FE34 180100AD */  sw         $zero, 0x118($t0)
/* 20638 8002FE38 340100AD */  sw         $zero, 0x134($t0)
.L8002FE3C:
/* 2063C 8002FE3C 6000A88F */  lw         $t0, 0x60($sp)
.L8002FE40:
/* 20640 8002FE40 00000000 */  nop
/* 20644 8002FE44 5802048D */  lw         $a0, 0x258($t0)
/* 20648 8002FE48 93F7000C */  jal        TIMER_TimeDiff
/* 2064C 8002FE4C 00000000 */   nop
/* 20650 8002FE50 2000A88F */  lw         $t0, 0x20($sp)
/* 20654 8002FE54 00000000 */  nop
/* 20658 8002FE58 FC2F1025 */  addiu      $s0, $t0, 0x2FFC
/* 2065C 8002FE5C 6000A88F */  lw         $t0, 0x60($sp)
/* 20660 8002FE60 00000000 */  nop
/* 20664 8002FE64 0400038D */  lw         $v1, 0x4($t0)
/* 20668 8002FE68 21200002 */  addu       $a0, $s0, $zero
/* 2066C 8002FE6C 580202AD */  sw         $v0, 0x258($t0)
/* 20670 8002FE70 01000224 */  addiu      $v0, $zero, 0x1
/* 20674 8002FE74 23104300 */  subu       $v0, $v0, $v1
/* 20678 8002FE78 1851000C */  jal        DEBUG_DrawShrinkCels
/* 2067C 8002FE7C 040002AD */   sw        $v0, 0x4($t0)
/* 20680 8002FE80 2000A48F */  lw         $a0, 0x20($sp)
/* 20684 8002FE84 56B9000C */  jal        GAMELOOP_HandleScreenWipes
/* 20688 8002FE88 00000000 */   nop
/* 2068C 8002FE8C EBF4020C */  jal        GetRCnt
/* 20690 8002FE90 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 20694 8002FE94 6000A88F */  lw         $t0, 0x60($sp)
/* 20698 8002FE98 00000000 */  nop
/* 2069C 8002FE9C 28020325 */  addiu      $v1, $t0, 0x228
/* 206A0 8002FEA0 1C0103AD */  sw         $v1, 0x11C($t0)
/* 206A4 8002FEA4 5890838F */  lw         $v1, %gp_rel(gameTimer)($gp)
/* 206A8 8002FEA8 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 206AC 8002FEAC 001C0300 */  sll        $v1, $v1, 16
/* 206B0 8002FEB0 25104300 */  or         $v0, $v0, $v1
/* 206B4 8002FEB4 200102AD */  sw         $v0, 0x120($t0)
/* 206B8 8002FEB8 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 206BC 8002FEBC 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 206C0 8002FEC0 24104300 */  and        $v0, $v0, $v1
/* 206C4 8002FEC4 06004010 */  beqz       $v0, .L8002FEE0
/* 206C8 8002FEC8 00000000 */   nop
/* 206CC 8002FECC 2000A48F */  lw         $a0, 0x20($sp)
/* 206D0 8002FED0 C6BF000C */  jal        GAMELOOP_DrawSavedOT
/* 206D4 8002FED4 00000000 */   nop
/* 206D8 8002FED8 BABF0008 */  j          .L8002FEE8
/* 206DC 8002FEDC 00000000 */   nop
.L8002FEE0:
/* 206E0 8002FEE0 1CEA020C */  jal        DrawOTag
/* 206E4 8002FEE4 21200002 */   addu      $a0, $s0, $zero
.L8002FEE8:
/* 206E8 8002FEE8 5C00BF8F */  lw         $ra, 0x5C($sp)
/* 206EC 8002FEEC 5800BE8F */  lw         $fp, 0x58($sp)
/* 206F0 8002FEF0 5400B78F */  lw         $s7, 0x54($sp)
/* 206F4 8002FEF4 5000B68F */  lw         $s6, 0x50($sp)
/* 206F8 8002FEF8 4C00B58F */  lw         $s5, 0x4C($sp)
/* 206FC 8002FEFC 4800B48F */  lw         $s4, 0x48($sp)
/* 20700 8002FF00 4400B38F */  lw         $s3, 0x44($sp)
/* 20704 8002FF04 4000B28F */  lw         $s2, 0x40($sp)
/* 20708 8002FF08 3C00B18F */  lw         $s1, 0x3C($sp)
/* 2070C 8002FF0C 3800B08F */  lw         $s0, 0x38($sp)
/* 20710 8002FF10 0800E003 */  jr         $ra
/* 20714 8002FF14 6000BD27 */   addiu     $sp, $sp, 0x60
.size GAMELOOP_DisplayFrame, . - GAMELOOP_DisplayFrame
