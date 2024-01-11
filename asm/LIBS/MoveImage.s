.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveImage
/* AAEB0 800BA6B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AAEB4 800BA6B4 1000B0AF */  sw         $s0, 0x10($sp)
/* AAEB8 800BA6B8 21808000 */  addu       $s0, $a0, $zero
/* AAEBC 800BA6BC 1800B2AF */  sw         $s2, 0x18($sp)
/* AAEC0 800BA6C0 2190A000 */  addu       $s2, $a1, $zero
/* AAEC4 800BA6C4 1400B1AF */  sw         $s1, 0x14($sp)
/* AAEC8 800BA6C8 2188C000 */  addu       $s1, $a2, $zero
/* AAECC 800BA6CC 0180043C */  lui        $a0, %hi(D_80012688)
/* AAED0 800BA6D0 88268424 */  addiu      $a0, $a0, %lo(D_80012688)
/* AAED4 800BA6D4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* AAED8 800BA6D8 29E9020C */  jal        func_800BA4A4
/* AAEDC 800BA6DC 21280002 */   addu      $a1, $s0, $zero
/* AAEE0 800BA6E0 04000286 */  lh         $v0, 0x4($s0)
/* AAEE4 800BA6E4 00000000 */  nop
/* AAEE8 800BA6E8 19004010 */  beqz       $v0, .L800BA750
/* AAEEC 800BA6EC FFFF0224 */   addiu     $v0, $zero, -0x1
/* AAEF0 800BA6F0 06000286 */  lh         $v0, 0x6($s0)
/* AAEF4 800BA6F4 00000000 */  nop
/* AAEF8 800BA6F8 03004014 */  bnez       $v0, .L800BA708
/* AAEFC 800BA6FC 00141100 */   sll       $v0, $s1, 16
/* AAF00 800BA700 D4E90208 */  j          .L800BA750
/* AAF04 800BA704 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800BA708:
/* AAF08 800BA708 0D80033C */  lui        $v1, %hi(GEnv + 0xA0)
/* AAF0C 800BA70C ACDA6324 */  addiu      $v1, $v1, %lo(GEnv + 0xA0)
/* AAF10 800BA710 FFFF4432 */  andi       $a0, $s2, 0xFFFF
/* AAF14 800BA714 25104400 */  or         $v0, $v0, $a0
/* AAF18 800BA718 0000058E */  lw         $a1, 0x0($s0)
/* AAF1C 800BA71C 0D80073C */  lui        $a3, %hi(the_attract_movies + 0x1158)
/* AAF20 800BA720 04DAE78C */  lw         $a3, %lo(the_attract_movies + 0x1158)($a3)
/* AAF24 800BA724 14000624 */  addiu      $a2, $zero, 0x14
/* AAF28 800BA728 040062AC */  sw         $v0, 0x4($v1)
/* AAF2C 800BA72C 000065AC */  sw         $a1, 0x0($v1)
/* AAF30 800BA730 0400028E */  lw         $v0, 0x4($s0)
/* AAF34 800BA734 F8FF6524 */  addiu      $a1, $v1, -0x8
/* AAF38 800BA738 080062AC */  sw         $v0, 0x8($v1)
/* AAF3C 800BA73C 1800E48C */  lw         $a0, 0x18($a3)
/* AAF40 800BA740 0800E28C */  lw         $v0, 0x8($a3)
/* AAF44 800BA744 00000000 */  nop
/* AAF48 800BA748 09F84000 */  jalr       $v0
/* AAF4C 800BA74C 21380000 */   addu      $a3, $zero, $zero
.L800BA750:
/* AAF50 800BA750 1C00BF8F */  lw         $ra, 0x1C($sp)
/* AAF54 800BA754 1800B28F */  lw         $s2, 0x18($sp)
/* AAF58 800BA758 1400B18F */  lw         $s1, 0x14($sp)
/* AAF5C 800BA75C 1000B08F */  lw         $s0, 0x10($sp)
/* AAF60 800BA760 0800E003 */  jr         $ra
/* AAF64 800BA764 2000BD27 */   addiu     $sp, $sp, 0x20
.size MoveImage, . - MoveImage
