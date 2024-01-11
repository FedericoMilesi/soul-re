.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANCOLL_DoesLOSExistFinal
/* 892E0 80098AE0 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 892E4 80098AE4 5000B0AF */  sw         $s0, 0x50($sp)
/* 892E8 80098AE8 2180E000 */  addu       $s0, $a3, $zero
/* 892EC 80098AEC 5400BFAF */  sw         $ra, 0x54($sp)
/* 892F0 80098AF0 00008294 */  lhu        $v0, 0x0($a0)
/* 892F4 80098AF4 6800A78F */  lw         $a3, 0x68($sp)
/* 892F8 80098AF8 02008694 */  lhu        $a2, 0x2($a0)
/* 892FC 80098AFC 04008494 */  lhu        $a0, 0x4($a0)
/* 89300 80098B00 4000A327 */  addiu      $v1, $sp, 0x40
/* 89304 80098B04 4000A2A7 */  sh         $v0, 0x40($sp)
/* 89308 80098B08 020066A4 */  sh         $a2, 0x2($v1)
/* 8930C 80098B0C 040064A4 */  sh         $a0, 0x4($v1)
/* 89310 80098B10 0000A294 */  lhu        $v0, 0x0($a1)
/* 89314 80098B14 0200A494 */  lhu        $a0, 0x2($a1)
/* 89318 80098B18 0400A594 */  lhu        $a1, 0x4($a1)
/* 8931C 80098B1C 4800A2A7 */  sh         $v0, 0x48($sp)
/* 89320 80098B20 4800A227 */  addiu      $v0, $sp, 0x48
/* 89324 80098B24 020044A4 */  sh         $a0, 0x2($v0)
/* 89328 80098B28 040045A4 */  sh         $a1, 0x4($v0)
/* 8932C 80098B2C 2400A2AF */  sw         $v0, 0x24($sp)
/* 89330 80098B30 27010224 */  addiu      $v0, $zero, 0x127
/* 89334 80098B34 3400A2AF */  sw         $v0, 0x34($sp)
/* 89338 80098B38 4400A297 */  lhu        $v0, 0x44($sp)
/* 8933C 80098B3C 1000A427 */  addiu      $a0, $sp, 0x10
/* 89340 80098B40 2800A3AF */  sw         $v1, 0x28($sp)
/* 89344 80098B44 4C00A397 */  lhu        $v1, 0x4C($sp)
/* 89348 80098B48 21280000 */  addu       $a1, $zero, $zero
/* 8934C 80098B4C 1800A0AF */  sw         $zero, 0x18($sp)
/* 89350 80098B50 3800A0AF */  sw         $zero, 0x38($sp)
/* 89354 80098B54 21104700 */  addu       $v0, $v0, $a3
/* 89358 80098B58 21186700 */  addu       $v1, $v1, $a3
/* 8935C 80098B5C 4400A2A7 */  sh         $v0, 0x44($sp)
/* 89360 80098B60 0783000C */  jal        COLLIDE_PointAndWorld
/* 89364 80098B64 4C00A3A7 */   sh        $v1, 0x4C($sp)
/* 89368 80098B68 17000012 */  beqz       $s0, .L80098BC8
/* 8936C 80098B6C 03000224 */   addiu     $v0, $zero, 0x3
/* 89370 80098B70 1000A387 */  lh         $v1, 0x10($sp)
/* 89374 80098B74 00000000 */  nop
/* 89378 80098B78 13006214 */  bne        $v1, $v0, .L80098BC8
/* 8937C 80098B7C FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* 89380 80098B80 1400A48F */  lw         $a0, 0x14($sp)
/* 89384 80098B84 00000000 */  nop
/* 89388 80098B88 0A008394 */  lhu        $v1, 0xA($a0)
/* 8938C 80098B8C 00000000 */  nop
/* 89390 80098B90 0D006210 */  beq        $v1, $v0, .L80098BC8
/* 89394 80098B94 00000000 */   nop
/* 89398 80098B98 1800A28F */  lw         $v0, 0x18($sp)
/* 8939C 80098B9C 00000000 */  nop
/* 893A0 80098BA0 0000428C */  lw         $v0, 0x0($v0)
/* 893A4 80098BA4 00000000 */  nop
/* 893A8 80098BA8 3400428C */  lw         $v0, 0x34($v0)
/* 893AC 80098BAC 00000000 */  nop
/* 893B0 80098BB0 21104300 */  addu       $v0, $v0, $v1
/* 893B4 80098BB4 0A004294 */  lhu        $v0, 0xA($v0)
/* 893B8 80098BB8 00000000 */  nop
/* 893BC 80098BBC 00104230 */  andi       $v0, $v0, 0x1000
/* 893C0 80098BC0 04004014 */  bnez       $v0, .L80098BD4
/* 893C4 80098BC4 01000224 */   addiu     $v0, $zero, 0x1
.L80098BC8:
/* 893C8 80098BC8 1000A287 */  lh         $v0, 0x10($sp)
/* 893CC 80098BCC 00000000 */  nop
/* 893D0 80098BD0 0100422C */  sltiu      $v0, $v0, 0x1
.L80098BD4:
/* 893D4 80098BD4 5400BF8F */  lw         $ra, 0x54($sp)
/* 893D8 80098BD8 5000B08F */  lw         $s0, 0x50($sp)
/* 893DC 80098BDC 0800E003 */  jr         $ra
/* 893E0 80098BE0 5800BD27 */   addiu     $sp, $sp, 0x58
.size PLANCOLL_DoesLOSExistFinal, . - PLANCOLL_DoesLOSExistFinal
