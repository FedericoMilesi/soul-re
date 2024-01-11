.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_Poly
/* A5264 800B4A64 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A5268 800B4A68 2000B4AF */  sw         $s4, 0x20($sp)
/* A526C 800B4A6C 21A08000 */  addu       $s4, $a0, $zero
/* A5270 800B4A70 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A5274 800B4A74 2198C000 */  addu       $s3, $a2, $zero
/* A5278 800B4A78 1800B2AF */  sw         $s2, 0x18($sp)
/* A527C 800B4A7C 2190E000 */  addu       $s2, $a3, $zero
/* A5280 800B4A80 1400B1AF */  sw         $s1, 0x14($sp)
/* A5284 800B4A84 2400BFAF */  sw         $ra, 0x24($sp)
/* A5288 800B4A88 1000B0AF */  sw         $s0, 0x10($sp)
/* A528C 800B4A8C 0000A884 */  lh         $t0, 0x0($a1)
/* A5290 800B4A90 00006786 */  lh         $a3, 0x0($s3)
/* A5294 800B4A94 0000A694 */  lhu        $a2, 0x0($a1)
/* A5298 800B4A98 00006496 */  lhu        $a0, 0x0($s3)
/* A529C 800B4A9C 2A100701 */  slt        $v0, $t0, $a3
/* A52A0 800B4AA0 09004010 */  beqz       $v0, .L800B4AC8
/* A52A4 800B4AA4 28009126 */   addiu     $s1, $s4, 0x28
/* A52A8 800B4AA8 00004286 */  lh         $v0, 0x0($s2)
/* A52AC 800B4AAC 00000000 */  nop
/* A52B0 800B4AB0 21184000 */  addu       $v1, $v0, $zero
/* A52B4 800B4AB4 2A100201 */  slt        $v0, $t0, $v0
/* A52B8 800B4AB8 0B004010 */  beqz       $v0, .L800B4AE8
/* A52BC 800B4ABC 00140300 */   sll       $v0, $v1, 16
/* A52C0 800B4AC0 B9D20208 */  j          .L800B4AE4
/* A52C4 800B4AC4 2118C000 */   addu      $v1, $a2, $zero
.L800B4AC8:
/* A52C8 800B4AC8 00004286 */  lh         $v0, 0x0($s2)
/* A52CC 800B4ACC 00000000 */  nop
/* A52D0 800B4AD0 21184000 */  addu       $v1, $v0, $zero
/* A52D4 800B4AD4 2A10E200 */  slt        $v0, $a3, $v0
/* A52D8 800B4AD8 03004010 */  beqz       $v0, .L800B4AE8
/* A52DC 800B4ADC 00140300 */   sll       $v0, $v1, 16
/* A52E0 800B4AE0 21188000 */  addu       $v1, $a0, $zero
.L800B4AE4:
/* A52E4 800B4AE4 00140300 */  sll        $v0, $v1, 16
.L800B4AE8:
/* A52E8 800B4AE8 03840200 */  sra        $s0, $v0, 16
/* A52EC 800B4AEC C0FF0224 */  addiu      $v0, $zero, -0x40
/* A52F0 800B4AF0 24800202 */  and        $s0, $s0, $v0
/* A52F4 800B4AF4 09000224 */  addiu      $v0, $zero, 0x9
/* A52F8 800B4AF8 030022A2 */  sb         $v0, 0x3($s1)
/* A52FC 800B4AFC 34000224 */  addiu      $v0, $zero, 0x34
/* A5300 800B4B00 070022A2 */  sb         $v0, 0x7($s1)
/* A5304 800B4B04 0400A28C */  lw         $v0, 0x4($a1)
/* A5308 800B4B08 00000000 */  nop
/* A530C 800B4B0C 080022AE */  sw         $v0, 0x8($s1)
/* A5310 800B4B10 0400628E */  lw         $v0, 0x4($s3)
/* A5314 800B4B14 0C002426 */  addiu      $a0, $s1, 0xC
/* A5318 800B4B18 140022AE */  sw         $v0, 0x14($s1)
/* A531C 800B4B1C 0400428E */  lw         $v0, 0x4($s2)
/* A5320 800B4B20 21300002 */  addu       $a2, $s0, $zero
/* A5324 800B4B24 86D2020C */  jal        UNDERWORLD_DoUV
/* A5328 800B4B28 200022AE */   sw        $v0, 0x20($s1)
/* A532C 800B4B2C 18002426 */  addiu      $a0, $s1, 0x18
/* A5330 800B4B30 21286002 */  addu       $a1, $s3, $zero
/* A5334 800B4B34 86D2020C */  jal        UNDERWORLD_DoUV
/* A5338 800B4B38 21300002 */   addu      $a2, $s0, $zero
/* A533C 800B4B3C 24002426 */  addiu      $a0, $s1, 0x24
/* A5340 800B4B40 21284002 */  addu       $a1, $s2, $zero
/* A5344 800B4B44 86D2020C */  jal        UNDERWORLD_DoUV
/* A5348 800B4B48 21300002 */   addu      $a2, $s0, $zero
/* A534C 800B4B4C 02000424 */  addiu      $a0, $zero, 0x2
/* A5350 800B4B50 01000524 */  addiu      $a1, $zero, 0x1
/* A5354 800B4B54 3800A78F */  lw         $a3, 0x38($sp)
/* A5358 800B4B58 BDFD020C */  jal        GetTPage
/* A535C 800B4B5C 21300002 */   addu      $a2, $s0, $zero
/* A5360 800B4B60 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* A5364 800B4B64 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* A5368 800B4B68 1A0022A6 */  sh         $v0, 0x1A($s1)
/* A536C 800B4B6C 21102002 */  addu       $v0, $s1, $zero
/* A5370 800B4B70 10000324 */  addiu      $v1, $zero, 0x10
/* A5374 800B4B74 040043A0 */  sb         $v1, 0x4($v0)
/* A5378 800B4B78 050043A0 */  sb         $v1, 0x5($v0)
/* A537C 800B4B7C 060043A0 */  sb         $v1, 0x6($v0)
/* A5380 800B4B80 100043A0 */  sb         $v1, 0x10($v0)
/* A5384 800B4B84 110043A0 */  sb         $v1, 0x11($v0)
/* A5388 800B4B88 120043A0 */  sb         $v1, 0x12($v0)
/* A538C 800B4B8C 1C0043A0 */  sb         $v1, 0x1C($v0)
/* A5390 800B4B90 1D0043A0 */  sb         $v1, 0x1D($v0)
/* A5394 800B4B94 1E0043A0 */  sb         $v1, 0x1E($v0)
/* A5398 800B4B98 00FF033C */  lui        $v1, (0xFF000000 >> 16)
/* A539C 800B4B9C 0000448C */  lw         $a0, 0x0($v0)
/* A53A0 800B4BA0 24288502 */  and        $a1, $s4, $a1
/* A53A4 800B4BA4 24208300 */  and        $a0, $a0, $v1
/* A53A8 800B4BA8 07004390 */  lbu        $v1, 0x7($v0)
/* A53AC 800B4BAC 25208500 */  or         $a0, $a0, $a1
/* A53B0 800B4BB0 000044AC */  sw         $a0, 0x0($v0)
/* A53B4 800B4BB4 02006334 */  ori        $v1, $v1, 0x2
/* A53B8 800B4BB8 070043A0 */  sb         $v1, 0x7($v0)
/* A53BC 800B4BBC 2400BF8F */  lw         $ra, 0x24($sp)
/* A53C0 800B4BC0 2000B48F */  lw         $s4, 0x20($sp)
/* A53C4 800B4BC4 1C00B38F */  lw         $s3, 0x1C($sp)
/* A53C8 800B4BC8 1800B28F */  lw         $s2, 0x18($sp)
/* A53CC 800B4BCC 1400B18F */  lw         $s1, 0x14($sp)
/* A53D0 800B4BD0 1000B08F */  lw         $s0, 0x10($sp)
/* A53D4 800B4BD4 0800E003 */  jr         $ra
/* A53D8 800B4BD8 2800BD27 */   addiu     $sp, $sp, 0x28
.size UNDERWORLD_Poly, . - UNDERWORLD_Poly
