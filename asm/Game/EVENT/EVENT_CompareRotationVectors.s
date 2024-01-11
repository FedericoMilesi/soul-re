.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_CompareRotationVectors
/* 56B30 80066330 88FFBD27 */  addiu      $sp, $sp, -0x78
/* 56B34 80066334 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 56B38 80066338 2188A000 */  addu       $s1, $a1, $zero
/* 56B3C 8006633C 7000B6AF */  sw         $s6, 0x70($sp)
/* 56B40 80066340 21B0C000 */  addu       $s6, $a2, $zero
/* 56B44 80066344 6000B2AF */  sw         $s2, 0x60($sp)
/* 56B48 80066348 0100D22E */  sltiu      $s2, $s6, 0x1
/* 56B4C 8006634C 6800B4AF */  sw         $s4, 0x68($sp)
/* 56B50 80066350 7400BFAF */  sw         $ra, 0x74($sp)
/* 56B54 80066354 6C00B5AF */  sw         $s5, 0x6C($sp)
/* 56B58 80066358 6400B3AF */  sw         $s3, 0x64($sp)
/* 56B5C 8006635C 5800B0AF */  sw         $s0, 0x58($sp)
/* 56B60 80066360 1000908C */  lw         $s0, 0x10($a0)
/* 56B64 80066364 FFFF1324 */  addiu      $s3, $zero, -0x1
/* 56B68 80066368 02001316 */  bne        $s0, $s3, .L80066374
/* 56B6C 8006636C 21A00000 */   addu      $s4, $zero, $zero
/* 56B70 80066370 1000308E */  lw         $s0, 0x10($s1)
.L80066374:
/* 56B74 80066374 D8E2010C */  jal        func_80078B60
/* 56B78 80066378 1000A527 */   addiu     $a1, $sp, 0x10
/* 56B7C 8006637C 21202002 */  addu       $a0, $s1, $zero
/* 56B80 80066380 3000B127 */  addiu      $s1, $sp, 0x30
/* 56B84 80066384 D8E2010C */  jal        func_80078B60
/* 56B88 80066388 21282002 */   addu      $a1, $s1, $zero
/* 56B8C 8006638C 08000224 */  addiu      $v0, $zero, 0x8
/* 56B90 80066390 3F000212 */  beq        $s0, $v0, .L80066490
/* 56B94 80066394 0900022A */   slti      $v0, $s0, 0x9
/* 56B98 80066398 09004010 */  beqz       $v0, .L800663C0
/* 56B9C 8006639C 06000224 */   addiu     $v0, $zero, 0x6
/* 56BA0 800663A0 2F000212 */  beq        $s0, $v0, .L80066460
/* 56BA4 800663A4 0700022A */   slti      $v0, $s0, 0x7
/* 56BA8 800663A8 34004010 */  beqz       $v0, .L8006647C
/* 56BAC 800663AC 00100224 */   addiu     $v0, $zero, 0x1000
/* 56BB0 800663B0 11001312 */  beq        $s0, $s3, .L800663F8
/* 56BB4 800663B4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 56BB8 800663B8 29990108 */  j          .L800664A4
/* 56BBC 800663BC 00000000 */   nop
.L800663C0:
/* 56BC0 800663C0 61000224 */  addiu      $v0, $zero, 0x61
/* 56BC4 800663C4 2B000212 */  beq        $s0, $v0, .L80066474
/* 56BC8 800663C8 6200022A */   slti      $v0, $s0, 0x62
/* 56BCC 800663CC 05004010 */  beqz       $v0, .L800663E4
/* 56BD0 800663D0 60000224 */   addiu     $v0, $zero, 0x60
/* 56BD4 800663D4 21000212 */  beq        $s0, $v0, .L8006645C
/* 56BD8 800663D8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 56BDC 800663DC 29990108 */  j          .L800664A4
/* 56BE0 800663E0 00000000 */   nop
.L800663E4:
/* 56BE4 800663E4 62000224 */  addiu      $v0, $zero, 0x62
/* 56BE8 800663E8 28000212 */  beq        $s0, $v0, .L8006648C
/* 56BEC 800663EC FFFF0224 */   addiu     $v0, $zero, -0x1
/* 56BF0 800663F0 29990108 */  j          .L800664A4
/* 56BF4 800663F4 00000000 */   nop
.L800663F8:
/* 56BF8 800663F8 1000A427 */  addiu      $a0, $sp, 0x10
/* 56BFC 800663FC 21282002 */  addu       $a1, $s1, $zero
/* 56C00 80066400 5000B327 */  addiu      $s3, $sp, 0x50
/* 56C04 80066404 21306002 */  addu       $a2, $s3, $zero
/* 56C08 80066408 00101524 */  addiu      $s5, $zero, 0x1000
/* 56C0C 8006640C 5000B5A7 */  sh         $s5, 0x50($sp)
/* 56C10 80066410 5200A0A7 */  sh         $zero, 0x52($sp)
/* 56C14 80066414 33C2010C */  jal        PHYSOBS_CheckObjectAxisAlignment
/* 56C18 80066418 5400A0A7 */   sh        $zero, 0x54($sp)
/* 56C1C 8006641C 80F04224 */  addiu      $v0, $v0, -0xF80
/* 56C20 80066420 0101422C */  sltiu      $v0, $v0, 0x101
/* 56C24 80066424 1E004010 */  beqz       $v0, .L800664A0
/* 56C28 80066428 1000A427 */   addiu     $a0, $sp, 0x10
/* 56C2C 8006642C 21282002 */  addu       $a1, $s1, $zero
/* 56C30 80066430 21306002 */  addu       $a2, $s3, $zero
/* 56C34 80066434 5000A0A7 */  sh         $zero, 0x50($sp)
/* 56C38 80066438 5200B5A7 */  sh         $s5, 0x52($sp)
/* 56C3C 8006643C 33C2010C */  jal        PHYSOBS_CheckObjectAxisAlignment
/* 56C40 80066440 5400A0A7 */   sh        $zero, 0x54($sp)
/* 56C44 80066444 80F04224 */  addiu      $v0, $v0, -0xF80
/* 56C48 80066448 0101422C */  sltiu      $v0, $v0, 0x101
/* 56C4C 8006644C 15004010 */  beqz       $v0, .L800664A4
/* 56C50 80066450 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 56C54 80066454 29990108 */  j          .L800664A4
/* 56C58 80066458 2190C002 */   addu      $s2, $s6, $zero
.L8006645C:
/* 56C5C 8006645C 01001424 */  addiu      $s4, $zero, 0x1
.L80066460:
/* 56C60 80066460 00100224 */  addiu      $v0, $zero, 0x1000
/* 56C64 80066464 5000A2A7 */  sh         $v0, 0x50($sp)
/* 56C68 80066468 5200A0A7 */  sh         $zero, 0x52($sp)
/* 56C6C 8006646C 28990108 */  j          .L800664A0
/* 56C70 80066470 5400A0A7 */   sh        $zero, 0x54($sp)
.L80066474:
/* 56C74 80066474 01001424 */  addiu      $s4, $zero, 0x1
/* 56C78 80066478 00100224 */  addiu      $v0, $zero, 0x1000
.L8006647C:
/* 56C7C 8006647C 5000A0A7 */  sh         $zero, 0x50($sp)
/* 56C80 80066480 5200A2A7 */  sh         $v0, 0x52($sp)
/* 56C84 80066484 28990108 */  j          .L800664A0
/* 56C88 80066488 5400A0A7 */   sh        $zero, 0x54($sp)
.L8006648C:
/* 56C8C 8006648C 01001424 */  addiu      $s4, $zero, 0x1
.L80066490:
/* 56C90 80066490 00100224 */  addiu      $v0, $zero, 0x1000
/* 56C94 80066494 5000A0A7 */  sh         $zero, 0x50($sp)
/* 56C98 80066498 5200A0A7 */  sh         $zero, 0x52($sp)
/* 56C9C 8006649C 5400A2A7 */  sh         $v0, 0x54($sp)
.L800664A0:
/* 56CA0 800664A0 FFFF0224 */  addiu      $v0, $zero, -0x1
.L800664A4:
/* 56CA4 800664A4 15000212 */  beq        $s0, $v0, .L800664FC
/* 56CA8 800664A8 1000A427 */   addiu     $a0, $sp, 0x10
/* 56CAC 800664AC 3000A527 */  addiu      $a1, $sp, 0x30
/* 56CB0 800664B0 33C2010C */  jal        PHYSOBS_CheckObjectAxisAlignment
/* 56CB4 800664B4 5000A627 */   addiu     $a2, $sp, 0x50
/* 56CB8 800664B8 0B008012 */  beqz       $s4, .L800664E8
/* 56CBC 800664BC 21184000 */   addu      $v1, $v0, $zero
/* 56CC0 800664C0 80F06224 */  addiu      $v0, $v1, -0xF80
/* 56CC4 800664C4 0101422C */  sltiu      $v0, $v0, 0x101
/* 56CC8 800664C8 0C004014 */  bnez       $v0, .L800664FC
/* 56CCC 800664CC 2190C002 */   addu      $s2, $s6, $zero
/* 56CD0 800664D0 80106224 */  addiu      $v0, $v1, 0x1080
/* 56CD4 800664D4 0101422C */  sltiu      $v0, $v0, 0x101
/* 56CD8 800664D8 09004014 */  bnez       $v0, .L80066500
/* 56CDC 800664DC 21104002 */   addu      $v0, $s2, $zero
/* 56CE0 800664E0 3F990108 */  j          .L800664FC
/* 56CE4 800664E4 0100D22E */   sltiu     $s2, $s6, 0x1
.L800664E8:
/* 56CE8 800664E8 80F06224 */  addiu      $v0, $v1, -0xF80
/* 56CEC 800664EC 0101422C */  sltiu      $v0, $v0, 0x101
/* 56CF0 800664F0 02004014 */  bnez       $v0, .L800664FC
/* 56CF4 800664F4 2190C002 */   addu      $s2, $s6, $zero
/* 56CF8 800664F8 0100522E */  sltiu      $s2, $s2, 0x1
.L800664FC:
/* 56CFC 800664FC 21104002 */  addu       $v0, $s2, $zero
.L80066500:
/* 56D00 80066500 7400BF8F */  lw         $ra, 0x74($sp)
/* 56D04 80066504 7000B68F */  lw         $s6, 0x70($sp)
/* 56D08 80066508 6C00B58F */  lw         $s5, 0x6C($sp)
/* 56D0C 8006650C 6800B48F */  lw         $s4, 0x68($sp)
/* 56D10 80066510 6400B38F */  lw         $s3, 0x64($sp)
/* 56D14 80066514 6000B28F */  lw         $s2, 0x60($sp)
/* 56D18 80066518 5C00B18F */  lw         $s1, 0x5C($sp)
/* 56D1C 8006651C 5800B08F */  lw         $s0, 0x58($sp)
/* 56D20 80066520 0800E003 */  jr         $ra
/* 56D24 80066524 7800BD27 */   addiu     $sp, $sp, 0x78
.size EVENT_CompareRotationVectors, . - EVENT_CompareRotationVectors
