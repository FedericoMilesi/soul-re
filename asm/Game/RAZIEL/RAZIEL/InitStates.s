.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitStates
/* 98754 800A7F54 30F6828F */  lw         $v0, %gp_rel(Raziel)($gp)
/* 98758 800A7F58 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 9875C 800A7F5C 2000B2AF */  sw         $s2, 0x20($sp)
/* 98760 800A7F60 21908000 */  addu       $s2, $a0, $zero
/* 98764 800A7F64 3000BFAF */  sw         $ra, 0x30($sp)
/* 98768 800A7F68 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 9876C 800A7F6C 2800B4AF */  sw         $s4, 0x28($sp)
/* 98770 800A7F70 2400B3AF */  sw         $s3, 0x24($sp)
/* 98774 800A7F74 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 98778 800A7F78 04004014 */  bnez       $v0, .L800A7F8C
/* 9877C 800A7F7C 1800B0AF */   sw        $s0, 0x18($sp)
/* 98780 800A7F80 1C00428E */  lw         $v0, 0x1C($s2)
/* 98784 800A7F84 00000000 */  nop
/* 98788 800A7F88 30F682AF */  sw         $v0, %gp_rel(Raziel)($gp)
.L800A7F8C:
/* 9878C 800A7F8C 34F69027 */  addiu      $s0, $gp, %gp_rel(Raziel + 0x4)
/* 98790 800A7F90 21200002 */  addu       $a0, $s0, $zero
/* 98794 800A7F94 03000524 */  addiu      $a1, $zero, 0x3
/* 98798 800A7F98 580150AE */  sw         $s0, 0x158($s2)
/* 9879C 800A7F9C 34F692AF */  sw         $s2, %gp_rel(Raziel + 0x4)($gp)
/* 987A0 800A7FA0 2400428E */  lw         $v0, 0x24($s2)
/* 987A4 800A7FA4 00000000 */  nop
/* 987A8 800A7FA8 E8FB82AF */  sw         $v0, %gp_rel(PlayerData)($gp)
/* 987AC 800A7FAC 52CA010C */  jal        G2EmulationSetTotalSections
/* 987B0 800A7FB0 21880000 */   addu      $s1, $zero, $zero
/* 987B4 800A7FB4 21200002 */  addu       $a0, $s0, $zero
/* 987B8 800A7FB8 21280000 */  addu       $a1, $zero, $zero
/* 987BC 800A7FBC 2130A000 */  addu       $a2, $a1, $zero
/* 987C0 800A7FC0 25CA010C */  jal        G2EmulationSetStartAndEndSegment
/* 987C4 800A7FC4 0D000724 */   addiu     $a3, $zero, 0xD
/* 987C8 800A7FC8 21200002 */  addu       $a0, $s0, $zero
/* 987CC 800A7FCC 01000524 */  addiu      $a1, $zero, 0x1
/* 987D0 800A7FD0 0E000624 */  addiu      $a2, $zero, 0xE
/* 987D4 800A7FD4 25CA010C */  jal        G2EmulationSetStartAndEndSegment
/* 987D8 800A7FD8 31000724 */   addiu     $a3, $zero, 0x31
/* 987DC 800A7FDC 21200002 */  addu       $a0, $s0, $zero
/* 987E0 800A7FE0 02000524 */  addiu      $a1, $zero, 0x2
/* 987E4 800A7FE4 32000624 */  addiu      $a2, $zero, 0x32
/* 987E8 800A7FE8 25CA010C */  jal        G2EmulationSetStartAndEndSegment
/* 987EC 800A7FEC 41000724 */   addiu     $a3, $zero, 0x41
/* 987F0 800A7FF0 0B80023C */  lui        $v0, %hi(RazielAnimCallback)
/* 987F4 800A7FF4 7C085524 */  addiu      $s5, $v0, %lo(RazielAnimCallback)
/* 987F8 800A7FF8 0B80023C */  lui        $v0, %hi(StateHandlerIdle)
/* 987FC 800A7FFC E0845424 */  addiu      $s4, $v0, %lo(StateHandlerIdle)
/* 98800 800A8000 FF002332 */  andi       $v1, $s1, 0xFF
.L800A8004:
/* 98804 800A8004 C0800300 */  sll        $s0, $v1, 3
/* 98808 800A8008 21800302 */  addu       $s0, $s0, $v1
/* 9880C 800A800C C0801000 */  sll        $s0, $s0, 3
/* 98810 800A8010 23800302 */  subu       $s0, $s0, $v1
/* 98814 800A8014 80801000 */  sll        $s0, $s0, 2
/* 98818 800A8018 40F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x10)
/* 9881C 800A801C 21200402 */  addu       $a0, $s0, $a0
/* 98820 800A8020 40100300 */  sll        $v0, $v1, 1
/* 98824 800A8024 21104300 */  addu       $v0, $v0, $v1
/* 98828 800A8028 00110200 */  sll        $v0, $v0, 4
/* 9882C 800A802C EC014224 */  addiu      $v0, $v0, 0x1EC
/* 98830 800A8030 21104202 */  addu       $v0, $s2, $v0
/* 98834 800A8034 30F69327 */  addiu      $s3, $gp, %gp_rel(Raziel)
/* 98838 800A8038 1C0055AC */  sw         $s5, 0x1C($v0)
/* 9883C 800A803C 200040AC */  sw         $zero, 0x20($v0)
/* 98840 800A8040 21101302 */  addu       $v0, $s0, $s3
/* 98844 800A8044 24C3010C */  jal        InitMessageQueue
/* 98848 800A8048 0C0054AC */   sw        $s4, 0xC($v0)
/* 9884C 800A804C C8F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x98)
/* 98850 800A8050 24C3010C */  jal        InitMessageQueue
/* 98854 800A8054 21200402 */   addu      $a0, $s0, $a0
/* 98858 800A8058 01003126 */  addiu      $s1, $s1, 0x1
/* 9885C 800A805C FF002232 */  andi       $v0, $s1, 0xFF
/* 98860 800A8060 0300422C */  sltiu      $v0, $v0, 0x3
/* 98864 800A8064 E7FF4014 */  bnez       $v0, .L800A8004
/* 98868 800A8068 FF002332 */   andi      $v1, $s1, 0xFF
/* 9886C 800A806C F0FB8527 */  addiu      $a1, $gp, %gp_rel(razInterpInfo)
/* 98870 800A8070 4940020C */  jal        G2AnimSection_SetInterpInfo
/* 98874 800A8074 EC014426 */   addiu     $a0, $s2, 0x1EC
/* 98878 800A8078 FCFB8527 */  addiu      $a1, $gp, %gp_rel(razInterpInfo + 0xC)
/* 9887C 800A807C 4940020C */  jal        G2AnimSection_SetInterpInfo
/* 98880 800A8080 1C024426 */   addiu     $a0, $s2, 0x21C
/* 98884 800A8084 08FC8527 */  addiu      $a1, $gp, %gp_rel(razInterpInfo + 0x18)
/* 98888 800A8088 4940020C */  jal        G2AnimSection_SetInterpInfo
/* 9888C 800A808C 4C024426 */   addiu     $a0, $s2, 0x24C
/* 98890 800A8090 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 98894 800A8094 01000324 */  addiu      $v1, $zero, 0x1
/* 98898 800A8098 90F983AF */  sw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9889C 800A809C 00084234 */  ori        $v0, $v0, 0x800
/* 988A0 800A80A0 8CBE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 988A4 800A80A4 2891020C */  jal        InitHealthSystem
/* 988A8 800A80A8 00000000 */   nop
/* 988AC 800A80AC 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* 988B0 800A80B0 21280000 */  addu       $a1, $zero, $zero
/* 988B4 800A80B4 2130A000 */  addu       $a2, $a1, $zero
/* 988B8 800A80B8 2138A000 */  addu       $a3, $a1, $zero
/* 988BC 800A80BC 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 988C0 800A80C0 38FA82AF */  sw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 988C4 800A80C4 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 988C8 800A80C8 40FD8227 */  addiu      $v0, $gp, %gp_rel(EngagedList)
/* 988CC 800A80CC 40FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x410)($gp)
/* 988D0 800A80D0 42FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x412)($gp)
/* 988D4 800A80D4 38FA80AF */  sw         $zero, %gp_rel(Raziel + 0x408)($gp)
/* 988D8 800A80D8 98F980AF */  sw         $zero, %gp_rel(Raziel + 0x368)($gp)
/* 988DC 800A80DC 40FB80A7 */  sh         $zero, %gp_rel(Raziel + 0x510)($gp)
/* 988E0 800A80E0 48FB80AF */  sw         $zero, %gp_rel(Raziel + 0x518)($gp)
/* 988E4 800A80E4 760040A6 */  sh         $zero, 0x76($s2)
/* 988E8 800A80E8 740040A6 */  sh         $zero, 0x74($s2)
/* 988EC 800A80EC 08FA82AF */  sw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 988F0 800A80F0 20FC8227 */  addiu      $v0, $gp, %gp_rel(constrictData)
/* 988F4 800A80F4 44FA82AF */  sw         $v0, %gp_rel(Raziel + 0x414)($gp)
/* 988F8 800A80F8 00010224 */  addiu      $v0, $zero, 0x100
/* 988FC 800A80FC 24FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F4)($gp)
/* 98900 800A8100 E0FF0224 */  addiu      $v0, $zero, -0x20
/* 98904 800A8104 0CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x3DC)($gp)
/* 98908 800A8108 74FA80AF */  sw         $zero, %gp_rel(Raziel + 0x444)($gp)
/* 9890C 800A810C 60FA80AF */  sw         $zero, %gp_rel(Raziel + 0x430)($gp)
/* 98910 800A8110 26FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F6)($gp)
/* 98914 800A8114 63C9010C */  jal        G2EmulationSetAnimation
/* 98918 800A8118 1000A0AF */   sw        $zero, 0x10($sp)
/* 9891C 800A811C 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* 98920 800A8120 21280000 */  addu       $a1, $zero, $zero
/* 98924 800A8124 91C9010C */  jal        G2EmulationSetMode
/* 98928 800A8128 02000624 */   addiu     $a2, $zero, 0x2
/* 9892C 800A812C 04006426 */  addiu      $a0, $s3, 0x4
/* 98930 800A8130 01000524 */  addiu      $a1, $zero, 0x1
/* 98934 800A8134 21300000 */  addu       $a2, $zero, $zero
/* 98938 800A8138 2138C000 */  addu       $a3, $a2, $zero
/* 9893C 800A813C 63C9010C */  jal        G2EmulationSetAnimation
/* 98940 800A8140 1000A0AF */   sw        $zero, 0x10($sp)
/* 98944 800A8144 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* 98948 800A8148 01000524 */  addiu      $a1, $zero, 0x1
/* 9894C 800A814C 91C9010C */  jal        G2EmulationSetMode
/* 98950 800A8150 02000624 */   addiu     $a2, $zero, 0x2
/* 98954 800A8154 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* 98958 800A8158 02000524 */  addiu      $a1, $zero, 0x2
/* 9895C 800A815C 21300000 */  addu       $a2, $zero, $zero
/* 98960 800A8160 2138C000 */  addu       $a3, $a2, $zero
/* 98964 800A8164 63C9010C */  jal        G2EmulationSetAnimation
/* 98968 800A8168 1000A0AF */   sw        $zero, 0x10($sp)
/* 9896C 800A816C 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* 98970 800A8170 02000524 */  addiu      $a1, $zero, 0x2
/* 98974 800A8174 91C9010C */  jal        G2EmulationSetMode
/* 98978 800A8178 2130A000 */   addu      $a2, $a1, $zero
/* 9897C 800A817C 01000424 */  addiu      $a0, $zero, 0x1
/* 98980 800A8180 19050224 */  addiu      $v0, $zero, 0x519
/* 98984 800A8184 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 98988 800A8188 00010224 */  addiu      $v0, $zero, 0x100
/* 9898C 800A818C 8C0142AE */  sw         $v0, 0x18C($s2)
/* 98990 800A8190 900142AE */  sw         $v0, 0x190($s2)
/* 98994 800A8194 B19D020C */  jal        razSetCowlNoDraw
/* 98998 800A8198 940142AE */   sw        $v0, 0x194($s2)
/* 9899C 800A819C E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 989A0 800A81A0 1E69020C */  jal        InitExternalForces
/* 989A4 800A81A4 04000524 */   addiu     $a1, $zero, 0x4
/* 989A8 800A81A8 21204002 */  addu       $a0, $s2, $zero
/* 989AC 800A81AC 6B68020C */  jal        ResetPhysics
/* 989B0 800A81B0 F0FF0524 */   addiu     $a1, $zero, -0x10
/* 989B4 800A81B4 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 989B8 800A81B8 D0FC80AF */  sw         $zero, %gp_rel(ExtraRot)($gp)
/* 989BC 800A81BC F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 989C0 800A81C0 21284002 */   addu      $a1, $s2, $zero
/* 989C4 800A81C4 DD9D020C */  jal        razAttachControllers
/* 989C8 800A81C8 00000000 */   nop
/* 989CC 800A81CC 21204002 */  addu       $a0, $s2, $zero
/* 989D0 800A81D0 1000053C */  lui        $a1, (0x100006 >> 16)
/* 989D4 800A81D4 0600A534 */  ori        $a1, $a1, (0x100006 & 0xFFFF)
/* 989D8 800A81D8 A1D1000C */  jal        INSTANCE_Post
/* 989DC 800A81DC 21300000 */   addu      $a2, $zero, $zero
/* 989E0 800A81E0 3E80033C */  lui        $v1, (0x803E002E >> 16)
/* 989E4 800A81E4 1800428E */  lw         $v0, 0x18($s2)
/* 989E8 800A81E8 2E006334 */  ori        $v1, $v1, (0x803E002E & 0xFFFF)
/* 989EC 800A81EC 580043AE */  sw         $v1, 0x58($s2)
/* 989F0 800A81F0 00044234 */  ori        $v0, $v0, 0x400
/* 989F4 800A81F4 ECC6010C */  jal        G2EmulationInit
/* 989F8 800A81F8 180042AE */   sw        $v0, 0x18($s2)
/* 989FC 800A81FC 38CF020C */  jal        InitGlyphSystem
/* 98A00 800A8200 21204002 */   addu      $a0, $s2, $zero
/* 98A04 800A8204 3000BF8F */  lw         $ra, 0x30($sp)
/* 98A08 800A8208 2C00B58F */  lw         $s5, 0x2C($sp)
/* 98A0C 800A820C 2800B48F */  lw         $s4, 0x28($sp)
/* 98A10 800A8210 2400B38F */  lw         $s3, 0x24($sp)
/* 98A14 800A8214 2000B28F */  lw         $s2, 0x20($sp)
/* 98A18 800A8218 1C00B18F */  lw         $s1, 0x1C($sp)
/* 98A1C 800A821C 1800B08F */  lw         $s0, 0x18($sp)
/* 98A20 800A8220 500B0224 */  addiu      $v0, $zero, 0xB50
/* 98A24 800A8224 6CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x43C)($gp)
/* 98A28 800A8228 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 98A2C 800A822C 8EFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55E)($gp)
/* 98A30 800A8230 E1BF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x219)($gp)
/* 98A34 800A8234 0800E003 */  jr         $ra
/* 98A38 800A8238 3800BD27 */   addiu     $sp, $sp, 0x38
.size InitStates, . - InitStates
