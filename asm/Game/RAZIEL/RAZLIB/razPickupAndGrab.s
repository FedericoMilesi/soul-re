.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razPickupAndGrab
/* 960E8 800A58E8 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 960EC 800A58EC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 960F0 800A58F0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 960F4 800A58F4 21888000 */  addu       $s1, $a0, $zero
/* 960F8 800A58F8 2000B2AF */  sw         $s2, 0x20($sp)
/* 960FC 800A58FC 2190A000 */  addu       $s2, $a1, $zero
/* 96100 800A5900 2400BFAF */  sw         $ra, 0x24($sp)
/* 96104 800A5904 20004230 */  andi       $v0, $v0, 0x20
/* 96108 800A5908 74004010 */  beqz       $v0, .L800A5ADC
/* 9610C 800A590C 1800B0AF */   sw        $s0, 0x18($sp)
/* 96110 800A5910 2197020C */  jal        razGetHeldItem
/* 96114 800A5914 00000000 */   nop
/* 96118 800A5918 71004014 */  bnez       $v0, .L800A5AE0
/* 9611C 800A591C 01000224 */   addiu     $v0, $zero, 0x1
/* 96120 800A5920 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 96124 800A5924 00000000 */  nop
/* 96128 800A5928 6D006214 */  bne        $v1, $v0, .L800A5AE0
/* 9612C 800A592C 00000000 */   nop
/* 96130 800A5930 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 96134 800A5934 00000000 */  nop
/* 96138 800A5938 80004230 */  andi       $v0, $v0, 0x80
/* 9613C 800A593C 68004014 */  bnez       $v0, .L800A5AE0
/* 96140 800A5940 01000224 */   addiu     $v0, $zero, 0x1
/* 96144 800A5944 66004316 */  bne        $s2, $v1, .L800A5AE0
/* 96148 800A5948 21100000 */   addu      $v0, $zero, $zero
/* 9614C 800A594C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 96150 800A5950 00000000 */  nop
/* 96154 800A5954 2800428C */  lw         $v0, 0x28($v0)
/* 96158 800A5958 00000000 */  nop
/* 9615C 800A595C 4801448C */  lw         $a0, 0x148($v0)
/* 96160 800A5960 00000000 */  nop
/* 96164 800A5964 03008010 */  beqz       $a0, .L800A5974
/* 96168 800A5968 00000000 */   nop
/* 9616C 800A596C 92D1000C */  jal        INSTANCE_Query
/* 96170 800A5970 21280000 */   addu      $a1, $zero, $zero
.L800A5974:
/* 96174 800A5974 21200000 */  addu       $a0, $zero, $zero
/* 96178 800A5978 21288000 */  addu       $a1, $a0, $zero
/* 9617C 800A597C 1000B2AF */  sw         $s2, 0x10($sp)
/* 96180 800A5980 0000278E */  lw         $a3, 0x0($s1)
/* 96184 800A5984 21C4010C */  jal        SetObjectData
/* 96188 800A5988 08000624 */   addiu     $a2, $zero, 0x8
/* 9618C 800A598C 21804000 */  addu       $s0, $v0, $zero
/* 96190 800A5990 8000053C */  lui        $a1, (0x80002E >> 16)
/* 96194 800A5994 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 96198 800A5998 2E00A534 */  ori        $a1, $a1, (0x80002E & 0xFFFF)
/* 9619C 800A599C 2800448C */  lw         $a0, 0x28($v0)
/* 961A0 800A59A0 A1D1000C */  jal        INSTANCE_Post
/* 961A4 800A59A4 21300002 */   addu      $a2, $s0, $zero
/* 961A8 800A59A8 06000286 */  lh         $v0, 0x6($s0)
/* 961AC 800A59AC 00000000 */  nop
/* 961B0 800A59B0 4B004014 */  bnez       $v0, .L800A5AE0
/* 961B4 800A59B4 21100000 */   addu      $v0, $zero, $zero
/* 961B8 800A59B8 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 961BC 800A59BC 00000000 */  nop
/* 961C0 800A59C0 2800428C */  lw         $v0, 0x28($v0)
/* 961C4 800A59C4 00000000 */  nop
/* 961C8 800A59C8 4801448C */  lw         $a0, 0x148($v0)
/* 961CC 800A59CC 00000000 */  nop
/* 961D0 800A59D0 09008010 */  beqz       $a0, .L800A59F8
/* 961D4 800A59D4 0001053C */   lui       $a1, (0x100001B >> 16)
/* 961D8 800A59D8 1B00A534 */  ori        $a1, $a1, (0x100001B & 0xFFFF)
/* 961DC 800A59DC A1D1000C */  jal        INSTANCE_Post
/* 961E0 800A59E0 21300000 */   addu      $a2, $zero, $zero
/* 961E4 800A59E4 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 961E8 800A59E8 00000000 */  nop
/* 961EC 800A59EC 2800448C */  lw         $a0, 0x28($v0)
/* 961F0 800A59F0 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 961F4 800A59F4 00000000 */   nop
.L800A59F8:
/* 961F8 800A59F8 21200000 */  addu       $a0, $zero, $zero
/* 961FC 800A59FC 21288000 */  addu       $a1, $a0, $zero
/* 96200 800A5A00 31000224 */  addiu      $v0, $zero, 0x31
/* 96204 800A5A04 1000A2AF */  sw         $v0, 0x10($sp)
/* 96208 800A5A08 0000278E */  lw         $a3, 0x0($s1)
/* 9620C 800A5A0C 21C4010C */  jal        SetObjectData
/* 96210 800A5A10 08000624 */   addiu     $a2, $zero, 0x8
/* 96214 800A5A14 21804000 */  addu       $s0, $v0, $zero
/* 96218 800A5A18 8000053C */  lui        $a1, (0x800002 >> 16)
/* 9621C 800A5A1C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 96220 800A5A20 0200A534 */  ori        $a1, $a1, (0x800002 & 0xFFFF)
/* 96224 800A5A24 2800448C */  lw         $a0, 0x28($v0)
/* 96228 800A5A28 A1D1000C */  jal        INSTANCE_Post
/* 9622C 800A5A2C 21300002 */   addu      $a2, $s0, $zero
/* 96230 800A5A30 06000286 */  lh         $v0, 0x6($s0)
/* 96234 800A5A34 00000000 */  nop
/* 96238 800A5A38 29004014 */  bnez       $v0, .L800A5AE0
/* 9623C 800A5A3C 21100000 */   addu      $v0, $zero, $zero
/* 96240 800A5A40 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 96244 800A5A44 00000000 */  nop
/* 96248 800A5A48 80004234 */  ori        $v0, $v0, 0x80
/* 9624C 800A5A4C CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 96250 800A5A50 6397020C */  jal        razReaverOff
/* 96254 800A5A54 1C013026 */   addiu     $s0, $s1, 0x11C
/* 96258 800A5A58 1C0100AE */  sw         $zero, 0x11C($s0)
/* 9625C 800A5A5C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 96260 800A5A60 00000000 */  nop
/* 96264 800A5A64 2800448C */  lw         $a0, 0x28($v0)
/* 96268 800A5A68 92D1000C */  jal        INSTANCE_Query
/* 9626C 800A5A6C 04000524 */   addiu     $a1, $zero, 0x4
/* 96270 800A5A70 21304000 */  addu       $a2, $v0, $zero
/* 96274 800A5A74 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 96278 800A5A78 0400033C */  lui        $v1, (0x40000 >> 16)
/* 9627C 800A5A7C 24104300 */  and        $v0, $v0, $v1
/* 96280 800A5A80 17004014 */  bnez       $v0, .L800A5AE0
/* 96284 800A5A84 21100000 */   addu      $v0, $zero, $zero
/* 96288 800A5A88 21202002 */  addu       $a0, $s1, $zero
/* 9628C 800A5A8C 01000524 */  addiu      $a1, $zero, 0x1
/* 96290 800A5A90 21380000 */  addu       $a3, $zero, $zero
/* 96294 800A5A94 A0A68227 */  addiu      $v0, $gp, %gp_rel(PickupList)
/* 96298 800A5A98 2110C200 */  addu       $v0, $a2, $v0
/* 9629C 800A5A9C 00004690 */  lbu        $a2, 0x0($v0)
/* 962A0 800A5AA0 03000224 */  addiu      $v0, $zero, 0x3
/* 962A4 800A5AA4 1000A2AF */  sw         $v0, 0x10($sp)
/* 962A8 800A5AA8 20C8010C */  jal        G2EmulationSwitchAnimation
/* 962AC 800A5AAC 1400B2AF */   sw        $s2, 0x14($sp)
/* 962B0 800A5AB0 21202002 */  addu       $a0, $s1, $zero
/* 962B4 800A5AB4 01000524 */  addiu      $a1, $zero, 0x1
/* 962B8 800A5AB8 0B80063C */  lui        $a2, %hi(StateHandlerPickupObject)
/* 962BC 800A5ABC F4ECC624 */  addiu      $a2, $a2, %lo(StateHandlerPickupObject)
/* 962C0 800A5AC0 0800028E */  lw         $v0, 0x8($s0)
/* 962C4 800A5AC4 00000000 */  nop
/* 962C8 800A5AC8 38FB82AF */  sw         $v0, %gp_rel(Raziel + 0x508)($gp)
/* 962CC 800A5ACC C1CA010C */  jal        StateSwitchStateData
/* 962D0 800A5AD0 21380000 */   addu      $a3, $zero, $zero
/* 962D4 800A5AD4 B8960208 */  j          .L800A5AE0
/* 962D8 800A5AD8 21100000 */   addu      $v0, $zero, $zero
.L800A5ADC:
/* 962DC 800A5ADC 01000224 */  addiu      $v0, $zero, 0x1
.L800A5AE0:
/* 962E0 800A5AE0 2400BF8F */  lw         $ra, 0x24($sp)
/* 962E4 800A5AE4 2000B28F */  lw         $s2, 0x20($sp)
/* 962E8 800A5AE8 1C00B18F */  lw         $s1, 0x1C($sp)
/* 962EC 800A5AEC 1800B08F */  lw         $s0, 0x18($sp)
/* 962F0 800A5AF0 0800E003 */  jr         $ra
/* 962F4 800A5AF4 2800BD27 */   addiu     $sp, $sp, 0x28
.size razPickupAndGrab, . - razPickupAndGrab
