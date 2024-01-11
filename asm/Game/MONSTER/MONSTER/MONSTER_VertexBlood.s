.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSTER_VertexBlood
/* 7CBDC 8008C3DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7CBE0 8008C3E0 1000B0AF */  sw         $s0, 0x10($sp)
/* 7CBE4 8008C3E4 21808000 */  addu       $s0, $a0, $zero
/* 7CBE8 8008C3E8 1400BFAF */  sw         $ra, 0x14($sp)
/* 7CBEC 8008C3EC 1C00028E */  lw         $v0, 0x1C($s0)
/* 7CBF0 8008C3F0 26010386 */  lh         $v1, 0x126($s0)
/* 7CBF4 8008C3F4 9802048E */  lw         $a0, 0x298($s0)
/* 7CBF8 8008C3F8 0C00428C */  lw         $v0, 0xC($v0)
/* 7CBFC 8008C3FC 80180300 */  sll        $v1, $v1, 2
/* 7CC00 8008C400 21186200 */  addu       $v1, $v1, $v0
/* 7CC04 8008C404 0000688C */  lw         $t0, 0x0($v1)
/* 7CC08 8008C408 63008010 */  beqz       $a0, .L8008C598
/* 7CC0C 8008C40C 80100500 */   sll       $v0, $a1, 2
/* 7CC10 8008C410 0500C014 */  bnez       $a2, .L8008C428
/* 7CC14 8008C414 21388200 */   addu      $a3, $a0, $v0
/* 7CC18 8008C418 2641010C */  jal        MEMPACK_Free
/* 7CC1C 8008C41C 00000000 */   nop
/* 7CC20 8008C420 66310208 */  j          .L8008C598
/* 7CC24 8008C424 980200AE */   sw        $zero, 0x298($s0)
.L8008C428:
/* 7CC28 8008C428 0100E590 */  lbu        $a1, 0x1($a3)
/* 7CC2C 8008C42C 0000E490 */  lbu        $a0, 0x0($a3)
/* 7CC30 8008C430 6C01038E */  lw         $v1, 0x16C($s0)
/* 7CC34 8008C434 2B108500 */  sltu       $v0, $a0, $a1
/* 7CC38 8008C438 0B004014 */  bnez       $v0, .L8008C468
/* 7CC3C 8008C43C 00000000 */   nop
/* 7CC40 8008C440 0200E290 */  lbu        $v0, 0x2($a3)
/* 7CC44 8008C444 00000000 */  nop
/* 7CC48 8008C448 2B10A200 */  sltu       $v0, $a1, $v0
/* 7CC4C 8008C44C 0B004010 */  beqz       $v0, .L8008C47C
/* 7CC50 8008C450 00000000 */   nop
/* 7CC54 8008C454 6801628C */  lw         $v0, 0x168($v1)
/* 7CC58 8008C458 00000000 */  nop
/* 7CC5C 8008C45C 40004490 */  lbu        $a0, 0x40($v0)
/* 7CC60 8008C460 28310208 */  j          .L8008C4A0
/* 7CC64 8008C464 00010324 */   addiu     $v1, $zero, 0x100
.L8008C468:
/* 7CC68 8008C468 0200E290 */  lbu        $v0, 0x2($a3)
/* 7CC6C 8008C46C 00000000 */  nop
/* 7CC70 8008C470 2B108200 */  sltu       $v0, $a0, $v0
/* 7CC74 8008C474 06004014 */  bnez       $v0, .L8008C490
/* 7CC78 8008C478 00000000 */   nop
.L8008C47C:
/* 7CC7C 8008C47C 6801628C */  lw         $v0, 0x168($v1)
/* 7CC80 8008C480 0200E590 */  lbu        $a1, 0x2($a3)
/* 7CC84 8008C484 41004490 */  lbu        $a0, 0x41($v0)
/* 7CC88 8008C488 28310208 */  j          .L8008C4A0
/* 7CC8C 8008C48C 00010324 */   addiu     $v1, $zero, 0x100
.L8008C490:
/* 7CC90 8008C490 6801628C */  lw         $v0, 0x168($v1)
/* 7CC94 8008C494 0000E590 */  lbu        $a1, 0x0($a3)
/* 7CC98 8008C498 3F004490 */  lbu        $a0, 0x3F($v0)
/* 7CC9C 8008C49C 00010324 */  addiu      $v1, $zero, 0x100
.L8008C4A0:
/* 7CCA0 8008C4A0 23186600 */  subu       $v1, $v1, $a2
/* 7CCA4 8008C4A4 FF000224 */  addiu      $v0, $zero, 0xFF
/* 7CCA8 8008C4A8 23104400 */  subu       $v0, $v0, $a0
/* 7CCAC 8008C4AC 18006200 */  mult       $v1, $v0
/* 7CCB0 8008C4B0 0300E390 */  lbu        $v1, 0x3($a3)
/* 7CCB4 8008C4B4 01000224 */  addiu      $v0, $zero, 0x1
/* 7CCB8 8008C4B8 12500000 */  mflo       $t2
/* 7CCBC 8008C4BC 36006214 */  bne        $v1, $v0, .L8008C598
/* 7CCC0 8008C4C0 03220A00 */   sra       $a0, $t2, 8
/* 7CCC4 8008C4C4 2A10A400 */  slt        $v0, $a1, $a0
/* 7CCC8 8008C4C8 33004010 */  beqz       $v0, .L8008C598
/* 7CCCC 8008C4CC 00000000 */   nop
/* 7CCD0 8008C4D0 0000038D */  lw         $v1, 0x0($t0)
/* 7CCD4 8008C4D4 9802078E */  lw         $a3, 0x298($s0)
/* 7CCD8 8008C4D8 2F006010 */  beqz       $v1, .L8008C598
/* 7CCDC 8008C4DC 00000000 */   nop
/* 7CCE0 8008C4E0 01000924 */  addiu      $t1, $zero, 0x1
/* 7CCE4 8008C4E4 FF000824 */  addiu      $t0, $zero, 0xFF
/* 7CCE8 8008C4E8 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
/* 7CCEC 8008C4EC FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
/* 7CCF0 8008C4F0 0300E524 */  addiu      $a1, $a3, 0x3
.L8008C4F4:
/* 7CCF4 8008C4F4 0000A290 */  lbu        $v0, 0x0($a1)
/* 7CCF8 8008C4F8 00000000 */  nop
/* 7CCFC 8008C4FC 22004914 */  bne        $v0, $t1, .L8008C588
/* 7CD00 8008C500 00000000 */   nop
/* 7CD04 8008C504 0000E290 */  lbu        $v0, 0x0($a3)
/* 7CD08 8008C508 00000000 */  nop
/* 7CD0C 8008C50C 08004424 */  addiu      $a0, $v0, 0x8
/* 7CD10 8008C510 00018228 */  slti       $v0, $a0, 0x100
/* 7CD14 8008C514 03004014 */  bnez       $v0, .L8008C524
/* 7CD18 8008C518 00000000 */   nop
/* 7CD1C 8008C51C 4A310208 */  j          .L8008C528
/* 7CD20 8008C520 0000E8A0 */   sb        $t0, 0x0($a3)
.L8008C524:
/* 7CD24 8008C524 0000E4A0 */  sb         $a0, 0x0($a3)
.L8008C528:
/* 7CD28 8008C528 FEFFA290 */  lbu        $v0, -0x2($a1)
/* 7CD2C 8008C52C 00000000 */  nop
/* 7CD30 8008C530 08004424 */  addiu      $a0, $v0, 0x8
/* 7CD34 8008C534 00018228 */  slti       $v0, $a0, 0x100
/* 7CD38 8008C538 03004014 */  bnez       $v0, .L8008C548
/* 7CD3C 8008C53C 00000000 */   nop
/* 7CD40 8008C540 53310208 */  j          .L8008C54C
/* 7CD44 8008C544 FEFFA8A0 */   sb        $t0, -0x2($a1)
.L8008C548:
/* 7CD48 8008C548 FEFFA4A0 */  sb         $a0, -0x2($a1)
.L8008C54C:
/* 7CD4C 8008C54C FFFFA290 */  lbu        $v0, -0x1($a1)
/* 7CD50 8008C550 00000000 */  nop
/* 7CD54 8008C554 08004424 */  addiu      $a0, $v0, 0x8
/* 7CD58 8008C558 00018228 */  slti       $v0, $a0, 0x100
/* 7CD5C 8008C55C 03004014 */  bnez       $v0, .L8008C56C
/* 7CD60 8008C560 00000000 */   nop
/* 7CD64 8008C564 5C310208 */  j          .L8008C570
/* 7CD68 8008C568 FFFFA8A0 */   sb        $t0, -0x1($a1)
.L8008C56C:
/* 7CD6C 8008C56C FFFFA4A0 */  sb         $a0, -0x1($a1)
.L8008C570:
/* 7CD70 8008C570 0000E28C */  lw         $v0, 0x0($a3)
/* 7CD74 8008C574 00000000 */  nop
/* 7CD78 8008C578 24104600 */  and        $v0, $v0, $a2
/* 7CD7C 8008C57C 02004614 */  bne        $v0, $a2, .L8008C588
/* 7CD80 8008C580 00000000 */   nop
/* 7CD84 8008C584 0000A0A0 */  sb         $zero, 0x0($a1)
.L8008C588:
/* 7CD88 8008C588 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 7CD8C 8008C58C 0400A524 */  addiu      $a1, $a1, 0x4
/* 7CD90 8008C590 D8FF6014 */  bnez       $v1, .L8008C4F4
/* 7CD94 8008C594 0400E724 */   addiu     $a3, $a3, 0x4
.L8008C598:
/* 7CD98 8008C598 1400BF8F */  lw         $ra, 0x14($sp)
/* 7CD9C 8008C59C 1000B08F */  lw         $s0, 0x10($sp)
/* 7CDA0 8008C5A0 0800E003 */  jr         $ra
/* 7CDA4 8008C5A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size MONSTER_VertexBlood, . - MONSTER_VertexBlood
