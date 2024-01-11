.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearOTagR
/* AAF68 800BA768 0D80023C */  lui        $v0, %hi(GEnv + 0x2)
/* AAF6C 800BA76C 0EDA4290 */  lbu        $v0, %lo(GEnv + 0x2)($v0)
/* AAF70 800BA770 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AAF74 800BA774 1000B0AF */  sw         $s0, 0x10($sp)
/* AAF78 800BA778 21808000 */  addu       $s0, $a0, $zero
/* AAF7C 800BA77C 1400B1AF */  sw         $s1, 0x14($sp)
/* AAF80 800BA780 2188A000 */  addu       $s1, $a1, $zero
/* AAF84 800BA784 0200422C */  sltiu      $v0, $v0, 0x2
/* AAF88 800BA788 09004014 */  bnez       $v0, .L800BA7B0
/* AAF8C 800BA78C 1800BFAF */   sw        $ra, 0x18($sp)
/* AAF90 800BA790 0180043C */  lui        $a0, %hi(D_800126AC)
/* AAF94 800BA794 AC268424 */  addiu      $a0, $a0, %lo(D_800126AC)
/* AAF98 800BA798 21280002 */  addu       $a1, $s0, $zero
/* AAF9C 800BA79C 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AAFA0 800BA7A0 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AAFA4 800BA7A4 00000000 */  nop
/* AAFA8 800BA7A8 09F84000 */  jalr       $v0
/* AAFAC 800BA7AC 21302002 */   addu      $a2, $s1, $zero
.L800BA7B0:
/* AAFB0 800BA7B0 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x1158)
/* AAFB4 800BA7B4 04DA428C */  lw         $v0, %lo(the_attract_movies + 0x1158)($v0)
/* AAFB8 800BA7B8 21200002 */  addu       $a0, $s0, $zero
/* AAFBC 800BA7BC 2C00428C */  lw         $v0, 0x2C($v0)
/* AAFC0 800BA7C0 00000000 */  nop
/* AAFC4 800BA7C4 09F84000 */  jalr       $v0
/* AAFC8 800BA7C8 21282002 */   addu      $a1, $s1, $zero
/* AAFCC 800BA7CC FF00063C */  lui        $a2, (0xFFFFFF >> 16)
/* AAFD0 800BA7D0 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
/* AAFD4 800BA7D4 21100002 */  addu       $v0, $s0, $zero
/* AAFD8 800BA7D8 0D80053C */  lui        $a1, %hi(GEnv + 0xC0)
/* AAFDC 800BA7DC CCDAA524 */  addiu      $a1, $a1, %lo(GEnv + 0xC0)
/* AAFE0 800BA7E0 0D80033C */  lui        $v1, %hi(GEnv + 0xAC)
/* AAFE4 800BA7E4 B8DA6324 */  addiu      $v1, $v1, %lo(GEnv + 0xAC)
/* AAFE8 800BA7E8 24186600 */  and        $v1, $v1, $a2
/* AAFEC 800BA7EC 0004043C */  lui        $a0, (0x4000000 >> 16)
/* AAFF0 800BA7F0 25186400 */  or         $v1, $v1, $a0
/* AAFF4 800BA7F4 0000A3AC */  sw         $v1, 0x0($a1)
/* AAFF8 800BA7F8 2428A600 */  and        $a1, $a1, $a2
/* AAFFC 800BA7FC 000045AC */  sw         $a1, 0x0($v0)
/* AB000 800BA800 1800BF8F */  lw         $ra, 0x18($sp)
/* AB004 800BA804 1400B18F */  lw         $s1, 0x14($sp)
/* AB008 800BA808 1000B08F */  lw         $s0, 0x10($sp)
/* AB00C 800BA80C 0800E003 */  jr         $ra
/* AB010 800BA810 2000BD27 */   addiu     $sp, $sp, 0x20
.size ClearOTagR, . - ClearOTagR
