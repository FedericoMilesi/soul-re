.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_PassThroughHit
/* 88A64 80098264 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 88A68 80098268 00000000 */  nop
/* 88A6C 8009826C 16004104 */  bgez       $v0, .L800982C8
/* 88A70 80098270 00000000 */   nop
/* 88A74 80098274 14008294 */  lhu        $v0, 0x14($a0)
/* 88A78 80098278 1400A394 */  lhu        $v1, 0x14($a1)
/* 88A7C 8009827C 07004430 */  andi       $a0, $v0, 0x7
/* 88A80 80098280 07006330 */  andi       $v1, $v1, 0x7
/* 88A84 80098284 2A106400 */  slt        $v0, $v1, $a0
/* 88A88 80098288 05004010 */  beqz       $v0, .L800982A0
/* 88A8C 8009828C 00120400 */   sll       $v0, $a0, 8
/* 88A90 80098290 26208300 */  xor        $a0, $a0, $v1
/* 88A94 80098294 26186400 */  xor        $v1, $v1, $a0
/* 88A98 80098298 26208300 */  xor        $a0, $a0, $v1
/* 88A9C 8009829C 00120400 */  sll        $v0, $a0, 8
.L800982A0:
/* 88AA0 800982A0 25184300 */  or         $v1, $v0, $v1
/* 88AA4 800982A4 04010224 */  addiu      $v0, $zero, 0x104
/* 88AA8 800982A8 05006210 */  beq        $v1, $v0, .L800982C0
/* 88AAC 800982AC 04030224 */   addiu     $v0, $zero, 0x304
/* 88AB0 800982B0 03006210 */  beq        $v1, $v0, .L800982C0
/* 88AB4 800982B4 04020224 */   addiu     $v0, $zero, 0x204
/* 88AB8 800982B8 03006214 */  bne        $v1, $v0, .L800982C8
/* 88ABC 800982BC 00000000 */   nop
.L800982C0:
/* 88AC0 800982C0 0800E003 */  jr         $ra
/* 88AC4 800982C4 01000224 */   addiu     $v0, $zero, 0x1
.L800982C8:
/* 88AC8 800982C8 0800E003 */  jr         $ra
/* 88ACC 800982CC 21100000 */   addu      $v0, $zero, $zero
.size PLANAPI_PassThroughHit, . - PLANAPI_PassThroughHit
