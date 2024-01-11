.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD7D0
/* ADFD0 800BD7D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* ADFD4 800BD7D4 1000B0AF */  sw         $s0, 0x10($sp)
/* ADFD8 800BD7D8 21808000 */  addu       $s0, $a0, $zero
/* ADFDC 800BD7DC 57000426 */  addiu      $a0, $s0, 0x57
/* ADFE0 800BD7E0 1400BFAF */  sw         $ra, 0x14($sp)
/* ADFE4 800BD7E4 3E0D030C */  jal        bzero
/* ADFE8 800BD7E8 06000524 */   addiu     $a1, $zero, 0x6
/* ADFEC 800BD7EC E6000296 */  lhu        $v0, 0xE6($s0)
/* ADFF0 800BD7F0 00000000 */  nop
/* ADFF4 800BD7F4 54004010 */  beqz       $v0, .L800BD948
/* ADFF8 800BD7F8 00000000 */   nop
/* ADFFC 800BD7FC 2800028E */  lw         $v0, 0x28($s0)
/* AE000 800BD800 00000000 */  nop
/* AE004 800BD804 50004010 */  beqz       $v0, .L800BD948
/* AE008 800BD808 00000000 */   nop
/* AE00C 800BD80C 34000292 */  lbu        $v0, 0x34($s0)
/* AE010 800BD810 00000000 */  nop
/* AE014 800BD814 0700422C */  sltiu      $v0, $v0, 0x7
/* AE018 800BD818 02004010 */  beqz       $v0, .L800BD824
/* AE01C 800BD81C 06000924 */   addiu     $t1, $zero, 0x6
/* AE020 800BD820 34000992 */  lbu        $t1, 0x34($s0)
.L800BD824:
/* AE024 800BD824 E9000292 */  lbu        $v0, 0xE9($s0)
/* AE028 800BD828 00000000 */  nop
/* AE02C 800BD82C 83004010 */  beqz       $v0, .L800BDA3C
/* AE030 800BD830 21400000 */   addu      $t0, $zero, $zero
/* AE034 800BD834 01000B24 */  addiu      $t3, $zero, 0x1
/* AE038 800BD838 21500000 */  addu       $t2, $zero, $zero
.L800BD83C:
/* AE03C 800BD83C 0400028E */  lw         $v0, 0x4($s0)
/* AE040 800BD840 21300000 */  addu       $a2, $zero, $zero
/* AE044 800BD844 21104201 */  addu       $v0, $t2, $v0
/* AE048 800BD848 02004290 */  lbu        $v0, 0x2($v0)
/* AE04C 800BD84C 00000000 */  nop
/* AE050 800BD850 02004010 */  beqz       $v0, .L800BD85C
/* AE054 800BD854 01000724 */   addiu     $a3, $zero, 0x1
/* AE058 800BD858 FF000724 */  addiu      $a3, $zero, 0xFF
.L800BD85C:
/* AE05C 800BD85C 5D000526 */  addiu      $a1, $s0, 0x5D
/* AE060 800BD860 2800048E */  lw         $a0, 0x28($s0)
/* AE064 800BD864 0F002011 */  beqz       $t1, .L800BD8A4
/* AE068 800BD868 21180000 */   addu      $v1, $zero, $zero
.L800BD86C:
/* AE06C 800BD86C 0000A290 */  lbu        $v0, 0x0($a1)
/* AE070 800BD870 00000000 */  nop
/* AE074 800BD874 06004814 */  bne        $v0, $t0, .L800BD890
/* AE078 800BD878 00000000 */   nop
/* AE07C 800BD87C 00008290 */  lbu        $v0, 0x0($a0)
/* AE080 800BD880 00000000 */  nop
/* AE084 800BD884 24104700 */  and        $v0, $v0, $a3
/* AE088 800BD888 16004014 */  bnez       $v0, .L800BD8E4
/* AE08C 800BD88C 00000000 */   nop
.L800BD890:
/* AE090 800BD890 0100A524 */  addiu      $a1, $a1, 0x1
/* AE094 800BD894 01006324 */  addiu      $v1, $v1, 0x1
/* AE098 800BD898 2A106900 */  slt        $v0, $v1, $t1
/* AE09C 800BD89C F3FF4014 */  bnez       $v0, .L800BD86C
/* AE0A0 800BD8A0 01008424 */   addiu     $a0, $a0, 0x1
.L800BD8A4:
/* AE0A4 800BD8A4 2100C010 */  beqz       $a2, .L800BD92C
/* AE0A8 800BD8A8 00000000 */   nop
/* AE0AC 800BD8AC 0400028E */  lw         $v0, 0x4($s0)
/* AE0B0 800BD8B0 00000000 */  nop
/* AE0B4 800BD8B4 21104201 */  addu       $v0, $t2, $v0
/* AE0B8 800BD8B8 03004390 */  lbu        $v1, 0x3($v0)
/* AE0BC 800BD8BC 0D80023C */  lui        $v0, %hi(_padTotalCurr)
/* AE0C0 800BD8C0 4CE9428C */  lw         $v0, %lo(_padTotalCurr)($v0)
/* AE0C4 800BD8C4 00000000 */  nop
/* AE0C8 800BD8C8 21184300 */  addu       $v1, $v0, $v1
/* AE0CC 800BD8CC 3D006228 */  slti       $v0, $v1, 0x3D
/* AE0D0 800BD8D0 06004010 */  beqz       $v0, .L800BD8EC
/* AE0D4 800BD8D4 00000000 */   nop
/* AE0D8 800BD8D8 0D80013C */  lui        $at, %hi(_padTotalCurr)
/* AE0DC 800BD8DC 3CF60208 */  j          .L800BD8F0
/* AE0E0 800BD8E0 4CE923AC */   sw        $v1, %lo(_padTotalCurr)($at)
.L800BD8E4:
/* AE0E4 800BD8E4 29F60208 */  j          .L800BD8A4
/* AE0E8 800BD8E8 01000624 */   addiu     $a2, $zero, 0x1
.L800BD8EC:
/* AE0EC 800BD8EC 21300000 */  addu       $a2, $zero, $zero
.L800BD8F0:
/* AE0F0 800BD8F0 0E00C010 */  beqz       $a2, .L800BD92C
/* AE0F4 800BD8F4 00000000 */   nop
/* AE0F8 800BD8F8 5D000526 */  addiu      $a1, $s0, 0x5D
/* AE0FC 800BD8FC 57000426 */  addiu      $a0, $s0, 0x57
/* AE100 800BD900 0A002011 */  beqz       $t1, .L800BD92C
/* AE104 800BD904 21180000 */   addu      $v1, $zero, $zero
.L800BD908:
/* AE108 800BD908 0000A290 */  lbu        $v0, 0x0($a1)
/* AE10C 800BD90C 00000000 */  nop
/* AE110 800BD910 02004814 */  bne        $v0, $t0, .L800BD91C
/* AE114 800BD914 0100A524 */   addiu     $a1, $a1, 0x1
/* AE118 800BD918 00008BA0 */  sb         $t3, 0x0($a0)
.L800BD91C:
/* AE11C 800BD91C 01006324 */  addiu      $v1, $v1, 0x1
/* AE120 800BD920 2A106900 */  slt        $v0, $v1, $t1
/* AE124 800BD924 F8FF4014 */  bnez       $v0, .L800BD908
/* AE128 800BD928 01008424 */   addiu     $a0, $a0, 0x1
.L800BD92C:
/* AE12C 800BD92C E9000292 */  lbu        $v0, 0xE9($s0)
/* AE130 800BD930 01000825 */  addiu      $t0, $t0, 0x1
/* AE134 800BD934 2A100201 */  slt        $v0, $t0, $v0
/* AE138 800BD938 C0FF4014 */  bnez       $v0, .L800BD83C
/* AE13C 800BD93C 05004A25 */   addiu     $t2, $t2, 0x5
/* AE140 800BD940 8FF60208 */  j          .L800BDA3C
/* AE144 800BD944 00000000 */   nop
.L800BD948:
/* AE148 800BD948 E8000392 */  lbu        $v1, 0xE8($s0)
/* AE14C 800BD94C 00000000 */  nop
/* AE150 800BD950 FCFF6224 */  addiu      $v0, $v1, -0x4
/* AE154 800BD954 0200422C */  sltiu      $v0, $v0, 0x2
/* AE158 800BD958 03004014 */  bnez       $v0, .L800BD968
/* AE15C 800BD95C 07000224 */   addiu     $v0, $zero, 0x7
/* AE160 800BD960 26006214 */  bne        $v1, $v0, .L800BD9FC
/* AE164 800BD964 00000000 */   nop
.L800BD968:
/* AE168 800BD968 E6000296 */  lhu        $v0, 0xE6($s0)
/* AE16C 800BD96C 00000000 */  nop
/* AE170 800BD970 22004014 */  bnez       $v0, .L800BD9FC
/* AE174 800BD974 00000000 */   nop
/* AE178 800BD978 34000292 */  lbu        $v0, 0x34($s0)
/* AE17C 800BD97C 00000000 */  nop
/* AE180 800BD980 0200422C */  sltiu      $v0, $v0, 0x2
/* AE184 800BD984 1D004014 */  bnez       $v0, .L800BD9FC
/* AE188 800BD988 40000324 */   addiu     $v1, $zero, 0x40
/* AE18C 800BD98C 2800048E */  lw         $a0, 0x28($s0)
/* AE190 800BD990 00000000 */  nop
/* AE194 800BD994 00008290 */  lbu        $v0, 0x0($a0)
/* AE198 800BD998 00000000 */  nop
/* AE19C 800BD99C C0004230 */  andi       $v0, $v0, 0xC0
/* AE1A0 800BD9A0 26004314 */  bne        $v0, $v1, .L800BDA3C
/* AE1A4 800BD9A4 00000000 */   nop
/* AE1A8 800BD9A8 01008290 */  lbu        $v0, 0x1($a0)
/* AE1AC 800BD9AC 00000000 */  nop
/* AE1B0 800BD9B0 01004230 */  andi       $v0, $v0, 0x1
/* AE1B4 800BD9B4 21004010 */  beqz       $v0, .L800BDA3C
/* AE1B8 800BD9B8 00000000 */   nop
/* AE1BC 800BD9BC 0D80023C */  lui        $v0, %hi(_padTotalCurr)
/* AE1C0 800BD9C0 4CE9428C */  lw         $v0, %lo(_padTotalCurr)($v0)
/* AE1C4 800BD9C4 00000000 */  nop
/* AE1C8 800BD9C8 0A004224 */  addiu      $v0, $v0, 0xA
/* AE1CC 800BD9CC 3D004228 */  slti       $v0, $v0, 0x3D
/* AE1D0 800BD9D0 1A004010 */  beqz       $v0, .L800BDA3C
/* AE1D4 800BD9D4 01000224 */   addiu     $v0, $zero, 0x1
/* AE1D8 800BD9D8 580002A2 */  sb         $v0, 0x58($s0)
/* AE1DC 800BD9DC 570002A2 */  sb         $v0, 0x57($s0)
/* AE1E0 800BD9E0 0D80023C */  lui        $v0, %hi(_padTotalCurr)
/* AE1E4 800BD9E4 4CE9428C */  lw         $v0, %lo(_padTotalCurr)($v0)
/* AE1E8 800BD9E8 00000000 */  nop
/* AE1EC 800BD9EC 0A004224 */  addiu      $v0, $v0, 0xA
/* AE1F0 800BD9F0 0D80013C */  lui        $at, %hi(_padTotalCurr)
/* AE1F4 800BD9F4 8FF60208 */  j          .L800BDA3C
/* AE1F8 800BD9F8 4CE922AC */   sw        $v0, %lo(_padTotalCurr)($at)
.L800BD9FC:
/* AE1FC 800BD9FC E8000392 */  lbu        $v1, 0xE8($s0)
/* AE200 800BDA00 03000224 */  addiu      $v0, $zero, 0x3
/* AE204 800BDA04 03006214 */  bne        $v1, $v0, .L800BDA14
/* AE208 800BDA08 01000224 */   addiu     $v0, $zero, 0x1
/* AE20C 800BDA0C 8FF60208 */  j          .L800BDA3C
/* AE210 800BDA10 570002A2 */   sb        $v0, 0x57($s0)
.L800BDA14:
/* AE214 800BDA14 E6000296 */  lhu        $v0, 0xE6($s0)
/* AE218 800BDA18 00000000 */  nop
/* AE21C 800BDA1C 07004014 */  bnez       $v0, .L800BDA3C
/* AE220 800BDA20 01000224 */   addiu     $v0, $zero, 0x1
/* AE224 800BDA24 05000324 */  addiu      $v1, $zero, 0x5
/* AE228 800BDA28 05000426 */  addiu      $a0, $s0, 0x5
.L800BDA2C:
/* AE22C 800BDA2C 570082A0 */  sb         $v0, 0x57($a0)
/* AE230 800BDA30 FFFF6324 */  addiu      $v1, $v1, -0x1
/* AE234 800BDA34 FDFF6104 */  bgez       $v1, .L800BDA2C
/* AE238 800BDA38 FFFF8424 */   addiu     $a0, $a0, -0x1
.L800BDA3C:
/* AE23C 800BDA3C 1400BF8F */  lw         $ra, 0x14($sp)
/* AE240 800BDA40 1000B08F */  lw         $s0, 0x10($sp)
/* AE244 800BDA44 0800E003 */  jr         $ra
/* AE248 800BDA48 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BD7D0, . - func_800BD7D0
