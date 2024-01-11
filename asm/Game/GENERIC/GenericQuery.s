.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GenericQuery
/* 2F138 8003E938 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2F13C 8003E93C 1000B0AF */  sw         $s0, 0x10($sp)
/* 2F140 8003E940 21808000 */  addu       $s0, $a0, $zero
/* 2F144 8003E944 21200000 */  addu       $a0, $zero, $zero
/* 2F148 8003E948 FFFFA324 */  addiu      $v1, $a1, -0x1
/* 2F14C 8003E94C 1800622C */  sltiu      $v0, $v1, 0x18
/* 2F150 8003E950 52004010 */  beqz       $v0, .L8003EA9C
/* 2F154 8003E954 1400BFAF */   sw        $ra, 0x14($sp)
/* 2F158 8003E958 0180023C */  lui        $v0, %hi(jtbl_800101D0)
/* 2F15C 8003E95C D0014224 */  addiu      $v0, $v0, %lo(jtbl_800101D0)
/* 2F160 8003E960 80180300 */  sll        $v1, $v1, 2
/* 2F164 8003E964 21186200 */  addu       $v1, $v1, $v0
/* 2F168 8003E968 0000628C */  lw         $v0, 0x0($v1)
/* 2F16C 8003E96C 00000000 */  nop
/* 2F170 8003E970 08004000 */  jr         $v0
/* 2F174 8003E974 00000000 */   nop
jlabel .L8003E978
/* 2F178 8003E978 5C000486 */  lh         $a0, 0x5C($s0)
/* 2F17C 8003E97C 5E000586 */  lh         $a1, 0x5E($s0)
/* 2F180 8003E980 60000686 */  lh         $a2, 0x60($s0)
/* 2F184 8003E984 66FA0008 */  j          .L8003E998
/* 2F188 8003E988 00000000 */   nop
jlabel .L8003E98C
/* 2F18C 8003E98C 74000486 */  lh         $a0, 0x74($s0)
/* 2F190 8003E990 76000586 */  lh         $a1, 0x76($s0)
/* 2F194 8003E994 78000686 */  lh         $a2, 0x78($s0)
.L8003E998:
/* 2F198 8003E998 3CC4010C */  jal        SetPositionData
/* 2F19C 8003E99C 00000000 */   nop
/* 2F1A0 8003E9A0 A7FA0008 */  j          .L8003EA9C
/* 2F1A4 8003E9A4 21204000 */   addu      $a0, $v0, $zero
jlabel .L8003E9A8
/* 2F1A8 8003E9A8 1800028E */  lw         $v0, 0x18($s0)
/* 2F1AC 8003E9AC 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 2F1B0 8003E9B0 24104300 */  and        $v0, $v0, $v1
/* 2F1B4 8003E9B4 39004010 */  beqz       $v0, .L8003EA9C
/* 2F1B8 8003E9B8 01000424 */   addiu     $a0, $zero, 0x1
/* 2F1BC 8003E9BC A7FA0008 */  j          .L8003EA9C
/* 2F1C0 8003E9C0 02000424 */   addiu     $a0, $zero, 0x2
jlabel .L8003E9C4
/* 2F1C4 8003E9C4 4000048E */  lw         $a0, 0x40($s0)
/* 2F1C8 8003E9C8 A7FA0008 */  j          .L8003EA9C
/* 2F1CC 8003E9CC 00000000 */   nop
jlabel .L8003E9D0
/* 2F1D0 8003E9D0 21200002 */  addu       $a0, $s0, $zero
/* 2F1D4 8003E9D4 A1C9010C */  jal        G2EmulationInstanceQueryAnimation
/* 2F1D8 8003E9D8 21280000 */   addu      $a1, $zero, $zero
/* 2F1DC 8003E9DC A7FA0008 */  j          .L8003EA9C
/* 2F1E0 8003E9E0 21204000 */   addu      $a0, $v0, $zero
jlabel .L8003E9E4
/* 2F1E4 8003E9E4 21200002 */  addu       $a0, $s0, $zero
/* 2F1E8 8003E9E8 B2C9010C */  jal        G2EmulationInstanceQueryFrame
/* 2F1EC 8003E9EC 21280000 */   addu      $a1, $zero, $zero
/* 2F1F0 8003E9F0 A7FA0008 */  j          .L8003EA9C
/* 2F1F4 8003E9F4 21204000 */   addu      $a0, $v0, $zero
jlabel .L8003E9F8
/* 2F1F8 8003E9F8 1800028E */  lw         $v0, 0x18($s0)
/* 2F1FC 8003E9FC 00000000 */  nop
/* 2F200 8003EA00 04004230 */  andi       $v0, $v0, 0x4
/* 2F204 8003EA04 25004010 */  beqz       $v0, .L8003EA9C
/* 2F208 8003EA08 00000000 */   nop
/* 2F20C 8003EA0C 6DC3010C */  jal        CIRC_Alloc
/* 2F210 8003EA10 0C000424 */   addiu     $a0, $zero, 0xC
/* 2F214 8003EA14 21204000 */  addu       $a0, $v0, $zero
/* 2F218 8003EA18 0400838C */  lw         $v1, 0x4($a0)
/* 2F21C 8003EA1C 08000224 */  addiu      $v0, $zero, 0x8
/* 2F220 8003EA20 000082AC */  sw         $v0, 0x0($a0)
/* 2F224 8003EA24 1700078A */  lwl        $a3, 0x17($s0)
/* 2F228 8003EA28 1400079A */  lwr        $a3, 0x14($s0)
/* 2F22C 8003EA2C 1B00088A */  lwl        $t0, 0x1B($s0)
/* 2F230 8003EA30 1800089A */  lwr        $t0, 0x18($s0)
/* 2F234 8003EA34 030067A8 */  swl        $a3, 0x3($v1)
/* 2F238 8003EA38 000067B8 */  swr        $a3, 0x0($v1)
/* 2F23C 8003EA3C 070068A8 */  swl        $t0, 0x7($v1)
/* 2F240 8003EA40 040068B8 */  swr        $t0, 0x4($v1)
/* 2F244 8003EA44 A7FA0008 */  j          .L8003EA9C
/* 2F248 8003EA48 00000000 */   nop
jlabel .L8003EA4C
/* 2F24C 8003EA4C 1C00048E */  lw         $a0, 0x1C($s0)
/* 2F250 8003EA50 00000000 */  nop
/* 2F254 8003EA54 2C00858C */  lw         $a1, 0x2C($a0)
/* 2F258 8003EA58 0004023C */  lui        $v0, (0x4000000 >> 16)
/* 2F25C 8003EA5C 2410A200 */  and        $v0, $a1, $v0
/* 2F260 8003EA60 03004010 */  beqz       $v0, .L8003EA70
/* 2F264 8003EA64 1000033C */   lui       $v1, (0x100000 >> 16)
/* 2F268 8003EA68 A7FA0008 */  j          .L8003EA9C
/* 2F26C 8003EA6C 0400043C */   lui       $a0, (0x40000 >> 16)
.L8003EA70:
/* 2F270 8003EA70 0000828C */  lw         $v0, 0x0($a0)
/* 2F274 8003EA74 00000000 */  nop
/* 2F278 8003EA78 24104300 */  and        $v0, $v0, $v1
/* 2F27C 8003EA7C 07004014 */  bnez       $v0, .L8003EA9C
/* 2F280 8003EA80 21206000 */   addu      $a0, $v1, $zero
/* 2F284 8003EA84 2000A230 */  andi       $v0, $a1, 0x20
/* 2F288 8003EA88 04004010 */  beqz       $v0, .L8003EA9C
/* 2F28C 8003EA8C 0080043C */   lui       $a0, (0x80000000 >> 16)
/* 2F290 8003EA90 A7FA0008 */  j          .L8003EA9C
/* 2F294 8003EA94 2000043C */   lui       $a0, (0x200000 >> 16)
jlabel .L8003EA98
/* 2F298 8003EA98 21200000 */  addu       $a0, $zero, $zero
.L8003EA9C:
/* 2F29C 8003EA9C 1400BF8F */  lw         $ra, 0x14($sp)
/* 2F2A0 8003EAA0 1000B08F */  lw         $s0, 0x10($sp)
/* 2F2A4 8003EAA4 21108000 */  addu       $v0, $a0, $zero
/* 2F2A8 8003EAA8 0800E003 */  jr         $ra
/* 2F2AC 8003EAAC 1800BD27 */   addiu     $sp, $sp, 0x18
.size GenericQuery, . - GenericQuery
