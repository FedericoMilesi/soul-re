.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_AbortFileLoad
/* 5122C 80060A2C 44CB828F */  lw         $v0, %gp_rel(loadHead)($gp)
/* 51230 80060A30 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 51234 80060A34 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 51238 80060A38 2198A000 */  addu       $s3, $a1, $zero
/* 5123C 80060A3C 2000BFAF */  sw         $ra, 0x20($sp)
/* 51240 80060A40 1800B2AF */  sw         $s2, 0x18($sp)
/* 51244 80060A44 1400B1AF */  sw         $s1, 0x14($sp)
/* 51248 80060A48 25004010 */  beqz       $v0, .L80060AE0
/* 5124C 80060A4C 1000B0AF */   sw        $s0, 0x10($sp)
/* 51250 80060A50 75DF000C */  jal        LOAD_HashName
/* 51254 80060A54 21880000 */   addu      $s1, $zero, $zero
/* 51258 80060A58 44CB908F */  lw         $s0, %gp_rel(loadHead)($gp)
/* 5125C 80060A5C 00000000 */  nop
/* 51260 80060A60 1F000012 */  beqz       $s0, .L80060AE0
/* 51264 80060A64 21184000 */   addu      $v1, $v0, $zero
/* 51268 80060A68 06001224 */  addiu      $s2, $zero, 0x6
.L80060A6C:
/* 5126C 80060A6C 0800028E */  lw         $v0, 0x8($s0)
/* 51270 80060A70 00000000 */  nop
/* 51274 80060A74 15004314 */  bne        $v0, $v1, .L80060ACC
/* 51278 80060A78 00000000 */   nop
/* 5127C 80060A7C 03002016 */  bnez       $s1, .L80060A8C
/* 51280 80060A80 00000000 */   nop
/* 51284 80060A84 35E1000C */  jal        LOAD_StopLoad
/* 51288 80060A88 00000000 */   nop
.L80060A8C:
/* 5128C 80060A8C 04000286 */  lh         $v0, 0x4($s0)
/* 51290 80060A90 00000000 */  nop
/* 51294 80060A94 03005214 */  bne        $v0, $s2, .L80060AA4
/* 51298 80060A98 00000000 */   nop
/* 5129C 80060A9C 94E0000C */  jal        LOAD_CleanUpBuffers
/* 512A0 80060AA0 00000000 */   nop
.L80060AA4:
/* 512A4 80060AA4 1400048E */  lw         $a0, 0x14($s0)
/* 512A8 80060AA8 3000058E */  lw         $a1, 0x30($s0)
/* 512AC 80060AAC 3400068E */  lw         $a2, 0x34($s0)
/* 512B0 80060AB0 09F86002 */  jalr       $s3
/* 512B4 80060AB4 00000000 */   nop
/* 512B8 80060AB8 21200002 */  addu       $a0, $s0, $zero
/* 512BC 80060ABC 0E80010C */  jal        STREAM_RemoveQueueEntry
/* 512C0 80060AC0 21282002 */   addu      $a1, $s1, $zero
/* 512C4 80060AC4 B8820108 */  j          .L80060AE0
/* 512C8 80060AC8 00000000 */   nop
.L80060ACC:
/* 512CC 80060ACC 21880002 */  addu       $s1, $s0, $zero
/* 512D0 80060AD0 0000108E */  lw         $s0, 0x0($s0)
/* 512D4 80060AD4 00000000 */  nop
/* 512D8 80060AD8 E4FF0016 */  bnez       $s0, .L80060A6C
/* 512DC 80060ADC 00000000 */   nop
.L80060AE0:
/* 512E0 80060AE0 2000BF8F */  lw         $ra, 0x20($sp)
/* 512E4 80060AE4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 512E8 80060AE8 1800B28F */  lw         $s2, 0x18($sp)
/* 512EC 80060AEC 1400B18F */  lw         $s1, 0x14($sp)
/* 512F0 80060AF0 1000B08F */  lw         $s0, 0x10($sp)
/* 512F4 80060AF4 0800E003 */  jr         $ra
/* 512F8 80060AF8 2800BD27 */   addiu     $sp, $sp, 0x28
.size LOAD_AbortFileLoad, . - LOAD_AbortFileLoad
