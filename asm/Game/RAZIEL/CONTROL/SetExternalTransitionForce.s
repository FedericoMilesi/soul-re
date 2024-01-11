.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetExternalTransitionForce
/* 8ACF8 8009A4F8 02000224 */  addiu      $v0, $zero, 0x2
/* 8ACFC 8009A4FC 000082AC */  sw         $v0, 0x0($a0)
/* 8AD00 8009A500 7401A28C */  lw         $v0, 0x174($a1)
/* 8AD04 8009A504 00000000 */  nop
/* 8AD08 8009A508 2338E200 */  subu       $a3, $a3, $v0
/* 8AD0C 8009A50C 1A00E600 */  div        $zero, $a3, $a2
/* 8AD10 8009A510 12380000 */  mflo       $a3
/* 8AD14 8009A514 00000000 */  nop
/* 8AD18 8009A518 040087AC */  sw         $a3, 0x4($a0)
/* 8AD1C 8009A51C 1000A28F */  lw         $v0, 0x10($sp)
/* 8AD20 8009A520 7801A38C */  lw         $v1, 0x178($a1)
/* 8AD24 8009A524 00000000 */  nop
/* 8AD28 8009A528 23104300 */  subu       $v0, $v0, $v1
/* 8AD2C 8009A52C 1A004600 */  div        $zero, $v0, $a2
/* 8AD30 8009A530 12100000 */  mflo       $v0
/* 8AD34 8009A534 00000000 */  nop
/* 8AD38 8009A538 080082AC */  sw         $v0, 0x8($a0)
/* 8AD3C 8009A53C 1400A28F */  lw         $v0, 0x14($sp)
/* 8AD40 8009A540 7C01A38C */  lw         $v1, 0x17C($a1)
/* 8AD44 8009A544 00000000 */  nop
/* 8AD48 8009A548 23104300 */  subu       $v0, $v0, $v1
/* 8AD4C 8009A54C 1A004600 */  div        $zero, $v0, $a2
/* 8AD50 8009A550 12100000 */  mflo       $v0
/* 8AD54 8009A554 100086A4 */  sh         $a2, 0x10($a0)
/* 8AD58 8009A558 0800E003 */  jr         $ra
/* 8AD5C 8009A55C 0C0082AC */   sw        $v0, 0xC($a0)
.size SetExternalTransitionForce, . - SetExternalTransitionForce
