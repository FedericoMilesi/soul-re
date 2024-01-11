.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3534
/* B3D34 800C3534 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3D38 800C3538 1000BFAF */  sw         $ra, 0x10($sp)
/* B3D3C 800C353C 46008390 */  lbu        $v1, 0x46($a0)
/* B3D40 800C3540 03000224 */  addiu      $v0, $zero, 0x3
/* B3D44 800C3544 10006210 */  beq        $v1, $v0, .L800C3588
/* B3D48 800C3548 04006228 */   slti      $v0, $v1, 0x4
/* B3D4C 800C354C 05004010 */  beqz       $v0, .L800C3564
/* B3D50 800C3550 02000224 */   addiu     $v0, $zero, 0x2
/* B3D54 800C3554 08006210 */  beq        $v1, $v0, .L800C3578
/* B3D58 800C3558 00000000 */   nop
/* B3D5C 800C355C 6A0D0308 */  j          .L800C35A8
/* B3D60 800C3560 00000000 */   nop
.L800C3564:
/* B3D64 800C3564 04000224 */  addiu      $v0, $zero, 0x4
/* B3D68 800C3568 0C006210 */  beq        $v1, $v0, .L800C359C
/* B3D6C 800C356C 00000000 */   nop
/* B3D70 800C3570 6A0D0308 */  j          .L800C35A8
/* B3D74 800C3574 00000000 */   nop
.L800C3578:
/* B3D78 800C3578 D00F030C */  jal        func_800C3F40
/* B3D7C 800C357C 00000000 */   nop
/* B3D80 800C3580 6A0D0308 */  j          .L800C35A8
/* B3D84 800C3584 00000000 */   nop
.L800C3588:
/* B3D88 800C3588 E4008590 */  lbu        $a1, 0xE4($a0)
/* B3D8C 800C358C D50F030C */  jal        func_800C3F54
/* B3D90 800C3590 00000000 */   nop
/* B3D94 800C3594 6A0D0308 */  j          .L800C35A8
/* B3D98 800C3598 00000000 */   nop
.L800C359C:
/* B3D9C 800C359C 47008590 */  lbu        $a1, 0x47($a0)
/* B3DA0 800C35A0 E50F030C */  jal        func_800C3F94
/* B3DA4 800C35A4 00000000 */   nop
.L800C35A8:
/* B3DA8 800C35A8 1000BF8F */  lw         $ra, 0x10($sp)
/* B3DAC 800C35AC 1800BD27 */  addiu      $sp, $sp, 0x18
/* B3DB0 800C35B0 0800E003 */  jr         $ra
/* B3DB4 800C35B4 00000000 */   nop
.size func_800C3534, . - func_800C3534
