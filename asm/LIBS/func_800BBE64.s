.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BBE64
/* AC664 800BBE64 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AC668 800BBE68 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AC66C 800BBE6C 21988000 */  addu       $s3, $a0, $zero
/* AC670 800BBE70 1000B0AF */  sw         $s0, 0x10($sp)
/* AC674 800BBE74 2180A000 */  addu       $s0, $a1, $zero
/* AC678 800BBE78 1400B1AF */  sw         $s1, 0x14($sp)
/* AC67C 800BBE7C 2188C000 */  addu       $s1, $a2, $zero
/* AC680 800BBE80 1800B2AF */  sw         $s2, 0x18($sp)
/* AC684 800BBE84 2000BFAF */  sw         $ra, 0x20($sp)
/* AC688 800BBE88 80F1020C */  jal        func_800BC600
/* AC68C 800BBE8C 2190E000 */   addu      $s2, $a3, $zero
/* AC690 800BBE90 ACEF0208 */  j          .L800BBEB0
/* AC694 800BBE94 00000000 */   nop
.L800BBE98:
/* AC698 800BBE98 8DF1020C */  jal        func_800BC634
/* AC69C 800BBE9C 00000000 */   nop
/* AC6A0 800BBEA0 95004014 */  bnez       $v0, .L800BC0F8
/* AC6A4 800BBEA4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* AC6A8 800BBEA8 45F0020C */  jal        func_800BC114
/* AC6AC 800BBEAC 00000000 */   nop
.L800BBEB0:
/* AC6B0 800BBEB0 0D80023C */  lui        $v0, %hi(_qin)
/* AC6B4 800BBEB4 34DB428C */  lw         $v0, %lo(_qin)($v0)
/* AC6B8 800BBEB8 0D80033C */  lui        $v1, %hi(_qout)
/* AC6BC 800BBEBC 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* AC6C0 800BBEC0 01004224 */  addiu      $v0, $v0, 0x1
/* AC6C4 800BBEC4 3F004230 */  andi       $v0, $v0, 0x3F
/* AC6C8 800BBEC8 F3FF4310 */  beq        $v0, $v1, .L800BBE98
/* AC6CC 800BBECC 00000000 */   nop
/* AC6D0 800BBED0 ECE6020C */  jal        SetIntrMask
/* AC6D4 800BBED4 21200000 */   addu      $a0, $zero, $zero
/* AC6D8 800BBED8 0D80043C */  lui        $a0, %hi(GEnv)
/* AC6DC 800BBEDC 0CDA8424 */  addiu      $a0, $a0, %lo(GEnv)
/* AC6E0 800BBEE0 0D80013C */  lui        $at, %hi(_qout + 0x4)
/* AC6E4 800BBEE4 3CDB22AC */  sw         $v0, %lo(_qout + 0x4)($at)
/* AC6E8 800BBEE8 01008390 */  lbu        $v1, 0x1($a0)
/* AC6EC 800BBEEC 01000224 */  addiu      $v0, $zero, 0x1
/* AC6F0 800BBEF0 14006010 */  beqz       $v1, .L800BBF44
/* AC6F4 800BBEF4 080082AC */   sw        $v0, 0x8($a0)
/* AC6F8 800BBEF8 0D80033C */  lui        $v1, %hi(_qin)
/* AC6FC 800BBEFC 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* AC700 800BBF00 0D80023C */  lui        $v0, %hi(_qout)
/* AC704 800BBF04 38DB428C */  lw         $v0, %lo(_qout)($v0)
/* AC708 800BBF08 00000000 */  nop
/* AC70C 800BBF0C 1E006214 */  bne        $v1, $v0, .L800BBF88
/* AC710 800BBF10 00000000 */   nop
/* AC714 800BBF14 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* AC718 800BBF18 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* AC71C 800BBF1C 00000000 */  nop
/* AC720 800BBF20 0000428C */  lw         $v0, 0x0($v0)
/* AC724 800BBF24 0001033C */  lui        $v1, (0x1000000 >> 16)
/* AC728 800BBF28 24104300 */  and        $v0, $v0, $v1
/* AC72C 800BBF2C 16004014 */  bnez       $v0, .L800BBF88
/* AC730 800BBF30 00000000 */   nop
/* AC734 800BBF34 0C00828C */  lw         $v0, 0xC($a0)
/* AC738 800BBF38 00000000 */  nop
/* AC73C 800BBF3C 12004014 */  bnez       $v0, .L800BBF88
/* AC740 800BBF40 00000000 */   nop
.L800BBF44:
/* AC744 800BBF44 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* AC748 800BBF48 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* AC74C 800BBF4C 0004043C */  lui        $a0, (0x4000000 >> 16)
.L800BBF50:
/* AC750 800BBF50 0000628C */  lw         $v0, 0x0($v1)
/* AC754 800BBF54 00000000 */  nop
/* AC758 800BBF58 24104400 */  and        $v0, $v0, $a0
/* AC75C 800BBF5C FCFF4010 */  beqz       $v0, .L800BBF50
/* AC760 800BBF60 00000000 */   nop
/* AC764 800BBF64 21200002 */  addu       $a0, $s0, $zero
/* AC768 800BBF68 09F86002 */  jalr       $s3
/* AC76C 800BBF6C 21284002 */   addu      $a1, $s2, $zero
/* AC770 800BBF70 0D80043C */  lui        $a0, %hi(_qout + 0x4)
/* AC774 800BBF74 3CDB848C */  lw         $a0, %lo(_qout + 0x4)($a0)
/* AC778 800BBF78 ECE6020C */  jal        SetIntrMask
/* AC77C 800BBF7C 00000000 */   nop
/* AC780 800BBF80 3EF00208 */  j          .L800BC0F8
/* AC784 800BBF84 21100000 */   addu      $v0, $zero, $zero
.L800BBF88:
/* AC788 800BBF88 0C80053C */  lui        $a1, %hi(func_800BC114)
/* AC78C 800BBF8C 14C1A524 */  addiu      $a1, $a1, %lo(func_800BC114)
/* AC790 800BBF90 B7E6020C */  jal        DMACallback
/* AC794 800BBF94 02000424 */   addiu     $a0, $zero, 0x2
/* AC798 800BBF98 2A002012 */  beqz       $s1, .L800BC044
/* AC79C 800BBF9C 21300000 */   addu      $a2, $zero, $zero
/* AC7A0 800BBFA0 0E80083C */  lui        $t0, %hi(_que + 0xC)
/* AC7A4 800BBFA4 74BE0825 */  addiu      $t0, $t0, %lo(_que + 0xC)
/* AC7A8 800BBFA8 21380002 */  addu       $a3, $s0, $zero
/* AC7AC 800BBFAC 21102002 */  addu       $v0, $s1, $zero
.L800BBFB0:
/* AC7B0 800BBFB0 02004104 */  bgez       $v0, .L800BBFBC
/* AC7B4 800BBFB4 00000000 */   nop
/* AC7B8 800BBFB8 03004224 */  addiu      $v0, $v0, 0x3
.L800BBFBC:
/* AC7BC 800BBFBC 83100200 */  sra        $v0, $v0, 2
/* AC7C0 800BBFC0 2A10C200 */  slt        $v0, $a2, $v0
/* AC7C4 800BBFC4 0E004010 */  beqz       $v0, .L800BC000
/* AC7C8 800BBFC8 80200600 */   sll       $a0, $a2, 2
/* AC7CC 800BBFCC 0000E58C */  lw         $a1, 0x0($a3)
/* AC7D0 800BBFD0 0400E724 */  addiu      $a3, $a3, 0x4
/* AC7D4 800BBFD4 0D80033C */  lui        $v1, %hi(_qin)
/* AC7D8 800BBFD8 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* AC7DC 800BBFDC 0100C624 */  addiu      $a2, $a2, 0x1
/* AC7E0 800BBFE0 40100300 */  sll        $v0, $v1, 1
/* AC7E4 800BBFE4 21104300 */  addu       $v0, $v0, $v1
/* AC7E8 800BBFE8 40110200 */  sll        $v0, $v0, 5
/* AC7EC 800BBFEC 21104800 */  addu       $v0, $v0, $t0
/* AC7F0 800BBFF0 21208200 */  addu       $a0, $a0, $v0
/* AC7F4 800BBFF4 000085AC */  sw         $a1, 0x0($a0)
/* AC7F8 800BBFF8 ECEF0208 */  j          .L800BBFB0
/* AC7FC 800BBFFC 21102002 */   addu      $v0, $s1, $zero
.L800BC000:
/* AC800 800BC000 0D80023C */  lui        $v0, %hi(_qin)
/* AC804 800BC004 34DB428C */  lw         $v0, %lo(_qin)($v0)
/* AC808 800BC008 0D80033C */  lui        $v1, %hi(_qin)
/* AC80C 800BC00C 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* AC810 800BC010 40200200 */  sll        $a0, $v0, 1
/* AC814 800BC014 21208200 */  addu       $a0, $a0, $v0
/* AC818 800BC018 40210400 */  sll        $a0, $a0, 5
/* AC81C 800BC01C 40100300 */  sll        $v0, $v1, 1
/* AC820 800BC020 21104300 */  addu       $v0, $v0, $v1
/* AC824 800BC024 40110200 */  sll        $v0, $v0, 5
/* AC828 800BC028 0E80033C */  lui        $v1, %hi(_que + 0xC)
/* AC82C 800BC02C 74BE6324 */  addiu      $v1, $v1, %lo(_que + 0xC)
/* AC830 800BC030 21104300 */  addu       $v0, $v0, $v1
/* AC834 800BC034 0E80013C */  lui        $at, %hi(_que + 0x4)
/* AC838 800BC038 21082400 */  addu       $at, $at, $a0
/* AC83C 800BC03C 1AF00208 */  j          .L800BC068
/* AC840 800BC040 6CBE22AC */   sw        $v0, %lo(_que + 0x4)($at)
.L800BC044:
/* AC844 800BC044 0D80033C */  lui        $v1, %hi(_qin)
/* AC848 800BC048 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* AC84C 800BC04C 00000000 */  nop
/* AC850 800BC050 40100300 */  sll        $v0, $v1, 1
/* AC854 800BC054 21104300 */  addu       $v0, $v0, $v1
/* AC858 800BC058 40110200 */  sll        $v0, $v0, 5
/* AC85C 800BC05C 0E80013C */  lui        $at, %hi(_que + 0x4)
/* AC860 800BC060 21082200 */  addu       $at, $at, $v0
/* AC864 800BC064 6CBE30AC */  sw         $s0, %lo(_que + 0x4)($at)
.L800BC068:
/* AC868 800BC068 0D80033C */  lui        $v1, %hi(_qin)
/* AC86C 800BC06C 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* AC870 800BC070 00000000 */  nop
/* AC874 800BC074 40100300 */  sll        $v0, $v1, 1
/* AC878 800BC078 21104300 */  addu       $v0, $v0, $v1
/* AC87C 800BC07C 40110200 */  sll        $v0, $v0, 5
/* AC880 800BC080 0E80013C */  lui        $at, %hi(_que + 0x8)
/* AC884 800BC084 21082200 */  addu       $at, $at, $v0
/* AC888 800BC088 70BE32AC */  sw         $s2, %lo(_que + 0x8)($at)
/* AC88C 800BC08C 0D80033C */  lui        $v1, %hi(_qin)
/* AC890 800BC090 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* AC894 800BC094 00000000 */  nop
/* AC898 800BC098 40100300 */  sll        $v0, $v1, 1
/* AC89C 800BC09C 21104300 */  addu       $v0, $v0, $v1
/* AC8A0 800BC0A0 40110200 */  sll        $v0, $v0, 5
/* AC8A4 800BC0A4 0E80013C */  lui        $at, %hi(_que)
/* AC8A8 800BC0A8 21082200 */  addu       $at, $at, $v0
/* AC8AC 800BC0AC 68BE33AC */  sw         $s3, %lo(_que)($at)
/* AC8B0 800BC0B0 0D80023C */  lui        $v0, %hi(_qin)
/* AC8B4 800BC0B4 34DB428C */  lw         $v0, %lo(_qin)($v0)
/* AC8B8 800BC0B8 0D80043C */  lui        $a0, %hi(_qout + 0x4)
/* AC8BC 800BC0BC 3CDB848C */  lw         $a0, %lo(_qout + 0x4)($a0)
/* AC8C0 800BC0C0 01004224 */  addiu      $v0, $v0, 0x1
/* AC8C4 800BC0C4 3F004230 */  andi       $v0, $v0, 0x3F
/* AC8C8 800BC0C8 0D80013C */  lui        $at, %hi(_qin)
/* AC8CC 800BC0CC ECE6020C */  jal        SetIntrMask
/* AC8D0 800BC0D0 34DB22AC */   sw        $v0, %lo(_qin)($at)
/* AC8D4 800BC0D4 45F0020C */  jal        func_800BC114
/* AC8D8 800BC0D8 00000000 */   nop
/* AC8DC 800BC0DC 0D80023C */  lui        $v0, %hi(_qin)
/* AC8E0 800BC0E0 34DB428C */  lw         $v0, %lo(_qin)($v0)
/* AC8E4 800BC0E4 0D80033C */  lui        $v1, %hi(_qout)
/* AC8E8 800BC0E8 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* AC8EC 800BC0EC 00000000 */  nop
/* AC8F0 800BC0F0 23104300 */  subu       $v0, $v0, $v1
/* AC8F4 800BC0F4 3F004230 */  andi       $v0, $v0, 0x3F
.L800BC0F8:
/* AC8F8 800BC0F8 2000BF8F */  lw         $ra, 0x20($sp)
/* AC8FC 800BC0FC 1C00B38F */  lw         $s3, 0x1C($sp)
/* AC900 800BC100 1800B28F */  lw         $s2, 0x18($sp)
/* AC904 800BC104 1400B18F */  lw         $s1, 0x14($sp)
/* AC908 800BC108 1000B08F */  lw         $s0, 0x10($sp)
/* AC90C 800BC10C 0800E003 */  jr         $ra
/* AC910 800BC110 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800BBE64, . - func_800BBE64
