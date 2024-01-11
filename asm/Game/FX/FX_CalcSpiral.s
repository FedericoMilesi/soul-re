.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_CalcSpiral
/* 3E0BC 8004D8BC 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 3E0C0 8004D8C0 5C00B7AF */  sw         $s7, 0x5C($sp)
/* 3E0C4 8004D8C4 FF7F1724 */  addiu      $s7, $zero, 0x7FFF
/* 3E0C8 8004D8C8 5800B6AF */  sw         $s6, 0x58($sp)
/* 3E0CC 8004D8CC 01801624 */  addiu      $s6, $zero, -0x7FFF
/* 3E0D0 8004D8D0 2140E002 */  addu       $t0, $s7, $zero
/* 3E0D4 8004D8D4 6000BEAF */  sw         $fp, 0x60($sp)
/* 3E0D8 8004D8D8 21F0C002 */  addu       $fp, $s6, $zero
/* 3E0DC 8004D8DC 4800B2AF */  sw         $s2, 0x48($sp)
/* 3E0E0 8004D8E0 00201224 */  addiu      $s2, $zero, 0x2000
/* 3E0E4 8004D8E4 5400B5AF */  sw         $s5, 0x54($sp)
/* 3E0E8 8004D8E8 21A84002 */  addu       $s5, $s2, $zero
/* 3E0EC 8004D8EC 4400B1AF */  sw         $s1, 0x44($sp)
/* 3E0F0 8004D8F0 21880000 */  addu       $s1, $zero, $zero
/* 3E0F4 8004D8F4 5000B4AF */  sw         $s4, 0x50($sp)
/* 3E0F8 8004D8F8 21A02002 */  addu       $s4, $s1, $zero
/* 3E0FC 8004D8FC 6800A4AF */  sw         $a0, 0x68($sp)
/* 3E100 8004D900 21204002 */  addu       $a0, $s2, $zero
/* 3E104 8004D904 21282002 */  addu       $a1, $s1, $zero
/* 3E108 8004D908 2000A627 */  addiu      $a2, $sp, 0x20
/* 3E10C 8004D90C 2400A727 */  addiu      $a3, $sp, 0x24
/* 3E110 8004D910 6400BFAF */  sw         $ra, 0x64($sp)
/* 3E114 8004D914 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 3E118 8004D918 4000B0AF */  sw         $s0, 0x40($sp)
/* 3E11C 8004D91C C735010C */  jal        FX_GetSpiralPoint
/* 3E120 8004D920 3800A8AF */   sw        $t0, 0x38($sp)
/* 3E124 8004D924 2000A297 */  lhu        $v0, 0x20($sp)
/* 3E128 8004D928 2400A397 */  lhu        $v1, 0x24($sp)
/* 3E12C 8004D92C 21982002 */  addu       $s3, $s1, $zero
/* 3E130 8004D930 D0C482A7 */  sh         $v0, %gp_rel(Spiral_Array + 0x100)($gp)
/* 3E134 8004D934 D2C483A7 */  sh         $v1, %gp_rel(Spiral_Array + 0x102)($gp)
.L8004D938:
/* 3E138 8004D938 C49A8287 */  lh         $v0, %gp_rel(Spiral_Number)($gp)
/* 3E13C 8004D93C 00000000 */  nop
/* 3E140 8004D940 36004014 */  bnez       $v0, .L8004DA1C
/* 3E144 8004D944 2000A627 */   addiu     $a2, $sp, 0x20
/* 3E148 8004D948 ECC6838F */  lw         $v1, %gp_rel(Spiral_Mod)($gp)
/* 3E14C 8004D94C 00000000 */  nop
/* 3E150 8004D950 1A006302 */  div        $zero, $s3, $v1
/* 3E154 8004D954 10200000 */  mfhi       $a0
/* 3E158 8004D958 00000000 */  nop
/* 3E15C 8004D95C 0D008014 */  bnez       $a0, .L8004D994
/* 3E160 8004D960 00130400 */   sll       $v0, $a0, 12
/* 3E164 8004D964 6800A88F */  lw         $t0, 0x68($sp)
/* 3E168 8004D968 00000000 */  nop
/* 3E16C 8004D96C 18000301 */  mult       $t0, $v1
/* 3E170 8004D970 21888002 */  addu       $s1, $s4, $zero
/* 3E174 8004D974 2190A002 */  addu       $s2, $s5, $zero
/* 3E178 8004D978 00110300 */  sll        $v0, $v1, 4
/* 3E17C 8004D97C 21104300 */  addu       $v0, $v0, $v1
/* 3E180 8004D980 80110200 */  sll        $v0, $v0, 6
/* 3E184 8004D984 21A84202 */  addu       $s5, $s2, $v0
/* 3E188 8004D988 12400000 */  mflo       $t0
/* 3E18C 8004D98C 21A02802 */  addu       $s4, $s1, $t0
/* 3E190 8004D990 00130400 */  sll        $v0, $a0, 12
.L8004D994:
/* 3E194 8004D994 1A004300 */  div        $zero, $v0, $v1
/* 3E198 8004D998 12800000 */  mflo       $s0
/* 3E19C 8004D99C 21204002 */  addu       $a0, $s2, $zero
/* 3E1A0 8004D9A0 2128A002 */  addu       $a1, $s5, $zero
/* 3E1A4 8004D9A4 21302002 */  addu       $a2, $s1, $zero
/* 3E1A8 8004D9A8 21388002 */  addu       $a3, $s4, $zero
/* 3E1AC 8004D9AC 2000A227 */  addiu      $v0, $sp, 0x20
/* 3E1B0 8004D9B0 1000A2AF */  sw         $v0, 0x10($sp)
/* 3E1B4 8004D9B4 2400A227 */  addiu      $v0, $sp, 0x24
/* 3E1B8 8004D9B8 1400A2AF */  sw         $v0, 0x14($sp)
/* 3E1BC 8004D9BC FC35010C */  jal        FX_GetLinePoint
/* 3E1C0 8004D9C0 1800B0AF */   sw        $s0, 0x18($sp)
/* 3E1C4 8004D9C4 001C4426 */  addiu      $a0, $s2, 0x1C00
/* 3E1C8 8004D9C8 001CA526 */  addiu      $a1, $s5, 0x1C00
/* 3E1CC 8004D9CC 21302002 */  addu       $a2, $s1, $zero
/* 3E1D0 8004D9D0 21388002 */  addu       $a3, $s4, $zero
/* 3E1D4 8004D9D4 2800A227 */  addiu      $v0, $sp, 0x28
/* 3E1D8 8004D9D8 1000A2AF */  sw         $v0, 0x10($sp)
/* 3E1DC 8004D9DC 2C00A227 */  addiu      $v0, $sp, 0x2C
/* 3E1E0 8004D9E0 1400A2AF */  sw         $v0, 0x14($sp)
/* 3E1E4 8004D9E4 FC35010C */  jal        FX_GetLinePoint
/* 3E1E8 8004D9E8 1800B0AF */   sw        $s0, 0x18($sp)
/* 3E1EC 8004D9EC 00E44426 */  addiu      $a0, $s2, -0x1C00
/* 3E1F0 8004D9F0 00E4A526 */  addiu      $a1, $s5, -0x1C00
/* 3E1F4 8004D9F4 21302002 */  addu       $a2, $s1, $zero
/* 3E1F8 8004D9F8 21388002 */  addu       $a3, $s4, $zero
/* 3E1FC 8004D9FC 3000A227 */  addiu      $v0, $sp, 0x30
/* 3E200 8004DA00 1000A2AF */  sw         $v0, 0x10($sp)
/* 3E204 8004DA04 3400A227 */  addiu      $v0, $sp, 0x34
/* 3E208 8004DA08 1400A2AF */  sw         $v0, 0x14($sp)
/* 3E20C 8004DA0C FC35010C */  jal        FX_GetLinePoint
/* 3E210 8004DA10 1800B0AF */   sw        $s0, 0x18($sp)
/* 3E214 8004DA14 99360108 */  j          .L8004DA64
/* 3E218 8004DA18 80301300 */   sll       $a2, $s3, 2
.L8004DA1C:
/* 3E21C 8004DA1C 40045226 */  addiu      $s2, $s2, 0x440
/* 3E220 8004DA20 6800A88F */  lw         $t0, 0x68($sp)
/* 3E224 8004DA24 21204002 */  addu       $a0, $s2, $zero
/* 3E228 8004DA28 2400A727 */  addiu      $a3, $sp, 0x24
/* 3E22C 8004DA2C 21882802 */  addu       $s1, $s1, $t0
/* 3E230 8004DA30 C735010C */  jal        FX_GetSpiralPoint
/* 3E234 8004DA34 21282002 */   addu      $a1, $s1, $zero
/* 3E238 8004DA38 001C4426 */  addiu      $a0, $s2, 0x1C00
/* 3E23C 8004DA3C 21282002 */  addu       $a1, $s1, $zero
/* 3E240 8004DA40 2800A627 */  addiu      $a2, $sp, 0x28
/* 3E244 8004DA44 C735010C */  jal        FX_GetSpiralPoint
/* 3E248 8004DA48 2C00A727 */   addiu     $a3, $sp, 0x2C
/* 3E24C 8004DA4C 00E44426 */  addiu      $a0, $s2, -0x1C00
/* 3E250 8004DA50 21282002 */  addu       $a1, $s1, $zero
/* 3E254 8004DA54 3000A627 */  addiu      $a2, $sp, 0x30
/* 3E258 8004DA58 C735010C */  jal        FX_GetSpiralPoint
/* 3E25C 8004DA5C 3400A727 */   addiu     $a3, $sp, 0x34
/* 3E260 8004DA60 80301300 */  sll        $a2, $s3, 2
.L8004DA64:
/* 3E264 8004DA64 D0C38227 */  addiu      $v0, $gp, %gp_rel(Spiral_Array)
/* 3E268 8004DA68 2000A397 */  lhu        $v1, 0x20($sp)
/* 3E26C 8004DA6C 2400A497 */  lhu        $a0, 0x24($sp)
/* 3E270 8004DA70 2110C200 */  addu       $v0, $a2, $v0
/* 3E274 8004DA74 000043A4 */  sh         $v1, 0x0($v0)
/* 3E278 8004DA78 020044A4 */  sh         $a0, 0x2($v0)
/* 3E27C 8004DA7C 3F000224 */  addiu      $v0, $zero, 0x3F
/* 3E280 8004DA80 07006216 */  bne        $s3, $v0, .L8004DAA0
/* 3E284 8004DA84 00000000 */   nop
/* 3E288 8004DA88 2000A28F */  lw         $v0, 0x20($sp)
/* 3E28C 8004DA8C 2400A38F */  lw         $v1, 0x24($sp)
/* 3E290 8004DA90 2800A2AF */  sw         $v0, 0x28($sp)
/* 3E294 8004DA94 2C00A3AF */  sw         $v1, 0x2C($sp)
/* 3E298 8004DA98 3000A2AF */  sw         $v0, 0x30($sp)
/* 3E29C 8004DA9C 3400A3AF */  sw         $v1, 0x34($sp)
.L8004DAA0:
/* 3E2A0 8004DAA0 E0C48227 */  addiu      $v0, $gp, %gp_rel(Spiral_OffsetP)
/* 3E2A4 8004DAA4 2800A397 */  lhu        $v1, 0x28($sp)
/* 3E2A8 8004DAA8 2C00A497 */  lhu        $a0, 0x2C($sp)
/* 3E2AC 8004DAAC 2800A58F */  lw         $a1, 0x28($sp)
/* 3E2B0 8004DAB0 2110C200 */  addu       $v0, $a2, $v0
/* 3E2B4 8004DAB4 000043A4 */  sh         $v1, 0x0($v0)
/* 3E2B8 8004DAB8 020044A4 */  sh         $a0, 0x2($v0)
/* 3E2BC 8004DABC 2A10B700 */  slt        $v0, $a1, $s7
/* 3E2C0 8004DAC0 02004010 */  beqz       $v0, .L8004DACC
/* 3E2C4 8004DAC4 2A10C502 */   slt       $v0, $s6, $a1
/* 3E2C8 8004DAC8 21B8A000 */  addu       $s7, $a1, $zero
.L8004DACC:
/* 3E2CC 8004DACC 02004010 */  beqz       $v0, .L8004DAD8
/* 3E2D0 8004DAD0 00000000 */   nop
/* 3E2D4 8004DAD4 21B0A000 */  addu       $s6, $a1, $zero
.L8004DAD8:
/* 3E2D8 8004DAD8 2C00A38F */  lw         $v1, 0x2C($sp)
/* 3E2DC 8004DADC 3800A88F */  lw         $t0, 0x38($sp)
/* 3E2E0 8004DAE0 00000000 */  nop
/* 3E2E4 8004DAE4 2A106800 */  slt        $v0, $v1, $t0
/* 3E2E8 8004DAE8 02004010 */  beqz       $v0, .L8004DAF4
/* 3E2EC 8004DAEC 2A10C303 */   slt       $v0, $fp, $v1
/* 3E2F0 8004DAF0 3800A3AF */  sw         $v1, 0x38($sp)
.L8004DAF4:
/* 3E2F4 8004DAF4 02004010 */  beqz       $v0, .L8004DB00
/* 3E2F8 8004DAF8 00000000 */   nop
/* 3E2FC 8004DAFC 21F06000 */  addu       $fp, $v1, $zero
.L8004DB00:
/* 3E300 8004DB00 01007326 */  addiu      $s3, $s3, 0x1
/* 3E304 8004DB04 E0C58227 */  addiu      $v0, $gp, %gp_rel(Spiral_OffsetM)
/* 3E308 8004DB08 3000A397 */  lhu        $v1, 0x30($sp)
/* 3E30C 8004DB0C 3400A497 */  lhu        $a0, 0x34($sp)
/* 3E310 8004DB10 2110C200 */  addu       $v0, $a2, $v0
/* 3E314 8004DB14 000043A4 */  sh         $v1, 0x0($v0)
/* 3E318 8004DB18 020044A4 */  sh         $a0, 0x2($v0)
/* 3E31C 8004DB1C 4000622A */  slti       $v0, $s3, 0x40
/* 3E320 8004DB20 85FF4014 */  bnez       $v0, .L8004D938
/* 3E324 8004DB24 2310D702 */   subu      $v0, $s6, $s7
/* 3E328 8004DB28 C21F0200 */  srl        $v1, $v0, 31
/* 3E32C 8004DB2C 21104300 */  addu       $v0, $v0, $v1
/* 3E330 8004DB30 43100200 */  sra        $v0, $v0, 1
/* 3E334 8004DB34 80180200 */  sll        $v1, $v0, 2
/* 3E338 8004DB38 21186200 */  addu       $v1, $v1, $v0
/* 3E33C 8004DB3C 80110300 */  sll        $v0, $v1, 6
/* 3E340 8004DB40 02004104 */  bgez       $v0, .L8004DB4C
/* 3E344 8004DB44 00000000 */   nop
/* 3E348 8004DB48 FF014224 */  addiu      $v0, $v0, 0x1FF
.L8004DB4C:
/* 3E34C 8004DB4C 43120200 */  sra        $v0, $v0, 9
/* 3E350 8004DB50 02004224 */  addiu      $v0, $v0, 0x2
/* 3E354 8004DB54 E8C682AF */  sw         $v0, %gp_rel(Spiral_Glow_Size)($gp)
/* 3E358 8004DB58 2110F602 */  addu       $v0, $s7, $s6
/* 3E35C 8004DB5C C21F0200 */  srl        $v1, $v0, 31
/* 3E360 8004DB60 21104300 */  addu       $v0, $v0, $v1
/* 3E364 8004DB64 3800A88F */  lw         $t0, 0x38($sp)
/* 3E368 8004DB68 6400BF8F */  lw         $ra, 0x64($sp)
/* 3E36C 8004DB6C 5C00B78F */  lw         $s7, 0x5C($sp)
/* 3E370 8004DB70 5800B68F */  lw         $s6, 0x58($sp)
/* 3E374 8004DB74 5400B58F */  lw         $s5, 0x54($sp)
/* 3E378 8004DB78 5000B48F */  lw         $s4, 0x50($sp)
/* 3E37C 8004DB7C 4C00B38F */  lw         $s3, 0x4C($sp)
/* 3E380 8004DB80 4800B28F */  lw         $s2, 0x48($sp)
/* 3E384 8004DB84 4400B18F */  lw         $s1, 0x44($sp)
/* 3E388 8004DB88 4000B08F */  lw         $s0, 0x40($sp)
/* 3E38C 8004DB8C 43100200 */  sra        $v0, $v0, 1
/* 3E390 8004DB90 E0C682AF */  sw         $v0, %gp_rel(Spiral_Glow_X)($gp)
/* 3E394 8004DB94 21101E01 */  addu       $v0, $t0, $fp
/* 3E398 8004DB98 C21F0200 */  srl        $v1, $v0, 31
/* 3E39C 8004DB9C 21104300 */  addu       $v0, $v0, $v1
/* 3E3A0 8004DBA0 6000BE8F */  lw         $fp, 0x60($sp)
/* 3E3A4 8004DBA4 43100200 */  sra        $v0, $v0, 1
/* 3E3A8 8004DBA8 E4C682AF */  sw         $v0, %gp_rel(Spiral_Glow_Y)($gp)
/* 3E3AC 8004DBAC 0800E003 */  jr         $ra
/* 3E3B0 8004DBB0 6800BD27 */   addiu     $sp, $sp, 0x68
.size FX_CalcSpiral, . - FX_CalcSpiral
