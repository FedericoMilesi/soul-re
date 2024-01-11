.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel process_cheat_codes
/* 397C 8001317C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3980 80013180 2400BFAF */  sw         $ra, 0x24($sp)
/* 3984 80013184 2000B4AF */  sw         $s4, 0x20($sp)
/* 3988 80013188 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 398C 8001318C 1800B2AF */  sw         $s2, 0x18($sp)
/* 3990 80013190 1400B1AF */  sw         $s1, 0x14($sp)
/* 3994 80013194 1000B0AF */  sw         $s0, 0x10($sp)
/* 3998 80013198 0000B18C */  lw         $s1, 0x0($a1)
/* 399C 8001319C 148A828F */  lw         $v0, %gp_rel(cheatCodeLastCommand)($gp)
/* 39A0 800131A0 0400B28C */  lw         $s2, 0x4($a1)
/* 39A4 800131A4 9E004014 */  bnez       $v0, .L80013420
/* 39A8 800131A8 00000000 */   nop
/* 39AC 800131AC 9C004012 */  beqz       $s2, .L80013420
/* 39B0 800131B0 00032232 */   andi      $v0, $s1, 0x300
/* 39B4 800131B4 9A004010 */  beqz       $v0, .L80013420
/* 39B8 800131B8 21980000 */   addu      $s3, $zero, $zero
/* 39BC 800131BC FFFC0224 */  addiu      $v0, $zero, -0x301
/* 39C0 800131C0 24882202 */  and        $s1, $s1, $v0
/* 39C4 800131C4 21806002 */  addu       $s0, $s3, $zero
/* 39C8 800131C8 0180023C */  lui        $v0, %hi(jtbl_80010000)
/* 39CC 800131CC 00005424 */  addiu      $s4, $v0, %lo(jtbl_80010000)
/* 39D0 800131D0 00191000 */  sll        $v1, $s0, 4
.L800131D4:
/* 39D4 800131D4 408A8227 */  addiu      $v0, $gp, %gp_rel(GameCheats)
/* 39D8 800131D8 21206200 */  addu       $a0, $v1, $v0
/* 39DC 800131DC 0E008284 */  lh         $v0, 0xE($a0)
/* 39E0 800131E0 188A8327 */  addiu      $v1, $gp, %gp_rel(CheatKeyMap)
/* 39E4 800131E4 21108200 */  addu       $v0, $a0, $v0
/* 39E8 800131E8 00004290 */  lbu        $v0, 0x0($v0)
/* 39EC 800131EC 00000000 */  nop
/* 39F0 800131F0 80100200 */  sll        $v0, $v0, 2
/* 39F4 800131F4 21104300 */  addu       $v0, $v0, $v1
/* 39F8 800131F8 0000438C */  lw         $v1, 0x0($v0)
/* 39FC 800131FC 0E008594 */  lhu        $a1, 0xE($a0)
/* 3A00 80013200 24104302 */  and        $v0, $s2, $v1
/* 3A04 80013204 06004010 */  beqz       $v0, .L80013220
/* 3A08 80013208 27100300 */   nor       $v0, $zero, $v1
/* 3A0C 8001320C 24102202 */  and        $v0, $s1, $v0
/* 3A10 80013210 03004014 */  bnez       $v0, .L80013220
/* 3A14 80013214 0100A224 */   addiu     $v0, $a1, 0x1
/* 3A18 80013218 894C0008 */  j          .L80013224
/* 3A1C 8001321C 0E0082A4 */   sh        $v0, 0xE($a0)
.L80013220:
/* 3A20 80013220 0E0080A4 */  sh         $zero, 0xE($a0)
.L80013224:
/* 3A24 80013224 0E008384 */  lh         $v1, 0xE($a0)
/* 3A28 80013228 0C008284 */  lh         $v0, 0xC($a0)
/* 3A2C 8001322C 00000000 */  nop
/* 3A30 80013230 71006214 */  bne        $v1, $v0, .L800133F8
/* 3A34 80013234 1700022E */   sltiu     $v0, $s0, 0x17
/* 3A38 80013238 0E0080A4 */  sh         $zero, 0xE($a0)
/* 3A3C 8001323C 6E004010 */  beqz       $v0, .L800133F8
/* 3A40 80013240 01001324 */   addiu     $s3, $zero, 0x1
/* 3A44 80013244 80101000 */  sll        $v0, $s0, 2
/* 3A48 80013248 21105400 */  addu       $v0, $v0, $s4
/* 3A4C 8001324C 0000428C */  lw         $v0, 0x0($v0)
/* 3A50 80013250 00000000 */  nop
/* 3A54 80013254 08004000 */  jr         $v0
/* 3A58 80013258 00000000 */   nop
jlabel .L8001325C
/* 3A5C 8001325C 58808427 */  addiu      $a0, $gp, %gp_rel(debugHealthLevel)
/* 3A60 80013260 F54B000C */  jal        DEBUG_FillUpHealth
/* 3A64 80013264 01001026 */   addiu     $s0, $s0, 0x1
/* 3A68 80013268 004D0008 */  j          .L80013400
/* 3A6C 8001326C 1700022A */   slti      $v0, $s0, 0x17
jlabel .L80013270
/* 3A70 80013270 5880828F */  lw         $v0, %gp_rel(debugHealthLevel)($gp)
/* 3A74 80013274 00000000 */  nop
/* 3A78 80013278 01004224 */  addiu      $v0, $v0, 0x1
/* 3A7C 8001327C 588082AF */  sw         $v0, %gp_rel(debugHealthLevel)($gp)
/* 3A80 80013280 05004228 */  slti       $v0, $v0, 0x5
/* 3A84 80013284 03004014 */  bnez       $v0, .L80013294
/* 3A88 80013288 00000000 */   nop
jlabel .L8001328C
/* 3A8C 8001328C 04000224 */  addiu      $v0, $zero, 0x4
/* 3A90 80013290 588082AF */  sw         $v0, %gp_rel(debugHealthLevel)($gp)
.L80013294:
/* 3A94 80013294 58808427 */  addiu      $a0, $gp, %gp_rel(debugHealthLevel)
/* 3A98 80013298 E34B000C */  jal        DEBUG_UpdateHealth
/* 3A9C 8001329C 01001026 */   addiu     $s0, $s0, 0x1
/* 3AA0 800132A0 004D0008 */  j          .L80013400
/* 3AA4 800132A4 1700022A */   slti      $v0, $s0, 0x17
jlabel .L800132A8
/* 3AA8 800132A8 989F020C */  jal        RAZIEL_DebugHurtRaziel
/* 3AAC 800132AC 01001026 */   addiu     $s0, $s0, 0x1
/* 3AB0 800132B0 004D0008 */  j          .L80013400
/* 3AB4 800132B4 1700022A */   slti      $v0, $s0, 0x17
jlabel .L800132B8
/* 3AB8 800132B8 CC93020C */  jal        RAZIEL_DebugManaFillUp
/* 3ABC 800132BC 01001026 */   addiu     $s0, $s0, 0x1
/* 3AC0 800132C0 004D0008 */  j          .L80013400
/* 3AC4 800132C4 1700022A */   slti      $v0, $s0, 0x17
jlabel .L800132C8
/* 3AC8 800132C8 06000224 */  addiu      $v0, $zero, 0x6
/* 3ACC 800132CC 5C8082AF */  sw         $v0, %gp_rel(debugManaLevel)($gp)
/* 3AD0 800132D0 5C808427 */  addiu      $a0, $gp, %gp_rel(debugManaLevel)
/* 3AD4 800132D4 EC4B000C */  jal        DEBUG_UpdateMana
/* 3AD8 800132D8 01001026 */   addiu     $s0, $s0, 0x1
/* 3ADC 800132DC 004D0008 */  j          .L80013400
/* 3AE0 800132E0 1700022A */   slti      $v0, $s0, 0x17
jlabel .L800132E4
/* 3AE4 800132E4 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 3AE8 800132E8 00000000 */  nop
/* 3AEC 800132EC 20004234 */  ori        $v0, $v0, 0x20
/* 3AF0 800132F0 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
jlabel .L800132F4
/* 3AF4 800132F4 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 3AF8 800132F8 00000000 */  nop
/* 3AFC 800132FC 10004234 */  ori        $v0, $v0, 0x10
/* 3B00 80013300 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
jlabel .L80013304
/* 3B04 80013304 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 3B08 80013308 00000000 */  nop
/* 3B0C 8001330C 08004234 */  ori        $v0, $v0, 0x8
/* 3B10 80013310 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
jlabel .L80013314
/* 3B14 80013314 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 3B18 80013318 00000000 */  nop
/* 3B1C 8001331C 04004234 */  ori        $v0, $v0, 0x4
/* 3B20 80013320 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
jlabel .L80013324
/* 3B24 80013324 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 3B28 80013328 00000000 */  nop
/* 3B2C 8001332C 02004234 */  ori        $v0, $v0, 0x2
/* 3B30 80013330 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
jlabel .L80013334
/* 3B34 80013334 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 3B38 80013338 FD4C0008 */  j          .L800133F4
/* 3B3C 8001333C 01004234 */   ori       $v0, $v0, 0x1
jlabel .L80013340
/* 3B40 80013340 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 3B44 80013344 FD4C0008 */  j          .L800133F4
/* 3B48 80013348 00804234 */   ori       $v0, $v0, 0x8000
jlabel .L8001334C
/* 3B4C 8001334C 5CAB828F */  lw         $v0, %gp_rel(debugRazielFlags2)($gp)
/* 3B50 80013350 00000000 */  nop
/* 3B54 80013354 00804234 */  ori        $v0, $v0, 0x8000
/* 3B58 80013358 5CAB82AF */  sw         $v0, %gp_rel(debugRazielFlags2)($gp)
/* 3B5C 8001335C FF4C0008 */  j          .L800133FC
/* 3B60 80013360 01001026 */   addiu     $s0, $s0, 0x1
jlabel .L80013364
/* 3B64 80013364 5CAB828F */  lw         $v0, %gp_rel(debugRazielFlags2)($gp)
/* 3B68 80013368 0100033C */  lui        $v1, (0x10000 >> 16)
/* 3B6C 8001336C 25104300 */  or         $v0, $v0, $v1
/* 3B70 80013370 5CAB82AF */  sw         $v0, %gp_rel(debugRazielFlags2)($gp)
/* 3B74 80013374 FF4C0008 */  j          .L800133FC
/* 3B78 80013378 01001026 */   addiu     $s0, $s0, 0x1
jlabel .L8001337C
/* 3B7C 8001337C 5CAB828F */  lw         $v0, %gp_rel(debugRazielFlags2)($gp)
/* 3B80 80013380 00000000 */  nop
/* 3B84 80013384 00104234 */  ori        $v0, $v0, 0x1000
/* 3B88 80013388 5CAB82AF */  sw         $v0, %gp_rel(debugRazielFlags2)($gp)
/* 3B8C 8001338C FF4C0008 */  j          .L800133FC
/* 3B90 80013390 01001026 */   addiu     $s0, $s0, 0x1
jlabel .L80013394
/* 3B94 80013394 60AB828F */  lw         $v0, %gp_rel(debugRazielFlags3)($gp)
/* 3B98 80013398 F64C0008 */  j          .L800133D8
/* 3B9C 8001339C 0400033C */   lui       $v1, (0x40000 >> 16)
jlabel .L800133A0
/* 3BA0 800133A0 60AB828F */  lw         $v0, %gp_rel(debugRazielFlags3)($gp)
/* 3BA4 800133A4 F64C0008 */  j          .L800133D8
/* 3BA8 800133A8 0800033C */   lui       $v1, (0x80000 >> 16)
jlabel .L800133AC
/* 3BAC 800133AC 60AB828F */  lw         $v0, %gp_rel(debugRazielFlags3)($gp)
/* 3BB0 800133B0 F64C0008 */  j          .L800133D8
/* 3BB4 800133B4 1000033C */   lui       $v1, (0x100000 >> 16)
jlabel .L800133B8
/* 3BB8 800133B8 60AB828F */  lw         $v0, %gp_rel(debugRazielFlags3)($gp)
/* 3BBC 800133BC F64C0008 */  j          .L800133D8
/* 3BC0 800133C0 2000033C */   lui       $v1, (0x200000 >> 16)
jlabel .L800133C4
/* 3BC4 800133C4 60AB828F */  lw         $v0, %gp_rel(debugRazielFlags3)($gp)
/* 3BC8 800133C8 F64C0008 */  j          .L800133D8
/* 3BCC 800133CC 4000033C */   lui       $v1, (0x400000 >> 16)
jlabel .L800133D0
/* 3BD0 800133D0 60AB828F */  lw         $v0, %gp_rel(debugRazielFlags3)($gp)
/* 3BD4 800133D4 8000033C */  lui        $v1, (0x800000 >> 16)
.L800133D8:
/* 3BD8 800133D8 25104300 */  or         $v0, $v0, $v1
/* 3BDC 800133DC 60AB82AF */  sw         $v0, %gp_rel(debugRazielFlags3)($gp)
/* 3BE0 800133E0 FF4C0008 */  j          .L800133FC
/* 3BE4 800133E4 01001026 */   addiu     $s0, $s0, 0x1
jlabel .L800133E8
/* 3BE8 800133E8 58AB828F */  lw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 3BEC 800133EC 00000000 */  nop
/* 3BF0 800133F0 5F004234 */  ori        $v0, $v0, 0x5F
.L800133F4:
/* 3BF4 800133F4 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
.L800133F8:
/* 3BF8 800133F8 01001026 */  addiu      $s0, $s0, 0x1
.L800133FC:
/* 3BFC 800133FC 1700022A */  slti       $v0, $s0, 0x17
.L80013400:
/* 3C00 80013400 74FF4014 */  bnez       $v0, .L800131D4
/* 3C04 80013404 00191000 */   sll       $v1, $s0, 4
/* 3C08 80013408 05006012 */  beqz       $s3, .L80013420
/* 3C0C 8001340C 15000424 */   addiu     $a0, $zero, 0x15
/* 3C10 80013410 50000524 */  addiu      $a1, $zero, 0x50
/* 3C14 80013414 40000624 */  addiu      $a2, $zero, 0x40
/* 3C18 80013418 2402010C */  jal        SndPlayVolPan
/* 3C1C 8001341C 32000724 */   addiu     $a3, $zero, 0x32
.L80013420:
/* 3C20 80013420 2400BF8F */  lw         $ra, 0x24($sp)
/* 3C24 80013424 2000B48F */  lw         $s4, 0x20($sp)
/* 3C28 80013428 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3C2C 8001342C 148A92AF */  sw         $s2, %gp_rel(cheatCodeLastCommand)($gp)
/* 3C30 80013430 1800B28F */  lw         $s2, 0x18($sp)
/* 3C34 80013434 1400B18F */  lw         $s1, 0x14($sp)
/* 3C38 80013438 1000B08F */  lw         $s0, 0x10($sp)
/* 3C3C 8001343C 0800E003 */  jr         $ra
/* 3C40 80013440 2800BD27 */   addiu     $sp, $sp, 0x28
.size process_cheat_codes, . - process_cheat_codes
