.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_MainMenuInit
/* 298D4 800390D4 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 298D8 800390D8 0D80023C */  lui        $v0, %hi(mainMenuFading + 0xFE)
/* 298DC 800390DC 5C0C4324 */  addiu      $v1, $v0, %lo(mainMenuFading + 0xFE)
/* 298E0 800390E0 03006230 */  andi       $v0, $v1, 0x3
/* 298E4 800390E4 5000BFAF */  sw         $ra, 0x50($sp)
/* 298E8 800390E8 B89580AF */  sw         $zero, %gp_rel(mainMenuMode)($gp)
/* 298EC 800390EC C4BD80A7 */  sh         $zero, %gp_rel(mainMenuTimeOut)($gp)
/* 298F0 800390F0 17004010 */  beqz       $v0, .L80039150
/* 298F4 800390F4 1000A727 */   addiu     $a3, $sp, 0x10
/* 298F8 800390F8 20006224 */  addiu      $v0, $v1, 0x20
.L800390FC:
/* 298FC 800390FC 03006888 */  lwl        $t0, 0x3($v1)
/* 29900 80039100 00006898 */  lwr        $t0, 0x0($v1)
/* 29904 80039104 07006988 */  lwl        $t1, 0x7($v1)
/* 29908 80039108 04006998 */  lwr        $t1, 0x4($v1)
/* 2990C 8003910C 0B006A88 */  lwl        $t2, 0xB($v1)
/* 29910 80039110 08006A98 */  lwr        $t2, 0x8($v1)
/* 29914 80039114 0F006B88 */  lwl        $t3, 0xF($v1)
/* 29918 80039118 0C006B98 */  lwr        $t3, 0xC($v1)
/* 2991C 8003911C 0300E8A8 */  swl        $t0, 0x3($a3)
/* 29920 80039120 0000E8B8 */  swr        $t0, 0x0($a3)
/* 29924 80039124 0700E9A8 */  swl        $t1, 0x7($a3)
/* 29928 80039128 0400E9B8 */  swr        $t1, 0x4($a3)
/* 2992C 8003912C 0B00EAA8 */  swl        $t2, 0xB($a3)
/* 29930 80039130 0800EAB8 */  swr        $t2, 0x8($a3)
/* 29934 80039134 0F00EBA8 */  swl        $t3, 0xF($a3)
/* 29938 80039138 0C00EBB8 */  swr        $t3, 0xC($a3)
/* 2993C 8003913C 10006324 */  addiu      $v1, $v1, 0x10
/* 29940 80039140 EEFF6214 */  bne        $v1, $v0, .L800390FC
/* 29944 80039144 1000E724 */   addiu     $a3, $a3, 0x10
/* 29948 80039148 61E40008 */  j          .L80039184
/* 2994C 8003914C 3800A427 */   addiu     $a0, $sp, 0x38
.L80039150:
/* 29950 80039150 20006224 */  addiu      $v0, $v1, 0x20
.L80039154:
/* 29954 80039154 0000688C */  lw         $t0, 0x0($v1)
/* 29958 80039158 0400698C */  lw         $t1, 0x4($v1)
/* 2995C 8003915C 08006A8C */  lw         $t2, 0x8($v1)
/* 29960 80039160 0C006B8C */  lw         $t3, 0xC($v1)
/* 29964 80039164 0000E8AC */  sw         $t0, 0x0($a3)
/* 29968 80039168 0400E9AC */  sw         $t1, 0x4($a3)
/* 2996C 8003916C 0800EAAC */  sw         $t2, 0x8($a3)
/* 29970 80039170 0C00EBAC */  sw         $t3, 0xC($a3)
/* 29974 80039174 10006324 */  addiu      $v1, $v1, 0x10
/* 29978 80039178 F6FF6214 */  bne        $v1, $v0, .L80039154
/* 2997C 8003917C 1000E724 */   addiu     $a3, $a3, 0x10
/* 29980 80039180 3800A427 */  addiu      $a0, $sp, 0x38
.L80039184:
/* 29984 80039184 21280000 */  addu       $a1, $zero, $zero
/* 29988 80039188 18000624 */  addiu      $a2, $zero, 0x18
/* 2998C 8003918C 03006888 */  lwl        $t0, 0x3($v1)
/* 29990 80039190 00006898 */  lwr        $t0, 0x0($v1)
/* 29994 80039194 07006988 */  lwl        $t1, 0x7($v1)
/* 29998 80039198 04006998 */  lwr        $t1, 0x4($v1)
/* 2999C 8003919C 0300E8A8 */  swl        $t0, 0x3($a3)
/* 299A0 800391A0 0000E8B8 */  swr        $t0, 0x0($a3)
/* 299A4 800391A4 0700E9A8 */  swl        $t1, 0x7($a3)
/* 299A8 800391A8 2EF2020C */  jal        func_800BC8B8
/* 299AC 800391AC 0400E9B8 */   swr       $t1, 0x4($a3)
/* 299B0 800391B0 38BC80AF */  sw         $zero, %gp_rel(mainMenuSfx)($gp)
/* 299B4 800391B4 1FE0000C */  jal        LOAD_DoesFileExist
/* 299B8 800391B8 1000A427 */   addiu     $a0, $sp, 0x10
/* 299BC 800391BC 0E004010 */  beqz       $v0, .L800391F8
/* 299C0 800391C0 21280000 */   addu      $a1, $zero, $zero
/* 299C4 800391C4 0D80043C */  lui        $a0, %hi(mainMenuFading + 0x126)
/* 299C8 800391C8 840C8424 */  addiu      $a0, $a0, %lo(mainMenuFading + 0x126)
/* 299CC 800391CC BF4A010C */  jal        aadLoadDynamicSfx
/* 299D0 800391D0 2130A000 */   addu      $a2, $a1, $zero
/* 299D4 800391D4 38BC82AF */  sw         $v0, %gp_rel(mainMenuSfx)($gp)
.L800391D8:
/* 299D8 800391D8 AF4B010C */  jal        aadGetNumLoadsQueued
/* 299DC 800391DC 00000000 */   nop
/* 299E0 800391E0 06004010 */  beqz       $v0, .L800391FC
/* 299E4 800391E4 0D80043C */   lui       $a0, %hi(mainMenuFading + 0x132)
/* 299E8 800391E8 BA4B010C */  jal        aadProcessLoadQueue
/* 299EC 800391EC 00000000 */   nop
/* 299F0 800391F0 76E40008 */  j          .L800391D8
/* 299F4 800391F4 00000000 */   nop
.L800391F8:
/* 299F8 800391F8 0D80043C */  lui        $a0, %hi(mainMenuFading + 0x132)
.L800391FC:
/* 299FC 800391FC B9E3000C */  jal        MAIN_LoadTim
/* 29A00 80039200 900C8424 */   addiu     $a0, $a0, %lo(mainMenuFading + 0x132)
/* 29A04 80039204 BC9582AF */  sw         $v0, %gp_rel(mainMenuScreen)($gp)
/* 29A08 80039208 BDCB010C */  jal        VRAM_EnableTerrainArea
/* 29A0C 8003920C 00000000 */   nop
/* 29A10 80039210 7EE4020C */  jal        menuface_initialize
/* 29A14 80039214 00000000 */   nop
/* 29A18 80039218 0C80053C */  lui        $a1, %hi(menudefs_main_menu)
/* 29A1C 8003921C 0D80023C */  lui        $v0, %hi(mainMenu)
/* 29A20 80039220 E8BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x20)($gp)
/* 29A24 80039224 B08D4224 */  addiu      $v0, $v0, %lo(mainMenu)
/* 29A28 80039228 0C8A82AF */  sw         $v0, %gp_rel(currentMenu)($gp)
/* 29A2C 8003922C 04000224 */  addiu      $v0, $zero, 0x4
/* 29A30 80039230 3ABF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x172)($gp)
/* 29A34 80039234 E5DD020C */  jal        menu_set
/* 29A38 80039238 1C8FA524 */   addiu     $a1, $a1, %lo(menudefs_main_menu)
/* 29A3C 8003923C 5000BF8F */  lw         $ra, 0x50($sp)
/* 29A40 80039240 00000000 */  nop
/* 29A44 80039244 0800E003 */  jr         $ra
/* 29A48 80039248 5800BD27 */   addiu     $sp, $sp, 0x58
.size MAIN_MainMenuInit, . - MAIN_MainMenuInit
