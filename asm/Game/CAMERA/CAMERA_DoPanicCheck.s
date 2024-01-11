.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_DoPanicCheck
/* DB04 8001D304 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* DB08 8001D308 1800B0AF */  sw         $s0, 0x18($sp)
/* DB0C 8001D30C 21808000 */  addu       $s0, $a0, $zero
/* DB10 8001D310 1C00B1AF */  sw         $s1, 0x1C($sp)
/* DB14 8001D314 2188A000 */  addu       $s1, $a1, $zero
/* DB18 8001D318 2400B3AF */  sw         $s3, 0x24($sp)
/* DB1C 8001D31C 2198C000 */  addu       $s3, $a2, $zero
/* DB20 8001D320 2800B4AF */  sw         $s4, 0x28($sp)
/* DB24 8001D324 21A0E000 */  addu       $s4, $a3, $zero
/* DB28 8001D328 1000A427 */  addiu      $a0, $sp, 0x10
/* DB2C 8001D32C 2C00BFAF */  sw         $ra, 0x2C($sp)
/* DB30 8001D330 2000B2AF */  sw         $s2, 0x20($sp)
/* DB34 8001D334 A8010786 */  lh         $a3, 0x1A8($s0)
/* DB38 8001D338 4000B28F */  lw         $s2, 0x40($sp)
/* DB3C 8001D33C 6F5A000C */  jal        CAMERA_CalcPosition
/* DB40 8001D340 00010526 */   addiu     $a1, $s0, 0x100
/* DB44 8001D344 21200002 */  addu       $a0, $s0, $zero
/* DB48 8001D348 21282002 */  addu       $a1, $s1, $zero
/* DB4C 8001D34C 1000A227 */  addiu      $v0, $sp, 0x10
/* DB50 8001D350 21300000 */  addu       $a2, $zero, $zero
/* DB54 8001D354 1000A397 */  lhu        $v1, 0x10($sp)
/* DB58 8001D358 02004794 */  lhu        $a3, 0x2($v0)
/* DB5C 8001D35C 04004894 */  lhu        $t0, 0x4($v0)
/* DB60 8001D360 E4018224 */  addiu      $v0, $a0, 0x1E4
/* DB64 8001D364 E40183A4 */  sh         $v1, 0x1E4($a0)
/* DB68 8001D368 020047A4 */  sh         $a3, 0x2($v0)
/* DB6C 8001D36C 695F000C */  jal        CAMERA_SphereToSphereWithLines
/* DB70 8001D370 040048A4 */   sh        $t0, 0x4($v0)
/* DB74 8001D374 4800228E */  lw         $v0, 0x48($s1)
/* DB78 8001D378 00000000 */  nop
/* DB7C 8001D37C 07004010 */  beqz       $v0, .L8001D39C
/* DB80 8001D380 00000000 */   nop
/* DB84 8001D384 00004286 */  lh         $v0, 0x0($s2)
/* DB88 8001D388 4C00238E */  lw         $v1, 0x4C($s1)
/* DB8C 8001D38C 00000000 */  nop
/* DB90 8001D390 2A104300 */  slt        $v0, $v0, $v1
/* DB94 8001D394 07004010 */  beqz       $v0, .L8001D3B4
/* DB98 8001D398 00000000 */   nop
.L8001D39C:
/* DB9C 8001D39C 04006296 */  lhu        $v0, 0x4($s3)
/* DBA0 8001D3A0 00000000 */  nop
/* DBA4 8001D3A4 000082A6 */  sh         $v0, 0x0($s4)
/* DBA8 8001D3A8 4C002296 */  lhu        $v0, 0x4C($s1)
/* DBAC 8001D3AC 00000000 */  nop
/* DBB0 8001D3B0 000042A6 */  sh         $v0, 0x0($s2)
.L8001D3B4:
/* DBB4 8001D3B4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* DBB8 8001D3B8 2800B48F */  lw         $s4, 0x28($sp)
/* DBBC 8001D3BC 2400B38F */  lw         $s3, 0x24($sp)
/* DBC0 8001D3C0 2000B28F */  lw         $s2, 0x20($sp)
/* DBC4 8001D3C4 1C00B18F */  lw         $s1, 0x1C($sp)
/* DBC8 8001D3C8 1800B08F */  lw         $s0, 0x18($sp)
/* DBCC 8001D3CC 0800E003 */  jr         $ra
/* DBD0 8001D3D0 3000BD27 */   addiu     $sp, $sp, 0x30
.size CAMERA_DoPanicCheck, . - CAMERA_DoPanicCheck
