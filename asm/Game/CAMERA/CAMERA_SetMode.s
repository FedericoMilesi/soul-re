.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetMode
/* 623C 80015A3C B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 6240 80015A40 3800B2AF */  sw         $s2, 0x38($sp)
/* 6244 80015A44 21908000 */  addu       $s2, $a0, $zero
/* 6248 80015A48 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 624C 80015A4C 2198A000 */  addu       $s3, $a1, $zero
/* 6250 80015A50 4000BFAF */  sw         $ra, 0x40($sp)
/* 6254 80015A54 3400B1AF */  sw         $s1, 0x34($sp)
/* 6258 80015A58 3000B0AF */  sw         $s0, 0x30($sp)
/* 625C 80015A5C F0005086 */  lh         $s0, 0xF0($s2)
/* 6260 80015A60 F0004396 */  lhu        $v1, 0xF0($s2)
/* 6264 80015A64 05001316 */  bne        $s0, $s3, .L80015A7C
/* 6268 80015A68 FEFF6224 */   addiu     $v0, $v1, -0x2
/* 626C 80015A6C F4FF6226 */  addiu      $v0, $s3, -0xC
/* 6270 80015A70 0200422C */  sltiu      $v0, $v0, 0x2
/* 6274 80015A74 16014014 */  bnez       $v0, .L80015ED0
/* 6278 80015A78 FEFF6224 */   addiu     $v0, $v1, -0x2
.L80015A7C:
/* 627C 80015A7C 00140200 */  sll        $v0, $v0, 16
/* 6280 80015A80 031C0200 */  sra        $v1, $v0, 16
/* 6284 80015A84 0C00622C */  sltiu      $v0, $v1, 0xC
/* 6288 80015A88 54004010 */  beqz       $v0, .L80015BDC
/* 628C 80015A8C 0180023C */   lui       $v0, %hi(jtbl_800100A4)
/* 6290 80015A90 A4004224 */  addiu      $v0, $v0, %lo(jtbl_800100A4)
/* 6294 80015A94 80180300 */  sll        $v1, $v1, 2
/* 6298 80015A98 21186200 */  addu       $v1, $v1, $v0
/* 629C 80015A9C 0000628C */  lw         $v0, 0x0($v1)
/* 62A0 80015AA0 00000000 */  nop
/* 62A4 80015AA4 08004000 */  jr         $v0
/* 62A8 80015AA8 00000000 */   nop
jlabel .L80015AAC
/* 62AC 80015AAC 8970000C */  jal        CAMERA_EndLook
/* 62B0 80015AB0 21204002 */   addu      $a0, $s2, $zero
/* 62B4 80015AB4 F0004586 */  lh         $a1, 0xF0($s2)
/* 62B8 80015AB8 1D54000C */  jal        CAMERA_SaveMode
/* 62BC 80015ABC 21204002 */   addu      $a0, $s2, $zero
/* 62C0 80015AC0 05000224 */  addiu      $v0, $zero, 0x5
/* 62C4 80015AC4 46006216 */  bne        $s3, $v0, .L80015BE0
/* 62C8 80015AC8 1100622E */   sltiu     $v0, $s3, 0x11
/* 62CC 80015ACC 21204002 */  addu       $a0, $s2, $zero
/* 62D0 80015AD0 07000524 */  addiu      $a1, $zero, 0x7
/* 62D4 80015AD4 B6014396 */  lhu        $v1, 0x1B6($s2)
/* 62D8 80015AD8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 62DC 80015ADC DCAB82A7 */  sh         $v0, %gp_rel(CenterFlag)($gp)
/* 62E0 80015AE0 1556000C */  jal        CAMERA_Save
/* 62E4 80015AE4 400143A6 */   sh        $v1, 0x140($s2)
/* 62E8 80015AE8 F8560008 */  j          .L80015BE0
/* 62EC 80015AEC 1100622E */   sltiu     $v0, $s3, 0x11
jlabel .L80015AF0
/* 62F0 80015AF0 F0004586 */  lh         $a1, 0xF0($s2)
/* 62F4 80015AF4 1D54000C */  jal        CAMERA_SaveMode
/* 62F8 80015AF8 21204002 */   addu      $a0, $s2, $zero
/* 62FC 80015AFC F8560008 */  j          .L80015BE0
/* 6300 80015B00 1100622E */   sltiu     $v0, $s3, 0x11
jlabel .L80015B04
/* 6304 80015B04 05000224 */  addiu      $v0, $zero, 0x5
/* 6308 80015B08 35006212 */  beq        $s3, $v0, .L80015BE0
/* 630C 80015B0C 1100622E */   sltiu     $v0, $s3, 0x11
/* 6310 80015B10 F0004586 */  lh         $a1, 0xF0($s2)
/* 6314 80015B14 1D54000C */  jal        CAMERA_SaveMode
/* 6318 80015B18 21204002 */   addu      $a0, $s2, $zero
/* 631C 80015B1C B0004326 */  addiu      $v1, $s2, 0xB0
/* 6320 80015B20 B0004296 */  lhu        $v0, 0xB0($s2)
/* 6324 80015B24 02006494 */  lhu        $a0, 0x2($v1)
/* 6328 80015B28 04006594 */  lhu        $a1, 0x4($v1)
/* 632C 80015B2C B20142A6 */  sh         $v0, 0x1B2($s2)
/* 6330 80015B30 B2014226 */  addiu      $v0, $s2, 0x1B2
/* 6334 80015B34 020044A4 */  sh         $a0, 0x2($v0)
/* 6338 80015B38 040045A4 */  sh         $a1, 0x4($v0)
/* 633C 80015B3C B0004296 */  lhu        $v0, 0xB0($s2)
/* 6340 80015B40 02006494 */  lhu        $a0, 0x2($v1)
/* 6344 80015B44 04006394 */  lhu        $v1, 0x4($v1)
/* 6348 80015B48 3C0142A6 */  sh         $v0, 0x13C($s2)
/* 634C 80015B4C 3C014226 */  addiu      $v0, $s2, 0x13C
/* 6350 80015B50 020044A4 */  sh         $a0, 0x2($v0)
/* 6354 80015B54 1800A427 */  addiu      $a0, $sp, 0x18
/* 6358 80015B58 040043A4 */  sh         $v1, 0x4($v0)
/* 635C 80015B5C B0004296 */  lhu        $v0, 0xB0($s2)
/* 6360 80015B60 00004696 */  lhu        $a2, 0x0($s2)
/* 6364 80015B64 02004796 */  lhu        $a3, 0x2($s2)
/* 6368 80015B68 04004896 */  lhu        $t0, 0x4($s2)
/* 636C 80015B6C 00014326 */  addiu      $v1, $s2, 0x100
/* 6370 80015B70 B20442A6 */  sh         $v0, 0x4B2($s2)
/* 6374 80015B74 00014296 */  lhu        $v0, 0x100($s2)
/* 6378 80015B78 02006594 */  lhu        $a1, 0x2($v1)
/* 637C 80015B7C 04006394 */  lhu        $v1, 0x4($v1)
/* 6380 80015B80 23104600 */  subu       $v0, $v0, $a2
/* 6384 80015B84 2328A700 */  subu       $a1, $a1, $a3
/* 6388 80015B88 23186800 */  subu       $v1, $v1, $t0
/* 638C 80015B8C 1800A2A7 */  sh         $v0, 0x18($sp)
/* 6390 80015B90 020085A4 */  sh         $a1, 0x2($a0)
/* 6394 80015B94 9C58000C */  jal        CAMERA_LengthSVector
/* 6398 80015B98 040083A4 */   sh        $v1, 0x4($a0)
/* 639C 80015B9C 060142A6 */  sh         $v0, 0x106($s2)
/* 63A0 80015BA0 4C8E80AF */  sw         $zero, %gp_rel(roll_target)($gp)
/* 63A4 80015BA4 508E80AF */  sw         $zero, %gp_rel(current_roll_amount)($gp)
/* 63A8 80015BA8 548E80AF */  sw         $zero, %gp_rel(roll_inc)($gp)
/* 63AC 80015BAC F8560008 */  j          .L80015BE0
/* 63B0 80015BB0 1100622E */   sltiu     $v0, $s3, 0x11
jlabel .L80015BB4
/* 63B4 80015BB4 F0004586 */  lh         $a1, 0xF0($s2)
/* 63B8 80015BB8 1D54000C */  jal        CAMERA_SaveMode
/* 63BC 80015BBC 21204002 */   addu      $a0, $s2, $zero
/* 63C0 80015BC0 05000224 */  addiu      $v0, $zero, 0x5
/* 63C4 80015BC4 03006216 */  bne        $s3, $v0, .L80015BD4
/* 63C8 80015BC8 21204002 */   addu      $a0, $s2, $zero
/* 63CC 80015BCC 1556000C */  jal        CAMERA_Save
/* 63D0 80015BD0 07000524 */   addiu     $a1, $zero, 0x7
.L80015BD4:
/* 63D4 80015BD4 F453000C */  jal        CAMERA_CreateNewFocuspoint
/* 63D8 80015BD8 21204002 */   addu      $a0, $s2, $zero
jlabel .L80015BDC
/* 63DC 80015BDC 1100622E */  sltiu      $v0, $s3, 0x11
.L80015BE0:
/* 63E0 80015BE0 AF004010 */  beqz       $v0, .L80015EA0
/* 63E4 80015BE4 0180023C */   lui       $v0, %hi(jtbl_800100D4)
/* 63E8 80015BE8 D4004224 */  addiu      $v0, $v0, %lo(jtbl_800100D4)
/* 63EC 80015BEC 80181300 */  sll        $v1, $s3, 2
/* 63F0 80015BF0 21186200 */  addu       $v1, $v1, $v0
/* 63F4 80015BF4 0000628C */  lw         $v0, 0x0($v1)
/* 63F8 80015BF8 00000000 */  nop
/* 63FC 80015BFC 08004000 */  jr         $v0
/* 6400 80015C00 00000000 */   nop
jlabel .L80015C04
/* 6404 80015C04 21204002 */  addu       $a0, $s2, $zero
/* 6408 80015C08 CB53000C */  jal        CAMERA_SetProjDistance
/* 640C 80015C0C 40010524 */   addiu     $a1, $zero, 0x140
/* 6410 80015C10 1C04428E */  lw         $v0, 0x41C($s2)
/* 6414 80015C14 00000000 */  nop
/* 6418 80015C18 240442AE */  sw         $v0, 0x424($s2)
/* 641C 80015C1C 2004428E */  lw         $v0, 0x420($s2)
/* 6420 80015C20 2404438E */  lw         $v1, 0x424($s2)
/* 6424 80015C24 360440A6 */  sh         $zero, 0x436($s2)
/* 6428 80015C28 1C0440AE */  sw         $zero, 0x41C($s2)
/* 642C 80015C2C 300440A6 */  sh         $zero, 0x430($s2)
/* 6430 80015C30 2E0440A6 */  sh         $zero, 0x42E($s2)
/* 6434 80015C34 2C0440A6 */  sh         $zero, 0x42C($s2)
/* 6438 80015C38 200440AE */  sw         $zero, 0x420($s2)
/* 643C 80015C3C 02006010 */  beqz       $v1, .L80015C48
/* 6440 80015C40 280442AE */   sw        $v0, 0x428($s2)
/* 6444 80015C44 100060AC */  sw         $zero, 0x10($v1)
.L80015C48:
/* 6448 80015C48 2804428E */  lw         $v0, 0x428($s2)
/* 644C 80015C4C 00000000 */  nop
/* 6450 80015C50 02004010 */  beqz       $v0, .L80015C5C
/* 6454 80015C54 00000000 */   nop
/* 6458 80015C58 100040AC */  sw         $zero, 0x10($v0)
.L80015C5C:
/* 645C 80015C5C 2404458E */  lw         $a1, 0x424($s2)
/* 6460 80015C60 00000000 */  nop
/* 6464 80015C64 4D00A010 */  beqz       $a1, .L80015D9C
/* 6468 80015C68 F00053A6 */   sh        $s3, 0xF0($s2)
/* 646C 80015C6C 04000224 */  addiu      $v0, $zero, 0x4
/* 6470 80015C70 03006212 */  beq        $s3, $v0, .L80015C80
/* 6474 80015C74 02000224 */   addiu     $v0, $zero, 0x2
/* 6478 80015C78 24006216 */  bne        $s3, $v0, .L80015D0C
/* 647C 80015C7C 00000000 */   nop
.L80015C80:
/* 6480 80015C80 2000B127 */  addiu      $s1, $sp, 0x20
/* 6484 80015C84 21202002 */  addu       $a0, $s1, $zero
/* 6488 80015C88 3C014296 */  lhu        $v0, 0x13C($s2)
/* 648C 80015C8C AA014526 */  addiu      $a1, $s2, 0x1AA
/* 6490 80015C90 84AC82A7 */  sh         $v0, %gp_rel(splinecam_helprot)($gp)
/* 6494 80015C94 40014296 */  lhu        $v0, 0x140($s2)
/* 6498 80015C98 84AC9027 */  addiu      $s0, $gp, %gp_rel(splinecam_helprot)
/* 649C 80015C9C 00084224 */  addiu      $v0, $v0, 0x800
/* 64A0 80015CA0 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 64A4 80015CA4 88AC82A7 */  sh         $v0, %gp_rel(splinecam_helprot + 0x4)($gp)
/* 64A8 80015CA8 A8014786 */  lh         $a3, 0x1A8($s2)
/* 64AC 80015CAC 6F5A000C */  jal        CAMERA_CalcPosition
/* 64B0 80015CB0 21300002 */   addu      $a2, $s0, $zero
/* 64B4 80015CB4 2404428E */  lw         $v0, 0x424($s2)
/* 64B8 80015CB8 21282002 */  addu       $a1, $s1, $zero
/* 64BC 80015CBC 0000448C */  lw         $a0, 0x0($v0)
/* 64C0 80015CC0 0406010C */  jal        SplineGetNearestPoint
/* 64C4 80015CC4 1000A627 */   addiu     $a2, $sp, 0x10
/* 64C8 80015CC8 21200002 */  addu       $a0, $s0, $zero
/* 64CC 80015CCC 0801458E */  lw         $a1, 0x108($s2)
/* 64D0 80015CD0 2800A627 */  addiu      $a2, $sp, 0x28
/* 64D4 80015CD4 2800A2AF */  sw         $v0, 0x28($sp)
/* 64D8 80015CD8 C45E000C */  jal        CAMERA_CalcRotation
/* 64DC 80015CDC 5C00A524 */   addiu     $a1, $a1, 0x5C
/* 64E0 80015CE0 1000A287 */  lh         $v0, 0x10($sp)
/* 64E4 80015CE4 2404438E */  lw         $v1, 0x424($s2)
/* 64E8 80015CE8 21284002 */  addu       $a1, $s2, $zero
/* 64EC 80015CEC 3C0442AE */  sw         $v0, 0x43C($s2)
/* 64F0 80015CF0 0000648C */  lw         $a0, 0x0($v1)
/* 64F4 80015CF4 0406010C */  jal        SplineGetNearestPoint
/* 64F8 80015CF8 1000A627 */   addiu     $a2, $sp, 0x10
/* 64FC 80015CFC 1000A387 */  lh         $v1, 0x10($sp)
/* 6500 80015D00 2800A2AF */  sw         $v0, 0x28($sp)
/* 6504 80015D04 47570008 */  j          .L80015D1C
/* 6508 80015D08 380443AE */   sw        $v1, 0x438($s2)
.L80015D0C:
/* 650C 80015D0C 0000A48C */  lw         $a0, 0x0($a1)
/* 6510 80015D10 CE05010C */  jal        SplineGetFirstPoint
/* 6514 80015D14 1000A524 */   addiu     $a1, $a1, 0x10
/* 6518 80015D18 2800A2AF */  sw         $v0, 0x28($sp)
.L80015D1C:
/* 651C 80015D1C 2800A48F */  lw         $a0, 0x28($sp)
/* 6520 80015D20 00000000 */  nop
/* 6524 80015D24 1E008010 */  beqz       $a0, .L80015DA0
/* 6528 80015D28 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 652C 80015D2C 00008294 */  lhu        $v0, 0x0($a0)
/* 6530 80015D30 02008394 */  lhu        $v1, 0x2($a0)
/* 6534 80015D34 04008494 */  lhu        $a0, 0x4($a0)
/* 6538 80015D38 980142A6 */  sh         $v0, 0x198($s2)
/* 653C 80015D3C 98014226 */  addiu      $v0, $s2, 0x198
/* 6540 80015D40 020043A4 */  sh         $v1, 0x2($v0)
/* 6544 80015D44 040044A4 */  sh         $a0, 0x4($v0)
/* 6548 80015D48 05000224 */  addiu      $v0, $zero, 0x5
/* 654C 80015D4C 02006216 */  bne        $s3, $v0, .L80015D58
/* 6550 80015D50 03000224 */   addiu     $v0, $zero, 0x3
/* 6554 80015D54 F40042A6 */  sh         $v0, 0xF4($s2)
.L80015D58:
/* 6558 80015D58 2804458E */  lw         $a1, 0x428($s2)
/* 655C 80015D5C 00000000 */  nop
/* 6560 80015D60 0F00A010 */  beqz       $a1, .L80015DA0
/* 6564 80015D64 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 6568 80015D68 0000A48C */  lw         $a0, 0x0($a1)
/* 656C 80015D6C CE05010C */  jal        SplineGetFirstPoint
/* 6570 80015D70 1000A524 */   addiu     $a1, $a1, 0x10
/* 6574 80015D74 21204000 */  addu       $a0, $v0, $zero
/* 6578 80015D78 09008010 */  beqz       $a0, .L80015DA0
/* 657C 80015D7C FFFF0224 */   addiu     $v0, $zero, -0x1
/* 6580 80015D80 00008294 */  lhu        $v0, 0x0($a0)
/* 6584 80015D84 02008394 */  lhu        $v1, 0x2($a0)
/* 6588 80015D88 04008494 */  lhu        $a0, 0x4($a0)
/* 658C 80015D8C AA0142A6 */  sh         $v0, 0x1AA($s2)
/* 6590 80015D90 AA014226 */  addiu      $v0, $s2, 0x1AA
/* 6594 80015D94 020043A4 */  sh         $v1, 0x2($v0)
/* 6598 80015D98 040044A4 */  sh         $a0, 0x4($v0)
.L80015D9C:
/* 659C 80015D9C FFFF0224 */  addiu      $v0, $zero, -0x1
.L80015DA0:
/* 65A0 80015DA0 3F01498A */  lwl        $t1, 0x13F($s2)
/* 65A4 80015DA4 3C01499A */  lwr        $t1, 0x13C($s2)
/* 65A8 80015DA8 43014A8A */  lwl        $t2, 0x143($s2)
/* 65AC 80015DAC 40014A9A */  lwr        $t2, 0x140($s2)
/* 65B0 80015DB0 A30149AA */  swl        $t1, 0x1A3($s2)
/* 65B4 80015DB4 A00149BA */  swr        $t1, 0x1A0($s2)
/* 65B8 80015DB8 A7014AAA */  swl        $t2, 0x1A7($s2)
/* 65BC 80015DBC A4014ABA */  swr        $t2, 0x1A4($s2)
/* 65C0 80015DC0 DCAB82A7 */  sh         $v0, %gp_rel(CenterFlag)($gp)
/* 65C4 80015DC4 E800428E */  lw         $v0, 0xE8($s2)
/* 65C8 80015DC8 FFDF0324 */  addiu      $v1, $zero, -0x2001
/* 65CC 80015DCC F80040A6 */  sh         $zero, 0xF8($s2)
/* 65D0 80015DD0 BC0440A6 */  sh         $zero, 0x4BC($s2)
/* 65D4 80015DD4 24104300 */  and        $v0, $v0, $v1
/* 65D8 80015DD8 A9570008 */  j          .L80015EA4
/* 65DC 80015DDC E80042AE */   sw        $v0, 0xE8($s2)
jlabel .L80015DE0
/* 65E0 80015DE0 21204002 */  addu       $a0, $s2, $zero
/* 65E4 80015DE4 CB53000C */  jal        CAMERA_SetProjDistance
/* 65E8 80015DE8 40010524 */   addiu     $a1, $zero, 0x140
/* 65EC 80015DEC 10000224 */  addiu      $v0, $zero, 0x10
/* 65F0 80015DF0 05006216 */  bne        $s3, $v0, .L80015E08
/* 65F4 80015DF4 FFDF0324 */   addiu     $v1, $zero, -0x2001
/* 65F8 80015DF8 E800428E */  lw         $v0, 0xE8($s2)
/* 65FC 80015DFC 0C001324 */  addiu      $s3, $zero, 0xC
/* 6600 80015E00 85570008 */  j          .L80015E14
/* 6604 80015E04 00204234 */   ori       $v0, $v0, 0x2000
.L80015E08:
/* 6608 80015E08 E800428E */  lw         $v0, 0xE8($s2)
/* 660C 80015E0C 00000000 */  nop
/* 6610 80015E10 24104300 */  and        $v0, $v0, $v1
.L80015E14:
/* 6614 80015E14 E80042AE */  sw         $v0, 0xE8($s2)
/* 6618 80015E18 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 661C 80015E1C BFFF0324 */  addiu      $v1, $zero, -0x41
/* 6620 80015E20 749193AF */  sw         $s3, %gp_rel(cameraMode)($gp)
/* 6624 80015E24 24104300 */  and        $v0, $v0, $v1
/* 6628 80015E28 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 662C 80015E2C 00141300 */  sll        $v0, $s3, 16
/* 6630 80015E30 83130200 */  sra        $v0, $v0, 14
/* 6634 80015E34 088E8327 */  addiu      $v1, $gp, %gp_rel(camera_modeToIndex)
/* 6638 80015E38 21104300 */  addu       $v0, $v0, $v1
/* 663C 80015E3C F00053A6 */  sh         $s3, 0xF0($s2)
/* 6640 80015E40 0000448C */  lw         $a0, 0x0($v0)
/* 6644 80015E44 F4014386 */  lh         $v1, 0x1F4($s2)
/* 6648 80015E48 40100400 */  sll        $v0, $a0, 1
/* 664C 80015E4C 21104400 */  addu       $v0, $v0, $a0
/* 6650 80015E50 21104300 */  addu       $v0, $v0, $v1
/* 6654 80015E54 80100200 */  sll        $v0, $v0, 2
/* 6658 80015E58 21104202 */  addu       $v0, $s2, $v0
/* 665C 80015E5C 2C024394 */  lhu        $v1, 0x22C($v0)
/* 6660 80015E60 08000224 */  addiu      $v0, $zero, 0x8
/* 6664 80015E64 C40142A6 */  sh         $v0, 0x1C4($s2)
/* 6668 80015E68 A2E5023C */  lui        $v0, (0xE5A20000 >> 16)
/* 666C 80015E6C 700442AE */  sw         $v0, 0x470($s2)
/* 6670 80015E70 05000224 */  addiu      $v0, $zero, 0x5
/* 6674 80015E74 700140A6 */  sh         $zero, 0x170($s2)
/* 6678 80015E78 0A000216 */  bne        $s0, $v0, .L80015EA4
/* 667C 80015E7C A80143A6 */   sh        $v1, 0x1A8($s2)
/* 6680 80015E80 0801428E */  lw         $v0, 0x108($s2)
/* 6684 80015E84 00000000 */  nop
/* 6688 80015E88 06004010 */  beqz       $v0, .L80015EA4
/* 668C 80015E8C 21204002 */   addu      $a0, $s2, $zero
/* 6690 80015E90 B95A000C */  jal        CAMERA_SetFocus
/* 6694 80015E94 AA014526 */   addiu     $a1, $s2, 0x1AA
/* 6698 80015E98 A9570008 */  j          .L80015EA4
/* 669C 80015E9C 00000000 */   nop
jlabel .L80015EA0
/* 66A0 80015EA0 F00053A6 */  sh         $s3, 0xF0($s2)
jlabel .L80015EA4
/* 66A4 80015EA4 A8014296 */  lhu        $v0, 0x1A8($s2)
/* 66A8 80015EA8 00000000 */  nop
/* 66AC 80015EAC B00142A6 */  sh         $v0, 0x1B0($s2)
/* 66B0 80015EB0 B501498A */  lwl        $t1, 0x1B5($s2)
/* 66B4 80015EB4 B201499A */  lwr        $t1, 0x1B2($s2)
/* 66B8 80015EB8 B9014A8A */  lwl        $t2, 0x1B9($s2)
/* 66BC 80015EBC B6014A9A */  lwr        $t2, 0x1B6($s2)
/* 66C0 80015EC0 BF0149AA */  swl        $t1, 0x1BF($s2)
/* 66C4 80015EC4 BC0149BA */  swr        $t1, 0x1BC($s2)
/* 66C8 80015EC8 C3014AAA */  swl        $t2, 0x1C3($s2)
/* 66CC 80015ECC C0014ABA */  swr        $t2, 0x1C0($s2)
.L80015ED0:
/* 66D0 80015ED0 4000BF8F */  lw         $ra, 0x40($sp)
/* 66D4 80015ED4 3C00B38F */  lw         $s3, 0x3C($sp)
/* 66D8 80015ED8 3800B28F */  lw         $s2, 0x38($sp)
/* 66DC 80015EDC 3400B18F */  lw         $s1, 0x34($sp)
/* 66E0 80015EE0 3000B08F */  lw         $s0, 0x30($sp)
/* 66E4 80015EE4 0800E003 */  jr         $ra
/* 66E8 80015EE8 4800BD27 */   addiu     $sp, $sp, 0x48
.size CAMERA_SetMode, . - CAMERA_SetMode
