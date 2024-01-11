.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterRelocateInstanceObject
/* 6F92C 8007F12C 6C01828C */  lw         $v0, 0x16C($a0)
/* 6F930 8007F130 00000000 */  nop
/* 6F934 8007F134 44004010 */  beqz       $v0, .L8007F248
/* 6F938 8007F138 00000000 */   nop
/* 6F93C 8007F13C 6801438C */  lw         $v1, 0x168($v0)
/* 6F940 8007F140 00000000 */  nop
/* 6F944 8007F144 02006010 */  beqz       $v1, .L8007F150
/* 6F948 8007F148 21300000 */   addu      $a2, $zero, $zero
/* 6F94C 8007F14C 21306500 */  addu       $a2, $v1, $a1
.L8007F150:
/* 6F950 8007F150 B800438C */  lw         $v1, 0xB8($v0)
/* 6F954 8007F154 21380000 */  addu       $a3, $zero, $zero
/* 6F958 8007F158 02006010 */  beqz       $v1, .L8007F164
/* 6F95C 8007F15C 680146AC */   sw        $a2, 0x168($v0)
/* 6F960 8007F160 21386500 */  addu       $a3, $v1, $a1
.L8007F164:
/* 6F964 8007F164 BC00468C */  lw         $a2, 0xBC($v0)
/* 6F968 8007F168 21180000 */  addu       $v1, $zero, $zero
/* 6F96C 8007F16C 0200C010 */  beqz       $a2, .L8007F178
/* 6F970 8007F170 B80047AC */   sw        $a3, 0xB8($v0)
/* 6F974 8007F174 2118C500 */  addu       $v1, $a2, $a1
.L8007F178:
/* 6F978 8007F178 BC0043AC */  sw         $v1, 0xBC($v0)
/* 6F97C 8007F17C 1C00868C */  lw         $a2, 0x1C($a0)
/* 6F980 8007F180 00000000 */  nop
/* 6F984 8007F184 0000C28C */  lw         $v0, 0x0($a2)
/* 6F988 8007F188 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 6F98C 8007F18C 24104300 */  and        $v0, $v0, $v1
/* 6F990 8007F190 2D004010 */  beqz       $v0, .L8007F248
/* 6F994 8007F194 00000000 */   nop
/* 6F998 8007F198 4000C28C */  lw         $v0, 0x40($a2)
/* 6F99C 8007F19C 00000000 */  nop
/* 6F9A0 8007F1A0 0C00438C */  lw         $v1, 0xC($v0)
/* 6F9A4 8007F1A4 00000000 */  nop
/* 6F9A8 8007F1A8 2B104300 */  sltu       $v0, $v0, $v1
/* 6F9AC 8007F1AC 07004010 */  beqz       $v0, .L8007F1CC
/* 6F9B0 8007F1B0 00000000 */   nop
/* 6F9B4 8007F1B4 1801838C */  lw         $v1, 0x118($a0)
/* 6F9B8 8007F1B8 00000000 */  nop
/* 6F9BC 8007F1BC 02006010 */  beqz       $v1, .L8007F1C8
/* 6F9C0 8007F1C0 21100000 */   addu      $v0, $zero, $zero
/* 6F9C4 8007F1C4 21106500 */  addu       $v0, $v1, $a1
.L8007F1C8:
/* 6F9C8 8007F1C8 180182AC */  sw         $v0, 0x118($a0)
.L8007F1CC:
/* 6F9CC 8007F1CC 1C00828C */  lw         $v0, 0x1C($a0)
/* 6F9D0 8007F1D0 00000000 */  nop
/* 6F9D4 8007F1D4 4000428C */  lw         $v0, 0x40($v0)
/* 6F9D8 8007F1D8 00000000 */  nop
/* 6F9DC 8007F1DC 1000438C */  lw         $v1, 0x10($v0)
/* 6F9E0 8007F1E0 00000000 */  nop
/* 6F9E4 8007F1E4 2B104300 */  sltu       $v0, $v0, $v1
/* 6F9E8 8007F1E8 07004010 */  beqz       $v0, .L8007F208
/* 6F9EC 8007F1EC 00000000 */   nop
/* 6F9F0 8007F1F0 1C01838C */  lw         $v1, 0x11C($a0)
/* 6F9F4 8007F1F4 00000000 */  nop
/* 6F9F8 8007F1F8 02006010 */  beqz       $v1, .L8007F204
/* 6F9FC 8007F1FC 21100000 */   addu      $v0, $zero, $zero
/* 6FA00 8007F200 21106500 */  addu       $v0, $v1, $a1
.L8007F204:
/* 6FA04 8007F204 1C0182AC */  sw         $v0, 0x11C($a0)
.L8007F208:
/* 6FA08 8007F208 0C01838C */  lw         $v1, 0x10C($a0)
/* 6FA0C 8007F20C 0880023C */  lui        $v0, %hi(MonsterCollide)
/* 6FA10 8007F210 C4E04224 */  addiu      $v0, $v0, %lo(MonsterCollide)
/* 6FA14 8007F214 0C006210 */  beq        $v1, $v0, .L8007F248
/* 6FA18 8007F218 00000000 */   nop
/* 6FA1C 8007F21C 1C00828C */  lw         $v0, 0x1C($a0)
/* 6FA20 8007F220 00000000 */  nop
/* 6FA24 8007F224 4000428C */  lw         $v0, 0x40($v0)
/* 6FA28 8007F228 00000000 */  nop
/* 6FA2C 8007F22C 2B104300 */  sltu       $v0, $v0, $v1
/* 6FA30 8007F230 05004010 */  beqz       $v0, .L8007F248
/* 6FA34 8007F234 00000000 */   nop
/* 6FA38 8007F238 02006010 */  beqz       $v1, .L8007F244
/* 6FA3C 8007F23C 21100000 */   addu      $v0, $zero, $zero
/* 6FA40 8007F240 21106500 */  addu       $v0, $v1, $a1
.L8007F244:
/* 6FA44 8007F244 0C0182AC */  sw         $v0, 0x10C($a0)
.L8007F248:
/* 6FA48 8007F248 0800E003 */  jr         $ra
/* 6FA4C 8007F24C 00000000 */   nop
.size MonsterRelocateInstanceObject, . - MonsterRelocateInstanceObject
