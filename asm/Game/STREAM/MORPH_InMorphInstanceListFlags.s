.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_InMorphInstanceListFlags
/* 4CFDC 8005C7DC FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4CFE0 8005C7E0 00000000 */  nop
/* 4CFE4 8005C7E4 0400438C */  lw         $v1, 0x4($v0)
/* 4CFE8 8005C7E8 00000000 */  nop
/* 4CFEC 8005C7EC 13006010 */  beqz       $v1, .L8005C83C
/* 4CFF0 8005C7F0 0004073C */   lui       $a3, (0x4000000 >> 16)
/* 4CFF4 8005C7F4 FFEF063C */  lui        $a2, (0xEFFFFFFF >> 16)
/* 4CFF8 8005C7F8 FFFFC634 */  ori        $a2, $a2, (0xEFFFFFFF & 0xFFFF)
/* 4CFFC 8005C7FC FFFB053C */  lui        $a1, (0xFBFFFFFF >> 16)
/* 4D000 8005C800 FFFFA534 */  ori        $a1, $a1, (0xFBFFFFFF & 0xFFFF)
.L8005C804:
/* 4D004 8005C804 1800648C */  lw         $a0, 0x18($v1)
/* 4D008 8005C808 00000000 */  nop
/* 4D00C 8005C80C 24108700 */  and        $v0, $a0, $a3
/* 4D010 8005C810 02004010 */  beqz       $v0, .L8005C81C
/* 4D014 8005C814 24108600 */   and       $v0, $a0, $a2
/* 4D018 8005C818 180062AC */  sw         $v0, 0x18($v1)
.L8005C81C:
/* 4D01C 8005C81C 1800628C */  lw         $v0, 0x18($v1)
/* 4D020 8005C820 00000000 */  nop
/* 4D024 8005C824 24104500 */  and        $v0, $v0, $a1
/* 4D028 8005C828 180062AC */  sw         $v0, 0x18($v1)
/* 4D02C 8005C82C 0800638C */  lw         $v1, 0x8($v1)
/* 4D030 8005C830 00000000 */  nop
/* 4D034 8005C834 F3FF6014 */  bnez       $v1, .L8005C804
/* 4D038 8005C838 00000000 */   nop
.L8005C83C:
/* 4D03C 8005C83C 0800E003 */  jr         $ra
/* 4D040 8005C840 00000000 */   nop
.size MORPH_InMorphInstanceListFlags, . - MORPH_InMorphInstanceListFlags
