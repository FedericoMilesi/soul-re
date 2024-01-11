.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ProcessLookAt
/* 731FC 800829FC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 73200 80082A00 1400B1AF */  sw         $s1, 0x14($sp)
/* 73204 80082A04 21888000 */  addu       $s1, $a0, $zero
/* 73208 80082A08 1800BFAF */  sw         $ra, 0x18($sp)
/* 7320C 80082A0C 1000B0AF */  sw         $s0, 0x10($sp)
/* 73210 80082A10 6C01308E */  lw         $s0, 0x16C($s1)
/* 73214 80082A14 00000000 */  nop
/* 73218 80082A18 0801038E */  lw         $v1, 0x108($s0)
/* 7321C 80082A1C 0800023C */  lui        $v0, (0x80000 >> 16)
/* 73220 80082A20 2E006210 */  beq        $v1, $v0, .L80082ADC
/* 73224 80082A24 00000000 */   nop
/* 73228 80082A28 0000028E */  lw         $v0, 0x0($s0)
/* 7322C 80082A2C 00000000 */  nop
/* 73230 80082A30 08004104 */  bgez       $v0, .L80082A54
/* 73234 80082A34 00000000 */   nop
/* 73238 80082A38 9E09020C */  jal        MON_EnableHeadMove
/* 7323C 80082A3C 00000000 */   nop
/* 73240 80082A40 21202002 */  addu       $a0, $s1, $zero
/* 73244 80082A44 480A020C */  jal        MON_LookAtPos
/* 73248 80082A48 32010526 */   addiu     $a1, $s0, 0x132
/* 7324C 80082A4C B70A0208 */  j          .L80082ADC
/* 73250 80082A50 00000000 */   nop
.L80082A54:
/* 73254 80082A54 2001028E */  lw         $v0, 0x120($s0)
/* 73258 80082A58 00000000 */  nop
/* 7325C 80082A5C 08004010 */  beqz       $v0, .L80082A80
/* 73260 80082A60 00000000 */   nop
/* 73264 80082A64 9E09020C */  jal        MON_EnableHeadMove
/* 73268 80082A68 21202002 */   addu      $a0, $s1, $zero
/* 7326C 80082A6C 2001058E */  lw         $a1, 0x120($s0)
/* 73270 80082A70 480A020C */  jal        MON_LookAtPos
/* 73274 80082A74 21202002 */   addu      $a0, $s1, $zero
/* 73278 80082A78 B70A0208 */  j          .L80082ADC
/* 7327C 80082A7C 200100AE */   sw        $zero, 0x120($s0)
.L80082A80:
/* 73280 80082A80 4E010286 */  lh         $v0, 0x14E($s0)
/* 73284 80082A84 00000000 */  nop
/* 73288 80082A88 05004014 */  bnez       $v0, .L80082AA0
/* 7328C 80082A8C 4E010426 */   addiu     $a0, $s0, 0x14E
/* 73290 80082A90 50010286 */  lh         $v0, 0x150($s0)
/* 73294 80082A94 00000000 */  nop
/* 73298 80082A98 0E004010 */  beqz       $v0, .L80082AD4
/* 7329C 80082A9C 00000000 */   nop
.L80082AA0:
/* 732A0 80082AA0 21280000 */  addu       $a1, $zero, $zero
/* 732A4 80082AA4 53E8000C */  jal        AngleMoveToward
/* 732A8 80082AA8 64000624 */   addiu     $a2, $zero, 0x64
/* 732AC 80082AAC 50010426 */  addiu      $a0, $s0, 0x150
/* 732B0 80082AB0 21280000 */  addu       $a1, $zero, $zero
/* 732B4 80082AB4 53E8000C */  jal        AngleMoveToward
/* 732B8 80082AB8 64000624 */   addiu     $a2, $zero, 0x64
/* 732BC 80082ABC 4E010586 */  lh         $a1, 0x14E($s0)
/* 732C0 80082AC0 50010686 */  lh         $a2, 0x150($s0)
/* 732C4 80082AC4 EB09020C */  jal        MON_LookInDirection
/* 732C8 80082AC8 21202002 */   addu      $a0, $s1, $zero
/* 732CC 80082ACC B70A0208 */  j          .L80082ADC
/* 732D0 80082AD0 00000000 */   nop
.L80082AD4:
/* 732D4 80082AD4 C809020C */  jal        MON_DisableHeadMove
/* 732D8 80082AD8 21202002 */   addu      $a0, $s1, $zero
.L80082ADC:
/* 732DC 80082ADC 1800BF8F */  lw         $ra, 0x18($sp)
/* 732E0 80082AE0 1400B18F */  lw         $s1, 0x14($sp)
/* 732E4 80082AE4 1000B08F */  lw         $s0, 0x10($sp)
/* 732E8 80082AE8 0800E003 */  jr         $ra
/* 732EC 80082AEC 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_ProcessLookAt, . - MON_ProcessLookAt
