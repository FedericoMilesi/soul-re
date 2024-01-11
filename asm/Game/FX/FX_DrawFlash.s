.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawFlash
/* 3CB28 8004C328 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3CB2C 8004C32C 2400BFAF */  sw         $ra, 0x24($sp)
/* 3CB30 8004C330 2000B0AF */  sw         $s0, 0x20($sp)
/* 3CB34 8004C334 1C00828C */  lw         $v0, 0x1C($a0)
/* 3CB38 8004C338 00000000 */  nop
/* 3CB3C 8004C33C 03004104 */  bgez       $v0, .L8004C34C
/* 3CB40 8004C340 03290200 */   sra       $a1, $v0, 4
/* 3CB44 8004C344 0F004224 */  addiu      $v0, $v0, 0xF
/* 3CB48 8004C348 03290200 */  sra        $a1, $v0, 4
.L8004C34C:
/* 3CB4C 8004C34C 2000838C */  lw         $v1, 0x20($a0)
/* 3CB50 8004C350 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 3CB54 8004C354 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 3CB58 8004C358 1800A3AF */  sw         $v1, 0x18($sp)
/* 3CB5C 8004C35C 24186200 */  and        $v1, $v1, $v0
/* 3CB60 8004C360 02006010 */  beqz       $v1, .L8004C36C
/* 3CB64 8004C364 01001024 */   addiu     $s0, $zero, 0x1
/* 3CB68 8004C368 02001024 */  addiu      $s0, $zero, 0x2
.L8004C36C:
/* 3CB6C 8004C36C 1000868C */  lw         $a2, 0x10($a0)
/* 3CB70 8004C370 00000000 */  nop
/* 3CB74 8004C374 2A10A600 */  slt        $v0, $a1, $a2
/* 3CB78 8004C378 0E004010 */  beqz       $v0, .L8004C3B4
/* 3CB7C 8004C37C 00130500 */   sll       $v0, $a1, 12
/* 3CB80 8004C380 1A004600 */  div        $zero, $v0, $a2
/* 3CB84 8004C384 12380000 */  mflo       $a3
/* 3CB88 8004C388 00000000 */  nop
/* 3CB8C 8004C38C 0110E228 */  slti       $v0, $a3, 0x1001
/* 3CB90 8004C390 02004014 */  bnez       $v0, .L8004C39C
/* 3CB94 8004C394 1800A427 */   addiu     $a0, $sp, 0x18
/* 3CB98 8004C398 00100724 */  addiu      $a3, $zero, 0x1000
.L8004C39C:
/* 3CB9C 8004C39C 1000A4AF */  sw         $a0, 0x10($sp)
/* 3CBA0 8004C3A0 1C00A527 */  addiu      $a1, $sp, 0x1C
/* 3CBA4 8004C3A4 2130E000 */  addu       $a2, $a3, $zero
/* 3CBA8 8004C3A8 00100724 */  addiu      $a3, $zero, 0x1000
/* 3CBAC 8004C3AC 05310108 */  j          .L8004C414
/* 3CBB0 8004C3B0 2338E600 */   subu      $a3, $a3, $a2
.L8004C3B4:
/* 3CBB4 8004C3B4 1400838C */  lw         $v1, 0x14($a0)
/* 3CBB8 8004C3B8 00000000 */  nop
/* 3CBBC 8004C3BC 2A106500 */  slt        $v0, $v1, $a1
/* 3CBC0 8004C3C0 16004010 */  beqz       $v0, .L8004C41C
/* 3CBC4 8004C3C4 00000000 */   nop
/* 3CBC8 8004C3C8 1800828C */  lw         $v0, 0x18($a0)
/* 3CBCC 8004C3CC 00000000 */  nop
/* 3CBD0 8004C3D0 23304300 */  subu       $a2, $v0, $v1
/* 3CBD4 8004C3D4 0600C010 */  beqz       $a2, .L8004C3F0
/* 3CBD8 8004C3D8 2310A300 */   subu      $v0, $a1, $v1
/* 3CBDC 8004C3DC 00130200 */  sll        $v0, $v0, 12
/* 3CBE0 8004C3E0 1A004600 */  div        $zero, $v0, $a2
/* 3CBE4 8004C3E4 12380000 */  mflo       $a3
/* 3CBE8 8004C3E8 FE300108 */  j          .L8004C3F8
/* 3CBEC 8004C3EC 0110E228 */   slti      $v0, $a3, 0x1001
.L8004C3F0:
/* 3CBF0 8004C3F0 00100724 */  addiu      $a3, $zero, 0x1000
/* 3CBF4 8004C3F4 0110E228 */  slti       $v0, $a3, 0x1001
.L8004C3F8:
/* 3CBF8 8004C3F8 02004014 */  bnez       $v0, .L8004C404
/* 3CBFC 8004C3FC 1800A427 */   addiu     $a0, $sp, 0x18
/* 3CC00 8004C400 00100724 */  addiu      $a3, $zero, 0x1000
.L8004C404:
/* 3CC04 8004C404 1000A4AF */  sw         $a0, 0x10($sp)
/* 3CC08 8004C408 1C00A527 */  addiu      $a1, $sp, 0x1C
/* 3CC0C 8004C40C 00100624 */  addiu      $a2, $zero, 0x1000
/* 3CC10 8004C410 2330C700 */  subu       $a2, $a2, $a3
.L8004C414:
/* 3CC14 8004C414 A8F3020C */  jal        func_800BCEA0
/* 3CC18 8004C418 00000000 */   nop
.L8004C41C:
/* 3CC1C 8004C41C 21200002 */  addu       $a0, $s0, $zero
/* 3CC20 8004C420 1800A58F */  lw         $a1, 0x18($sp)
/* 3CC24 8004C424 181A010C */  jal        FX_DrawScreenPoly
/* 3CC28 8004C428 05000624 */   addiu     $a2, $zero, 0x5
/* 3CC2C 8004C42C 2400BF8F */  lw         $ra, 0x24($sp)
/* 3CC30 8004C430 2000B08F */  lw         $s0, 0x20($sp)
/* 3CC34 8004C434 0800E003 */  jr         $ra
/* 3CC38 8004C438 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_DrawFlash, . - FX_DrawFlash
