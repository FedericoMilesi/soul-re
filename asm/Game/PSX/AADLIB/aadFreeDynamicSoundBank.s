.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadFreeDynamicSoundBank
/* 43160 80052960 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 43164 80052964 02008228 */  slti       $v0, $a0, 0x2
/* 43168 80052968 1400BFAF */  sw         $ra, 0x14($sp)
/* 4316C 8005296C 03004014 */  bnez       $v0, .L8005297C
/* 43170 80052970 1000B0AF */   sw        $s0, 0x10($sp)
/* 43174 80052974 734A0108 */  j          .L800529CC
/* 43178 80052978 05100224 */   addiu     $v0, $zero, 0x1005
.L8005297C:
/* 4317C 8005297C D89B858F */  lw         $a1, %gp_rel(aadMem)($gp)
/* 43180 80052980 80800400 */  sll        $s0, $a0, 2
/* 43184 80052984 2120B000 */  addu       $a0, $a1, $s0
/* 43188 80052988 0005838C */  lw         $v1, 0x500($a0)
/* 4318C 8005298C 02000224 */  addiu      $v0, $zero, 0x2
/* 43190 80052990 0E006214 */  bne        $v1, $v0, .L800529CC
/* 43194 80052994 07100224 */   addiu     $v0, $zero, 0x1007
/* 43198 80052998 0805828C */  lw         $v0, 0x508($a0)
/* 4319C 8005299C 00000000 */  nop
/* 431A0 800529A0 0A004010 */  beqz       $v0, .L800529CC
/* 431A4 800529A4 07100224 */   addiu     $v0, $zero, 0x1007
/* 431A8 800529A8 000580AC */  sw         $zero, 0x500($a0)
/* 431AC 800529AC 3C07A28C */  lw         $v0, 0x73C($a1)
/* 431B0 800529B0 0805848C */  lw         $a0, 0x508($a0)
/* 431B4 800529B4 09F84000 */  jalr       $v0
/* 431B8 800529B8 00000000 */   nop
/* 431BC 800529BC D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 431C0 800529C0 21100000 */  addu       $v0, $zero, $zero
/* 431C4 800529C4 21187000 */  addu       $v1, $v1, $s0
/* 431C8 800529C8 080560AC */  sw         $zero, 0x508($v1)
.L800529CC:
/* 431CC 800529CC 1400BF8F */  lw         $ra, 0x14($sp)
/* 431D0 800529D0 1000B08F */  lw         $s0, 0x10($sp)
/* 431D4 800529D4 0800E003 */  jr         $ra
/* 431D8 800529D8 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadFreeDynamicSoundBank, . - aadFreeDynamicSoundBank
