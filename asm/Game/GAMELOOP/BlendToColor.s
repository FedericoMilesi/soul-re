.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BlendToColor
/* 1F328 8002EB28 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1F32C 8002EB2C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 1F330 8002EB30 21888000 */  addu       $s1, $a0, $zero
/* 1F334 8002EB34 1800B0AF */  sw         $s0, 0x18($sp)
/* 1F338 8002EB38 2180C000 */  addu       $s0, $a2, $zero
/* 1F33C 8002EB3C 00020624 */  addiu      $a2, $zero, 0x200
/* 1F340 8002EB40 000E0724 */  addiu      $a3, $zero, 0xE00
/* 1F344 8002EB44 2000BFAF */  sw         $ra, 0x20($sp)
/* 1F348 8002EB48 A8F3020C */  jal        LoadAverageCol
/* 1F34C 8002EB4C 1000B0AF */   sw        $s0, 0x10($sp)
/* 1F350 8002EB50 00002492 */  lbu        $a0, 0x0($s1)
/* 1F354 8002EB54 00000392 */  lbu        $v1, 0x0($s0)
/* 1F358 8002EB58 00000000 */  nop
/* 1F35C 8002EB5C 23108300 */  subu       $v0, $a0, $v1
/* 1F360 8002EB60 05004004 */  bltz       $v0, .L8002EB78
/* 1F364 8002EB64 05004228 */   slti      $v0, $v0, 0x5
/* 1F368 8002EB68 07004014 */  bnez       $v0, .L8002EB88
/* 1F36C 8002EB6C 00000000 */   nop
/* 1F370 8002EB70 02BB0008 */  j          .L8002EC08
/* 1F374 8002EB74 030000A2 */   sb        $zero, 0x3($s0)
.L8002EB78:
/* 1F378 8002EB78 23106400 */  subu       $v0, $v1, $a0
/* 1F37C 8002EB7C 05004228 */  slti       $v0, $v0, 0x5
/* 1F380 8002EB80 20004010 */  beqz       $v0, .L8002EC04
/* 1F384 8002EB84 00000000 */   nop
.L8002EB88:
/* 1F388 8002EB88 01002492 */  lbu        $a0, 0x1($s1)
/* 1F38C 8002EB8C 01000392 */  lbu        $v1, 0x1($s0)
/* 1F390 8002EB90 00000000 */  nop
/* 1F394 8002EB94 23108300 */  subu       $v0, $a0, $v1
/* 1F398 8002EB98 05004004 */  bltz       $v0, .L8002EBB0
/* 1F39C 8002EB9C 05004228 */   slti      $v0, $v0, 0x5
/* 1F3A0 8002EBA0 07004014 */  bnez       $v0, .L8002EBC0
/* 1F3A4 8002EBA4 00000000 */   nop
/* 1F3A8 8002EBA8 02BB0008 */  j          .L8002EC08
/* 1F3AC 8002EBAC 030000A2 */   sb        $zero, 0x3($s0)
.L8002EBB0:
/* 1F3B0 8002EBB0 23106400 */  subu       $v0, $v1, $a0
/* 1F3B4 8002EBB4 05004228 */  slti       $v0, $v0, 0x5
/* 1F3B8 8002EBB8 12004010 */  beqz       $v0, .L8002EC04
/* 1F3BC 8002EBBC 00000000 */   nop
.L8002EBC0:
/* 1F3C0 8002EBC0 02002492 */  lbu        $a0, 0x2($s1)
/* 1F3C4 8002EBC4 02000392 */  lbu        $v1, 0x2($s0)
/* 1F3C8 8002EBC8 00000000 */  nop
/* 1F3CC 8002EBCC 23108300 */  subu       $v0, $a0, $v1
/* 1F3D0 8002EBD0 05004004 */  bltz       $v0, .L8002EBE8
/* 1F3D4 8002EBD4 05004228 */   slti      $v0, $v0, 0x5
/* 1F3D8 8002EBD8 07004014 */  bnez       $v0, .L8002EBF8
/* 1F3DC 8002EBDC 00000000 */   nop
/* 1F3E0 8002EBE0 02BB0008 */  j          .L8002EC08
/* 1F3E4 8002EBE4 030000A2 */   sb        $zero, 0x3($s0)
.L8002EBE8:
/* 1F3E8 8002EBE8 23106400 */  subu       $v0, $v1, $a0
/* 1F3EC 8002EBEC 05004228 */  slti       $v0, $v0, 0x5
/* 1F3F0 8002EBF0 04004010 */  beqz       $v0, .L8002EC04
/* 1F3F4 8002EBF4 00000000 */   nop
.L8002EBF8:
/* 1F3F8 8002EBF8 0000228E */  lw         $v0, 0x0($s1)
/* 1F3FC 8002EBFC 00000000 */  nop
/* 1F400 8002EC00 000002AE */  sw         $v0, 0x0($s0)
.L8002EC04:
/* 1F404 8002EC04 030000A2 */  sb         $zero, 0x3($s0)
.L8002EC08:
/* 1F408 8002EC08 2000BF8F */  lw         $ra, 0x20($sp)
/* 1F40C 8002EC0C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 1F410 8002EC10 1800B08F */  lw         $s0, 0x18($sp)
/* 1F414 8002EC14 0800E003 */  jr         $ra
/* 1F418 8002EC18 2800BD27 */   addiu     $sp, $sp, 0x28
.size BlendToColor, . - BlendToColor
