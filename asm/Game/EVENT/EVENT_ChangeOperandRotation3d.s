.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ChangeOperandRotation3d
/* 52B14 80062314 0E000224 */  addiu      $v0, $zero, 0xE
/* 52B18 80062318 000082AC */  sw         $v0, 0x0($a0)
/* 52B1C 8006231C 0000A294 */  lhu        $v0, 0x0($a1)
/* 52B20 80062320 00000000 */  nop
/* 52B24 80062324 040082A4 */  sh         $v0, 0x4($a0)
/* 52B28 80062328 0200A294 */  lhu        $v0, 0x2($a1)
/* 52B2C 8006232C 00000000 */  nop
/* 52B30 80062330 060082A4 */  sh         $v0, 0x6($a0)
/* 52B34 80062334 0400A294 */  lhu        $v0, 0x4($a1)
/* 52B38 80062338 00000000 */  nop
/* 52B3C 8006233C 080082A4 */  sh         $v0, 0x8($a0)
/* 52B40 80062340 0800A294 */  lhu        $v0, 0x8($a1)
/* 52B44 80062344 00000000 */  nop
/* 52B48 80062348 0C0082A4 */  sh         $v0, 0xC($a0)
/* 52B4C 8006234C 0A00A294 */  lhu        $v0, 0xA($a1)
/* 52B50 80062350 00000000 */  nop
/* 52B54 80062354 0E0082A4 */  sh         $v0, 0xE($a0)
/* 52B58 80062358 0C00A394 */  lhu        $v1, 0xC($a1)
/* 52B5C 8006235C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 52B60 80062360 140082AC */  sw         $v0, 0x14($a0)
/* 52B64 80062364 0800E003 */  jr         $ra
/* 52B68 80062368 100083A4 */   sh        $v1, 0x10($a0)
.size EVENT_ChangeOperandRotation3d, . - EVENT_ChangeOperandRotation3d
