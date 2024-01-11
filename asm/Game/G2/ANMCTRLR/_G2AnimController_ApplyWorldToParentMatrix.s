.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimController_ApplyWorldToParentMatrix
/* 82174 80091974 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 82178 80091978 4800B0AF */  sw         $s0, 0x48($sp)
/* 8217C 8009197C 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 82180 80091980 02008390 */  lbu        $v1, 0x2($a0)
/* 82184 80091984 20000224 */  addiu      $v0, $zero, 0x20
/* 82188 80091988 2E006210 */  beq        $v1, $v0, .L80091A44
/* 8218C 8009198C 2180A000 */   addu      $s0, $a1, $zero
/* 82190 80091990 21006228 */  slti       $v0, $v1, 0x21
/* 82194 80091994 05004010 */  beqz       $v0, .L800919AC
/* 82198 80091998 08000224 */   addiu     $v0, $zero, 0x8
/* 8219C 8009199C 11006210 */  beq        $v1, $v0, .L800919E4
/* 821A0 800919A0 00000000 */   nop
/* 821A4 800919A4 AD460208 */  j          .L80091AB4
/* 821A8 800919A8 00000000 */   nop
.L800919AC:
/* 821AC 800919AC 54000224 */  addiu      $v0, $zero, 0x54
/* 821B0 800919B0 17006210 */  beq        $v1, $v0, .L80091A10
/* 821B4 800919B4 55006228 */   slti      $v0, $v1, 0x55
/* 821B8 800919B8 05004010 */  beqz       $v0, .L800919D0
/* 821BC 800919BC 4C000224 */   addiu     $v0, $zero, 0x4C
/* 821C0 800919C0 0C006210 */  beq        $v1, $v0, .L800919F4
/* 821C4 800919C4 00000000 */   nop
/* 821C8 800919C8 AD460208 */  j          .L80091AB4
/* 821CC 800919CC 00000000 */   nop
.L800919D0:
/* 821D0 800919D0 64000224 */  addiu      $v0, $zero, 0x64
/* 821D4 800919D4 26006210 */  beq        $v1, $v0, .L80091A70
/* 821D8 800919D8 00000000 */   nop
/* 821DC 800919DC AD460208 */  j          .L80091AB4
/* 821E0 800919E0 00000000 */   nop
.L800919E4:
/* 821E4 800919E4 B246020C */  jal        _G2AnimController_GetMatrix
/* 821E8 800919E8 21280002 */   addu      $a1, $s0, $zero
/* 821EC 800919EC AD460208 */  j          .L80091AB4
/* 821F0 800919F0 00000000 */   nop
.L800919F4:
/* 821F4 800919F4 B246020C */  jal        _G2AnimController_GetMatrix
/* 821F8 800919F8 1000A527 */   addiu     $a1, $sp, 0x10
/* 821FC 800919FC 1000A427 */  addiu      $a0, $sp, 0x10
/* 82200 80091A00 15FD020C */  jal        func_800BF454
/* 82204 80091A04 21280002 */   addu      $a1, $s0, $zero
/* 82208 80091A08 AD460208 */  j          .L80091AB4
/* 8220C 80091A0C 00000000 */   nop
.L80091A10:
/* 82210 80091A10 E846020C */  jal        _G2AnimController_GetVector
/* 82214 80091A14 3000A527 */   addiu     $a1, $sp, 0x30
/* 82218 80091A18 21200002 */  addu       $a0, $s0, $zero
/* 8221C 80091A1C 3000A287 */  lh         $v0, 0x30($sp)
/* 82220 80091A20 3200A387 */  lh         $v1, 0x32($sp)
/* 82224 80091A24 3400A687 */  lh         $a2, 0x34($sp)
/* 82228 80091A28 3800A527 */  addiu      $a1, $sp, 0x38
/* 8222C 80091A2C 3800A2AF */  sw         $v0, 0x38($sp)
/* 82230 80091A30 3C00A3AF */  sw         $v1, 0x3C($sp)
/* 82234 80091A34 96E4010C */  jal        func_80079258
/* 82238 80091A38 4000A6AF */   sw        $a2, 0x40($sp)
/* 8223C 80091A3C AD460208 */  j          .L80091AB4
/* 82240 80091A40 00000000 */   nop
.L80091A44:
/* 82244 80091A44 E846020C */  jal        _G2AnimController_GetVector
/* 82248 80091A48 3000A527 */   addiu     $a1, $sp, 0x30
/* 8224C 80091A4C 3000A287 */  lh         $v0, 0x30($sp)
/* 82250 80091A50 00000000 */  nop
/* 82254 80091A54 140002AE */  sw         $v0, 0x14($s0)
/* 82258 80091A58 3200A287 */  lh         $v0, 0x32($sp)
/* 8225C 80091A5C 00000000 */  nop
/* 82260 80091A60 180002AE */  sw         $v0, 0x18($s0)
/* 82264 80091A64 3400A287 */  lh         $v0, 0x34($sp)
/* 82268 80091A68 AD460208 */  j          .L80091AB4
/* 8226C 80091A6C 1C0002AE */   sw        $v0, 0x1C($s0)
.L80091A70:
/* 82270 80091A70 E846020C */  jal        _G2AnimController_GetVector
/* 82274 80091A74 3000A527 */   addiu     $a1, $sp, 0x30
/* 82278 80091A78 3000A387 */  lh         $v1, 0x30($sp)
/* 8227C 80091A7C 1400028E */  lw         $v0, 0x14($s0)
/* 82280 80091A80 00000000 */  nop
/* 82284 80091A84 21104300 */  addu       $v0, $v0, $v1
/* 82288 80091A88 140002AE */  sw         $v0, 0x14($s0)
/* 8228C 80091A8C 3200A387 */  lh         $v1, 0x32($sp)
/* 82290 80091A90 1800028E */  lw         $v0, 0x18($s0)
/* 82294 80091A94 00000000 */  nop
/* 82298 80091A98 21104300 */  addu       $v0, $v0, $v1
/* 8229C 80091A9C 180002AE */  sw         $v0, 0x18($s0)
/* 822A0 80091AA0 3400A387 */  lh         $v1, 0x34($sp)
/* 822A4 80091AA4 1C00028E */  lw         $v0, 0x1C($s0)
/* 822A8 80091AA8 00000000 */  nop
/* 822AC 80091AAC 21104300 */  addu       $v0, $v0, $v1
/* 822B0 80091AB0 1C0002AE */  sw         $v0, 0x1C($s0)
.L80091AB4:
/* 822B4 80091AB4 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 822B8 80091AB8 4800B08F */  lw         $s0, 0x48($sp)
/* 822BC 80091ABC 07000224 */  addiu      $v0, $zero, 0x7
/* 822C0 80091AC0 0800E003 */  jr         $ra
/* 822C4 80091AC4 5000BD27 */   addiu     $sp, $sp, 0x50
.size _G2AnimController_ApplyWorldToParentMatrix, . - _G2AnimController_ApplyWorldToParentMatrix
