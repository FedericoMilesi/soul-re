.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawLightning
/* 3C098 8004B898 78FFBD27 */  addiu      $sp, $sp, -0x88
/* 3C09C 8004B89C 7400B1AF */  sw         $s1, 0x74($sp)
/* 3C0A0 8004B8A0 21888000 */  addu       $s1, $a0, $zero
/* 3C0A4 8004B8A4 7800B2AF */  sw         $s2, 0x78($sp)
/* 3C0A8 8004B8A8 2190A000 */  addu       $s2, $a1, $zero
/* 3C0AC 8004B8AC 7C00B3AF */  sw         $s3, 0x7C($sp)
/* 3C0B0 8004B8B0 8000BFAF */  sw         $ra, 0x80($sp)
/* 3C0B4 8004B8B4 7000B0AF */  sw         $s0, 0x70($sp)
/* 3C0B8 8004B8B8 0D002392 */  lbu        $v1, 0xD($s1)
/* 3C0BC 8004B8BC 02000224 */  addiu      $v0, $zero, 0x2
/* 3C0C0 8004B8C0 05006210 */  beq        $v1, $v0, .L8004B8D8
/* 3C0C4 8004B8C4 2198C000 */   addu      $s3, $a2, $zero
/* 3C0C8 8004B8C8 28002386 */  lh         $v1, 0x28($s1)
/* 3C0CC 8004B8CC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3C0D0 8004B8D0 0A006210 */  beq        $v1, $v0, .L8004B8FC
/* 3C0D4 8004B8D4 00000000 */   nop
.L8004B8D8:
/* 3C0D8 8004B8D8 14002296 */  lhu        $v0, 0x14($s1)
/* 3C0DC 8004B8DC 00000000 */  nop
/* 3C0E0 8004B8E0 3800A2A7 */  sh         $v0, 0x38($sp)
/* 3C0E4 8004B8E4 16002296 */  lhu        $v0, 0x16($s1)
/* 3C0E8 8004B8E8 00000000 */  nop
/* 3C0EC 8004B8EC 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 3C0F0 8004B8F0 18002296 */  lhu        $v0, 0x18($s1)
/* 3C0F4 8004B8F4 662E0108 */  j          .L8004B998
/* 3C0F8 8004B8F8 3C00A2A7 */   sh        $v0, 0x3C($sp)
.L8004B8FC:
/* 3C0FC 8004B8FC 0800228E */  lw         $v0, 0x8($s1)
/* 3C100 8004B900 00000000 */  nop
/* 3C104 8004B904 4000448C */  lw         $a0, 0x40($v0)
/* 3C108 8004B908 00000000 */  nop
/* 3C10C 8004B90C 15008010 */  beqz       $a0, .L8004B964
/* 3C110 8004B910 14002526 */   addiu     $a1, $s1, 0x14
/* 3C114 8004B914 1A002286 */  lh         $v0, 0x1A($s1)
/* 3C118 8004B918 4800A627 */  addiu      $a2, $sp, 0x48
/* 3C11C 8004B91C 40110200 */  sll        $v0, $v0, 5
/* 3C120 8004B920 21808200 */  addu       $s0, $a0, $v0
/* 3C124 8004B924 0EF3020C */  jal        ApplyMatrixSV
/* 3C128 8004B928 21200002 */   addu      $a0, $s0, $zero
/* 3C12C 8004B92C 14000296 */  lhu        $v0, 0x14($s0)
/* 3C130 8004B930 4800A397 */  lhu        $v1, 0x48($sp)
/* 3C134 8004B934 00000000 */  nop
/* 3C138 8004B938 21104300 */  addu       $v0, $v0, $v1
/* 3C13C 8004B93C 3800A2A7 */  sh         $v0, 0x38($sp)
/* 3C140 8004B940 18000296 */  lhu        $v0, 0x18($s0)
/* 3C144 8004B944 4A00A397 */  lhu        $v1, 0x4A($sp)
/* 3C148 8004B948 00000000 */  nop
/* 3C14C 8004B94C 21104300 */  addu       $v0, $v0, $v1
/* 3C150 8004B950 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 3C154 8004B954 1C000296 */  lhu        $v0, 0x1C($s0)
/* 3C158 8004B958 4C00A397 */  lhu        $v1, 0x4C($sp)
/* 3C15C 8004B95C 642E0108 */  j          .L8004B990
/* 3C160 8004B960 21104300 */   addu      $v0, $v0, $v1
.L8004B964:
/* 3C164 8004B964 5C004294 */  lhu        $v0, 0x5C($v0)
/* 3C168 8004B968 00000000 */  nop
/* 3C16C 8004B96C 3800A2A7 */  sh         $v0, 0x38($sp)
/* 3C170 8004B970 0800228E */  lw         $v0, 0x8($s1)
/* 3C174 8004B974 00000000 */  nop
/* 3C178 8004B978 5E004294 */  lhu        $v0, 0x5E($v0)
/* 3C17C 8004B97C 00000000 */  nop
/* 3C180 8004B980 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 3C184 8004B984 0800228E */  lw         $v0, 0x8($s1)
/* 3C188 8004B988 00000000 */  nop
/* 3C18C 8004B98C 60004294 */  lhu        $v0, 0x60($v0)
.L8004B990:
/* 3C190 8004B990 00000000 */  nop
/* 3C194 8004B994 3C00A2A7 */  sh         $v0, 0x3C($sp)
.L8004B998:
/* 3C198 8004B998 0D002292 */  lbu        $v0, 0xD($s1)
/* 3C19C 8004B99C 00000000 */  nop
/* 3C1A0 8004B9A0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 3C1A4 8004B9A4 0200422C */  sltiu      $v0, $v0, 0x2
/* 3C1A8 8004B9A8 05004014 */  bnez       $v0, .L8004B9C0
/* 3C1AC 8004B9AC FFFF0224 */   addiu     $v0, $zero, -0x1
/* 3C1B0 8004B9B0 28002386 */  lh         $v1, 0x28($s1)
/* 3C1B4 8004B9B4 00000000 */  nop
/* 3C1B8 8004B9B8 0A006210 */  beq        $v1, $v0, .L8004B9E4
/* 3C1BC 8004B9BC 00000000 */   nop
.L8004B9C0:
/* 3C1C0 8004B9C0 20002296 */  lhu        $v0, 0x20($s1)
/* 3C1C4 8004B9C4 00000000 */  nop
/* 3C1C8 8004B9C8 4000A2A7 */  sh         $v0, 0x40($sp)
/* 3C1CC 8004B9CC 22002296 */  lhu        $v0, 0x22($s1)
/* 3C1D0 8004B9D0 00000000 */  nop
/* 3C1D4 8004B9D4 4200A2A7 */  sh         $v0, 0x42($sp)
/* 3C1D8 8004B9D8 24002296 */  lhu        $v0, 0x24($s1)
/* 3C1DC 8004B9DC A22E0108 */  j          .L8004BA88
/* 3C1E0 8004B9E0 4400A2A7 */   sh        $v0, 0x44($sp)
.L8004B9E4:
/* 3C1E4 8004B9E4 1C00228E */  lw         $v0, 0x1C($s1)
/* 3C1E8 8004B9E8 00000000 */  nop
/* 3C1EC 8004B9EC 4000448C */  lw         $a0, 0x40($v0)
/* 3C1F0 8004B9F0 00000000 */  nop
/* 3C1F4 8004B9F4 15008010 */  beqz       $a0, .L8004BA4C
/* 3C1F8 8004B9F8 20002526 */   addiu     $a1, $s1, 0x20
/* 3C1FC 8004B9FC 26002286 */  lh         $v0, 0x26($s1)
/* 3C200 8004BA00 4800A627 */  addiu      $a2, $sp, 0x48
/* 3C204 8004BA04 40110200 */  sll        $v0, $v0, 5
/* 3C208 8004BA08 21808200 */  addu       $s0, $a0, $v0
/* 3C20C 8004BA0C 0EF3020C */  jal        ApplyMatrixSV
/* 3C210 8004BA10 21200002 */   addu      $a0, $s0, $zero
/* 3C214 8004BA14 14000296 */  lhu        $v0, 0x14($s0)
/* 3C218 8004BA18 4800A397 */  lhu        $v1, 0x48($sp)
/* 3C21C 8004BA1C 00000000 */  nop
/* 3C220 8004BA20 21104300 */  addu       $v0, $v0, $v1
/* 3C224 8004BA24 4000A2A7 */  sh         $v0, 0x40($sp)
/* 3C228 8004BA28 18000296 */  lhu        $v0, 0x18($s0)
/* 3C22C 8004BA2C 4A00A397 */  lhu        $v1, 0x4A($sp)
/* 3C230 8004BA30 00000000 */  nop
/* 3C234 8004BA34 21104300 */  addu       $v0, $v0, $v1
/* 3C238 8004BA38 4200A2A7 */  sh         $v0, 0x42($sp)
/* 3C23C 8004BA3C 1C000296 */  lhu        $v0, 0x1C($s0)
/* 3C240 8004BA40 4C00A397 */  lhu        $v1, 0x4C($sp)
/* 3C244 8004BA44 A02E0108 */  j          .L8004BA80
/* 3C248 8004BA48 21104300 */   addu      $v0, $v0, $v1
.L8004BA4C:
/* 3C24C 8004BA4C 0800228E */  lw         $v0, 0x8($s1)
/* 3C250 8004BA50 00000000 */  nop
/* 3C254 8004BA54 5C004294 */  lhu        $v0, 0x5C($v0)
/* 3C258 8004BA58 00000000 */  nop
/* 3C25C 8004BA5C 4000A2A7 */  sh         $v0, 0x40($sp)
/* 3C260 8004BA60 0800228E */  lw         $v0, 0x8($s1)
/* 3C264 8004BA64 00000000 */  nop
/* 3C268 8004BA68 5E004294 */  lhu        $v0, 0x5E($v0)
/* 3C26C 8004BA6C 00000000 */  nop
/* 3C270 8004BA70 4200A2A7 */  sh         $v0, 0x42($sp)
/* 3C274 8004BA74 0800228E */  lw         $v0, 0x8($s1)
/* 3C278 8004BA78 00000000 */  nop
/* 3C27C 8004BA7C 60004294 */  lhu        $v0, 0x60($v0)
.L8004BA80:
/* 3C280 8004BA80 00000000 */  nop
/* 3C284 8004BA84 4400A2A7 */  sh         $v0, 0x44($sp)
.L8004BA88:
/* 3C288 8004BA88 28002586 */  lh         $a1, 0x28($s1)
/* 3C28C 8004BA8C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3C290 8004BA90 0C00A210 */  beq        $a1, $v0, .L8004BAC4
/* 3C294 8004BA94 21800000 */   addu      $s0, $zero, $zero
/* 3C298 8004BA98 0800228E */  lw         $v0, 0x8($s1)
/* 3C29C 8004BA9C 00000000 */  nop
/* 3C2A0 8004BAA0 4000428C */  lw         $v0, 0x40($v0)
/* 3C2A4 8004BAA4 00000000 */  nop
/* 3C2A8 8004BAA8 06004010 */  beqz       $v0, .L8004BAC4
/* 3C2AC 8004BAAC 21204002 */   addu      $a0, $s2, $zero
/* 3C2B0 8004BAB0 40290500 */  sll        $a1, $a1, 5
/* 3C2B4 8004BAB4 21284500 */  addu       $a1, $v0, $a1
/* 3C2B8 8004BAB8 5000B027 */  addiu      $s0, $sp, 0x50
/* 3C2BC 8004BABC 59FD020C */  jal        CompMatrix
/* 3C2C0 8004BAC0 21300002 */   addu      $a2, $s0, $zero
.L8004BAC4:
/* 3C2C4 8004BAC4 10002786 */  lh         $a3, 0x10($s1)
/* 3C2C8 8004BAC8 3800A227 */  addiu      $v0, $sp, 0x38
/* 3C2CC 8004BACC 1000A2AF */  sw         $v0, 0x10($sp)
/* 3C2D0 8004BAD0 4000A227 */  addiu      $v0, $sp, 0x40
/* 3C2D4 8004BAD4 1400A2AF */  sw         $v0, 0x14($sp)
/* 3C2D8 8004BAD8 2A002286 */  lh         $v0, 0x2A($s1)
/* 3C2DC 8004BADC 00000000 */  nop
/* 3C2E0 8004BAE0 1800A2AF */  sw         $v0, 0x18($sp)
/* 3C2E4 8004BAE4 2C002286 */  lh         $v0, 0x2C($s1)
/* 3C2E8 8004BAE8 00000000 */  nop
/* 3C2EC 8004BAEC 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3C2F0 8004BAF0 2E002286 */  lh         $v0, 0x2E($s1)
/* 3C2F4 8004BAF4 00000000 */  nop
/* 3C2F8 8004BAF8 2000A2AF */  sw         $v0, 0x20($sp)
/* 3C2FC 8004BAFC 30002286 */  lh         $v0, 0x30($s1)
/* 3C300 8004BB00 00000000 */  nop
/* 3C304 8004BB04 2400A2AF */  sw         $v0, 0x24($sp)
/* 3C308 8004BB08 32002286 */  lh         $v0, 0x32($s1)
/* 3C30C 8004BB0C 21204002 */  addu       $a0, $s2, $zero
/* 3C310 8004BB10 2800A2AF */  sw         $v0, 0x28($sp)
/* 3C314 8004BB14 3400228E */  lw         $v0, 0x34($s1)
/* 3C318 8004BB18 21286002 */  addu       $a1, $s3, $zero
/* 3C31C 8004BB1C 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 3C320 8004BB20 3800228E */  lw         $v0, 0x38($s1)
/* 3C324 8004BB24 21300002 */  addu       $a2, $s0, $zero
/* 3C328 8004BB28 3B3C010C */  jal        FX_Lightning
/* 3C32C 8004BB2C 3000A2AF */   sw        $v0, 0x30($sp)
/* 3C330 8004BB30 8000BF8F */  lw         $ra, 0x80($sp)
/* 3C334 8004BB34 7C00B38F */  lw         $s3, 0x7C($sp)
/* 3C338 8004BB38 7800B28F */  lw         $s2, 0x78($sp)
/* 3C33C 8004BB3C 7400B18F */  lw         $s1, 0x74($sp)
/* 3C340 8004BB40 7000B08F */  lw         $s0, 0x70($sp)
/* 3C344 8004BB44 0800E003 */  jr         $ra
/* 3C348 8004BB48 8800BD27 */   addiu     $sp, $sp, 0x88
.size FX_DrawLightning, . - FX_DrawLightning
