.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_Sort3VectorCoords
/* 2A258 80039A58 0000888C */  lw         $t0, 0x0($a0)
/* 2A25C 80039A5C 0000A38C */  lw         $v1, 0x0($a1)
/* 2A260 80039A60 0000C78C */  lw         $a3, 0x0($a2)
/* 2A264 80039A64 2A100301 */  slt        $v0, $t0, $v1
/* 2A268 80039A68 0C004010 */  beqz       $v0, .L80039A9C
/* 2A26C 80039A6C 2A10E800 */   slt       $v0, $a3, $t0
/* 2A270 80039A70 05004010 */  beqz       $v0, .L80039A88
/* 2A274 80039A74 2A10E300 */   slt       $v0, $a3, $v1
/* 2A278 80039A78 0000C3AC */  sw         $v1, 0x0($a2)
/* 2A27C 80039A7C 0000A8AC */  sw         $t0, 0x0($a1)
/* 2A280 80039A80 0800E003 */  jr         $ra
/* 2A284 80039A84 000087AC */   sw        $a3, 0x0($a0)
.L80039A88:
/* 2A288 80039A88 12004010 */  beqz       $v0, .L80039AD4
/* 2A28C 80039A8C 00000000 */   nop
/* 2A290 80039A90 0000C3AC */  sw         $v1, 0x0($a2)
/* 2A294 80039A94 0800E003 */  jr         $ra
/* 2A298 80039A98 0000A7AC */   sw        $a3, 0x0($a1)
.L80039A9C:
/* 2A29C 80039A9C 2A10E300 */  slt        $v0, $a3, $v1
/* 2A2A0 80039AA0 04004010 */  beqz       $v0, .L80039AB4
/* 2A2A4 80039AA4 2A10E800 */   slt       $v0, $a3, $t0
/* 2A2A8 80039AA8 000087AC */  sw         $a3, 0x0($a0)
/* 2A2AC 80039AAC 0800E003 */  jr         $ra
/* 2A2B0 80039AB0 0000C8AC */   sw        $t0, 0x0($a2)
.L80039AB4:
/* 2A2B4 80039AB4 05004010 */  beqz       $v0, .L80039ACC
/* 2A2B8 80039AB8 00000000 */   nop
/* 2A2BC 80039ABC 000083AC */  sw         $v1, 0x0($a0)
/* 2A2C0 80039AC0 0000A7AC */  sw         $a3, 0x0($a1)
/* 2A2C4 80039AC4 0800E003 */  jr         $ra
/* 2A2C8 80039AC8 0000C8AC */   sw        $t0, 0x0($a2)
.L80039ACC:
/* 2A2CC 80039ACC 000083AC */  sw         $v1, 0x0($a0)
/* 2A2D0 80039AD0 0000A8AC */  sw         $t0, 0x0($a1)
.L80039AD4:
/* 2A2D4 80039AD4 0800E003 */  jr         $ra
/* 2A2D8 80039AD8 00000000 */   nop
.size MATH3D_Sort3VectorCoords, . - MATH3D_Sort3VectorCoords
