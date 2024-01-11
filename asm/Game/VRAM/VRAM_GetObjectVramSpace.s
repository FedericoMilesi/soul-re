.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_GetObjectVramSpace
/* 64B08 80074308 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 64B0C 8007430C 21188000 */  addu       $v1, $a0, $zero
/* 64B10 80074310 3400B5AF */  sw         $s5, 0x34($sp)
/* 64B14 80074314 21A8A000 */  addu       $s5, $a1, $zero
/* 64B18 80074318 3000B4AF */  sw         $s4, 0x30($sp)
/* 64B1C 8007431C 01001424 */  addiu      $s4, $zero, 0x1
/* 64B20 80074320 1800A427 */  addiu      $a0, $sp, 0x18
/* 64B24 80074324 2400B1AF */  sw         $s1, 0x24($sp)
/* 64B28 80074328 1A00B127 */  addiu      $s1, $sp, 0x1A
/* 64B2C 8007432C 3800BFAF */  sw         $ra, 0x38($sp)
/* 64B30 80074330 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 64B34 80074334 2800B2AF */  sw         $s2, 0x28($sp)
/* 64B38 80074338 2000B0AF */  sw         $s0, 0x20($sp)
/* 64B3C 8007433C 00006294 */  lhu        $v0, 0x0($v1)
/* 64B40 80074340 21282002 */  addu       $a1, $s1, $zero
/* 64B44 80074344 00024224 */  addiu      $v0, $v0, 0x200
/* 64B48 80074348 1800A2A7 */  sh         $v0, 0x18($sp)
/* 64B4C 8007434C 02006294 */  lhu        $v0, 0x2($v1)
/* 64B50 80074350 02001324 */  addiu      $s3, $zero, 0x2
/* 64B54 80074354 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 64B58 80074358 04006694 */  lhu        $a2, 0x4($v1)
/* 64B5C 8007435C 00011224 */  addiu      $s2, $zero, 0x100
/* 64B60 80074360 1C00A6A7 */  sh         $a2, 0x1C($sp)
/* 64B64 80074364 00340600 */  sll        $a2, $a2, 16
/* 64B68 80074368 06006294 */  lhu        $v0, 0x6($v1)
/* 64B6C 8007436C 03340600 */  sra        $a2, $a2, 16
/* 64B70 80074370 003C0200 */  sll        $a3, $v0, 16
/* 64B74 80074374 033C0700 */  sra        $a3, $a3, 16
/* 64B78 80074378 1E00A2A7 */  sh         $v0, 0x1E($sp)
/* 64B7C 8007437C 1000B3AF */  sw         $s3, 0x10($sp)
/* 64B80 80074380 80CD010C */  jal        VRAM_CheckVramSlot
/* 64B84 80074384 1400B2AF */   sw        $s2, 0x14($sp)
/* 64B88 80074388 21804000 */  addu       $s0, $v0, $zero
/* 64B8C 8007438C 0F000016 */  bnez       $s0, .L800743CC
/* 64B90 80074390 00000000 */   nop
/* 64B94 80074394 2ECF010C */  jal        VRAM_RearrangeVramsLayer
/* 64B98 80074398 21208002 */   addu      $a0, $s4, $zero
/* 64B9C 8007439C 1800A427 */  addiu      $a0, $sp, 0x18
/* 64BA0 800743A0 1C00A687 */  lh         $a2, 0x1C($sp)
/* 64BA4 800743A4 1E00A787 */  lh         $a3, 0x1E($sp)
/* 64BA8 800743A8 21282002 */  addu       $a1, $s1, $zero
/* 64BAC 800743AC 1000B3AF */  sw         $s3, 0x10($sp)
/* 64BB0 800743B0 80CD010C */  jal        VRAM_CheckVramSlot
/* 64BB4 800743B4 1400B2AF */   sw        $s2, 0x14($sp)
/* 64BB8 800743B8 21804000 */  addu       $s0, $v0, $zero
/* 64BBC 800743BC 03000016 */  bnez       $s0, .L800743CC
/* 64BC0 800743C0 00000000 */   nop
/* 64BC4 800743C4 93CB010C */  jal        VRAM_PrintInfo
/* 64BC8 800743C8 21A00000 */   addu      $s4, $zero, $zero
.L800743CC:
/* 64BCC 800743CC 02000012 */  beqz       $s0, .L800743D8
/* 64BD0 800743D0 1800B0AE */   sw        $s0, 0x18($s5)
/* 64BD4 800743D4 180015AE */  sw         $s5, 0x18($s0)
.L800743D8:
/* 64BD8 800743D8 21108002 */  addu       $v0, $s4, $zero
/* 64BDC 800743DC 3800BF8F */  lw         $ra, 0x38($sp)
/* 64BE0 800743E0 3400B58F */  lw         $s5, 0x34($sp)
/* 64BE4 800743E4 3000B48F */  lw         $s4, 0x30($sp)
/* 64BE8 800743E8 2C00B38F */  lw         $s3, 0x2C($sp)
/* 64BEC 800743EC 2800B28F */  lw         $s2, 0x28($sp)
/* 64BF0 800743F0 2400B18F */  lw         $s1, 0x24($sp)
/* 64BF4 800743F4 2000B08F */  lw         $s0, 0x20($sp)
/* 64BF8 800743F8 0800E003 */  jr         $ra
/* 64BFC 800743FC 4000BD27 */   addiu     $sp, $sp, 0x40
.size VRAM_GetObjectVramSpace, . - VRAM_GetObjectVramSpace
