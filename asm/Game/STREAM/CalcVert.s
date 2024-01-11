.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CalcVert
/* 4EEC0 8005E6C0 1000A88F */  lw         $t0, 0x10($sp)
/* 4EEC4 8005E6C4 00000000 */  nop
/* 4EEC8 8005E6C8 2338E800 */  subu       $a3, $a3, $t0
/* 4EECC 8005E6CC 033B0700 */  sra        $a3, $a3, 12
/* 4EED0 8005E6D0 1A000701 */  div        $zero, $t0, $a3
/* 4EED4 8005E6D4 12400000 */  mflo       $t0
/* 4EED8 8005E6D8 0000C38C */  lw         $v1, 0x0($a2)
/* 4EEDC 8005E6DC 0000A28C */  lw         $v0, 0x0($a1)
/* 4EEE0 8005E6E0 00000000 */  nop
/* 4EEE4 8005E6E4 23106200 */  subu       $v0, $v1, $v0
/* 4EEE8 8005E6E8 03130200 */  sra        $v0, $v0, 12
/* 4EEEC 8005E6EC 18004800 */  mult       $v0, $t0
/* 4EEF0 8005E6F0 12100000 */  mflo       $v0
/* 4EEF4 8005E6F4 21184300 */  addu       $v1, $v0, $v1
/* 4EEF8 8005E6F8 000083AC */  sw         $v1, 0x0($a0)
/* 4EEFC 8005E6FC 0400C38C */  lw         $v1, 0x4($a2)
/* 4EF00 8005E700 0400A28C */  lw         $v0, 0x4($a1)
/* 4EF04 8005E704 00000000 */  nop
/* 4EF08 8005E708 23106200 */  subu       $v0, $v1, $v0
/* 4EF0C 8005E70C 03130200 */  sra        $v0, $v0, 12
/* 4EF10 8005E710 18004800 */  mult       $v0, $t0
/* 4EF14 8005E714 12100000 */  mflo       $v0
/* 4EF18 8005E718 21184300 */  addu       $v1, $v0, $v1
/* 4EF1C 8005E71C 040083AC */  sw         $v1, 0x4($a0)
/* 4EF20 8005E720 0800C38C */  lw         $v1, 0x8($a2)
/* 4EF24 8005E724 0800A28C */  lw         $v0, 0x8($a1)
/* 4EF28 8005E728 00000000 */  nop
/* 4EF2C 8005E72C 23106200 */  subu       $v0, $v1, $v0
/* 4EF30 8005E730 03130200 */  sra        $v0, $v0, 12
/* 4EF34 8005E734 18004800 */  mult       $v0, $t0
/* 4EF38 8005E738 12100000 */  mflo       $v0
/* 4EF3C 8005E73C 21184300 */  addu       $v1, $v0, $v1
/* 4EF40 8005E740 0800E003 */  jr         $ra
/* 4EF44 8005E744 080083AC */   sw        $v1, 0x8($a0)
.size CalcVert, . - CalcVert
