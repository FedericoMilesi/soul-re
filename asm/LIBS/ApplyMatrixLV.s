.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel ApplyMatrixLV
/* AD8C0 800BD0C0 0000888C */  lw         $t0, 0x0($a0)
/* AD8C4 800BD0C4 0400898C */  lw         $t1, 0x4($a0)
/* AD8C8 800BD0C8 08008A8C */  lw         $t2, 0x8($a0)
/* AD8CC 800BD0CC 0C008B8C */  lw         $t3, 0xC($a0)
/* AD8D0 800BD0D0 10008C8C */  lw         $t4, 0x10($a0)
/* AD8D4 800BD0D4 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* AD8D8 800BD0D8 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* AD8DC 800BD0DC 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* AD8E0 800BD0E0 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* AD8E4 800BD0E4 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* AD8E8 800BD0E8 0000A88C */  lw         $t0, 0x0($a1)
/* AD8EC 800BD0EC 0400A98C */  lw         $t1, 0x4($a1)
/* AD8F0 800BD0F0 0800AA8C */  lw         $t2, 0x8($a1)
/* AD8F4 800BD0F4 07000105 */  bgez       $t0, .L800BD114
/* AD8F8 800BD0F8 00000000 */   nop
/* AD8FC 800BD0FC 23400800 */  negu       $t0, $t0
/* AD900 800BD100 C35B0800 */  sra        $t3, $t0, 15
/* AD904 800BD104 23580B00 */  negu       $t3, $t3
/* AD908 800BD108 FF7F0831 */  andi       $t0, $t0, 0x7FFF
/* AD90C 800BD10C 03000010 */  b          .L800BD11C
/* AD910 800BD110 23400800 */   negu      $t0, $t0
.L800BD114:
/* AD914 800BD114 C35B0800 */  sra        $t3, $t0, 15
/* AD918 800BD118 FF7F0831 */  andi       $t0, $t0, 0x7FFF
.L800BD11C:
/* AD91C 800BD11C 07002105 */  bgez       $t1, .L800BD13C
/* AD920 800BD120 00000000 */   nop
/* AD924 800BD124 23480900 */  negu       $t1, $t1
/* AD928 800BD128 C3630900 */  sra        $t4, $t1, 15
/* AD92C 800BD12C 23600C00 */  negu       $t4, $t4
/* AD930 800BD130 FF7F2931 */  andi       $t1, $t1, 0x7FFF
/* AD934 800BD134 03000010 */  b          .L800BD144
/* AD938 800BD138 23480900 */   negu      $t1, $t1
.L800BD13C:
/* AD93C 800BD13C C3630900 */  sra        $t4, $t1, 15
/* AD940 800BD140 FF7F2931 */  andi       $t1, $t1, 0x7FFF
.L800BD144:
/* AD944 800BD144 07004105 */  bgez       $t2, .L800BD164
/* AD948 800BD148 00000000 */   nop
/* AD94C 800BD14C 23500A00 */  negu       $t2, $t2
/* AD950 800BD150 C36B0A00 */  sra        $t5, $t2, 15
/* AD954 800BD154 23680D00 */  negu       $t5, $t5
/* AD958 800BD158 FF7F4A31 */  andi       $t2, $t2, 0x7FFF
/* AD95C 800BD15C 03000010 */  b          .L800BD16C
/* AD960 800BD160 23500A00 */   negu      $t2, $t2
.L800BD164:
/* AD964 800BD164 C36B0A00 */  sra        $t5, $t2, 15
/* AD968 800BD168 FF7F4A31 */  andi       $t2, $t2, 0x7FFF
.L800BD16C:
/* AD96C 800BD16C 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* AD970 800BD170 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* AD974 800BD174 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* AD978 800BD178 00000000 */  nop
/* AD97C 800BD17C 12E0414A */  MVMVA      0, 0, 3, 3, 0
/* AD980 800BD180 00C80B48 */  mfc2       $t3, $25 # handwritten instruction
/* AD984 800BD184 00D00C48 */  mfc2       $t4, $26 # handwritten instruction
/* AD988 800BD188 00D80D48 */  mfc2       $t5, $27 # handwritten instruction
/* AD98C 800BD18C 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* AD990 800BD190 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* AD994 800BD194 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* AD998 800BD198 00000000 */  nop
/* AD99C 800BD19C 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* AD9A0 800BD1A0 05006105 */  bgez       $t3, .L800BD1B8
/* AD9A4 800BD1A4 00000000 */   nop
/* AD9A8 800BD1A8 23580B00 */  negu       $t3, $t3
/* AD9AC 800BD1AC C0580B00 */  sll        $t3, $t3, 3
/* AD9B0 800BD1B0 02000010 */  b          .L800BD1BC
/* AD9B4 800BD1B4 23580B00 */   negu      $t3, $t3
.L800BD1B8:
/* AD9B8 800BD1B8 C0580B00 */  sll        $t3, $t3, 3
.L800BD1BC:
/* AD9BC 800BD1BC 05008105 */  bgez       $t4, .L800BD1D4
/* AD9C0 800BD1C0 00000000 */   nop
/* AD9C4 800BD1C4 23600C00 */  negu       $t4, $t4
/* AD9C8 800BD1C8 C0600C00 */  sll        $t4, $t4, 3
/* AD9CC 800BD1CC 02000010 */  b          .L800BD1D8
/* AD9D0 800BD1D0 23600C00 */   negu      $t4, $t4
.L800BD1D4:
/* AD9D4 800BD1D4 C0600C00 */  sll        $t4, $t4, 3
.L800BD1D8:
/* AD9D8 800BD1D8 0500A105 */  bgez       $t5, .L800BD1F0
/* AD9DC 800BD1DC 00000000 */   nop
/* AD9E0 800BD1E0 23680D00 */  negu       $t5, $t5
/* AD9E4 800BD1E4 C0680D00 */  sll        $t5, $t5, 3
/* AD9E8 800BD1E8 02000010 */  b          .L800BD1F4
/* AD9EC 800BD1EC 23680D00 */   negu      $t5, $t5
.L800BD1F0:
/* AD9F0 800BD1F0 C0680D00 */  sll        $t5, $t5, 3
.L800BD1F4:
/* AD9F4 800BD1F4 00C80848 */  mfc2       $t0, $25 # handwritten instruction
/* AD9F8 800BD1F8 00D00948 */  mfc2       $t1, $26 # handwritten instruction
/* AD9FC 800BD1FC 00D80A48 */  mfc2       $t2, $27 # handwritten instruction
/* ADA00 800BD200 21400B01 */  addu       $t0, $t0, $t3
/* ADA04 800BD204 21482C01 */  addu       $t1, $t1, $t4
/* ADA08 800BD208 21504D01 */  addu       $t2, $t2, $t5
/* ADA0C 800BD20C 0000C8AC */  sw         $t0, 0x0($a2)
/* ADA10 800BD210 0400C9AC */  sw         $t1, 0x4($a2)
/* ADA14 800BD214 0800CAAC */  sw         $t2, 0x8($a2)
/* ADA18 800BD218 0800E003 */  jr         $ra
/* ADA1C 800BD21C 2110C000 */   addu      $v0, $a2, $zero
.size ApplyMatrixLV, . - ApplyMatrixLV
