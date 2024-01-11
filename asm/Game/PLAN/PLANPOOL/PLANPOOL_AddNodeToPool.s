.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_AddNodeToPool
/* 8A2B8 80099AB8 21508000 */  addu       $t2, $a0, $zero
/* 8A2BC 80099ABC ECF5898F */  lw         $t1, %gp_rel(poolManagementData)($gp)
/* 8A2C0 80099AC0 2158A000 */  addu       $t3, $a1, $zero
/* 8A2C4 80099AC4 01002291 */  lbu        $v0, 0x1($t1)
/* 8A2C8 80099AC8 00000000 */  nop
/* 8A2CC 80099ACC 2000422C */  sltiu      $v0, $v0, 0x20
/* 8A2D0 80099AD0 34004010 */  beqz       $v0, .L80099BA4
/* 8A2D4 80099AD4 21400000 */   addu      $t0, $zero, $zero
/* 8A2D8 80099AD8 01002391 */  lbu        $v1, 0x1($t1)
/* 8A2DC 80099ADC 02004495 */  lhu        $a0, 0x2($t2)
/* 8A2E0 80099AE0 04004595 */  lhu        $a1, 0x4($t2)
/* 8A2E4 80099AE4 C0100300 */  sll        $v0, $v1, 3
/* 8A2E8 80099AE8 23104300 */  subu       $v0, $v0, $v1
/* 8A2EC 80099AEC 80100200 */  sll        $v0, $v0, 2
/* 8A2F0 80099AF0 00004395 */  lhu        $v1, 0x0($t2)
/* 8A2F4 80099AF4 21406201 */  addu       $t0, $t3, $v0
/* 8A2F8 80099AF8 020004A5 */  sh         $a0, 0x2($t0)
/* 8A2FC 80099AFC 040005A5 */  sh         $a1, 0x4($t0)
/* 8A300 80099B00 000003A5 */  sh         $v1, 0x0($t0)
/* 8A304 80099B04 01002391 */  lbu        $v1, 0x1($t1)
/* 8A308 80099B08 0C0000AD */  sw         $zero, 0xC($t0)
/* 8A30C 80099B0C 060000A5 */  sh         $zero, 0x6($t0)
/* 8A310 80099B10 140006A5 */  sh         $a2, 0x14($t0)
/* 8A314 80099B14 160007A5 */  sh         $a3, 0x16($t0)
/* 8A318 80099B18 1000A28F */  lw         $v0, 0x10($sp)
/* 8A31C 80099B1C 00000000 */  nop
/* 8A320 80099B20 180002AD */  sw         $v0, 0x18($t0)
/* 8A324 80099B24 01000224 */  addiu      $v0, $zero, 0x1
/* 8A328 80099B28 04106200 */  sllv       $v0, $v0, $v1
/* 8A32C 80099B2C 080002AD */  sw         $v0, 0x8($t0)
/* 8A330 80099B30 01002291 */  lbu        $v0, 0x1($t1)
/* 8A334 80099B34 00000000 */  nop
/* 8A338 80099B38 01004224 */  addiu      $v0, $v0, 0x1
/* 8A33C 80099B3C 010022A1 */  sb         $v0, 0x1($t1)
/* 8A340 80099B40 ECF5868F */  lw         $a2, %gp_rel(poolManagementData)($gp)
/* 8A344 80099B44 00000000 */  nop
/* 8A348 80099B48 0100C290 */  lbu        $v0, 0x1($a2)
/* 8A34C 80099B4C 00000000 */  nop
/* 8A350 80099B50 14004010 */  beqz       $v0, .L80099BA4
/* 8A354 80099B54 21280000 */   addu      $a1, $zero, $zero
/* 8A358 80099B58 40180500 */  sll        $v1, $a1, 1
.L80099B5C:
/* 8A35C 80099B5C 0100C290 */  lbu        $v0, 0x1($a2)
/* 8A360 80099B60 1000C48C */  lw         $a0, 0x10($a2)
/* 8A364 80099B64 80110200 */  sll        $v0, $v0, 6
/* 8A368 80099B68 21104400 */  addu       $v0, $v0, $a0
/* 8A36C 80099B6C 21186200 */  addu       $v1, $v1, $v0
/* 8A370 80099B70 80110500 */  sll        $v0, $a1, 6
/* 8A374 80099B74 C0FF60A4 */  sh         $zero, -0x40($v1)
/* 8A378 80099B78 0100C390 */  lbu        $v1, 0x1($a2)
/* 8A37C 80099B7C 1000C48C */  lw         $a0, 0x10($a2)
/* 8A380 80099B80 40180300 */  sll        $v1, $v1, 1
/* 8A384 80099B84 21104400 */  addu       $v0, $v0, $a0
/* 8A388 80099B88 21186200 */  addu       $v1, $v1, $v0
/* 8A38C 80099B8C FEFF60A4 */  sh         $zero, -0x2($v1)
/* 8A390 80099B90 0100C290 */  lbu        $v0, 0x1($a2)
/* 8A394 80099B94 0100A524 */  addiu      $a1, $a1, 0x1
/* 8A398 80099B98 2A10A200 */  slt        $v0, $a1, $v0
/* 8A39C 80099B9C EFFF4014 */  bnez       $v0, .L80099B5C
/* 8A3A0 80099BA0 40180500 */   sll       $v1, $a1, 1
.L80099BA4:
/* 8A3A4 80099BA4 0800E003 */  jr         $ra
/* 8A3A8 80099BA8 21100001 */   addu      $v0, $t0, $zero
.size PLANPOOL_AddNodeToPool, . - PLANPOOL_AddNodeToPool
