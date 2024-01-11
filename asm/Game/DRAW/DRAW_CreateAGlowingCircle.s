.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_CreateAGlowingCircle
/* 1C08C 8002B88C F8FEBD27 */  addiu      $sp, $sp, -0x108
/* 1C090 8002B890 0001BEAF */  sw         $fp, 0x100($sp)
/* 1C094 8002B894 21F08000 */  addu       $fp, $a0, $zero
/* 1C098 8002B898 0401BFAF */  sw         $ra, 0x104($sp)
/* 1C09C 8002B89C FC00B7AF */  sw         $s7, 0xFC($sp)
/* 1C0A0 8002B8A0 F800B6AF */  sw         $s6, 0xF8($sp)
/* 1C0A4 8002B8A4 F400B5AF */  sw         $s5, 0xF4($sp)
/* 1C0A8 8002B8A8 F000B4AF */  sw         $s4, 0xF0($sp)
/* 1C0AC 8002B8AC EC00B3AF */  sw         $s3, 0xEC($sp)
/* 1C0B0 8002B8B0 E800B2AF */  sw         $s2, 0xE8($sp)
/* 1C0B4 8002B8B4 E400B1AF */  sw         $s1, 0xE4($sp)
/* 1C0B8 8002B8B8 E000B0AF */  sw         $s0, 0xE0($sp)
/* 1C0BC 8002B8BC 1001A6AF */  sw         $a2, 0x110($sp)
/* 1C0C0 8002B8C0 1401A7AF */  sw         $a3, 0x114($sp)
/* 1C0C4 8002B8C4 0800C0AF */  sw         $zero, 0x8($fp)
/* 1C0C8 8002B8C8 2001A48F */  lw         $a0, 0x120($sp)
/* 1C0CC 8002B8CC 2401A38F */  lw         $v1, 0x124($sp)
/* 1C0D0 8002B8D0 2801B48F */  lw         $s4, 0x128($sp)
/* 1C0D4 8002B8D4 4C01A018 */  blez       $a1, .L8002BE08
/* 1C0D8 8002B8D8 00000000 */   nop
/* 1C0DC 8002B8DC 1801AF8F */  lw         $t7, 0x118($sp)
/* 1C0E0 8002B8E0 00000000 */  nop
/* 1C0E4 8002B8E4 000CE229 */  slti       $v0, $t7, 0xC00
/* 1C0E8 8002B8E8 47014010 */  beqz       $v0, .L8002BE08
/* 1C0EC 8002B8EC 80100300 */   sll       $v0, $v1, 2
/* 1C0F0 8002B8F0 21104300 */  addu       $v0, $v0, $v1
/* 1C0F4 8002B8F4 80110200 */  sll        $v0, $v0, 6
/* 1C0F8 8002B8F8 1A004500 */  div        $zero, $v0, $a1
/* 1C0FC 8002B8FC 12100000 */  mflo       $v0
/* 1C100 8002B900 80880400 */  sll        $s1, $a0, 2
/* 1C104 8002B904 21882402 */  addu       $s1, $s1, $a0
/* 1C108 8002B908 80891100 */  sll        $s1, $s1, 6
/* 1C10C 8002B90C 1A002502 */  div        $zero, $s1, $a1
/* 1C110 8002B910 12880000 */  mflo       $s1
/* 1C114 8002B914 21208002 */  addu       $a0, $s4, $zero
/* 1C118 8002B918 3000A0AF */  sw         $zero, 0x30($sp)
/* 1C11C 8002B91C 3800A0AF */  sw         $zero, 0x38($sp)
/* 1C120 8002B920 23100200 */  negu       $v0, $v0
/* 1C124 8002B924 DCE4010C */  jal        rcos
/* 1C128 8002B928 3400A2AF */   sw        $v0, 0x34($sp)
/* 1C12C 8002B92C 21208002 */  addu       $a0, $s4, $zero
/* 1C130 8002B930 D0E4010C */  jal        rsin
/* 1C134 8002B934 21804000 */   addu      $s0, $v0, $zero
/* 1C138 8002B938 3000A38F */  lw         $v1, 0x30($sp)
/* 1C13C 8002B93C 00000000 */  nop
/* 1C140 8002B940 18000302 */  mult       $s0, $v1
/* 1C144 8002B944 12280000 */  mflo       $a1
/* 1C148 8002B948 3400A38F */  lw         $v1, 0x34($sp)
/* 1C14C 8002B94C 00000000 */  nop
/* 1C150 8002B950 18004300 */  mult       $v0, $v1
/* 1C154 8002B954 21208002 */  addu       $a0, $s4, $zero
/* 1C158 8002B958 12180000 */  mflo       $v1
/* 1C15C 8002B95C 2110A300 */  addu       $v0, $a1, $v1
/* 1C160 8002B960 D0E4010C */  jal        rsin
/* 1C164 8002B964 039B0200 */   sra       $s3, $v0, 12
/* 1C168 8002B968 21208002 */  addu       $a0, $s4, $zero
/* 1C16C 8002B96C DCE4010C */  jal        rcos
/* 1C170 8002B970 21804000 */   addu      $s0, $v0, $zero
/* 1C174 8002B974 3000A38F */  lw         $v1, 0x30($sp)
/* 1C178 8002B978 23801000 */  negu       $s0, $s0
/* 1C17C 8002B97C 18000302 */  mult       $s0, $v1
/* 1C180 8002B980 8888123C */  lui        $s2, (0x88888889 >> 16)
/* 1C184 8002B984 12300000 */  mflo       $a2
/* 1C188 8002B988 89885236 */  ori        $s2, $s2, (0x88888889 & 0xFFFF)
/* 1C18C 8002B98C 402A1300 */  sll        $a1, $s3, 9
/* 1C190 8002B990 1800B200 */  mult       $a1, $s2
/* 1C194 8002B994 10400000 */  mfhi       $t0
/* 1C198 8002B998 3400A38F */  lw         $v1, 0x34($sp)
/* 1C19C 8002B99C 00000000 */  nop
/* 1C1A0 8002B9A0 18004300 */  mult       $v0, $v1
/* 1C1A4 8002B9A4 21208002 */  addu       $a0, $s4, $zero
/* 1C1A8 8002B9A8 23881100 */  negu       $s1, $s1
/* 1C1AC 8002B9AC 2000B1AF */  sw         $s1, 0x20($sp)
/* 1C1B0 8002B9B0 2400A0AF */  sw         $zero, 0x24($sp)
/* 1C1B4 8002B9B4 2800A0AF */  sw         $zero, 0x28($sp)
/* 1C1B8 8002B9B8 21100501 */  addu       $v0, $t0, $a1
/* 1C1BC 8002B9BC C3110200 */  sra        $v0, $v0, 7
/* 1C1C0 8002B9C0 C32F0500 */  sra        $a1, $a1, 31
/* 1C1C4 8002B9C4 23104500 */  subu       $v0, $v0, $a1
/* 1C1C8 8002B9C8 3000A2AF */  sw         $v0, 0x30($sp)
/* 1C1CC 8002B9CC 12180000 */  mflo       $v1
/* 1C1D0 8002B9D0 2110C300 */  addu       $v0, $a2, $v1
/* 1C1D4 8002B9D4 03130200 */  sra        $v0, $v0, 12
/* 1C1D8 8002B9D8 DCE4010C */  jal        rcos
/* 1C1DC 8002B9DC 3400A2AF */   sw        $v0, 0x34($sp)
/* 1C1E0 8002B9E0 21208002 */  addu       $a0, $s4, $zero
/* 1C1E4 8002B9E4 D0E4010C */  jal        rsin
/* 1C1E8 8002B9E8 21804000 */   addu      $s0, $v0, $zero
/* 1C1EC 8002B9EC 2000A38F */  lw         $v1, 0x20($sp)
/* 1C1F0 8002B9F0 00000000 */  nop
/* 1C1F4 8002B9F4 18000302 */  mult       $s0, $v1
/* 1C1F8 8002B9F8 12280000 */  mflo       $a1
/* 1C1FC 8002B9FC 2400A38F */  lw         $v1, 0x24($sp)
/* 1C200 8002BA00 00000000 */  nop
/* 1C204 8002BA04 18004300 */  mult       $v0, $v1
/* 1C208 8002BA08 21208002 */  addu       $a0, $s4, $zero
/* 1C20C 8002BA0C 12180000 */  mflo       $v1
/* 1C210 8002BA10 2110A300 */  addu       $v0, $a1, $v1
/* 1C214 8002BA14 D0E4010C */  jal        rsin
/* 1C218 8002BA18 039B0200 */   sra       $s3, $v0, 12
/* 1C21C 8002BA1C 21208002 */  addu       $a0, $s4, $zero
/* 1C220 8002BA20 DCE4010C */  jal        rcos
/* 1C224 8002BA24 21804000 */   addu      $s0, $v0, $zero
/* 1C228 8002BA28 2000A38F */  lw         $v1, 0x20($sp)
/* 1C22C 8002BA2C 23801000 */  negu       $s0, $s0
/* 1C230 8002BA30 18000302 */  mult       $s0, $v1
/* 1C234 8002BA34 12280000 */  mflo       $a1
/* 1C238 8002BA38 40221300 */  sll        $a0, $s3, 9
/* 1C23C 8002BA3C 00000000 */  nop
/* 1C240 8002BA40 18009200 */  mult       $a0, $s2
/* 1C244 8002BA44 10400000 */  mfhi       $t0
/* 1C248 8002BA48 2400A38F */  lw         $v1, 0x24($sp)
/* 1C24C 8002BA4C 00000000 */  nop
/* 1C250 8002BA50 18004300 */  mult       $v0, $v1
/* 1C254 8002BA54 3000AF27 */  addiu      $t7, $sp, 0x30
/* 1C258 8002BA58 4000AE27 */  addiu      $t6, $sp, 0x40
/* 1C25C 8002BA5C 3000B18F */  lw         $s1, 0x30($sp)
/* 1C260 8002BA60 21680401 */  addu       $t5, $t0, $a0
/* 1C264 8002BA64 C3690D00 */  sra        $t5, $t5, 7
/* 1C268 8002BA68 C3270400 */  sra        $a0, $a0, 31
/* 1C26C 8002BA6C 2368A401 */  subu       $t5, $t5, $a0
/* 1C270 8002BA70 2000ADAF */  sw         $t5, 0x20($sp)
/* 1C274 8002BA74 12180000 */  mflo       $v1
/* 1C278 8002BA78 2110A300 */  addu       $v0, $a1, $v1
/* 1C27C 8002BA7C 03130200 */  sra        $v0, $v0, 12
/* 1C280 8002BA80 2400A2AF */  sw         $v0, 0x24($sp)
/* 1C284 8002BA84 0000C28F */  lw         $v0, 0x0($fp)
/* 1C288 8002BA88 0400C38F */  lw         $v1, 0x4($fp)
/* 1C28C 8002BA8C 0800CB8F */  lw         $t3, 0x8($fp)
/* 1C290 8002BA90 2000B227 */  addiu      $s2, $sp, 0x20
/* 1C294 8002BA94 D800AFAF */  sw         $t7, 0xD8($sp)
/* 1C298 8002BA98 0400F78D */  lw         $s7, 0x4($t7)
/* 1C29C 8002BA9C 0800F08D */  lw         $s0, 0x8($t7)
/* 1C2A0 8002BAA0 21105100 */  addu       $v0, $v0, $s1
/* 1C2A4 8002BAA4 21187700 */  addu       $v1, $v1, $s7
/* 1C2A8 8002BAA8 21587001 */  addu       $t3, $t3, $s0
/* 1C2AC 8002BAAC 4000A2AF */  sw         $v0, 0x40($sp)
/* 1C2B0 8002BAB0 0400C3AD */  sw         $v1, 0x4($t6)
/* 1C2B4 8002BAB4 0800CBAD */  sw         $t3, 0x8($t6)
/* 1C2B8 8002BAB8 0400548E */  lw         $s4, 0x4($s2)
/* 1C2BC 8002BABC 0800558E */  lw         $s5, 0x8($s2)
/* 1C2C0 8002BAC0 21104D00 */  addu       $v0, $v0, $t5
/* 1C2C4 8002BAC4 4000A2AF */  sw         $v0, 0x40($sp)
/* 1C2C8 8002BAC8 21187400 */  addu       $v1, $v1, $s4
/* 1C2CC 8002BACC 21587501 */  addu       $t3, $t3, $s5
/* 1C2D0 8002BAD0 0400C3AD */  sw         $v1, 0x4($t6)
/* 1C2D4 8002BAD4 0800CBAD */  sw         $t3, 0x8($t6)
/* 1C2D8 8002BAD8 0000C48F */  lw         $a0, 0x0($fp)
/* 1C2DC 8002BADC 000C0624 */  addiu      $a2, $zero, 0xC00
/* 1C2E0 8002BAE0 23104400 */  subu       $v0, $v0, $a0
/* 1C2E4 8002BAE4 18004600 */  mult       $v0, $a2
/* 1C2E8 8002BAE8 0800C58F */  lw         $a1, 0x8($fp)
/* 1C2EC 8002BAEC 0400C48F */  lw         $a0, 0x4($fp)
/* 1C2F0 8002BAF0 23586501 */  subu       $t3, $t3, $a1
/* 1C2F4 8002BAF4 4000A2AF */  sw         $v0, 0x40($sp)
/* 1C2F8 8002BAF8 0800CBAD */  sw         $t3, 0x8($t6)
/* 1C2FC 8002BAFC 23186400 */  subu       $v1, $v1, $a0
/* 1C300 8002BB00 0400C3AD */  sw         $v1, 0x4($t6)
/* 1C304 8002BB04 12400000 */  mflo       $t0
/* 1C308 8002BB08 4400A28F */  lw         $v0, 0x44($sp)
/* 1C30C 8002BB0C 03B30800 */  sra        $s6, $t0, 12
/* 1C310 8002BB10 18004600 */  mult       $v0, $a2
/* 1C314 8002BB14 5000AC27 */  addiu      $t4, $sp, 0x50
/* 1C318 8002BB18 4000B6AF */  sw         $s6, 0x40($sp)
/* 1C31C 8002BB1C 12400000 */  mflo       $t0
/* 1C320 8002BB20 03130800 */  sra        $v0, $t0, 12
/* 1C324 8002BB24 4400A2AF */  sw         $v0, 0x44($sp)
/* 1C328 8002BB28 0000C38F */  lw         $v1, 0x0($fp)
/* 1C32C 8002BB2C 0400C48F */  lw         $a0, 0x4($fp)
/* 1C330 8002BB30 0800CA8F */  lw         $t2, 0x8($fp)
/* 1C334 8002BB34 21187100 */  addu       $v1, $v1, $s1
/* 1C338 8002BB38 21209700 */  addu       $a0, $a0, $s7
/* 1C33C 8002BB3C 21505001 */  addu       $t2, $t2, $s0
/* 1C340 8002BB40 5000A3AF */  sw         $v1, 0x50($sp)
/* 1C344 8002BB44 23186D00 */  subu       $v1, $v1, $t5
/* 1C348 8002BB48 040084AD */  sw         $a0, 0x4($t4)
/* 1C34C 8002BB4C 23209400 */  subu       $a0, $a0, $s4
/* 1C350 8002BB50 08008AAD */  sw         $t2, 0x8($t4)
/* 1C354 8002BB54 23505501 */  subu       $t2, $t2, $s5
/* 1C358 8002BB58 5000A3AF */  sw         $v1, 0x50($sp)
/* 1C35C 8002BB5C 040084AD */  sw         $a0, 0x4($t4)
/* 1C360 8002BB60 08008AAD */  sw         $t2, 0x8($t4)
/* 1C364 8002BB64 0000C28F */  lw         $v0, 0x0($fp)
/* 1C368 8002BB68 00000000 */  nop
/* 1C36C 8002BB6C 23186200 */  subu       $v1, $v1, $v0
/* 1C370 8002BB70 18006600 */  mult       $v1, $a2
/* 1C374 8002BB74 0800C58F */  lw         $a1, 0x8($fp)
/* 1C378 8002BB78 0400C28F */  lw         $v0, 0x4($fp)
/* 1C37C 8002BB7C 23504501 */  subu       $t2, $t2, $a1
/* 1C380 8002BB80 5000A3AF */  sw         $v1, 0x50($sp)
/* 1C384 8002BB84 08008AAD */  sw         $t2, 0x8($t4)
/* 1C388 8002BB88 23208200 */  subu       $a0, $a0, $v0
/* 1C38C 8002BB8C 040084AD */  sw         $a0, 0x4($t4)
/* 1C390 8002BB90 12400000 */  mflo       $t0
/* 1C394 8002BB94 5400A28F */  lw         $v0, 0x54($sp)
/* 1C398 8002BB98 039B0800 */  sra        $s3, $t0, 12
/* 1C39C 8002BB9C 18004600 */  mult       $v0, $a2
/* 1C3A0 8002BBA0 1001A48F */  lw         $a0, 0x110($sp)
/* 1C3A4 8002BBA4 1401A58F */  lw         $a1, 0x114($sp)
/* 1C3A8 8002BBA8 1C01A78F */  lw         $a3, 0x11C($sp)
/* 1C3AC 8002BBAC 1801A68F */  lw         $a2, 0x118($sp)
/* 1C3B0 8002BBB0 7800AF27 */  addiu      $t7, $sp, 0x78
/* 1C3B4 8002BBB4 5000B3AF */  sw         $s3, 0x50($sp)
/* 1C3B8 8002BBB8 12400000 */  mflo       $t0
/* 1C3BC 8002BBBC 03130800 */  sra        $v0, $t0, 12
/* 1C3C0 8002BBC0 5400A2AF */  sw         $v0, 0x54($sp)
/* 1C3C4 8002BBC4 0000C28F */  lw         $v0, 0x0($fp)
/* 1C3C8 8002BBC8 0400C38F */  lw         $v1, 0x4($fp)
/* 1C3CC 8002BBCC 0800C88F */  lw         $t0, 0x8($fp)
/* 1C3D0 8002BBD0 0400C98D */  lw         $t1, 0x4($t6)
/* 1C3D4 8002BBD4 21105600 */  addu       $v0, $v0, $s6
/* 1C3D8 8002BBD8 21186900 */  addu       $v1, $v1, $t1
/* 1C3DC 8002BBDC 21400B01 */  addu       $t0, $t0, $t3
/* 1C3E0 8002BBE0 6000AB27 */  addiu      $t3, $sp, 0x60
/* 1C3E4 8002BBE4 6C00B627 */  addiu      $s6, $sp, 0x6C
/* 1C3E8 8002BBE8 6000A2AF */  sw         $v0, 0x60($sp)
/* 1C3EC 8002BBEC 040063AD */  sw         $v1, 0x4($t3)
/* 1C3F0 8002BBF0 080068AD */  sw         $t0, 0x8($t3)
/* 1C3F4 8002BBF4 0000C28F */  lw         $v0, 0x0($fp)
/* 1C3F8 8002BBF8 0400C38F */  lw         $v1, 0x4($fp)
/* 1C3FC 8002BBFC 0800C88F */  lw         $t0, 0x8($fp)
/* 1C400 8002BC00 21105100 */  addu       $v0, $v0, $s1
/* 1C404 8002BC04 21187700 */  addu       $v1, $v1, $s7
/* 1C408 8002BC08 21401001 */  addu       $t0, $t0, $s0
/* 1C40C 8002BC0C C000B127 */  addiu      $s1, $sp, 0xC0
/* 1C410 8002BC10 9000B027 */  addiu      $s0, $sp, 0x90
/* 1C414 8002BC14 6C00A2AF */  sw         $v0, 0x6C($sp)
/* 1C418 8002BC18 0400C3AE */  sw         $v1, 0x4($s6)
/* 1C41C 8002BC1C 0800C8AE */  sw         $t0, 0x8($s6)
/* 1C420 8002BC20 0000C28F */  lw         $v0, 0x0($fp)
/* 1C424 8002BC24 0400C38F */  lw         $v1, 0x4($fp)
/* 1C428 8002BC28 0800C88F */  lw         $t0, 0x8($fp)
/* 1C42C 8002BC2C 0400898D */  lw         $t1, 0x4($t4)
/* 1C430 8002BC30 21105300 */  addu       $v0, $v0, $s3
/* 1C434 8002BC34 21186900 */  addu       $v1, $v1, $t1
/* 1C438 8002BC38 21400A01 */  addu       $t0, $t0, $t2
/* 1C43C 8002BC3C A800B327 */  addiu      $s3, $sp, 0xA8
/* 1C440 8002BC40 7800A2AF */  sw         $v0, 0x78($sp)
/* 1C444 8002BC44 D400AFAF */  sw         $t7, 0xD4($sp)
/* 1C448 8002BC48 0400E3AD */  sw         $v1, 0x4($t7)
/* 1C44C 8002BC4C 0800E8AD */  sw         $t0, 0x8($t7)
/* 1C450 8002BC50 0000C28F */  lw         $v0, 0x0($fp)
/* 1C454 8002BC54 0400C38F */  lw         $v1, 0x4($fp)
/* 1C458 8002BC58 0800C88F */  lw         $t0, 0x8($fp)
/* 1C45C 8002BC5C 21104D00 */  addu       $v0, $v0, $t5
/* 1C460 8002BC60 21187400 */  addu       $v1, $v1, $s4
/* 1C464 8002BC64 21401501 */  addu       $t0, $t0, $s5
/* 1C468 8002BC68 8400B427 */  addiu      $s4, $sp, 0x84
/* 1C46C 8002BC6C 9C00B527 */  addiu      $s5, $sp, 0x9C
/* 1C470 8002BC70 8400A2AF */  sw         $v0, 0x84($sp)
/* 1C474 8002BC74 040083AE */  sw         $v1, 0x4($s4)
/* 1C478 8002BC78 080088AE */  sw         $t0, 0x8($s4)
/* 1C47C 8002BC7C 0000D78F */  lw         $s7, 0x0($fp)
/* 1C480 8002BC80 0400D88F */  lw         $t8, 0x4($fp)
/* 1C484 8002BC84 0800D98F */  lw         $t9, 0x8($fp)
/* 1C488 8002BC88 9000B7AF */  sw         $s7, 0x90($sp)
/* 1C48C 8002BC8C 9400B8AF */  sw         $t8, 0x94($sp)
/* 1C490 8002BC90 9800B9AF */  sw         $t9, 0x98($sp)
/* 1C494 8002BC94 0000C88F */  lw         $t0, 0x0($fp)
/* 1C498 8002BC98 0400CA8F */  lw         $t2, 0x4($fp)
/* 1C49C 8002BC9C 2000A28F */  lw         $v0, 0x20($sp)
/* 1C4A0 8002BCA0 0800C98F */  lw         $t1, 0x8($fp)
/* 1C4A4 8002BCA4 0800438E */  lw         $v1, 0x8($s2)
/* 1C4A8 8002BCA8 23400201 */  subu       $t0, $t0, $v0
/* 1C4AC 8002BCAC 0400428E */  lw         $v0, 0x4($s2)
/* 1C4B0 8002BCB0 23482301 */  subu       $t1, $t1, $v1
/* 1C4B4 8002BCB4 9C00A8AF */  sw         $t0, 0x9C($sp)
/* 1C4B8 8002BCB8 0800A9AE */  sw         $t1, 0x8($s5)
/* 1C4BC 8002BCBC 23504201 */  subu       $t2, $t2, $v0
/* 1C4C0 8002BCC0 0400AAAE */  sw         $t2, 0x4($s5)
/* 1C4C4 8002BCC4 0000C88F */  lw         $t0, 0x0($fp)
/* 1C4C8 8002BCC8 0400CA8F */  lw         $t2, 0x4($fp)
/* 1C4CC 8002BCCC 5000A28F */  lw         $v0, 0x50($sp)
/* 1C4D0 8002BCD0 0800C98F */  lw         $t1, 0x8($fp)
/* 1C4D4 8002BCD4 0800838D */  lw         $v1, 0x8($t4)
/* 1C4D8 8002BCD8 23400201 */  subu       $t0, $t0, $v0
/* 1C4DC 8002BCDC 0400828D */  lw         $v0, 0x4($t4)
/* 1C4E0 8002BCE0 23482301 */  subu       $t1, $t1, $v1
/* 1C4E4 8002BCE4 A800A8AF */  sw         $t0, 0xA8($sp)
/* 1C4E8 8002BCE8 080069AE */  sw         $t1, 0x8($s3)
/* 1C4EC 8002BCEC 23504201 */  subu       $t2, $t2, $v0
/* 1C4F0 8002BCF0 04006AAE */  sw         $t2, 0x4($s3)
/* 1C4F4 8002BCF4 0000C88F */  lw         $t0, 0x0($fp)
/* 1C4F8 8002BCF8 0400CA8F */  lw         $t2, 0x4($fp)
/* 1C4FC 8002BCFC 3000A28F */  lw         $v0, 0x30($sp)
/* 1C500 8002BD00 0800C98F */  lw         $t1, 0x8($fp)
/* 1C504 8002BD04 D800B78F */  lw         $s7, 0xD8($sp)
/* 1C508 8002BD08 23400201 */  subu       $t0, $t0, $v0
/* 1C50C 8002BD0C 0400E28E */  lw         $v0, 0x4($s7)
/* 1C510 8002BD10 0800E38E */  lw         $v1, 0x8($s7)
/* 1C514 8002BD14 B400B227 */  addiu      $s2, $sp, 0xB4
/* 1C518 8002BD18 B400A8AF */  sw         $t0, 0xB4($sp)
/* 1C51C 8002BD1C 23504201 */  subu       $t2, $t2, $v0
/* 1C520 8002BD20 23482301 */  subu       $t1, $t1, $v1
/* 1C524 8002BD24 04004AAE */  sw         $t2, 0x4($s2)
/* 1C528 8002BD28 080049AE */  sw         $t1, 0x8($s2)
/* 1C52C 8002BD2C 0000C88F */  lw         $t0, 0x0($fp)
/* 1C530 8002BD30 0400CA8F */  lw         $t2, 0x4($fp)
/* 1C534 8002BD34 4000A28F */  lw         $v0, 0x40($sp)
/* 1C538 8002BD38 0800C98F */  lw         $t1, 0x8($fp)
/* 1C53C 8002BD3C 0800C38D */  lw         $v1, 0x8($t6)
/* 1C540 8002BD40 23400201 */  subu       $t0, $t0, $v0
/* 1C544 8002BD44 0400C28D */  lw         $v0, 0x4($t6)
/* 1C548 8002BD48 23482301 */  subu       $t1, $t1, $v1
/* 1C54C 8002BD4C C000A8AF */  sw         $t0, 0xC0($sp)
/* 1C550 8002BD50 080029AE */  sw         $t1, 0x8($s1)
/* 1C554 8002BD54 23504201 */  subu       $t2, $t2, $v0
/* 1C558 8002BD58 00100224 */  addiu      $v0, $zero, 0x1000
/* 1C55C 8002BD5C 04002AAE */  sw         $t2, 0x4($s1)
/* 1C560 8002BD60 6800A2AF */  sw         $v0, 0x68($sp)
/* 1C564 8002BD64 7400A2AF */  sw         $v0, 0x74($sp)
/* 1C568 8002BD68 8000A2AF */  sw         $v0, 0x80($sp)
/* 1C56C 8002BD6C 8C00A2AF */  sw         $v0, 0x8C($sp)
/* 1C570 8002BD70 9800A0AF */  sw         $zero, 0x98($sp)
/* 1C574 8002BD74 A400A2AF */  sw         $v0, 0xA4($sp)
/* 1C578 8002BD78 B000A2AF */  sw         $v0, 0xB0($sp)
/* 1C57C 8002BD7C BC00A2AF */  sw         $v0, 0xBC($sp)
/* 1C580 8002BD80 C800A2AF */  sw         $v0, 0xC8($sp)
/* 1C584 8002BD84 1000B4AF */  sw         $s4, 0x10($sp)
/* 1C588 8002BD88 1400ABAF */  sw         $t3, 0x14($sp)
/* 1C58C 8002BD8C 1800B0AF */  sw         $s0, 0x18($sp)
/* 1C590 8002BD90 8AAD000C */  jal        DRAW_GlowQuad
/* 1C594 8002BD94 1C00B6AF */   sw        $s6, 0x1C($sp)
/* 1C598 8002BD98 1001A48F */  lw         $a0, 0x110($sp)
/* 1C59C 8002BD9C 1401A58F */  lw         $a1, 0x114($sp)
/* 1C5A0 8002BDA0 1801A68F */  lw         $a2, 0x118($sp)
/* 1C5A4 8002BDA4 1C01A78F */  lw         $a3, 0x11C($sp)
/* 1C5A8 8002BDA8 1000B4AF */  sw         $s4, 0x10($sp)
/* 1C5AC 8002BDAC 1400B0AF */  sw         $s0, 0x14($sp)
/* 1C5B0 8002BDB0 1800B3AF */  sw         $s3, 0x18($sp)
/* 1C5B4 8002BDB4 8AAD000C */  jal        DRAW_GlowQuad
/* 1C5B8 8002BDB8 1C00B2AF */   sw        $s2, 0x1C($sp)
/* 1C5BC 8002BDBC 1001A48F */  lw         $a0, 0x110($sp)
/* 1C5C0 8002BDC0 1401A58F */  lw         $a1, 0x114($sp)
/* 1C5C4 8002BDC4 1801A68F */  lw         $a2, 0x118($sp)
/* 1C5C8 8002BDC8 1C01A78F */  lw         $a3, 0x11C($sp)
/* 1C5CC 8002BDCC D400B88F */  lw         $t8, 0xD4($sp)
/* 1C5D0 8002BDD0 1000B6AF */  sw         $s6, 0x10($sp)
/* 1C5D4 8002BDD4 1800B0AF */  sw         $s0, 0x18($sp)
/* 1C5D8 8002BDD8 1C00B5AF */  sw         $s5, 0x1C($sp)
/* 1C5DC 8002BDDC 8AAD000C */  jal        DRAW_GlowQuad
/* 1C5E0 8002BDE0 1400B8AF */   sw        $t8, 0x14($sp)
/* 1C5E4 8002BDE4 1001A48F */  lw         $a0, 0x110($sp)
/* 1C5E8 8002BDE8 1401A58F */  lw         $a1, 0x114($sp)
/* 1C5EC 8002BDEC 1801A68F */  lw         $a2, 0x118($sp)
/* 1C5F0 8002BDF0 1C01A78F */  lw         $a3, 0x11C($sp)
/* 1C5F4 8002BDF4 1000B2AF */  sw         $s2, 0x10($sp)
/* 1C5F8 8002BDF8 1400B0AF */  sw         $s0, 0x14($sp)
/* 1C5FC 8002BDFC 1800B1AF */  sw         $s1, 0x18($sp)
/* 1C600 8002BE00 8AAD000C */  jal        DRAW_GlowQuad
/* 1C604 8002BE04 1C00B5AF */   sw        $s5, 0x1C($sp)
.L8002BE08:
/* 1C608 8002BE08 0401BF8F */  lw         $ra, 0x104($sp)
/* 1C60C 8002BE0C 0001BE8F */  lw         $fp, 0x100($sp)
/* 1C610 8002BE10 FC00B78F */  lw         $s7, 0xFC($sp)
/* 1C614 8002BE14 F800B68F */  lw         $s6, 0xF8($sp)
/* 1C618 8002BE18 F400B58F */  lw         $s5, 0xF4($sp)
/* 1C61C 8002BE1C F000B48F */  lw         $s4, 0xF0($sp)
/* 1C620 8002BE20 EC00B38F */  lw         $s3, 0xEC($sp)
/* 1C624 8002BE24 E800B28F */  lw         $s2, 0xE8($sp)
/* 1C628 8002BE28 E400B18F */  lw         $s1, 0xE4($sp)
/* 1C62C 8002BE2C E000B08F */  lw         $s0, 0xE0($sp)
/* 1C630 8002BE30 0800E003 */  jr         $ra
/* 1C634 8002BE34 0801BD27 */   addiu     $sp, $sp, 0x108
.size DRAW_CreateAGlowingCircle, . - DRAW_CreateAGlowingCircle
