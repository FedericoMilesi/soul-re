.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawFField
/* 3F408 8004EC08 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 3F40C 8004EC0C 6800B2AF */  sw         $s2, 0x68($sp)
/* 3F410 8004EC10 21908000 */  addu       $s2, $a0, $zero
/* 3F414 8004EC14 6000B0AF */  sw         $s0, 0x60($sp)
/* 3F418 8004EC18 2180A000 */  addu       $s0, $a1, $zero
/* 3F41C 8004EC1C 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 3F420 8004EC20 6400B1AF */  sw         $s1, 0x64($sp)
/* 3F424 8004EC24 0800048E */  lw         $a0, 0x8($s0)
/* 3F428 8004EC28 10000396 */  lhu        $v1, 0x10($s0)
/* 3F42C 8004EC2C 5C008294 */  lhu        $v0, 0x5C($a0)
/* 3F430 8004EC30 00000000 */  nop
/* 3F434 8004EC34 21104300 */  addu       $v0, $v0, $v1
/* 3F438 8004EC38 5000A2A7 */  sh         $v0, 0x50($sp)
/* 3F43C 8004EC3C 5E008294 */  lhu        $v0, 0x5E($a0)
/* 3F440 8004EC40 12000396 */  lhu        $v1, 0x12($s0)
/* 3F444 8004EC44 00000000 */  nop
/* 3F448 8004EC48 21104300 */  addu       $v0, $v0, $v1
/* 3F44C 8004EC4C 5200A2A7 */  sh         $v0, 0x52($sp)
/* 3F450 8004EC50 60008294 */  lhu        $v0, 0x60($a0)
/* 3F454 8004EC54 14000396 */  lhu        $v1, 0x14($s0)
/* 3F458 8004EC58 00000000 */  nop
/* 3F45C 8004EC5C 21104300 */  addu       $v0, $v0, $v1
/* 3F460 8004EC60 5400A2A7 */  sh         $v0, 0x54($sp)
/* 3F464 8004EC64 1E000486 */  lh         $a0, 0x1E($s0)
/* 3F468 8004EC68 DCE4010C */  jal        func_80079370
/* 3F46C 8004EC6C 5800A0AF */   sw        $zero, 0x58($sp)
/* 3F470 8004EC70 1C000386 */  lh         $v1, 0x1C($s0)
/* 3F474 8004EC74 00000000 */  nop
/* 3F478 8004EC78 18004300 */  mult       $v0, $v1
/* 3F47C 8004EC7C 1E000296 */  lhu        $v0, 0x1E($s0)
/* 3F480 8004EC80 20000396 */  lhu        $v1, 0x20($s0)
/* 3F484 8004EC84 00000000 */  nop
/* 3F488 8004EC88 21104300 */  addu       $v0, $v0, $v1
/* 3F48C 8004EC8C 1A000386 */  lh         $v1, 0x1A($s0)
/* 3F490 8004EC90 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 3F494 8004EC94 1E0002A6 */  sh         $v0, 0x1E($s0)
/* 3F498 8004EC98 12400000 */  mflo       $t0
/* 3F49C 8004EC9C 03130800 */  sra        $v0, $t0, 12
/* 3F4A0 8004ECA0 21886200 */  addu       $s1, $v1, $v0
/* 3F4A4 8004ECA4 22000286 */  lh         $v0, 0x22($s0)
/* 3F4A8 8004ECA8 22000396 */  lhu        $v1, 0x22($s0)
/* 3F4AC 8004ECAC 09004010 */  beqz       $v0, .L8004ECD4
/* 3F4B0 8004ECB0 80FF6224 */   addiu     $v0, $v1, -0x80
/* 3F4B4 8004ECB4 220002A6 */  sh         $v0, 0x22($s0)
/* 3F4B8 8004ECB8 00140200 */  sll        $v0, $v0, 16
/* 3F4BC 8004ECBC 02004104 */  bgez       $v0, .L8004ECC8
/* 3F4C0 8004ECC0 00000000 */   nop
/* 3F4C4 8004ECC4 220000A6 */  sh         $zero, 0x22($s0)
.L8004ECC8:
/* 3F4C8 8004ECC8 22000296 */  lhu        $v0, 0x22($s0)
/* 3F4CC 8004ECCC 453B0108 */  j          .L8004ED14
/* 3F4D0 8004ECD0 00140200 */   sll       $v0, $v0, 16
.L8004ECD4:
/* 3F4D4 8004ECD4 24000286 */  lh         $v0, 0x24($s0)
/* 3F4D8 8004ECD8 24000396 */  lhu        $v1, 0x24($s0)
/* 3F4DC 8004ECDC 0B004010 */  beqz       $v0, .L8004ED0C
/* 3F4E0 8004ECE0 00FE6324 */   addiu     $v1, $v1, -0x200
/* 3F4E4 8004ECE4 00140300 */  sll        $v0, $v1, 16
/* 3F4E8 8004ECE8 0500401C */  bgtz       $v0, .L8004ED00
/* 3F4EC 8004ECEC 240003A6 */   sh        $v1, 0x24($s0)
/* 3F4F0 8004ECF0 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3F4F4 8004ECF4 21200002 */   addu      $a0, $s0, $zero
/* 3F4F8 8004ECF8 793B0108 */  j          .L8004EDE4
/* 3F4FC 8004ECFC 00000000 */   nop
.L8004ED00:
/* 3F500 8004ED00 00100224 */  addiu      $v0, $zero, 0x1000
/* 3F504 8004ED04 443B0108 */  j          .L8004ED10
/* 3F508 8004ED08 23104300 */   subu      $v0, $v0, $v1
.L8004ED0C:
/* 3F50C 8004ED0C 21100000 */  addu       $v0, $zero, $zero
.L8004ED10:
/* 3F510 8004ED10 00140200 */  sll        $v0, $v0, 16
.L8004ED14:
/* 3F514 8004ED14 033C0200 */  sra        $a3, $v0, 16
/* 3F518 8004ED18 0900E010 */  beqz       $a3, .L8004ED40
/* 3F51C 8004ED1C 5C00A227 */   addiu     $v0, $sp, 0x5C
/* 3F520 8004ED20 1000A2AF */  sw         $v0, 0x10($sp)
/* 3F524 8004ED24 28000426 */  addiu      $a0, $s0, 0x28
/* 3F528 8004ED28 5800A527 */  addiu      $a1, $sp, 0x58
/* 3F52C 8004ED2C 00100624 */  addiu      $a2, $zero, 0x1000
/* 3F530 8004ED30 A8F3020C */  jal        func_800BCEA0
/* 3F534 8004ED34 2330C700 */   subu      $a2, $a2, $a3
/* 3F538 8004ED38 543B0108 */  j          .L8004ED50
/* 3F53C 8004ED3C FF00033C */   lui       $v1, (0xFFFFFF >> 16)
.L8004ED40:
/* 3F540 8004ED40 2800028E */  lw         $v0, 0x28($s0)
/* 3F544 8004ED44 00000000 */  nop
/* 3F548 8004ED48 5C00A2AF */  sw         $v0, 0x5C($sp)
/* 3F54C 8004ED4C FF00033C */  lui        $v1, (0xFFFFFF >> 16)
.L8004ED50:
/* 3F550 8004ED50 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 3F554 8004ED54 5C00A28F */  lw         $v0, 0x5C($sp)
/* 3F558 8004ED58 3000A427 */  addiu      $a0, $sp, 0x30
/* 3F55C 8004ED5C 24104300 */  and        $v0, $v0, $v1
/* 3F560 8004ED60 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 3F564 8004ED64 5C00A2AF */   sw        $v0, 0x5C($sp)
/* 3F568 8004ED68 00040424 */  addiu      $a0, $zero, 0x400
/* 3F56C 8004ED6C 32E4010C */  jal        func_800790C8
/* 3F570 8004ED70 3000A527 */   addiu     $a1, $sp, 0x30
/* 3F574 8004ED74 0D000392 */  lbu        $v1, 0xD($s0)
/* 3F578 8004ED78 01000224 */  addiu      $v0, $zero, 0x1
/* 3F57C 8004ED7C 05006214 */  bne        $v1, $v0, .L8004ED94
/* 3F580 8004ED80 00000000 */   nop
/* 3F584 8004ED84 F4E9000C */  jal        PIPE3D_AspectAdjustMatrix
/* 3F588 8004ED88 3000A427 */   addiu     $a0, $sp, 0x30
/* 3F58C 8004ED8C 693B0108 */  j          .L8004EDA4
/* 3F590 8004ED90 21204002 */   addu      $a0, $s2, $zero
.L8004ED94:
/* 3F594 8004ED94 40AD8487 */  lh         $a0, %gp_rel(theCamera + 0xB0)($gp)
/* 3F598 8004ED98 98E3010C */  jal        func_80078E60
/* 3F59C 8004ED9C 3000A527 */   addiu     $a1, $sp, 0x30
/* 3F5A0 8004EDA0 21204002 */  addu       $a0, $s2, $zero
.L8004EDA4:
/* 3F5A4 8004EDA4 5000A527 */  addiu      $a1, $sp, 0x50
/* 3F5A8 8004EDA8 18000786 */  lh         $a3, 0x18($s0)
/* 3F5AC 8004EDAC 3000A627 */  addiu      $a2, $sp, 0x30
/* 3F5B0 8004EDB0 1000A7AF */  sw         $a3, 0x10($sp)
/* 3F5B4 8004EDB4 18000286 */  lh         $v0, 0x18($s0)
/* 3F5B8 8004EDB8 2338F100 */  subu       $a3, $a3, $s1
/* 3F5BC 8004EDBC 1800A0AF */  sw         $zero, 0x18($sp)
/* 3F5C0 8004EDC0 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 3F5C4 8004EDC4 2000A0AF */  sw         $zero, 0x20($sp)
/* 3F5C8 8004EDC8 23105100 */  subu       $v0, $v0, $s1
/* 3F5CC 8004EDCC 1400A2AF */  sw         $v0, 0x14($sp)
/* 3F5D0 8004EDD0 5C00A38F */  lw         $v1, 0x5C($sp)
/* 3F5D4 8004EDD4 01000224 */  addiu      $v0, $zero, 0x1
/* 3F5D8 8004EDD8 2800A2AF */  sw         $v0, 0x28($sp)
/* 3F5DC 8004EDDC 5039010C */  jal        FX_DrawRing
/* 3F5E0 8004EDE0 2400A3AF */   sw        $v1, 0x24($sp)
.L8004EDE4:
/* 3F5E4 8004EDE4 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 3F5E8 8004EDE8 6800B28F */  lw         $s2, 0x68($sp)
/* 3F5EC 8004EDEC 6400B18F */  lw         $s1, 0x64($sp)
/* 3F5F0 8004EDF0 6000B08F */  lw         $s0, 0x60($sp)
/* 3F5F4 8004EDF4 0800E003 */  jr         $ra
/* 3F5F8 8004EDF8 7000BD27 */   addiu     $sp, $sp, 0x70
.size FX_DrawFField, . - FX_DrawFField
