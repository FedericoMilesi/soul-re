.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB894
/* AC094 800BB894 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* AC098 800BB898 1400B1AF */  sw         $s1, 0x14($sp)
/* AC09C 800BB89C 21888000 */  addu       $s1, $a0, $zero
/* AC0A0 800BB8A0 1800B2AF */  sw         $s2, 0x18($sp)
/* AC0A4 800BB8A4 2190A000 */  addu       $s2, $a1, $zero
/* AC0A8 800BB8A8 2800BFAF */  sw         $ra, 0x28($sp)
/* AC0AC 800BB8AC 2400B5AF */  sw         $s5, 0x24($sp)
/* AC0B0 800BB8B0 2000B4AF */  sw         $s4, 0x20($sp)
/* AC0B4 800BB8B4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AC0B8 800BB8B8 80F1020C */  jal        func_800BC600
/* AC0BC 800BB8BC 1000B0AF */   sw        $s0, 0x10($sp)
/* AC0C0 800BB8C0 04002586 */  lh         $a1, 0x4($s1)
/* AC0C4 800BB8C4 04002396 */  lhu        $v1, 0x4($s1)
/* AC0C8 800BB8C8 0B00A004 */  bltz       $a1, .L800BB8F8
/* AC0CC 800BB8CC 21A80000 */   addu      $s5, $zero, $zero
/* AC0D0 800BB8D0 21206000 */  addu       $a0, $v1, $zero
/* AC0D4 800BB8D4 0D80023C */  lui        $v0, %hi(GEnv + 0x4)
/* AC0D8 800BB8D8 10DA4284 */  lh         $v0, %lo(GEnv + 0x4)($v0)
/* AC0DC 800BB8DC 0D80033C */  lui        $v1, %hi(GEnv + 0x4)
/* AC0E0 800BB8E0 10DA6394 */  lhu        $v1, %lo(GEnv + 0x4)($v1)
/* AC0E4 800BB8E4 2A104500 */  slt        $v0, $v0, $a1
/* AC0E8 800BB8E8 04004010 */  beqz       $v0, .L800BB8FC
/* AC0EC 800BB8EC 00000000 */   nop
/* AC0F0 800BB8F0 3FEE0208 */  j          .L800BB8FC
/* AC0F4 800BB8F4 21206000 */   addu      $a0, $v1, $zero
.L800BB8F8:
/* AC0F8 800BB8F8 21200000 */  addu       $a0, $zero, $zero
.L800BB8FC:
/* AC0FC 800BB8FC 06002586 */  lh         $a1, 0x6($s1)
/* AC100 800BB900 06002396 */  lhu        $v1, 0x6($s1)
/* AC104 800BB904 0B00A004 */  bltz       $a1, .L800BB934
/* AC108 800BB908 040024A6 */   sh        $a0, 0x4($s1)
/* AC10C 800BB90C 21206000 */  addu       $a0, $v1, $zero
/* AC110 800BB910 0D80023C */  lui        $v0, %hi(GEnv + 0x6)
/* AC114 800BB914 12DA4284 */  lh         $v0, %lo(GEnv + 0x6)($v0)
/* AC118 800BB918 0D80033C */  lui        $v1, %hi(GEnv + 0x6)
/* AC11C 800BB91C 12DA6394 */  lhu        $v1, %lo(GEnv + 0x6)($v1)
/* AC120 800BB920 2A104500 */  slt        $v0, $v0, $a1
/* AC124 800BB924 05004010 */  beqz       $v0, .L800BB93C
/* AC128 800BB928 00140400 */   sll       $v0, $a0, 16
/* AC12C 800BB92C 4EEE0208 */  j          .L800BB938
/* AC130 800BB930 21206000 */   addu      $a0, $v1, $zero
.L800BB934:
/* AC134 800BB934 21200000 */  addu       $a0, $zero, $zero
.L800BB938:
/* AC138 800BB938 00140400 */  sll        $v0, $a0, 16
.L800BB93C:
/* AC13C 800BB93C 04002386 */  lh         $v1, 0x4($s1)
/* AC140 800BB940 03140200 */  sra        $v0, $v0, 16
/* AC144 800BB944 18006200 */  mult       $v1, $v0
/* AC148 800BB948 060024A6 */  sh         $a0, 0x6($s1)
/* AC14C 800BB94C 12300000 */  mflo       $a2
/* AC150 800BB950 0100C324 */  addiu      $v1, $a2, 0x1
/* AC154 800BB954 C2170300 */  srl        $v0, $v1, 31
/* AC158 800BB958 21186200 */  addu       $v1, $v1, $v0
/* AC15C 800BB95C 43200300 */  sra        $a0, $v1, 1
/* AC160 800BB960 0300801C */  bgtz       $a0, .L800BB970
/* AC164 800BB964 43810300 */   sra       $s0, $v1, 5
/* AC168 800BB968 ABEE0208 */  j          .L800BBAAC
/* AC16C 800BB96C FFFF0224 */   addiu     $v0, $zero, -0x1
.L800BB970:
/* AC170 800BB970 21180002 */  addu       $v1, $s0, $zero
/* AC174 800BB974 00110300 */  sll        $v0, $v1, 4
/* AC178 800BB978 23808200 */  subu       $s0, $a0, $v0
/* AC17C 800BB97C 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC180 800BB980 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC184 800BB984 21A06000 */  addu       $s4, $v1, $zero
/* AC188 800BB988 0000428C */  lw         $v0, 0x0($v0)
/* AC18C 800BB98C 0004033C */  lui        $v1, (0x4000000 >> 16)
/* AC190 800BB990 24104300 */  and        $v0, $v0, $v1
/* AC194 800BB994 0E004014 */  bnez       $v0, .L800BB9D0
/* AC198 800BB998 00A0043C */   lui       $a0, (0xA0000000 >> 16)
/* AC19C 800BB99C 0004133C */  lui        $s3, (0x4000000 >> 16)
.L800BB9A0:
/* AC1A0 800BB9A0 8DF1020C */  jal        func_800BC634
/* AC1A4 800BB9A4 00000000 */   nop
/* AC1A8 800BB9A8 40004014 */  bnez       $v0, .L800BBAAC
/* AC1AC 800BB9AC FFFF0224 */   addiu     $v0, $zero, -0x1
/* AC1B0 800BB9B0 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC1B4 800BB9B4 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC1B8 800BB9B8 00000000 */  nop
/* AC1BC 800BB9BC 0000428C */  lw         $v0, 0x0($v0)
/* AC1C0 800BB9C0 00000000 */  nop
/* AC1C4 800BB9C4 24105300 */  and        $v0, $v0, $s3
/* AC1C8 800BB9C8 F5FF4010 */  beqz       $v0, .L800BB9A0
/* AC1CC 800BB9CC 00A0043C */   lui       $a0, (0xA0000000 >> 16)
.L800BB9D0:
/* AC1D0 800BB9D0 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* AC1D4 800BB9D4 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* AC1D8 800BB9D8 0004023C */  lui        $v0, (0x4000000 >> 16)
/* AC1DC 800BB9DC 000062AC */  sw         $v0, 0x0($v1)
/* AC1E0 800BB9E0 0D80033C */  lui        $v1, %hi(GEnv + 0x104)
/* AC1E4 800BB9E4 10DB638C */  lw         $v1, %lo(GEnv + 0x104)($v1)
/* AC1E8 800BB9E8 0001023C */  lui        $v0, (0x1000000 >> 16)
/* AC1EC 800BB9EC 000062AC */  sw         $v0, 0x0($v1)
/* AC1F0 800BB9F0 0D80023C */  lui        $v0, %hi(GEnv + 0x104)
/* AC1F4 800BB9F4 10DB428C */  lw         $v0, %lo(GEnv + 0x104)($v0)
/* AC1F8 800BB9F8 0200A012 */  beqz       $s5, .L800BBA04
/* AC1FC 800BB9FC 00000000 */   nop
/* AC200 800BBA00 00B0043C */  lui        $a0, (0xB0000000 >> 16)
.L800BBA04:
/* AC204 800BBA04 000044AC */  sw         $a0, 0x0($v0)
/* AC208 800BBA08 0D80033C */  lui        $v1, %hi(GEnv + 0x104)
/* AC20C 800BBA0C 10DB638C */  lw         $v1, %lo(GEnv + 0x104)($v1)
/* AC210 800BBA10 0000228E */  lw         $v0, 0x0($s1)
/* AC214 800BBA14 00000000 */  nop
/* AC218 800BBA18 000062AC */  sw         $v0, 0x0($v1)
/* AC21C 800BBA1C 0D80033C */  lui        $v1, %hi(GEnv + 0x104)
/* AC220 800BBA20 10DB638C */  lw         $v1, %lo(GEnv + 0x104)($v1)
/* AC224 800BBA24 0400228E */  lw         $v0, 0x4($s1)
/* AC228 800BBA28 FFFF1026 */  addiu      $s0, $s0, -0x1
/* AC22C 800BBA2C 000062AC */  sw         $v0, 0x0($v1)
/* AC230 800BBA30 FFFF0224 */  addiu      $v0, $zero, -0x1
/* AC234 800BBA34 09000212 */  beq        $s0, $v0, .L800BBA5C
/* AC238 800BBA38 00000000 */   nop
/* AC23C 800BBA3C FFFF0424 */  addiu      $a0, $zero, -0x1
.L800BBA40:
/* AC240 800BBA40 0000438E */  lw         $v1, 0x0($s2)
/* AC244 800BBA44 04005226 */  addiu      $s2, $s2, 0x4
/* AC248 800BBA48 0D80023C */  lui        $v0, %hi(GEnv + 0x104)
/* AC24C 800BBA4C 10DB428C */  lw         $v0, %lo(GEnv + 0x104)($v0)
/* AC250 800BBA50 FFFF1026 */  addiu      $s0, $s0, -0x1
/* AC254 800BBA54 FAFF0416 */  bne        $s0, $a0, .L800BBA40
/* AC258 800BBA58 000043AC */   sw        $v1, 0x0($v0)
.L800BBA5C:
/* AC25C 800BBA5C 12008012 */  beqz       $s4, .L800BBAA8
/* AC260 800BBA60 0004033C */   lui       $v1, (0x4000002 >> 16)
/* AC264 800BBA64 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC268 800BBA68 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC26C 800BBA6C 02006334 */  ori        $v1, $v1, (0x4000002 & 0xFFFF)
/* AC270 800BBA70 000043AC */  sw         $v1, 0x0($v0)
/* AC274 800BBA74 0D80023C */  lui        $v0, %hi(GEnv + 0x10C)
/* AC278 800BBA78 18DB428C */  lw         $v0, %lo(GEnv + 0x10C)($v0)
/* AC27C 800BBA7C 0001043C */  lui        $a0, (0x1000201 >> 16)
/* AC280 800BBA80 000052AC */  sw         $s2, 0x0($v0)
/* AC284 800BBA84 00141400 */  sll        $v0, $s4, 16
/* AC288 800BBA88 0D80033C */  lui        $v1, %hi(GEnv + 0x110)
/* AC28C 800BBA8C 1CDB638C */  lw         $v1, %lo(GEnv + 0x110)($v1)
/* AC290 800BBA90 10004234 */  ori        $v0, $v0, 0x10
/* AC294 800BBA94 000062AC */  sw         $v0, 0x0($v1)
/* AC298 800BBA98 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* AC29C 800BBA9C 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* AC2A0 800BBAA0 01028434 */  ori        $a0, $a0, (0x1000201 & 0xFFFF)
/* AC2A4 800BBAA4 000044AC */  sw         $a0, 0x0($v0)
.L800BBAA8:
/* AC2A8 800BBAA8 21100000 */  addu       $v0, $zero, $zero
.L800BBAAC:
/* AC2AC 800BBAAC 2800BF8F */  lw         $ra, 0x28($sp)
/* AC2B0 800BBAB0 2400B58F */  lw         $s5, 0x24($sp)
/* AC2B4 800BBAB4 2000B48F */  lw         $s4, 0x20($sp)
/* AC2B8 800BBAB8 1C00B38F */  lw         $s3, 0x1C($sp)
/* AC2BC 800BBABC 1800B28F */  lw         $s2, 0x18($sp)
/* AC2C0 800BBAC0 1400B18F */  lw         $s1, 0x14($sp)
/* AC2C4 800BBAC4 1000B08F */  lw         $s0, 0x10($sp)
/* AC2C8 800BBAC8 0800E003 */  jr         $ra
/* AC2CC 800BBACC 3000BD27 */   addiu     $sp, $sp, 0x30
.size func_800BB894, . - func_800BB894
