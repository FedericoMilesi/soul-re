.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawModel
/* 3E960 8004E160 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3E964 8004E164 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 3E968 8004E168 4800B2AF */  sw         $s2, 0x48($sp)
/* 3E96C 8004E16C 7800B28F */  lw         $s2, 0x78($sp)
/* 3E970 8004E170 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 3E974 8004E174 7C00B38F */  lw         $s3, 0x7C($sp)
/* 3E978 8004E178 5400B5AF */  sw         $s5, 0x54($sp)
/* 3E97C 8004E17C 9CBF958F */  lw         $s5, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 3E980 8004E180 5800B6AF */  sw         $s6, 0x58($sp)
/* 3E984 8004E184 21B08000 */  addu       $s6, $a0, $zero
/* 3E988 8004E188 5C00B7AF */  sw         $s7, 0x5C($sp)
/* 3E98C 8004E18C 21B8A000 */  addu       $s7, $a1, $zero
/* 3E990 8004E190 4000B0AF */  sw         $s0, 0x40($sp)
/* 3E994 8004E194 2180C000 */  addu       $s0, $a2, $zero
/* 3E998 8004E198 4400B1AF */  sw         $s1, 0x44($sp)
/* 3E99C 8004E19C 6000BFAF */  sw         $ra, 0x60($sp)
/* 3E9A0 8004E1A0 5000B4AF */  sw         $s4, 0x50($sp)
/* 3E9A4 8004E1A4 0400548C */  lw         $s4, 0x4($v0)
/* 3E9A8 8004E1A8 CDFD020C */  jal        PushMatrix
/* 3E9AC 8004E1AC 2188E000 */   addu      $s1, $a3, $zero
/* 3E9B0 8004E1B0 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 3E9B4 8004E1B4 1000A427 */   addiu     $a0, $sp, 0x10
/* 3E9B8 8004E1B8 00000486 */  lh         $a0, 0x0($s0)
/* 3E9BC 8004E1BC 98E3010C */  jal        RotMatrixX
/* 3E9C0 8004E1C0 1000A527 */   addiu     $a1, $sp, 0x10
/* 3E9C4 8004E1C4 02000486 */  lh         $a0, 0x2($s0)
/* 3E9C8 8004E1C8 E5E3010C */  jal        RotMatrixY
/* 3E9CC 8004E1CC 1000A527 */   addiu     $a1, $sp, 0x10
/* 3E9D0 8004E1D0 04000486 */  lh         $a0, 0x4($s0)
/* 3E9D4 8004E1D4 32E4010C */  jal        RotMatrixZ
/* 3E9D8 8004E1D8 1000A527 */   addiu     $a1, $sp, 0x10
/* 3E9DC 8004E1DC F4E9000C */  jal        PIPE3D_AspectAdjustMatrix
/* 3E9E0 8004E1E0 1000A427 */   addiu     $a0, $sp, 0x10
/* 3E9E4 8004E1E4 1000A427 */  addiu      $a0, $sp, 0x10
/* 3E9E8 8004E1E8 21284002 */  addu       $a1, $s2, $zero
/* 3E9EC 8004E1EC 0EF3020C */  jal        ApplyMatrixSV
/* 3E9F0 8004E1F0 3000A627 */   addiu     $a2, $sp, 0x30
/* 3E9F4 8004E1F4 00002286 */  lh         $v0, 0x0($s1)
/* 3E9F8 8004E1F8 3000A387 */  lh         $v1, 0x30($sp)
/* 3E9FC 8004E1FC 00000000 */  nop
/* 3EA00 8004E200 21104300 */  addu       $v0, $v0, $v1
/* 3EA04 8004E204 2400A2AF */  sw         $v0, 0x24($sp)
/* 3EA08 8004E208 02002286 */  lh         $v0, 0x2($s1)
/* 3EA0C 8004E20C 3200A387 */  lh         $v1, 0x32($sp)
/* 3EA10 8004E210 00000000 */  nop
/* 3EA14 8004E214 21104300 */  addu       $v0, $v0, $v1
/* 3EA18 8004E218 2800A2AF */  sw         $v0, 0x28($sp)
/* 3EA1C 8004E21C 04002286 */  lh         $v0, 0x4($s1)
/* 3EA20 8004E220 3400A387 */  lh         $v1, 0x34($sp)
/* 3EA24 8004E224 1000A427 */  addiu      $a0, $sp, 0x10
/* 3EA28 8004E228 21104300 */  addu       $v0, $v0, $v1
/* 3EA2C 8004E22C 52F2020C */  jal        SetRotMatrix
/* 3EA30 8004E230 2C00A2AF */   sw        $v0, 0x2C($sp)
/* 3EA34 8004E234 4AF2020C */  jal        SetTransMatrix
/* 3EA38 8004E238 1000A427 */   addiu     $a0, $sp, 0x10
/* 3EA3C 8004E23C 8034093C */  lui        $t1, (0x34808080 >> 16)
/* 3EA40 8004E240 03006012 */  beqz       $s3, .L8004E250
/* 3EA44 8004E244 80802935 */   ori       $t1, $t1, (0x34808080 & 0xFFFF)
/* 3EA48 8004E248 9036093C */  lui        $t1, (0x36909090 >> 16)
/* 3EA4C 8004E24C 90902935 */  ori        $t1, $t1, (0x36909090 & 0xFFFF)
.L8004E250:
/* 3EA50 8004E250 5100C012 */  beqz       $s6, .L8004E398
/* 3EA54 8004E254 80101700 */   sll       $v0, $s7, 2
/* 3EA58 8004E258 0C00C38E */  lw         $v1, 0xC($s6)
/* 3EA5C 8004E25C 00000000 */  nop
/* 3EA60 8004E260 21104300 */  addu       $v0, $v0, $v1
/* 3EA64 8004E264 0000428C */  lw         $v0, 0x0($v0)
/* 3EA68 8004E268 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 3EA6C 8004E26C 1000478C */  lw         $a3, 0x10($v0)
/* 3EA70 8004E270 1400488C */  lw         $t0, 0x14($v0)
/* 3EA74 8004E274 04004B8C */  lw         $t3, 0x4($v0)
/* 3EA78 8004E278 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 3EA7C 8004E27C 4600E310 */  beq        $a3, $v1, .L8004E398
/* 3EA80 8004E280 FF000C3C */   lui       $t4, (0xFFFFFF >> 16)
/* 3EA84 8004E284 FFFF8C35 */  ori        $t4, $t4, (0xFFFFFF & 0xFFFF)
/* 3EA88 8004E288 04000625 */  addiu      $a2, $t0, 0x4
.L8004E28C:
/* 3EA8C 8004E28C 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3EA90 8004E290 00000000 */  nop
/* 3EA94 8004E294 0800628C */  lw         $v0, 0x8($v1)
/* 3EA98 8004E298 28008A26 */  addiu      $t2, $s4, 0x28
/* 3EA9C 8004E29C 2B104201 */  sltu       $v0, $t2, $v0
/* 3EAA0 8004E2A0 03004014 */  bnez       $v0, .L8004E2B0
/* 3EAA4 8004E2A4 00000000 */   nop
/* 3EAA8 8004E2A8 E9380108 */  j          .L8004E3A4
/* 3EAAC 8004E2AC 040074AC */   sw        $s4, 0x4($v1)
.L8004E2B0:
/* 3EAB0 8004E2B0 00000495 */  lhu        $a0, 0x0($t0)
/* 3EAB4 8004E2B4 FEFFC394 */  lhu        $v1, -0x2($a2)
/* 3EAB8 8004E2B8 0000C294 */  lhu        $v0, 0x0($a2)
/* 3EABC 8004E2BC 0400C58C */  lw         $a1, 0x4($a2)
/* 3EAC0 8004E2C0 C0200400 */  sll        $a0, $a0, 3
/* 3EAC4 8004E2C4 21206401 */  addu       $a0, $t3, $a0
/* 3EAC8 8004E2C8 C0180300 */  sll        $v1, $v1, 3
/* 3EACC 8004E2CC 21186301 */  addu       $v1, $t3, $v1
/* 3EAD0 8004E2D0 C0100200 */  sll        $v0, $v0, 3
/* 3EAD4 8004E2D4 21106201 */  addu       $v0, $t3, $v0
/* 3EAD8 8004E2D8 000080C8 */  lwc2       $0, 0x0($a0)
/* 3EADC 8004E2DC 040081C8 */  lwc2       $1, 0x4($a0)
/* 3EAE0 8004E2E0 000062C8 */  lwc2       $2, 0x0($v1)
/* 3EAE4 8004E2E4 040063C8 */  lwc2       $3, 0x4($v1)
/* 3EAE8 8004E2E8 000044C8 */  lwc2       $4, 0x0($v0)
/* 3EAEC 8004E2EC 040045C8 */  lwc2       $5, 0x4($v0)
/* 3EAF0 8004E2F0 00000000 */  nop
/* 3EAF4 8004E2F4 00000000 */  nop
/* 3EAF8 8004E2F8 3000284A */  RTPT
/* 3EAFC 8004E2FC 0000A28C */  lw         $v0, 0x0($a1)
/* 3EB00 8004E300 00000000 */  nop
/* 3EB04 8004E304 0C0082AE */  sw         $v0, 0xC($s4)
/* 3EB08 8004E308 0400A28C */  lw         $v0, 0x4($a1)
/* 3EB0C 8004E30C 00000000 */  nop
/* 3EB10 8004E310 180082AE */  sw         $v0, 0x18($s4)
/* 3EB14 8004E314 0800A28C */  lw         $v0, 0x8($a1)
/* 3EB18 8004E318 00000000 */  nop
/* 3EB1C 8004E31C 240082AE */  sw         $v0, 0x24($s4)
/* 3EB20 8004E320 00000000 */  nop
/* 3EB24 8004E324 00000000 */  nop
/* 3EB28 8004E328 0600404B */  NCLIP
/* 3EB2C 8004E32C 3800A227 */  addiu      $v0, $sp, 0x38
/* 3EB30 8004E330 1C0089AE */  sw         $t1, 0x1C($s4)
/* 3EB34 8004E334 100089AE */  sw         $t1, 0x10($s4)
/* 3EB38 8004E338 040089AE */  sw         $t1, 0x4($s4)
/* 3EB3C 8004E33C 000058E8 */  swc2       $24, 0x0($v0)
/* 3EB40 8004E340 3800A28F */  lw         $v0, 0x38($sp)
/* 3EB44 8004E344 00000000 */  nop
/* 3EB48 8004E348 0E004104 */  bgez       $v0, .L8004E384
/* 3EB4C 8004E34C 08008426 */   addiu     $a0, $s4, 0x8
/* 3EB50 8004E350 14008326 */  addiu      $v1, $s4, 0x14
/* 3EB54 8004E354 20008226 */  addiu      $v0, $s4, 0x20
/* 3EB58 8004E358 00008CE8 */  swc2       $12, 0x0($a0)
/* 3EB5C 8004E35C 00006DE8 */  swc2       $13, 0x0($v1)
/* 3EB60 8004E360 00004EE8 */  swc2       $14, 0x0($v0)
/* 3EB64 8004E364 0400A28E */  lw         $v0, 0x4($s5)
/* 3EB68 8004E368 0009033C */  lui        $v1, (0x9000000 >> 16)
/* 3EB6C 8004E36C 24104C00 */  and        $v0, $v0, $t4
/* 3EB70 8004E370 25104300 */  or         $v0, $v0, $v1
/* 3EB74 8004E374 000082AE */  sw         $v0, 0x0($s4)
/* 3EB78 8004E378 24108C02 */  and        $v0, $s4, $t4
/* 3EB7C 8004E37C 21A04001 */  addu       $s4, $t2, $zero
/* 3EB80 8004E380 0400A2AE */  sw         $v0, 0x4($s5)
.L8004E384:
/* 3EB84 8004E384 0C00C624 */  addiu      $a2, $a2, 0xC
/* 3EB88 8004E388 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 3EB8C 8004E38C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3EB90 8004E390 BEFFE214 */  bne        $a3, $v0, .L8004E28C
/* 3EB94 8004E394 0C000825 */   addiu     $t0, $t0, 0xC
.L8004E398:
/* 3EB98 8004E398 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3EB9C 8004E39C 00000000 */  nop
/* 3EBA0 8004E3A0 040054AC */  sw         $s4, 0x4($v0)
.L8004E3A4:
/* 3EBA4 8004E3A4 F6FD020C */  jal        PopMatrix
/* 3EBA8 8004E3A8 00000000 */   nop
/* 3EBAC 8004E3AC 6000BF8F */  lw         $ra, 0x60($sp)
/* 3EBB0 8004E3B0 5C00B78F */  lw         $s7, 0x5C($sp)
/* 3EBB4 8004E3B4 5800B68F */  lw         $s6, 0x58($sp)
/* 3EBB8 8004E3B8 5400B58F */  lw         $s5, 0x54($sp)
/* 3EBBC 8004E3BC 5000B48F */  lw         $s4, 0x50($sp)
/* 3EBC0 8004E3C0 4C00B38F */  lw         $s3, 0x4C($sp)
/* 3EBC4 8004E3C4 4800B28F */  lw         $s2, 0x48($sp)
/* 3EBC8 8004E3C8 4400B18F */  lw         $s1, 0x44($sp)
/* 3EBCC 8004E3CC 4000B08F */  lw         $s0, 0x40($sp)
/* 3EBD0 8004E3D0 0800E003 */  jr         $ra
/* 3EBD4 8004E3D4 6800BD27 */   addiu     $sp, $sp, 0x68
.size FX_DrawModel, . - FX_DrawModel
