.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C317C
/* B397C 800C317C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3980 800C3180 1000B0AF */  sw         $s0, 0x10($sp)
/* B3984 800C3184 21808000 */  addu       $s0, $a0, $zero
/* B3988 800C3188 1400BFAF */  sw         $ra, 0x14($sp)
/* B398C 800C318C 3C00028E */  lw         $v0, 0x3C($s0)
/* B3990 800C3190 00000000 */  nop
/* B3994 800C3194 00004390 */  lbu        $v1, 0x0($v0)
/* B3998 800C3198 00000000 */  nop
/* B399C 800C319C F0006230 */  andi       $v0, $v1, 0xF0
/* B39A0 800C31A0 10004014 */  bnez       $v0, .L800C31E4
/* B39A4 800C31A4 02190300 */   srl       $v1, $v1, 4
/* B39A8 800C31A8 3000038E */  lw         $v1, 0x30($s0)
/* B39AC 800C31AC FF000224 */  addiu      $v0, $zero, 0xFF
/* B39B0 800C31B0 000062A0 */  sb         $v0, 0x0($v1)
/* B39B4 800C31B4 3000028E */  lw         $v0, 0x30($s0)
/* B39B8 800C31B8 00000000 */  nop
/* B39BC 800C31BC 010040A0 */  sb         $zero, 0x1($v0)
/* B39C0 800C31C0 E80000A2 */  sb         $zero, 0xE8($s0)
/* B39C4 800C31C4 350000A2 */  sb         $zero, 0x35($s0)
/* B39C8 800C31C8 0D80023C */  lui        $v0, %hi(_padFuncClrInfo)
/* B39CC 800C31CC 08E9428C */  lw         $v0, %lo(_padFuncClrInfo)($v0)
/* B39D0 800C31D0 00000000 */  nop
/* B39D4 800C31D4 09F84000 */  jalr       $v0
/* B39D8 800C31D8 00000000 */   nop
/* B39DC 800C31DC F40C0308 */  j          .L800C33D0
/* B39E0 800C31E0 00000000 */   nop
.L800C31E4:
/* B39E4 800C31E4 E8000592 */  lbu        $a1, 0xE8($s0)
/* B39E8 800C31E8 0F000224 */  addiu      $v0, $zero, 0xF
/* B39EC 800C31EC 03006214 */  bne        $v1, $v0, .L800C31FC
/* B39F0 800C31F0 E80003A2 */   sb        $v1, 0xE8($s0)
/* B39F4 800C31F4 970C0308 */  j          .L800C325C
/* B39F8 800C31F8 E80005A2 */   sb        $a1, 0xE8($s0)
.L800C31FC:
/* B39FC 800C31FC 3000028E */  lw         $v0, 0x30($s0)
/* B3A00 800C3200 00000000 */  nop
/* B3A04 800C3204 000040A0 */  sb         $zero, 0x0($v0)
/* B3A08 800C3208 3C00028E */  lw         $v0, 0x3C($s0)
/* B3A0C 800C320C 3000038E */  lw         $v1, 0x30($s0)
/* B3A10 800C3210 00004290 */  lbu        $v0, 0x0($v0)
/* B3A14 800C3214 02000424 */  addiu      $a0, $zero, 0x2
/* B3A18 800C3218 010062A0 */  sb         $v0, 0x1($v1)
/* B3A1C 800C321C 44000292 */  lbu        $v0, 0x44($s0)
/* B3A20 800C3220 44000392 */  lbu        $v1, 0x44($s0)
/* B3A24 800C3224 2A108200 */  slt        $v0, $a0, $v0
/* B3A28 800C3228 0C004010 */  beqz       $v0, .L800C325C
/* B3A2C 800C322C 350003A2 */   sb        $v1, 0x35($s0)
.L800C3230:
/* B3A30 800C3230 3C00028E */  lw         $v0, 0x3C($s0)
/* B3A34 800C3234 3000038E */  lw         $v1, 0x30($s0)
/* B3A38 800C3238 21104400 */  addu       $v0, $v0, $a0
/* B3A3C 800C323C 00004290 */  lbu        $v0, 0x0($v0)
/* B3A40 800C3240 21186400 */  addu       $v1, $v1, $a0
/* B3A44 800C3244 000062A0 */  sb         $v0, 0x0($v1)
/* B3A48 800C3248 44000292 */  lbu        $v0, 0x44($s0)
/* B3A4C 800C324C 01008424 */  addiu      $a0, $a0, 0x1
/* B3A50 800C3250 2A108200 */  slt        $v0, $a0, $v0
/* B3A54 800C3254 F6FF4014 */  bnez       $v0, .L800C3230
/* B3A58 800C3258 00000000 */   nop
.L800C325C:
/* B3A5C 800C325C 3C00028E */  lw         $v0, 0x3C($s0)
/* B3A60 800C3260 00000000 */  nop
/* B3A64 800C3264 01004290 */  lbu        $v0, 0x1($v0)
/* B3A68 800C3268 00000000 */  nop
/* B3A6C 800C326C 0D004014 */  bnez       $v0, .L800C32A4
/* B3A70 800C3270 01000224 */   addiu     $v0, $zero, 0x1
/* B3A74 800C3274 46000392 */  lbu        $v1, 0x46($s0)
/* B3A78 800C3278 00000000 */  nop
/* B3A7C 800C327C 05006214 */  bne        $v1, $v0, .L800C3294
/* B3A80 800C3280 00000000 */   nop
/* B3A84 800C3284 1400028E */  lw         $v0, 0x14($s0)
/* B3A88 800C3288 00000000 */  nop
/* B3A8C 800C328C 05004010 */  beqz       $v0, .L800C32A4
/* B3A90 800C3290 00000000 */   nop
.L800C3294:
/* B3A94 800C3294 50000292 */  lbu        $v0, 0x50($s0)
/* B3A98 800C3298 00000000 */  nop
/* B3A9C 800C329C 05004010 */  beqz       $v0, .L800C32B4
/* B3AA0 800C32A0 00000000 */   nop
.L800C32A4:
/* B3AA4 800C32A4 E8000292 */  lbu        $v0, 0xE8($s0)
/* B3AA8 800C32A8 00000000 */  nop
/* B3AAC 800C32AC 06004510 */  beq        $v0, $a1, .L800C32C8
/* B3AB0 800C32B0 00000000 */   nop
.L800C32B4:
/* B3AB4 800C32B4 0D80023C */  lui        $v0, %hi(_padFuncClrInfo)
/* B3AB8 800C32B8 08E9428C */  lw         $v0, %lo(_padFuncClrInfo)($v0)
/* B3ABC 800C32BC 00000000 */  nop
/* B3AC0 800C32C0 09F84000 */  jalr       $v0
/* B3AC4 800C32C4 21200002 */   addu      $a0, $s0, $zero
.L800C32C8:
/* B3AC8 800C32C8 46000492 */  lbu        $a0, 0x46($s0)
/* B3ACC 800C32CC FF000224 */  addiu      $v0, $zero, 0xFF
/* B3AD0 800C32D0 FF008330 */  andi       $v1, $a0, 0xFF
/* B3AD4 800C32D4 3E006210 */  beq        $v1, $v0, .L800C33D0
/* B3AD8 800C32D8 4A0000A2 */   sb        $zero, 0x4A($s0)
/* B3ADC 800C32DC 05006010 */  beqz       $v1, .L800C32F4
/* B3AE0 800C32E0 FEFF8224 */   addiu     $v0, $a0, -0x2
/* B3AE4 800C32E4 37000292 */  lbu        $v0, 0x37($s0)
/* B3AE8 800C32E8 00000000 */  nop
/* B3AEC 800C32EC 38004010 */  beqz       $v0, .L800C33D0
/* B3AF0 800C32F0 FEFF8224 */   addiu     $v0, $a0, -0x2
.L800C32F4:
/* B3AF4 800C32F4 FF004230 */  andi       $v0, $v0, 0xFF
/* B3AF8 800C32F8 FC00422C */  sltiu      $v0, $v0, 0xFC
/* B3AFC 800C32FC 0E004010 */  beqz       $v0, .L800C3338
/* B3B00 800C3300 00000000 */   nop
/* B3B04 800C3304 3C00028E */  lw         $v0, 0x3C($s0)
/* B3B08 800C3308 00000000 */  nop
/* B3B0C 800C330C 00004390 */  lbu        $v1, 0x0($v0)
/* B3B10 800C3310 F3000224 */  addiu      $v0, $zero, 0xF3
/* B3B14 800C3314 08006210 */  beq        $v1, $v0, .L800C3338
/* B3B18 800C3318 00000000 */   nop
/* B3B1C 800C331C 0D80023C */  lui        $v0, %hi(_padFuncClrInfo)
/* B3B20 800C3320 08E9428C */  lw         $v0, %lo(_padFuncClrInfo)($v0)
/* B3B24 800C3324 00000000 */  nop
/* B3B28 800C3328 09F84000 */  jalr       $v0
/* B3B2C 800C332C 21200002 */   addu      $a0, $s0, $zero
/* B3B30 800C3330 F40C0308 */  j          .L800C33D0
/* B3B34 800C3334 00000000 */   nop
.L800C3338:
/* B3B38 800C3338 46000392 */  lbu        $v1, 0x46($s0)
/* B3B3C 800C333C 01000424 */  addiu      $a0, $zero, 0x1
/* B3B40 800C3340 0E006410 */  beq        $v1, $a0, .L800C337C
/* B3B44 800C3344 02006228 */   slti      $v0, $v1, 0x2
/* B3B48 800C3348 05004010 */  beqz       $v0, .L800C3360
/* B3B4C 800C334C FE000224 */   addiu     $v0, $zero, 0xFE
/* B3B50 800C3350 07006010 */  beqz       $v1, .L800C3370
/* B3B54 800C3354 00000000 */   nop
/* B3B58 800C3358 E60C0308 */  j          .L800C3398
/* B3B5C 800C335C 00000000 */   nop
.L800C3360:
/* B3B60 800C3360 0B006210 */  beq        $v1, $v0, .L800C3390
/* B3B64 800C3364 FF000224 */   addiu     $v0, $zero, 0xFF
/* B3B68 800C3368 E60C0308 */  j          .L800C3398
/* B3B6C 800C336C 00000000 */   nop
.L800C3370:
/* B3B70 800C3370 46000292 */  lbu        $v0, 0x46($s0)
/* B3B74 800C3374 E10C0308 */  j          .L800C3384
/* B3B78 800C3378 490004A2 */   sb        $a0, 0x49($s0)
.L800C337C:
/* B3B7C 800C337C 46000292 */  lbu        $v0, 0x46($s0)
/* B3B80 800C3380 470000A2 */  sb         $zero, 0x47($s0)
.L800C3384:
/* B3B84 800C3384 01004224 */  addiu      $v0, $v0, 0x1
/* B3B88 800C3388 F40C0308 */  j          .L800C33D0
/* B3B8C 800C338C 460002A2 */   sb        $v0, 0x46($s0)
.L800C3390:
/* B3B90 800C3390 F40C0308 */  j          .L800C33D0
/* B3B94 800C3394 460002A2 */   sb        $v0, 0x46($s0)
.L800C3398:
/* B3B98 800C3398 1800028E */  lw         $v0, 0x18($s0)
/* B3B9C 800C339C 00000000 */  nop
/* B3BA0 800C33A0 05004010 */  beqz       $v0, .L800C33B8
/* B3BA4 800C33A4 00000000 */   nop
/* B3BA8 800C33A8 09F84000 */  jalr       $v0
/* B3BAC 800C33AC 21200002 */   addu      $a0, $s0, $zero
/* B3BB0 800C33B0 F00C0308 */  j          .L800C33C0
/* B3BB4 800C33B4 00000000 */   nop
.L800C33B8:
/* B3BB8 800C33B8 6E0D030C */  jal        _padRecvAtLoadInfo
/* B3BBC 800C33BC 21200002 */   addu      $a0, $s0, $zero
.L800C33C0:
/* B3BC0 800C33C0 46000392 */  lbu        $v1, 0x46($s0)
/* B3BC4 800C33C4 00000000 */  nop
/* B3BC8 800C33C8 21186200 */  addu       $v1, $v1, $v0
/* B3BCC 800C33CC 460003A2 */  sb         $v1, 0x46($s0)
.L800C33D0:
/* B3BD0 800C33D0 1400BF8F */  lw         $ra, 0x14($sp)
/* B3BD4 800C33D4 1000B08F */  lw         $s0, 0x10($sp)
/* B3BD8 800C33D8 0800E003 */  jr         $ra
/* B3BDC 800C33DC 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C317C, . - func_800C317C
