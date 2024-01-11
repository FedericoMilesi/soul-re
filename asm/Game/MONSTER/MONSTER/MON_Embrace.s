.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Embrace
/* 7C438 8008BC38 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7C43C 8008BC3C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7C440 8008BC40 21988000 */  addu       $s3, $a0, $zero
/* 7C444 8008BC44 2000BFAF */  sw         $ra, 0x20($sp)
/* 7C448 8008BC48 1800B2AF */  sw         $s2, 0x18($sp)
/* 7C44C 8008BC4C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7C450 8008BC50 1000B0AF */  sw         $s0, 0x10($sp)
/* 7C454 8008BC54 6C01708E */  lw         $s0, 0x16C($s3)
/* 7C458 8008BC58 00000000 */  nop
/* 7C45C 8008BC5C C400118E */  lw         $s1, 0xC4($s0)
/* 7C460 8008BC60 00000000 */  nop
/* 7C464 8008BC64 3E002012 */  beqz       $s1, .L8008BD60
/* 7C468 8008BC68 02000524 */   addiu     $a1, $zero, 0x2
/* 7C46C 8008BC6C 6801028E */  lw         $v0, 0x168($s0)
/* 7C470 8008BC70 00000000 */  nop
/* 7C474 8008BC74 0800428C */  lw         $v0, 0x8($v0)
/* 7C478 8008BC78 14002386 */  lh         $v1, 0x14($s1)
/* 7C47C 8008BC7C 18004284 */  lh         $v0, 0x18($v0)
/* 7C480 8008BC80 00000000 */  nop
/* 7C484 8008BC84 2A104300 */  slt        $v0, $v0, $v1
/* 7C488 8008BC88 12004014 */  bnez       $v0, .L8008BCD4
/* 7C48C 8008BC8C 2010033C */   lui       $v1, (0x10200000 >> 16)
/* 7C490 8008BC90 1400228E */  lw         $v0, 0x14($s1)
/* 7C494 8008BC94 00000000 */  nop
/* 7C498 8008BC98 24104300 */  and        $v0, $v0, $v1
/* 7C49C 8008BC9C 0D004314 */  bne        $v0, $v1, .L8008BCD4
/* 7C4A0 8008BCA0 00000000 */   nop
/* 7C4A4 8008BCA4 0000028E */  lw         $v0, 0x0($s0)
/* 7C4A8 8008BCA8 00000000 */  nop
/* 7C4AC 8008BCAC 04004230 */  andi       $v0, $v0, 0x4
/* 7C4B0 8008BCB0 08004014 */  bnez       $v0, .L8008BCD4
/* 7C4B4 8008BCB4 00000000 */   nop
/* 7C4B8 8008BCB8 9006020C */  jal        MON_GetTime
/* 7C4BC 8008BCBC 00000000 */   nop
/* 7C4C0 8008BCC0 1401038E */  lw         $v1, 0x114($s0)
/* 7C4C4 8008BCC4 00000000 */  nop
/* 7C4C8 8008BCC8 2B186200 */  sltu       $v1, $v1, $v0
/* 7C4CC 8008BCCC 04006010 */  beqz       $v1, .L8008BCE0
/* 7C4D0 8008BCD0 00000000 */   nop
.L8008BCD4:
/* 7C4D4 8008BCD4 21206002 */  addu       $a0, $s3, $zero
/* 7C4D8 8008BCD8 592F0208 */  j          .L8008BD64
/* 7C4DC 8008BCDC 0D000524 */   addiu     $a1, $zero, 0xD
.L8008BCE0:
/* 7C4E0 8008BCE0 0400328E */  lw         $s2, 0x4($s1)
/* 7C4E4 8008BCE4 21206002 */  addu       $a0, $s3, $zero
/* 7C4E8 8008BCE8 7611020C */  jal        MON_DoDrainEffects
/* 7C4EC 8008BCEC 21284002 */   addu      $a1, $s2, $zero
/* 7C4F0 8008BCF0 6801028E */  lw         $v0, 0x168($s0)
/* 7C4F4 8008BCF4 21204002 */  addu       $a0, $s2, $zero
/* 7C4F8 8008BCF8 0800428C */  lw         $v0, 0x8($v0)
/* 7C4FC 8008BCFC 0400053C */  lui        $a1, (0x40006 >> 16)
/* 7C500 8008BD00 16004684 */  lh         $a2, 0x16($v0)
/* 7C504 8008BD04 0600A534 */  ori        $a1, $a1, (0x40006 & 0xFFFF)
/* 7C508 8008BD08 A1D1000C */  jal        INSTANCE_Post
/* 7C50C 8008BD0C 00320600 */   sll       $a2, $a2, 8
/* 7C510 8008BD10 6801028E */  lw         $v0, 0x168($s0)
/* 7C514 8008BD14 00000000 */  nop
/* 7C518 8008BD18 0800428C */  lw         $v0, 0x8($v0)
/* 7C51C 8008BD1C 00000000 */  nop
/* 7C520 8008BD20 16004684 */  lh         $a2, 0x16($v0)
/* 7C524 8008BD24 00000000 */  nop
/* 7C528 8008BD28 0200C104 */  bgez       $a2, .L8008BD34
/* 7C52C 8008BD2C 21206002 */   addu      $a0, $s3, $zero
/* 7C530 8008BD30 0700C624 */  addiu      $a2, $a2, 0x7
.L8008BD34:
/* 7C534 8008BD34 0001053C */  lui        $a1, (0x1000016 >> 16)
/* 7C538 8008BD38 1600A534 */  ori        $a1, $a1, (0x1000016 & 0xFFFF)
/* 7C53C 8008BD3C A1D1000C */  jal        INSTANCE_Post
/* 7C540 8008BD40 C3300600 */   sra       $a2, $a2, 3
/* 7C544 8008BD44 6801028E */  lw         $v0, 0x168($s0)
/* 7C548 8008BD48 21206002 */  addu       $a0, $s3, $zero
/* 7C54C 8008BD4C 1C004684 */  lh         $a2, 0x1C($v0)
/* 7C550 8008BD50 6604020C */  jal        MON_TurnToPosition
/* 7C554 8008BD54 5C004526 */   addiu     $a1, $s2, 0x5C
/* 7C558 8008BD58 5B2F0208 */  j          .L8008BD6C
/* 7C55C 8008BD5C 00000000 */   nop
.L8008BD60:
/* 7C560 8008BD60 21206002 */  addu       $a0, $s3, $zero
.L8008BD64:
/* 7C564 8008BD64 91FE010C */  jal        MON_SwitchState
/* 7C568 8008BD68 00000000 */   nop
.L8008BD6C:
/* 7C56C 8008BD6C 0917020C */  jal        MON_DefaultQueueHandler
/* 7C570 8008BD70 21206002 */   addu      $a0, $s3, $zero
/* 7C574 8008BD74 09002012 */  beqz       $s1, .L8008BD9C
/* 7C578 8008BD78 1B000224 */   addiu     $v0, $zero, 0x1B
/* 7C57C 8008BD7C 9801638E */  lw         $v1, 0x198($s3)
/* 7C580 8008BD80 00000000 */  nop
/* 7C584 8008BD84 05006210 */  beq        $v1, $v0, .L8008BD9C
/* 7C588 8008BD88 00000000 */   nop
/* 7C58C 8008BD8C 16002296 */  lhu        $v0, 0x16($s1)
/* 7C590 8008BD90 00000000 */  nop
/* 7C594 8008BD94 FFEF4230 */  andi       $v0, $v0, 0xEFFF
/* 7C598 8008BD98 160022A6 */  sh         $v0, 0x16($s1)
.L8008BD9C:
/* 7C59C 8008BD9C 2000BF8F */  lw         $ra, 0x20($sp)
/* 7C5A0 8008BDA0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7C5A4 8008BDA4 1800B28F */  lw         $s2, 0x18($sp)
/* 7C5A8 8008BDA8 1400B18F */  lw         $s1, 0x14($sp)
/* 7C5AC 8008BDAC 1000B08F */  lw         $s0, 0x10($sp)
/* 7C5B0 8008BDB0 0800E003 */  jr         $ra
/* 7C5B4 8008BDB4 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_Embrace, . - MON_Embrace
