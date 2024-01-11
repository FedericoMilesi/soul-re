.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadLoadDynamicSfx
/* 432FC 80052AFC 21388000 */  addu       $a3, $a0, $zero
/* 43300 80052B00 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 43304 80052B04 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 43308 80052B08 1400BFAF */  sw         $ra, 0x14($sp)
/* 4330C 80052B0C 1000B0AF */  sw         $s0, 0x10($sp)
/* 43310 80052B10 4807828C */  lw         $v0, 0x748($a0)
/* 43314 80052B14 00000000 */  nop
/* 43318 80052B18 10004228 */  slti       $v0, $v0, 0x10
/* 4331C 80052B1C 20004010 */  beqz       $v0, .L80052BA0
/* 43320 80052B20 21100000 */   addu      $v0, $zero, $zero
/* 43324 80052B24 4007828C */  lw         $v0, 0x740($a0)
/* 43328 80052B28 00000000 */  nop
/* 4332C 80052B2C C0800200 */  sll        $s0, $v0, 3
/* 43330 80052B30 23800202 */  subu       $s0, $s0, $v0
/* 43334 80052B34 80801000 */  sll        $s0, $s0, 2
/* 43338 80052B38 18051026 */  addiu      $s0, $s0, 0x518
/* 4333C 80052B3C 21809000 */  addu       $s0, $a0, $s0
/* 43340 80052B40 000000AE */  sw         $zero, 0x0($s0)
/* 43344 80052B44 E407838C */  lw         $v1, 0x7E4($a0)
/* 43348 80052B48 00000000 */  nop
/* 4334C 80052B4C FF3F6230 */  andi       $v0, $v1, 0x3FFF
/* 43350 80052B50 01006324 */  addiu      $v1, $v1, 0x1
/* 43354 80052B54 00404234 */  ori        $v0, $v0, 0x4000
/* 43358 80052B58 040002AE */  sw         $v0, 0x4($s0)
/* 4335C 80052B5C E40783AC */  sw         $v1, 0x7E4($a0)
/* 43360 80052B60 10000426 */  addiu      $a0, $s0, 0x10
/* 43364 80052B64 080005AE */  sw         $a1, 0x8($s0)
/* 43368 80052B68 2128E000 */  addu       $a1, $a3, $zero
/* 4336C 80052B6C 0C0006AE */  sw         $a2, 0xC($s0)
/* 43370 80052B70 3DFE020C */  jal        func_800BF8F4
/* 43374 80052B74 0B000624 */   addiu     $a2, $zero, 0xB
/* 43378 80052B78 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 4337C 80052B7C 00000000 */  nop
/* 43380 80052B80 4007828C */  lw         $v0, 0x740($a0)
/* 43384 80052B84 4807838C */  lw         $v1, 0x748($a0)
/* 43388 80052B88 01004224 */  addiu      $v0, $v0, 0x1
/* 4338C 80052B8C 0F004230 */  andi       $v0, $v0, 0xF
/* 43390 80052B90 01006324 */  addiu      $v1, $v1, 0x1
/* 43394 80052B94 400782AC */  sw         $v0, 0x740($a0)
/* 43398 80052B98 480783AC */  sw         $v1, 0x748($a0)
/* 4339C 80052B9C 0400028E */  lw         $v0, 0x4($s0)
.L80052BA0:
/* 433A0 80052BA0 1400BF8F */  lw         $ra, 0x14($sp)
/* 433A4 80052BA4 1000B08F */  lw         $s0, 0x10($sp)
/* 433A8 80052BA8 0800E003 */  jr         $ra
/* 433AC 80052BAC 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadLoadDynamicSfx, . - aadLoadDynamicSfx
