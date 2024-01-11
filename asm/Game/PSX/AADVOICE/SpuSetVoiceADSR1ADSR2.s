.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetVoiceADSR1ADSR2
/* 488A8 800580A8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 488AC 800580AC 2800BFAF */  sw         $ra, 0x28($sp)
/* 488B0 800580B0 0F00AB30 */  andi       $t3, $a1, 0xF
/* 488B4 800580B4 FFFFA230 */  andi       $v0, $a1, 0xFFFF
/* 488B8 800580B8 02190200 */  srl        $v1, $v0, 4
/* 488BC 800580BC 0F006330 */  andi       $v1, $v1, 0xF
/* 488C0 800580C0 02120200 */  srl        $v0, $v0, 8
/* 488C4 800580C4 7F004C30 */  andi       $t4, $v0, 0x7F
/* 488C8 800580C8 01000924 */  addiu      $t1, $zero, 0x1
/* 488CC 800580CC 0080A530 */  andi       $a1, $a1, 0x8000
/* 488D0 800580D0 0200A010 */  beqz       $a1, .L800580DC
/* 488D4 800580D4 2138C000 */   addu      $a3, $a2, $zero
/* 488D8 800580D8 05000924 */  addiu      $t1, $zero, 0x5
.L800580DC:
/* 488DC 800580DC 1F00CA30 */  andi       $t2, $a2, 0x1F
/* 488E0 800580E0 2000C230 */  andi       $v0, $a2, 0x20
/* 488E4 800580E4 02004010 */  beqz       $v0, .L800580F0
/* 488E8 800580E8 03000824 */   addiu     $t0, $zero, 0x3
/* 488EC 800580EC 07000824 */  addiu      $t0, $zero, 0x7
.L800580F0:
/* 488F0 800580F0 82110700 */  srl        $v0, $a3, 6
/* 488F4 800580F4 7F004730 */  andi       $a3, $v0, 0x7F
/* 488F8 800580F8 0040C230 */  andi       $v0, $a2, 0x4000
/* 488FC 800580FC 05004010 */  beqz       $v0, .L80058114
/* 48900 80058100 0080C230 */   andi      $v0, $a2, 0x8000
/* 48904 80058104 06004010 */  beqz       $v0, .L80058120
/* 48908 80058108 03000524 */   addiu     $a1, $zero, 0x3
/* 4890C 8005810C 48600108 */  j          .L80058120
/* 48910 80058110 07000524 */   addiu     $a1, $zero, 0x7
.L80058114:
/* 48914 80058114 02004010 */  beqz       $v0, .L80058120
/* 48918 80058118 01000524 */   addiu     $a1, $zero, 0x1
/* 4891C 8005811C 05000524 */  addiu      $a1, $zero, 0x5
.L80058120:
/* 48920 80058120 1C00A5AF */  sw         $a1, 0x1C($sp)
/* 48924 80058124 21288001 */  addu       $a1, $t4, $zero
/* 48928 80058128 21306000 */  addu       $a2, $v1, $zero
/* 4892C 8005812C 1000AAAF */  sw         $t2, 0x10($sp)
/* 48930 80058130 1400ABAF */  sw         $t3, 0x14($sp)
/* 48934 80058134 1800A9AF */  sw         $t1, 0x18($sp)
/* 48938 80058138 1001030C */  jal        func_800C0440
/* 4893C 8005813C 2000A8AF */   sw        $t0, 0x20($sp)
/* 48940 80058140 2800BF8F */  lw         $ra, 0x28($sp)
/* 48944 80058144 00000000 */  nop
/* 48948 80058148 0800E003 */  jr         $ra
/* 4894C 8005814C 3000BD27 */   addiu     $sp, $sp, 0x30
.size SpuSetVoiceADSR1ADSR2, . - SpuSetVoiceADSR1ADSR2
