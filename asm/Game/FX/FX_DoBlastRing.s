.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DoBlastRing
/* 3C738 8004BF38 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 3C73C 8004BF3C 1800B2AF */  sw         $s2, 0x18($sp)
/* 3C740 8004BF40 21908000 */  addu       $s2, $a0, $zero
/* 3C744 8004BF44 2400B5AF */  sw         $s5, 0x24($sp)
/* 3C748 8004BF48 21A8A000 */  addu       $s5, $a1, $zero
/* 3C74C 8004BF4C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3C750 8004BF50 2198C000 */  addu       $s3, $a2, $zero
/* 3C754 8004BF54 2800B6AF */  sw         $s6, 0x28($sp)
/* 3C758 8004BF58 21B0E000 */  addu       $s6, $a3, $zero
/* 3C75C 8004BF5C 2000B4AF */  sw         $s4, 0x20($sp)
/* 3C760 8004BF60 6800B48F */  lw         $s4, 0x68($sp)
/* 3C764 8004BF64 78000424 */  addiu      $a0, $zero, 0x78
/* 3C768 8004BF68 1400B1AF */  sw         $s1, 0x14($sp)
/* 3C76C 8004BF6C 7000B18F */  lw         $s1, 0x70($sp)
/* 3C770 8004BF70 0D000524 */  addiu      $a1, $zero, 0xD
/* 3C774 8004BF74 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 3C778 8004BF78 8140010C */  jal        MEMPACK_Malloc
/* 3C77C 8004BF7C 1000B0AF */   sw        $s0, 0x10($sp)
/* 3C780 8004BF80 21804000 */  addu       $s0, $v0, $zero
/* 3C784 8004BF84 56000012 */  beqz       $s0, .L8004C0E0
/* 3C788 8004BF88 0580023C */   lui       $v0, %hi(FX_ContinueBlastRing)
/* 3C78C 8004BF8C 24BD4224 */  addiu      $v0, $v0, %lo(FX_ContinueBlastRing)
/* 3C790 8004BF90 040002AE */  sw         $v0, 0x4($s0)
/* 3C794 8004BF94 84000224 */  addiu      $v0, $zero, 0x84
/* 3C798 8004BF98 080012AE */  sw         $s2, 0x8($s0)
/* 3C79C 8004BF9C 04002012 */  beqz       $s1, .L8004BFB0
/* 3C7A0 8004BFA0 0C0002A2 */   sb        $v0, 0xC($s0)
/* 3C7A4 8004BFA4 01000224 */  addiu      $v0, $zero, 0x1
/* 3C7A8 8004BFA8 ED2F0108 */  j          .L8004BFB4
/* 3C7AC 8004BFAC 0D0002A2 */   sb        $v0, 0xD($s0)
.L8004BFB0:
/* 3C7B0 8004BFB0 0D0000A2 */  sb         $zero, 0xD($s0)
.L8004BFB4:
/* 3C7B4 8004BFB4 680011A2 */  sb         $s1, 0x68($s0)
/* 3C7B8 8004BFB8 690011A2 */  sb         $s1, 0x69($s0)
/* 3C7BC 8004BFBC 7400A28F */  lw         $v0, 0x74($sp)
/* 3C7C0 8004BFC0 00000000 */  nop
/* 3C7C4 8004BFC4 0E0002A6 */  sh         $v0, 0xE($s0)
/* 3C7C8 8004BFC8 0300A38A */  lwl        $v1, 0x3($s5)
/* 3C7CC 8004BFCC 0000A39A */  lwr        $v1, 0x0($s5)
/* 3C7D0 8004BFD0 0700A88A */  lwl        $t0, 0x7($s5)
/* 3C7D4 8004BFD4 0400A89A */  lwr        $t0, 0x4($s5)
/* 3C7D8 8004BFD8 130003AA */  swl        $v1, 0x13($s0)
/* 3C7DC 8004BFDC 100003BA */  swr        $v1, 0x10($s0)
/* 3C7E0 8004BFE0 170008AA */  swl        $t0, 0x17($s0)
/* 3C7E4 8004BFE4 140008BA */  swr        $t0, 0x14($s0)
/* 3C7E8 8004BFE8 11006012 */  beqz       $s3, .L8004C030
/* 3C7EC 8004BFEC 00000000 */   nop
/* 3C7F0 8004BFF0 0000638E */  lw         $v1, 0x0($s3)
/* 3C7F4 8004BFF4 0400688E */  lw         $t0, 0x4($s3)
/* 3C7F8 8004BFF8 0800698E */  lw         $t1, 0x8($s3)
/* 3C7FC 8004BFFC 0C006A8E */  lw         $t2, 0xC($s3)
/* 3C800 8004C000 180003AE */  sw         $v1, 0x18($s0)
/* 3C804 8004C004 1C0008AE */  sw         $t0, 0x1C($s0)
/* 3C808 8004C008 200009AE */  sw         $t1, 0x20($s0)
/* 3C80C 8004C00C 24000AAE */  sw         $t2, 0x24($s0)
/* 3C810 8004C010 1000638E */  lw         $v1, 0x10($s3)
/* 3C814 8004C014 1400688E */  lw         $t0, 0x14($s3)
/* 3C818 8004C018 1800698E */  lw         $t1, 0x18($s3)
/* 3C81C 8004C01C 1C006A8E */  lw         $t2, 0x1C($s3)
/* 3C820 8004C020 280003AE */  sw         $v1, 0x28($s0)
/* 3C824 8004C024 2C0008AE */  sw         $t0, 0x2C($s0)
/* 3C828 8004C028 300009AE */  sw         $t1, 0x30($s0)
/* 3C82C 8004C02C 34000AAE */  sw         $t2, 0x34($s0)
.L8004C030:
/* 3C830 8004C030 380016A6 */  sh         $s6, 0x38($s0)
/* 3C834 8004C034 4000A28F */  lw         $v0, 0x40($sp)
/* 3C838 8004C038 00000000 */  nop
/* 3C83C 8004C03C 00130200 */  sll        $v0, $v0, 12
/* 3C840 8004C040 3C0002AE */  sw         $v0, 0x3C($s0)
/* 3C844 8004C044 480002AE */  sw         $v0, 0x48($s0)
/* 3C848 8004C048 4C00A28F */  lw         $v0, 0x4C($sp)
/* 3C84C 8004C04C 00000000 */  nop
/* 3C850 8004C050 400002AE */  sw         $v0, 0x40($s0)
/* 3C854 8004C054 5000A28F */  lw         $v0, 0x50($sp)
/* 3C858 8004C058 00000000 */  nop
/* 3C85C 8004C05C 440002AE */  sw         $v0, 0x44($s0)
/* 3C860 8004C060 4400A28F */  lw         $v0, 0x44($sp)
/* 3C864 8004C064 00000000 */  nop
/* 3C868 8004C068 00130200 */  sll        $v0, $v0, 12
/* 3C86C 8004C06C 4C0002AE */  sw         $v0, 0x4C($s0)
/* 3C870 8004C070 4800A28F */  lw         $v0, 0x48($sp)
/* 3C874 8004C074 00000000 */  nop
/* 3C878 8004C078 00130200 */  sll        $v0, $v0, 12
/* 3C87C 8004C07C 500002AE */  sw         $v0, 0x50($s0)
/* 3C880 8004C080 5400A28F */  lw         $v0, 0x54($sp)
/* 3C884 8004C084 00000000 */  nop
/* 3C888 8004C088 540002AE */  sw         $v0, 0x54($s0)
/* 3C88C 8004C08C 5800A28F */  lw         $v0, 0x58($sp)
/* 3C890 8004C090 00000000 */  nop
/* 3C894 8004C094 580002AE */  sw         $v0, 0x58($s0)
/* 3C898 8004C098 5C00A28F */  lw         $v0, 0x5C($sp)
/* 3C89C 8004C09C 00000000 */  nop
/* 3C8A0 8004C0A0 5C0002AE */  sw         $v0, 0x5C($s0)
/* 3C8A4 8004C0A4 6000A28F */  lw         $v0, 0x60($sp)
/* 3C8A8 8004C0A8 00000000 */  nop
/* 3C8AC 8004C0AC 600002AE */  sw         $v0, 0x60($s0)
/* 3C8B0 8004C0B0 6400A28F */  lw         $v0, 0x64($sp)
/* 3C8B4 8004C0B4 6C0014AE */  sw         $s4, 0x6C($s0)
/* 3C8B8 8004C0B8 700014AE */  sw         $s4, 0x70($s0)
/* 3C8BC 8004C0BC 640002AE */  sw         $v0, 0x64($s0)
/* 3C8C0 8004C0C0 6C00A28F */  lw         $v0, 0x6C($sp)
/* 3C8C4 8004C0C4 00000000 */  nop
/* 3C8C8 8004C0C8 740002AE */  sw         $v0, 0x74($s0)
/* 3C8CC 8004C0CC 7800A28F */  lw         $v0, 0x78($sp)
/* 3C8D0 8004C0D0 21200002 */  addu       $a0, $s0, $zero
/* 3C8D4 8004C0D4 6A0000A2 */  sb         $zero, 0x6A($s0)
/* 3C8D8 8004C0D8 1B2D010C */  jal        FX_InsertGeneralEffect
/* 3C8DC 8004C0DC 6B0002A2 */   sb        $v0, 0x6B($s0)
.L8004C0E0:
/* 3C8E0 8004C0E0 21100002 */  addu       $v0, $s0, $zero
/* 3C8E4 8004C0E4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 3C8E8 8004C0E8 2800B68F */  lw         $s6, 0x28($sp)
/* 3C8EC 8004C0EC 2400B58F */  lw         $s5, 0x24($sp)
/* 3C8F0 8004C0F0 2000B48F */  lw         $s4, 0x20($sp)
/* 3C8F4 8004C0F4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3C8F8 8004C0F8 1800B28F */  lw         $s2, 0x18($sp)
/* 3C8FC 8004C0FC 1400B18F */  lw         $s1, 0x14($sp)
/* 3C900 8004C100 1000B08F */  lw         $s0, 0x10($sp)
/* 3C904 8004C104 0800E003 */  jr         $ra
/* 3C908 8004C108 3000BD27 */   addiu     $sp, $sp, 0x30
.size FX_DoBlastRing, . - FX_DoBlastRing
