.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_DoSenses
/* 778DC 800870DC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 778E0 800870E0 1400B1AF */  sw         $s1, 0x14($sp)
/* 778E4 800870E4 21888000 */  addu       $s1, $a0, $zero
/* 778E8 800870E8 1800BFAF */  sw         $ra, 0x18($sp)
/* 778EC 800870EC 1000B0AF */  sw         $s0, 0x10($sp)
/* 778F0 800870F0 6C01308E */  lw         $s0, 0x16C($s1)
/* 778F4 800870F4 4F1A020C */  jal        MONSENSE_ProcessIRList
/* 778F8 800870F8 00000000 */   nop
/* 778FC 800870FC E4ED848F */  lw         $a0, %gp_rel(lastSenseFrame)($gp)
/* 77900 80087100 F4BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 77904 80087104 00000000 */  nop
/* 77908 80087108 2A108300 */  slt        $v0, $a0, $v1
/* 7790C 8008710C 0C004010 */  beqz       $v0, .L80087140
/* 77910 80087110 FFFF6224 */   addiu     $v0, $v1, -0x1
/* 77914 80087114 2A108200 */  slt        $v0, $a0, $v0
/* 77918 80087118 08004010 */  beqz       $v0, .L8008713C
/* 7791C 8008711C 21280000 */   addu      $a1, $zero, $zero
/* 77920 80087120 BCED8427 */  addiu      $a0, $gp, %gp_rel(monsterSensed)
/* 77924 80087124 2EF2020C */  jal        memset
/* 77928 80087128 28000624 */   addiu     $a2, $zero, 0x28
/* 7792C 8008712C F4BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 77930 80087130 00000000 */  nop
/* 77934 80087134 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 77938 80087138 E4ED82AF */  sw         $v0, %gp_rel(lastSenseFrame)($gp)
.L8008713C:
/* 7793C 8008713C 94A580AF */  sw         $zero, %gp_rel(D_800D1B2C)($gp)
.L80087140:
/* 77940 80087140 94A5828F */  lw         $v0, %gp_rel(D_800D1B2C)($gp)
/* 77944 80087144 00000000 */  nop
/* 77948 80087148 1C004014 */  bnez       $v0, .L800871BC
/* 7794C 8008714C 00000000 */   nop
/* 77950 80087150 63010282 */  lb         $v0, 0x163($s0)
/* 77954 80087154 BCED8327 */  addiu      $v1, $gp, %gp_rel(monsterSensed)
/* 77958 80087158 21104300 */  addu       $v0, $v0, $v1
/* 7795C 8008715C 00004280 */  lb         $v0, 0x0($v0)
/* 77960 80087160 00000000 */  nop
/* 77964 80087164 15004014 */  bnez       $v0, .L800871BC
/* 77968 80087168 00000000 */   nop
/* 7796C 8008716C F4BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 77970 80087170 00000000 */  nop
/* 77974 80087174 E4ED82AF */  sw         $v0, %gp_rel(lastSenseFrame)($gp)
/* 77978 80087178 63010282 */  lb         $v0, 0x163($s0)
/* 7797C 8008717C 00000000 */  nop
/* 77980 80087180 21104300 */  addu       $v0, $v0, $v1
/* 77984 80087184 01000324 */  addiu      $v1, $zero, 0x1
/* 77988 80087188 000043A0 */  sb         $v1, 0x0($v0)
/* 7798C 8008718C 01000224 */  addiu      $v0, $zero, 0x1
/* 77990 80087190 94A582AF */  sw         $v0, %gp_rel(D_800D1B2C)($gp)
/* 77994 80087194 620102A2 */  sb         $v0, 0x162($s0)
/* 77998 80087198 0400028E */  lw         $v0, 0x4($s0)
/* 7799C 8008719C 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 779A0 800871A0 24104300 */  and        $v0, $v0, $v1
/* 779A4 800871A4 06004014 */  bnez       $v0, .L800871C0
/* 779A8 800871A8 00000000 */   nop
/* 779AC 800871AC 5A1B020C */  jal        MONSENSE_Radar
/* 779B0 800871B0 21202002 */   addu      $a0, $s1, $zero
/* 779B4 800871B4 701C0208 */  j          .L800871C0
/* 779B8 800871B8 00000000 */   nop
.L800871BC:
/* 779BC 800871BC 620100A2 */  sb         $zero, 0x162($s0)
.L800871C0:
/* 779C0 800871C0 1800BF8F */  lw         $ra, 0x18($sp)
/* 779C4 800871C4 1400B18F */  lw         $s1, 0x14($sp)
/* 779C8 800871C8 1000B08F */  lw         $s0, 0x10($sp)
/* 779CC 800871CC 0800E003 */  jr         $ra
/* 779D0 800871D0 2000BD27 */   addiu     $sp, $sp, 0x20
.size MONSENSE_DoSenses, . - MONSENSE_DoSenses
