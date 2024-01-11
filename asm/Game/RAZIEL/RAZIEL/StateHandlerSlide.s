.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerSlide
/* 9CA1C 800AC21C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9CA20 800AC220 1800B0AF */  sw         $s0, 0x18($sp)
/* 9CA24 800AC224 21808000 */  addu       $s0, $a0, $zero
/* 9CA28 800AC228 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9CA2C 800AC22C 2188A000 */  addu       $s1, $a1, $zero
/* 9CA30 800AC230 2400B3AF */  sw         $s3, 0x24($sp)
/* 9CA34 800AC234 2198C000 */  addu       $s3, $a2, $zero
/* 9CA38 800AC238 C0101100 */  sll        $v0, $s1, 3
/* 9CA3C 800AC23C 21105100 */  addu       $v0, $v0, $s1
/* 9CA40 800AC240 C0100200 */  sll        $v0, $v0, 3
/* 9CA44 800AC244 23105100 */  subu       $v0, $v0, $s1
/* 9CA48 800AC248 80100200 */  sll        $v0, $v0, 2
/* 9CA4C 800AC24C 08004224 */  addiu      $v0, $v0, 0x8
/* 9CA50 800AC250 2000B2AF */  sw         $s2, 0x20($sp)
/* 9CA54 800AC254 21900202 */  addu       $s2, $s0, $v0
/* 9CA58 800AC258 2800BFAF */  sw         $ra, 0x28($sp)
.L800AC25C:
/* 9CA5C 800AC25C 39C3010C */  jal        PeekMessageQueue
/* 9CA60 800AC260 04004426 */   addiu     $a0, $s2, 0x4
/* 9CA64 800AC264 5E004010 */  beqz       $v0, .L800AC3E0
/* 9CA68 800AC268 00000000 */   nop
/* 9CA6C 800AC26C 0000438C */  lw         $v1, 0x0($v0)
/* 9CA70 800AC270 1000023C */  lui        $v0, (0x100000 >> 16)
/* 9CA74 800AC274 47006210 */  beq        $v1, $v0, .L800AC394
/* 9CA78 800AC278 2A104300 */   slt       $v0, $v0, $v1
/* 9CA7C 800AC27C 12004014 */  bnez       $v0, .L800AC2C8
/* 9CA80 800AC280 0104023C */   lui       $v0, (0x4010008 >> 16)
/* 9CA84 800AC284 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 9CA88 800AC288 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9CA8C 800AC28C 50006210 */  beq        $v1, $v0, .L800AC3D0
/* 9CA90 800AC290 2A104300 */   slt       $v0, $v0, $v1
/* 9CA94 800AC294 07004014 */  bnez       $v0, .L800AC2B4
/* 9CA98 800AC298 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 9CA9C 800AC29C 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 9CAA0 800AC2A0 2A104300 */  slt        $v0, $v0, $v1
/* 9CAA4 800AC2A4 47004014 */  bnez       $v0, .L800AC3C4
/* 9CAA8 800AC2A8 21200002 */   addu      $a0, $s0, $zero
/* 9CAAC 800AC2AC F4B00208 */  j          .L800AC3D0
/* 9CAB0 800AC2B0 00000000 */   nop
.L800AC2B4:
/* 9CAB4 800AC2B4 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9CAB8 800AC2B8 45006210 */  beq        $v1, $v0, .L800AC3D0
/* 9CABC 800AC2BC 21200002 */   addu      $a0, $s0, $zero
/* 9CAC0 800AC2C0 F2B00208 */  j          .L800AC3C8
/* 9CAC4 800AC2C4 21282002 */   addu      $a1, $s1, $zero
.L800AC2C8:
/* 9CAC8 800AC2C8 08004234 */  ori        $v0, $v0, (0x4010008 & 0xFFFF)
/* 9CACC 800AC2CC 31006210 */  beq        $v1, $v0, .L800AC394
/* 9CAD0 800AC2D0 2A104300 */   slt       $v0, $v0, $v1
/* 9CAD4 800AC2D4 0A004014 */  bnez       $v0, .L800AC300
/* 9CAD8 800AC2D8 0104023C */   lui       $v0, (0x4010200 >> 16)
/* 9CADC 800AC2DC 1000023C */  lui        $v0, (0x100001 >> 16)
/* 9CAE0 800AC2E0 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9CAE4 800AC2E4 0E006210 */  beq        $v1, $v0, .L800AC320
/* 9CAE8 800AC2E8 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9CAEC 800AC2EC 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9CAF0 800AC2F0 1F006210 */  beq        $v1, $v0, .L800AC370
/* 9CAF4 800AC2F4 21200002 */   addu      $a0, $s0, $zero
/* 9CAF8 800AC2F8 F2B00208 */  j          .L800AC3C8
/* 9CAFC 800AC2FC 21282002 */   addu      $a1, $s1, $zero
.L800AC300:
/* 9CB00 800AC300 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* 9CB04 800AC304 32006210 */  beq        $v1, $v0, .L800AC3D0
/* 9CB08 800AC308 0020023C */   lui       $v0, (0x20000001 >> 16)
/* 9CB0C 800AC30C 01004234 */  ori        $v0, $v0, (0x20000001 & 0xFFFF)
/* 9CB10 800AC310 2F006210 */  beq        $v1, $v0, .L800AC3D0
/* 9CB14 800AC314 21200002 */   addu      $a0, $s0, $zero
/* 9CB18 800AC318 F2B00208 */  j          .L800AC3C8
/* 9CB1C 800AC31C 21282002 */   addu      $a1, $s1, $zero
.L800AC320:
/* 9CB20 800AC320 2B002016 */  bnez       $s1, .L800AC3D0
/* 9CB24 800AC324 4000023C */   lui       $v0, (0x400000 >> 16)
/* 9CB28 800AC328 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9CB2C 800AC32C 0000048E */  lw         $a0, 0x0($s0)
/* 9CB30 800AC330 09050224 */  addiu      $v0, $zero, 0x509
/* 9CB34 800AC334 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9CB38 800AC338 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 9CB3C 800AC33C 6B68020C */  jal        ResetPhysics
/* 9CB40 800AC340 F0FF0524 */   addiu     $a1, $zero, -0x10
/* 9CB44 800AC344 1E000524 */  addiu      $a1, $zero, 0x1E
/* 9CB48 800AC348 21300000 */  addu       $a2, $zero, $zero
/* 9CB4C 800AC34C 3C000724 */  addiu      $a3, $zero, 0x3C
/* 9CB50 800AC350 0000048E */  lw         $a0, 0x0($s0)
/* 9CB54 800AC354 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* 9CB58 800AC358 1000A2AF */  sw         $v0, 0x10($sp)
/* 9CB5C 800AC35C 1300010C */  jal        SOUND_Play3dSound
/* 9CB60 800AC360 5C008424 */   addiu     $a0, $a0, 0x5C
/* 9CB64 800AC364 94FB82AF */  sw         $v0, %gp_rel(Raziel + 0x564)($gp)
/* 9CB68 800AC368 F4B00208 */  j          .L800AC3D0
/* 9CB6C 800AC36C 00000000 */   nop
.L800AC370:
/* 9CB70 800AC370 94FB848F */  lw         $a0, %gp_rel(Raziel + 0x564)($gp)
/* 9CB74 800AC374 00000000 */  nop
/* 9CB78 800AC378 15008010 */  beqz       $a0, .L800AC3D0
/* 9CB7C 800AC37C 00000000 */   nop
/* 9CB80 800AC380 1C02010C */  jal        SndEndLoop
/* 9CB84 800AC384 00000000 */   nop
/* 9CB88 800AC388 94FB80AF */  sw         $zero, %gp_rel(Raziel + 0x564)($gp)
/* 9CB8C 800AC38C F4B00208 */  j          .L800AC3D0
/* 9CB90 800AC390 00000000 */   nop
.L800AC394:
/* 9CB94 800AC394 21200000 */  addu       $a0, $zero, $zero
/* 9CB98 800AC398 21288000 */  addu       $a1, $a0, $zero
/* 9CB9C 800AC39C 4FC6010C */  jal        SetControlInitIdleData
/* 9CBA0 800AC3A0 03000624 */   addiu     $a2, $zero, 0x3
/* 9CBA4 800AC3A4 21200002 */  addu       $a0, $s0, $zero
/* 9CBA8 800AC3A8 21282002 */  addu       $a1, $s1, $zero
/* 9CBAC 800AC3AC 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9CBB0 800AC3B0 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9CBB4 800AC3B4 C1CA010C */  jal        StateSwitchStateData
/* 9CBB8 800AC3B8 21384000 */   addu      $a3, $v0, $zero
/* 9CBBC 800AC3BC F4B00208 */  j          .L800AC3D0
/* 9CBC0 800AC3C0 00000000 */   nop
.L800AC3C4:
/* 9CBC4 800AC3C4 21282002 */  addu       $a1, $s1, $zero
.L800AC3C8:
/* 9CBC8 800AC3C8 B9BF020C */  jal        DefaultStateHandler
/* 9CBCC 800AC3CC 21306002 */   addu      $a2, $s3, $zero
.L800AC3D0:
/* 9CBD0 800AC3D0 27C3010C */  jal        DeMessageQueue
/* 9CBD4 800AC3D4 04004426 */   addiu     $a0, $s2, 0x4
/* 9CBD8 800AC3D8 97B00208 */  j          .L800AC25C
/* 9CBDC 800AC3DC 00000000 */   nop
.L800AC3E0:
/* 9CBE0 800AC3E0 2800BF8F */  lw         $ra, 0x28($sp)
/* 9CBE4 800AC3E4 2400B38F */  lw         $s3, 0x24($sp)
/* 9CBE8 800AC3E8 2000B28F */  lw         $s2, 0x20($sp)
/* 9CBEC 800AC3EC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9CBF0 800AC3F0 1800B08F */  lw         $s0, 0x18($sp)
/* 9CBF4 800AC3F4 0800E003 */  jr         $ra
/* 9CBF8 800AC3F8 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerSlide, . - StateHandlerSlide
