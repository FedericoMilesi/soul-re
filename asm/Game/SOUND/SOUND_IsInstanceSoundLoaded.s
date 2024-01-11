.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_IsInstanceSoundLoaded
/* 30244 8003FA44 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 30248 8003FA48 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3024C 8003FA4C 1800B2AF */  sw         $s2, 0x18($sp)
/* 30250 8003FA50 1400B1AF */  sw         $s1, 0x14($sp)
/* 30254 8003FA54 33008010 */  beqz       $a0, .L8003FB24
/* 30258 8003FA58 1000B0AF */   sw        $s0, 0x10($sp)
/* 3025C 8003FA5C 00008390 */  lbu        $v1, 0x0($a0)
/* 30260 8003FA60 BE000224 */  addiu      $v0, $zero, 0xBE
/* 30264 8003FA64 2F006214 */  bne        $v1, $v0, .L8003FB24
/* 30268 8003FA68 01008424 */   addiu     $a0, $a0, 0x1
/* 3026C 8003FA6C 00008390 */  lbu        $v1, 0x0($a0)
/* 30270 8003FA70 EF000224 */  addiu      $v0, $zero, 0xEF
/* 30274 8003FA74 2B006214 */  bne        $v1, $v0, .L8003FB24
/* 30278 8003FA78 01008424 */   addiu     $a0, $a0, 0x1
/* 3027C 8003FA7C 00008790 */  lbu        $a3, 0x0($a0)
/* 30280 8003FA80 02008424 */  addiu      $a0, $a0, 0x2
/* 30284 8003FA84 2700E010 */  beqz       $a3, .L8003FB24
/* 30288 8003FA88 21300000 */   addu      $a2, $zero, $zero
/* 3028C 8003FA8C FFFF1224 */  addiu      $s2, $zero, -0x1
.L8003FA90:
/* 30290 8003FA90 00008390 */  lbu        $v1, 0x0($a0)
/* 30294 8003FA94 01000224 */  addiu      $v0, $zero, 0x1
/* 30298 8003FA98 0A006210 */  beq        $v1, $v0, .L8003FAC4
/* 3029C 8003FA9C 02006228 */   slti      $v0, $v1, 0x2
/* 302A0 8003FAA0 08004010 */  beqz       $v0, .L8003FAC4
/* 302A4 8003FAA4 00000000 */   nop
/* 302A8 8003FAA8 06006014 */  bnez       $v1, .L8003FAC4
/* 302AC 8003FAAC 12009124 */   addiu     $s1, $a0, 0x12
/* 302B0 8003FAB0 01009090 */  lbu        $s0, 0x1($a0)
/* 302B4 8003FAB4 00000000 */  nop
/* 302B8 8003FAB8 40101000 */  sll        $v0, $s0, 1
/* 302BC 8003FABC B5FE0008 */  j          .L8003FAD4
/* 302C0 8003FAC0 12004224 */   addiu     $v0, $v0, 0x12
.L8003FAC4:
/* 302C4 8003FAC4 01009090 */  lbu        $s0, 0x1($a0)
/* 302C8 8003FAC8 0E009124 */  addiu      $s1, $a0, 0xE
/* 302CC 8003FACC 40101000 */  sll        $v0, $s0, 1
/* 302D0 8003FAD0 0E004224 */  addiu      $v0, $v0, 0xE
.L8003FAD4:
/* 302D4 8003FAD4 0F00C514 */  bne        $a2, $a1, .L8003FB14
/* 302D8 8003FAD8 21208200 */   addu      $a0, $a0, $v0
/* 302DC 8003FADC FFFF1026 */  addiu      $s0, $s0, -0x1
.L8003FAE0:
/* 302E0 8003FAE0 11001212 */  beq        $s0, $s2, .L8003FB28
/* 302E4 8003FAE4 01000224 */   addiu     $v0, $zero, 0x1
/* 302E8 8003FAE8 00002496 */  lhu        $a0, 0x0($s1)
/* 302EC 8003FAEC CF50010C */  jal        aadIsSfxLoaded
/* 302F0 8003FAF0 02003126 */   addiu     $s1, $s1, 0x2
/* 302F4 8003FAF4 05004010 */  beqz       $v0, .L8003FB0C
/* 302F8 8003FAF8 00000000 */   nop
/* 302FC 8003FAFC F8FF5214 */  bne        $v0, $s2, .L8003FAE0
/* 30300 8003FB00 FFFF1026 */   addiu     $s0, $s0, -0x1
/* 30304 8003FB04 CAFE0008 */  j          .L8003FB28
/* 30308 8003FB08 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8003FB0C:
/* 3030C 8003FB0C CAFE0008 */  j          .L8003FB28
/* 30310 8003FB10 21100000 */   addu      $v0, $zero, $zero
.L8003FB14:
/* 30314 8003FB14 0100C624 */  addiu      $a2, $a2, 0x1
/* 30318 8003FB18 2A10C700 */  slt        $v0, $a2, $a3
/* 3031C 8003FB1C DCFF4014 */  bnez       $v0, .L8003FA90
/* 30320 8003FB20 00000000 */   nop
.L8003FB24:
/* 30324 8003FB24 FFFF0224 */  addiu      $v0, $zero, -0x1
.L8003FB28:
/* 30328 8003FB28 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 3032C 8003FB2C 1800B28F */  lw         $s2, 0x18($sp)
/* 30330 8003FB30 1400B18F */  lw         $s1, 0x14($sp)
/* 30334 8003FB34 1000B08F */  lw         $s0, 0x10($sp)
/* 30338 8003FB38 0800E003 */  jr         $ra
/* 3033C 8003FB3C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUND_IsInstanceSoundLoaded, . - SOUND_IsInstanceSoundLoaded
