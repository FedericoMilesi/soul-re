.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_Malloc
/* 40A04 80050204 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 40A08 80050208 2000B2AF */  sw         $s2, 0x20($sp)
/* 40A0C 8005020C 21908000 */  addu       $s2, $a0, $zero
/* 40A10 80050210 2800B4AF */  sw         $s4, 0x28($sp)
/* 40A14 80050214 21A0A000 */  addu       $s4, $a1, $zero
/* 40A18 80050218 FF008432 */  andi       $a0, $s4, 0xFF
/* 40A1C 8005021C 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 40A20 80050220 2400B3AF */  sw         $s3, 0x24($sp)
/* 40A24 80050224 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 40A28 80050228 7340010C */  jal        MEMPACK_RelocatableType
/* 40A2C 8005022C 1800B0AF */   sw        $s0, 0x18($sp)
/* 40A30 80050230 21984000 */  addu       $s3, $v0, $zero
/* 40A34 80050234 0B004226 */  addiu      $v0, $s2, 0xB
/* 40A38 80050238 82100200 */  srl        $v0, $v0, 2
/* 40A3C 8005023C 80900200 */  sll        $s2, $v0, 2
.L80050240:
/* 40A40 80050240 00C7828F */  lw         $v0, %gp_rel(newMemTracker + 0x10)($gp)
/* 40A44 80050244 00000000 */  nop
/* 40A48 80050248 05004014 */  bnez       $v0, .L80050260
/* 40A4C 8005024C 00000000 */   nop
/* 40A50 80050250 09006012 */  beqz       $s3, .L80050278
/* 40A54 80050254 00000000 */   nop
/* 40A58 80050258 5842010C */  jal        MEMPACK_DoGarbageCollection
/* 40A5C 8005025C 00000000 */   nop
.L80050260:
/* 40A60 80050260 05006012 */  beqz       $s3, .L80050278
/* 40A64 80050264 00000000 */   nop
/* 40A68 80050268 3E40010C */  jal        MEMPACK_GetSmallestBlockTopBottom
/* 40A6C 8005026C 21204002 */   addu      $a0, $s2, $zero
/* 40A70 80050270 A1400108 */  j          .L80050284
/* 40A74 80050274 21884000 */   addu      $s1, $v0, $zero
.L80050278:
/* 40A78 80050278 5840010C */  jal        MEMPACK_GetSmallestBlockBottomTop
/* 40A7C 8005027C 21204002 */   addu      $a0, $s2, $zero
/* 40A80 80050280 21884000 */  addu       $s1, $v0, $zero
.L80050284:
/* 40A84 80050284 17002016 */  bnez       $s1, .L800502E4
/* 40A88 80050288 00000000 */   nop
/* 40A8C 8005028C F8C6908F */  lw         $s0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40A90 80050290 E163010C */  jal        STREAM_TryAndDumpANonResidentObject
/* 40A94 80050294 00000000 */   nop
/* 40A98 80050298 F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40A9C 8005029C 00000000 */  nop
/* 40AA0 800502A0 E7FF0216 */  bne        $s0, $v0, .L80050240
/* 40AA4 800502A4 FF009032 */   andi      $s0, $s4, 0xFF
/* 40AA8 800502A8 10000224 */  addiu      $v0, $zero, 0x10
/* 40AAC 800502AC 3F000212 */  beq        $s0, $v0, .L800503AC
/* 40AB0 800502B0 21100000 */   addu      $v0, $zero, $zero
/* 40AB4 800502B4 7F41010C */  jal        MEMPACK_ReportMemory2
/* 40AB8 800502B8 00000000 */   nop
/* 40ABC 800502BC 0D80043C */  lui        $a0, %hi(vmClock + 0x4)
/* 40AC0 800502C0 74108424 */  addiu      $a0, $a0, %lo(vmClock + 0x4)
/* 40AC4 800502C4 21284002 */  addu       $a1, $s2, $zero
/* 40AC8 800502C8 F4C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x4)($gp)
/* 40ACC 800502CC F8C6838F */  lw         $v1, %gp_rel(newMemTracker + 0x8)($gp)
/* 40AD0 800502D0 21300002 */  addu       $a2, $s0, $zero
/* 40AD4 800502D4 23104300 */  subu       $v0, $v0, $v1
/* 40AD8 800502D8 21386000 */  addu       $a3, $v1, $zero
/* 40ADC 800502DC 2B52000C */  jal        DEBUG_FatalError
/* 40AE0 800502E0 1000A2AF */   sw        $v0, 0x10($sp)
.L800502E4:
/* 40AE4 800502E4 0400248E */  lw         $a0, 0x4($s1)
/* 40AE8 800502E8 00000000 */  nop
/* 40AEC 800502EC 23109200 */  subu       $v0, $a0, $s2
/* 40AF0 800502F0 0800422C */  sltiu      $v0, $v0, 0x8
/* 40AF4 800502F4 02004010 */  beqz       $v0, .L80050300
/* 40AF8 800502F8 00000000 */   nop
/* 40AFC 800502FC 21908000 */  addu       $s2, $a0, $zero
.L80050300:
/* 40B00 80050300 20004412 */  beq        $s2, $a0, .L80050384
/* 40B04 80050304 DEBA0234 */   ori       $v0, $zero, 0xBADE
/* 40B08 80050308 0C006012 */  beqz       $s3, .L8005033C
/* 40B0C 8005030C 21283202 */   addu      $a1, $s1, $s2
/* 40B10 80050310 DEBA0334 */  ori        $v1, $zero, 0xBADE
/* 40B14 80050314 0000A3A4 */  sh         $v1, 0x0($a1)
/* 40B18 80050318 0200A0A0 */  sb         $zero, 0x2($a1)
/* 40B1C 8005031C 0300A0A0 */  sb         $zero, 0x3($a1)
/* 40B20 80050320 0400228E */  lw         $v0, 0x4($s1)
/* 40B24 80050324 00000000 */  nop
/* 40B28 80050328 23105200 */  subu       $v0, $v0, $s2
/* 40B2C 8005032C 0400A2AC */  sw         $v0, 0x4($a1)
/* 40B30 80050330 01000224 */  addiu      $v0, $zero, 0x1
/* 40B34 80050334 E3400108 */  j          .L8005038C
/* 40B38 80050338 000023A6 */   sh        $v1, 0x0($s1)
.L8005033C:
/* 40B3C 8005033C 23209200 */  subu       $a0, $a0, $s2
/* 40B40 80050340 21282402 */  addu       $a1, $s1, $a0
/* 40B44 80050344 DEBA0334 */  ori        $v1, $zero, 0xBADE
/* 40B48 80050348 01000224 */  addiu      $v0, $zero, 0x1
/* 40B4C 8005034C 0000A3A4 */  sh         $v1, 0x0($a1)
/* 40B50 80050350 0200A2A0 */  sb         $v0, 0x2($a1)
/* 40B54 80050354 0300B4A0 */  sb         $s4, 0x3($a1)
/* 40B58 80050358 0400B2AC */  sw         $s2, 0x4($a1)
/* 40B5C 8005035C F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40B60 80050360 00000000 */  nop
/* 40B64 80050364 21105200 */  addu       $v0, $v0, $s2
/* 40B68 80050368 F8C682AF */  sw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40B6C 8005036C 000023A6 */  sh         $v1, 0x0($s1)
/* 40B70 80050370 020020A2 */  sb         $zero, 0x2($s1)
/* 40B74 80050374 030020A2 */  sb         $zero, 0x3($s1)
/* 40B78 80050378 040024AE */  sw         $a0, 0x4($s1)
/* 40B7C 8005037C EA400108 */  j          .L800503A8
/* 40B80 80050380 2188A000 */   addu      $s1, $a1, $zero
.L80050384:
/* 40B84 80050384 000022A6 */  sh         $v0, 0x0($s1)
/* 40B88 80050388 01000224 */  addiu      $v0, $zero, 0x1
.L8005038C:
/* 40B8C 8005038C 020022A2 */  sb         $v0, 0x2($s1)
/* 40B90 80050390 030034A2 */  sb         $s4, 0x3($s1)
/* 40B94 80050394 040032AE */  sw         $s2, 0x4($s1)
/* 40B98 80050398 F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40B9C 8005039C 00000000 */  nop
/* 40BA0 800503A0 21105200 */  addu       $v0, $v0, $s2
/* 40BA4 800503A4 F8C682AF */  sw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
.L800503A8:
/* 40BA8 800503A8 08002226 */  addiu      $v0, $s1, 0x8
.L800503AC:
/* 40BAC 800503AC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 40BB0 800503B0 2800B48F */  lw         $s4, 0x28($sp)
/* 40BB4 800503B4 2400B38F */  lw         $s3, 0x24($sp)
/* 40BB8 800503B8 2000B28F */  lw         $s2, 0x20($sp)
/* 40BBC 800503BC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 40BC0 800503C0 1800B08F */  lw         $s0, 0x18($sp)
/* 40BC4 800503C4 0800E003 */  jr         $ra
/* 40BC8 800503C8 3000BD27 */   addiu     $sp, $sp, 0x30
.size MEMPACK_Malloc, . - MEMPACK_Malloc
