.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_GetNodeByPosition
/* 89BE0 800993E0 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 89BE4 800993E4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 89BE8 800993E8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 89BEC 800993EC 21988000 */  addu       $s3, $a0, $zero
/* 89BF0 800993F0 1400B1AF */  sw         $s1, 0x14($sp)
/* 89BF4 800993F4 21880000 */  addu       $s1, $zero, $zero
/* 89BF8 800993F8 1800B2AF */  sw         $s2, 0x18($sp)
/* 89BFC 800993FC 21902002 */  addu       $s2, $s1, $zero
/* 89C00 80099400 2400BFAF */  sw         $ra, 0x24($sp)
/* 89C04 80099404 2000B4AF */  sw         $s4, 0x20($sp)
/* 89C08 80099408 1000B0AF */  sw         $s0, 0x10($sp)
/* 89C0C 8009940C 01004290 */  lbu        $v0, 0x1($v0)
/* 89C10 80099410 00000000 */  nop
/* 89C14 80099414 1E004010 */  beqz       $v0, .L80099490
/* 89C18 80099418 FFFF1424 */   addiu     $s4, $zero, -0x1
/* 89C1C 8009941C 2180A000 */  addu       $s0, $a1, $zero
.L80099420:
/* 89C20 80099420 00006386 */  lh         $v1, 0x0($s3)
/* 89C24 80099424 00000486 */  lh         $a0, 0x0($s0)
/* 89C28 80099428 02006286 */  lh         $v0, 0x2($s3)
/* 89C2C 8009942C 02000586 */  lh         $a1, 0x2($s0)
/* 89C30 80099430 23206400 */  subu       $a0, $v1, $a0
/* 89C34 80099434 EBE6000C */  jal        MATH3D_LengthXY
/* 89C38 80099438 23284500 */   subu      $a1, $v0, $a1
/* 89C3C 8009943C 0B004228 */  slti       $v0, $v0, 0xB
/* 89C40 80099440 0C004010 */  beqz       $v0, .L80099474
/* 89C44 80099444 00000000 */   nop
/* 89C48 80099448 04006286 */  lh         $v0, 0x4($s3)
/* 89C4C 8009944C 04000386 */  lh         $v1, 0x4($s0)
/* 89C50 80099450 00000000 */  nop
/* 89C54 80099454 23104300 */  subu       $v0, $v0, $v1
/* 89C58 80099458 02004104 */  bgez       $v0, .L80099464
/* 89C5C 8009945C 00000000 */   nop
/* 89C60 80099460 23100200 */  negu       $v0, $v0
.L80099464:
/* 89C64 80099464 2B105400 */  sltu       $v0, $v0, $s4
/* 89C68 80099468 02004010 */  beqz       $v0, .L80099474
/* 89C6C 8009946C 00000000 */   nop
/* 89C70 80099470 21900002 */  addu       $s2, $s0, $zero
.L80099474:
/* 89C74 80099474 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 89C78 80099478 00000000 */  nop
/* 89C7C 8009947C 01004290 */  lbu        $v0, 0x1($v0)
/* 89C80 80099480 01003126 */  addiu      $s1, $s1, 0x1
/* 89C84 80099484 2A102202 */  slt        $v0, $s1, $v0
/* 89C88 80099488 E5FF4014 */  bnez       $v0, .L80099420
/* 89C8C 8009948C 1C001026 */   addiu     $s0, $s0, 0x1C
.L80099490:
/* 89C90 80099490 21104002 */  addu       $v0, $s2, $zero
/* 89C94 80099494 2400BF8F */  lw         $ra, 0x24($sp)
/* 89C98 80099498 2000B48F */  lw         $s4, 0x20($sp)
/* 89C9C 8009949C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 89CA0 800994A0 1800B28F */  lw         $s2, 0x18($sp)
/* 89CA4 800994A4 1400B18F */  lw         $s1, 0x14($sp)
/* 89CA8 800994A8 1000B08F */  lw         $s0, 0x10($sp)
/* 89CAC 800994AC 0800E003 */  jr         $ra
/* 89CB0 800994B0 2800BD27 */   addiu     $sp, $sp, 0x28
.size PLANPOOL_GetNodeByPosition, . - PLANPOOL_GetNodeByPosition
