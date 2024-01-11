.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SpuInit
/* B66C4 800C5EC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B66C8 800C5EC8 1000B0AF */  sw         $s0, 0x10($sp)
/* B66CC 800C5ECC 1400BFAF */  sw         $ra, 0x14($sp)
/* B66D0 800C5ED0 9FE6020C */  jal        ResetCallback
/* B66D4 800C5ED4 21808000 */   addu      $s0, $a0, $zero
/* B66D8 800C5ED8 0918030C */  jal        _spu_init
/* B66DC 800C5EDC 21200002 */   addu      $a0, $s0, $zero
/* B66E0 800C5EE0 08000016 */  bnez       $s0, .L800C5F04
/* B66E4 800C5EE4 00C00434 */   ori       $a0, $zero, 0xC000
/* B66E8 800C5EE8 17000324 */  addiu      $v1, $zero, 0x17
/* B66EC 800C5EEC 0D80023C */  lui        $v0, %hi(_spu_voice_centerNote + 0x2E)
/* B66F0 800C5EF0 46ED4224 */  addiu      $v0, $v0, %lo(_spu_voice_centerNote + 0x2E)
.L800C5EF4:
/* B66F4 800C5EF4 000044A4 */  sh         $a0, 0x0($v0)
/* B66F8 800C5EF8 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B66FC 800C5EFC FDFF6104 */  bgez       $v1, .L800C5EF4
/* B6700 800C5F00 FEFF4224 */   addiu     $v0, $v0, -0x2
.L800C5F04:
/* B6704 800C5F04 EB17030C */  jal        SpuStart
/* B6708 800C5F08 00000000 */   nop
/* B670C 800C5F0C D1000424 */  addiu      $a0, $zero, 0xD1
/* B6710 800C5F10 0D80023C */  lui        $v0, %hi(_spu_rev_attr_dup1)
/* B6714 800C5F14 00ED4224 */  addiu      $v0, $v0, %lo(_spu_rev_attr_dup1)
/* B6718 800C5F18 0D80053C */  lui        $a1, %hi(_spu_rev_startaddr)
/* B671C 800C5F1C BCEDA58C */  lw         $a1, %lo(_spu_rev_startaddr)($a1)
/* B6720 800C5F20 0D80013C */  lui        $at, %hi(_spu_rev_flag)
/* B6724 800C5F24 F0EC20AC */  sw         $zero, %lo(_spu_rev_flag)($at)
/* B6728 800C5F28 0D80013C */  lui        $at, %hi(_spu_rev_reserve_wa)
/* B672C 800C5F2C F4EC20AC */  sw         $zero, %lo(_spu_rev_reserve_wa)($at)
/* B6730 800C5F30 000040AC */  sw         $zero, 0x0($v0)
/* B6734 800C5F34 040040A4 */  sh         $zero, 0x4($v0)
/* B6738 800C5F38 060040A4 */  sh         $zero, 0x6($v0)
/* B673C 800C5F3C 080040AC */  sw         $zero, 0x8($v0)
/* B6740 800C5F40 0C0040AC */  sw         $zero, 0xC($v0)
/* B6744 800C5F44 0D80013C */  lui        $at, %hi(_spu_rev_offsetaddr)
/* B6748 800C5F48 F8EC25AC */  sw         $a1, %lo(_spu_rev_offsetaddr)($at)
/* B674C 800C5F4C 221A030C */  jal        _spu_FsetRXX
/* B6750 800C5F50 21300000 */   addu      $a2, $zero, $zero
/* B6754 800C5F54 0D80013C */  lui        $at, %hi(_spu_AllocBlockNum)
/* B6758 800C5F58 ECF420AC */  sw         $zero, %lo(_spu_AllocBlockNum)($at)
/* B675C 800C5F5C 0D80013C */  lui        $at, %hi(_spu_AllocLastNum)
/* B6760 800C5F60 F0F420AC */  sw         $zero, %lo(_spu_AllocLastNum)($at)
/* B6764 800C5F64 0D80013C */  lui        $at, %hi(_spu_memList)
/* B6768 800C5F68 F4F420AC */  sw         $zero, %lo(_spu_memList)($at)
/* B676C 800C5F6C 0D80013C */  lui        $at, %hi(_spu_trans_mode)
/* B6770 800C5F70 ECEC20AC */  sw         $zero, %lo(_spu_trans_mode)($at)
/* B6774 800C5F74 0D80013C */  lui        $at, %hi(_spu_transMode)
/* B6778 800C5F78 78ED20AC */  sw         $zero, %lo(_spu_transMode)($at)
/* B677C 800C5F7C 0D80013C */  lui        $at, %hi(_spu_keystat)
/* B6780 800C5F80 E8EC20AC */  sw         $zero, %lo(_spu_keystat)($at)
/* B6784 800C5F84 0D80013C */  lui        $at, %hi(_spu_RQmask)
/* B6788 800C5F88 14ED20AC */  sw         $zero, %lo(_spu_RQmask)($at)
/* B678C 800C5F8C 0D80013C */  lui        $at, %hi(_spu_RQvoice)
/* B6790 800C5F90 10ED20AC */  sw         $zero, %lo(_spu_RQvoice)($at)
/* B6794 800C5F94 0D80013C */  lui        $at, %hi(_spu_env)
/* B6798 800C5F98 48ED20AC */  sw         $zero, %lo(_spu_env)($at)
/* B679C 800C5F9C 1400BF8F */  lw         $ra, 0x14($sp)
/* B67A0 800C5FA0 1000B08F */  lw         $s0, 0x10($sp)
/* B67A4 800C5FA4 0800E003 */  jr         $ra
/* B67A8 800C5FA8 1800BD27 */   addiu     $sp, $sp, 0x18
.size _SpuInit, . - _SpuInit
