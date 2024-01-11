.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CalcZRotation
/* 8298 80017A98 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 829C 80017A9C 2000BFAF */  sw         $ra, 0x20($sp)
/* 82A0 80017AA0 0000A694 */  lhu        $a2, 0x0($a1)
/* 82A4 80017AA4 0200A294 */  lhu        $v0, 0x2($a1)
/* 82A8 80017AA8 0400A394 */  lhu        $v1, 0x4($a1)
/* 82AC 80017AAC 00008594 */  lhu        $a1, 0x0($a0)
/* 82B0 80017AB0 02008794 */  lhu        $a3, 0x2($a0)
/* 82B4 80017AB4 04008894 */  lhu        $t0, 0x4($a0)
/* 82B8 80017AB8 1000A427 */  addiu      $a0, $sp, 0x10
/* 82BC 80017ABC 2330C500 */  subu       $a2, $a2, $a1
/* 82C0 80017AC0 23104700 */  subu       $v0, $v0, $a3
/* 82C4 80017AC4 23186800 */  subu       $v1, $v1, $t0
/* 82C8 80017AC8 1000A6A7 */  sh         $a2, 0x10($sp)
/* 82CC 80017ACC 020082A4 */  sh         $v0, 0x2($a0)
/* 82D0 80017AD0 040083A4 */  sh         $v1, 0x4($a0)
/* 82D4 80017AD4 1200A297 */  lhu        $v0, 0x12($sp)
/* 82D8 80017AD8 1800A427 */  addiu      $a0, $sp, 0x18
/* 82DC 80017ADC 1800A6A7 */  sh         $a2, 0x18($sp)
/* 82E0 80017AE0 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 82E4 80017AE4 9C58000C */  jal        CAMERA_LengthSVector
/* 82E8 80017AE8 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 82EC 80017AEC 1200A487 */  lh         $a0, 0x12($sp)
/* 82F0 80017AF0 1000A587 */  lh         $a1, 0x10($sp)
/* 82F4 80017AF4 26F3020C */  jal        func_800BCC98
/* 82F8 80017AF8 00000000 */   nop
/* 82FC 80017AFC 00044224 */  addiu      $v0, $v0, 0x400
/* 8300 80017B00 2000BF8F */  lw         $ra, 0x20($sp)
/* 8304 80017B04 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 8308 80017B08 0800E003 */  jr         $ra
/* 830C 80017B0C 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_CalcZRotation, . - CAMERA_CalcZRotation
