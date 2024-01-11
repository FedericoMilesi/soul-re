.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_AttachControllerToSeg
/* 80C58 80090458 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80C5C 8009045C 1000B0AF */  sw         $s0, 0x10($sp)
/* 80C60 80090460 21808000 */  addu       $s0, $a0, $zero
/* 80C64 80090464 2120A000 */  addu       $a0, $a1, $zero
/* 80C68 80090468 1400BFAF */  sw         $ra, 0x14($sp)
/* 80C6C 8009046C 2147020C */  jal        _G2AnimController_Create
/* 80C70 80090470 2128C000 */   addu      $a1, $a2, $zero
/* 80C74 80090474 21204000 */  addu       $a0, $v0, $zero
/* 80C78 80090478 5447020C */  jal        _G2AnimController_InsertIntoList
/* 80C7C 8009047C 02000526 */   addiu     $a1, $s0, 0x2
/* 80C80 80090480 1400BF8F */  lw         $ra, 0x14($sp)
/* 80C84 80090484 1000B08F */  lw         $s0, 0x10($sp)
/* 80C88 80090488 0800E003 */  jr         $ra
/* 80C8C 8009048C 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_AttachControllerToSeg, . - G2Anim_AttachControllerToSeg
