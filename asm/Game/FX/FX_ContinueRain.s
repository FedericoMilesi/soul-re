.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_ContinueRain
/* 3A0BC 800498BC B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 3A0C0 800498C0 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 3A0C4 800498C4 21B88000 */  addu       $s7, $a0, $zero
/* 3A0C8 800498C8 0100033C */  lui        $v1, (0x103E8 >> 16)
/* 3A0CC 800498CC D0BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 3A0D0 800498D0 E8036334 */  ori        $v1, $v1, (0x103E8 & 0xFFFF)
/* 3A0D4 800498D4 4000BFAF */  sw         $ra, 0x40($sp)
/* 3A0D8 800498D8 3800B6AF */  sw         $s6, 0x38($sp)
/* 3A0DC 800498DC 3400B5AF */  sw         $s5, 0x34($sp)
/* 3A0E0 800498E0 3000B4AF */  sw         $s4, 0x30($sp)
/* 3A0E4 800498E4 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 3A0E8 800498E8 2800B2AF */  sw         $s2, 0x28($sp)
/* 3A0EC 800498EC 2400B1AF */  sw         $s1, 0x24($sp)
/* 3A0F0 800498F0 B5004310 */  beq        $v0, $v1, .L80049BC8
/* 3A0F4 800498F4 2000B0AF */   sw        $s0, 0x20($sp)
/* 3A0F8 800498F8 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 3A0FC 800498FC D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 3A100 80049900 769A9687 */  lh         $s6, %gp_rel(rain_amount)($gp)
/* 3A104 80049904 0D006210 */  beq        $v1, $v0, .L8004993C
/* 3A108 80049908 00000000 */   nop
/* 3A10C 8004990C 8124010C */  jal        FX_GetMorphFadeVal
/* 3A110 80049910 00000000 */   nop
/* 3A114 80049914 00100324 */  addiu      $v1, $zero, 0x1000
/* 3A118 80049918 789A8487 */  lh         $a0, %gp_rel(current_rain_fade)($gp)
/* 3A11C 8004991C 23106200 */  subu       $v0, $v1, $v0
/* 3A120 80049920 18004400 */  mult       $v0, $a0
/* 3A124 80049924 12180000 */  mflo       $v1
/* 3A128 80049928 15006104 */  bgez       $v1, .L80049980
/* 3A12C 8004992C 03130300 */   sra       $v0, $v1, 12
/* 3A130 80049930 FF0F6324 */  addiu      $v1, $v1, 0xFFF
/* 3A134 80049934 60260108 */  j          .L80049980
/* 3A138 80049938 03130300 */   sra       $v0, $v1, 12
.L8004993C:
/* 3A13C 8004993C 789A8287 */  lh         $v0, %gp_rel(current_rain_fade)($gp)
/* 3A140 80049940 789A8397 */  lhu        $v1, %gp_rel(current_rain_fade)($gp)
/* 3A144 80049944 00104228 */  slti       $v0, $v0, 0x1000
/* 3A148 80049948 0C004010 */  beqz       $v0, .L8004997C
/* 3A14C 8004994C 00000000 */   nop
/* 3A150 80049950 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 3A154 80049954 00000000 */  nop
/* 3A158 80049958 C2110200 */  srl        $v0, $v0, 7
/* 3A15C 8004995C 21106200 */  addu       $v0, $v1, $v0
/* 3A160 80049960 789A82A7 */  sh         $v0, %gp_rel(current_rain_fade)($gp)
/* 3A164 80049964 00140200 */  sll        $v0, $v0, 16
/* 3A168 80049968 03140200 */  sra        $v0, $v0, 16
/* 3A16C 8004996C 01104228 */  slti       $v0, $v0, 0x1001
/* 3A170 80049970 02004014 */  bnez       $v0, .L8004997C
/* 3A174 80049974 00100224 */   addiu     $v0, $zero, 0x1000
/* 3A178 80049978 789A82A7 */  sh         $v0, %gp_rel(current_rain_fade)($gp)
.L8004997C:
/* 3A17C 8004997C 789A8287 */  lh         $v0, %gp_rel(current_rain_fade)($gp)
.L80049980:
/* 3A180 80049980 00000000 */  nop
/* 3A184 80049984 1800C202 */  mult       $s6, $v0
/* 3A188 80049988 12180000 */  mflo       $v1
/* 3A18C 8004998C 02006104 */  bgez       $v1, .L80049998
/* 3A190 80049990 00000000 */   nop
/* 3A194 80049994 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L80049998:
/* 3A198 80049998 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 3A19C 8004999C 00000000 */  nop
/* 3A1A0 800499A0 3800448C */  lw         $a0, 0x38($v0)
/* 3A1A4 800499A4 1C66010C */  jal        STREAM_GetLevelWithID
/* 3A1A8 800499A8 03B30300 */   sra       $s6, $v1, 12
/* 3A1AC 800499AC 40AD9187 */  lh         $s1, %gp_rel(theCamera + 0xB0)($gp)
/* 3A1B0 800499B0 3800528C */  lw         $s2, 0x38($v0)
/* 3A1B4 800499B4 FF0F3132 */  andi       $s1, $s1, 0xFFF
/* 3A1B8 800499B8 010C232A */  slti       $v1, $s1, 0xC01
/* 3A1BC 800499BC 08006014 */  bnez       $v1, .L800499E0
/* 3A1C0 800499C0 00100224 */   addiu     $v0, $zero, 0x1000
/* 3A1C4 800499C4 23105100 */  subu       $v0, $v0, $s1
/* 3A1C8 800499C8 40180200 */  sll        $v1, $v0, 1
/* 3A1CC 800499CC 21186200 */  addu       $v1, $v1, $v0
/* 3A1D0 800499D0 C2170300 */  srl        $v0, $v1, 31
/* 3A1D4 800499D4 21186200 */  addu       $v1, $v1, $v0
/* 3A1D8 800499D8 79260108 */  j          .L800499E4
/* 3A1DC 800499DC 43880300 */   sra       $s1, $v1, 1
.L800499E0:
/* 3A1E0 800499E0 21880000 */  addu       $s1, $zero, $zero
.L800499E4:
/* 3A1E4 800499E4 21A00000 */  addu       $s4, $zero, $zero
/* 3A1E8 800499E8 1800B527 */  addiu      $s5, $sp, 0x18
.L800499EC:
/* 3A1EC 800499EC 3AF2020C */  jal        rand
/* 3A1F0 800499F0 00000000 */   nop
/* 3A1F4 800499F4 FF034230 */  andi       $v0, $v0, 0x3FF
/* 3A1F8 800499F8 2A10C202 */  slt        $v0, $s6, $v0
/* 3A1FC 800499FC 6E004014 */  bnez       $v0, .L80049BB8
/* 3A200 80049A00 00000000 */   nop
/* 3A204 80049A04 3AF2020C */  jal        rand
/* 3A208 80049A08 00000000 */   nop
/* 3A20C 80049A0C 00022326 */  addiu      $v1, $s1, 0x200
/* 3A210 80049A10 1A004300 */  div        $zero, $v0, $v1
/* 3A214 80049A14 10180000 */  mfhi       $v1
/* 3A218 80049A18 05000224 */  addiu      $v0, $zero, 0x5
/* 3A21C 80049A1C 1200A2A7 */  sh         $v0, 0x12($sp)
/* 3A220 80049A20 C2171100 */  srl        $v0, $s1, 31
/* 3A224 80049A24 21102202 */  addu       $v0, $s1, $v0
/* 3A228 80049A28 43100200 */  sra        $v0, $v0, 1
/* 3A22C 80049A2C 23186200 */  subu       $v1, $v1, $v0
/* 3A230 80049A30 3AF2020C */  jal        rand
/* 3A234 80049A34 1000A3A7 */   sh        $v1, 0x10($sp)
/* 3A238 80049A38 1000A427 */  addiu      $a0, $sp, 0x10
/* 3A23C 80049A3C 2128A002 */  addu       $a1, $s5, $zero
/* 3A240 80049A40 FF074230 */  andi       $v0, $v0, 0x7FF
/* 3A244 80049A44 9124010C */  jal        FX_ConvertCamPersToWorld
/* 3A248 80049A48 1400A2A7 */   sh        $v0, 0x14($sp)
/* 3A24C 80049A4C 3AF2020C */  jal        rand
/* 3A250 80049A50 00000000 */   nop
/* 3A254 80049A54 03004230 */  andi       $v0, $v0, 0x3
/* 3A258 80049A58 F2FF0324 */  addiu      $v1, $zero, -0xE
/* 3A25C 80049A5C 23186200 */  subu       $v1, $v1, $v0
/* 3A260 80049A60 C0800300 */  sll        $s0, $v1, 3
/* 3A264 80049A64 1C00A287 */  lh         $v0, 0x1C($sp)
/* 3A268 80049A68 00000000 */  nop
/* 3A26C 80049A6C 21105000 */  addu       $v0, $v0, $s0
/* 3A270 80049A70 2A105200 */  slt        $v0, $v0, $s2
/* 3A274 80049A74 11004010 */  beqz       $v0, .L80049ABC
/* 3A278 80049A78 21980002 */   addu      $s3, $s0, $zero
/* 3A27C 80049A7C D724010C */  jal        FX_GetRandomScreenPt
/* 3A280 80049A80 1000A427 */   addiu     $a0, $sp, 0x10
/* 3A284 80049A84 1000A427 */  addiu      $a0, $sp, 0x10
/* 3A288 80049A88 2128A002 */  addu       $a1, $s5, $zero
/* 3A28C 80049A8C 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 3A290 80049A90 1400A397 */  lhu        $v1, 0x14($sp)
/* 3A294 80049A94 23104202 */  subu       $v0, $s2, $v0
/* 3A298 80049A98 21186200 */  addu       $v1, $v1, $v0
/* 3A29C 80049A9C 9124010C */  jal        FX_ConvertCamPersToWorld
/* 3A2A0 80049AA0 1400A3A7 */   sh        $v1, 0x14($sp)
/* 3A2A4 80049AA4 1C00A287 */  lh         $v0, 0x1C($sp)
/* 3A2A8 80049AA8 00000000 */  nop
/* 3A2AC 80049AAC 21105000 */  addu       $v0, $v0, $s0
/* 3A2B0 80049AB0 2A105200 */  slt        $v0, $v0, $s2
/* 3A2B4 80049AB4 40004014 */  bnez       $v0, .L80049BB8
/* 3A2B8 80049AB8 00000000 */   nop
.L80049ABC:
/* 3A2BC 80049ABC 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 3A2C0 80049AC0 C009010C */  jal        FX_GetPrim
/* 3A2C4 80049AC4 00000000 */   nop
/* 3A2C8 80049AC8 21804000 */  addu       $s0, $v0, $zero
/* 3A2CC 80049ACC 3A000012 */  beqz       $s0, .L80049BB8
/* 3A2D0 80049AD0 00000000 */   nop
/* 3A2D4 80049AD4 1800A297 */  lhu        $v0, 0x18($sp)
/* 3A2D8 80049AD8 00000000 */  nop
/* 3A2DC 80049ADC 3C0002A6 */  sh         $v0, 0x3C($s0)
/* 3A2E0 80049AE0 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 3A2E4 80049AE4 00000000 */  nop
/* 3A2E8 80049AE8 3E0002A6 */  sh         $v0, 0x3E($s0)
/* 3A2EC 80049AEC 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 3A2F0 80049AF0 3AF2020C */  jal        rand
/* 3A2F4 80049AF4 400002A6 */   sh        $v0, 0x40($s0)
/* 3A2F8 80049AF8 FF034230 */  andi       $v0, $v0, 0x3FF
/* 3A2FC 80049AFC A49A8387 */  lh         $v1, %gp_rel(windx)($gp)
/* 3A300 80049B00 000C4224 */  addiu      $v0, $v0, 0xC00
/* 3A304 80049B04 18006200 */  mult       $v1, $v0
/* 3A308 80049B08 12100000 */  mflo       $v0
/* 3A30C 80049B0C 02004104 */  bgez       $v0, .L80049B18
/* 3A310 80049B10 00000000 */   nop
/* 3A314 80049B14 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L80049B18:
/* 3A318 80049B18 03130200 */  sra        $v0, $v0, 12
/* 3A31C 80049B1C 3AF2020C */  jal        rand
/* 3A320 80049B20 5C0002A6 */   sh        $v0, 0x5C($s0)
/* 3A324 80049B24 FF034230 */  andi       $v0, $v0, 0x3FF
/* 3A328 80049B28 A69A8387 */  lh         $v1, %gp_rel(windy)($gp)
/* 3A32C 80049B2C 000C4224 */  addiu      $v0, $v0, 0xC00
/* 3A330 80049B30 18006200 */  mult       $v1, $v0
/* 3A334 80049B34 12100000 */  mflo       $v0
/* 3A338 80049B38 02004104 */  bgez       $v0, .L80049B44
/* 3A33C 80049B3C 4052033C */   lui       $v1, (0x52404040 >> 16)
/* 3A340 80049B40 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L80049B44:
/* 3A344 80049B44 40406334 */  ori        $v1, $v1, (0x52404040 & 0xFFFF)
/* 3A348 80049B48 21280002 */  addu       $a1, $s0, $zero
/* 3A34C 80049B4C 03130200 */  sra        $v0, $v0, 12
/* 3A350 80049B50 5E00A2A4 */  sh         $v0, 0x5E($a1)
/* 3A354 80049B54 14000224 */  addiu      $v0, $zero, 0x14
/* 3A358 80049B58 1000A2A4 */  sh         $v0, 0x10($a1)
/* 3A35C 80049B5C 0901023C */  lui        $v0, (0x1090000 >> 16)
/* 3A360 80049B60 0C00A2AC */  sw         $v0, 0xC($a1)
/* 3A364 80049B64 0580023C */  lui        $v0, %hi(FX_ProcessRain)
/* 3A368 80049B68 1C00A3AC */  sw         $v1, 0x1C($a1)
/* 3A36C 80049B6C 3C00A394 */  lhu        $v1, 0x3C($a1)
/* 3A370 80049B70 5C00A694 */  lhu        $a2, 0x5C($a1)
/* 3A374 80049B74 EC974224 */  addiu      $v0, $v0, %lo(FX_ProcessRain)
/* 3A378 80049B78 1400A2AC */  sw         $v0, 0x14($a1)
/* 3A37C 80049B7C 3E00A294 */  lhu        $v0, 0x3E($a1)
/* 3A380 80049B80 906DE426 */  addiu      $a0, $s7, 0x6D90
/* 3A384 80049B84 6000B3A4 */  sh         $s3, 0x60($a1)
/* 3A388 80049B88 21186600 */  addu       $v1, $v1, $a2
/* 3A38C 80049B8C 5E00A694 */  lhu        $a2, 0x5E($a1)
/* 3A390 80049B90 21386002 */  addu       $a3, $s3, $zero
/* 3A394 80049B94 4200B2A4 */  sh         $s2, 0x42($a1)
/* 3A398 80049B98 2400A0AC */  sw         $zero, 0x24($a1)
/* 3A39C 80049B9C 4400A3A4 */  sh         $v1, 0x44($a1)
/* 3A3A0 80049BA0 4000A394 */  lhu        $v1, 0x40($a1)
/* 3A3A4 80049BA4 21104600 */  addu       $v0, $v0, $a2
/* 3A3A8 80049BA8 21186700 */  addu       $v1, $v1, $a3
/* 3A3AC 80049BAC 4600A2A4 */  sh         $v0, 0x46($a1)
/* 3A3B0 80049BB0 D53E010C */  jal        LIST_InsertFunc
/* 3A3B4 80049BB4 4800A3A4 */   sh        $v1, 0x48($a1)
.L80049BB8:
/* 3A3B8 80049BB8 01009426 */  addiu      $s4, $s4, 0x1
/* 3A3BC 80049BBC 0300822A */  slti       $v0, $s4, 0x3
/* 3A3C0 80049BC0 8AFF4014 */  bnez       $v0, .L800499EC
/* 3A3C4 80049BC4 00000000 */   nop
.L80049BC8:
/* 3A3C8 80049BC8 4000BF8F */  lw         $ra, 0x40($sp)
/* 3A3CC 80049BCC 3C00B78F */  lw         $s7, 0x3C($sp)
/* 3A3D0 80049BD0 3800B68F */  lw         $s6, 0x38($sp)
/* 3A3D4 80049BD4 3400B58F */  lw         $s5, 0x34($sp)
/* 3A3D8 80049BD8 3000B48F */  lw         $s4, 0x30($sp)
/* 3A3DC 80049BDC 2C00B38F */  lw         $s3, 0x2C($sp)
/* 3A3E0 80049BE0 2800B28F */  lw         $s2, 0x28($sp)
/* 3A3E4 80049BE4 2400B18F */  lw         $s1, 0x24($sp)
/* 3A3E8 80049BE8 2000B08F */  lw         $s0, 0x20($sp)
/* 3A3EC 80049BEC 0800E003 */  jr         $ra
/* 3A3F0 80049BF0 4800BD27 */   addiu     $sp, $sp, 0x48
.size FX_ContinueRain, . - FX_ContinueRain
