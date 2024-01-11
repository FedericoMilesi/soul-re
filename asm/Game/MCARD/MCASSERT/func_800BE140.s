.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE140
/* AE940 800BE140 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* AE944 800BE144 1400B1AF */  sw         $s1, 0x14($sp)
/* AE948 800BE148 2188A000 */  addu       $s1, $a1, $zero
/* AE94C 800BE14C 1800B2AF */  sw         $s2, 0x18($sp)
/* AE950 800BE150 2190C000 */  addu       $s2, $a2, $zero
/* AE954 800BE154 2000B4AF */  sw         $s4, 0x20($sp)
/* AE958 800BE158 21A08000 */  addu       $s4, $a0, $zero
/* AE95C 800BE15C 1000B0AF */  sw         $s0, 0x10($sp)
/* AE960 800BE160 03001024 */  addiu      $s0, $zero, 0x3
/* AE964 800BE164 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AE968 800BE168 FF009332 */  andi       $s3, $s4, 0xFF
/* AE96C 800BE16C 0D80033C */  lui        $v1, %hi(ratan_tbl + 0x840)
/* AE970 800BE170 BCE36324 */  addiu      $v1, $v1, %lo(ratan_tbl + 0x840)
/* AE974 800BE174 2400B5AF */  sw         $s5, 0x24($sp)
/* AE978 800BE178 0D80153C */  lui        $s5, %hi(CD_cbsync)
/* AE97C 800BE17C 84E9B58E */  lw         $s5, %lo(CD_cbsync)($s5)
/* AE980 800BE180 80101300 */  sll        $v0, $s3, 2
/* AE984 800BE184 2800B6AF */  sw         $s6, 0x28($sp)
/* AE988 800BE188 21B04300 */  addu       $s6, $v0, $v1
/* AE98C 800BE18C 2C00B7AF */  sw         $s7, 0x2C($sp)
/* AE990 800BE190 21B80000 */  addu       $s7, $zero, $zero
/* AE994 800BE194 3000BEAF */  sw         $fp, 0x30($sp)
/* AE998 800BE198 FFFF1E24 */  addiu      $fp, $zero, -0x1
/* AE99C 800BE19C 3400BFAF */  sw         $ra, 0x34($sp)
.L800BE1A0:
/* AE9A0 800BE1A0 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AE9A4 800BE1A4 84E920AC */  sw         $zero, %lo(CD_cbsync)($at)
/* AE9A8 800BE1A8 01000824 */  addiu      $t0, $zero, 0x1
/* AE9AC 800BE1AC 0B006812 */  beq        $s3, $t0, .L800BE1DC
/* AE9B0 800BE1B0 00000000 */   nop
/* AE9B4 800BE1B4 0D80023C */  lui        $v0, %hi(CD_status)
/* AE9B8 800BE1B8 90E94290 */  lbu        $v0, %lo(CD_status)($v0)
/* AE9BC 800BE1BC 00000000 */  nop
/* AE9C0 800BE1C0 10004230 */  andi       $v0, $v0, 0x10
/* AE9C4 800BE1C4 05004010 */  beqz       $v0, .L800BE1DC
/* AE9C8 800BE1C8 01000424 */   addiu     $a0, $zero, 0x1
/* AE9CC 800BE1CC 21280000 */  addu       $a1, $zero, $zero
/* AE9D0 800BE1D0 21300000 */  addu       $a2, $zero, $zero
/* AE9D4 800BE1D4 9E12030C */  jal        func_800C4A78
/* AE9D8 800BE1D8 21380000 */   addu      $a3, $zero, $zero
.L800BE1DC:
/* AE9DC 800BE1DC 0B002012 */  beqz       $s1, .L800BE20C
/* AE9E0 800BE1E0 00000000 */   nop
/* AE9E4 800BE1E4 0000C28E */  lw         $v0, 0x0($s6)
/* AE9E8 800BE1E8 00000000 */  nop
/* AE9EC 800BE1EC 07004010 */  beqz       $v0, .L800BE20C
/* AE9F0 800BE1F0 02000424 */   addiu     $a0, $zero, 0x2
/* AE9F4 800BE1F4 21282002 */  addu       $a1, $s1, $zero
/* AE9F8 800BE1F8 21304002 */  addu       $a2, $s2, $zero
/* AE9FC 800BE1FC 9E12030C */  jal        func_800C4A78
/* AEA00 800BE200 21380000 */   addu      $a3, $zero, $zero
/* AEA04 800BE204 0A004014 */  bnez       $v0, .L800BE230
/* AEA08 800BE208 00000000 */   nop
.L800BE20C:
/* AEA0C 800BE20C 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AEA10 800BE210 84E935AC */  sw         $s5, %lo(CD_cbsync)($at)
/* AEA14 800BE214 FF008432 */  andi       $a0, $s4, 0xFF
/* AEA18 800BE218 21282002 */  addu       $a1, $s1, $zero
/* AEA1C 800BE21C 21304002 */  addu       $a2, $s2, $zero
/* AEA20 800BE220 9E12030C */  jal        func_800C4A78
/* AEA24 800BE224 21380000 */   addu      $a3, $zero, $zero
/* AEA28 800BE228 08004010 */  beqz       $v0, .L800BE24C
/* AEA2C 800BE22C 0100E226 */   addiu     $v0, $s7, 0x1
.L800BE230:
/* AEA30 800BE230 FFFF1026 */  addiu      $s0, $s0, -0x1
/* AEA34 800BE234 DAFF1E16 */  bne        $s0, $fp, .L800BE1A0
/* AEA38 800BE238 00000000 */   nop
/* AEA3C 800BE23C 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AEA40 800BE240 84E935AC */  sw         $s5, %lo(CD_cbsync)($at)
/* AEA44 800BE244 FFFF1724 */  addiu      $s7, $zero, -0x1
/* AEA48 800BE248 0100E226 */  addiu      $v0, $s7, 0x1
.L800BE24C:
/* AEA4C 800BE24C 3400BF8F */  lw         $ra, 0x34($sp)
/* AEA50 800BE250 3000BE8F */  lw         $fp, 0x30($sp)
/* AEA54 800BE254 2C00B78F */  lw         $s7, 0x2C($sp)
/* AEA58 800BE258 2800B68F */  lw         $s6, 0x28($sp)
/* AEA5C 800BE25C 2400B58F */  lw         $s5, 0x24($sp)
/* AEA60 800BE260 2000B48F */  lw         $s4, 0x20($sp)
/* AEA64 800BE264 1C00B38F */  lw         $s3, 0x1C($sp)
/* AEA68 800BE268 1800B28F */  lw         $s2, 0x18($sp)
/* AEA6C 800BE26C 1400B18F */  lw         $s1, 0x14($sp)
/* AEA70 800BE270 1000B08F */  lw         $s0, 0x10($sp)
/* AEA74 800BE274 0800E003 */  jr         $ra
/* AEA78 800BE278 3800BD27 */   addiu     $sp, $sp, 0x38
.size func_800BE140, . - func_800BE140
