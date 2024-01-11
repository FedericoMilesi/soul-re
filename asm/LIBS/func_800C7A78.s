.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C7A78
/* B8278 800C7A78 0D80033C */  lui        $v1, %hi(_padSioChan)
/* B827C 800C7A7C 44E9638C */  lw         $v1, %lo(_padSioChan)($v1)
/* B8280 800C7A80 0D80023C */  lui        $v0, %hi(_padChanStart)
/* B8284 800C7A84 54E9428C */  lw         $v0, %lo(_padChanStart)($v0)
/* B8288 800C7A88 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B828C 800C7A8C 1000B0AF */  sw         $s0, 0x10($sp)
/* B8290 800C7A90 21808000 */  addu       $s0, $a0, $zero
/* B8294 800C7A94 10006214 */  bne        $v1, $v0, .L800C7AD8
/* B8298 800C7A98 1400BFAF */   sw        $ra, 0x14($sp)
/* B829C 800C7A9C 0D80023C */  lui        $v0, %hi(_padGunExec)
/* B82A0 800C7AA0 40E9428C */  lw         $v0, %lo(_padGunExec)($v0)
/* B82A4 800C7AA4 00000000 */  nop
/* B82A8 800C7AA8 0B004010 */  beqz       $v0, .L800C7AD8
/* B82AC 800C7AAC 00000000 */   nop
/* B82B0 800C7AB0 0D80023C */  lui        $v0, %hi(_padFuncGetGunPos)
/* B82B4 800C7AB4 34E9428C */  lw         $v0, %lo(_padFuncGetGunPos)($v0)
/* B82B8 800C7AB8 00000000 */  nop
/* B82BC 800C7ABC 09F84000 */  jalr       $v0
/* B82C0 800C7AC0 00000000 */   nop
/* B82C4 800C7AC4 0D80023C */  lui        $v0, %hi(_padFuncSetGunPort)
/* B82C8 800C7AC8 30E9428C */  lw         $v0, %lo(_padFuncSetGunPort)($v0)
/* B82CC 800C7ACC 00000000 */  nop
/* B82D0 800C7AD0 09F84000 */  jalr       $v0
/* B82D4 800C7AD4 00000000 */   nop
.L800C7AD8:
/* B82D8 800C7AD8 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D8)
/* B82DC 800C7ADC C4F4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D8)($v0)
/* B82E0 800C7AE0 00000000 */  nop
/* B82E4 800C7AE4 0D004010 */  beqz       $v0, .L800C7B1C
/* B82E8 800C7AE8 00000000 */   nop
/* B82EC 800C7AEC 0C00048E */  lw         $a0, 0xC($s0)
/* B82F0 800C7AF0 0D80023C */  lui        $v0, %hi(_padFuncSendAuto)
/* B82F4 800C7AF4 1CE9428C */  lw         $v0, %lo(_padFuncSendAuto)($v0)
/* B82F8 800C7AF8 00000000 */  nop
/* B82FC 800C7AFC 09F84000 */  jalr       $v0
/* B8300 800C7B00 00000000 */   nop
/* B8304 800C7B04 0C00048E */  lw         $a0, 0xC($s0)
/* B8308 800C7B08 0D80023C */  lui        $v0, %hi(_padFuncSendAuto)
/* B830C 800C7B0C 1CE9428C */  lw         $v0, %lo(_padFuncSendAuto)($v0)
/* B8310 800C7B10 00000000 */  nop
/* B8314 800C7B14 09F84000 */  jalr       $v0
/* B8318 800C7B18 F0008424 */   addiu     $a0, $a0, 0xF0
.L800C7B1C:
/* B831C 800C7B1C 37000292 */  lbu        $v0, 0x37($s0)
/* B8320 800C7B20 00000000 */  nop
/* B8324 800C7B24 03004014 */  bnez       $v0, .L800C7B34
/* B8328 800C7B28 21200002 */   addu      $a0, $s0, $zero
/* B832C 800C7B2C CE1E0308 */  j          .L800C7B38
/* B8330 800C7B30 42000524 */   addiu     $a1, $zero, 0x42
.L800C7B34:
/* B8334 800C7B34 37000592 */  lbu        $a1, 0x37($s0)
.L800C7B38:
/* B8338 800C7B38 3F0B030C */  jal        _padSioRW2
/* B833C 800C7B3C 00000000 */   nop
/* B8340 800C7B40 1400BF8F */  lw         $ra, 0x14($sp)
/* B8344 800C7B44 1000B08F */  lw         $s0, 0x10($sp)
/* B8348 800C7B48 0800E003 */  jr         $ra
/* B834C 800C7B4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C7A78, . - func_800C7A78
