.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BF054
/* AF854 800BF054 4E1B033C */  lui        $v1, (0x1B4E81B5 >> 16)
/* AF858 800BF058 B5816334 */  ori        $v1, $v1, (0x1B4E81B5 & 0xFFFF)
/* AF85C 800BF05C 96008424 */  addiu      $a0, $a0, 0x96
/* AF860 800BF060 18008300 */  mult       $a0, $v1
/* AF864 800BF064 2110A000 */  addu       $v0, $a1, $zero
/* AF868 800BF068 8888053C */  lui        $a1, (0x88888889 >> 16)
/* AF86C 800BF06C 8988A534 */  ori        $a1, $a1, (0x88888889 & 0xFFFF)
/* AF870 800BF070 10180000 */  mfhi       $v1
/* AF874 800BF074 C3380300 */  sra        $a3, $v1, 3
/* AF878 800BF078 C31F0400 */  sra        $v1, $a0, 31
/* AF87C 800BF07C 2338E300 */  subu       $a3, $a3, $v1
/* AF880 800BF080 1800E500 */  mult       $a3, $a1
/* AF884 800BF084 6666093C */  lui        $t1, (0x66666667 >> 16)
/* AF888 800BF088 67662935 */  ori        $t1, $t1, (0x66666667 & 0xFFFF)
/* AF88C 800BF08C 80280700 */  sll        $a1, $a3, 2
/* AF890 800BF090 2128A700 */  addu       $a1, $a1, $a3
/* AF894 800BF094 00190500 */  sll        $v1, $a1, 4
/* AF898 800BF098 10300000 */  mfhi       $a2
/* AF89C 800BF09C 23186500 */  subu       $v1, $v1, $a1
/* AF8A0 800BF0A0 23208300 */  subu       $a0, $a0, $v1
/* AF8A4 800BF0A4 18008900 */  mult       $a0, $t1
/* AF8A8 800BF0A8 C31F0700 */  sra        $v1, $a3, 31
/* AF8AC 800BF0AC 2140C700 */  addu       $t0, $a2, $a3
/* AF8B0 800BF0B0 43410800 */  sra        $t0, $t0, 5
/* AF8B4 800BF0B4 23400301 */  subu       $t0, $t0, $v1
/* AF8B8 800BF0B8 00190800 */  sll        $v1, $t0, 4
/* AF8BC 800BF0BC 23186800 */  subu       $v1, $v1, $t0
/* AF8C0 800BF0C0 10280000 */  mfhi       $a1
/* AF8C4 800BF0C4 80180300 */  sll        $v1, $v1, 2
/* AF8C8 800BF0C8 2338E300 */  subu       $a3, $a3, $v1
/* AF8CC 800BF0CC 1800E900 */  mult       $a3, $t1
/* AF8D0 800BF0D0 C31F0400 */  sra        $v1, $a0, 31
/* AF8D4 800BF0D4 83280500 */  sra        $a1, $a1, 2
/* AF8D8 800BF0D8 2328A300 */  subu       $a1, $a1, $v1
/* AF8DC 800BF0DC 00310500 */  sll        $a2, $a1, 4
/* AF8E0 800BF0E0 80180500 */  sll        $v1, $a1, 2
/* AF8E4 800BF0E4 21186500 */  addu       $v1, $v1, $a1
/* AF8E8 800BF0E8 40180300 */  sll        $v1, $v1, 1
/* AF8EC 800BF0EC 23208300 */  subu       $a0, $a0, $v1
/* AF8F0 800BF0F0 10580000 */  mfhi       $t3
/* AF8F4 800BF0F4 2130C400 */  addu       $a2, $a2, $a0
/* AF8F8 800BF0F8 C31F0700 */  sra        $v1, $a3, 31
/* AF8FC 800BF0FC 18000901 */  mult       $t0, $t1
/* AF900 800BF100 020046A0 */  sb         $a2, 0x2($v0)
/* AF904 800BF104 83200B00 */  sra        $a0, $t3, 2
/* AF908 800BF108 23208300 */  subu       $a0, $a0, $v1
/* AF90C 800BF10C 00290400 */  sll        $a1, $a0, 4
/* AF910 800BF110 80180400 */  sll        $v1, $a0, 2
/* AF914 800BF114 21186400 */  addu       $v1, $v1, $a0
/* AF918 800BF118 40180300 */  sll        $v1, $v1, 1
/* AF91C 800BF11C 2338E300 */  subu       $a3, $a3, $v1
/* AF920 800BF120 2128A700 */  addu       $a1, $a1, $a3
/* AF924 800BF124 C31F0800 */  sra        $v1, $t0, 31
/* AF928 800BF128 010045A0 */  sb         $a1, 0x1($v0)
/* AF92C 800BF12C 10480000 */  mfhi       $t1
/* AF930 800BF130 83200900 */  sra        $a0, $t1, 2
/* AF934 800BF134 23208300 */  subu       $a0, $a0, $v1
/* AF938 800BF138 00290400 */  sll        $a1, $a0, 4
/* AF93C 800BF13C 80180400 */  sll        $v1, $a0, 2
/* AF940 800BF140 21186400 */  addu       $v1, $v1, $a0
/* AF944 800BF144 40180300 */  sll        $v1, $v1, 1
/* AF948 800BF148 23400301 */  subu       $t0, $t0, $v1
/* AF94C 800BF14C 2128A800 */  addu       $a1, $a1, $t0
/* AF950 800BF150 0800E003 */  jr         $ra
/* AF954 800BF154 000045A0 */   sb        $a1, 0x0($v0)
.size func_800BF054, . - func_800BF054
