.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_GetSegChannelValue
/* 83A04 80093204 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 83A08 80093208 1000B0AF */  sw         $s0, 0x10($sp)
/* 83A0C 8009320C 21808000 */  addu       $s0, $a0, $zero
/* 83A10 80093210 1400B1AF */  sw         $s1, 0x14($sp)
/* 83A14 80093214 2188A000 */  addu       $s1, $a1, $zero
/* 83A18 80093218 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 83A1C 8009321C 2198C000 */  addu       $s3, $a2, $zero
/* 83A20 80093220 1800B2AF */  sw         $s2, 0x18($sp)
/* 83A24 80093224 2000BFAF */  sw         $ra, 0x20($sp)
/* 83A28 80093228 B74B020C */  jal        G2Anim_UpdateStoredFrame
/* 83A2C 8009322C 2190E000 */   addu      $s2, $a3, $zero
/* 83A30 80093230 0800028E */  lw         $v0, 0x8($s0)
/* 83A34 80093234 0C000396 */  lhu        $v1, 0xC($s0)
/* 83A38 80093238 08EE82AF */  sw         $v0, %gp_rel(_segValues + 0x10)($gp)
/* 83A3C 8009323C 0CEE83A7 */  sh         $v1, %gp_rel(_segValues + 0x14)($gp)
/* 83A40 80093240 0743020C */  jal        _G2Anim_ApplyControllersToStoredFrame
/* 83A44 80093244 21200002 */   addu      $a0, $s0, $zero
/* 83A48 80093248 40101100 */  sll        $v0, $s1, 1
/* 83A4C 8009324C 21105100 */  addu       $v0, $v0, $s1
/* 83A50 80093250 C0100200 */  sll        $v0, $v0, 3
/* 83A54 80093254 F8ED8327 */  addiu      $v1, $gp, %gp_rel(_segValues)
/* 83A58 80093258 21184300 */  addu       $v1, $v0, $v1
/* 83A5C 8009325C FFFF4232 */  andi       $v0, $s2, 0xFFFF
/* 83A60 80093260 0C004010 */  beqz       $v0, .L80093294
/* 83A64 80093264 00000000 */   nop
.L80093268:
/* 83A68 80093268 01004232 */  andi       $v0, $s2, 0x1
/* 83A6C 8009326C 06004010 */  beqz       $v0, .L80093288
/* 83A70 80093270 FFFF4232 */   andi      $v0, $s2, 0xFFFF
/* 83A74 80093274 00006294 */  lhu        $v0, 0x0($v1)
/* 83A78 80093278 00000000 */  nop
/* 83A7C 8009327C 000062A6 */  sh         $v0, 0x0($s3)
/* 83A80 80093280 02007326 */  addiu      $s3, $s3, 0x2
/* 83A84 80093284 FFFF4232 */  andi       $v0, $s2, 0xFFFF
.L80093288:
/* 83A88 80093288 42900200 */  srl        $s2, $v0, 1
/* 83A8C 8009328C F6FF4016 */  bnez       $s2, .L80093268
/* 83A90 80093290 02006324 */   addiu     $v1, $v1, 0x2
.L80093294:
/* 83A94 80093294 2000BF8F */  lw         $ra, 0x20($sp)
/* 83A98 80093298 1C00B38F */  lw         $s3, 0x1C($sp)
/* 83A9C 8009329C 1800B28F */  lw         $s2, 0x18($sp)
/* 83AA0 800932A0 1400B18F */  lw         $s1, 0x14($sp)
/* 83AA4 800932A4 1000B08F */  lw         $s0, 0x10($sp)
/* 83AA8 800932A8 0800E003 */  jr         $ra
/* 83AAC 800932AC 2800BD27 */   addiu     $sp, $sp, 0x28
.size G2Anim_GetSegChannelValue, . - G2Anim_GetSegChannelValue
