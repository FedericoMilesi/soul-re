.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_CleanUpInstanceList
/* 232BC 80032ABC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 232C0 80032AC0 1400B1AF */  sw         $s1, 0x14($sp)
/* 232C4 80032AC4 21888000 */  addu       $s1, $a0, $zero
/* 232C8 80032AC8 1800B2AF */  sw         $s2, 0x18($sp)
/* 232CC 80032ACC 2190A000 */  addu       $s2, $a1, $zero
/* 232D0 80032AD0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 232D4 80032AD4 1000B0AF */  sw         $s0, 0x10($sp)
/* 232D8 80032AD8 0400258E */  lw         $a1, 0x4($s1)
/* 232DC 80032ADC 00000000 */  nop
/* 232E0 80032AE0 1200A010 */  beqz       $a1, .L80032B2C
/* 232E4 80032AE4 00000000 */   nop
/* 232E8 80032AE8 DFFF0424 */  addiu      $a0, $zero, -0x21
.L80032AEC:
/* 232EC 80032AEC 1400A38C */  lw         $v1, 0x14($a1)
/* 232F0 80032AF0 0800B08C */  lw         $s0, 0x8($a1)
/* 232F4 80032AF4 00046230 */  andi       $v0, $v1, 0x400
/* 232F8 80032AF8 05004014 */  bnez       $v0, .L80032B10
/* 232FC 80032AFC 20006230 */   andi      $v0, $v1, 0x20
/* 23300 80032B00 06004010 */  beqz       $v0, .L80032B1C
/* 23304 80032B04 20006234 */   ori       $v0, $v1, 0x20
/* 23308 80032B08 C7CA0008 */  j          .L80032B1C
/* 2330C 80032B0C 1400A2AC */   sw        $v0, 0x14($a1)
.L80032B10:
/* 23310 80032B10 02004010 */  beqz       $v0, .L80032B1C
/* 23314 80032B14 24106400 */   and       $v0, $v1, $a0
/* 23318 80032B18 1400A2AC */  sw         $v0, 0x14($a1)
.L80032B1C:
/* 2331C 80032B1C 21280002 */  addu       $a1, $s0, $zero
/* 23320 80032B20 F2FFA014 */  bnez       $a1, .L80032AEC
/* 23324 80032B24 00000000 */   nop
/* 23328 80032B28 0400258E */  lw         $a1, 0x4($s1)
.L80032B2C:
/* 2332C 80032B2C 00000000 */  nop
/* 23330 80032B30 0B00A010 */  beqz       $a1, .L80032B60
/* 23334 80032B34 00000000 */   nop
.L80032B38:
/* 23338 80032B38 1400A28C */  lw         $v0, 0x14($a1)
/* 2333C 80032B3C 0800B08C */  lw         $s0, 0x8($a1)
/* 23340 80032B40 20004230 */  andi       $v0, $v0, 0x20
/* 23344 80032B44 03004010 */  beqz       $v0, .L80032B54
/* 23348 80032B48 21202002 */   addu      $a0, $s1, $zero
/* 2334C 80032B4C 14CA000C */  jal        INSTANCE_ReallyRemoveInstance
/* 23350 80032B50 21304002 */   addu      $a2, $s2, $zero
.L80032B54:
/* 23354 80032B54 21280002 */  addu       $a1, $s0, $zero
/* 23358 80032B58 F7FFA014 */  bnez       $a1, .L80032B38
/* 2335C 80032B5C 00000000 */   nop
.L80032B60:
/* 23360 80032B60 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 23364 80032B64 1800B28F */  lw         $s2, 0x18($sp)
/* 23368 80032B68 1400B18F */  lw         $s1, 0x14($sp)
/* 2336C 80032B6C 1000B08F */  lw         $s0, 0x10($sp)
/* 23370 80032B70 0800E003 */  jr         $ra
/* 23374 80032B74 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_CleanUpInstanceList, . - INSTANCE_CleanUpInstanceList
