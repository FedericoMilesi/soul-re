.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawBlastring
/* 3C90C 8004C10C 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 3C910 8004C110 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 3C914 8004C114 2188A000 */  addu       $s1, $a1, $zero
/* 3C918 8004C118 6800BFAF */  sw         $ra, 0x68($sp)
/* 3C91C 8004C11C 6400B3AF */  sw         $s3, 0x64($sp)
/* 3C920 8004C120 6000B2AF */  sw         $s2, 0x60($sp)
/* 3C924 8004C124 5800B0AF */  sw         $s0, 0x58($sp)
/* 3C928 8004C128 3C00228E */  lw         $v0, 0x3C($s1)
/* 3C92C 8004C12C 00000000 */  nop
/* 3C930 8004C130 02004104 */  bgez       $v0, .L8004C13C
/* 3C934 8004C134 21988000 */   addu      $s3, $a0, $zero
/* 3C938 8004C138 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004C13C:
/* 3C93C 8004C13C 38002386 */  lh         $v1, 0x38($s1)
/* 3C940 8004C140 00000000 */  nop
/* 3C944 8004C144 19006004 */  bltz       $v1, .L8004C1AC
/* 3C948 8004C148 03930200 */   sra       $s2, $v0, 12
/* 3C94C 8004C14C 0800228E */  lw         $v0, 0x8($s1)
/* 3C950 8004C150 00000000 */  nop
/* 3C954 8004C154 4000458C */  lw         $a1, 0x40($v0)
/* 3C958 8004C158 00000000 */  nop
/* 3C95C 8004C15C 5700A010 */  beqz       $a1, .L8004C2BC
/* 3C960 8004C160 21206002 */   addu      $a0, $s3, $zero
/* 3C964 8004C164 40110300 */  sll        $v0, $v1, 5
/* 3C968 8004C168 2180A200 */  addu       $s0, $a1, $v0
/* 3C96C 8004C16C 21280002 */  addu       $a1, $s0, $zero
/* 3C970 8004C170 59FD020C */  jal        func_800BF564
/* 3C974 8004C174 3800A627 */   addiu     $a2, $sp, 0x38
/* 3C978 8004C178 6A002282 */  lb         $v0, 0x6A($s1)
/* 3C97C 8004C17C 00000000 */  nop
/* 3C980 8004C180 0E004014 */  bnez       $v0, .L8004C1BC
/* 3C984 8004C184 00000000 */   nop
/* 3C988 8004C188 14000296 */  lhu        $v0, 0x14($s0)
/* 3C98C 8004C18C 00000000 */  nop
/* 3C990 8004C190 3000A2A7 */  sh         $v0, 0x30($sp)
/* 3C994 8004C194 18000296 */  lhu        $v0, 0x18($s0)
/* 3C998 8004C198 00000000 */  nop
/* 3C99C 8004C19C 3200A2A7 */  sh         $v0, 0x32($sp)
/* 3C9A0 8004C1A0 1C000296 */  lhu        $v0, 0x1C($s0)
/* 3C9A4 8004C1A4 77300108 */  j          .L8004C1DC
/* 3C9A8 8004C1A8 3400A2A7 */   sh        $v0, 0x34($sp)
.L8004C1AC:
/* 3C9AC 8004C1AC 21206002 */  addu       $a0, $s3, $zero
/* 3C9B0 8004C1B0 18002526 */  addiu      $a1, $s1, 0x18
/* 3C9B4 8004C1B4 59FD020C */  jal        func_800BF564
/* 3C9B8 8004C1B8 3800A627 */   addiu     $a2, $sp, 0x38
.L8004C1BC:
/* 3C9BC 8004C1BC 1300288A */  lwl        $t0, 0x13($s1)
/* 3C9C0 8004C1C0 1000289A */  lwr        $t0, 0x10($s1)
/* 3C9C4 8004C1C4 1700298A */  lwl        $t1, 0x17($s1)
/* 3C9C8 8004C1C8 1400299A */  lwr        $t1, 0x14($s1)
/* 3C9CC 8004C1CC 3300A8AB */  swl        $t0, 0x33($sp)
/* 3C9D0 8004C1D0 3000A8BB */  swr        $t0, 0x30($sp)
/* 3C9D4 8004C1D4 3700A9AB */  swl        $t1, 0x37($sp)
/* 3C9D8 8004C1D8 3400A9BB */  swr        $t1, 0x34($sp)
.L8004C1DC:
/* 3C9DC 8004C1DC 0D002392 */  lbu        $v1, 0xD($s1)
/* 3C9E0 8004C1E0 00000000 */  nop
/* 3C9E4 8004C1E4 1B006014 */  bnez       $v1, .L8004C254
/* 3C9E8 8004C1E8 01000224 */   addiu     $v0, $zero, 0x1
/* 3C9EC 8004C1EC 4000228E */  lw         $v0, 0x40($s1)
/* 3C9F0 8004C1F0 00000000 */  nop
/* 3C9F4 8004C1F4 21104202 */  addu       $v0, $s2, $v0
/* 3C9F8 8004C1F8 1000A2AF */  sw         $v0, 0x10($sp)
/* 3C9FC 8004C1FC 4400228E */  lw         $v0, 0x44($s1)
/* 3CA00 8004C200 00000000 */  nop
/* 3CA04 8004C204 21104202 */  addu       $v0, $s2, $v0
/* 3CA08 8004C208 1400A2AF */  sw         $v0, 0x14($sp)
/* 3CA0C 8004C20C 5C00228E */  lw         $v0, 0x5C($s1)
/* 3CA10 8004C210 00000000 */  nop
/* 3CA14 8004C214 1800A2AF */  sw         $v0, 0x18($sp)
/* 3CA18 8004C218 6000228E */  lw         $v0, 0x60($s1)
/* 3CA1C 8004C21C 21206002 */  addu       $a0, $s3, $zero
/* 3CA20 8004C220 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3CA24 8004C224 6400228E */  lw         $v0, 0x64($s1)
/* 3CA28 8004C228 3000A527 */  addiu      $a1, $sp, 0x30
/* 3CA2C 8004C22C 2000A2AF */  sw         $v0, 0x20($sp)
/* 3CA30 8004C230 6C00228E */  lw         $v0, 0x6C($s1)
/* 3CA34 8004C234 3800A627 */  addiu      $a2, $sp, 0x38
/* 3CA38 8004C238 2400A2AF */  sw         $v0, 0x24($sp)
/* 3CA3C 8004C23C 6B002282 */  lb         $v0, 0x6B($s1)
/* 3CA40 8004C240 21384002 */  addu       $a3, $s2, $zero
/* 3CA44 8004C244 5039010C */  jal        FX_DrawRing
/* 3CA48 8004C248 2800A2AF */   sw        $v0, 0x28($sp)
/* 3CA4C 8004C24C AF300108 */  j          .L8004C2BC
/* 3CA50 8004C250 00000000 */   nop
.L8004C254:
/* 3CA54 8004C254 19006214 */  bne        $v1, $v0, .L8004C2BC
/* 3CA58 8004C258 21206002 */   addu      $a0, $s3, $zero
/* 3CA5C 8004C25C 4000228E */  lw         $v0, 0x40($s1)
/* 3CA60 8004C260 00000000 */  nop
/* 3CA64 8004C264 21104202 */  addu       $v0, $s2, $v0
/* 3CA68 8004C268 1000A2AF */  sw         $v0, 0x10($sp)
/* 3CA6C 8004C26C 4400228E */  lw         $v0, 0x44($s1)
/* 3CA70 8004C270 00000000 */  nop
/* 3CA74 8004C274 21104202 */  addu       $v0, $s2, $v0
/* 3CA78 8004C278 1400A2AF */  sw         $v0, 0x14($sp)
/* 3CA7C 8004C27C 5C00228E */  lw         $v0, 0x5C($s1)
/* 3CA80 8004C280 00000000 */  nop
/* 3CA84 8004C284 1800A2AF */  sw         $v0, 0x18($sp)
/* 3CA88 8004C288 6000228E */  lw         $v0, 0x60($s1)
/* 3CA8C 8004C28C 00000000 */  nop
/* 3CA90 8004C290 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3CA94 8004C294 6400228E */  lw         $v0, 0x64($s1)
/* 3CA98 8004C298 3000A527 */  addiu      $a1, $sp, 0x30
/* 3CA9C 8004C29C 2000A2AF */  sw         $v0, 0x20($sp)
/* 3CAA0 8004C2A0 68002282 */  lb         $v0, 0x68($s1)
/* 3CAA4 8004C2A4 3800A627 */  addiu      $a2, $sp, 0x38
/* 3CAA8 8004C2A8 2400A2AF */  sw         $v0, 0x24($sp)
/* 3CAAC 8004C2AC 6B002282 */  lb         $v0, 0x6B($s1)
/* 3CAB0 8004C2B0 21384002 */  addu       $a3, $s2, $zero
/* 3CAB4 8004C2B4 0C3A010C */  jal        FX_DrawRing2
/* 3CAB8 8004C2B8 2800A2AF */   sw        $v0, 0x28($sp)
.L8004C2BC:
/* 3CABC 8004C2BC 6800BF8F */  lw         $ra, 0x68($sp)
/* 3CAC0 8004C2C0 6400B38F */  lw         $s3, 0x64($sp)
/* 3CAC4 8004C2C4 6000B28F */  lw         $s2, 0x60($sp)
/* 3CAC8 8004C2C8 5C00B18F */  lw         $s1, 0x5C($sp)
/* 3CACC 8004C2CC 5800B08F */  lw         $s0, 0x58($sp)
/* 3CAD0 8004C2D0 0800E003 */  jr         $ra
/* 3CAD4 8004C2D4 7000BD27 */   addiu     $sp, $sp, 0x70
.size FX_DrawBlastring, . - FX_DrawBlastring
