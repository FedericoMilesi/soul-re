.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InsertGlobalObject
/* 497D4 80058FD4 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 497D8 80058FD8 A000B2AF */  sw         $s2, 0xA0($sp)
/* 497DC 80058FDC 21908000 */  addu       $s2, $a0, $zero
/* 497E0 80058FE0 A400B3AF */  sw         $s3, 0xA4($sp)
/* 497E4 80058FE4 2198A000 */  addu       $s3, $a1, $zero
/* 497E8 80058FE8 9C00B1AF */  sw         $s1, 0x9C($sp)
/* 497EC 80058FEC FFFF1124 */  addiu      $s1, $zero, -0x1
/* 497F0 80058FF0 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 497F4 80058FF4 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 497F8 80058FF8 A800BFAF */  sw         $ra, 0xA8($sp)
/* 497FC 80058FFC 24104300 */  and        $v0, $v0, $v1
/* 49800 80059000 05004010 */  beqz       $v0, .L80059018
/* 49804 80059004 9800B0AF */   sw        $s0, 0x98($sp)
/* 49808 80059008 9863010C */  jal        STREAM_IsSpecialMonster
/* 4980C 8005900C 00000000 */   nop
/* 49810 80059010 50004014 */  bnez       $v0, .L80059154
/* 49814 80059014 21102002 */   addu      $v0, $s1, $zero
.L80059018:
/* 49818 80059018 C400628E */  lw         $v0, 0xC4($s3)
/* 4981C 8005901C 00000000 */  nop
/* 49820 80059020 00804230 */  andi       $v0, $v0, 0x8000
/* 49824 80059024 05004010 */  beqz       $v0, .L8005903C
/* 49828 80059028 00000000 */   nop
/* 4982C 8005902C D863010C */  jal        STREAM_IsMonster
/* 49830 80059030 21204002 */   addu      $a0, $s2, $zero
/* 49834 80059034 47004014 */  bnez       $v0, .L80059154
/* 49838 80059038 21102002 */   addu      $v0, $s1, $zero
.L8005903C:
/* 4983C 8005903C 4400708E */  lw         $s0, 0x44($s3)
/* 49840 80059040 21880000 */  addu       $s1, $zero, $zero
.L80059044:
/* 49844 80059044 14000286 */  lh         $v0, 0x14($s0)
/* 49848 80059048 00000000 */  nop
/* 4984C 8005904C 05004010 */  beqz       $v0, .L80059064
/* 49850 80059050 21200002 */   addu      $a0, $s0, $zero
/* 49854 80059054 1CD2010C */  jal        strcmpi
/* 49858 80059058 21284002 */   addu      $a1, $s2, $zero
/* 4985C 8005905C 06004010 */  beqz       $v0, .L80059078
/* 49860 80059060 30000224 */   addiu     $v0, $zero, 0x30
.L80059064:
/* 49864 80059064 01003126 */  addiu      $s1, $s1, 0x1
/* 49868 80059068 3000222A */  slti       $v0, $s1, 0x30
/* 4986C 8005906C F5FF4014 */  bnez       $v0, .L80059044
/* 49870 80059070 24001026 */   addiu     $s0, $s0, 0x24
/* 49874 80059074 30000224 */  addiu      $v0, $zero, 0x30
.L80059078:
/* 49878 80059078 36002216 */  bne        $s1, $v0, .L80059154
/* 4987C 8005907C 21102002 */   addu      $v0, $s1, $zero
/* 49880 80059080 4400708E */  lw         $s0, 0x44($s3)
/* 49884 80059084 21880000 */  addu       $s1, $zero, $zero
.L80059088:
/* 49888 80059088 14000286 */  lh         $v0, 0x14($s0)
/* 4988C 8005908C 00000000 */  nop
/* 49890 80059090 06004010 */  beqz       $v0, .L800590AC
/* 49894 80059094 30000224 */   addiu     $v0, $zero, 0x30
/* 49898 80059098 01003126 */  addiu      $s1, $s1, 0x1
/* 4989C 8005909C 3000222A */  slti       $v0, $s1, 0x30
/* 498A0 800590A0 F9FF4014 */  bnez       $v0, .L80059088
/* 498A4 800590A4 24001026 */   addiu     $s0, $s0, 0x24
/* 498A8 800590A8 30000224 */  addiu      $v0, $zero, 0x30
.L800590AC:
/* 498AC 800590AC 0C002216 */  bne        $s1, $v0, .L800590E0
/* 498B0 800590B0 1800A427 */   addiu     $a0, $sp, 0x18
/* 498B4 800590B4 E163010C */  jal        STREAM_TryAndDumpANonResidentObject
/* 498B8 800590B8 00000000 */   nop
/* 498BC 800590BC 21884000 */  addu       $s1, $v0, $zero
/* 498C0 800590C0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 498C4 800590C4 06002216 */  bne        $s1, $v0, .L800590E0
/* 498C8 800590C8 1800A427 */   addiu     $a0, $sp, 0x18
/* 498CC 800590CC 0D80043C */  lui        $a0, %hi(WarpRoomArray + 0x24C)
/* 498D0 800590D0 E4188424 */  addiu      $a0, $a0, %lo(WarpRoomArray + 0x24C)
/* 498D4 800590D4 2B52000C */  jal        DEBUG_FatalError
/* 498D8 800590D8 30000524 */   addiu     $a1, $zero, 0x30
/* 498DC 800590DC 1800A427 */  addiu      $a0, $sp, 0x18
.L800590E0:
/* 498E0 800590E0 0D80053C */  lui        $a1, %hi(WarpRoomArray + 0x278)
/* 498E4 800590E4 1019A524 */  addiu      $a1, $a1, %lo(WarpRoomArray + 0x278)
/* 498E8 800590E8 21304002 */  addu       $a2, $s2, $zero
/* 498EC 800590EC 1AD1010C */  jal        sprintf
/* 498F0 800590F0 21384002 */   addu      $a3, $s2, $zero
/* 498F4 800590F4 5800A427 */  addiu      $a0, $sp, 0x58
/* 498F8 800590F8 0D80053C */  lui        $a1, %hi(WarpRoomArray + 0x290)
/* 498FC 800590FC 2819A524 */  addiu      $a1, $a1, %lo(WarpRoomArray + 0x290)
/* 49900 80059100 21304002 */  addu       $a2, $s2, $zero
/* 49904 80059104 1AD1010C */  jal        sprintf
/* 49908 80059108 21384002 */   addu      $a3, $s2, $zero
/* 4990C 8005910C 21200002 */  addu       $a0, $s0, $zero
/* 49910 80059110 1CF4020C */  jal        strcpy
/* 49914 80059114 21284002 */   addu      $a1, $s2, $zero
/* 49918 80059118 1800A427 */  addiu      $a0, $sp, 0x18
/* 4991C 8005911C 0680053C */  lui        $a1, %hi(STREAM_LoadObjectReturn)
/* 49920 80059120 408CA524 */  addiu      $a1, $a1, %lo(STREAM_LoadObjectReturn)
/* 49924 80059124 21300002 */  addu       $a2, $s0, $zero
/* 49928 80059128 21380000 */  addu       $a3, $zero, $zero
/* 4992C 8005912C 01000224 */  addiu      $v0, $zero, 0x1
/* 49930 80059130 140002A6 */  sh         $v0, 0x14($s0)
/* 49934 80059134 10000226 */  addiu      $v0, $s0, 0x10
/* 49938 80059138 1000A2AF */  sw         $v0, 0x10($sp)
/* 4993C 8005913C 01000224 */  addiu      $v0, $zero, 0x1
/* 49940 80059140 EA81010C */  jal        LOAD_NonBlockingBinaryLoad
/* 49944 80059144 1400A2AF */   sw        $v0, 0x14($sp)
/* 49948 80059148 160000A6 */  sh         $zero, 0x16($s0)
/* 4994C 8005914C 1C0000A2 */  sb         $zero, 0x1C($s0)
/* 49950 80059150 21102002 */  addu       $v0, $s1, $zero
.L80059154:
/* 49954 80059154 A800BF8F */  lw         $ra, 0xA8($sp)
/* 49958 80059158 A400B38F */  lw         $s3, 0xA4($sp)
/* 4995C 8005915C A000B28F */  lw         $s2, 0xA0($sp)
/* 49960 80059160 9C00B18F */  lw         $s1, 0x9C($sp)
/* 49964 80059164 9800B08F */  lw         $s0, 0x98($sp)
/* 49968 80059168 0800E003 */  jr         $ra
/* 4996C 8005916C B000BD27 */   addiu     $sp, $sp, 0xB0
.size InsertGlobalObject, . - InsertGlobalObject
