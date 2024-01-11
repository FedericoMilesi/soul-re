.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_DoCameraCollision2
/* DD84 8001D584 78FFBD27 */  addiu      $sp, $sp, -0x88
/* DD88 8001D588 7400B1AF */  sw         $s1, 0x74($sp)
/* DD8C 8001D58C 21888000 */  addu       $s1, $a0, $zero
/* DD90 8001D590 2110A000 */  addu       $v0, $a1, $zero
/* DD94 8001D594 7C00B3AF */  sw         $s3, 0x7C($sp)
/* DD98 8001D598 2198C000 */  addu       $s3, $a2, $zero
/* DD9C 8001D59C 7800B2AF */  sw         $s2, 0x78($sp)
/* DDA0 8001D5A0 21900000 */  addu       $s2, $zero, $zero
/* DDA4 8001D5A4 1000A527 */  addiu      $a1, $sp, 0x10
/* DDA8 8001D5A8 21304000 */  addu       $a2, $v0, $zero
/* DDAC 8001D5AC 8000BFAF */  sw         $ra, 0x80($sp)
/* DDB0 8001D5B0 9174000C */  jal        CAMERA_SetupColInfo
/* DDB4 8001D5B4 7000B0AF */   sw        $s0, 0x70($sp)
/* DDB8 8001D5B8 E800228E */  lw         $v0, 0xE8($s1)
/* DDBC 8001D5BC 0100033C */  lui        $v1, (0x10000 >> 16)
/* DDC0 8001D5C0 24104300 */  and        $v0, $v0, $v1
/* DDC4 8001D5C4 10004014 */  bnez       $v0, .L8001D608
/* DDC8 8001D5C8 21800000 */   addu      $s0, $zero, $zero
/* DDCC 8001D5CC AC042486 */  lh         $a0, 0x4AC($s1)
/* DDD0 8001D5D0 AE012386 */  lh         $v1, 0x1AE($s1)
/* DDD4 8001D5D4 00000000 */  nop
/* DDD8 8001D5D8 23108300 */  subu       $v0, $a0, $v1
/* DDDC 8001D5DC 05004004 */  bltz       $v0, .L8001D5F4
/* DDE0 8001D5E0 05004228 */   slti      $v0, $v0, 0x5
/* DDE4 8001D5E4 07004010 */  beqz       $v0, .L8001D604
/* DDE8 8001D5E8 21202002 */   addu      $a0, $s1, $zero
/* DDEC 8001D5EC 83750008 */  j          .L8001D60C
/* DDF0 8001D5F0 00000000 */   nop
.L8001D5F4:
/* DDF4 8001D5F4 23106400 */  subu       $v0, $v1, $a0
/* DDF8 8001D5F8 05004228 */  slti       $v0, $v0, 0x5
/* DDFC 8001D5FC 02004014 */  bnez       $v0, .L8001D608
/* DE00 8001D600 21800000 */   addu      $s0, $zero, $zero
.L8001D604:
/* DE04 8001D604 01001024 */  addiu      $s0, $zero, 0x1
.L8001D608:
/* DE08 8001D608 21202002 */  addu       $a0, $s1, $zero
.L8001D60C:
/* DE0C 8001D60C 1000A527 */  addiu      $a1, $sp, 0x10
/* DE10 8001D610 695F000C */  jal        CAMERA_SphereToSphereWithLines
/* DE14 8001D614 21300002 */   addu      $a2, $s0, $zero
/* DE18 8001D618 780422AE */  sw         $v0, 0x478($s1)
/* DE1C 8001D61C 9C04228E */  lw         $v0, 0x49C($s1)
/* DE20 8001D620 0002033C */  lui        $v1, (0x2000000 >> 16)
/* DE24 8001D624 24104300 */  and        $v0, $v0, $v1
/* DE28 8001D628 27004010 */  beqz       $v0, .L8001D6C8
/* DE2C 8001D62C 0100033C */   lui       $v1, (0x12000 >> 16)
/* DE30 8001D630 5800A38F */  lw         $v1, 0x58($sp)
/* DE34 8001D634 00000000 */  nop
/* DE38 8001D638 22006018 */  blez       $v1, .L8001D6C4
/* DE3C 8001D63C 00000000 */   nop
/* DE40 8001D640 5C00A28F */  lw         $v0, 0x5C($sp)
/* DE44 8001D644 00000000 */  nop
/* DE48 8001D648 58024228 */  slti       $v0, $v0, 0x258
/* DE4C 8001D64C 1D004010 */  beqz       $v0, .L8001D6C4
/* DE50 8001D650 FFFF0224 */   addiu     $v0, $zero, -0x1
/* DE54 8001D654 DCAB82A7 */  sh         $v0, %gp_rel(CenterFlag)($gp)
/* DE58 8001D658 01000224 */  addiu      $v0, $zero, 0x1
/* DE5C 8001D65C 06006214 */  bne        $v1, $v0, .L8001D678
/* DE60 8001D660 00000000 */   nop
/* DE64 8001D664 5000A28F */  lw         $v0, 0x50($sp)
/* DE68 8001D668 00000000 */  nop
/* DE6C 8001D66C 06004230 */  andi       $v0, $v0, 0x6
/* DE70 8001D670 15004014 */  bnez       $v0, .L8001D6C8
/* DE74 8001D674 0100033C */   lui       $v1, (0x12000 >> 16)
.L8001D678:
/* DE78 8001D678 D8AB8287 */  lh         $v0, %gp_rel(combat_cam_weight)($gp)
/* DE7C 8001D67C D8AB8397 */  lhu        $v1, %gp_rel(combat_cam_weight)($gp)
/* DE80 8001D680 00104228 */  slti       $v0, $v0, 0x1000
/* DE84 8001D684 0F004010 */  beqz       $v0, .L8001D6C4
/* DE88 8001D688 90006224 */   addiu     $v0, $v1, 0x90
/* DE8C 8001D68C D8AB82A7 */  sh         $v0, %gp_rel(combat_cam_weight)($gp)
/* DE90 8001D690 00140200 */  sll        $v0, $v0, 16
/* DE94 8001D694 03140200 */  sra        $v0, $v0, 16
/* DE98 8001D698 00104228 */  slti       $v0, $v0, 0x1000
/* DE9C 8001D69C 02004014 */  bnez       $v0, .L8001D6A8
/* DEA0 8001D6A0 00100224 */   addiu     $v0, $zero, 0x1000
/* DEA4 8001D6A4 D8AB82A7 */  sh         $v0, %gp_rel(combat_cam_weight)($gp)
.L8001D6A8:
/* DEA8 8001D6A8 D8AB8287 */  lh         $v0, %gp_rel(combat_cam_weight)($gp)
/* DEAC 8001D6AC 00000000 */  nop
/* DEB0 8001D6B0 3C0F4228 */  slti       $v0, $v0, 0xF3C
/* DEB4 8001D6B4 04004010 */  beqz       $v0, .L8001D6C8
/* DEB8 8001D6B8 0100033C */   lui       $v1, (0x12000 >> 16)
.L8001D6BC:
/* DEBC 8001D6BC DB760008 */  j          .L8001DB6C
/* DEC0 8001D6C0 01000224 */   addiu     $v0, $zero, 0x1
.L8001D6C4:
/* DEC4 8001D6C4 0100033C */  lui        $v1, (0x12000 >> 16)
.L8001D6C8:
/* DEC8 8001D6C8 E800228E */  lw         $v0, 0xE8($s1)
/* DECC 8001D6CC 00206334 */  ori        $v1, $v1, (0x12000 & 0xFFFF)
/* DED0 8001D6D0 24104300 */  and        $v0, $v0, $v1
/* DED4 8001D6D4 34004014 */  bnez       $v0, .L8001D7A8
/* DED8 8001D6D8 00000000 */   nop
/* DEDC 8001D6DC A004228E */  lw         $v0, 0x4A0($s1)
/* DEE0 8001D6E0 00000000 */  nop
/* DEE4 8001D6E4 30004014 */  bnez       $v0, .L8001D7A8
/* DEE8 8001D6E8 00000000 */   nop
/* DEEC 8001D6EC 2E000016 */  bnez       $s0, .L8001D7A8
/* DEF0 8001D6F0 00000000 */   nop
/* DEF4 8001D6F4 AE042286 */  lh         $v0, 0x4AE($s1)
/* DEF8 8001D6F8 00000000 */  nop
/* DEFC 8001D6FC 2A004014 */  bnez       $v0, .L8001D7A8
/* DF00 8001D700 00000000 */   nop
/* DF04 8001D704 08042286 */  lh         $v0, 0x408($s1)
/* DF08 8001D708 00000000 */  nop
/* DF0C 8001D70C 26004014 */  bnez       $v0, .L8001D7A8
/* DF10 8001D710 00000000 */   nop
/* DF14 8001D714 5800A38F */  lw         $v1, 0x58($sp)
/* DF18 8001D718 00000000 */  nop
/* DF1C 8001D71C 22006018 */  blez       $v1, .L8001D7A8
/* DF20 8001D720 04000224 */   addiu     $v0, $zero, 0x4
/* DF24 8001D724 05006210 */  beq        $v1, $v0, .L8001D73C
/* DF28 8001D728 00000000 */   nop
/* DF2C 8001D72C 488E8287 */  lh         $v0, %gp_rel(camera_still)($gp)
/* DF30 8001D730 00000000 */  nop
/* DF34 8001D734 1C004010 */  beqz       $v0, .L8001D7A8
/* DF38 8001D738 00000000 */   nop
.L8001D73C:
/* DF3C 8001D73C 5C00A28F */  lw         $v0, 0x5C($sp)
/* DF40 8001D740 00000000 */  nop
/* DF44 8001D744 90014228 */  slti       $v0, $v0, 0x190
/* DF48 8001D748 17004010 */  beqz       $v0, .L8001D7A8
/* DF4C 8001D74C 00000000 */   nop
/* DF50 8001D750 6A8E8397 */  lhu        $v1, %gp_rel(panic_count)($gp)
/* DF54 8001D754 10BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x48)($gp)
/* DF58 8001D758 01006324 */  addiu      $v1, $v1, 0x1
/* DF5C 8001D75C 01004230 */  andi       $v0, $v0, 0x1
/* DF60 8001D760 6A8E83A7 */  sh         $v1, %gp_rel(panic_count)($gp)
/* DF64 8001D764 07004010 */  beqz       $v0, .L8001D784
/* DF68 8001D768 00140300 */   sll       $v0, $v1, 16
/* DF6C 8001D76C 03140200 */  sra        $v0, $v0, 16
/* DF70 8001D770 0B004228 */  slti       $v0, $v0, 0xB
/* DF74 8001D774 07004010 */  beqz       $v0, .L8001D794
/* DF78 8001D778 00000000 */   nop
/* DF7C 8001D77C EB750008 */  j          .L8001D7AC
/* DF80 8001D780 00000000 */   nop
.L8001D784:
/* DF84 8001D784 03140200 */  sra        $v0, $v0, 16
/* DF88 8001D788 02004228 */  slti       $v0, $v0, 0x2
/* DF8C 8001D78C 07004014 */  bnez       $v0, .L8001D7AC
/* DF90 8001D790 00000000 */   nop
.L8001D794:
/* DF94 8001D794 5C00A587 */  lh         $a1, 0x5C($sp)
/* DF98 8001D798 F574000C */  jal        CAMERA_Panic
/* DF9C 8001D79C 21202002 */   addu      $a0, $s1, $zero
/* DFA0 8001D7A0 EB750008 */  j          .L8001D7AC
/* DFA4 8001D7A4 00000000 */   nop
.L8001D7A8:
/* DFA8 8001D7A8 6A8E80A7 */  sh         $zero, %gp_rel(panic_count)($gp)
.L8001D7AC:
/* DFAC 8001D7AC 7804228E */  lw         $v0, 0x478($s1)
/* DFB0 8001D7B0 00000000 */  nop
/* DFB4 8001D7B4 0F004010 */  beqz       $v0, .L8001D7F4
/* DFB8 8001D7B8 00000000 */   nop
/* DFBC 8001D7BC 0D000012 */  beqz       $s0, .L8001D7F4
/* DFC0 8001D7C0 21202002 */   addu      $a0, $s1, $zero
/* DFC4 8001D7C4 1000A527 */  addiu      $a1, $sp, 0x10
/* DFC8 8001D7C8 AA012226 */  addiu      $v0, $s1, 0x1AA
/* DFCC 8001D7CC 21300000 */  addu       $a2, $zero, $zero
/* DFD0 8001D7D0 AA012396 */  lhu        $v1, 0x1AA($s1)
/* DFD4 8001D7D4 02004794 */  lhu        $a3, 0x2($v0)
/* DFD8 8001D7D8 04004894 */  lhu        $t0, 0x4($v0)
/* DFDC 8001D7DC CC012226 */  addiu      $v0, $s1, 0x1CC
/* DFE0 8001D7E0 CC0123A6 */  sh         $v1, 0x1CC($s1)
/* DFE4 8001D7E4 020047A4 */  sh         $a3, 0x2($v0)
/* DFE8 8001D7E8 695F000C */  jal        CAMERA_SphereToSphereWithLines
/* DFEC 8001D7EC 040048A4 */   sh        $t0, 0x4($v0)
/* DFF0 8001D7F0 780422AE */  sw         $v0, 0x478($s1)
.L8001D7F4:
/* DFF4 8001D7F4 16006012 */  beqz       $s3, .L8001D850
/* DFF8 8001D7F8 00000000 */   nop
/* DFFC 8001D7FC 7804228E */  lw         $v0, 0x478($s1)
/* E000 8001D800 00000000 */  nop
/* E004 8001D804 10004010 */  beqz       $v0, .L8001D848
/* E008 8001D808 04000224 */   addiu     $v0, $zero, 0x4
/* E00C 8001D80C F0002386 */  lh         $v1, 0xF0($s1)
/* E010 8001D810 00000000 */  nop
/* E014 8001D814 05006210 */  beq        $v1, $v0, .L8001D82C
/* E018 8001D818 02000224 */   addiu     $v0, $zero, 0x2
/* E01C 8001D81C 03006210 */  beq        $v1, $v0, .L8001D82C
/* E020 8001D820 06000224 */   addiu     $v0, $zero, 0x6
/* E024 8001D824 D1006214 */  bne        $v1, $v0, .L8001DB6C
/* E028 8001D828 01000224 */   addiu     $v0, $zero, 0x1
.L8001D82C:
/* E02C 8001D82C 5400A28F */  lw         $v0, 0x54($sp)
/* E030 8001D830 00000000 */  nop
/* E034 8001D834 40100200 */  sll        $v0, $v0, 1
/* E038 8001D838 2110A203 */  addu       $v0, $sp, $v0
/* E03C 8001D83C 44004294 */  lhu        $v0, 0x44($v0)
/* E040 8001D840 AF750008 */  j          .L8001D6BC
/* E044 8001D844 B00122A6 */   sh        $v0, 0x1B0($s1)
.L8001D848:
/* E048 8001D848 DB760008 */  j          .L8001DB6C
/* E04C 8001D84C 21100000 */   addu      $v0, $zero, $zero
.L8001D850:
/* E050 8001D850 6C8E828F */  lw         $v0, %gp_rel(panic_count + 0x2)($gp)
/* E054 8001D854 00000000 */  nop
/* E058 8001D858 02004018 */  blez       $v0, .L8001D864
/* E05C 8001D85C FFFF4224 */   addiu     $v0, $v0, -0x1
/* E060 8001D860 6C8E82AF */  sw         $v0, %gp_rel(panic_count + 0x2)($gp)
.L8001D864:
/* E064 8001D864 AE042286 */  lh         $v0, 0x4AE($s1)
/* E068 8001D868 00000000 */  nop
/* E06C 8001D86C 02004010 */  beqz       $v0, .L8001D878
/* E070 8001D870 04000224 */   addiu     $v0, $zero, 0x4
/* E074 8001D874 5800A2AF */  sw         $v0, 0x58($sp)
.L8001D878:
/* E078 8001D878 E800248E */  lw         $a0, 0xE8($s1)
/* E07C 8001D87C 0100023C */  lui        $v0, (0x10000 >> 16)
/* E080 8001D880 24108200 */  and        $v0, $a0, $v0
/* E084 8001D884 0F004014 */  bnez       $v0, .L8001D8C4
/* E088 8001D888 0024023C */   lui       $v0, (0x24000000 >> 16)
/* E08C 8001D88C 9C04238E */  lw         $v1, 0x49C($s1)
/* E090 8001D890 00000000 */  nop
/* E094 8001D894 24106200 */  and        $v0, $v1, $v0
/* E098 8001D898 0A004014 */  bnez       $v0, .L8001D8C4
/* E09C 8001D89C 00208230 */   andi      $v0, $a0, 0x2000
/* E0A0 8001D8A0 04004010 */  beqz       $v0, .L8001D8B4
/* E0A4 8001D8A4 0002023C */   lui       $v0, (0x2000000 >> 16)
/* E0A8 8001D8A8 24106200 */  and        $v0, $v1, $v0
/* E0AC 8001D8AC 05004010 */  beqz       $v0, .L8001D8C4
/* E0B0 8001D8B0 00000000 */   nop
.L8001D8B4:
/* E0B4 8001D8B4 AE042286 */  lh         $v0, 0x4AE($s1)
/* E0B8 8001D8B8 00000000 */  nop
/* E0BC 8001D8BC 52004010 */  beqz       $v0, .L8001DA08
/* E0C0 8001D8C0 00000000 */   nop
.L8001D8C4:
/* E0C4 8001D8C4 7804228E */  lw         $v0, 0x478($s1)
/* E0C8 8001D8C8 00000000 */  nop
/* E0CC 8001D8CC 08004010 */  beqz       $v0, .L8001D8F0
/* E0D0 8001D8D0 21202002 */   addu      $a0, $s1, $zero
/* E0D4 8001D8D4 4366000C */  jal        CAMERA_AbsoluteCollision
/* E0D8 8001D8D8 1000A527 */   addiu     $a1, $sp, 0x10
/* E0DC 8001D8DC 21904000 */  addu       $s2, $v0, $zero
/* E0E0 8001D8E0 1E000224 */  addiu      $v0, $zero, 0x1E
/* E0E4 8001D8E4 6C8E82AF */  sw         $v0, %gp_rel(panic_count + 0x2)($gp)
/* E0E8 8001D8E8 3F760008 */  j          .L8001D8FC
/* E0EC 8001D8EC 00000000 */   nop
.L8001D8F0:
/* E0F0 8001D8F0 A8012296 */  lhu        $v0, 0x1A8($s1)
/* E0F4 8001D8F4 00000000 */  nop
/* E0F8 8001D8F8 B00122A6 */  sh         $v0, 0x1B0($s1)
.L8001D8FC:
/* E0FC 8001D8FC E800228E */  lw         $v0, 0xE8($s1)
/* E100 8001D900 0100033C */  lui        $v1, (0x10000 >> 16)
/* E104 8001D904 24104300 */  and        $v0, $v0, $v1
/* E108 8001D908 3A004010 */  beqz       $v0, .L8001D9F4
/* E10C 8001D90C C0012426 */   addiu     $a0, $s1, 0x1C0
/* E110 8001D910 C0012486 */  lh         $a0, 0x1C0($s1)
/* E114 8001D914 B6012586 */  lh         $a1, 0x1B6($s1)
/* E118 8001D918 7EE8000C */  jal        AngleDiff
/* E11C 8001D91C 00000000 */   nop
/* E120 8001D920 00140200 */  sll        $v0, $v0, 16
/* E124 8001D924 08004004 */  bltz       $v0, .L8001D948
/* E128 8001D928 00000000 */   nop
/* E12C 8001D92C C0012486 */  lh         $a0, 0x1C0($s1)
/* E130 8001D930 B6012586 */  lh         $a1, 0x1B6($s1)
/* E134 8001D934 7EE8000C */  jal        AngleDiff
/* E138 8001D938 00000000 */   nop
/* E13C 8001D93C 00140200 */  sll        $v0, $v0, 16
/* E140 8001D940 59760008 */  j          .L8001D964
/* E144 8001D944 03840200 */   sra       $s0, $v0, 16
.L8001D948:
/* E148 8001D948 C0012486 */  lh         $a0, 0x1C0($s1)
/* E14C 8001D94C B6012586 */  lh         $a1, 0x1B6($s1)
/* E150 8001D950 7EE8000C */  jal        AngleDiff
/* E154 8001D954 00000000 */   nop
/* E158 8001D958 00140200 */  sll        $v0, $v0, 16
/* E15C 8001D95C 03140200 */  sra        $v0, $v0, 16
/* E160 8001D960 23800200 */  negu       $s0, $v0
.L8001D964:
/* E164 8001D964 5000A28F */  lw         $v0, 0x50($sp)
/* E168 8001D968 00000000 */  nop
/* E16C 8001D96C 06004230 */  andi       $v0, $v0, 0x6
/* E170 8001D970 04004014 */  bnez       $v0, .L8001D984
/* E174 8001D974 0004022A */   slti      $v0, $s0, 0x400
/* E178 8001D978 D764000C */  jal        CAMERA_dampgetline
/* E17C 8001D97C 21200000 */   addu      $a0, $zero, $zero
/* E180 8001D980 0004022A */  slti       $v0, $s0, 0x400
.L8001D984:
/* E184 8001D984 06004014 */  bnez       $v0, .L8001D9A0
/* E188 8001D988 00000000 */   nop
/* E18C 8001D98C 5000A28F */  lw         $v0, 0x50($sp)
/* E190 8001D990 00000000 */  nop
/* E194 8001D994 06004230 */  andi       $v0, $v0, 0x6
/* E198 8001D998 0E004010 */  beqz       $v0, .L8001D9D4
/* E19C 8001D99C 00000000 */   nop
.L8001D9A0:
/* E1A0 8001D9A0 02000106 */  bgez       $s0, .L8001D9AC
/* E1A4 8001D9A4 21100002 */   addu      $v0, $s0, $zero
/* E1A8 8001D9A8 0F000226 */  addiu      $v0, $s0, 0xF
.L8001D9AC:
/* E1AC 8001D9AC 03810200 */  sra        $s0, $v0, 4
/* E1B0 8001D9B0 0800022A */  slti       $v0, $s0, 0x8
/* E1B4 8001D9B4 03004010 */  beqz       $v0, .L8001D9C4
/* E1B8 8001D9B8 2100022A */   slti      $v0, $s0, 0x21
/* E1BC 8001D9BC 08001024 */  addiu      $s0, $zero, 0x8
/* E1C0 8001D9C0 2100022A */  slti       $v0, $s0, 0x21
.L8001D9C4:
/* E1C4 8001D9C4 05004014 */  bnez       $v0, .L8001D9DC
/* E1C8 8001D9C8 C0012426 */   addiu     $a0, $s1, 0x1C0
/* E1CC 8001D9CC 77760008 */  j          .L8001D9DC
/* E1D0 8001D9D0 20001024 */   addiu     $s0, $zero, 0x20
.L8001D9D4:
/* E1D4 8001D9D4 40001024 */  addiu      $s0, $zero, 0x40
/* E1D8 8001D9D8 C0012426 */  addiu      $a0, $s1, 0x1C0
.L8001D9DC:
/* E1DC 8001D9DC B6012586 */  lh         $a1, 0x1B6($s1)
/* E1E0 8001D9E0 00341000 */  sll        $a2, $s0, 16
/* E1E4 8001D9E4 4C5C000C */  jal        Decouple_AngleMoveToward
/* E1E8 8001D9E8 03340600 */   sra       $a2, $a2, 16
/* E1EC 8001D9EC DB760008 */  j          .L8001DB6C
/* E1F0 8001D9F0 21104002 */   addu      $v0, $s2, $zero
.L8001D9F4:
/* E1F4 8001D9F4 B6012586 */  lh         $a1, 0x1B6($s1)
/* E1F8 8001D9F8 4C5C000C */  jal        Decouple_AngleMoveToward
/* E1FC 8001D9FC 40000624 */   addiu     $a2, $zero, 0x40
/* E200 8001DA00 DB760008 */  j          .L8001DB6C
/* E204 8001DA04 21104002 */   addu      $v0, $s2, $zero
.L8001DA08:
/* E208 8001DA08 7804228E */  lw         $v0, 0x478($s1)
/* E20C 8001DA0C 00000000 */  nop
/* E210 8001DA10 09004010 */  beqz       $v0, .L8001DA38
/* E214 8001DA14 21202002 */   addu      $a0, $s1, $zero
/* E218 8001DA18 4366000C */  jal        CAMERA_AbsoluteCollision
/* E21C 8001DA1C 1000A527 */   addiu     $a1, $sp, 0x10
/* E220 8001DA20 21904000 */  addu       $s2, $v0, $zero
/* E224 8001DA24 C0012396 */  lhu        $v1, 0x1C0($s1)
/* E228 8001DA28 1E000224 */  addiu      $v0, $zero, 0x1E
/* E22C 8001DA2C 6C8E82AF */  sw         $v0, %gp_rel(panic_count + 0x2)($gp)
/* E230 8001DA30 DA760008 */  j          .L8001DB68
/* E234 8001DA34 B60123A6 */   sh        $v1, 0x1B6($s1)
.L8001DA38:
/* E238 8001DA38 D764000C */  jal        CAMERA_dampgetline
/* E23C 8001DA3C 21200000 */   addu      $a0, $zero, $zero
/* E240 8001DA40 F0002386 */  lh         $v1, 0xF0($s1)
/* E244 8001DA44 0D000224 */  addiu      $v0, $zero, 0xD
/* E248 8001DA48 33006214 */  bne        $v1, $v0, .L8001DB18
/* E24C 8001DA4C 00000000 */   nop
/* E250 8001DA50 A004228E */  lw         $v0, 0x4A0($s1)
/* E254 8001DA54 00000000 */  nop
/* E258 8001DA58 2F004018 */  blez       $v0, .L8001DB18
/* E25C 8001DA5C 00000000 */   nop
/* E260 8001DA60 C0012486 */  lh         $a0, 0x1C0($s1)
/* E264 8001DA64 40012586 */  lh         $a1, 0x140($s1)
/* E268 8001DA68 BC59000C */  jal        CAMERA_AngleDifference
/* E26C 8001DA6C 00000000 */   nop
/* E270 8001DA70 00140200 */  sll        $v0, $v0, 16
/* E274 8001DA74 03140200 */  sra        $v0, $v0, 16
/* E278 8001DA78 05004228 */  slti       $v0, $v0, 0x5
/* E27C 8001DA7C 08004010 */  beqz       $v0, .L8001DAA0
/* E280 8001DA80 00000000 */   nop
/* E284 8001DA84 B6012296 */  lhu        $v0, 0x1B6($s1)
/* E288 8001DA88 6C8E838F */  lw         $v1, %gp_rel(panic_count + 0x2)($gp)
/* E28C 8001DA8C 00000000 */  nop
/* E290 8001DA90 29006014 */  bnez       $v1, .L8001DB38
/* E294 8001DA94 C00122A6 */   sh        $v0, 0x1C0($s1)
/* E298 8001DA98 CE760008 */  j          .L8001DB38
/* E29C 8001DA9C 940420A6 */   sh        $zero, 0x494($s1)
.L8001DAA0:
/* E2A0 8001DAA0 C0012486 */  lh         $a0, 0x1C0($s1)
/* E2A4 8001DAA4 40012586 */  lh         $a1, 0x140($s1)
/* E2A8 8001DAA8 DA59000C */  jal        CAMERA_SignedAngleDifference
/* E2AC 8001DAAC 00000000 */   nop
/* E2B0 8001DAB0 00140200 */  sll        $v0, $v0, 16
/* E2B4 8001DAB4 B6012486 */  lh         $a0, 0x1B6($s1)
/* E2B8 8001DAB8 40012586 */  lh         $a1, 0x140($s1)
/* E2BC 8001DABC DA59000C */  jal        CAMERA_SignedAngleDifference
/* E2C0 8001DAC0 03840200 */   sra       $s0, $v0, 16
/* E2C4 8001DAC4 00140200 */  sll        $v0, $v0, 16
/* E2C8 8001DAC8 03000106 */  bgez       $s0, .L8001DAD8
/* E2CC 8001DACC 03140200 */   sra       $v0, $v0, 16
/* E2D0 8001DAD0 05004004 */  bltz       $v0, .L8001DAE8
/* E2D4 8001DAD4 00000000 */   nop
.L8001DAD8:
/* E2D8 8001DAD8 1700001A */  blez       $s0, .L8001DB38
/* E2DC 8001DADC 00000000 */   nop
/* E2E0 8001DAE0 15004018 */  blez       $v0, .L8001DB38
/* E2E4 8001DAE4 00000000 */   nop
.L8001DAE8:
/* E2E8 8001DAE8 02004104 */  bgez       $v0, .L8001DAF4
/* E2EC 8001DAEC 21184000 */   addu      $v1, $v0, $zero
/* E2F0 8001DAF0 23180300 */  negu       $v1, $v1
.L8001DAF4:
/* E2F4 8001DAF4 02000106 */  bgez       $s0, .L8001DB00
/* E2F8 8001DAF8 21100002 */   addu      $v0, $s0, $zero
/* E2FC 8001DAFC 23100200 */  negu       $v0, $v0
.L8001DB00:
/* E300 8001DB00 2A104300 */  slt        $v0, $v0, $v1
/* E304 8001DB04 0C004010 */  beqz       $v0, .L8001DB38
/* E308 8001DB08 00000000 */   nop
/* E30C 8001DB0C B6012296 */  lhu        $v0, 0x1B6($s1)
/* E310 8001DB10 CE760008 */  j          .L8001DB38
/* E314 8001DB14 C00122A6 */   sh        $v0, 0x1C0($s1)
.L8001DB18:
/* E318 8001DB18 6C8E828F */  lw         $v0, %gp_rel(panic_count + 0x2)($gp)
/* E31C 8001DB1C 00000000 */  nop
/* E320 8001DB20 05004014 */  bnez       $v0, .L8001DB38
/* E324 8001DB24 C0012426 */   addiu     $a0, $s1, 0x1C0
/* E328 8001DB28 B6012586 */  lh         $a1, 0x1B6($s1)
/* E32C 8001DB2C 4C5C000C */  jal        Decouple_AngleMoveToward
/* E330 8001DB30 40000624 */   addiu     $a2, $zero, 0x40
/* E334 8001DB34 940420A6 */  sh         $zero, 0x494($s1)
.L8001DB38:
/* E338 8001DB38 9C04228E */  lw         $v0, 0x49C($s1)
/* E33C 8001DB3C 0002033C */  lui        $v1, (0x2000000 >> 16)
/* E340 8001DB40 24104300 */  and        $v0, $v0, $v1
/* E344 8001DB44 05004010 */  beqz       $v0, .L8001DB5C
/* E348 8001DB48 00000000 */   nop
/* E34C 8001DB4C D4AB8297 */  lhu        $v0, %gp_rel(combat_cam_distance)($gp)
/* E350 8001DB50 6C8E80AF */  sw         $zero, %gp_rel(panic_count + 0x2)($gp)
/* E354 8001DB54 DA760008 */  j          .L8001DB68
/* E358 8001DB58 B00122A6 */   sh        $v0, 0x1B0($s1)
.L8001DB5C:
/* E35C 8001DB5C A8012296 */  lhu        $v0, 0x1A8($s1)
/* E360 8001DB60 00000000 */  nop
/* E364 8001DB64 B00122A6 */  sh         $v0, 0x1B0($s1)
.L8001DB68:
/* E368 8001DB68 21104002 */  addu       $v0, $s2, $zero
.L8001DB6C:
/* E36C 8001DB6C 8000BF8F */  lw         $ra, 0x80($sp)
/* E370 8001DB70 7C00B38F */  lw         $s3, 0x7C($sp)
/* E374 8001DB74 7800B28F */  lw         $s2, 0x78($sp)
/* E378 8001DB78 7400B18F */  lw         $s1, 0x74($sp)
/* E37C 8001DB7C 7000B08F */  lw         $s0, 0x70($sp)
/* E380 8001DB80 0800E003 */  jr         $ra
/* E384 8001DB84 8800BD27 */   addiu     $sp, $sp, 0x88
.size CAMERA_DoCameraCollision2, . - CAMERA_DoCameraCollision2
