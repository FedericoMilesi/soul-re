.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setSramFullAlarm
/* 44078 80053878 21400000 */  addu       $t0, $zero, $zero
/* 4407C 8005387C 21480001 */  addu       $t1, $t0, $zero
/* 44080 80053880 21500001 */  addu       $t2, $t0, $zero
/* 44084 80053884 21580001 */  addu       $t3, $t0, $zero
/* 44088 80053888 21380001 */  addu       $a3, $t0, $zero
/* 4408C 8005388C D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 44090 80053890 00000000 */  nop
/* 44094 80053894 F41B628C */  lw         $v0, 0x1BF4($v1)
/* 44098 80053898 F0176324 */  addiu      $v1, $v1, 0x17F0
/* 4409C 8005389C C0100200 */  sll        $v0, $v0, 3
/* 440A0 800538A0 21286200 */  addu       $a1, $v1, $v0
/* 440A4 800538A4 1F00A010 */  beqz       $a1, .L80053924
/* 440A8 800538A8 80000624 */   addiu     $a2, $zero, 0x80
.L800538AC:
/* 440AC 800538AC 0000A294 */  lhu        $v0, 0x0($a1)
/* 440B0 800538B0 00000000 */  nop
/* 440B4 800538B4 00404230 */  andi       $v0, $v0, 0x4000
/* 440B8 800538B8 05004010 */  beqz       $v0, .L800538D0
/* 440BC 800538BC 00000000 */   nop
/* 440C0 800538C0 0400A294 */  lhu        $v0, 0x4($a1)
/* 440C4 800538C4 0100E724 */  addiu      $a3, $a3, 0x1
/* 440C8 800538C8 3A4E0108 */  j          .L800538E8
/* 440CC 800538CC 21400201 */   addu      $t0, $t0, $v0
.L800538D0:
/* 440D0 800538D0 0400A494 */  lhu        $a0, 0x4($a1)
/* 440D4 800538D4 01006B25 */  addiu      $t3, $t3, 0x1
/* 440D8 800538D8 2A104401 */  slt        $v0, $t2, $a0
/* 440DC 800538DC 02004010 */  beqz       $v0, .L800538E8
/* 440E0 800538E0 21482401 */   addu      $t1, $t1, $a0
/* 440E4 800538E4 21508000 */  addu       $t2, $a0, $zero
.L800538E8:
/* 440E8 800538E8 0700A280 */  lb         $v0, 0x7($a1)
/* 440EC 800538EC 00000000 */  nop
/* 440F0 800538F0 06004004 */  bltz       $v0, .L8005390C
/* 440F4 800538F4 00000000 */   nop
/* 440F8 800538F8 0700A290 */  lbu        $v0, 0x7($a1)
/* 440FC 800538FC 00000000 */  nop
/* 44100 80053900 C0100200 */  sll        $v0, $v0, 3
/* 44104 80053904 444E0108 */  j          .L80053910
/* 44108 80053908 21286200 */   addu      $a1, $v1, $v0
.L8005390C:
/* 4410C 8005390C 21280000 */  addu       $a1, $zero, $zero
.L80053910:
/* 44110 80053910 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 44114 80053914 0400C010 */  beqz       $a2, .L80053928
/* 44118 80053918 01000224 */   addiu     $v0, $zero, 0x1
/* 4411C 8005391C E3FFA014 */  bnez       $a1, .L800538AC
/* 44120 80053920 00000000 */   nop
.L80053924:
/* 44124 80053924 01000224 */  addiu      $v0, $zero, 0x1
.L80053928:
/* 44128 80053928 889982AF */  sw         $v0, %gp_rel(gSramFullAlarm)($gp)
/* 4412C 8005392C C0100800 */  sll        $v0, $t0, 3
/* 44130 80053930 24C382AF */  sw         $v0, %gp_rel(gSramTotalUsed)($gp)
/* 44134 80053934 C0100900 */  sll        $v0, $t1, 3
/* 44138 80053938 28C382AF */  sw         $v0, %gp_rel(gSramTotalFree)($gp)
/* 4413C 8005393C C0100A00 */  sll        $v0, $t2, 3
/* 44140 80053940 20C387AF */  sw         $a3, %gp_rel(gSramUsedBlocks)($gp)
/* 44144 80053944 D8C082AF */  sw         $v0, %gp_rel(gSramLargestFree)($gp)
/* 44148 80053948 1CC38BAF */  sw         $t3, %gp_rel(gSramFreeBlocks)($gp)
/* 4414C 8005394C 0800E003 */  jr         $ra
/* 44150 80053950 00000000 */   nop
.size setSramFullAlarm, . - setSramFullAlarm
