.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_ChangeDirectoryByID
/* 28B6C 8003836C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 28B70 80038370 1400B1AF */  sw         $s1, 0x14($sp)
/* 28B74 80038374 21888000 */  addu       $s1, $a0, $zero
/* 28B78 80038378 1800BFAF */  sw         $ra, 0x18($sp)
/* 28B7C 8003837C 37002012 */  beqz       $s1, .L8003845C
/* 28B80 80038380 1000B0AF */   sw        $s0, 0x10($sp)
/* 28B84 80038384 00BC858F */  lw         $a1, %gp_rel(loadStatus + 0x6C)($gp)
/* 28B88 80038388 00000000 */  nop
/* 28B8C 8003838C 3400B110 */  beq        $a1, $s1, .L80038460
/* 28B90 80038390 01000224 */   addiu     $v0, $zero, 0x1
/* 28B94 80038394 04BC828F */  lw         $v0, %gp_rel(loadStatus + 0x70)($gp)
/* 28B98 80038398 00000000 */  nop
/* 28B9C 8003839C 09005114 */  bne        $v0, $s1, .L800383C4
/* 28BA0 800383A0 01000224 */   addiu     $v0, $zero, 0x1
/* 28BA4 800383A4 FCBB848F */  lw         $a0, %gp_rel(loadStatus + 0x68)($gp)
/* 28BA8 800383A8 F8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x64)($gp)
/* 28BAC 800383AC 04BC85AF */  sw         $a1, %gp_rel(loadStatus + 0x70)($gp)
/* 28BB0 800383B0 00BC91AF */  sw         $s1, %gp_rel(loadStatus + 0x6C)($gp)
/* 28BB4 800383B4 FCBB83AF */  sw         $v1, %gp_rel(loadStatus + 0x68)($gp)
/* 28BB8 800383B8 F8BB84AF */  sw         $a0, %gp_rel(loadStatus + 0x64)($gp)
/* 28BBC 800383BC 18E10008 */  j          .L80038460
/* 28BC0 800383C0 00000000 */   nop
.L800383C4:
/* 28BC4 800383C4 0CBC828F */  lw         $v0, %gp_rel(loadStatus + 0x78)($gp)
/* 28BC8 800383C8 00000000 */  nop
/* 28BCC 800383CC 23004018 */  blez       $v0, .L8003845C
/* 28BD0 800383D0 21180000 */   addu      $v1, $zero, $zero
.L800383D4:
/* 28BD4 800383D4 10BC828F */  lw         $v0, %gp_rel(loadStatus + 0x7C)($gp)
/* 28BD8 800383D8 C0800300 */  sll        $s0, $v1, 3
/* 28BDC 800383DC 21100202 */  addu       $v0, $s0, $v0
/* 28BE0 800383E0 00004284 */  lh         $v0, 0x0($v0)
/* 28BE4 800383E4 00000000 */  nop
/* 28BE8 800383E8 17002216 */  bne        $s1, $v0, .L80038448
/* 28BEC 800383EC 01006324 */   addiu     $v1, $v1, 0x1
/* 28BF0 800383F0 FCBB848F */  lw         $a0, %gp_rel(loadStatus + 0x68)($gp)
/* 28BF4 800383F4 00000000 */  nop
/* 28BF8 800383F8 03008010 */  beqz       $a0, .L80038408
/* 28BFC 800383FC 00000000 */   nop
/* 28C00 80038400 2641010C */  jal        MEMPACK_Free
/* 28C04 80038404 00000000 */   nop
.L80038408:
/* 28C08 80038408 00BC838F */  lw         $v1, %gp_rel(loadStatus + 0x6C)($gp)
/* 28C0C 8003840C 10BC848F */  lw         $a0, %gp_rel(loadStatus + 0x7C)($gp)
/* 28C10 80038410 01000224 */  addiu      $v0, $zero, 0x1
/* 28C14 80038414 24BC82AF */  sw         $v0, %gp_rel(loadStatus + 0x90)($gp)
/* 28C18 80038418 F8BB828F */  lw         $v0, %gp_rel(loadStatus + 0x64)($gp)
/* 28C1C 8003841C 04BC83AF */  sw         $v1, %gp_rel(loadStatus + 0x70)($gp)
/* 28C20 80038420 FCBB82AF */  sw         $v0, %gp_rel(loadStatus + 0x68)($gp)
/* 28C24 80038424 9BDE000C */  jal        LOAD_ReadDirectory
/* 28C28 80038428 21209000 */   addu      $a0, $a0, $s0
/* 28C2C 8003842C 21204000 */  addu       $a0, $v0, $zero
/* 28C30 80038430 F8BB84AF */  sw         $a0, %gp_rel(loadStatus + 0x64)($gp)
/* 28C34 80038434 B241010C */  jal        MEMPACK_SetMemoryBeingStreamed
/* 28C38 80038438 00000000 */   nop
/* 28C3C 8003843C 00BC91AF */  sw         $s1, %gp_rel(loadStatus + 0x6C)($gp)
/* 28C40 80038440 18E10008 */  j          .L80038460
/* 28C44 80038444 01000224 */   addiu     $v0, $zero, 0x1
.L80038448:
/* 28C48 80038448 0CBC828F */  lw         $v0, %gp_rel(loadStatus + 0x78)($gp)
/* 28C4C 8003844C 00000000 */  nop
/* 28C50 80038450 2A106200 */  slt        $v0, $v1, $v0
/* 28C54 80038454 DFFF4014 */  bnez       $v0, .L800383D4
/* 28C58 80038458 00000000 */   nop
.L8003845C:
/* 28C5C 8003845C 21100000 */  addu       $v0, $zero, $zero
.L80038460:
/* 28C60 80038460 1800BF8F */  lw         $ra, 0x18($sp)
/* 28C64 80038464 1400B18F */  lw         $s1, 0x14($sp)
/* 28C68 80038468 1000B08F */  lw         $s0, 0x10($sp)
/* 28C6C 8003846C 0800E003 */  jr         $ra
/* 28C70 80038470 2000BD27 */   addiu     $sp, $sp, 0x20
.size LOAD_ChangeDirectoryByID, . - LOAD_ChangeDirectoryByID
