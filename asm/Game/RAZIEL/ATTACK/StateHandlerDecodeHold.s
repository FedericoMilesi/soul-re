.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerDecodeHold
/* 8C27C 8009BA7C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 8C280 8009BA80 1800B2AF */  sw         $s2, 0x18($sp)
/* 8C284 8009BA84 21908000 */  addu       $s2, $a0, $zero
/* 8C288 8009BA88 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8C28C 8009BA8C 2198A000 */  addu       $s3, $a1, $zero
/* 8C290 8009BA90 2000B4AF */  sw         $s4, 0x20($sp)
/* 8C294 8009BA94 01001424 */  addiu      $s4, $zero, 0x1
/* 8C298 8009BA98 1000B0AF */  sw         $s0, 0x10($sp)
/* 8C29C 8009BA9C 21800000 */  addu       $s0, $zero, $zero
/* 8C2A0 8009BAA0 2400BFAF */  sw         $ra, 0x24($sp)
/* 8C2A4 8009BAA4 2F97020C */  jal        razGetHeldWeapon
/* 8C2A8 8009BAA8 1400B1AF */   sw        $s1, 0x14($sp)
/* 8C2AC 8009BAAC 21884000 */  addu       $s1, $v0, $zero
/* 8C2B0 8009BAB0 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 8C2B4 8009BAB4 02000224 */  addiu      $v0, $zero, 0x2
/* 8C2B8 8009BAB8 15006214 */  bne        $v1, $v0, .L8009BB10
/* 8C2BC 8009BABC 0080023C */   lui       $v0, (0x80000000 >> 16)
/* 8C2C0 8009BAC0 000074AE */  sw         $s4, 0x0($s3)
/* 8C2C4 8009BAC4 000042AE */  sw         $v0, 0x0($s2)
/* 8C2C8 8009BAC8 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8C2CC 8009BACC 00000000 */  nop
/* 8C2D0 8009BAD0 00024230 */  andi       $v0, $v0, 0x200
/* 8C2D4 8009BAD4 BB004014 */  bnez       $v0, .L8009BDC4
/* 8C2D8 8009BAD8 21108002 */   addu      $v0, $s4, $zero
/* 8C2DC 8009BADC 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8C2E0 8009BAE0 00100224 */  addiu      $v0, $zero, 0x1000
/* 8C2E4 8009BAE4 B6006214 */  bne        $v1, $v0, .L8009BDC0
/* 8C2E8 8009BAE8 21A00002 */   addu      $s4, $s0, $zero
/* 8C2EC 8009BAEC 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 8C2F0 8009BAF0 00000000 */  nop
/* 8C2F4 8009BAF4 04004230 */  andi       $v0, $v0, 0x4
/* 8C2F8 8009BAF8 B1004010 */  beqz       $v0, .L8009BDC0
/* 8C2FC 8009BAFC 8000023C */   lui       $v0, (0x800010 >> 16)
/* 8C300 8009BB00 01001424 */  addiu      $s4, $zero, 0x1
/* 8C304 8009BB04 10004234 */  ori        $v0, $v0, (0x800010 & 0xFFFF)
/* 8C308 8009BB08 706F0208 */  j          .L8009BDC0
/* 8C30C 8009BB0C 000042AE */   sw        $v0, 0x0($s2)
.L8009BB10:
/* 8C310 8009BB10 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8C314 8009BB14 00000000 */  nop
/* 8C318 8009BB18 00024230 */  andi       $v0, $v0, 0x200
/* 8C31C 8009BB1C 08004010 */  beqz       $v0, .L8009BB40
/* 8C320 8009BB20 08000232 */   andi      $v0, $s0, 0x8
/* 8C324 8009BB24 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8C328 8009BB28 00000000 */  nop
/* 8C32C 8009BB2C 4800448C */  lw         $a0, 0x48($v0)
/* 8C330 8009BB30 92D1000C */  jal        INSTANCE_Query
/* 8C334 8009BB34 01000524 */   addiu     $a1, $zero, 0x1
/* 8C338 8009BB38 21804000 */  addu       $s0, $v0, $zero
/* 8C33C 8009BB3C 08000232 */  andi       $v0, $s0, 0x8
.L8009BB40:
/* 8C340 8009BB40 0C004010 */  beqz       $v0, .L8009BB74
/* 8C344 8009BB44 00100224 */   addiu     $v0, $zero, 0x1000
/* 8C348 8009BB48 000074AE */  sw         $s4, 0x0($s3)
/* 8C34C 8009BB4C 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8C350 8009BB50 00000000 */  nop
/* 8C354 8009BB54 05006214 */  bne        $v1, $v0, .L8009BB6C
/* 8C358 8009BB58 0080023C */   lui       $v0, (0x80000000 >> 16)
/* 8C35C 8009BB5C 0001023C */  lui        $v0, (0x1000023 >> 16)
/* 8C360 8009BB60 23004234 */  ori        $v0, $v0, (0x1000023 & 0xFFFF)
/* 8C364 8009BB64 666F0208 */  j          .L8009BD98
/* 8C368 8009BB68 000042AE */   sw        $v0, 0x0($s2)
.L8009BB6C:
/* 8C36C 8009BB6C 666F0208 */  j          .L8009BD98
/* 8C370 8009BB70 000042AE */   sw        $v0, 0x0($s2)
.L8009BB74:
/* 8C374 8009BB74 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8C378 8009BB78 00000000 */  nop
/* 8C37C 8009BB7C 00024230 */  andi       $v0, $v0, 0x200
/* 8C380 8009BB80 46004010 */  beqz       $v0, .L8009BC9C
/* 8C384 8009BB84 00000000 */   nop
/* 8C388 8009BB88 44002012 */  beqz       $s1, .L8009BC9C
/* 8C38C 8009BB8C 03000224 */   addiu     $v0, $zero, 0x3
/* 8C390 8009BB90 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8C394 8009BB94 00000000 */  nop
/* 8C398 8009BB98 40006210 */  beq        $v1, $v0, .L8009BC9C
/* 8C39C 8009BB9C 08000224 */   addiu     $v0, $zero, 0x8
/* 8C3A0 8009BBA0 3E006210 */  beq        $v1, $v0, .L8009BC9C
/* 8C3A4 8009BBA4 00000000 */   nop
/* 8C3A8 8009BBA8 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8C3AC 8009BBAC 00000000 */  nop
/* 8C3B0 8009BBB0 4800448C */  lw         $a0, 0x48($v0)
/* 8C3B4 8009BBB4 92D1000C */  jal        INSTANCE_Query
/* 8C3B8 8009BBB8 21280000 */   addu      $a1, $zero, $zero
/* 8C3BC 8009BBBC 21184000 */  addu       $v1, $v0, $zero
/* 8C3C0 8009BBC0 0002023C */  lui        $v0, (0x2000000 >> 16)
/* 8C3C4 8009BBC4 24106200 */  and        $v0, $v1, $v0
/* 8C3C8 8009BBC8 09004010 */  beqz       $v0, .L8009BBF0
/* 8C3CC 8009BBCC 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 8C3D0 8009BBD0 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 8C3D4 8009BBD4 00000000 */  nop
/* 8C3D8 8009BBD8 6E002216 */  bne        $s1, $v0, .L8009BD94
/* 8C3DC 8009BBDC 0001023C */   lui       $v0, (0x1000023 >> 16)
/* 8C3E0 8009BBE0 23004234 */  ori        $v0, $v0, (0x1000023 & 0xFFFF)
/* 8C3E4 8009BBE4 000042AE */  sw         $v0, 0x0($s2)
/* 8C3E8 8009BBE8 666F0208 */  j          .L8009BD98
/* 8C3EC 8009BBEC 000074AE */   sw        $s4, 0x0($s3)
.L8009BBF0:
/* 8C3F0 8009BBF0 24106200 */  and        $v0, $v1, $v0
/* 8C3F4 8009BBF4 04004010 */  beqz       $v0, .L8009BC08
/* 8C3F8 8009BBF8 0001023C */   lui       $v0, (0x100000A >> 16)
/* 8C3FC 8009BBFC 0A004234 */  ori        $v0, $v0, (0x100000A & 0xFFFF)
/* 8C400 8009BC00 046F0208 */  j          .L8009BC10
/* 8C404 8009BC04 000074AE */   sw        $s4, 0x0($s3)
.L8009BC08:
/* 8C408 8009BC08 0A004234 */  ori        $v0, $v0, (0x100000A & 0xFFFF)
/* 8C40C 8009BC0C 000060AE */  sw         $zero, 0x0($s3)
.L8009BC10:
/* 8C410 8009BC10 000042AE */  sw         $v0, 0x0($s2)
/* 8C414 8009BC14 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 8C418 8009BC18 00000000 */  nop
/* 8C41C 8009BC1C 0A002216 */  bne        $s1, $v0, .L8009BC48
/* 8C420 8009BC20 21202002 */   addu      $a0, $s1, $zero
/* 8C424 8009BC24 0001023C */  lui        $v0, (0x1000023 >> 16)
/* 8C428 8009BC28 23004234 */  ori        $v0, $v0, (0x1000023 & 0xFFFF)
/* 8C42C 8009BC2C 000042AE */  sw         $v0, 0x0($s2)
/* 8C430 8009BC30 0021023C */  lui        $v0, (0x21000000 >> 16)
/* 8C434 8009BC34 24106200 */  and        $v0, $v1, $v0
/* 8C438 8009BC38 14004014 */  bnez       $v0, .L8009BC8C
/* 8C43C 8009BC3C 01000224 */   addiu     $v0, $zero, 0x1
/* 8C440 8009BC40 666F0208 */  j          .L8009BD98
/* 8C444 8009BC44 000060AE */   sw        $zero, 0x0($s3)
.L8009BC48:
/* 8C448 8009BC48 92D1000C */  jal        INSTANCE_Query
/* 8C44C 8009BC4C 02000524 */   addiu     $a1, $zero, 0x2
/* 8C450 8009BC50 20004230 */  andi       $v0, $v0, 0x20
/* 8C454 8009BC54 50004010 */  beqz       $v0, .L8009BD98
/* 8C458 8009BC58 0001023C */   lui       $v0, (0x1000018 >> 16)
/* 8C45C 8009BC5C 18004234 */  ori        $v0, $v0, (0x1000018 & 0xFFFF)
/* 8C460 8009BC60 000042AE */  sw         $v0, 0x0($s2)
/* 8C464 8009BC64 0000628E */  lw         $v0, 0x0($s3)
/* 8C468 8009BC68 00000000 */  nop
/* 8C46C 8009BC6C 4A004010 */  beqz       $v0, .L8009BD98
/* 8C470 8009BC70 21202002 */   addu      $a0, $s1, $zero
/* 8C474 8009BC74 92D1000C */  jal        INSTANCE_Query
/* 8C478 8009BC78 03000524 */   addiu     $a1, $zero, 0x3
/* 8C47C 8009BC7C 0100033C */  lui        $v1, (0x10000 >> 16)
/* 8C480 8009BC80 24104300 */  and        $v0, $v0, $v1
/* 8C484 8009BC84 03004010 */  beqz       $v0, .L8009BC94
/* 8C488 8009BC88 01000224 */   addiu     $v0, $zero, 0x1
.L8009BC8C:
/* 8C48C 8009BC8C 666F0208 */  j          .L8009BD98
/* 8C490 8009BC90 000062AE */   sw        $v0, 0x0($s3)
.L8009BC94:
/* 8C494 8009BC94 666F0208 */  j          .L8009BD98
/* 8C498 8009BC98 000060AE */   sw        $zero, 0x0($s3)
.L8009BC9C:
/* 8C49C 8009BC9C 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8C4A0 8009BCA0 00000000 */  nop
/* 8C4A4 8009BCA4 00014230 */  andi       $v0, $v0, 0x100
/* 8C4A8 8009BCA8 14004010 */  beqz       $v0, .L8009BCFC
/* 8C4AC 8009BCAC 00000000 */   nop
/* 8C4B0 8009BCB0 12002016 */  bnez       $s1, .L8009BCFC
/* 8C4B4 8009BCB4 00000000 */   nop
/* 8C4B8 8009BCB8 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8C4BC 8009BCBC 00000000 */  nop
/* 8C4C0 8009BCC0 4000448C */  lw         $a0, 0x40($v0)
/* 8C4C4 8009BCC4 92D1000C */  jal        INSTANCE_Query
/* 8C4C8 8009BCC8 21280000 */   addu      $a1, $zero, $zero
/* 8C4CC 8009BCCC 07004104 */  bgez       $v0, .L8009BCEC
/* 8C4D0 8009BCD0 0001023C */   lui       $v0, (0x1000002 >> 16)
/* 8C4D4 8009BCD4 0001033C */  lui        $v1, (0x1000002 >> 16)
/* 8C4D8 8009BCD8 02006334 */  ori        $v1, $v1, (0x1000002 & 0xFFFF)
/* 8C4DC 8009BCDC 01000224 */  addiu      $v0, $zero, 0x1
/* 8C4E0 8009BCE0 000062AE */  sw         $v0, 0x0($s3)
/* 8C4E4 8009BCE4 666F0208 */  j          .L8009BD98
/* 8C4E8 8009BCE8 000043AE */   sw        $v1, 0x0($s2)
.L8009BCEC:
/* 8C4EC 8009BCEC 02004234 */  ori        $v0, $v0, (0x1000002 & 0xFFFF)
/* 8C4F0 8009BCF0 000060AE */  sw         $zero, 0x0($s3)
/* 8C4F4 8009BCF4 666F0208 */  j          .L8009BD98
/* 8C4F8 8009BCF8 000042AE */   sw        $v0, 0x0($s2)
.L8009BCFC:
/* 8C4FC 8009BCFC 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8C500 8009BD00 00000000 */  nop
/* 8C504 8009BD04 00024230 */  andi       $v0, $v0, 0x200
/* 8C508 8009BD08 0A004010 */  beqz       $v0, .L8009BD34
/* 8C50C 8009BD0C 03000224 */   addiu     $v0, $zero, 0x3
/* 8C510 8009BD10 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8C514 8009BD14 00000000 */  nop
/* 8C518 8009BD18 06006214 */  bne        $v1, $v0, .L8009BD34
/* 8C51C 8009BD1C 01000224 */   addiu     $v0, $zero, 0x1
/* 8C520 8009BD20 0080033C */  lui        $v1, (0x80000000 >> 16)
/* 8C524 8009BD24 000043AE */  sw         $v1, 0x0($s2)
/* 8C528 8009BD28 21184000 */  addu       $v1, $v0, $zero
/* 8C52C 8009BD2C 716F0208 */  j          .L8009BDC4
/* 8C530 8009BD30 000063AE */   sw        $v1, 0x0($s3)
.L8009BD34:
/* 8C534 8009BD34 2F97020C */  jal        razGetHeldWeapon
/* 8C538 8009BD38 00000000 */   nop
/* 8C53C 8009BD3C 21184000 */  addu       $v1, $v0, $zero
/* 8C540 8009BD40 0D006010 */  beqz       $v1, .L8009BD78
/* 8C544 8009BD44 00000000 */   nop
/* 8C548 8009BD48 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 8C54C 8009BD4C 00000000 */  nop
/* 8C550 8009BD50 06006214 */  bne        $v1, $v0, .L8009BD6C
/* 8C554 8009BD54 8000023C */   lui       $v0, (0x800010 >> 16)
/* 8C558 8009BD58 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 8C55C 8009BD5C 00000000 */  nop
/* 8C560 8009BD60 04004230 */  andi       $v0, $v0, 0x4
/* 8C564 8009BD64 0B004010 */  beqz       $v0, .L8009BD94
/* 8C568 8009BD68 8000023C */   lui       $v0, (0x800010 >> 16)
.L8009BD6C:
/* 8C56C 8009BD6C 10004234 */  ori        $v0, $v0, (0x800010 & 0xFFFF)
/* 8C570 8009BD70 666F0208 */  j          .L8009BD98
/* 8C574 8009BD74 000042AE */   sw        $v0, 0x0($s2)
.L8009BD78:
/* 8C578 8009BD78 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 8C57C 8009BD7C 00000000 */  nop
/* 8C580 8009BD80 04004230 */  andi       $v0, $v0, 0x4
/* 8C584 8009BD84 03004010 */  beqz       $v0, .L8009BD94
/* 8C588 8009BD88 0800023C */   lui       $v0, (0x80000 >> 16)
/* 8C58C 8009BD8C 666F0208 */  j          .L8009BD98
/* 8C590 8009BD90 000042AE */   sw        $v0, 0x0($s2)
.L8009BD94:
/* 8C594 8009BD94 21A00000 */  addu       $s4, $zero, $zero
.L8009BD98:
/* 8C598 8009BD98 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8C59C 8009BD9C 03000224 */  addiu      $v0, $zero, 0x3
/* 8C5A0 8009BDA0 08006214 */  bne        $v1, $v0, .L8009BDC4
/* 8C5A4 8009BDA4 21108002 */   addu      $v0, $s4, $zero
/* 8C5A8 8009BDA8 8000043C */  lui        $a0, (0x800010 >> 16)
/* 8C5AC 8009BDAC 10008434 */  ori        $a0, $a0, (0x800010 & 0xFFFF)
/* 8C5B0 8009BDB0 0000438E */  lw         $v1, 0x0($s2)
/* 8C5B4 8009BDB4 00000000 */  nop
/* 8C5B8 8009BDB8 02006414 */  bne        $v1, $a0, .L8009BDC4
/* 8C5BC 8009BDBC 21100000 */   addu      $v0, $zero, $zero
.L8009BDC0:
/* 8C5C0 8009BDC0 21108002 */  addu       $v0, $s4, $zero
.L8009BDC4:
/* 8C5C4 8009BDC4 2400BF8F */  lw         $ra, 0x24($sp)
/* 8C5C8 8009BDC8 2000B48F */  lw         $s4, 0x20($sp)
/* 8C5CC 8009BDCC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 8C5D0 8009BDD0 1800B28F */  lw         $s2, 0x18($sp)
/* 8C5D4 8009BDD4 1400B18F */  lw         $s1, 0x14($sp)
/* 8C5D8 8009BDD8 1000B08F */  lw         $s0, 0x10($sp)
/* 8C5DC 8009BDDC 0800E003 */  jr         $ra
/* 8C5E0 8009BDE0 2800BD27 */   addiu     $sp, $sp, 0x28
.size StateHandlerDecodeHold, . - StateHandlerDecodeHold
