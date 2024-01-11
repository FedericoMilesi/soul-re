.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C29FC
/* B31FC 800C29FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3200 800C2A00 1000B0AF */  sw         $s0, 0x10($sp)
/* B3204 800C2A04 21808000 */  addu       $s0, $a0, $zero
/* B3208 800C2A08 0D80053C */  lui        $a1, %hi(_padSioState)
/* B320C 800C2A0C 48E9A524 */  addiu      $a1, $a1, %lo(_padSioState)
/* B3210 800C2A10 1400BFAF */  sw         $ra, 0x14($sp)
/* B3214 800C2A14 0000A38C */  lw         $v1, 0x0($a1)
/* B3218 800C2A18 00000000 */  nop
/* B321C 800C2A1C 80100300 */  sll        $v0, $v1, 2
/* B3220 800C2A20 0D80013C */  lui        $at, %hi(padIntFunc)
/* B3224 800C2A24 21082200 */  addu       $at, $at, $v0
/* B3228 800C2A28 CCF4228C */  lw         $v0, %lo(padIntFunc)($at)
/* B322C 800C2A2C 01006324 */  addiu      $v1, $v1, 0x1
/* B3230 800C2A30 09F84000 */  jalr       $v0
/* B3234 800C2A34 0000A3AC */   sw        $v1, 0x0($a1)
/* B3238 800C2A38 21204000 */  addu       $a0, $v0, $zero
/* B323C 800C2A3C 22008004 */  bltz       $a0, .L800C2AC8
/* B3240 800C2A40 00000000 */   nop
/* B3244 800C2A44 0D80033C */  lui        $v1, %hi(_padSioState)
/* B3248 800C2A48 48E9638C */  lw         $v1, %lo(_padSioState)($v1)
/* B324C 800C2A4C 00000000 */  nop
/* B3250 800C2A50 17006010 */  beqz       $v1, .L800C2AB0
/* B3254 800C2A54 03000224 */   addiu     $v0, $zero, 0x3
/* B3258 800C2A58 07006214 */  bne        $v1, $v0, .L800C2A78
/* B325C 800C2A5C 00000000 */   nop
/* B3260 800C2A60 3C00028E */  lw         $v0, 0x3C($s0)
/* B3264 800C2A64 00000000 */  nop
/* B3268 800C2A68 00004390 */  lbu        $v1, 0x0($v0)
/* B326C 800C2A6C 80000224 */  addiu      $v0, $zero, 0x80
/* B3270 800C2A70 0C006210 */  beq        $v1, $v0, .L800C2AA4
/* B3274 800C2A74 00000000 */   nop
.L800C2A78:
/* B3278 800C2A78 5C1E030C */  jal        setRC2wait
/* B327C 800C2A7C 3C000424 */   addiu     $a0, $zero, 0x3C
/* B3280 800C2A80 DD0B030C */  jal        _padClrIntSio0
/* B3284 800C2A84 00000000 */   nop
/* B3288 800C2A88 06004014 */  bnez       $v0, .L800C2AA4
/* B328C 800C2A8C 00000000 */   nop
/* B3290 800C2A90 0D80023C */  lui        $v0, %hi(_padFuncNextPort)
/* B3294 800C2A94 04E9428C */  lw         $v0, %lo(_padFuncNextPort)($v0)
/* B3298 800C2A98 00000000 */  nop
/* B329C 800C2A9C 09F84000 */  jalr       $v0
/* B32A0 800C2AA0 FDFF0424 */   addiu     $a0, $zero, -0x3
.L800C2AA4:
/* B32A4 800C2AA4 0D80033C */  lui        $v1, %hi(_padSioState)
/* B32A8 800C2AA8 48E9638C */  lw         $v1, %lo(_padSioState)($v1)
/* B32AC 800C2AAC 00000000 */  nop
.L800C2AB0:
/* B32B0 800C2AB0 05006228 */  slti       $v0, $v1, 0x5
/* B32B4 800C2AB4 09004014 */  bnez       $v0, .L800C2ADC
/* B32B8 800C2AB8 FFFF6224 */   addiu     $v0, $v1, -0x1
/* B32BC 800C2ABC 0D80013C */  lui        $at, %hi(_padSioState)
/* B32C0 800C2AC0 B70A0308 */  j          .L800C2ADC
/* B32C4 800C2AC4 48E922AC */   sw        $v0, %lo(_padSioState)($at)
.L800C2AC8:
/* B32C8 800C2AC8 0D80023C */  lui        $v0, %hi(_padFuncNextPort)
/* B32CC 800C2ACC 04E9428C */  lw         $v0, %lo(_padFuncNextPort)($v0)
/* B32D0 800C2AD0 00000000 */  nop
/* B32D4 800C2AD4 09F84000 */  jalr       $v0
/* B32D8 800C2AD8 00000000 */   nop
.L800C2ADC:
/* B32DC 800C2ADC 1400BF8F */  lw         $ra, 0x14($sp)
/* B32E0 800C2AE0 1000B08F */  lw         $s0, 0x10($sp)
/* B32E4 800C2AE4 0800E003 */  jr         $ra
/* B32E8 800C2AE8 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C29FC, . - func_800C29FC
