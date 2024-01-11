.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_ApplyControllersToStoredFrame
/* 8141C 80090C1C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 81420 80090C20 1800B2AF */  sw         $s2, 0x18($sp)
/* 81424 80090C24 21908000 */  addu       $s2, $a0, $zero
/* 81428 80090C28 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 8142C 80090C2C 1400B1AF */  sw         $s1, 0x14($sp)
/* 81430 80090C30 1000B0AF */  sw         $s0, 0x10($sp)
/* 81434 80090C34 00004292 */  lbu        $v0, 0x0($s2)
/* 81438 80090C38 00000000 */  nop
/* 8143C 80090C3C 09004010 */  beqz       $v0, .L80090C64
/* 81440 80090C40 21800000 */   addu      $s0, $zero, $zero
/* 81444 80090C44 24001124 */  addiu      $s1, $zero, 0x24
.L80090C48:
/* 81448 80090C48 C045020C */  jal        _G2AnimSection_ApplyControllersToStoredFrame
/* 8144C 80090C4C 21205102 */   addu      $a0, $s2, $s1
/* 81450 80090C50 00004292 */  lbu        $v0, 0x0($s2)
/* 81454 80090C54 01001026 */  addiu      $s0, $s0, 0x1
/* 81458 80090C58 2A100202 */  slt        $v0, $s0, $v0
/* 8145C 80090C5C FAFF4014 */  bnez       $v0, .L80090C48
/* 81460 80090C60 30003126 */   addiu     $s1, $s1, 0x30
.L80090C64:
/* 81464 80090C64 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 81468 80090C68 1800B28F */  lw         $s2, 0x18($sp)
/* 8146C 80090C6C 1400B18F */  lw         $s1, 0x14($sp)
/* 81470 80090C70 1000B08F */  lw         $s0, 0x10($sp)
/* 81474 80090C74 0800E003 */  jr         $ra
/* 81478 80090C78 2000BD27 */   addiu     $sp, $sp, 0x20
.size _G2Anim_ApplyControllersToStoredFrame, . - _G2Anim_ApplyControllersToStoredFrame
