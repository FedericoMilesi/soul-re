.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CollidePhysicalObject
/* 5DE24 8006D624 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 5DE28 8006D628 8C00B1AF */  sw         $s1, 0x8C($sp)
/* 5DE2C 8006D62C 21888000 */  addu       $s1, $a0, $zero
/* 5DE30 8006D630 9C00B5AF */  sw         $s5, 0x9C($sp)
/* 5DE34 8006D634 21A80000 */  addu       $s5, $zero, $zero
/* 5DE38 8006D638 9800B4AF */  sw         $s4, 0x98($sp)
/* 5DE3C 8006D63C 21A0A002 */  addu       $s4, $s5, $zero
/* 5DE40 8006D640 A400B7AF */  sw         $s7, 0xA4($sp)
/* 5DE44 8006D644 01001724 */  addiu      $s7, $zero, 0x1
/* 5DE48 8006D648 AC00BFAF */  sw         $ra, 0xAC($sp)
/* 5DE4C 8006D64C A800BEAF */  sw         $fp, 0xA8($sp)
/* 5DE50 8006D650 A000B6AF */  sw         $s6, 0xA0($sp)
/* 5DE54 8006D654 9400B3AF */  sw         $s3, 0x94($sp)
/* 5DE58 8006D658 9000B2AF */  sw         $s2, 0x90($sp)
/* 5DE5C 8006D65C 8800B0AF */  sw         $s0, 0x88($sp)
/* 5DE60 8006D660 8000A0AF */  sw         $zero, 0x80($sp)
/* 5DE64 8006D664 C000328E */  lw         $s2, 0xC0($s1)
/* 5DE68 8006D668 6C01338E */  lw         $s3, 0x16C($s1)
/* 5DE6C 8006D66C CFA3010C */  jal        CheckPhysObFamily
/* 5DE70 8006D670 07000524 */   addiu     $a1, $zero, 0x7
/* 5DE74 8006D674 2BF00200 */  sltu       $fp, $zero, $v0
/* 5DE78 8006D678 1300C013 */  beqz       $fp, .L8006D6C8
/* 5DE7C 8006D67C 18005626 */   addiu     $s6, $s2, 0x18
/* 5DE80 8006D680 6C01228E */  lw         $v0, 0x16C($s1)
/* 5DE84 8006D684 00000000 */  nop
/* 5DE88 8006D688 0400438C */  lw         $v1, 0x4($v0)
/* 5DE8C 8006D68C 08000224 */  addiu      $v0, $zero, 0x8
/* 5DE90 8006D690 0D006214 */  bne        $v1, $v0, .L8006D6C8
/* 5DE94 8006D694 00000000 */   nop
/* 5DE98 8006D698 3800248E */  lw         $a0, 0x38($s1)
/* 5DE9C 8006D69C 1C66010C */  jal        STREAM_GetLevelWithID
/* 5DEA0 8006D6A0 00000000 */   nop
/* 5DEA4 8006D6A4 21184000 */  addu       $v1, $v0, $zero
/* 5DEA8 8006D6A8 07006010 */  beqz       $v1, .L8006D6C8
/* 5DEAC 8006D6AC 00000000 */   nop
/* 5DEB0 8006D6B0 60002286 */  lh         $v0, 0x60($s1)
/* 5DEB4 8006D6B4 3800638C */  lw         $v1, 0x38($v1)
/* 5DEB8 8006D6B8 00000000 */  nop
/* 5DEBC 8006D6BC 2A104300 */  slt        $v0, $v0, $v1
/* 5DEC0 8006D6C0 C1014014 */  bnez       $v0, .L8006DDC8
/* 5DEC4 8006D6C4 00000000 */   nop
.L8006D6C8:
/* 5DEC8 8006D6C8 07004392 */  lbu        $v1, 0x7($s2)
/* 5DECC 8006D6CC 03000224 */  addiu      $v0, $zero, 0x3
/* 5DED0 8006D6D0 04006210 */  beq        $v1, $v0, .L8006D6E4
/* 5DED4 8006D6D4 00000000 */   nop
/* 5DED8 8006D6D8 1400558E */  lw         $s5, 0x14($s2)
/* 5DEDC 8006D6DC CEB50108 */  j          .L8006D738
/* 5DEE0 8006D6E0 00000000 */   nop
.L8006D6E4:
/* 5DEE4 8006D6E4 3800248E */  lw         $a0, 0x38($s1)
/* 5DEE8 8006D6E8 1400508E */  lw         $s0, 0x14($s2)
/* 5DEEC 8006D6EC 1C66010C */  jal        STREAM_GetLevelWithID
/* 5DEF0 8006D6F0 00000000 */   nop
/* 5DEF4 8006D6F4 12000396 */  lhu        $v1, 0x12($s0)
/* 5DEF8 8006D6F8 0C00548E */  lw         $s4, 0xC($s2)
/* 5DEFC 8006D6FC 01006330 */  andi       $v1, $v1, 0x1
/* 5DF00 8006D700 06006014 */  bnez       $v1, .L8006D71C
/* 5DF04 8006D704 21204000 */   addu      $a0, $v0, $zero
/* 5DF08 8006D708 06008292 */  lbu        $v0, 0x6($s4)
/* 5DF0C 8006D70C 00000000 */  nop
/* 5DF10 8006D710 04004230 */  andi       $v0, $v0, 0x4
/* 5DF14 8006D714 03004010 */  beqz       $v0, .L8006D724
/* 5DF18 8006D718 3800A627 */   addiu     $a2, $sp, 0x38
.L8006D71C:
/* 5DF1C 8006D71C 21B80000 */  addu       $s7, $zero, $zero
/* 5DF20 8006D720 3800A627 */  addiu      $a2, $sp, 0x38
.L8006D724:
/* 5DF24 8006D724 0000828C */  lw         $v0, 0x0($a0)
/* 5DF28 8006D728 08008486 */  lh         $a0, 0x8($s4)
/* 5DF2C 8006D72C 2400458C */  lw         $a1, 0x24($v0)
/* 5DF30 8006D730 C27A000C */  jal        COLLIDE_GetNormal
/* 5DF34 8006D734 21B0C000 */   addu      $s6, $a2, $zero
.L8006D738:
/* 5DF38 8006D738 0000628E */  lw         $v0, 0x0($s3)
/* 5DF3C 8006D73C 00000000 */  nop
/* 5DF40 8006D740 10004230 */  andi       $v0, $v0, 0x10
/* 5DF44 8006D744 05004010 */  beqz       $v0, .L8006D75C
/* 5DF48 8006D748 00000000 */   nop
/* 5DF4C 8006D74C 4000628E */  lw         $v0, 0x40($s3)
/* 5DF50 8006D750 00000000 */  nop
/* 5DF54 8006D754 9C01A212 */  beq        $s5, $v0, .L8006DDC8
/* 5DF58 8006D758 00000000 */   nop
.L8006D75C:
/* 5DF5C 8006D75C 0DB8010C */  jal        GetPhysObCollisionType
/* 5DF60 8006D760 21202002 */   addu      $a0, $s1, $zero
/* 5DF64 8006D764 0000668E */  lw         $a2, 0x0($s3)
/* 5DF68 8006D768 00000000 */  nop
/* 5DF6C 8006D76C 0040C230 */  andi       $v0, $a2, 0x4000
/* 5DF70 8006D770 47004010 */  beqz       $v0, .L8006D890
/* 5DF74 8006D774 00000000 */   nop
/* 5DF78 8006D778 0800628E */  lw         $v0, 0x8($s3)
/* 5DF7C 8006D77C 00000000 */  nop
/* 5DF80 8006D780 91015510 */  beq        $v0, $s5, .L8006DDC8
/* 5DF84 8006D784 00000000 */   nop
/* 5DF88 8006D788 0E00A012 */  beqz       $s5, .L8006D7C4
/* 5DF8C 8006D78C FFFF033C */   lui       $v1, (0xFFFF0000 >> 16)
/* 5DF90 8006D790 0400428E */  lw         $v0, 0x4($s2)
/* 5DF94 8006D794 00000000 */  nop
/* 5DF98 8006D798 24104300 */  and        $v0, $v0, $v1
/* 5DF9C 8006D79C 0101033C */  lui        $v1, (0x1010000 >> 16)
/* 5DFA0 8006D7A0 89014310 */  beq        $v0, $v1, .L8006DDC8
/* 5DFA4 8006D7A4 0400033C */   lui       $v1, (0x40000 >> 16)
/* 5DFA8 8006D7A8 1C00A28E */  lw         $v0, 0x1C($s5)
/* 5DFAC 8006D7AC 00000000 */  nop
/* 5DFB0 8006D7B0 2C00428C */  lw         $v0, 0x2C($v0)
/* 5DFB4 8006D7B4 00000000 */  nop
/* 5DFB8 8006D7B8 24104300 */  and        $v0, $v0, $v1
/* 5DFBC 8006D7BC 82014014 */  bnez       $v0, .L8006DDC8
/* 5DFC0 8006D7C0 00000000 */   nop
.L8006D7C4:
/* 5DFC4 8006D7C4 11008012 */  beqz       $s4, .L8006D80C
/* 5DFC8 8006D7C8 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* 5DFCC 8006D7CC 0A008396 */  lhu        $v1, 0xA($s4)
/* 5DFD0 8006D7D0 00000000 */  nop
/* 5DFD4 8006D7D4 7C016210 */  beq        $v1, $v0, .L8006DDC8
/* 5DFD8 8006D7D8 00000000 */   nop
/* 5DFDC 8006D7DC 0000428E */  lw         $v0, 0x0($s2)
/* 5DFE0 8006D7E0 00000000 */  nop
/* 5DFE4 8006D7E4 0000428C */  lw         $v0, 0x0($v0)
/* 5DFE8 8006D7E8 00000000 */  nop
/* 5DFEC 8006D7EC 3400428C */  lw         $v0, 0x34($v0)
/* 5DFF0 8006D7F0 00000000 */  nop
/* 5DFF4 8006D7F4 21104300 */  addu       $v0, $v0, $v1
/* 5DFF8 8006D7F8 0A004294 */  lhu        $v0, 0xA($v0)
/* 5DFFC 8006D7FC 00000000 */  nop
/* 5E000 8006D800 00104230 */  andi       $v0, $v0, 0x1000
/* 5E004 8006D804 70014010 */  beqz       $v0, .L8006DDC8
/* 5E008 8006D808 00000000 */   nop
.L8006D80C:
/* 5E00C 8006D80C 0900033C */  lui        $v1, (0x96000 >> 16)
/* 5E010 8006D810 00606334 */  ori        $v1, $v1, (0x96000 & 0xFFFF)
/* 5E014 8006D814 21202002 */  addu       $a0, $s1, $zero
/* 5E018 8006D818 4000A527 */  addiu      $a1, $sp, 0x40
/* 5E01C 8006D81C FFBF0224 */  addiu      $v0, $zero, -0x4001
/* 5E020 8006D820 2410C200 */  and        $v0, $a2, $v0
/* 5E024 8006D824 10004234 */  ori        $v0, $v0, 0x10
/* 5E028 8006D828 000062AE */  sw         $v0, 0x0($s3)
/* 5E02C 8006D82C 64002226 */  addiu      $v0, $s1, 0x64
/* 5E030 8006D830 5C002726 */  addiu      $a3, $s1, 0x5C
/* 5E034 8006D834 440063AE */  sw         $v1, 0x44($s3)
/* 5E038 8006D838 64002896 */  lhu        $t0, 0x64($s1)
/* 5E03C 8006D83C 02004994 */  lhu        $t1, 0x2($v0)
/* 5E040 8006D840 04004A94 */  lhu        $t2, 0x4($v0)
/* 5E044 8006D844 5C002296 */  lhu        $v0, 0x5C($s1)
/* 5E048 8006D848 0200E394 */  lhu        $v1, 0x2($a3)
/* 5E04C 8006D84C 0400E694 */  lhu        $a2, 0x4($a3)
/* 5E050 8006D850 23400201 */  subu       $t0, $t0, $v0
/* 5E054 8006D854 23482301 */  subu       $t1, $t1, $v1
/* 5E058 8006D858 23504601 */  subu       $t2, $t2, $a2
/* 5E05C 8006D85C 4000A8A7 */  sh         $t0, 0x40($sp)
/* 5E060 8006D860 0200A9A4 */  sh         $t1, 0x2($a1)
/* 5E064 8006D864 0400AAA4 */  sh         $t2, 0x4($a1)
/* 5E068 8006D868 5C002296 */  lhu        $v0, 0x5C($s1)
/* 5E06C 8006D86C 0200E394 */  lhu        $v1, 0x2($a3)
/* 5E070 8006D870 0400E694 */  lhu        $a2, 0x4($a3)
/* 5E074 8006D874 21104800 */  addu       $v0, $v0, $t0
/* 5E078 8006D878 21186900 */  addu       $v1, $v1, $t1
/* 5E07C 8006D87C 2130CA00 */  addu       $a2, $a2, $t2
/* 5E080 8006D880 5C0022A6 */  sh         $v0, 0x5C($s1)
/* 5E084 8006D884 0200E3A4 */  sh         $v1, 0x2($a3)
/* 5E088 8006D888 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 5E08C 8006D88C 0400E6A4 */   sh        $a2, 0x4($a3)
.L8006D890:
/* 5E090 8006D890 0000648E */  lw         $a0, 0x0($s3)
/* 5E094 8006D894 00000000 */  nop
/* 5E098 8006D898 10008230 */  andi       $v0, $a0, 0x10
/* 5E09C 8006D89C DC004010 */  beqz       $v0, .L8006DC10
/* 5E0A0 8006D8A0 00000000 */   nop
/* 5E0A4 8006D8A4 1300C013 */  beqz       $fp, .L8006D8F4
/* 5E0A8 8006D8A8 00000000 */   nop
/* 5E0AC 8006D8AC 11008012 */  beqz       $s4, .L8006D8F4
/* 5E0B0 8006D8B0 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* 5E0B4 8006D8B4 0A008396 */  lhu        $v1, 0xA($s4)
/* 5E0B8 8006D8B8 00000000 */  nop
/* 5E0BC 8006D8BC 0D006210 */  beq        $v1, $v0, .L8006D8F4
/* 5E0C0 8006D8C0 00000000 */   nop
/* 5E0C4 8006D8C4 0000428E */  lw         $v0, 0x0($s2)
/* 5E0C8 8006D8C8 00000000 */  nop
/* 5E0CC 8006D8CC 0000428C */  lw         $v0, 0x0($v0)
/* 5E0D0 8006D8D0 00000000 */  nop
/* 5E0D4 8006D8D4 3400428C */  lw         $v0, 0x34($v0)
/* 5E0D8 8006D8D8 00000000 */  nop
/* 5E0DC 8006D8DC 21104300 */  addu       $v0, $v0, $v1
/* 5E0E0 8006D8E0 0A004294 */  lhu        $v0, 0xA($v0)
/* 5E0E4 8006D8E4 00000000 */  nop
/* 5E0E8 8006D8E8 00104230 */  andi       $v0, $v0, 0x1000
/* 5E0EC 8006D8EC 36014014 */  bnez       $v0, .L8006DDC8
/* 5E0F0 8006D8F0 00000000 */   nop
.L8006D8F4:
/* 5E0F4 8006D8F4 74012296 */  lhu        $v0, 0x174($s1)
/* 5E0F8 8006D8F8 00000000 */  nop
/* 5E0FC 8006D8FC 2800A2A7 */  sh         $v0, 0x28($sp)
/* 5E100 8006D900 78012296 */  lhu        $v0, 0x178($s1)
/* 5E104 8006D904 21202002 */  addu       $a0, $s1, $zero
/* 5E108 8006D908 2A00A2A7 */  sh         $v0, 0x2A($sp)
/* 5E10C 8006D90C 7C012296 */  lhu        $v0, 0x17C($s1)
/* 5E110 8006D910 3000A527 */  addiu      $a1, $sp, 0x30
/* 5E114 8006D914 52B5010C */  jal        GetObliqueDirection
/* 5E118 8006D918 2C00A2A7 */   sh        $v0, 0x2C($sp)
/* 5E11C 8006D91C 8000A2AF */  sw         $v0, 0x80($sp)
/* 5E120 8006D920 0000628E */  lw         $v0, 0x0($s3)
/* 5E124 8006D924 4000033C */  lui        $v1, (0x400000 >> 16)
/* 5E128 8006D928 24104300 */  and        $v0, $v0, $v1
/* 5E12C 8006D92C 07004014 */  bnez       $v0, .L8006D94C
/* 5E130 8006D930 00000000 */   nop
/* 5E134 8006D934 740120AE */  sw         $zero, 0x174($s1)
/* 5E138 8006D938 780120AE */  sw         $zero, 0x178($s1)
/* 5E13C 8006D93C 7C0120AE */  sw         $zero, 0x17C($s1)
/* 5E140 8006D940 800120AE */  sw         $zero, 0x180($s1)
/* 5E144 8006D944 840120AE */  sw         $zero, 0x184($s1)
/* 5E148 8006D948 880120AE */  sw         $zero, 0x188($s1)
.L8006D94C:
/* 5E14C 8006D94C 5C002296 */  lhu        $v0, 0x5C($s1)
/* 5E150 8006D950 28004396 */  lhu        $v1, 0x28($s2)
/* 5E154 8006D954 00000000 */  nop
/* 5E158 8006D958 21104300 */  addu       $v0, $v0, $v1
/* 5E15C 8006D95C 5C0022A6 */  sh         $v0, 0x5C($s1)
/* 5E160 8006D960 5E002296 */  lhu        $v0, 0x5E($s1)
/* 5E164 8006D964 2A004396 */  lhu        $v1, 0x2A($s2)
/* 5E168 8006D968 21202002 */  addu       $a0, $s1, $zero
/* 5E16C 8006D96C 21104300 */  addu       $v0, $v0, $v1
/* 5E170 8006D970 5E0022A6 */  sh         $v0, 0x5E($s1)
/* 5E174 8006D974 60002296 */  lhu        $v0, 0x60($s1)
/* 5E178 8006D978 2C004396 */  lhu        $v1, 0x2C($s2)
/* 5E17C 8006D97C 28004526 */  addiu      $a1, $s2, 0x28
/* 5E180 8006D980 21104300 */  addu       $v0, $v0, $v1
/* 5E184 8006D984 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 5E188 8006D988 600022A6 */   sh        $v0, 0x60($s1)
/* 5E18C 8006D98C 2800A487 */  lh         $a0, 0x28($sp)
/* 5E190 8006D990 00000000 */  nop
/* 5E194 8006D994 07008014 */  bnez       $a0, .L8006D9B4
/* 5E198 8006D998 00000000 */   nop
/* 5E19C 8006D99C 2A00A297 */  lhu        $v0, 0x2A($sp)
/* 5E1A0 8006D9A0 2C00A397 */  lhu        $v1, 0x2C($sp)
/* 5E1A4 8006D9A4 00000000 */  nop
/* 5E1A8 8006D9A8 25104300 */  or         $v0, $v0, $v1
/* 5E1AC 8006D9AC 0E004010 */  beqz       $v0, .L8006D9E8
/* 5E1B0 8006D9B0 21800000 */   addu      $s0, $zero, $zero
.L8006D9B4:
/* 5E1B4 8006D9B4 2A00A587 */  lh         $a1, 0x2A($sp)
/* 5E1B8 8006D9B8 2C00A687 */  lh         $a2, 0x2C($sp)
/* 5E1BC 8006D9BC B7E6000C */  jal        MATH3D_LengthXYZ
/* 5E1C0 8006D9C0 00000000 */   nop
/* 5E1C4 8006D9C4 00140200 */  sll        $v0, $v0, 16
/* 5E1C8 8006D9C8 03140200 */  sra        $v0, $v0, 16
/* 5E1CC 8006D9CC 65004228 */  slti       $v0, $v0, 0x65
/* 5E1D0 8006D9D0 05004014 */  bnez       $v0, .L8006D9E8
/* 5E1D4 8006D9D4 21800000 */   addu      $s0, $zero, $zero
/* 5E1D8 8006D9D8 1800228E */  lw         $v0, 0x18($s1)
/* 5E1DC 8006D9DC 00000000 */  nop
/* 5E1E0 8006D9E0 00204234 */  ori        $v0, $v0, 0x2000
/* 5E1E4 8006D9E4 180022AE */  sw         $v0, 0x18($s1)
.L8006D9E8:
/* 5E1E8 8006D9E8 21202002 */  addu       $a0, $s1, $zero
/* 5E1EC 8006D9EC B0A3010C */  jal        CheckPhysObAbility
/* 5E1F0 8006D9F0 00020524 */   addiu     $a1, $zero, 0x200
/* 5E1F4 8006D9F4 22004010 */  beqz       $v0, .L8006DA80
/* 5E1F8 8006D9F8 00000000 */   nop
/* 5E1FC 8006D9FC 2800A287 */  lh         $v0, 0x28($sp)
/* 5E200 8006DA00 2800A697 */  lhu        $a2, 0x28($sp)
/* 5E204 8006DA04 07004014 */  bnez       $v0, .L8006DA24
/* 5E208 8006DA08 21202002 */   addu      $a0, $s1, $zero
/* 5E20C 8006DA0C 2A00A297 */  lhu        $v0, 0x2A($sp)
/* 5E210 8006DA10 2C00A397 */  lhu        $v1, 0x2C($sp)
/* 5E214 8006DA14 00000000 */  nop
/* 5E218 8006DA18 25104300 */  or         $v0, $v0, $v1
/* 5E21C 8006DA1C 18004010 */  beqz       $v0, .L8006DA80
/* 5E220 8006DA20 00000000 */   nop
.L8006DA24:
/* 5E224 8006DA24 4800A527 */  addiu      $a1, $sp, 0x48
/* 5E228 8006DA28 5C002296 */  lhu        $v0, 0x5C($s1)
/* 5E22C 8006DA2C 80180600 */  sll        $v1, $a2, 2
/* 5E230 8006DA30 21104300 */  addu       $v0, $v0, $v1
/* 5E234 8006DA34 7800A2A7 */  sh         $v0, 0x78($sp)
/* 5E238 8006DA38 2A00A297 */  lhu        $v0, 0x2A($sp)
/* 5E23C 8006DA3C 5E002396 */  lhu        $v1, 0x5E($s1)
/* 5E240 8006DA40 80100200 */  sll        $v0, $v0, 2
/* 5E244 8006DA44 21186200 */  addu       $v1, $v1, $v0
/* 5E248 8006DA48 7A00A3A7 */  sh         $v1, 0x7A($sp)
/* 5E24C 8006DA4C 60002696 */  lhu        $a2, 0x60($s1)
/* 5E250 8006DA50 5C002226 */  addiu      $v0, $s1, 0x5C
/* 5E254 8006DA54 6000A2AF */  sw         $v0, 0x60($sp)
/* 5E258 8006DA58 2C00A297 */  lhu        $v0, 0x2C($sp)
/* 5E25C 8006DA5C 7800A327 */  addiu      $v1, $sp, 0x78
/* 5E260 8006DA60 5C00A3AF */  sw         $v1, 0x5C($sp)
/* 5E264 8006DA64 80100200 */  sll        $v0, $v0, 2
/* 5E268 8006DA68 2130C200 */  addu       $a2, $a2, $v0
/* 5E26C 8006DA6C 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 5E270 8006DA70 7C00A6A7 */   sh        $a2, 0x7C($sp)
/* 5E274 8006DA74 4800A287 */  lh         $v0, 0x48($sp)
/* 5E278 8006DA78 00000000 */  nop
/* 5E27C 8006DA7C 2B800200 */  sltu       $s0, $zero, $v0
.L8006DA80:
/* 5E280 8006DA80 19000012 */  beqz       $s0, .L8006DAE8
/* 5E284 8006DA84 00000000 */   nop
/* 5E288 8006DA88 1700E012 */  beqz       $s7, .L8006DAE8
/* 5E28C 8006DA8C 00000000 */   nop
/* 5E290 8006DA90 1500A016 */  bnez       $s5, .L8006DAE8
/* 5E294 8006DA94 00000000 */   nop
/* 5E298 8006DA98 0400C286 */  lh         $v0, 0x4($s6)
/* 5E29C 8006DA9C 00000000 */  nop
/* 5E2A0 8006DAA0 500B4228 */  slti       $v0, $v0, 0xB50
/* 5E2A4 8006DAA4 10004010 */  beqz       $v0, .L8006DAE8
/* 5E2A8 8006DAA8 21202002 */   addu      $a0, $s1, $zero
/* 5E2AC 8006DAAC 0000628E */  lw         $v0, 0x0($s3)
/* 5E2B0 8006DAB0 04000524 */  addiu      $a1, $zero, 0x4
/* 5E2B4 8006DAB4 00104234 */  ori        $v0, $v0, 0x1000
/* 5E2B8 8006DAB8 000062AE */  sw         $v0, 0x0($s3)
/* 5E2BC 8006DABC 1800228E */  lw         $v0, 0x18($s1)
/* 5E2C0 8006DAC0 7FFF0324 */  addiu      $v1, $zero, -0x81
/* 5E2C4 8006DAC4 24104300 */  and        $v0, $v0, $v1
/* 5E2C8 8006DAC8 180022AE */  sw         $v0, 0x18($s1)
/* 5E2CC 8006DACC 0000628E */  lw         $v0, 0x0($s3)
/* 5E2D0 8006DAD0 EFFF0324 */  addiu      $v1, $zero, -0x11
/* 5E2D4 8006DAD4 24104300 */  and        $v0, $v0, $v1
/* 5E2D8 8006DAD8 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 5E2DC 8006DADC 000062AE */   sw        $v0, 0x0($s3)
/* 5E2E0 8006DAE0 4AB70108 */  j          .L8006DD28
/* 5E2E4 8006DAE4 21202002 */   addu      $a0, $s1, $zero
.L8006DAE8:
/* 5E2E8 8006DAE8 0000628E */  lw         $v0, 0x0($s3)
/* 5E2EC 8006DAEC FFEF0324 */  addiu      $v1, $zero, -0x1001
/* 5E2F0 8006DAF0 24104300 */  and        $v0, $v0, $v1
/* 5E2F4 8006DAF4 4000033C */  lui        $v1, (0x400000 >> 16)
/* 5E2F8 8006DAF8 25104300 */  or         $v0, $v0, $v1
/* 5E2FC 8006DAFC 000062AE */  sw         $v0, 0x0($s3)
/* 5E300 8006DB00 2800A287 */  lh         $v0, 0x28($sp)
/* 5E304 8006DB04 00000000 */  nop
/* 5E308 8006DB08 05004014 */  bnez       $v0, .L8006DB20
/* 5E30C 8006DB0C 00000000 */   nop
/* 5E310 8006DB10 2A00A287 */  lh         $v0, 0x2A($sp)
/* 5E314 8006DB14 00000000 */  nop
/* 5E318 8006DB18 1F004010 */  beqz       $v0, .L8006DB98
/* 5E31C 8006DB1C 00000000 */   nop
.L8006DB20:
/* 5E320 8006DB20 1D00C017 */  bnez       $fp, .L8006DB98
/* 5E324 8006DB24 4000B027 */   addiu     $s0, $sp, 0x40
/* 5E328 8006DB28 21200002 */  addu       $a0, $s0, $zero
/* 5E32C 8006DB2C 21280000 */  addu       $a1, $zero, $zero
/* 5E330 8006DB30 2EF2020C */  jal        func_800BC8B8
/* 5E334 8006DB34 06000624 */   addiu     $a2, $zero, 0x6
/* 5E338 8006DB38 21202002 */  addu       $a0, $s1, $zero
/* 5E33C 8006DB3C 21280002 */  addu       $a1, $s0, $zero
/* 5E340 8006DB40 5C002726 */  addiu      $a3, $s1, 0x5C
/* 5E344 8006DB44 2800A897 */  lhu        $t0, 0x28($sp)
/* 5E348 8006DB48 2A00A297 */  lhu        $v0, 0x2A($sp)
/* 5E34C 8006DB4C 2C00A397 */  lhu        $v1, 0x2C($sp)
/* 5E350 8006DB50 23400800 */  negu       $t0, $t0
/* 5E354 8006DB54 23100200 */  negu       $v0, $v0
/* 5E358 8006DB58 23180300 */  negu       $v1, $v1
/* 5E35C 8006DB5C 4000A8A7 */  sh         $t0, 0x40($sp)
/* 5E360 8006DB60 4200A2A7 */  sh         $v0, 0x42($sp)
/* 5E364 8006DB64 4400A3A7 */  sh         $v1, 0x44($sp)
/* 5E368 8006DB68 5C002296 */  lhu        $v0, 0x5C($s1)
/* 5E36C 8006DB6C 0200E394 */  lhu        $v1, 0x2($a3)
/* 5E370 8006DB70 0400E694 */  lhu        $a2, 0x4($a3)
/* 5E374 8006DB74 0200A994 */  lhu        $t1, 0x2($a1)
/* 5E378 8006DB78 0400AA94 */  lhu        $t2, 0x4($a1)
/* 5E37C 8006DB7C 21104800 */  addu       $v0, $v0, $t0
/* 5E380 8006DB80 21186900 */  addu       $v1, $v1, $t1
/* 5E384 8006DB84 2130CA00 */  addu       $a2, $a2, $t2
/* 5E388 8006DB88 5C0022A6 */  sh         $v0, 0x5C($s1)
/* 5E38C 8006DB8C 0200E3A4 */  sh         $v1, 0x2($a3)
/* 5E390 8006DB90 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 5E394 8006DB94 0400E6A4 */   sh        $a2, 0x4($a3)
.L8006DB98:
/* 5E398 8006DB98 2C00A287 */  lh         $v0, 0x2C($sp)
/* 5E39C 8006DB9C 00000000 */  nop
/* 5E3A0 8006DBA0 17004104 */  bgez       $v0, .L8006DC00
/* 5E3A4 8006DBA4 21202002 */   addu      $a0, $s1, $zero
/* 5E3A8 8006DBA8 28004486 */  lh         $a0, 0x28($s2)
/* 5E3AC 8006DBAC 2A004586 */  lh         $a1, 0x2A($s2)
/* 5E3B0 8006DBB0 2C004686 */  lh         $a2, 0x2C($s2)
/* 5E3B4 8006DBB4 B7E6000C */  jal        MATH3D_LengthXYZ
/* 5E3B8 8006DBB8 00000000 */   nop
/* 5E3BC 8006DBBC 00140200 */  sll        $v0, $v0, 16
/* 5E3C0 8006DBC0 03140200 */  sra        $v0, $v0, 16
/* 5E3C4 8006DBC4 40200200 */  sll        $a0, $v0, 1
/* 5E3C8 8006DBC8 21208200 */  addu       $a0, $a0, $v0
/* 5E3CC 8006DBCC 00190400 */  sll        $v1, $a0, 4
/* 5E3D0 8006DBD0 23186400 */  subu       $v1, $v1, $a0
/* 5E3D4 8006DBD4 80180300 */  sll        $v1, $v1, 2
/* 5E3D8 8006DBD8 21186200 */  addu       $v1, $v1, $v0
/* 5E3DC 8006DBDC 001A0300 */  sll        $v1, $v1, 8
/* 5E3E0 8006DBE0 2C004286 */  lh         $v0, 0x2C($s2)
/* 5E3E4 8006DBE4 031C0300 */  sra        $v1, $v1, 16
/* 5E3E8 8006DBE8 2A104300 */  slt        $v0, $v0, $v1
/* 5E3EC 8006DBEC 04004010 */  beqz       $v0, .L8006DC00
/* 5E3F0 8006DBF0 21202002 */   addu      $a0, $s1, $zero
/* 5E3F4 8006DBF4 2C00A287 */  lh         $v0, 0x2C($sp)
/* 5E3F8 8006DBF8 00000000 */  nop
/* 5E3FC 8006DBFC 7C0122AE */  sw         $v0, 0x17C($s1)
.L8006DC00:
/* 5E400 8006DC00 8EC1010C */  jal        DropPhysOb
/* 5E404 8006DC04 21280000 */   addu      $a1, $zero, $zero
/* 5E408 8006DC08 4AB70108 */  j          .L8006DD28
/* 5E40C 8006DC0C 21202002 */   addu      $a0, $s1, $zero
.L8006DC10:
/* 5E410 8006DC10 2000023C */  lui        $v0, (0x200004 >> 16)
/* 5E414 8006DC14 04004234 */  ori        $v0, $v0, (0x200004 & 0xFFFF)
/* 5E418 8006DC18 24108200 */  and        $v0, $a0, $v0
/* 5E41C 8006DC1C 24004010 */  beqz       $v0, .L8006DCB0
/* 5E420 8006DC20 01000224 */   addiu     $v0, $zero, 0x1
/* 5E424 8006DC24 07004392 */  lbu        $v1, 0x7($s2)
/* 5E428 8006DC28 00000000 */  nop
/* 5E42C 8006DC2C 05006214 */  bne        $v1, $v0, .L8006DC44
/* 5E430 8006DC30 00000000 */   nop
/* 5E434 8006DC34 4000628E */  lw         $v0, 0x40($s3)
/* 5E438 8006DC38 00000000 */  nop
/* 5E43C 8006DC3C 62005510 */  beq        $v0, $s5, .L8006DDC8
/* 5E440 8006DC40 00000000 */   nop
.L8006DC44:
/* 5E444 8006DC44 0400C286 */  lh         $v0, 0x4($s6)
/* 5E448 8006DC48 00000000 */  nop
/* 5E44C 8006DC4C 500B4228 */  slti       $v0, $v0, 0xB50
/* 5E450 8006DC50 5D004014 */  bnez       $v0, .L8006DDC8
/* 5E454 8006DC54 2000023C */   lui       $v0, (0x200000 >> 16)
/* 5E458 8006DC58 24108200 */  and        $v0, $a0, $v0
/* 5E45C 8006DC5C 02004010 */  beqz       $v0, .L8006DC68
/* 5E460 8006DC60 00000000 */   nop
/* 5E464 8006DC64 2C0040A6 */  sh         $zero, 0x2C($s2)
.L8006DC68:
/* 5E468 8006DC68 5C002296 */  lhu        $v0, 0x5C($s1)
/* 5E46C 8006DC6C 28004396 */  lhu        $v1, 0x28($s2)
/* 5E470 8006DC70 00000000 */  nop
/* 5E474 8006DC74 21104300 */  addu       $v0, $v0, $v1
/* 5E478 8006DC78 5C0022A6 */  sh         $v0, 0x5C($s1)
/* 5E47C 8006DC7C 5E002296 */  lhu        $v0, 0x5E($s1)
/* 5E480 8006DC80 2A004396 */  lhu        $v1, 0x2A($s2)
/* 5E484 8006DC84 21202002 */  addu       $a0, $s1, $zero
/* 5E488 8006DC88 21104300 */  addu       $v0, $v0, $v1
/* 5E48C 8006DC8C 5E0022A6 */  sh         $v0, 0x5E($s1)
/* 5E490 8006DC90 60002296 */  lhu        $v0, 0x60($s1)
/* 5E494 8006DC94 2C004396 */  lhu        $v1, 0x2C($s2)
/* 5E498 8006DC98 28004526 */  addiu      $a1, $s2, 0x28
/* 5E49C 8006DC9C 21104300 */  addu       $v0, $v0, $v1
/* 5E4A0 8006DCA0 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 5E4A4 8006DCA4 600022A6 */   sh        $v0, 0x60($s1)
/* 5E4A8 8006DCA8 4AB70108 */  j          .L8006DD28
/* 5E4AC 8006DCAC 21202002 */   addu      $a0, $s1, $zero
.L8006DCB0:
/* 5E4B0 8006DCB0 80008230 */  andi       $v0, $a0, 0x80
/* 5E4B4 8006DCB4 1C004010 */  beqz       $v0, .L8006DD28
/* 5E4B8 8006DCB8 21202002 */   addu      $a0, $s1, $zero
/* 5E4BC 8006DCBC 4801228E */  lw         $v0, 0x148($s1)
/* 5E4C0 8006DCC0 00000000 */  nop
/* 5E4C4 8006DCC4 18004010 */  beqz       $v0, .L8006DD28
/* 5E4C8 8006DCC8 4000A327 */   addiu     $v1, $sp, 0x40
/* 5E4CC 8006DCCC 21104002 */  addu       $v0, $s2, $zero
/* 5E4D0 8006DCD0 30004426 */  addiu      $a0, $s2, 0x30
.L8006DCD4:
/* 5E4D4 8006DCD4 00004B8C */  lw         $t3, 0x0($v0)
/* 5E4D8 8006DCD8 04004C8C */  lw         $t4, 0x4($v0)
/* 5E4DC 8006DCDC 08004D8C */  lw         $t5, 0x8($v0)
/* 5E4E0 8006DCE0 0C004E8C */  lw         $t6, 0xC($v0)
/* 5E4E4 8006DCE4 00006BAC */  sw         $t3, 0x0($v1)
/* 5E4E8 8006DCE8 04006CAC */  sw         $t4, 0x4($v1)
/* 5E4EC 8006DCEC 08006DAC */  sw         $t5, 0x8($v1)
/* 5E4F0 8006DCF0 0C006EAC */  sw         $t6, 0xC($v1)
/* 5E4F4 8006DCF4 10004224 */  addiu      $v0, $v0, 0x10
/* 5E4F8 8006DCF8 F6FF4414 */  bne        $v0, $a0, .L8006DCD4
/* 5E4FC 8006DCFC 10006324 */   addiu     $v1, $v1, 0x10
/* 5E500 8006DD00 4801228E */  lw         $v0, 0x148($s1)
/* 5E504 8006DD04 4000A427 */  addiu      $a0, $sp, 0x40
/* 5E508 8006DD08 7EC3010C */  jal        SetCollideInfoData
/* 5E50C 8006DD0C 5000A2AF */   sw        $v0, 0x50($sp)
/* 5E510 8006DD10 2000053C */  lui        $a1, (0x200004 >> 16)
/* 5E514 8006DD14 0400A534 */  ori        $a1, $a1, (0x200004 & 0xFFFF)
/* 5E518 8006DD18 4801248E */  lw         $a0, 0x148($s1)
/* 5E51C 8006DD1C A1D1000C */  jal        INSTANCE_Post
/* 5E520 8006DD20 21304000 */   addu      $a2, $v0, $zero
/* 5E524 8006DD24 21202002 */  addu       $a0, $s1, $zero
.L8006DD28:
/* 5E528 8006DD28 B0A3010C */  jal        CheckPhysObAbility
/* 5E52C 8006DD2C 00100524 */   addiu     $a1, $zero, 0x1000
/* 5E530 8006DD30 1C004010 */  beqz       $v0, .L8006DDA4
/* 5E534 8006DD34 8000033C */   lui       $v1, (0x800000 >> 16)
/* 5E538 8006DD38 0000628E */  lw         $v0, 0x0($s3)
/* 5E53C 8006DD3C 00000000 */  nop
/* 5E540 8006DD40 24104300 */  and        $v0, $v0, $v1
/* 5E544 8006DD44 18004014 */  bnez       $v0, .L8006DDA8
/* 5E548 8006DD48 21202002 */   addu      $a0, $s1, $zero
/* 5E54C 8006DD4C D0BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 5E550 8006DD50 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 5E554 8006DD54 15006214 */  bne        $v1, $v0, .L8006DDAC
/* 5E558 8006DD58 2128A002 */   addu      $a1, $s5, $zero
/* 5E55C 8006DD5C B5B7010C */  jal        PhysObGetSplinter
/* 5E560 8006DD60 21202002 */   addu      $a0, $s1, $zero
/* 5E564 8006DD64 02004010 */  beqz       $v0, .L8006DD70
/* 5E568 8006DD68 21180000 */   addu      $v1, $zero, $zero
/* 5E56C 8006DD6C 0400438C */  lw         $v1, 0x4($v0)
.L8006DD70:
/* 5E570 8006DD70 21202002 */  addu       $a0, $s1, $zero
/* 5E574 8006DD74 21280000 */  addu       $a1, $zero, $zero
/* 5E578 8006DD78 2130A000 */  addu       $a2, $a1, $zero
/* 5E57C 8006DD7C 44BA828F */  lw         $v0, %gp_rel(gFXT)($gp)
/* 5E580 8006DD80 2138A000 */  addu       $a3, $a1, $zero
/* 5E584 8006DD84 1000A3AF */  sw         $v1, 0x10($sp)
/* 5E588 8006DD88 1800A0AF */  sw         $zero, 0x18($sp)
/* 5E58C 8006DD8C 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 5E590 8006DD90 2000A0AF */  sw         $zero, 0x20($sp)
/* 5E594 8006DD94 9211010C */  jal        _FX_BuildSplinters
/* 5E598 8006DD98 1400A2AF */   sw        $v0, 0x14($sp)
/* 5E59C 8006DD9C 39D1000C */  jal        INSTANCE_PlainDeath
/* 5E5A0 8006DDA0 21202002 */   addu      $a0, $s1, $zero
.L8006DDA4:
/* 5E5A4 8006DDA4 21202002 */  addu       $a0, $s1, $zero
.L8006DDA8:
/* 5E5A8 8006DDA8 2128A002 */  addu       $a1, $s5, $zero
.L8006DDAC:
/* 5E5AC 8006DDAC 21308002 */  addu       $a2, $s4, $zero
/* 5E5B0 8006DDB0 21384002 */  addu       $a3, $s2, $zero
/* 5E5B4 8006DDB4 8000AB8F */  lw         $t3, 0x80($sp)
/* 5E5B8 8006DDB8 3000A227 */  addiu      $v0, $sp, 0x30
/* 5E5BC 8006DDBC 1000A2AF */  sw         $v0, 0x10($sp)
/* 5E5C0 8006DDC0 B7B4010C */  jal        CheckForceCollision
/* 5E5C4 8006DDC4 1400ABAF */   sw        $t3, 0x14($sp)
.L8006DDC8:
/* 5E5C8 8006DDC8 AC00BF8F */  lw         $ra, 0xAC($sp)
/* 5E5CC 8006DDCC A800BE8F */  lw         $fp, 0xA8($sp)
/* 5E5D0 8006DDD0 A400B78F */  lw         $s7, 0xA4($sp)
/* 5E5D4 8006DDD4 A000B68F */  lw         $s6, 0xA0($sp)
/* 5E5D8 8006DDD8 9C00B58F */  lw         $s5, 0x9C($sp)
/* 5E5DC 8006DDDC 9800B48F */  lw         $s4, 0x98($sp)
/* 5E5E0 8006DDE0 9400B38F */  lw         $s3, 0x94($sp)
/* 5E5E4 8006DDE4 9000B28F */  lw         $s2, 0x90($sp)
/* 5E5E8 8006DDE8 8C00B18F */  lw         $s1, 0x8C($sp)
/* 5E5EC 8006DDEC 8800B08F */  lw         $s0, 0x88($sp)
/* 5E5F0 8006DDF0 0800E003 */  jr         $ra
/* 5E5F4 8006DDF4 B000BD27 */   addiu     $sp, $sp, 0xB0
.size CollidePhysicalObject, . - CollidePhysicalObject
