.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_GetWaterZLevel
/* 4A25C 80059A5C 1800A28C */  lw         $v0, 0x18($a1)
/* 4A260 80059A60 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 4A264 80059A64 24104300 */  and        $v0, $v0, $v1
/* 4A268 80059A68 0E004010 */  beqz       $v0, .L80059AA4
/* 4A26C 80059A6C 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 4A270 80059A70 1C00A28C */  lw         $v0, 0x1C($a1)
/* 4A274 80059A74 00000000 */  nop
/* 4A278 80059A78 2C00428C */  lw         $v0, 0x2C($v0)
/* 4A27C 80059A7C 00000000 */  nop
/* 4A280 80059A80 24104300 */  and        $v0, $v0, $v1
/* 4A284 80059A84 13004014 */  bnez       $v0, .L80059AD4
/* 4A288 80059A88 01800524 */   addiu     $a1, $zero, -0x7FFF
/* 4A28C 80059A8C D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4A290 80059A90 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 4A294 80059A94 0F006210 */  beq        $v1, $v0, .L80059AD4
/* 4A298 80059A98 00000000 */   nop
/* 4A29C 80059A9C B4660108 */  j          .L80059AD0
/* 4A2A0 80059AA0 00000000 */   nop
.L80059AA4:
/* 4A2A4 80059AA4 1C00A28C */  lw         $v0, 0x1C($a1)
/* 4A2A8 80059AA8 00000000 */  nop
/* 4A2AC 80059AAC 2C00428C */  lw         $v0, 0x2C($v0)
/* 4A2B0 80059AB0 00000000 */  nop
/* 4A2B4 80059AB4 24104300 */  and        $v0, $v0, $v1
/* 4A2B8 80059AB8 05004014 */  bnez       $v0, .L80059AD0
/* 4A2BC 80059ABC E8030224 */   addiu     $v0, $zero, 0x3E8
/* 4A2C0 80059AC0 D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4A2C4 80059AC4 00000000 */  nop
/* 4A2C8 80059AC8 02006214 */  bne        $v1, $v0, .L80059AD4
/* 4A2CC 80059ACC 01800524 */   addiu     $a1, $zero, -0x7FFF
.L80059AD0:
/* 4A2D0 80059AD0 3800858C */  lw         $a1, 0x38($a0)
.L80059AD4:
/* 4A2D4 80059AD4 0800E003 */  jr         $ra
/* 4A2D8 80059AD8 2110A000 */   addu      $v0, $a1, $zero
.size STREAM_GetWaterZLevel, . - STREAM_GetWaterZLevel
