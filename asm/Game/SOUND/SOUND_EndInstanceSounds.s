.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_EndInstanceSounds
/* 2F678 8003EE78 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2F67C 8003EE7C 1000B0AF */  sw         $s0, 0x10($sp)
/* 2F680 8003EE80 21808000 */  addu       $s0, $a0, $zero
/* 2F684 8003EE84 2400BFAF */  sw         $ra, 0x24($sp)
/* 2F688 8003EE88 2000B4AF */  sw         $s4, 0x20($sp)
/* 2F68C 8003EE8C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2F690 8003EE90 1800B2AF */  sw         $s2, 0x18($sp)
/* 2F694 8003EE94 4B000012 */  beqz       $s0, .L8003EFC4
/* 2F698 8003EE98 1400B1AF */   sw        $s1, 0x14($sp)
/* 2F69C 8003EE9C 4900A010 */  beqz       $a1, .L8003EFC4
/* 2F6A0 8003EEA0 BE000224 */   addiu     $v0, $zero, 0xBE
/* 2F6A4 8003EEA4 00000392 */  lbu        $v1, 0x0($s0)
/* 2F6A8 8003EEA8 00000000 */  nop
/* 2F6AC 8003EEAC 45006214 */  bne        $v1, $v0, .L8003EFC4
/* 2F6B0 8003EEB0 01001026 */   addiu     $s0, $s0, 0x1
/* 2F6B4 8003EEB4 00000392 */  lbu        $v1, 0x0($s0)
/* 2F6B8 8003EEB8 EF000224 */  addiu      $v0, $zero, 0xEF
/* 2F6BC 8003EEBC 41006214 */  bne        $v1, $v0, .L8003EFC4
/* 2F6C0 8003EEC0 01001026 */   addiu     $s0, $s0, 0x1
/* 2F6C4 8003EEC4 00001392 */  lbu        $s3, 0x0($s0)
/* 2F6C8 8003EEC8 02001026 */  addiu      $s0, $s0, 0x2
/* 2F6CC 8003EECC 3D006012 */  beqz       $s3, .L8003EFC4
/* 2F6D0 8003EED0 21900000 */   addu      $s2, $zero, $zero
/* 2F6D4 8003EED4 FF001424 */  addiu      $s4, $zero, 0xFF
/* 2F6D8 8003EED8 2188A000 */  addu       $s1, $a1, $zero
.L8003EEDC:
/* 2F6DC 8003EEDC 00000392 */  lbu        $v1, 0x0($s0)
/* 2F6E0 8003EEE0 01000224 */  addiu      $v0, $zero, 0x1
/* 2F6E4 8003EEE4 18006210 */  beq        $v1, $v0, .L8003EF48
/* 2F6E8 8003EEE8 02006228 */   slti      $v0, $v1, 0x2
/* 2F6EC 8003EEEC 05004010 */  beqz       $v0, .L8003EF04
/* 2F6F0 8003EEF0 05006228 */   slti      $v0, $v1, 0x5
/* 2F6F4 8003EEF4 07006010 */  beqz       $v1, .L8003EF14
/* 2F6F8 8003EEF8 00000000 */   nop
/* 2F6FC 8003EEFC EDFB0008 */  j          .L8003EFB4
/* 2F700 8003EF00 03003126 */   addiu     $s1, $s1, 0x3
.L8003EF04:
/* 2F704 8003EF04 1D004014 */  bnez       $v0, .L8003EF7C
/* 2F708 8003EF08 00000000 */   nop
/* 2F70C 8003EF0C EDFB0008 */  j          .L8003EFB4
/* 2F710 8003EF10 03003126 */   addiu     $s1, $s1, 0x3
.L8003EF14:
/* 2F714 8003EF14 01000292 */  lbu        $v0, 0x1($s0)
/* 2F718 8003EF18 00002492 */  lbu        $a0, 0x0($s1)
/* 2F71C 8003EF1C 40100200 */  sll        $v0, $v0, 1
/* 2F720 8003EF20 12004224 */  addiu      $v0, $v0, 0x12
/* 2F724 8003EF24 32FB000C */  jal        SndGetSfxChannel
/* 2F728 8003EF28 21800202 */   addu      $s0, $s0, $v0
/* 2F72C 8003EF2C 20004010 */  beqz       $v0, .L8003EFB0
/* 2F730 8003EF30 00000000 */   nop
/* 2F734 8003EF34 0400448C */  lw         $a0, 0x4($v0)
/* 2F738 8003EF38 1C02010C */  jal        SndEndLoop
/* 2F73C 8003EF3C 00000000 */   nop
/* 2F740 8003EF40 E7FB0008 */  j          .L8003EF9C
/* 2F744 8003EF44 00000000 */   nop
.L8003EF48:
/* 2F748 8003EF48 01000292 */  lbu        $v0, 0x1($s0)
/* 2F74C 8003EF4C 00002492 */  lbu        $a0, 0x0($s1)
/* 2F750 8003EF50 40100200 */  sll        $v0, $v0, 1
/* 2F754 8003EF54 0E004224 */  addiu      $v0, $v0, 0xE
/* 2F758 8003EF58 32FB000C */  jal        SndGetSfxChannel
/* 2F75C 8003EF5C 21800202 */   addu      $s0, $s0, $v0
/* 2F760 8003EF60 13004010 */  beqz       $v0, .L8003EFB0
/* 2F764 8003EF64 00000000 */   nop
/* 2F768 8003EF68 0400448C */  lw         $a0, 0x4($v0)
/* 2F76C 8003EF6C 1C02010C */  jal        SndEndLoop
/* 2F770 8003EF70 00000000 */   nop
/* 2F774 8003EF74 E7FB0008 */  j          .L8003EF9C
/* 2F778 8003EF78 00000000 */   nop
.L8003EF7C:
/* 2F77C 8003EF7C 01000292 */  lbu        $v0, 0x1($s0)
/* 2F780 8003EF80 00002492 */  lbu        $a0, 0x0($s1)
/* 2F784 8003EF84 40100200 */  sll        $v0, $v0, 1
/* 2F788 8003EF88 0E004224 */  addiu      $v0, $v0, 0xE
/* 2F78C 8003EF8C 32FB000C */  jal        SndGetSfxChannel
/* 2F790 8003EF90 21800202 */   addu      $s0, $s0, $v0
/* 2F794 8003EF94 06004010 */  beqz       $v0, .L8003EFB0
/* 2F798 8003EF98 00000000 */   nop
.L8003EF9C:
/* 2F79C 8003EF9C 00002492 */  lbu        $a0, 0x0($s1)
/* 2F7A0 8003EFA0 28FB000C */  jal        SndCloseSfxChannel
/* 2F7A4 8003EFA4 00000000 */   nop
/* 2F7A8 8003EFA8 000034A2 */  sb         $s4, 0x0($s1)
/* 2F7AC 8003EFAC 010020A2 */  sb         $zero, 0x1($s1)
.L8003EFB0:
/* 2F7B0 8003EFB0 03003126 */  addiu      $s1, $s1, 0x3
.L8003EFB4:
/* 2F7B4 8003EFB4 01005226 */  addiu      $s2, $s2, 0x1
/* 2F7B8 8003EFB8 2A105302 */  slt        $v0, $s2, $s3
/* 2F7BC 8003EFBC C7FF4014 */  bnez       $v0, .L8003EEDC
/* 2F7C0 8003EFC0 00000000 */   nop
.L8003EFC4:
/* 2F7C4 8003EFC4 2400BF8F */  lw         $ra, 0x24($sp)
/* 2F7C8 8003EFC8 2000B48F */  lw         $s4, 0x20($sp)
/* 2F7CC 8003EFCC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2F7D0 8003EFD0 1800B28F */  lw         $s2, 0x18($sp)
/* 2F7D4 8003EFD4 1400B18F */  lw         $s1, 0x14($sp)
/* 2F7D8 8003EFD8 1000B08F */  lw         $s0, 0x10($sp)
/* 2F7DC 8003EFDC 0800E003 */  jr         $ra
/* 2F7E0 8003EFE0 2800BD27 */   addiu     $sp, $sp, 0x28
.size SOUND_EndInstanceSounds, . - SOUND_EndInstanceSounds
