.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_AspectAdjustMatrix
/* 2AFD0 8003A7D0 6666023C */  lui        $v0, (0x66666667 >> 16)
/* 2AFD4 8003A7D4 00008384 */  lh         $v1, 0x0($a0)
/* 2AFD8 8003A7D8 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
/* 2AFDC 8003A7DC 401A0300 */  sll        $v1, $v1, 9
/* 2AFE0 8003A7E0 18006200 */  mult       $v1, $v0
/* 2AFE4 8003A7E4 02008584 */  lh         $a1, 0x2($a0)
/* 2AFE8 8003A7E8 10500000 */  mfhi       $t2
/* 2AFEC 8003A7EC 402A0500 */  sll        $a1, $a1, 9
/* 2AFF0 8003A7F0 00000000 */  nop
/* 2AFF4 8003A7F4 1800A200 */  mult       $a1, $v0
/* 2AFF8 8003A7F8 04008684 */  lh         $a2, 0x4($a0)
/* 2AFFC 8003A7FC 06008784 */  lh         $a3, 0x6($a0)
/* 2B000 8003A800 08008884 */  lh         $t0, 0x8($a0)
/* 2B004 8003A804 0A008984 */  lh         $t1, 0xA($a0)
/* 2B008 8003A808 10580000 */  mfhi       $t3
/* 2B00C 8003A80C 40320600 */  sll        $a2, $a2, 9
/* 2B010 8003A810 C31F0300 */  sra        $v1, $v1, 31
/* 2B014 8003A814 1800C200 */  mult       $a2, $v0
/* 2B018 8003A818 060087A4 */  sh         $a3, 0x6($a0)
/* 2B01C 8003A81C 080088A4 */  sh         $t0, 0x8($a0)
/* 2B020 8003A820 0A0089A4 */  sh         $t1, 0xA($a0)
/* 2B024 8003A824 C32F0500 */  sra        $a1, $a1, 31
/* 2B028 8003A828 C3110A00 */  sra        $v0, $t2, 7
/* 2B02C 8003A82C 23104300 */  subu       $v0, $v0, $v1
/* 2B030 8003A830 000082A4 */  sh         $v0, 0x0($a0)
/* 2B034 8003A834 C3110B00 */  sra        $v0, $t3, 7
/* 2B038 8003A838 23104500 */  subu       $v0, $v0, $a1
/* 2B03C 8003A83C C3370600 */  sra        $a2, $a2, 31
/* 2B040 8003A840 020082A4 */  sh         $v0, 0x2($a0)
/* 2B044 8003A844 10680000 */  mfhi       $t5
/* 2B048 8003A848 C3110D00 */  sra        $v0, $t5, 7
/* 2B04C 8003A84C 23104600 */  subu       $v0, $v0, $a2
/* 2B050 8003A850 0800E003 */  jr         $ra
/* 2B054 8003A854 040082A4 */   sh        $v0, 0x4($a0)
.size PIPE3D_AspectAdjustMatrix, . - PIPE3D_AspectAdjustMatrix
