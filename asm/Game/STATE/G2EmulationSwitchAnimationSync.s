.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSwitchAnimationSync
/* 62938 80072138 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6293C 8007213C 3800BEAF */  sw         $fp, 0x38($sp)
/* 62940 80072140 21F0A000 */  addu       $fp, $a1, $zero
/* 62944 80072144 FF00C330 */  andi       $v1, $a2, 0xFF
/* 62948 80072148 40100300 */  sll        $v0, $v1, 1
/* 6294C 8007214C 21104300 */  addu       $v0, $v0, $v1
/* 62950 80072150 00110200 */  sll        $v0, $v0, 4
/* 62954 80072154 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 62958 80072158 FF00C333 */  andi       $v1, $fp, 0xFF
/* 6295C 8007215C 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 62960 80072160 3400B7AF */  sw         $s7, 0x34($sp)
/* 62964 80072164 3000B6AF */  sw         $s6, 0x30($sp)
/* 62968 80072168 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 6296C 8007216C 2800B4AF */  sw         $s4, 0x28($sp)
/* 62970 80072170 2400B3AF */  sw         $s3, 0x24($sp)
/* 62974 80072174 2000B2AF */  sw         $s2, 0x20($sp)
/* 62978 80072178 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6297C 8007217C 1800B0AF */  sw         $s0, 0x18($sp)
/* 62980 80072180 4000A4AF */  sw         $a0, 0x40($sp)
/* 62984 80072184 4C00A7AF */  sw         $a3, 0x4C($sp)
/* 62988 80072188 0000858C */  lw         $a1, 0x0($a0)
/* 6298C 8007218C 4000A88F */  lw         $t0, 0x40($sp)
/* 62990 80072190 21B0A200 */  addu       $s6, $a1, $v0
/* 62994 80072194 2120C002 */  addu       $a0, $s6, $zero
/* 62998 80072198 40100300 */  sll        $v0, $v1, 1
/* 6299C 8007219C 21104300 */  addu       $v0, $v0, $v1
/* 629A0 800721A0 00110200 */  sll        $v0, $v0, 4
/* 629A4 800721A4 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 629A8 800721A8 21A8A200 */  addu       $s5, $a1, $v0
/* 629AC 800721AC C0100600 */  sll        $v0, $a2, 3
/* 629B0 800721B0 21104600 */  addu       $v0, $v0, $a2
/* 629B4 800721B4 C0100200 */  sll        $v0, $v0, 3
/* 629B8 800721B8 23104600 */  subu       $v0, $v0, $a2
/* 629BC 800721BC 80100200 */  sll        $v0, $v0, 2
/* 629C0 800721C0 08004224 */  addiu      $v0, $v0, 0x8
/* 629C4 800721C4 21B80201 */  addu       $s7, $t0, $v0
/* 629C8 800721C8 C0101E00 */  sll        $v0, $fp, 3
/* 629CC 800721CC 21105E00 */  addu       $v0, $v0, $fp
/* 629D0 800721D0 C0100200 */  sll        $v0, $v0, 3
/* 629D4 800721D4 23105E00 */  subu       $v0, $v0, $fp
/* 629D8 800721D8 80100200 */  sll        $v0, $v0, 2
/* 629DC 800721DC 08004224 */  addiu      $v0, $v0, 0x8
/* 629E0 800721E0 2400D18E */  lw         $s1, 0x24($s6)
/* 629E4 800721E4 1400D396 */  lhu        $s3, 0x14($s6)
/* 629E8 800721E8 F03F020C */  jal        G2AnimSection_GetKeyframeNumber
/* 629EC 800721EC 21900201 */   addu      $s2, $t0, $v0
/* 629F0 800721F0 21804000 */  addu       $s0, $v0, $zero
/* 629F4 800721F4 DD3F020C */  jal        G2AnimKeylist_GetKeyframeCount
/* 629F8 800721F8 21202002 */   addu      $a0, $s1, $zero
/* 629FC 800721FC 4C00A88F */  lw         $t0, 0x4C($sp)
/* 62A00 80072200 00000000 */  nop
/* 62A04 80072204 21800802 */  addu       $s0, $s0, $t0
/* 62A08 80072208 1A000202 */  div        $zero, $s0, $v0
/* 62A0C 8007220C 10A00000 */  mfhi       $s4
/* 62A10 80072210 2120A002 */  addu       $a0, $s5, $zero
/* 62A14 80072214 4240020C */  jal        G2AnimSection_SetAlphaTable
/* 62A18 80072218 21280000 */   addu      $a1, $zero, $zero
/* 62A1C 8007221C 2120A002 */  addu       $a0, $s5, $zero
/* 62A20 80072220 21282002 */  addu       $a1, $s1, $zero
/* 62A24 80072224 4C00A88F */  lw         $t0, 0x4C($sp)
/* 62A28 80072228 21306002 */  addu       $a2, $s3, $zero
/* 62A2C 8007222C 40100800 */  sll        $v0, $t0, 1
/* 62A30 80072230 21104800 */  addu       $v0, $v0, $t0
/* 62A34 80072234 C0100200 */  sll        $v0, $v0, 3
/* 62A38 80072238 21104800 */  addu       $v0, $v0, $t0
/* 62A3C 8007223C 80140200 */  sll        $v0, $v0, 18
/* 62A40 80072240 03140200 */  sra        $v0, $v0, 16
/* 62A44 80072244 1000A2AF */  sw         $v0, 0x10($sp)
/* 62A48 80072248 0F40020C */  jal        G2AnimSection_InterpToKeylistFrame
/* 62A4C 8007224C 21388002 */   addu      $a3, $s4, $zero
/* 62A50 80072250 0000C292 */  lbu        $v0, 0x0($s6)
/* 62A54 80072254 00000000 */  nop
/* 62A58 80072258 02004230 */  andi       $v0, $v0, 0x2
/* 62A5C 8007225C 05004014 */  bnez       $v0, .L80072274
/* 62A60 80072260 00000000 */   nop
/* 62A64 80072264 7140020C */  jal        G2AnimSection_SetNoLooping
/* 62A68 80072268 2120A002 */   addu      $a0, $s5, $zero
/* 62A6C 8007226C 9FC80108 */  j          .L8007227C
/* 62A70 80072270 00000000 */   nop
.L80072274:
/* 62A74 80072274 5540020C */  jal        G2AnimSection_SetLooping
/* 62A78 80072278 2120A002 */   addu      $a0, $s5, $zero
.L8007227C:
/* 62A7C 8007227C 0000C292 */  lbu        $v0, 0x0($s6)
/* 62A80 80072280 00000000 */  nop
/* 62A84 80072284 01004230 */  andi       $v0, $v0, 0x1
/* 62A88 80072288 05004014 */  bnez       $v0, .L800722A0
/* 62A8C 8007228C 00000000 */   nop
/* 62A90 80072290 8040020C */  jal        G2AnimSection_SetUnpaused
/* 62A94 80072294 2120A002 */   addu      $a0, $s5, $zero
/* 62A98 80072298 ABC80108 */  j          .L800722AC
/* 62A9C 8007229C 2128C003 */   addu      $a1, $fp, $zero
.L800722A0:
/* 62AA0 800722A0 7B40020C */  jal        G2AnimSection_SetPaused
/* 62AA4 800722A4 2120A002 */   addu      $a0, $s5, $zero
/* 62AA8 800722A8 2128C003 */  addu       $a1, $fp, $zero
.L800722AC:
/* 62AAC 800722AC 4000A48F */  lw         $a0, 0x40($sp)
/* 62AB0 800722B0 0000E68E */  lw         $a2, 0x0($s7)
/* 62AB4 800722B4 C1CA010C */  jal        StateSwitchStateData
/* 62AB8 800722B8 21380000 */   addu      $a3, $zero, $zero
/* 62ABC 800722BC 1401E28E */  lw         $v0, 0x114($s7)
/* 62AC0 800722C0 00000000 */  nop
/* 62AC4 800722C4 140142AE */  sw         $v0, 0x114($s2)
/* 62AC8 800722C8 1801E28E */  lw         $v0, 0x118($s7)
/* 62ACC 800722CC 00000000 */  nop
/* 62AD0 800722D0 180142AE */  sw         $v0, 0x118($s2)
/* 62AD4 800722D4 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 62AD8 800722D8 3800BE8F */  lw         $fp, 0x38($sp)
/* 62ADC 800722DC 3400B78F */  lw         $s7, 0x34($sp)
/* 62AE0 800722E0 3000B68F */  lw         $s6, 0x30($sp)
/* 62AE4 800722E4 2C00B58F */  lw         $s5, 0x2C($sp)
/* 62AE8 800722E8 2800B48F */  lw         $s4, 0x28($sp)
/* 62AEC 800722EC 2400B38F */  lw         $s3, 0x24($sp)
/* 62AF0 800722F0 2000B28F */  lw         $s2, 0x20($sp)
/* 62AF4 800722F4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 62AF8 800722F8 1800B08F */  lw         $s0, 0x18($sp)
/* 62AFC 800722FC 0800E003 */  jr         $ra
/* 62B00 80072300 4000BD27 */   addiu     $sp, $sp, 0x40
.size G2EmulationSwitchAnimationSync, . - G2EmulationSwitchAnimationSync
