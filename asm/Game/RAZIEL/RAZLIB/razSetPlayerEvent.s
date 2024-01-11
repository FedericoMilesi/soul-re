.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetPlayerEvent
/* 97FDC 800A77DC 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 97FE0 800A77E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 97FE4 800A77E4 1800B0AF */  sw         $s0, 0x18($sp)
/* 97FE8 800A77E8 3CF6908F */  lw         $s0, %gp_rel(Raziel + 0xC)($gp)
/* 97FEC 800A77EC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 97FF0 800A77F0 1000A0AF */  sw         $zero, 0x10($sp)
/* 97FF4 800A77F4 01004230 */  andi       $v0, $v0, 0x1
/* 97FF8 800A77F8 0C004010 */  beqz       $v0, .L800A782C
/* 97FFC 800A77FC 1400A0AF */   sw        $zero, 0x14($sp)
/* 98000 800A7800 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 98004 800A7804 03000224 */  addiu      $v0, $zero, 0x3
/* 98008 800A7808 08006210 */  beq        $v1, $v0, .L800A782C
/* 9800C 800A780C 0B80023C */   lui       $v0, %hi(StateHandlerIdle)
/* 98010 800A7810 E0844224 */  addiu      $v0, $v0, %lo(StateHandlerIdle)
/* 98014 800A7814 05000216 */  bne        $s0, $v0, .L800A782C
/* 98018 800A7818 00000000 */   nop
/* 9801C 800A781C DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98020 800A7820 00000000 */  nop
/* 98024 800A7824 01004234 */  ori        $v0, $v0, 0x1
/* 98028 800A7828 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A782C:
/* 9802C 800A782C 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 98030 800A7830 00000000 */  nop
/* 98034 800A7834 04004230 */  andi       $v0, $v0, 0x4
/* 98038 800A7838 0C004010 */  beqz       $v0, .L800A786C
/* 9803C 800A783C 03000224 */   addiu     $v0, $zero, 0x3
/* 98040 800A7840 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 98044 800A7844 00000000 */  nop
/* 98048 800A7848 08006210 */  beq        $v1, $v0, .L800A786C
/* 9804C 800A784C 0B80023C */   lui       $v0, %hi(StateHandlerCrouch)
/* 98050 800A7850 E8904224 */  addiu      $v0, $v0, %lo(StateHandlerCrouch)
/* 98054 800A7854 05000216 */  bne        $s0, $v0, .L800A786C
/* 98058 800A7858 00000000 */   nop
/* 9805C 800A785C DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98060 800A7860 00000000 */  nop
/* 98064 800A7864 02004234 */  ori        $v0, $v0, 0x2
/* 98068 800A7868 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A786C:
/* 9806C 800A786C 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 98070 800A7870 00000000 */  nop
/* 98074 800A7874 08004230 */  andi       $v0, $v0, 0x8
/* 98078 800A7878 17004010 */  beqz       $v0, .L800A78D8
/* 9807C 800A787C 03000224 */   addiu     $v0, $zero, 0x3
/* 98080 800A7880 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 98084 800A7884 00000000 */  nop
/* 98088 800A7888 13006210 */  beq        $v1, $v0, .L800A78D8
/* 9808C 800A788C 0B80023C */   lui       $v0, %hi(StateHandlerIdle)
/* 98090 800A7890 E0844224 */  addiu      $v0, $v0, %lo(StateHandlerIdle)
/* 98094 800A7894 10000216 */  bne        $s0, $v0, .L800A78D8
/* 98098 800A7898 00000000 */   nop
/* 9809C 800A789C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 980A0 800A78A0 00000000 */  nop
/* 980A4 800A78A4 1800448C */  lw         $a0, 0x18($v0)
/* 980A8 800A78A8 92D1000C */  jal        INSTANCE_Query
/* 980AC 800A78AC 04000524 */   addiu     $a1, $zero, 0x4
/* 980B0 800A78B0 09000324 */  addiu      $v1, $zero, 0x9
/* 980B4 800A78B4 04004314 */  bne        $v0, $v1, .L800A78C8
/* 980B8 800A78B8 00000000 */   nop
/* 980BC 800A78BC DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 980C0 800A78C0 359E0208 */  j          .L800A78D4
/* 980C4 800A78C4 08004234 */   ori       $v0, $v0, 0x8
.L800A78C8:
/* 980C8 800A78C8 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 980CC 800A78CC 00000000 */  nop
/* 980D0 800A78D0 04004234 */  ori        $v0, $v0, 0x4
.L800A78D4:
/* 980D4 800A78D4 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A78D8:
/* 980D8 800A78D8 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 980DC 800A78DC 00000000 */  nop
/* 980E0 800A78E0 20004230 */  andi       $v0, $v0, 0x20
/* 980E4 800A78E4 22004010 */  beqz       $v0, .L800A7970
/* 980E8 800A78E8 00000000 */   nop
/* 980EC 800A78EC 2197020C */  jal        razGetHeldItem
/* 980F0 800A78F0 00000000 */   nop
/* 980F4 800A78F4 1E004014 */  bnez       $v0, .L800A7970
/* 980F8 800A78F8 01000224 */   addiu     $v0, $zero, 0x1
/* 980FC 800A78FC 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 98100 800A7900 00000000 */  nop
/* 98104 800A7904 1A006214 */  bne        $v1, $v0, .L800A7970
/* 98108 800A7908 0B80023C */   lui       $v0, %hi(StateHandlerIdle)
/* 9810C 800A790C E0844224 */  addiu      $v0, $v0, %lo(StateHandlerIdle)
/* 98110 800A7910 13000212 */  beq        $s0, $v0, .L800A7960
/* 98114 800A7914 0B80023C */   lui       $v0, %hi(StateHandlerStartMove)
/* 98118 800A7918 C4A24224 */  addiu      $v0, $v0, %lo(StateHandlerStartMove)
/* 9811C 800A791C 10000212 */  beq        $s0, $v0, .L800A7960
/* 98120 800A7920 0B80023C */   lui       $v0, %hi(StateHandlerMove)
/* 98124 800A7924 A8AB4224 */  addiu      $v0, $v0, %lo(StateHandlerMove)
/* 98128 800A7928 0D000212 */  beq        $s0, $v0, .L800A7960
/* 9812C 800A792C 0B80023C */   lui       $v0, %hi(StateHandlerJump)
/* 98130 800A7930 70B94224 */  addiu      $v0, $v0, %lo(StateHandlerJump)
/* 98134 800A7934 0A000212 */  beq        $s0, $v0, .L800A7960
/* 98138 800A7938 0B80023C */   lui       $v0, %hi(StateHandlerFall)
/* 9813C 800A793C A8BD4224 */  addiu      $v0, $v0, %lo(StateHandlerFall)
/* 98140 800A7940 07000212 */  beq        $s0, $v0, .L800A7960
/* 98144 800A7944 0A80023C */   lui       $v0, %hi(StateHandlerSwim)
/* 98148 800A7948 0C024224 */  addiu      $v0, $v0, %lo(StateHandlerSwim)
/* 9814C 800A794C 04000212 */  beq        $s0, $v0, .L800A7960
/* 98150 800A7950 0B80023C */   lui       $v0, %hi(StateHandlerAutoFace)
/* 98154 800A7954 10EF4224 */  addiu      $v0, $v0, %lo(StateHandlerAutoFace)
/* 98158 800A7958 05000216 */  bne        $s0, $v0, .L800A7970
/* 9815C 800A795C 00000000 */   nop
.L800A7960:
/* 98160 800A7960 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98164 800A7964 00000000 */  nop
/* 98168 800A7968 10004234 */  ori        $v0, $v0, 0x10
/* 9816C 800A796C DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A7970:
/* 98170 800A7970 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 98174 800A7974 00000000 */  nop
/* 98178 800A7978 40004230 */  andi       $v0, $v0, 0x40
/* 9817C 800A797C 0D004010 */  beqz       $v0, .L800A79B4
/* 98180 800A7980 1000A427 */   addiu     $a0, $sp, 0x10
/* 98184 800A7984 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 98188 800A7988 00000000 */  nop
/* 9818C 800A798C 3000448C */  lw         $a0, 0x30($v0)
/* 98190 800A7990 92D1000C */  jal        INSTANCE_Query
/* 98194 800A7994 0A000524 */   addiu     $a1, $zero, 0xA
/* 98198 800A7998 04004230 */  andi       $v0, $v0, 0x4
/* 9819C 800A799C 05004014 */  bnez       $v0, .L800A79B4
/* 981A0 800A79A0 1000A427 */   addiu     $a0, $sp, 0x10
/* 981A4 800A79A4 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 981A8 800A79A8 00000000 */  nop
/* 981AC 800A79AC 20004234 */  ori        $v0, $v0, 0x20
/* 981B0 800A79B0 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A79B4:
/* 981B4 800A79B4 9F6E020C */  jal        StateHandlerDecodeHold
/* 981B8 800A79B8 1400A527 */   addiu     $a1, $sp, 0x14
/* 981BC 800A79BC 1D004010 */  beqz       $v0, .L800A7A34
/* 981C0 800A79C0 00000000 */   nop
/* 981C4 800A79C4 1400A28F */  lw         $v0, 0x14($sp)
/* 981C8 800A79C8 00000000 */  nop
/* 981CC 800A79CC 19004010 */  beqz       $v0, .L800A7A34
/* 981D0 800A79D0 0001023C */   lui       $v0, (0x1000002 >> 16)
/* 981D4 800A79D4 1000A38F */  lw         $v1, 0x10($sp)
/* 981D8 800A79D8 02004234 */  ori        $v0, $v0, (0x1000002 & 0xFFFF)
/* 981DC 800A79DC 06006214 */  bne        $v1, $v0, .L800A79F8
/* 981E0 800A79E0 0001023C */   lui       $v0, (0x100000A >> 16)
/* 981E4 800A79E4 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 981E8 800A79E8 00000000 */  nop
/* 981EC 800A79EC 40004234 */  ori        $v0, $v0, 0x40
/* 981F0 800A79F0 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 981F4 800A79F4 0001023C */  lui        $v0, (0x100000A >> 16)
.L800A79F8:
/* 981F8 800A79F8 0A004234 */  ori        $v0, $v0, (0x100000A & 0xFFFF)
/* 981FC 800A79FC 06006214 */  bne        $v1, $v0, .L800A7A18
/* 98200 800A7A00 0001023C */   lui       $v0, (0x1000018 >> 16)
/* 98204 800A7A04 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98208 800A7A08 00000000 */  nop
/* 9820C 800A7A0C 80004234 */  ori        $v0, $v0, 0x80
/* 98210 800A7A10 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98214 800A7A14 0001023C */  lui        $v0, (0x1000018 >> 16)
.L800A7A18:
/* 98218 800A7A18 18004234 */  ori        $v0, $v0, (0x1000018 & 0xFFFF)
/* 9821C 800A7A1C 05006214 */  bne        $v1, $v0, .L800A7A34
/* 98220 800A7A20 00000000 */   nop
/* 98224 800A7A24 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98228 800A7A28 00000000 */  nop
/* 9822C 800A7A2C 00014234 */  ori        $v0, $v0, 0x100
/* 98230 800A7A30 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A7A34:
/* 98234 800A7A34 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 98238 800A7A38 0200033C */  lui        $v1, (0x20000 >> 16)
/* 9823C 800A7A3C 24104300 */  and        $v0, $v0, $v1
/* 98240 800A7A40 0B004010 */  beqz       $v0, .L800A7A70
/* 98244 800A7A44 00000000 */   nop
/* 98248 800A7A48 1CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3EC)($gp)
/* 9824C 800A7A4C 00000000 */  nop
/* 98250 800A7A50 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 98254 800A7A54 0300422C */  sltiu      $v0, $v0, 0x3
/* 98258 800A7A58 05004010 */  beqz       $v0, .L800A7A70
/* 9825C 800A7A5C 00000000 */   nop
/* 98260 800A7A60 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98264 800A7A64 00000000 */  nop
/* 98268 800A7A68 00024234 */  ori        $v0, $v0, 0x200
/* 9826C 800A7A6C DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A7A70:
/* 98270 800A7A70 1000A38F */  lw         $v1, 0x10($sp)
/* 98274 800A7A74 0800023C */  lui        $v0, (0x80000 >> 16)
/* 98278 800A7A78 05006214 */  bne        $v1, $v0, .L800A7A90
/* 9827C 800A7A7C 00000000 */   nop
/* 98280 800A7A80 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98284 800A7A84 00000000 */  nop
/* 98288 800A7A88 00044234 */  ori        $v0, $v0, 0x400
/* 9828C 800A7A8C DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A7A90:
/* 98290 800A7A90 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 98294 800A7A94 00000000 */  nop
/* 98298 800A7A98 00404230 */  andi       $v0, $v0, 0x4000
/* 9829C 800A7A9C 05004010 */  beqz       $v0, .L800A7AB4
/* 982A0 800A7AA0 00000000 */   nop
/* 982A4 800A7AA4 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 982A8 800A7AA8 00000000 */  nop
/* 982AC 800A7AAC 00084234 */  ori        $v0, $v0, 0x800
/* 982B0 800A7AB0 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A7AB4:
/* 982B4 800A7AB4 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 982B8 800A7AB8 00000000 */  nop
/* 982BC 800A7ABC 40004230 */  andi       $v0, $v0, 0x40
/* 982C0 800A7AC0 05004010 */  beqz       $v0, .L800A7AD8
/* 982C4 800A7AC4 00000000 */   nop
/* 982C8 800A7AC8 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 982CC 800A7ACC 00000000 */  nop
/* 982D0 800A7AD0 00204234 */  ori        $v0, $v0, 0x2000
/* 982D4 800A7AD4 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
.L800A7AD8:
/* 982D8 800A7AD8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 982DC 800A7ADC 1800B08F */  lw         $s0, 0x18($sp)
/* 982E0 800A7AE0 0800E003 */  jr         $ra
/* 982E4 800A7AE4 2000BD27 */   addiu     $sp, $sp, 0x20
.size razSetPlayerEvent, . - razSetPlayerEvent
