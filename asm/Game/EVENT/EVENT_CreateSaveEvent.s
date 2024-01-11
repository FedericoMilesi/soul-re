.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_CreateSaveEvent
/* 582A8 80067AA8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 582AC 80067AAC 1000B0AF */  sw         $s0, 0x10($sp)
/* 582B0 80067AB0 21808000 */  addu       $s0, $a0, $zero
/* 582B4 80067AB4 1400B1AF */  sw         $s1, 0x14($sp)
/* 582B8 80067AB8 2188A000 */  addu       $s1, $a1, $zero
/* 582BC 80067ABC 09000424 */  addiu      $a0, $zero, 0x9
/* 582C0 80067AC0 1800BFAF */  sw         $ra, 0x18($sp)
/* 582C4 80067AC4 E1D4020C */  jal        SAVE_GetSavedBlock
/* 582C8 80067AC8 21280000 */   addu      $a1, $zero, $zero
/* 582CC 80067ACC 21284000 */  addu       $a1, $v0, $zero
/* 582D0 80067AD0 0A00A010 */  beqz       $a1, .L80067AFC
/* 582D4 80067AD4 09000224 */   addiu     $v0, $zero, 0x9
/* 582D8 80067AD8 04000424 */  addiu      $a0, $zero, 0x4
/* 582DC 80067ADC 2118A400 */  addu       $v1, $a1, $a0
/* 582E0 80067AE0 0000A2A0 */  sb         $v0, 0x0($a1)
/* 582E4 80067AE4 0200B0A4 */  sh         $s0, 0x2($a1)
/* 582E8 80067AE8 0400B1A0 */  sb         $s1, 0x4($a1)
.L80067AEC:
/* 582EC 80067AEC 050060A0 */  sb         $zero, 0x5($v1)
/* 582F0 80067AF0 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 582F4 80067AF4 FDFF8104 */  bgez       $a0, .L80067AEC
/* 582F8 80067AF8 FFFF6324 */   addiu     $v1, $v1, -0x1
.L80067AFC:
/* 582FC 80067AFC 1800BF8F */  lw         $ra, 0x18($sp)
/* 58300 80067B00 1400B18F */  lw         $s1, 0x14($sp)
/* 58304 80067B04 1000B08F */  lw         $s0, 0x10($sp)
/* 58308 80067B08 2110A000 */  addu       $v0, $a1, $zero
/* 5830C 80067B0C 0800E003 */  jr         $ra
/* 58310 80067B10 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_CreateSaveEvent, . - EVENT_CreateSaveEvent
