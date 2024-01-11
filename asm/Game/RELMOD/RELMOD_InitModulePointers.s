.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RELMOD_InitModulePointers
/* 6D3A4 8007CBA4 0000A38C */  lw         $v1, 0x0($a1)
/* 6D3A8 8007CBA8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6D3AC 8007CBAC 34006210 */  beq        $v1, $v0, .L8007CC80
/* 6D3B0 8007CBB0 FCFF0C24 */   addiu     $t4, $zero, -0x4
/* 6D3B4 8007CBB4 01000B24 */  addiu      $t3, $zero, 0x1
/* 6D3B8 8007CBB8 02000A24 */  addiu      $t2, $zero, 0x2
/* 6D3BC 8007CBBC 03000924 */  addiu      $t1, $zero, 0x3
/* 6D3C0 8007CBC0 00800834 */  ori        $t0, $zero, 0x8000
/* 6D3C4 8007CBC4 00110400 */  sll        $v0, $a0, 4
/* 6D3C8 8007CBC8 82390200 */  srl        $a3, $v0, 6
/* 6D3CC 8007CBCC 0000A38C */  lw         $v1, 0x0($a1)
/* 6D3D0 8007CBD0 0400A524 */  addiu      $a1, $a1, 0x4
.L8007CBD4:
/* 6D3D4 8007CBD4 24106C00 */  and        $v0, $v1, $t4
/* 6D3D8 8007CBD8 03006330 */  andi       $v1, $v1, 0x3
/* 6D3DC 8007CBDC 14006B10 */  beq        $v1, $t3, .L8007CC30
/* 6D3E0 8007CBE0 21308200 */   addu      $a2, $a0, $v0
/* 6D3E4 8007CBE4 02006228 */  slti       $v0, $v1, 0x2
/* 6D3E8 8007CBE8 05004010 */  beqz       $v0, .L8007CC00
/* 6D3EC 8007CBEC 00000000 */   nop
/* 6D3F0 8007CBF0 09006010 */  beqz       $v1, .L8007CC18
/* 6D3F4 8007CBF4 00000000 */   nop
/* 6D3F8 8007CBF8 1CF30108 */  j          .L8007CC70
/* 6D3FC 8007CBFC 00000000 */   nop
.L8007CC00:
/* 6D400 8007CC00 12006A10 */  beq        $v1, $t2, .L8007CC4C
/* 6D404 8007CC04 00000000 */   nop
/* 6D408 8007CC08 15006910 */  beq        $v1, $t1, .L8007CC60
/* 6D40C 8007CC0C 00000000 */   nop
/* 6D410 8007CC10 1CF30108 */  j          .L8007CC70
/* 6D414 8007CC14 00000000 */   nop
.L8007CC18:
/* 6D418 8007CC18 0000C28C */  lw         $v0, 0x0($a2)
/* 6D41C 8007CC1C 00000000 */  nop
/* 6D420 8007CC20 13004004 */  bltz       $v0, .L8007CC70
/* 6D424 8007CC24 21104400 */   addu      $v0, $v0, $a0
/* 6D428 8007CC28 1CF30108 */  j          .L8007CC70
/* 6D42C 8007CC2C 0000C2AC */   sw        $v0, 0x0($a2)
.L8007CC30:
/* 6D430 8007CC30 0000A28C */  lw         $v0, 0x0($a1)
/* 6D434 8007CC34 0400A524 */  addiu      $a1, $a1, 0x4
/* 6D438 8007CC38 21108200 */  addu       $v0, $a0, $v0
/* 6D43C 8007CC3C 21104800 */  addu       $v0, $v0, $t0
/* 6D440 8007CC40 03140200 */  sra        $v0, $v0, 16
/* 6D444 8007CC44 1CF30108 */  j          .L8007CC70
/* 6D448 8007CC48 0000C2A4 */   sh        $v0, 0x0($a2)
.L8007CC4C:
/* 6D44C 8007CC4C 0000C294 */  lhu        $v0, 0x0($a2)
/* 6D450 8007CC50 00000000 */  nop
/* 6D454 8007CC54 21104400 */  addu       $v0, $v0, $a0
/* 6D458 8007CC58 1CF30108 */  j          .L8007CC70
/* 6D45C 8007CC5C 0000C2A4 */   sh        $v0, 0x0($a2)
.L8007CC60:
/* 6D460 8007CC60 0000C28C */  lw         $v0, 0x0($a2)
/* 6D464 8007CC64 00000000 */  nop
/* 6D468 8007CC68 21104700 */  addu       $v0, $v0, $a3
/* 6D46C 8007CC6C 0000C2AC */  sw         $v0, 0x0($a2)
.L8007CC70:
/* 6D470 8007CC70 0000A38C */  lw         $v1, 0x0($a1)
/* 6D474 8007CC74 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6D478 8007CC78 D6FF6214 */  bne        $v1, $v0, .L8007CBD4
/* 6D47C 8007CC7C 0400A524 */   addiu     $a1, $a1, 0x4
.L8007CC80:
/* 6D480 8007CC80 0800E003 */  jr         $ra
/* 6D484 8007CC84 00000000 */   nop
.size RELMOD_InitModulePointers, . - RELMOD_InitModulePointers
