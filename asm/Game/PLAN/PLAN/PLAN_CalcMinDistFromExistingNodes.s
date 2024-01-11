.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAN_CalcMinDistFromExistingNodes
/* 87AC8 800972C8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 87ACC 800972CC 1000B0AF */  sw         $s0, 0x10($sp)
/* 87AD0 800972D0 21808000 */  addu       $s0, $a0, $zero
/* 87AD4 800972D4 1400B1AF */  sw         $s1, 0x14($sp)
/* 87AD8 800972D8 1800BFAF */  sw         $ra, 0x18($sp)
/* 87ADC 800972DC 2D65020C */  jal        PLANPOOL_GetClosestNode
/* 87AE0 800972E0 2188C000 */   addu      $s1, $a2, $zero
/* 87AE4 800972E4 21304000 */  addu       $a2, $v0, $zero
/* 87AE8 800972E8 1800C010 */  beqz       $a2, .L8009734C
/* 87AEC 800972EC FF7F023C */   lui       $v0, (0x7FFFFFFF >> 16)
/* 87AF0 800972F0 0A002016 */  bnez       $s1, .L8009731C
/* 87AF4 800972F4 00000000 */   nop
/* 87AF8 800972F8 00000386 */  lh         $v1, 0x0($s0)
/* 87AFC 800972FC 0000C484 */  lh         $a0, 0x0($a2)
/* 87B00 80097300 02000286 */  lh         $v0, 0x2($s0)
/* 87B04 80097304 0200C584 */  lh         $a1, 0x2($a2)
/* 87B08 80097308 23206400 */  subu       $a0, $v1, $a0
/* 87B0C 8009730C EBE6000C */  jal        MATH3D_LengthXY
/* 87B10 80097310 23284500 */   subu      $a1, $v0, $a1
/* 87B14 80097314 D45C0208 */  j          .L80097350
/* 87B18 80097318 00000000 */   nop
.L8009731C:
/* 87B1C 8009731C 00000286 */  lh         $v0, 0x0($s0)
/* 87B20 80097320 0000C484 */  lh         $a0, 0x0($a2)
/* 87B24 80097324 02000386 */  lh         $v1, 0x2($s0)
/* 87B28 80097328 0200C584 */  lh         $a1, 0x2($a2)
/* 87B2C 8009732C 0400C684 */  lh         $a2, 0x4($a2)
/* 87B30 80097330 23204400 */  subu       $a0, $v0, $a0
/* 87B34 80097334 04000286 */  lh         $v0, 0x4($s0)
/* 87B38 80097338 23286500 */  subu       $a1, $v1, $a1
/* 87B3C 8009733C B7E6000C */  jal        MATH3D_LengthXYZ
/* 87B40 80097340 23304600 */   subu      $a2, $v0, $a2
/* 87B44 80097344 D45C0208 */  j          .L80097350
/* 87B48 80097348 00000000 */   nop
.L8009734C:
/* 87B4C 8009734C FFFF4234 */  ori        $v0, $v0, (0x7FFFFFFF & 0xFFFF)
.L80097350:
/* 87B50 80097350 1800BF8F */  lw         $ra, 0x18($sp)
/* 87B54 80097354 1400B18F */  lw         $s1, 0x14($sp)
/* 87B58 80097358 1000B08F */  lw         $s0, 0x10($sp)
/* 87B5C 8009735C 0800E003 */  jr         $ra
/* 87B60 80097360 2000BD27 */   addiu     $sp, $sp, 0x20
.size PLAN_CalcMinDistFromExistingNodes, . - PLAN_CalcMinDistFromExistingNodes
