.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFogNearFar
/* AD720 800BCF20 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AD724 800BCF24 2338A400 */  subu       $a3, $a1, $a0
/* AD728 800BCF28 6400E228 */  slti       $v0, $a3, 0x64
/* AD72C 800BCF2C 1400BFAF */  sw         $ra, 0x14($sp)
/* AD730 800BCF30 38004014 */  bnez       $v0, .L800BD014
/* AD734 800BCF34 1000B0AF */   sw        $s0, 0x10($sp)
/* AD738 800BCF38 23100400 */  negu       $v0, $a0
/* AD73C 800BCF3C 18004500 */  mult       $v0, $a1
/* AD740 800BCF40 12100000 */  mflo       $v0
/* AD744 800BCF44 00000000 */  nop
/* AD748 800BCF48 00000000 */  nop
/* AD74C 800BCF4C 1A004700 */  div        $zero, $v0, $a3
/* AD750 800BCF50 0200E014 */  bnez       $a3, .L800BCF5C
/* AD754 800BCF54 00000000 */   nop
/* AD758 800BCF58 0D000700 */  break      7
.L800BCF5C:
/* AD75C 800BCF5C FFFF0124 */  addiu      $at, $zero, -0x1
/* AD760 800BCF60 0400E114 */  bne        $a3, $at, .L800BCF74
/* AD764 800BCF64 0080013C */   lui       $at, (0x80000000 >> 16)
/* AD768 800BCF68 02004114 */  bne        $v0, $at, .L800BCF74
/* AD76C 800BCF6C 00000000 */   nop
/* AD770 800BCF70 0D000600 */  break      6
.L800BCF74:
/* AD774 800BCF74 12100000 */  mflo       $v0
/* AD778 800BCF78 001B0500 */  sll        $v1, $a1, 12
/* AD77C 800BCF7C 00000000 */  nop
/* AD780 800BCF80 1A006700 */  div        $zero, $v1, $a3
/* AD784 800BCF84 0200E014 */  bnez       $a3, .L800BCF90
/* AD788 800BCF88 00000000 */   nop
/* AD78C 800BCF8C 0D000700 */  break      7
.L800BCF90:
/* AD790 800BCF90 FFFF0124 */  addiu      $at, $zero, -0x1
/* AD794 800BCF94 0400E114 */  bne        $a3, $at, .L800BCFA8
/* AD798 800BCF98 0080013C */   lui       $at, (0x80000000 >> 16)
/* AD79C 800BCF9C 02006114 */  bne        $v1, $at, .L800BCFA8
/* AD7A0 800BCFA0 00000000 */   nop
/* AD7A4 800BCFA4 0D000600 */  break      6
.L800BCFA8:
/* AD7A8 800BCFA8 12180000 */  mflo       $v1
/* AD7AC 800BCFAC 00120200 */  sll        $v0, $v0, 8
/* AD7B0 800BCFB0 00000000 */  nop
/* AD7B4 800BCFB4 1A004600 */  div        $zero, $v0, $a2
/* AD7B8 800BCFB8 0200C014 */  bnez       $a2, .L800BCFC4
/* AD7BC 800BCFBC 00000000 */   nop
/* AD7C0 800BCFC0 0D000700 */  break      7
.L800BCFC4:
/* AD7C4 800BCFC4 FFFF0124 */  addiu      $at, $zero, -0x1
/* AD7C8 800BCFC8 0400C114 */  bne        $a2, $at, .L800BCFDC
/* AD7CC 800BCFCC 0080013C */   lui       $at, (0x80000000 >> 16)
/* AD7D0 800BCFD0 02004114 */  bne        $v0, $at, .L800BCFDC
/* AD7D4 800BCFD4 00000000 */   nop
/* AD7D8 800BCFD8 0D000600 */  break      6
.L800BCFDC:
/* AD7DC 800BCFDC 12200000 */  mflo       $a0
/* AD7E0 800BCFE0 00808228 */  slti       $v0, $a0, -0x8000
/* AD7E4 800BCFE4 02004010 */  beqz       $v0, .L800BCFF0
/* AD7E8 800BCFE8 00830300 */   sll       $s0, $v1, 12
/* AD7EC 800BCFEC 00800424 */  addiu      $a0, $zero, -0x8000
.L800BCFF0:
/* AD7F0 800BCFF0 FF7F0224 */  addiu      $v0, $zero, 0x7FFF
/* AD7F4 800BCFF4 2A104400 */  slt        $v0, $v0, $a0
/* AD7F8 800BCFF8 02004010 */  beqz       $v0, .L800BD004
/* AD7FC 800BCFFC 00000000 */   nop
/* AD800 800BD000 FF7F0424 */  addiu      $a0, $zero, 0x7FFF
.L800BD004:
/* AD804 800BD004 DF08030C */  jal        SetDQA
/* AD808 800BD008 00000000 */   nop
/* AD80C 800BD00C E208030C */  jal        SetDQB
/* AD810 800BD010 21200002 */   addu      $a0, $s0, $zero
.L800BD014:
/* AD814 800BD014 1400BF8F */  lw         $ra, 0x14($sp)
/* AD818 800BD018 1000B08F */  lw         $s0, 0x10($sp)
/* AD81C 800BD01C 0800E003 */  jr         $ra
/* AD820 800BD020 1800BD27 */   addiu     $sp, $sp, 0x18
/* AD824 800BD024 00000000 */  nop
/* AD828 800BD028 00000000 */  nop
/* AD82C 800BD02C 00000000 */  nop
.size SetFogNearFar, . - SetFogNearFar
