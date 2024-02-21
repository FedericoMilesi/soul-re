.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitDisplay
/* 291D8 800389D8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 291DC 800389DC 0D80023C */  lui        $v0, %hi(D_800D0BF4)
/* 291E0 800389E0 2400BFAF */  sw         $ra, 0x24($sp)
/* 291E4 800389E4 2000B0AF */  sw         $s0, 0x20($sp)
/* 291E8 800389E8 F40B4D24 */  addiu      $t5, $v0, %lo(D_800D0BF4)
/* 291EC 800389EC 0300AA89 */  lwl        $t2, 0x3($t5)
/* 291F0 800389F0 0000AA99 */  lwr        $t2, 0x0($t5)
/* 291F4 800389F4 0700AB89 */  lwl        $t3, 0x7($t5)
/* 291F8 800389F8 0400AB99 */  lwr        $t3, 0x4($t5)
/* 291FC 800389FC 1B00AAAB */  swl        $t2, 0x1B($sp)
/* 29200 80038A00 1800AABB */  swr        $t2, 0x18($sp)
/* 29204 80038A04 1F00ABAB */  swl        $t3, 0x1F($sp)
/* 29208 80038A08 1C00ABBB */  swr        $t3, 0x1C($sp)
/* 2920C 80038A0C 5DE8020C */  jal        ResetGraph
/* 29210 80038A10 03000424 */   addiu     $a0, $zero, 0x3
/* 29214 80038A14 BAE8020C */  jal        SetGraphDebug
/* 29218 80038A18 21200000 */   addu      $a0, $zero, $zero
/* 2921C 80038A1C 88BC8427 */  addiu      $a0, $gp, %gp_rel(draw)
/* 29220 80038A20 21280000 */  addu       $a1, $zero, $zero
/* 29224 80038A24 2130A000 */  addu       $a2, $a1, $zero
/* 29228 80038A28 00020724 */  addiu      $a3, $zero, 0x200
/* 2922C 80038A2C F0001024 */  addiu      $s0, $zero, 0xF0
/* 29230 80038A30 E1FC020C */  jal        SetDefDrawEnv
/* 29234 80038A34 1000B0AF */   sw        $s0, 0x10($sp)
/* 29238 80038A38 5CBC8427 */  addiu      $a0, $gp, %gp_rel(disp)
/* 2923C 80038A3C 21280000 */  addu       $a1, $zero, $zero
/* 29240 80038A40 2130A000 */  addu       $a2, $a1, $zero
/* 29244 80038A44 00020724 */  addiu      $a3, $zero, 0x200
/* 29248 80038A48 E2F2020C */  jal        SetDefDispEnv
/* 2924C 80038A4C 1000B0AF */   sw        $s0, 0x10($sp)
/* 29250 80038A50 E4BC8427 */  addiu      $a0, $gp, %gp_rel(draw + 0x5C)
/* 29254 80038A54 21280000 */  addu       $a1, $zero, $zero
/* 29258 80038A58 00010624 */  addiu      $a2, $zero, 0x100
/* 2925C 80038A5C 00020724 */  addiu      $a3, $zero, 0x200
/* 29260 80038A60 E1FC020C */  jal        SetDefDrawEnv
/* 29264 80038A64 1000B0AF */   sw        $s0, 0x10($sp)
/* 29268 80038A68 70BC8427 */  addiu      $a0, $gp, %gp_rel(disp + 0x14)
/* 2926C 80038A6C 21280000 */  addu       $a1, $zero, $zero
/* 29270 80038A70 00010624 */  addiu      $a2, $zero, 0x100
/* 29274 80038A74 00020724 */  addiu      $a3, $zero, 0x200
/* 29278 80038A78 E2F2020C */  jal        SetDefDispEnv
/* 2927C 80038A7C 1000B0AF */   sw        $s0, 0x10($sp)
/* 29280 80038A80 21280000 */  addu       $a1, $zero, $zero
/* 29284 80038A84 03000924 */  addiu      $t1, $zero, 0x3
/* 29288 80038A88 02000824 */  addiu      $t0, $zero, 0x2
/* 2928C 80038A8C 00020724 */  addiu      $a3, $zero, 0x200
/* 29290 80038A90 21300002 */  addu       $a2, $s0, $zero
/* 29294 80038A94 A4BD8427 */  addiu      $a0, $gp, %gp_rel(clearRect)
/* 29298 80038A98 01000224 */  addiu      $v0, $zero, 0x1
/* 2929C 80038A9C 9EBC8327 */  addiu      $v1, $gp, %gp_rel(draw + 0x16)
/* 292A0 80038AA0 FABC82A3 */  sb         $v0, %gp_rel(draw + 0x72)($gp)
/* 292A4 80038AA4 9EBC82A3 */  sb         $v0, %gp_rel(draw + 0x16)($gp)
/* 292A8 80038AA8 FBBC82A3 */  sb         $v0, %gp_rel(draw + 0x73)($gp)
/* 292AC 80038AAC 9FBC82A3 */  sb         $v0, %gp_rel(draw + 0x17)($gp)
/* 292B0 80038AB0 EAFF6224 */  addiu      $v0, $v1, -0x16
/* 292B4 80038AB4 46006324 */  addiu      $v1, $v1, 0x46
/* 292B8 80038AB8 FCBC80A3 */  sb         $zero, %gp_rel(draw + 0x74)($gp)
/* 292BC 80038ABC A0BC80A3 */  sb         $zero, %gp_rel(draw + 0x18)($gp)
/* 292C0 80038AC0 190040A0 */  sb         $zero, 0x19($v0)
/* 292C4 80038AC4 1A0040A0 */  sb         $zero, 0x1A($v0)
/* 292C8 80038AC8 1B0040A0 */  sb         $zero, 0x1B($v0)
/* 292CC 80038ACC 190060A0 */  sb         $zero, 0x19($v1)
/* 292D0 80038AD0 1A0060A0 */  sb         $zero, 0x1A($v1)
/* 292D4 80038AD4 1B0060A0 */  sb         $zero, 0x1B($v1)
.L80038AD8:
/* 292D8 80038AD8 00120500 */  sll        $v0, $a1, 8
/* 292DC 80038ADC 030089A0 */  sb         $t1, 0x3($a0)
/* 292E0 80038AE0 070088A0 */  sb         $t0, 0x7($a0)
/* 292E4 80038AE4 080080A4 */  sh         $zero, 0x8($a0)
/* 292E8 80038AE8 0A0082A4 */  sh         $v0, 0xA($a0)
/* 292EC 80038AEC 0C0087A4 */  sh         $a3, 0xC($a0)
/* 292F0 80038AF0 0E0086A4 */  sh         $a2, 0xE($a0)
/* 292F4 80038AF4 040080A0 */  sb         $zero, 0x4($a0)
/* 292F8 80038AF8 050080A0 */  sb         $zero, 0x5($a0)
/* 292FC 80038AFC 060080A0 */  sb         $zero, 0x6($a0)
/* 29300 80038B00 0100A524 */  addiu      $a1, $a1, 0x1
/* 29304 80038B04 0200A228 */  slti       $v0, $a1, 0x2
/* 29308 80038B08 F3FF4014 */  bnez       $v0, .L80038AD8
/* 2930C 80038B0C 10008424 */   addiu     $a0, $a0, 0x10
/* 29310 80038B10 3EE1000C */  jal        ClearDisplay
/* 29314 80038B14 00000000 */   nop
/* 29318 80038B18 9CBF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 2931C 80038B1C DAE9020C */  jal        ClearOTagR
/* 29320 80038B20 000C0524 */   addiu     $a1, $zero, 0xC00
/* 29324 80038B24 A0BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1D8)($gp)
/* 29328 80038B28 DAE9020C */  jal        ClearOTagR
/* 2932C 80038B2C 000C0524 */   addiu     $a1, $zero, 0xC00
/* 29330 80038B30 1800A427 */  addiu      $a0, $sp, 0x18
/* 29334 80038B34 21280000 */  addu       $a1, $zero, $zero
/* 29338 80038B38 FF000624 */  addiu      $a2, $zero, 0xFF
/* 2933C 80038B3C 70E9020C */  jal        ClearImage
/* 29340 80038B40 2138A000 */   addu      $a3, $a1, $zero
/* 29344 80038B44 2400BF8F */  lw         $ra, 0x24($sp)
/* 29348 80038B48 2000B08F */  lw         $s0, 0x20($sp)
/* 2934C 80038B4C 0800E003 */  jr         $ra
/* 29350 80038B50 2800BD27 */   addiu     $sp, $sp, 0x28
.size InitDisplay, . - InitDisplay
