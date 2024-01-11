.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_VaReallyPrint
/* 1E110 8002D910 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 1E114 8002D914 1800B2AF */  sw         $s2, 0x18($sp)
/* 1E118 8002D918 21908000 */  addu       $s2, $a0, $zero
/* 1E11C 8002D91C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1E120 8002D920 ECB99327 */  addiu      $s3, $gp, %gp_rel(fontTracker + 0x600)
/* 1E124 8002D924 3400BFAF */  sw         $ra, 0x34($sp)
/* 1E128 8002D928 3000BEAF */  sw         $fp, 0x30($sp)
/* 1E12C 8002D92C 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 1E130 8002D930 2800B6AF */  sw         $s6, 0x28($sp)
/* 1E134 8002D934 2400B5AF */  sw         $s5, 0x24($sp)
/* 1E138 8002D938 2000B4AF */  sw         $s4, 0x20($sp)
/* 1E13C 8002D93C 1400B1AF */  sw         $s1, 0x14($sp)
/* 1E140 8002D940 1000B0AF */  sw         $s0, 0x10($sp)
/* 1E144 8002D944 00004292 */  lbu        $v0, 0x0($s2)
/* 1E148 8002D948 F0B99427 */  addiu      $s4, $gp, %gp_rel(fontTracker + 0x604)
/* 1E14C 8002D94C 48004010 */  beqz       $v0, .L8002DA70
/* 1E150 8002D950 0A001524 */   addiu     $s5, $zero, 0xA
/* 1E154 8002D954 08001E3C */  lui        $fp, (0x80000 >> 16)
/* 1E158 8002D958 08001724 */  addiu      $s7, $zero, 0x8
/* 1E15C 8002D95C 20001624 */  addiu      $s6, $zero, 0x20
/* 1E160 8002D960 FF004330 */  andi       $v1, $v0, 0xFF
.L8002D964:
/* 1E164 8002D964 06007514 */  bne        $v1, $s5, .L8002D980
/* 1E168 8002D968 40000224 */   addiu     $v0, $zero, 0x40
/* 1E16C 8002D96C 0000828E */  lw         $v0, 0x0($s4)
/* 1E170 8002D970 000063AE */  sw         $v1, 0x0($s3)
/* 1E174 8002D974 0C004224 */  addiu      $v0, $v0, 0xC
/* 1E178 8002D978 97B60008 */  j          .L8002DA5C
/* 1E17C 8002D97C 000082AE */   sw        $v0, 0x0($s4)
.L8002D980:
/* 1E180 8002D980 0F006214 */  bne        $v1, $v0, .L8002D9C0
/* 1E184 8002D984 21204000 */   addu      $a0, $v0, $zero
/* 1E188 8002D988 01005192 */  lbu        $s1, 0x1($s2)
/* 1E18C 8002D98C 02005092 */  lbu        $s0, 0x2($s2)
/* 1E190 8002D990 02005226 */  addiu      $s2, $s2, 0x2
/* 1E194 8002D994 0000658E */  lw         $a1, 0x0($s3)
/* 1E198 8002D998 0000868E */  lw         $a2, 0x0($s4)
/* 1E19C 8002D99C C0FF3126 */  addiu      $s1, $s1, -0x40
/* 1E1A0 8002D9A0 A8B5000C */  jal        FONT_AddCharToBuffer
/* 1E1A4 8002D9A4 C0FF1026 */   addiu     $s0, $s0, -0x40
/* 1E1A8 8002D9A8 40000424 */  addiu      $a0, $zero, 0x40
/* 1E1AC 8002D9AC FF000532 */  andi       $a1, $s0, 0xFF
/* 1E1B0 8002D9B0 A8B5000C */  jal        FONT_AddCharToBuffer
/* 1E1B4 8002D9B4 FF002632 */   andi      $a2, $s1, 0xFF
/* 1E1B8 8002D9B8 98B60008 */  j          .L8002DA60
/* 1E1BC 8002D9BC 01005226 */   addiu     $s2, $s2, 0x1
.L8002D9C0:
/* 1E1C0 8002D9C0 24000224 */  addiu      $v0, $zero, 0x24
/* 1E1C4 8002D9C4 05006214 */  bne        $v1, $v0, .L8002D9DC
/* 1E1C8 8002D9C8 0D000224 */   addiu     $v0, $zero, 0xD
/* 1E1CC 8002D9CC 10000224 */  addiu      $v0, $zero, 0x10
/* 1E1D0 8002D9D0 000075AE */  sw         $s5, 0x0($s3)
/* 1E1D4 8002D9D4 97B60008 */  j          .L8002DA5C
/* 1E1D8 8002D9D8 000082AE */   sw        $v0, 0x0($s4)
.L8002D9DC:
/* 1E1DC 8002D9DC 03006214 */  bne        $v1, $v0, .L8002D9EC
/* 1E1E0 8002D9E0 09000224 */   addiu     $v0, $zero, 0x9
/* 1E1E4 8002D9E4 97B60008 */  j          .L8002DA5C
/* 1E1E8 8002D9E8 000075AE */   sw        $s5, 0x0($s3)
.L8002D9EC:
/* 1E1EC 8002D9EC 06006214 */  bne        $v1, $v0, .L8002DA08
/* 1E1F0 8002D9F0 20000224 */   addiu     $v0, $zero, 0x20
/* 1E1F4 8002D9F4 0000628E */  lw         $v0, 0x0($s3)
/* 1E1F8 8002D9F8 00000000 */  nop
/* 1E1FC 8002D9FC 21105600 */  addu       $v0, $v0, $s6
/* 1E200 8002DA00 97B60008 */  j          .L8002DA5C
/* 1E204 8002DA04 000062AE */   sw        $v0, 0x0($s3)
.L8002DA08:
/* 1E208 8002DA08 03006210 */  beq        $v1, $v0, .L8002DA18
/* 1E20C 8002DA0C 5F000224 */   addiu     $v0, $zero, 0x5F
/* 1E210 8002DA10 06006214 */  bne        $v1, $v0, .L8002DA2C
/* 1E214 8002DA14 00000000 */   nop
.L8002DA18:
/* 1E218 8002DA18 0000628E */  lw         $v0, 0x0($s3)
/* 1E21C 8002DA1C 00000000 */  nop
/* 1E220 8002DA20 21105700 */  addu       $v0, $v0, $s7
/* 1E224 8002DA24 97B60008 */  j          .L8002DA5C
/* 1E228 8002DA28 000062AE */   sw        $v0, 0x0($s3)
.L8002DA2C:
/* 1E22C 8002DA2C 00004492 */  lbu        $a0, 0x0($s2)
/* 1E230 8002DA30 0000658E */  lw         $a1, 0x0($s3)
/* 1E234 8002DA34 0000868E */  lw         $a2, 0x0($s4)
/* 1E238 8002DA38 A8B5000C */  jal        FONT_AddCharToBuffer
/* 1E23C 8002DA3C 00000000 */   nop
/* 1E240 8002DA40 00004492 */  lbu        $a0, 0x0($s2)
/* 1E244 8002DA44 57B5000C */  jal        FONT_CharSpacing
/* 1E248 8002DA48 032C1E00 */   sra       $a1, $fp, 16
/* 1E24C 8002DA4C 0000638E */  lw         $v1, 0x0($s3)
/* 1E250 8002DA50 00000000 */  nop
/* 1E254 8002DA54 21186200 */  addu       $v1, $v1, $v0
/* 1E258 8002DA58 000063AE */  sw         $v1, 0x0($s3)
.L8002DA5C:
/* 1E25C 8002DA5C 01005226 */  addiu      $s2, $s2, 0x1
.L8002DA60:
/* 1E260 8002DA60 00004292 */  lbu        $v0, 0x0($s2)
/* 1E264 8002DA64 00000000 */  nop
/* 1E268 8002DA68 BEFF4014 */  bnez       $v0, .L8002D964
/* 1E26C 8002DA6C FF004330 */   andi      $v1, $v0, 0xFF
.L8002DA70:
/* 1E270 8002DA70 3400BF8F */  lw         $ra, 0x34($sp)
/* 1E274 8002DA74 3000BE8F */  lw         $fp, 0x30($sp)
/* 1E278 8002DA78 2C00B78F */  lw         $s7, 0x2C($sp)
/* 1E27C 8002DA7C 2800B68F */  lw         $s6, 0x28($sp)
/* 1E280 8002DA80 2400B58F */  lw         $s5, 0x24($sp)
/* 1E284 8002DA84 2000B48F */  lw         $s4, 0x20($sp)
/* 1E288 8002DA88 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1E28C 8002DA8C 1800B28F */  lw         $s2, 0x18($sp)
/* 1E290 8002DA90 1400B18F */  lw         $s1, 0x14($sp)
/* 1E294 8002DA94 1000B08F */  lw         $s0, 0x10($sp)
/* 1E298 8002DA98 0800E003 */  jr         $ra
/* 1E29C 8002DA9C 3800BD27 */   addiu     $sp, $sp, 0x38
.size FONT_VaReallyPrint, . - FONT_VaReallyPrint
