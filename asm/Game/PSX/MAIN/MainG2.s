.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MainG2
/* 29BFC 800393FC C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 29C00 80039400 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 29C04 80039404 21B88000 */  addu       $s7, $a0, $zero
/* 29C08 80039408 2400B5AF */  sw         $s5, 0x24($sp)
/* 29C0C 8003940C 21A80000 */  addu       $s5, $zero, $zero
/* 29C10 80039410 3000BFAF */  sw         $ra, 0x30($sp)
/* 29C14 80039414 2800B6AF */  sw         $s6, 0x28($sp)
/* 29C18 80039418 2000B4AF */  sw         $s4, 0x20($sp)
/* 29C1C 8003941C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 29C20 80039420 1800B2AF */  sw         $s2, 0x18($sp)
/* 29C24 80039424 1400B1AF */  sw         $s1, 0x14($sp)
/* 29C28 80039428 75E3000C */  jal        CheckForDevStation
/* 29C2C 8003942C 1000B0AF */   sw        $s0, 0x10($sp)
/* 29C30 80039430 2120E002 */  addu       $a0, $s7, $zero
/* 29C34 80039434 00020524 */  addiu      $a1, $zero, 0x200
/* 29C38 80039438 F0000624 */  addiu      $a2, $zero, 0xF0
/* 29C3C 8003943C 38C09227 */  addiu      $s2, $gp, %gp_rel(mainTrackerX)
/* 29C40 80039440 C8BD9327 */  addiu      $s3, $gp, %gp_rel(gameTrackerX)
/* 29C44 80039444 549480A3 */  sb         $zero, %gp_rel(mainOptionsInit)($gp)
/* 29C48 80039448 B357020C */  jal        MainG2_InitEngine
/* 29C4C 8003944C 2138A002 */   addu      $a3, $s5, $zero
/* 29C50 80039450 73014010 */  beqz       $v0, .L80039A20
/* 29C54 80039454 00000000 */   nop
/* 29C58 80039458 2440010C */  jal        MEMPACK_Init
/* 29C5C 8003945C 02001624 */   addiu     $s6, $zero, 0x2
/* 29C60 80039460 B2DC000C */  jal        LOAD_InitCd
/* 29C64 80039464 00000000 */   nop
/* 29C68 80039468 D5E2000C */  jal        StartTimer
/* 29C6C 8003946C 00000000 */   nop
/* 29C70 80039470 0D80043C */  lui        $a0, %hi(mainMenuFading + 0x17E)
/* 29C74 80039474 DC0C8424 */  addiu      $a0, $a0, %lo(mainMenuFading + 0x17E)
/* 29C78 80039478 0D80053C */  lui        $a1, %hi(mainMenuFading + 0x18E)
/* 29C7C 8003947C E77F010C */  jal        STREAM_InitLoader
/* 29C80 80039480 EC0CA524 */   addiu     $a1, $a1, %lo(mainMenuFading + 0x18E)
/* 29C84 80039484 8FDD020C */  jal        localstr_set_language
/* 29C88 80039488 FFFF0424 */   addiu     $a0, $zero, -0x1
/* 29C8C 8003948C 46B7000C */  jal        GAMELOOP_SystemInit
/* 29C90 80039490 21206002 */   addu      $a0, $s3, $zero
/* 29C94 80039494 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 29C98 80039498 21286002 */  addu       $a1, $s3, $zero
/* 29C9C 8003949C FF000224 */  addiu      $v0, $zero, 0xFF
/* 29CA0 800394A0 C90162A2 */  sb         $v0, 0x1C9($s3)
/* 29CA4 800394A4 C80162A2 */  sb         $v0, 0x1C8($s3)
/* 29CA8 800394A8 5CBC8227 */  addiu      $v0, $gp, %gp_rel(disp)
/* 29CAC 800394AC F0E1000C */  jal        ProcessArgs
/* 29CB0 800394B0 240162AE */   sw        $v0, 0x124($s3)
/* 29CB4 800394B4 9CE1000C */  jal        InitMainTracker
/* 29CB8 800394B8 21204002 */   addu      $a0, $s2, $zero
/* 29CBC 800394BC D4E3000C */  jal        MAIN_DoMainInit
/* 29CC0 800394C0 00000000 */   nop
/* 29CC4 800394C4 64949427 */  addiu      $s4, $gp, %gp_rel(InterfaceItems)
/* 29CC8 800394C8 06000224 */  addiu      $v0, $zero, 0x6
/* 29CCC 800394CC 38C082AF */  sw         $v0, %gp_rel(mainTrackerX)($gp)
/* 29CD0 800394D0 080040AE */  sw         $zero, 0x8($s2)
.L800394D4:
/* 29CD4 800394D4 0000428E */  lw         $v0, 0x0($s2)
/* 29CD8 800394D8 00000000 */  nop
/* 29CDC 800394DC 21184000 */  addu       $v1, $v0, $zero
/* 29CE0 800394E0 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 29CE4 800394E4 040042AE */  sw         $v0, 0x4($s2)
/* 29CE8 800394E8 0900622C */  sltiu      $v0, $v1, 0x9
/* 29CEC 800394EC 24014010 */  beqz       $v0, .L80039980
/* 29CF0 800394F0 0180023C */   lui       $v0, %hi(jtbl_8001018C)
/* 29CF4 800394F4 8C014224 */  addiu      $v0, $v0, %lo(jtbl_8001018C)
/* 29CF8 800394F8 80180300 */  sll        $v1, $v1, 2
/* 29CFC 800394FC 21186200 */  addu       $v1, $v1, $v0
/* 29D00 80039500 0000628C */  lw         $v0, 0x0($v1)
/* 29D04 80039504 00000000 */  nop
/* 29D08 80039508 08004000 */  jr         $v0
/* 29D0C 8003950C 00000000 */   nop
.L80039510:
/* 29D10 80039510 6CE50008 */  j          .L800395B0
/* 29D14 80039514 000042AE */   sw        $v0, 0x0($s2)
jlabel .L80039518
/* 29D18 80039518 39DD020C */  jal        CINE_Load
/* 29D1C 8003951C 00000000 */   nop
/* 29D20 80039520 0800428E */  lw         $v0, 0x8($s2)
/* 29D24 80039524 00000000 */  nop
/* 29D28 80039528 21004004 */  bltz       $v0, .L800395B0
/* 29D2C 8003952C 00000000 */   nop
.L80039530:
/* 29D30 80039530 62DD020C */  jal        CINE_Loaded
/* 29D34 80039534 00000000 */   nop
/* 29D38 80039538 0A004010 */  beqz       $v0, .L80039564
/* 29D3C 8003953C FFFF0534 */   ori       $a1, $zero, 0xFFFF
/* 29D40 80039540 0800428E */  lw         $v0, 0x8($s2)
/* 29D44 80039544 02000624 */  addiu      $a2, $zero, 0x2
/* 29D48 80039548 C0200200 */  sll        $a0, $v0, 3
/* 29D4C 8003954C 23208200 */  subu       $a0, $a0, $v0
/* 29D50 80039550 C0200400 */  sll        $a0, $a0, 3
/* 29D54 80039554 20DD020C */  jal        CINE_Play
/* 29D58 80039558 21209400 */   addu      $a0, $a0, $s4
/* 29D5C 8003955C 3EE1000C */  jal        ClearDisplay
/* 29D60 80039560 00000000 */   nop
.L80039564:
/* 29D64 80039564 0800438E */  lw         $v1, 0x8($s2)
/* 29D68 80039568 00000000 */  nop
/* 29D6C 8003956C C0100300 */  sll        $v0, $v1, 3
/* 29D70 80039570 23104300 */  subu       $v0, $v0, $v1
/* 29D74 80039574 C0100200 */  sll        $v0, $v0, 3
/* 29D78 80039578 21105400 */  addu       $v0, $v0, $s4
/* 29D7C 8003957C 36004384 */  lh         $v1, 0x36($v0)
/* 29D80 80039580 00000000 */  nop
/* 29D84 80039584 C0100300 */  sll        $v0, $v1, 3
/* 29D88 80039588 23104300 */  subu       $v0, $v0, $v1
/* 29D8C 8003958C C0100200 */  sll        $v0, $v0, 3
/* 29D90 80039590 21105400 */  addu       $v0, $v0, $s4
/* 29D94 80039594 080043AE */  sw         $v1, 0x8($s2)
/* 29D98 80039598 34004284 */  lh         $v0, 0x34($v0)
/* 29D9C 8003959C 00000000 */  nop
/* 29DA0 800395A0 DBFF4014 */  bnez       $v0, .L80039510
/* 29DA4 800395A4 04000224 */   addiu     $v0, $zero, 0x4
/* 29DA8 800395A8 E1FF6104 */  bgez       $v1, .L80039530
/* 29DAC 800395AC 00000000 */   nop
.L800395B0:
/* 29DB0 800395B0 66DD020C */  jal        CINE_Unload
/* 29DB4 800395B4 00000000 */   nop
/* 29DB8 800395B8 0800428E */  lw         $v0, 0x8($s2)
/* 29DBC 800395BC 00000000 */  nop
/* 29DC0 800395C0 02004104 */  bgez       $v0, .L800395CC
/* 29DC4 800395C4 08000224 */   addiu     $v0, $zero, 0x8
/* 29DC8 800395C8 000042AE */  sw         $v0, 0x0($s2)
.L800395CC:
/* 29DCC 800395CC 5C94828F */  lw         $v0, %gp_rel(nosound)($gp)
/* 29DD0 800395D0 00000000 */  nop
/* 29DD4 800395D4 EA004014 */  bnez       $v0, .L80039980
/* 29DD8 800395D8 00000000 */   nop
/* 29DDC 800395DC A901010C */  jal        SOUND_StopAllSound
/* 29DE0 800395E0 00000000 */   nop
/* 29DE4 800395E4 60E60008 */  j          .L80039980
/* 29DE8 800395E8 00000000 */   nop
.L800395EC:
/* 29DEC 800395EC 06000224 */  addiu      $v0, $zero, 0x6
/* 29DF0 800395F0 B4E50008 */  j          .L800396D0
/* 29DF4 800395F4 000042AE */   sw        $v0, 0x0($s2)
jlabel .L800395F8
/* 29DF8 800395F8 0D80043C */  lui        $a0, %hi(mainMenuFading + 0x192)
/* 29DFC 800395FC 5182010C */  jal        LOAD_ChangeDirectory
/* 29E00 80039600 F00C8424 */   addiu     $a0, $a0, %lo(mainMenuFading + 0x192)
/* 29E04 80039604 0800448E */  lw         $a0, 0x8($s2)
.L80039608:
/* 29E08 80039608 00000000 */  nop
/* 29E0C 8003960C 0600822C */  sltiu      $v0, $a0, 0x6
.L80039610:
/* 29E10 80039610 2F004010 */  beqz       $v0, .L800396D0
/* 29E14 80039614 C0100400 */   sll       $v0, $a0, 3
/* 29E18 80039618 23104400 */  subu       $v0, $v0, $a0
/* 29E1C 8003961C C0100200 */  sll        $v0, $v0, 3
/* 29E20 80039620 21885400 */  addu       $s1, $v0, $s4
/* 29E24 80039624 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 29E28 80039628 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 29E2C 8003962C 24104300 */  and        $v0, $v0, $v1
/* 29E30 80039630 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 29E34 80039634 79E1000C */  jal        show_screen
/* 29E38 80039638 21202002 */   addu      $a0, $s1, $zero
/* 29E3C 8003963C 30002296 */  lhu        $v0, 0x30($s1)
/* 29E40 80039640 00000000 */  nop
/* 29E44 80039644 14004010 */  beqz       $v0, .L80039698
/* 29E48 80039648 01001024 */   addiu     $s0, $zero, 0x1
.L8003964C:
/* 29E4C 8003964C 01C8000C */  jal        GAMEPAD_Process
/* 29E50 80039650 21206002 */   addu      $a0, $s3, $zero
/* 29E54 80039654 32002296 */  lhu        $v0, 0x32($s1)
/* 29E58 80039658 00000000 */  nop
/* 29E5C 8003965C 2A105000 */  slt        $v0, $v0, $s0
/* 29E60 80039660 06004010 */  beqz       $v0, .L8003967C
/* 29E64 80039664 00000000 */   nop
/* 29E68 80039668 4C00628E */  lw         $v0, 0x4C($s3)
/* 29E6C 8003966C 00000000 */  nop
/* 29E70 80039670 80004230 */  andi       $v0, $v0, 0x80
/* 29E74 80039674 08004014 */  bnez       $v0, .L80039698
/* 29E78 80039678 00000000 */   nop
.L8003967C:
/* 29E7C 8003967C 5EF2020C */  jal        func_800BC978
/* 29E80 80039680 21200000 */   addu      $a0, $zero, $zero
/* 29E84 80039684 30002396 */  lhu        $v1, 0x30($s1)
/* 29E88 80039688 21100002 */  addu       $v0, $s0, $zero
/* 29E8C 8003968C 2A104300 */  slt        $v0, $v0, $v1
/* 29E90 80039690 EEFF4014 */  bnez       $v0, .L8003964C
/* 29E94 80039694 01001026 */   addiu     $s0, $s0, 0x1
.L80039698:
/* 29E98 80039698 36002486 */  lh         $a0, 0x36($s1)
/* 29E9C 8003969C 00000000 */  nop
/* 29EA0 800396A0 D9FF8004 */  bltz       $a0, .L80039608
/* 29EA4 800396A4 080044AE */   sw        $a0, 0x8($s2)
/* 29EA8 800396A8 C0100400 */  sll        $v0, $a0, 3
/* 29EAC 800396AC 23104400 */  subu       $v0, $v0, $a0
/* 29EB0 800396B0 C0100200 */  sll        $v0, $v0, 3
/* 29EB4 800396B4 21105400 */  addu       $v0, $v0, $s4
/* 29EB8 800396B8 34004384 */  lh         $v1, 0x34($v0)
/* 29EBC 800396BC 01000224 */  addiu      $v0, $zero, 0x1
/* 29EC0 800396C0 CAFF6214 */  bne        $v1, $v0, .L800395EC
/* 29EC4 800396C4 0600822C */   sltiu     $v0, $a0, 0x6
/* 29EC8 800396C8 84E50008 */  j          .L80039610
/* 29ECC 800396CC 00000000 */   nop
.L800396D0:
/* 29ED0 800396D0 1EB4000C */  jal        FONT_ReloadFont
/* 29ED4 800396D4 00000000 */   nop
/* 29ED8 800396D8 0000438E */  lw         $v1, 0x0($s2)
/* 29EDC 800396DC 06000224 */  addiu      $v0, $zero, 0x6
/* 29EE0 800396E0 A7006210 */  beq        $v1, $v0, .L80039980
/* 29EE4 800396E4 00000000 */   nop
/* 29EE8 800396E8 B495828F */  lw         $v0, %gp_rel(DoMainMenu)($gp)
/* 29EEC 800396EC 00000000 */  nop
/* 29EF0 800396F0 8A004014 */  bnez       $v0, .L8003991C
/* 29EF4 800396F4 08000224 */   addiu     $v0, $zero, 0x8
/* 29EF8 800396F8 21E4000C */  jal        MAIN_ResetGame
/* 29EFC 800396FC 00000000 */   nop
/* 29F00 80039700 01000224 */  addiu      $v0, $zero, 0x1
/* 29F04 80039704 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* 29F08 80039708 C69582A7 */  sh         $v0, %gp_rel(mainMenuFading)($gp)
/* 29F0C 8003970C AFE4000C */  jal        MAIN_StartGame
/* 29F10 80039710 00000000 */   nop
/* 29F14 80039714 60E60008 */  j          .L80039980
/* 29F18 80039718 00000000 */   nop
jlabel .L8003971C
/* 29F1C 8003971C 5C016426 */  addiu      $a0, $s3, 0x15C
/* 29F20 80039720 D2BD80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0xA)($gp)
/* 29F24 80039724 F0E1000C */  jal        ProcessArgs
/* 29F28 80039728 21286002 */   addu      $a1, $s3, $zero
/* 29F2C 8003972C 21E4000C */  jal        MAIN_ResetGame
/* 29F30 80039730 00000000 */   nop
/* 29F34 80039734 0D80043C */  lui        $a0, %hi(mainMenuFading + 0x192)
/* 29F38 80039738 5182010C */  jal        LOAD_ChangeDirectory
/* 29F3C 8003973C F00C8424 */   addiu     $a0, $a0, %lo(mainMenuFading + 0x192)
/* 29F40 80039740 35E4000C */  jal        MAIN_MainMenuInit
/* 29F44 80039744 00000000 */   nop
/* 29F48 80039748 11E4000C */  jal        MAIN_InitVolume
/* 29F4C 8003974C 00000000 */   nop
/* 29F50 80039750 C8BD8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX)
/* 29F54 80039754 A0D4020C */  jal        SAVE_ClearMemory
/* 29F58 80039758 00000000 */   nop
/* 29F5C 8003975C 09000224 */  addiu      $v0, $zero, 0x9
/* 29F60 80039760 1EB4000C */  jal        FONT_ReloadFont
/* 29F64 80039764 000042AE */   sw        $v0, 0x0($s2)
/* 29F68 80039768 60E60008 */  j          .L80039980
/* 29F6C 8003976C 00000000 */   nop
jlabel .L80039770
/* 29F70 80039770 21206002 */  addu       $a0, $s3, $zero
/* 29F74 80039774 21284002 */  addu       $a1, $s2, $zero
/* 29F78 80039778 CAE4000C */  jal        MAIN_DoMainMenu
/* 29F7C 8003977C 2130A002 */   addu      $a2, $s5, $zero
/* 29F80 80039780 60E60008 */  j          .L80039980
/* 29F84 80039784 21A84000 */   addu      $s5, $v0, $zero
jlabel .L80039788
/* 29F88 80039788 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 29F8C 8003978C 0001033C */  lui        $v1, (0x1000000 >> 16)
/* 29F90 80039790 24104300 */  and        $v0, $v0, $v1
/* 29F94 80039794 09004010 */  beqz       $v0, .L800397BC
/* 29F98 80039798 00000000 */   nop
/* 29F9C 8003979C D4948427 */  addiu      $a0, $gp, %gp_rel(InterfaceItems + 0x70)
/* 29FA0 800397A0 8AE1000C */  jal        play_movie
/* 29FA4 800397A4 00000000 */   nop
/* 29FA8 800397A8 FFFE033C */  lui        $v1, (0xFEFFFFFF >> 16)
/* 29FAC 800397AC 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 29FB0 800397B0 FFFF6334 */  ori        $v1, $v1, (0xFEFFFFFF & 0xFFFF)
/* 29FB4 800397B4 24104300 */  and        $v0, $v0, $v1
/* 29FB8 800397B8 0CBF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
.L800397BC:
/* 29FBC 800397BC 0CBF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x144)($gp)
/* 29FC0 800397C0 2000023C */  lui        $v0, (0x200000 >> 16)
/* 29FC4 800397C4 24106200 */  and        $v0, $v1, $v0
/* 29FC8 800397C8 04004010 */  beqz       $v0, .L800397DC
/* 29FCC 800397CC DFFF023C */   lui       $v0, (0xFFDFFFFF >> 16)
/* 29FD0 800397D0 FFFF4234 */  ori        $v0, $v0, (0xFFDFFFFF & 0xFFFF)
/* 29FD4 800397D4 24106200 */  and        $v0, $v1, $v0
/* 29FD8 800397D8 0CBF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
.L800397DC:
/* 29FDC 800397DC 5C94828F */  lw         $v0, %gp_rel(nosound)($gp)
/* 29FE0 800397E0 00000000 */  nop
/* 29FE4 800397E4 03004014 */  bnez       $v0, .L800397F4
/* 29FE8 800397E8 00000000 */   nop
/* 29FEC 800397EC 11E4000C */  jal        MAIN_InitVolume
/* 29FF0 800397F0 00000000 */   nop
.L800397F4:
/* 29FF4 800397F4 8DE3000C */  jal        MAIN_ShowLoadingScreen
/* 29FF8 800397F8 00000000 */   nop
/* 29FFC 800397FC 1EB4000C */  jal        FONT_ReloadFont
/* 2A000 80039800 00000000 */   nop
/* 2A004 80039804 0FE9020C */  jal        func_800BA43C
/* 2A008 80039808 21200000 */   addu      $a0, $zero, $zero
/* 2A00C 8003980C C262010C */  jal        STREAM_Init
/* 2A010 80039810 2C0160AE */   sw        $zero, 0x12C($s3)
/* 2A014 80039814 5C016426 */  addiu      $a0, $s3, 0x15C
/* 2A018 80039818 85B8000C */  jal        GAMELOOP_LevelLoadAndInit
/* 2A01C 8003981C 21286002 */   addu      $a1, $s3, $zero
/* 2A020 80039820 01000224 */  addiu      $v0, $zero, 0x1
/* 2A024 80039824 6C0160A6 */  sh         $zero, 0x16C($s3)
/* 2A028 80039828 000042AE */  sw         $v0, 0x0($s2)
.L8003982C:
/* 2A02C 8003982C 7580010C */  jal        STREAM_PollLoadQueue
/* 2A030 80039830 00000000 */   nop
/* 2A034 80039834 FDFF4014 */  bnez       $v0, .L8003982C
/* 2A038 80039838 00000000 */   nop
/* 2A03C 8003983C FCBE80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x134)($gp)
/* 2A040 80039840 60E60008 */  j          .L80039980
/* 2A044 80039844 00000000 */   nop
jlabel .L80039848
/* 2A048 80039848 CF03010C */  jal        SOUND_UpdateSound
/* 2A04C 8003984C 00000000 */   nop
/* 2A050 80039850 C000628E */  lw         $v0, 0xC0($s3)
/* 2A054 80039854 0800033C */  lui        $v1, (0x80000 >> 16)
/* 2A058 80039858 24104300 */  and        $v0, $v0, $v1
/* 2A05C 8003985C 03004010 */  beqz       $v0, .L8003986C
/* 2A060 80039860 00000000 */   nop
/* 2A064 80039864 A7DC020C */  jal        VOICEXA_Tick
/* 2A068 80039868 00000000 */   nop
.L8003986C:
/* 2A06C 8003986C 76C4000C */  jal        PSX_GameLoop
/* 2A070 80039870 21206002 */   addu      $a0, $s3, $zero
/* 2A074 80039874 6C016286 */  lh         $v0, 0x16C($s3)
/* 2A078 80039878 00000000 */  nop
/* 2A07C 8003987C 40004010 */  beqz       $v0, .L80039980
/* 2A080 80039880 00000000 */   nop
/* 2A084 80039884 21E3000C */  jal        FadeOutSayingLoading
/* 2A088 80039888 21206002 */   addu      $a0, $s3, $zero
/* 2A08C 8003988C E65B010C */  jal        aadStopAllSfx
/* 2A090 80039890 00000000 */   nop
/* 2A094 80039894 21200000 */  addu       $a0, $zero, $zero
/* 2A098 80039898 3A6C010C */  jal        STREAM_DumpAllLevels
/* 2A09C 8003989C 21288000 */   addu      $a1, $a0, $zero
/* 2A0A0 800398A0 0666010C */  jal        RemoveAllObjects
/* 2A0A4 800398A4 21206002 */   addu      $a0, $s3, $zero
.L800398A8:
/* 2A0A8 800398A8 AF4B010C */  jal        aadGetNumLoadsQueued
/* 2A0AC 800398AC 00000000 */   nop
/* 2A0B0 800398B0 07004014 */  bnez       $v0, .L800398D0
/* 2A0B4 800398B4 00000000 */   nop
/* 2A0B8 800398B8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 2A0BC 800398BC 00000000 */  nop
/* 2A0C0 800398C0 E807428C */  lw         $v0, 0x7E8($v0)
/* 2A0C4 800398C4 00000000 */  nop
/* 2A0C8 800398C8 07004010 */  beqz       $v0, .L800398E8
/* 2A0CC 800398CC 00000000 */   nop
.L800398D0:
/* 2A0D0 800398D0 CF03010C */  jal        SOUND_UpdateSound
/* 2A0D4 800398D4 00000000 */   nop
/* 2A0D8 800398D8 7580010C */  jal        STREAM_PollLoadQueue
/* 2A0DC 800398DC 00000000 */   nop
/* 2A0E0 800398E0 2AE60008 */  j          .L800398A8
/* 2A0E4 800398E4 00000000 */   nop
.L800398E8:
/* 2A0E8 800398E8 0904010C */  jal        SOUND_ShutdownMusic
/* 2A0EC 800398EC 00000000 */   nop
/* 2A0F0 800398F0 5241010C */  jal        MEMPACK_FreeByType
/* 2A0F4 800398F4 0E000424 */   addiu     $a0, $zero, 0xE
/* 2A0F8 800398F8 54B7000C */  jal        GAMELOOP_ResetGameStates
/* 2A0FC 800398FC 00000000 */   nop
/* 2A100 80039900 5842010C */  jal        MEMPACK_DoGarbageCollection
/* 2A104 80039904 00000000 */   nop
/* 2A108 80039908 6C016386 */  lh         $v1, 0x16C($s3)
/* 2A10C 8003990C 00000000 */  nop
/* 2A110 80039910 04007614 */  bne        $v1, $s6, .L80039924
/* 2A114 80039914 03000224 */   addiu     $v0, $zero, 0x3
/* 2A118 80039918 08000224 */  addiu      $v0, $zero, 0x8
.L8003991C:
/* 2A11C 8003991C 60E60008 */  j          .L80039980
/* 2A120 80039920 000042AE */   sw        $v0, 0x0($s2)
.L80039924:
/* 2A124 80039924 05006214 */  bne        $v1, $v0, .L8003993C
/* 2A128 80039928 04000224 */   addiu     $v0, $zero, 0x4
/* 2A12C 8003992C 06000224 */  addiu      $v0, $zero, 0x6
/* 2A130 80039930 000042AE */  sw         $v0, 0x0($s2)
/* 2A134 80039934 60E60008 */  j          .L80039980
/* 2A138 80039938 080043AE */   sw        $v1, 0x8($s2)
.L8003993C:
/* 2A13C 8003993C 0C006214 */  bne        $v1, $v0, .L80039970
/* 2A140 80039940 2000033C */   lui       $v1, (0x200000 >> 16)
/* 2A144 80039944 0CBF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x144)
/* 2A148 80039948 000056AE */  sw         $s6, 0x0($s2)
/* 2A14C 8003994C 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 2A150 80039950 00000000 */  nop
/* 2A154 80039954 24104300 */  and        $v0, $v0, $v1
/* 2A158 80039958 09004014 */  bnez       $v0, .L80039980
/* 2A15C 8003995C 00000000 */   nop
/* 2A160 80039960 A0D4020C */  jal        SAVE_ClearMemory
/* 2A164 80039964 BCFE8424 */   addiu     $a0, $a0, -0x144
/* 2A168 80039968 60E60008 */  j          .L80039980
/* 2A16C 8003996C 00000000 */   nop
.L80039970:
/* 2A170 80039970 60E60008 */  j          .L80039980
/* 2A174 80039974 000056AE */   sw        $s6, 0x0($s2)
jlabel .L80039978
/* 2A178 80039978 01000224 */  addiu      $v0, $zero, 0x1
/* 2A17C 8003997C 0C0042AE */  sw         $v0, 0xC($s2)
jlabel .L80039980
/* 2A180 80039980 7580010C */  jal        STREAM_PollLoadQueue
/* 2A184 80039984 00000000 */   nop
/* 2A188 80039988 0C00428E */  lw         $v0, 0xC($s2)
/* 2A18C 8003998C 00000000 */  nop
/* 2A190 80039990 D0FE4010 */  beqz       $v0, .L800394D4
/* 2A194 80039994 00000000 */   nop
/* 2A198 80039998 A901010C */  jal        SOUND_StopAllSound
/* 2A19C 8003999C 00000000 */   nop
/* 2A1A0 800399A0 5E01010C */  jal        SOUND_Free
/* 2A1A4 800399A4 00000000 */   nop
/* 2A1A8 800399A8 E9E8020C */  jal        func_800BA3A4
/* 2A1AC 800399AC 21200000 */   addu      $a0, $zero, $zero
/* 2A1B0 800399B0 0FE9020C */  jal        func_800BA43C
/* 2A1B4 800399B4 21200000 */   addu      $a0, $zero, $zero
/* 2A1B8 800399B8 5EF2020C */  jal        func_800BC978
/* 2A1BC 800399BC 21200000 */   addu      $a0, $zero, $zero
/* 2A1C0 800399C0 D1E8020C */  jal        func_800BA344
/* 2A1C4 800399C4 21200000 */   addu      $a0, $zero, $zero
/* 2A1C8 800399C8 C3E6020C */  jal        func_800B9B0C
/* 2A1CC 800399CC 21200000 */   addu      $a0, $zero, $zero
/* 2A1D0 800399D0 A5FC020C */  jal        func_800BF294
/* 2A1D4 800399D4 00000000 */   nop
/* 2A1D8 800399D8 05F5020C */  jal        func_800BD414
/* 2A1DC 800399DC 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 2A1E0 800399E0 A0BD848F */  lw         $a0, %gp_rel(__timerEvent)($gp)
/* 2A1E4 800399E4 DDFC020C */  jal        func_800BF374
/* 2A1E8 800399E8 00000000 */   nop
/* 2A1EC 800399EC A0BD848F */  lw         $a0, %gp_rel(__timerEvent)($gp)
/* 2A1F0 800399F0 11FD020C */  jal        func_800BF444
/* 2A1F4 800399F4 00000000 */   nop
/* 2A1F8 800399F8 11FC020C */  jal        func_800BF044
/* 2A1FC 800399FC 00000000 */   nop
/* 2A200 80039A00 5EF2020C */  jal        func_800BC978
/* 2A204 80039A04 05000424 */   addiu     $a0, $zero, 0x5
/* 2A208 80039A08 DCE6020C */  jal        func_800B9B70
/* 2A20C 80039A0C 00000000 */   nop
/* 2A210 80039A10 B2F6020C */  jal        func_800BDAC8
/* 2A214 80039A14 00000000 */   nop
/* 2A218 80039A18 5DE8020C */  jal        func_800BA174
/* 2A21C 80039A1C 03000424 */   addiu     $a0, $zero, 0x3
.L80039A20:
/* 2A220 80039A20 B557020C */  jal        MainG2_ShutDownEngine
/* 2A224 80039A24 2120E002 */   addu      $a0, $s7, $zero
/* 2A228 80039A28 3000BF8F */  lw         $ra, 0x30($sp)
/* 2A22C 80039A2C 2C00B78F */  lw         $s7, 0x2C($sp)
/* 2A230 80039A30 2800B68F */  lw         $s6, 0x28($sp)
/* 2A234 80039A34 2400B58F */  lw         $s5, 0x24($sp)
/* 2A238 80039A38 2000B48F */  lw         $s4, 0x20($sp)
/* 2A23C 80039A3C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2A240 80039A40 1800B28F */  lw         $s2, 0x18($sp)
/* 2A244 80039A44 1400B18F */  lw         $s1, 0x14($sp)
/* 2A248 80039A48 1000B08F */  lw         $s0, 0x10($sp)
/* 2A24C 80039A4C 21100000 */  addu       $v0, $zero, $zero
/* 2A250 80039A50 0800E003 */  jr         $ra
/* 2A254 80039A54 3800BD27 */   addiu     $sp, $sp, 0x38
.size MainG2, . - MainG2
