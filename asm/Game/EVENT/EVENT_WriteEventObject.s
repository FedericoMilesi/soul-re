.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_WriteEventObject
/* 524C8 80061CC8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 524CC 80061CCC 1000B0AF */  sw         $s0, 0x10($sp)
/* 524D0 80061CD0 21808000 */  addu       $s0, $a0, $zero
/* 524D4 80061CD4 1400B1AF */  sw         $s1, 0x14($sp)
/* 524D8 80061CD8 2188A000 */  addu       $s1, $a1, $zero
/* 524DC 80061CDC 1800B2AF */  sw         $s2, 0x18($sp)
/* 524E0 80061CE0 2190E000 */  addu       $s2, $a3, $zero
/* 524E4 80061CE4 21200000 */  addu       $a0, $zero, $zero
/* 524E8 80061CE8 0600C010 */  beqz       $a2, .L80061D04
/* 524EC 80061CEC 1C00BFAF */   sw        $ra, 0x1C($sp)
/* 524F0 80061CF0 10000224 */  addiu      $v0, $zero, 0x10
/* 524F4 80061CF4 000002AE */  sw         $v0, 0x0($s0)
/* 524F8 80061CF8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 524FC 80061CFC 56870108 */  j          .L80061D58
/* 52500 80061D00 040006AE */   sw        $a2, 0x4($s0)
.L80061D04:
/* 52504 80061D04 21202002 */  addu       $a0, $s1, $zero
/* 52508 80061D08 1CD6020C */  jal        SAVE_GetSavedEvent
/* 5250C 80061D0C 21284002 */   addu      $a1, $s2, $zero
/* 52510 80061D10 21184000 */  addu       $v1, $v0, $zero
/* 52514 80061D14 06006010 */  beqz       $v1, .L80061D30
/* 52518 80061D18 01000424 */   addiu     $a0, $zero, 0x1
/* 5251C 80061D1C 15000224 */  addiu      $v0, $zero, 0x15
/* 52520 80061D20 000002AE */  sw         $v0, 0x0($s0)
/* 52524 80061D24 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 52528 80061D28 54870108 */  j          .L80061D50
/* 5252C 80061D2C 040003AE */   sw        $v1, 0x4($s0)
.L80061D30:
/* 52530 80061D30 21202002 */  addu       $a0, $s1, $zero
/* 52534 80061D34 21284002 */  addu       $a1, $s2, $zero
/* 52538 80061D38 15000224 */  addiu      $v0, $zero, 0x15
/* 5253C 80061D3C AA9E010C */  jal        EVENT_CreateSaveEvent
/* 52540 80061D40 000002AE */   sw        $v0, 0x0($s0)
/* 52544 80061D44 01000424 */  addiu      $a0, $zero, 0x1
/* 52548 80061D48 040002AE */  sw         $v0, 0x4($s0)
/* 5254C 80061D4C FFFF0224 */  addiu      $v0, $zero, -0x1
.L80061D50:
/* 52550 80061D50 0C0011AE */  sw         $s1, 0xC($s0)
/* 52554 80061D54 100012AE */  sw         $s2, 0x10($s0)
.L80061D58:
/* 52558 80061D58 080002AE */  sw         $v0, 0x8($s0)
/* 5255C 80061D5C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 52560 80061D60 1800B28F */  lw         $s2, 0x18($sp)
/* 52564 80061D64 1400B18F */  lw         $s1, 0x14($sp)
/* 52568 80061D68 1000B08F */  lw         $s0, 0x10($sp)
/* 5256C 80061D6C 21108000 */  addu       $v0, $a0, $zero
/* 52570 80061D70 0800E003 */  jr         $ra
/* 52574 80061D74 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_WriteEventObject, . - EVENT_WriteEventObject
