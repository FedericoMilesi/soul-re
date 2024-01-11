.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_DoGarbageCollection
/* 41160 80050960 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 41164 80050964 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 41168 80050968 21A80000 */  addu       $s5, $zero, $zero
/* 4116C 8005096C 3000B6AF */  sw         $s6, 0x30($sp)
/* 41170 80050970 01001624 */  addiu      $s6, $zero, 0x1
/* 41174 80050974 2800B4AF */  sw         $s4, 0x28($sp)
/* 41178 80050978 02001424 */  addiu      $s4, $zero, 0x2
/* 4117C 8005097C 2110C002 */  addu       $v0, $s6, $zero
/* 41180 80050980 3400BFAF */  sw         $ra, 0x34($sp)
/* 41184 80050984 2400B3AF */  sw         $s3, 0x24($sp)
/* 41188 80050988 2000B2AF */  sw         $s2, 0x20($sp)
/* 4118C 8005098C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 41190 80050990 1800B0AF */  sw         $s0, 0x18($sp)
/* 41194 80050994 1400A0AF */  sw         $zero, 0x14($sp)
/* 41198 80050998 00C782AF */  sw         $v0, %gp_rel(newMemTracker + 0x10)($gp)
.L8005099C:
/* 4119C 8005099C F0C6908F */  lw         $s0, %gp_rel(newMemTracker)($gp)
/* 411A0 800509A0 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 411A4 800509A4 00000000 */  nop
/* 411A8 800509A8 18000212 */  beq        $s0, $v0, .L80050A0C
/* 411AC 800509AC 21880000 */   addu      $s1, $zero, $zero
.L800509B0:
/* 411B0 800509B0 02000292 */  lbu        $v0, 0x2($s0)
/* 411B4 800509B4 00000000 */  nop
/* 411B8 800509B8 0E004010 */  beqz       $v0, .L800509F4
/* 411BC 800509BC 00000000 */   nop
/* 411C0 800509C0 03000492 */  lbu        $a0, 0x3($s0)
/* 411C4 800509C4 7340010C */  jal        MEMPACK_RelocatableType
/* 411C8 800509C8 00000000 */   nop
/* 411CC 800509CC 0A004010 */  beqz       $v0, .L800509F8
/* 411D0 800509D0 00000000 */   nop
/* 411D4 800509D4 08003616 */  bne        $s1, $s6, .L800509F8
/* 411D8 800509D8 00000000 */   nop
/* 411DC 800509DC 02000292 */  lbu        $v0, 0x2($s0)
/* 411E0 800509E0 00000000 */  nop
/* 411E4 800509E4 04005410 */  beq        $v0, $s4, .L800509F8
/* 411E8 800509E8 00000000 */   nop
/* 411EC 800509EC 83420108 */  j          .L80050A0C
/* 411F0 800509F0 02001124 */   addiu     $s1, $zero, 0x2
.L800509F4:
/* 411F4 800509F4 01001124 */  addiu      $s1, $zero, 0x1
.L800509F8:
/* 411F8 800509F8 0400028E */  lw         $v0, 0x4($s0)
/* 411FC 800509FC FCC6838F */  lw         $v1, %gp_rel(newMemTracker + 0xC)($gp)
/* 41200 80050A00 21800202 */  addu       $s0, $s0, $v0
/* 41204 80050A04 EAFF0316 */  bne        $s0, $v1, .L800509B0
/* 41208 80050A08 00000000 */   nop
.L80050A0C:
/* 4120C 80050A0C 4C003416 */  bne        $s1, $s4, .L80050B40
/* 41210 80050A10 21200002 */   addu      $a0, $s0, $zero
/* 41214 80050A14 0400028E */  lw         $v0, 0x4($s0)
/* 41218 80050A18 03001292 */  lbu        $s2, 0x3($s0)
/* 4121C 80050A1C 2C42010C */  jal        MEMPACK_GarbageCollectFree
/* 41220 80050A20 F8FF5324 */   addiu     $s3, $v0, -0x8
/* 41224 80050A24 1000A427 */  addiu      $a0, $sp, 0x10
/* 41228 80050A28 21284002 */  addu       $a1, $s2, $zero
/* 4122C 80050A2C 1400A627 */  addiu      $a2, $sp, 0x14
/* 41230 80050A30 C541010C */  jal        MEMPACK_GarbageCollectMalloc
/* 41234 80050A34 1000B3AF */   sw        $s3, 0x10($sp)
/* 41238 80050A38 21884000 */  addu       $s1, $v0, $zero
/* 4123C 80050A3C 41002012 */  beqz       $s1, .L80050B44
/* 41240 80050A40 08001026 */   addiu     $s0, $s0, 0x8
/* 41244 80050A44 05005416 */  bne        $s2, $s4, .L80050A5C
/* 41248 80050A48 04000224 */   addiu     $v0, $zero, 0x4
/* 4124C 80050A4C 306B010C */  jal        RemoveIntroducedLights
/* 41250 80050A50 21200002 */   addu      $a0, $s0, $zero
/* 41254 80050A54 9C420108 */  j          .L80050A70
/* 41258 80050A58 21202002 */   addu      $a0, $s1, $zero
.L80050A5C:
/* 4125C 80050A5C 04004216 */  bne        $s2, $v0, .L80050A70
/* 41260 80050A60 21202002 */   addu      $a0, $s1, $zero
/* 41264 80050A64 234B010C */  jal        aadRelocateMusicMemoryBegin
/* 41268 80050A68 00000000 */   nop
/* 4126C 80050A6C 21202002 */  addu       $a0, $s1, $zero
.L80050A70:
/* 41270 80050A70 21280002 */  addu       $a1, $s0, $zero
/* 41274 80050A74 02E5010C */  jal        memcpy
/* 41278 80050A78 21306002 */   addu      $a2, $s3, $zero
/* 4127C 80050A7C 06005416 */  bne        $s2, $s4, .L80050A98
/* 41280 80050A80 F8FF2426 */   addiu     $a0, $s1, -0x8
/* 41284 80050A84 23283002 */  subu       $a1, $s1, $s0
/* 41288 80050A88 DE42010C */  jal        MEMPACK_RelocateAreaType
/* 4128C 80050A8C 21300002 */   addu      $a2, $s0, $zero
/* 41290 80050A90 CA420108 */  j          .L80050B28
/* 41294 80050A94 F8FF2526 */   addiu     $a1, $s1, -0x8
.L80050A98:
/* 41298 80050A98 07005616 */  bne        $s2, $s6, .L80050AB8
/* 4129C 80050A9C 0E000224 */   addiu     $v0, $zero, 0xE
/* 412A0 80050AA0 F8FF2426 */  addiu      $a0, $s1, -0x8
/* 412A4 80050AA4 23283002 */  subu       $a1, $s1, $s0
/* 412A8 80050AA8 3F45010C */  jal        MEMPACK_RelocateObjectType
/* 412AC 80050AAC 21300002 */   addu      $a2, $s0, $zero
/* 412B0 80050AB0 CA420108 */  j          .L80050B28
/* 412B4 80050AB4 F8FF2526 */   addiu     $a1, $s1, -0x8
.L80050AB8:
/* 412B8 80050AB8 06004216 */  bne        $s2, $v0, .L80050AD4
/* 412BC 80050ABC 2C000224 */   addiu     $v0, $zero, 0x2C
/* 412C0 80050AC0 21200002 */  addu       $a0, $s0, $zero
/* 412C4 80050AC4 476A010C */  jal        STREAM_UpdateInstanceCollisionInfo
/* 412C8 80050AC8 21282002 */   addu      $a1, $s1, $zero
/* 412CC 80050ACC CA420108 */  j          .L80050B28
/* 412D0 80050AD0 F8FF2526 */   addiu     $a1, $s1, -0x8
.L80050AD4:
/* 412D4 80050AD4 07004216 */  bne        $s2, $v0, .L80050AF4
/* 412D8 80050AD8 04000224 */   addiu     $v0, $zero, 0x4
/* 412DC 80050ADC F8FF2426 */  addiu      $a0, $s1, -0x8
/* 412E0 80050AE0 23283002 */  subu       $a1, $s1, $s0
/* 412E4 80050AE4 9B46010C */  jal        MEMPACK_RelocateCDMemory
/* 412E8 80050AE8 21300002 */   addu      $a2, $s0, $zero
/* 412EC 80050AEC CA420108 */  j          .L80050B28
/* 412F0 80050AF0 F8FF2526 */   addiu     $a1, $s1, -0x8
.L80050AF4:
/* 412F4 80050AF4 06004216 */  bne        $s2, $v0, .L80050B10
/* 412F8 80050AF8 2F000224 */   addiu     $v0, $zero, 0x2F
/* 412FC 80050AFC 21200002 */  addu       $a0, $s0, $zero
/* 41300 80050B00 2A4B010C */  jal        aadRelocateMusicMemoryEnd
/* 41304 80050B04 23282402 */   subu      $a1, $s1, $a0
/* 41308 80050B08 CA420108 */  j          .L80050B28
/* 4130C 80050B0C F8FF2526 */   addiu     $a1, $s1, -0x8
.L80050B10:
/* 41310 80050B10 05004216 */  bne        $s2, $v0, .L80050B28
/* 41314 80050B14 F8FF2526 */   addiu     $a1, $s1, -0x8
/* 41318 80050B18 21200002 */  addu       $a0, $s0, $zero
/* 4131C 80050B1C 954B010C */  jal        aadRelocateSfxMemory
/* 41320 80050B20 23282402 */   subu      $a1, $s1, $a0
/* 41324 80050B24 F8FF2526 */  addiu      $a1, $s1, -0x8
.L80050B28:
/* 41328 80050B28 1000A48F */  lw         $a0, 0x10($sp)
/* 4132C 80050B2C 1400A78F */  lw         $a3, 0x14($sp)
/* 41330 80050B30 2342010C */  jal        MEMPACK_GarbageSplitMemoryNow
/* 41334 80050B34 21304002 */   addu      $a2, $s2, $zero
/* 41338 80050B38 D1420108 */  j          .L80050B44
/* 4133C 80050B3C 00000000 */   nop
.L80050B40:
/* 41340 80050B40 01001524 */  addiu      $s5, $zero, 0x1
.L80050B44:
/* 41344 80050B44 95FFA012 */  beqz       $s5, .L8005099C
/* 41348 80050B48 00000000 */   nop
/* 4134C 80050B4C 3400BF8F */  lw         $ra, 0x34($sp)
/* 41350 80050B50 3000B68F */  lw         $s6, 0x30($sp)
/* 41354 80050B54 2C00B58F */  lw         $s5, 0x2C($sp)
/* 41358 80050B58 2800B48F */  lw         $s4, 0x28($sp)
/* 4135C 80050B5C 2400B38F */  lw         $s3, 0x24($sp)
/* 41360 80050B60 2000B28F */  lw         $s2, 0x20($sp)
/* 41364 80050B64 1C00B18F */  lw         $s1, 0x1C($sp)
/* 41368 80050B68 1800B08F */  lw         $s0, 0x18($sp)
/* 4136C 80050B6C 00C780AF */  sw         $zero, %gp_rel(newMemTracker + 0x10)($gp)
/* 41370 80050B70 0800E003 */  jr         $ra
/* 41374 80050B74 3800BD27 */   addiu     $sp, $sp, 0x38
.size MEMPACK_DoGarbageCollection, . - MEMPACK_DoGarbageCollection
