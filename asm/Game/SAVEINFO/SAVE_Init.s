.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_Init
/* A5B00 800B5300 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A5B04 800B5304 1800B0AF */  sw         $s0, 0x18($sp)
/* A5B08 800B5308 21808000 */  addu       $s0, $a0, $zero
/* A5B0C 800B530C 00600424 */  addiu      $a0, $zero, 0x6000
/* A5B10 800B5310 12000524 */  addiu      $a1, $zero, 0x12
/* A5B14 800B5314 2000BFAF */  sw         $ra, 0x20($sp)
/* A5B18 800B5318 8140010C */  jal        MEMPACK_Malloc
/* A5B1C 800B531C 1C00B1AF */   sw        $s1, 0x1C($sp)
/* A5B20 800B5320 B495838F */  lw         $v1, %gp_rel(DoMainMenu)($gp)
/* A5B24 800B5324 00000000 */  nop
/* A5B28 800B5328 0D006010 */  beqz       $v1, .L800B5360
/* A5B2C 800B532C 21884000 */   addu      $s1, $v0, $zero
/* A5B30 800B5330 0E80043C */  lui        $a0, %hi(gMemcard)
/* A5B34 800B5334 08BD8424 */  addiu      $a0, $a0, %lo(gMemcard)
/* A5B38 800B5338 21280002 */  addu       $a1, $s0, $zero
/* A5B3C 800B533C 00600224 */  addiu      $v0, $zero, 0x6000
/* A5B40 800B5340 03000624 */  addiu      $a2, $zero, 0x3
/* A5B44 800B5344 21382002 */  addu       $a3, $s1, $zero
/* A5B48 800B5348 240004AE */  sw         $a0, 0x24($s0)
/* A5B4C 800B534C B6E5020C */  jal        memcard_initialize
/* A5B50 800B5350 1000A2AF */   sw        $v0, 0x10($sp)
/* A5B54 800B5354 48A882AF */  sw         $v0, %gp_rel(the_header_size)($gp)
/* A5B58 800B5358 D9D40208 */  j          .L800B5364
/* A5B5C 800B535C 00000000 */   nop
.L800B5360:
/* A5B60 800B5360 240000AE */  sw         $zero, 0x24($s0)
.L800B5364:
/* A5B64 800B5364 DCFD91AF */  sw         $s1, %gp_rel(savedInfoTracker)($gp)
/* A5B68 800B5368 A0D4020C */  jal        SAVE_ClearMemory
/* A5B6C 800B536C 21200002 */   addu      $a0, $s0, $zero
/* A5B70 800B5370 2000BF8F */  lw         $ra, 0x20($sp)
/* A5B74 800B5374 1C00B18F */  lw         $s1, 0x1C($sp)
/* A5B78 800B5378 1800B08F */  lw         $s0, 0x18($sp)
/* A5B7C 800B537C 0800E003 */  jr         $ra
/* A5B80 800B5380 2800BD27 */   addiu     $sp, $sp, 0x28
.size SAVE_Init, . - SAVE_Init
