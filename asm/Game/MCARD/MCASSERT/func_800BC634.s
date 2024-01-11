.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC634
/* ACE34 800BC634 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* ACE38 800BC638 1800BFAF */  sw         $ra, 0x18($sp)
/* ACE3C 800BC63C 5EF2020C */  jal        func_800BC978
/* ACE40 800BC640 FFFF0424 */   addiu     $a0, $zero, -0x1
/* ACE44 800BC644 0D80033C */  lui        $v1, %hi(_qout + 0x10)
/* ACE48 800BC648 48DB638C */  lw         $v1, %lo(_qout + 0x10)($v1)
/* ACE4C 800BC64C 00000000 */  nop
/* ACE50 800BC650 2A186200 */  slt        $v1, $v1, $v0
/* ACE54 800BC654 0C006014 */  bnez       $v1, .L800BC688
/* ACE58 800BC658 00000000 */   nop
/* ACE5C 800BC65C 0D80033C */  lui        $v1, %hi(_qout + 0x14)
/* ACE60 800BC660 4CDB6324 */  addiu      $v1, $v1, %lo(_qout + 0x14)
/* ACE64 800BC664 0000628C */  lw         $v0, 0x0($v1)
/* ACE68 800BC668 00000000 */  nop
/* ACE6C 800BC66C 21204000 */  addu       $a0, $v0, $zero
/* ACE70 800BC670 01004224 */  addiu      $v0, $v0, 0x1
/* ACE74 800BC674 000062AC */  sw         $v0, 0x0($v1)
/* ACE78 800BC678 0F00023C */  lui        $v0, (0xF0000 >> 16)
/* ACE7C 800BC67C 2A104400 */  slt        $v0, $v0, $a0
/* ACE80 800BC680 38004010 */  beqz       $v0, .L800BC764
/* ACE84 800BC684 00000000 */   nop
.L800BC688:
/* ACE88 800BC688 0D80063C */  lui        $a2, %hi(GEnv + 0x108)
/* ACE8C 800BC68C 14DBC68C */  lw         $a2, %lo(GEnv + 0x108)($a2)
/* ACE90 800BC690 0180043C */  lui        $a0, %hi(D_80012724)
/* ACE94 800BC694 24278424 */  addiu      $a0, $a0, %lo(D_80012724)
/* ACE98 800BC698 0000C28C */  lw         $v0, 0x0($a2)
/* ACE9C 800BC69C 0D80053C */  lui        $a1, %hi(_qin)
/* ACEA0 800BC6A0 34DBA58C */  lw         $a1, %lo(_qin)($a1)
/* ACEA4 800BC6A4 0D80023C */  lui        $v0, %hi(GEnv + 0x10C)
/* ACEA8 800BC6A8 18DB428C */  lw         $v0, %lo(GEnv + 0x10C)($v0)
/* ACEAC 800BC6AC 0D80033C */  lui        $v1, %hi(_qout)
/* ACEB0 800BC6B0 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* ACEB4 800BC6B4 0000428C */  lw         $v0, 0x0($v0)
/* ACEB8 800BC6B8 2328A300 */  subu       $a1, $a1, $v1
/* ACEBC 800BC6BC 1000A2AF */  sw         $v0, 0x10($sp)
/* ACEC0 800BC6C0 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* ACEC4 800BC6C4 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* ACEC8 800BC6C8 0000C68C */  lw         $a2, 0x0($a2)
/* ACECC 800BC6CC 0000478C */  lw         $a3, 0x0($v0)
/* ACED0 800BC6D0 06D1010C */  jal        printf
/* ACED4 800BC6D4 3F00A530 */   andi      $a1, $a1, 0x3F
/* ACED8 800BC6D8 ECE6020C */  jal        func_800B9BB0
/* ACEDC 800BC6DC 21200000 */   addu      $a0, $zero, $zero
/* ACEE0 800BC6E0 0D80013C */  lui        $at, %hi(_qout)
/* ACEE4 800BC6E4 38DB20AC */  sw         $zero, %lo(_qout)($at)
/* ACEE8 800BC6E8 0D80033C */  lui        $v1, %hi(_qout)
/* ACEEC 800BC6EC 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* ACEF0 800BC6F0 0D80013C */  lui        $at, %hi(_qout + 0xC)
/* ACEF4 800BC6F4 44DB22AC */  sw         $v0, %lo(_qout + 0xC)($at)
/* ACEF8 800BC6F8 0D80013C */  lui        $at, %hi(_qin)
/* ACEFC 800BC6FC 34DB23AC */  sw         $v1, %lo(_qin)($at)
/* ACF00 800BC700 0D80033C */  lui        $v1, %hi(GEnv + 0x114)
/* ACF04 800BC704 20DB638C */  lw         $v1, %lo(GEnv + 0x114)($v1)
/* ACF08 800BC708 01040224 */  addiu      $v0, $zero, 0x401
/* ACF0C 800BC70C 000062AC */  sw         $v0, 0x0($v1)
/* ACF10 800BC710 0D80033C */  lui        $v1, %hi(GEnv + 0x124)
/* ACF14 800BC714 30DB638C */  lw         $v1, %lo(GEnv + 0x124)($v1)
/* ACF18 800BC718 00000000 */  nop
/* ACF1C 800BC71C 0000628C */  lw         $v0, 0x0($v1)
/* ACF20 800BC720 00000000 */  nop
/* ACF24 800BC724 00084234 */  ori        $v0, $v0, 0x800
/* ACF28 800BC728 000062AC */  sw         $v0, 0x0($v1)
/* ACF2C 800BC72C 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* ACF30 800BC730 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* ACF34 800BC734 0002023C */  lui        $v0, (0x2000000 >> 16)
/* ACF38 800BC738 000062AC */  sw         $v0, 0x0($v1)
/* ACF3C 800BC73C 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* ACF40 800BC740 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* ACF44 800BC744 0001023C */  lui        $v0, (0x1000000 >> 16)
/* ACF48 800BC748 000062AC */  sw         $v0, 0x0($v1)
/* ACF4C 800BC74C 0D80043C */  lui        $a0, %hi(_qout + 0xC)
/* ACF50 800BC750 44DB848C */  lw         $a0, %lo(_qout + 0xC)($a0)
/* ACF54 800BC754 ECE6020C */  jal        func_800B9BB0
/* ACF58 800BC758 00000000 */   nop
/* ACF5C 800BC75C DAF10208 */  j          .L800BC768
/* ACF60 800BC760 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800BC764:
/* ACF64 800BC764 21100000 */  addu       $v0, $zero, $zero
.L800BC768:
/* ACF68 800BC768 1800BF8F */  lw         $ra, 0x18($sp)
/* ACF6C 800BC76C 2000BD27 */  addiu      $sp, $sp, 0x20
/* ACF70 800BC770 0800E003 */  jr         $ra
/* ACF74 800BC774 00000000 */   nop
.size func_800BC634, . - func_800BC634
