.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_UpdateSavedIntroWithIntro
/* A5F38 800B5738 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A5F3C 800B573C 1400B1AF */  sw         $s1, 0x14($sp)
/* A5F40 800B5740 21888000 */  addu       $s1, $a0, $zero
/* A5F44 800B5744 1C00BFAF */  sw         $ra, 0x1C($sp)
/* A5F48 800B5748 1800B2AF */  sw         $s2, 0x18($sp)
/* A5F4C 800B574C 1000B0AF */  sw         $s0, 0x10($sp)
/* A5F50 800B5750 0000A28C */  lw         $v0, 0x0($a1)
/* A5F54 800B5754 2190E000 */  addu       $s2, $a3, $zero
/* A5F58 800B5758 4800478C */  lw         $a3, 0x48($v0)
/* A5F5C 800B575C 2180C000 */  addu       $s0, $a2, $zero
/* A5F60 800B5760 3C000012 */  beqz       $s0, .L800B5854
/* A5F64 800B5764 0C00E924 */   addiu     $t1, $a3, 0xC
/* A5F68 800B5768 2000228E */  lw         $v0, 0x20($s1)
/* A5F6C 800B576C 00000000 */  nop
/* A5F70 800B5770 38004010 */  beqz       $v0, .L800B5854
/* A5F74 800B5774 07000224 */   addiu     $v0, $zero, 0x7
/* A5F78 800B5778 000002A2 */  sb         $v0, 0x0($s0)
/* A5F7C 800B577C 2000228E */  lw         $v0, 0x20($s1)
/* A5F80 800B5780 7C00A38C */  lw         $v1, 0x7C($a1)
/* A5F84 800B5784 00000000 */  nop
/* A5F88 800B5788 23104300 */  subu       $v0, $v0, $v1
/* A5F8C 800B578C C0180200 */  sll        $v1, $v0, 3
/* A5F90 800B5790 23186200 */  subu       $v1, $v1, $v0
/* A5F94 800B5794 80180300 */  sll        $v1, $v1, 2
/* A5F98 800B5798 23186200 */  subu       $v1, $v1, $v0
/* A5F9C 800B579C 40120300 */  sll        $v0, $v1, 9
/* A5FA0 800B57A0 23104300 */  subu       $v0, $v0, $v1
/* A5FA4 800B57A4 801C0200 */  sll        $v1, $v0, 18
/* A5FA8 800B57A8 21104300 */  addu       $v0, $v0, $v1
/* A5FAC 800B57AC 23100200 */  negu       $v0, $v0
/* A5FB0 800B57B0 83100200 */  sra        $v0, $v0, 2
/* A5FB4 800B57B4 040002A6 */  sh         $v0, 0x4($s0)
/* A5FB8 800B57B8 3C002296 */  lhu        $v0, 0x3C($s1)
/* A5FBC 800B57BC 14000526 */  addiu      $a1, $s0, 0x14
/* A5FC0 800B57C0 080002A6 */  sh         $v0, 0x8($s0)
/* A5FC4 800B57C4 34002296 */  lhu        $v0, 0x34($s1)
/* A5FC8 800B57C8 5C002326 */  addiu      $v1, $s1, 0x5C
/* A5FCC 800B57CC 060002A6 */  sh         $v0, 0x6($s0)
/* A5FD0 800B57D0 5C002296 */  lhu        $v0, 0x5C($s1)
/* A5FD4 800B57D4 02006694 */  lhu        $a2, 0x2($v1)
/* A5FD8 800B57D8 04006394 */  lhu        $v1, 0x4($v1)
/* A5FDC 800B57DC 0C00E794 */  lhu        $a3, 0xC($a3)
/* A5FE0 800B57E0 02002895 */  lhu        $t0, 0x2($t1)
/* A5FE4 800B57E4 04002995 */  lhu        $t1, 0x4($t1)
/* A5FE8 800B57E8 23104700 */  subu       $v0, $v0, $a3
/* A5FEC 800B57EC 1A0002A6 */  sh         $v0, 0x1A($s0)
/* A5FF0 800B57F0 1A000226 */  addiu      $v0, $s0, 0x1A
/* A5FF4 800B57F4 2330C800 */  subu       $a2, $a2, $t0
/* A5FF8 800B57F8 23186900 */  subu       $v1, $v1, $t1
/* A5FFC 800B57FC 020046A4 */  sh         $a2, 0x2($v0)
/* A6000 800B5800 7ED4020C */  jal        SAVE_GetInstanceRotation
/* A6004 800B5804 040043A4 */   sh        $v1, 0x4($v0)
/* A6008 800B5808 1400228E */  lw         $v0, 0x14($s1)
/* A600C 800B580C 00000000 */  nop
/* A6010 800B5810 0C0002AE */  sw         $v0, 0xC($s0)
/* A6014 800B5814 1800228E */  lw         $v0, 0x18($s1)
/* A6018 800B5818 00000000 */  nop
/* A601C 800B581C 100002AE */  sw         $v0, 0x10($s0)
/* A6020 800B5820 6A002292 */  lbu        $v0, 0x6A($s1)
/* A6024 800B5824 00000000 */  nop
/* A6028 800B5828 0B0002A2 */  sb         $v0, 0xB($s0)
/* A602C 800B582C 62002292 */  lbu        $v0, 0x62($s1)
/* A6030 800B5830 00000000 */  nop
/* A6034 800B5834 0A0002A2 */  sb         $v0, 0xA($s0)
/* A6038 800B5838 8C002296 */  lhu        $v0, 0x8C($s1)
/* A603C 800B583C 05004012 */  beqz       $s2, .L800B5854
/* A6040 800B5840 020002A6 */   sh        $v0, 0x2($s0)
/* A6044 800B5844 0400458E */  lw         $a1, 0x4($s2)
/* A6048 800B5848 0000468E */  lw         $a2, 0x0($s2)
/* A604C 800B584C 02E5010C */  jal        memcpy
/* A6050 800B5850 20000426 */   addiu     $a0, $s0, 0x20
.L800B5854:
/* A6054 800B5854 21100002 */  addu       $v0, $s0, $zero
/* A6058 800B5858 1C00BF8F */  lw         $ra, 0x1C($sp)
/* A605C 800B585C 1800B28F */  lw         $s2, 0x18($sp)
/* A6060 800B5860 1400B18F */  lw         $s1, 0x14($sp)
/* A6064 800B5864 1000B08F */  lw         $s0, 0x10($sp)
/* A6068 800B5868 0800E003 */  jr         $ra
/* A606C 800B586C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SAVE_UpdateSavedIntroWithIntro, . - SAVE_UpdateSavedIntroWithIntro
