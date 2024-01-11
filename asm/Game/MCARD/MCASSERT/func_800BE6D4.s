.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE6D4
/* AEED4 800BE6D4 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x10)
/* AEED8 800BE6D8 50E4638C */  lw         $v1, %lo(CD_read_dma_mode + 0x10)($v1)
/* AEEDC 800BE6DC 0D80023C */  lui        $v0, %hi(CD_nopen)
/* AEEE0 800BE6E0 98E9428C */  lw         $v0, %lo(CD_nopen)($v0)
/* AEEE4 800BE6E4 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* AEEE8 800BE6E8 4800B6AF */  sw         $s6, 0x48($sp)
/* AEEEC 800BE6EC 21B08000 */  addu       $s6, $a0, $zero
/* AEEF0 800BE6F0 3C00B3AF */  sw         $s3, 0x3C($sp)
/* AEEF4 800BE6F4 2198A000 */  addu       $s3, $a1, $zero
/* AEEF8 800BE6F8 4C00BFAF */  sw         $ra, 0x4C($sp)
/* AEEFC 800BE6FC 4400B5AF */  sw         $s5, 0x44($sp)
/* AEF00 800BE700 4000B4AF */  sw         $s4, 0x40($sp)
/* AEF04 800BE704 3800B2AF */  sw         $s2, 0x38($sp)
/* AEF08 800BE708 3400B1AF */  sw         $s1, 0x34($sp)
/* AEF0C 800BE70C 09006210 */  beq        $v1, $v0, .L800BE734
/* AEF10 800BE710 3000B0AF */   sw        $s0, 0x30($sp)
/* AEF14 800BE714 73FA020C */  jal        func_800BE9CC
/* AEF18 800BE718 00000000 */   nop
/* AEF1C 800BE71C 99004010 */  beqz       $v0, .L800BE984
/* AEF20 800BE720 21100000 */   addu      $v0, $zero, $zero
/* AEF24 800BE724 0D80023C */  lui        $v0, %hi(CD_nopen)
/* AEF28 800BE728 98E9428C */  lw         $v0, %lo(CD_nopen)($v0)
/* AEF2C 800BE72C 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x10)
/* AEF30 800BE730 50E422AC */  sw         $v0, %lo(CD_read_dma_mode + 0x10)($at)
.L800BE734:
/* AEF34 800BE734 00006382 */  lb         $v1, 0x0($s3)
/* AEF38 800BE738 5C000224 */  addiu      $v0, $zero, 0x5C
/* AEF3C 800BE73C 05006210 */  beq        $v1, $v0, .L800BE754
/* AEF40 800BE740 21100000 */   addu      $v0, $zero, $zero
/* AEF44 800BE744 61FA0208 */  j          .L800BE984
/* AEF48 800BE748 00000000 */   nop
.L800BE74C:
/* AEF4C 800BE74C F7F90208 */  j          .L800BE7DC
/* AEF50 800BE750 1000A0A3 */   sb        $zero, 0x10($sp)
.L800BE754:
/* AEF54 800BE754 1000A0A3 */  sb         $zero, 0x10($sp)
/* AEF58 800BE758 01000424 */  addiu      $a0, $zero, 0x1
/* AEF5C 800BE75C 21806002 */  addu       $s0, $s3, $zero
/* AEF60 800BE760 21900000 */  addu       $s2, $zero, $zero
/* AEF64 800BE764 5C001524 */  addiu      $s5, $zero, 0x5C
/* AEF68 800BE768 FFFF1424 */  addiu      $s4, $zero, -0x1
.L800BE76C:
/* AEF6C 800BE76C 00000282 */  lb         $v0, 0x0($s0)
/* AEF70 800BE770 00000392 */  lbu        $v1, 0x0($s0)
/* AEF74 800BE774 0C005510 */  beq        $v0, $s5, .L800BE7A8
/* AEF78 800BE778 1000B127 */   addiu     $s1, $sp, 0x10
/* AEF7C 800BE77C 5C000524 */  addiu      $a1, $zero, 0x5C
.L800BE780:
/* AEF80 800BE780 17006010 */  beqz       $v1, .L800BE7E0
/* AEF84 800BE784 0800422A */   slti      $v0, $s2, 0x8
/* AEF88 800BE788 01001026 */  addiu      $s0, $s0, 0x1
/* AEF8C 800BE78C 000023A2 */  sb         $v1, 0x0($s1)
/* AEF90 800BE790 00000282 */  lb         $v0, 0x0($s0)
/* AEF94 800BE794 00000392 */  lbu        $v1, 0x0($s0)
/* AEF98 800BE798 F9FF4514 */  bne        $v0, $a1, .L800BE780
/* AEF9C 800BE79C 01003126 */   addiu     $s1, $s1, 0x1
/* AEFA0 800BE7A0 00000282 */  lb         $v0, 0x0($s0)
/* AEFA4 800BE7A4 00000000 */  nop
.L800BE7A8:
/* AEFA8 800BE7A8 0D004010 */  beqz       $v0, .L800BE7E0
/* AEFAC 800BE7AC 0800422A */   slti      $v0, $s2, 0x8
/* AEFB0 800BE7B0 01001026 */  addiu      $s0, $s0, 0x1
/* AEFB4 800BE7B4 000020A2 */  sb         $zero, 0x0($s1)
/* AEFB8 800BE7B8 24FB020C */  jal        func_800BEC90
/* AEFBC 800BE7BC 1000A527 */   addiu     $a1, $sp, 0x10
/* AEFC0 800BE7C0 21204000 */  addu       $a0, $v0, $zero
/* AEFC4 800BE7C4 E1FF9410 */  beq        $a0, $s4, .L800BE74C
/* AEFC8 800BE7C8 00000000 */   nop
/* AEFCC 800BE7CC 01005226 */  addiu      $s2, $s2, 0x1
/* AEFD0 800BE7D0 0800422A */  slti       $v0, $s2, 0x8
/* AEFD4 800BE7D4 E5FF4014 */  bnez       $v0, .L800BE76C
/* AEFD8 800BE7D8 00000000 */   nop
.L800BE7DC:
/* AEFDC 800BE7DC 0800422A */  slti       $v0, $s2, 0x8
.L800BE7E0:
/* AEFE0 800BE7E0 0C004014 */  bnez       $v0, .L800BE814
/* AEFE4 800BE7E4 00000000 */   nop
/* AEFE8 800BE7E8 0D80023C */  lui        $v0, %hi(CD_debug)
/* AEFEC 800BE7EC 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AEFF0 800BE7F0 00000000 */  nop
/* AEFF4 800BE7F4 62004018 */  blez       $v0, .L800BE980
/* AEFF8 800BE7F8 21286002 */   addu      $a1, $s3, $zero
/* AEFFC 800BE7FC 0180043C */  lui        $a0, %hi(D_800127C4)
/* AF000 800BE800 C4278424 */  addiu      $a0, $a0, %lo(D_800127C4)
/* AF004 800BE804 06D1010C */  jal        printf
/* AF008 800BE808 21304002 */   addu      $a2, $s2, $zero
/* AF00C 800BE80C 61FA0208 */  j          .L800BE984
/* AF010 800BE810 21100000 */   addu      $v0, $zero, $zero
.L800BE814:
/* AF014 800BE814 1000A283 */  lb         $v0, 0x10($sp)
/* AF018 800BE818 00000000 */  nop
/* AF01C 800BE81C 09004014 */  bnez       $v0, .L800BE844
/* AF020 800BE820 00000000 */   nop
/* AF024 800BE824 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF028 800BE828 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF02C 800BE82C 00000000 */  nop
/* AF030 800BE830 53004018 */  blez       $v0, .L800BE980
/* AF034 800BE834 21286002 */   addu      $a1, $s3, $zero
/* AF038 800BE838 0180043C */  lui        $a0, %hi(D_800127E0)
/* AF03C 800BE83C 5EFA0208 */  j          .L800BE978
/* AF040 800BE840 E0278424 */   addiu     $a0, $a0, %lo(D_800127E0)
.L800BE844:
/* AF044 800BE844 4DFB020C */  jal        func_800BED34
/* AF048 800BE848 000020A2 */   sb        $zero, 0x0($s1)
/* AF04C 800BE84C 0B004014 */  bnez       $v0, .L800BE87C
/* AF050 800BE850 00000000 */   nop
/* AF054 800BE854 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF058 800BE858 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF05C 800BE85C 00000000 */  nop
/* AF060 800BE860 48004018 */  blez       $v0, .L800BE984
/* AF064 800BE864 21100000 */   addu      $v0, $zero, $zero
/* AF068 800BE868 0180043C */  lui        $a0, %hi(D_800127F8)
/* AF06C 800BE86C 06D1010C */  jal        printf
/* AF070 800BE870 F8278424 */   addiu     $a0, $a0, %lo(D_800127F8)
/* AF074 800BE874 61FA0208 */  j          .L800BE984
/* AF078 800BE878 21100000 */   addu      $v0, $zero, $zero
.L800BE87C:
/* AF07C 800BE87C 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF080 800BE880 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF084 800BE884 00000000 */  nop
/* AF088 800BE888 02004228 */  slti       $v0, $v0, 0x2
/* AF08C 800BE88C 06004014 */  bnez       $v0, .L800BE8A8
/* AF090 800BE890 21900000 */   addu      $s2, $zero, $zero
/* AF094 800BE894 0180043C */  lui        $a0, %hi(D_80012814)
/* AF098 800BE898 14288424 */  addiu      $a0, $a0, %lo(D_80012814)
/* AF09C 800BE89C 06D1010C */  jal        printf
/* AF0A0 800BE8A0 1000A527 */   addiu     $a1, $sp, 0x10
/* AF0A4 800BE8A4 21900000 */  addu       $s2, $zero, $zero
.L800BE8A8:
/* AF0A8 800BE8A8 0E80023C */  lui        $v0, %hi(GsOUT_PACKET_P_dup1 + 0x288)
/* AF0AC 800BE8AC F0D84224 */  addiu      $v0, $v0, %lo(GsOUT_PACKET_P_dup1 + 0x288)
/* AF0B0 800BE8B0 F8FF5024 */  addiu      $s0, $v0, -0x8
/* AF0B4 800BE8B4 21984000 */  addu       $s3, $v0, $zero
/* AF0B8 800BE8B8 21880000 */  addu       $s1, $zero, $zero
.L800BE8BC:
/* AF0BC 800BE8BC 0E80023C */  lui        $v0, %hi(GsOUT_PACKET_P_dup1 + 0x288)
/* AF0C0 800BE8C0 21105100 */  addu       $v0, $v0, $s1
/* AF0C4 800BE8C4 F0D84280 */  lb         $v0, %lo(GsOUT_PACKET_P_dup1 + 0x288)($v0)
/* AF0C8 800BE8C8 00000000 */  nop
/* AF0CC 800BE8CC 23004010 */  beqz       $v0, .L800BE95C
/* AF0D0 800BE8D0 21206002 */   addu      $a0, $s3, $zero
/* AF0D4 800BE8D4 6BFA020C */  jal        func_800BE9AC
/* AF0D8 800BE8D8 1000A527 */   addiu     $a1, $sp, 0x10
/* AF0DC 800BE8DC 19004010 */  beqz       $v0, .L800BE944
/* AF0E0 800BE8E0 00000000 */   nop
/* AF0E4 800BE8E4 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF0E8 800BE8E8 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF0EC 800BE8EC 00000000 */  nop
/* AF0F0 800BE8F0 02004228 */  slti       $v0, $v0, 0x2
/* AF0F4 800BE8F4 05004014 */  bnez       $v0, .L800BE90C
/* AF0F8 800BE8F8 00000000 */   nop
/* AF0FC 800BE8FC 0180043C */  lui        $a0, %hi(D_80012834)
/* AF100 800BE900 34288424 */  addiu      $a0, $a0, %lo(D_80012834)
/* AF104 800BE904 06D1010C */  jal        printf
/* AF108 800BE908 1000A527 */   addiu     $a1, $sp, 0x10
.L800BE90C:
/* AF10C 800BE90C 0000028E */  lw         $v0, 0x0($s0)
/* AF110 800BE910 0400038E */  lw         $v1, 0x4($s0)
/* AF114 800BE914 0800048E */  lw         $a0, 0x8($s0)
/* AF118 800BE918 0C00058E */  lw         $a1, 0xC($s0)
/* AF11C 800BE91C 0000C2AE */  sw         $v0, 0x0($s6)
/* AF120 800BE920 0400C3AE */  sw         $v1, 0x4($s6)
/* AF124 800BE924 0800C4AE */  sw         $a0, 0x8($s6)
/* AF128 800BE928 0C00C5AE */  sw         $a1, 0xC($s6)
/* AF12C 800BE92C 1000028E */  lw         $v0, 0x10($s0)
/* AF130 800BE930 1400038E */  lw         $v1, 0x14($s0)
/* AF134 800BE934 1000C2AE */  sw         $v0, 0x10($s6)
/* AF138 800BE938 1400C3AE */  sw         $v1, 0x14($s6)
/* AF13C 800BE93C 61FA0208 */  j          .L800BE984
/* AF140 800BE940 21100002 */   addu      $v0, $s0, $zero
.L800BE944:
/* AF144 800BE944 18001026 */  addiu      $s0, $s0, 0x18
/* AF148 800BE948 18007326 */  addiu      $s3, $s3, 0x18
/* AF14C 800BE94C 01005226 */  addiu      $s2, $s2, 0x1
/* AF150 800BE950 4000422A */  slti       $v0, $s2, 0x40
/* AF154 800BE954 D9FF4014 */  bnez       $v0, .L800BE8BC
/* AF158 800BE958 18003126 */   addiu     $s1, $s1, 0x18
.L800BE95C:
/* AF15C 800BE95C 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF160 800BE960 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF164 800BE964 00000000 */  nop
/* AF168 800BE968 05004018 */  blez       $v0, .L800BE980
/* AF16C 800BE96C 1000A527 */   addiu     $a1, $sp, 0x10
/* AF170 800BE970 0180043C */  lui        $a0, %hi(D_80012840)
/* AF174 800BE974 40288424 */  addiu      $a0, $a0, %lo(D_80012840)
.L800BE978:
/* AF178 800BE978 06D1010C */  jal        printf
/* AF17C 800BE97C 00000000 */   nop
.L800BE980:
/* AF180 800BE980 21100000 */  addu       $v0, $zero, $zero
.L800BE984:
/* AF184 800BE984 4C00BF8F */  lw         $ra, 0x4C($sp)
/* AF188 800BE988 4800B68F */  lw         $s6, 0x48($sp)
/* AF18C 800BE98C 4400B58F */  lw         $s5, 0x44($sp)
/* AF190 800BE990 4000B48F */  lw         $s4, 0x40($sp)
/* AF194 800BE994 3C00B38F */  lw         $s3, 0x3C($sp)
/* AF198 800BE998 3800B28F */  lw         $s2, 0x38($sp)
/* AF19C 800BE99C 3400B18F */  lw         $s1, 0x34($sp)
/* AF1A0 800BE9A0 3000B08F */  lw         $s0, 0x30($sp)
/* AF1A4 800BE9A4 0800E003 */  jr         $ra
/* AF1A8 800BE9A8 5000BD27 */   addiu     $sp, $sp, 0x50
.size func_800BE6D4, . - func_800BE6D4
