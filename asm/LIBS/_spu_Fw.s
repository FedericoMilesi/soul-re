.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _spu_Fw
/* B6FA0 800C67A0 0D80023C */  lui        $v0, %hi(_spu_transMode)
/* B6FA4 800C67A4 78ED428C */  lw         $v0, %lo(_spu_transMode)($v0)
/* B6FA8 800C67A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B6FAC 800C67AC 1400B1AF */  sw         $s1, 0x14($sp)
/* B6FB0 800C67B0 21888000 */  addu       $s1, $a0, $zero
/* B6FB4 800C67B4 1000B0AF */  sw         $s0, 0x10($sp)
/* B6FB8 800C67B8 2180A000 */  addu       $s0, $a1, $zero
/* B6FBC 800C67BC 10004014 */  bnez       $v0, .L800C6800
/* B6FC0 800C67C0 1800BFAF */   sw        $ra, 0x18($sp)
/* B6FC4 800C67C4 0D80023C */  lui        $v0, %hi(_spu_tsa)
/* B6FC8 800C67C8 74ED4294 */  lhu        $v0, %lo(_spu_tsa)($v0)
/* B6FCC 800C67CC 0D80053C */  lui        $a1, %hi(_spu_mem_mode_plus)
/* B6FD0 800C67D0 84EDA58C */  lw         $a1, %lo(_spu_mem_mode_plus)($a1)
/* B6FD4 800C67D4 02000424 */  addiu      $a0, $zero, 0x2
/* B6FD8 800C67D8 4819030C */  jal        _spu_t
/* B6FDC 800C67DC 0428A200 */   sllv      $a1, $v0, $a1
/* B6FE0 800C67E0 4819030C */  jal        _spu_t
/* B6FE4 800C67E4 01000424 */   addiu     $a0, $zero, 0x1
/* B6FE8 800C67E8 03000424 */  addiu      $a0, $zero, 0x3
/* B6FEC 800C67EC 21282002 */  addu       $a1, $s1, $zero
/* B6FF0 800C67F0 4819030C */  jal        _spu_t
/* B6FF4 800C67F4 21300002 */   addu      $a2, $s0, $zero
/* B6FF8 800C67F8 041A0308 */  j          .L800C6810
/* B6FFC 800C67FC 21100002 */   addu      $v0, $s0, $zero
.L800C6800:
/* B7000 800C6800 21202002 */  addu       $a0, $s1, $zero
/* B7004 800C6804 A918030C */  jal        func_800C62A4
/* B7008 800C6808 21280002 */   addu      $a1, $s0, $zero
/* B700C 800C680C 21100002 */  addu       $v0, $s0, $zero
.L800C6810:
/* B7010 800C6810 1800BF8F */  lw         $ra, 0x18($sp)
/* B7014 800C6814 1400B18F */  lw         $s1, 0x14($sp)
/* B7018 800C6818 1000B08F */  lw         $s0, 0x10($sp)
/* B701C 800C681C 0800E003 */  jr         $ra
/* B7020 800C6820 2000BD27 */   addiu     $sp, $sp, 0x20
.size _spu_Fw, . - _spu_Fw
