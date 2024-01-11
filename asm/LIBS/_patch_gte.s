.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _patch_gte
/* B7290 800C6A90 0E80013C */  lui        $at, %hi(_spu_RQ + 0x14)
/* B7294 800C6A94 D0FD3FAC */  sw         $ra, %lo(_spu_RQ + 0x14)($at)
/* B7298 800C6A98 A5FC020C */  jal        EnterCriticalSection
/* B729C 800C6A9C 00000000 */   nop
/* B72A0 800C6AA0 56000924 */  addiu      $t1, $zero, 0x56
/* B72A4 800C6AA4 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B72A8 800C6AA8 09F84001 */  jalr       $t2
/* B72AC 800C6AAC 00000000 */   nop
/* B72B0 800C6AB0 1800428C */  lw         $v0, 0x18($v0)
/* B72B4 800C6AB4 00000000 */  nop
/* B72B8 800C6AB8 28004224 */  addiu      $v0, $v0, 0x28
/* B72BC 800C6ABC 21784000 */  addu       $t7, $v0, $zero
/* B72C0 800C6AC0 0C800A3C */  lui        $t2, %hi(func_800C6B3C)
/* B72C4 800C6AC4 3C6B4A25 */  addiu      $t2, $t2, %lo(func_800C6B3C)
/* B72C8 800C6AC8 0C80093C */  lui        $t1, %hi(D_800C6B54)
/* B72CC 800C6ACC 546B2925 */  addiu      $t1, $t1, %lo(D_800C6B54)
.L800C6AD0:
/* B72D0 800C6AD0 0000438D */  lw         $v1, 0x0($t2)
/* B72D4 800C6AD4 00004B8C */  lw         $t3, 0x0($v0)
/* B72D8 800C6AD8 04004A25 */  addiu      $t2, $t2, 0x4
/* B72DC 800C6ADC 0E006B14 */  bne        $v1, $t3, .L800C6B18
/* B72E0 800C6AE0 04004224 */   addiu     $v0, $v0, 0x4
/* B72E4 800C6AE4 FAFF4915 */  bne        $t2, $t1, .L800C6AD0
/* B72E8 800C6AE8 00000000 */   nop
/* B72EC 800C6AEC 2110E001 */  addu       $v0, $t7, $zero
/* B72F0 800C6AF0 0C800A3C */  lui        $t2, %hi(D_800C6B54)
/* B72F4 800C6AF4 546B4A25 */  addiu      $t2, $t2, %lo(D_800C6B54)
/* B72F8 800C6AF8 0C80093C */  lui        $t1, %hi(D_800C6B6C)
/* B72FC 800C6AFC 6C6B2925 */  addiu      $t1, $t1, %lo(D_800C6B6C)
.L800C6B00:
/* B7300 800C6B00 0000438D */  lw         $v1, 0x0($t2)
/* B7304 800C6B04 00000000 */  nop
/* B7308 800C6B08 000043AC */  sw         $v1, 0x0($v0)
/* B730C 800C6B0C 04004A25 */  addiu      $t2, $t2, 0x4
/* B7310 800C6B10 FBFF4915 */  bne        $t2, $t1, .L800C6B00
/* B7314 800C6B14 04004224 */   addiu     $v0, $v0, 0x4
.L800C6B18:
/* B7318 800C6B18 1820030C */  jal        FlushCache
/* B731C 800C6B1C 00000000 */   nop
/* B7320 800C6B20 11FC020C */  jal        ExitCriticalSection
/* B7324 800C6B24 00000000 */   nop
/* B7328 800C6B28 0E801F3C */  lui        $ra, %hi(_spu_RQ + 0x14)
/* B732C 800C6B2C D0FDFF8F */  lw         $ra, %lo(_spu_RQ + 0x14)($ra)
/* B7330 800C6B30 00000000 */  nop
/* B7334 800C6B34 0800E003 */  jr         $ra
/* B7338 800C6B38 00000000 */   nop
.size _patch_gte, . - _patch_gte
