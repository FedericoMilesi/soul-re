.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_UpdateSavedIntro
/* A5E2C 800B562C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A5E30 800B5630 1400B1AF */  sw         $s1, 0x14($sp)
/* A5E34 800B5634 21888000 */  addu       $s1, $a0, $zero
/* A5E38 800B5638 1C00BFAF */  sw         $ra, 0x1C($sp)
/* A5E3C 800B563C 1800B2AF */  sw         $s2, 0x18($sp)
/* A5E40 800B5640 1000B0AF */  sw         $s0, 0x10($sp)
/* A5E44 800B5644 0000A28C */  lw         $v0, 0x0($a1)
/* A5E48 800B5648 2180C000 */  addu       $s0, $a2, $zero
/* A5E4C 800B564C 4800488C */  lw         $t0, 0x48($v0)
/* A5E50 800B5650 2190E000 */  addu       $s2, $a3, $zero
/* A5E54 800B5654 31000012 */  beqz       $s0, .L800B571C
/* A5E58 800B5658 0C000925 */   addiu     $t1, $t0, 0xC
/* A5E5C 800B565C 01000224 */  addiu      $v0, $zero, 0x1
/* A5E60 800B5660 5C012A8E */  lw         $t2, 0x15C($s1)
/* A5E64 800B5664 60012B8E */  lw         $t3, 0x160($s1)
/* A5E68 800B5668 04000AAE */  sw         $t2, 0x4($s0)
/* A5E6C 800B566C 08000BAE */  sw         $t3, 0x8($s0)
/* A5E70 800B5670 000002A2 */  sb         $v0, 0x0($s0)
/* A5E74 800B5674 3C002296 */  lhu        $v0, 0x3C($s1)
/* A5E78 800B5678 00000000 */  nop
/* A5E7C 800B567C 0C0002A6 */  sh         $v0, 0xC($s0)
/* A5E80 800B5680 38002296 */  lhu        $v0, 0x38($s1)
/* A5E84 800B5684 14000526 */  addiu      $a1, $s0, 0x14
/* A5E88 800B5688 0E0002A6 */  sh         $v0, 0xE($s0)
/* A5E8C 800B568C 34002296 */  lhu        $v0, 0x34($s1)
/* A5E90 800B5690 5C002326 */  addiu      $v1, $s1, 0x5C
/* A5E94 800B5694 100002A6 */  sh         $v0, 0x10($s0)
/* A5E98 800B5698 5C002296 */  lhu        $v0, 0x5C($s1)
/* A5E9C 800B569C 02006694 */  lhu        $a2, 0x2($v1)
/* A5EA0 800B56A0 04006394 */  lhu        $v1, 0x4($v1)
/* A5EA4 800B56A4 0C000795 */  lhu        $a3, 0xC($t0)
/* A5EA8 800B56A8 02002895 */  lhu        $t0, 0x2($t1)
/* A5EAC 800B56AC 04002995 */  lhu        $t1, 0x4($t1)
/* A5EB0 800B56B0 23104700 */  subu       $v0, $v0, $a3
/* A5EB4 800B56B4 1A0002A6 */  sh         $v0, 0x1A($s0)
/* A5EB8 800B56B8 1A000226 */  addiu      $v0, $s0, 0x1A
/* A5EBC 800B56BC 2330C800 */  subu       $a2, $a2, $t0
/* A5EC0 800B56C0 23186900 */  subu       $v1, $v1, $t1
/* A5EC4 800B56C4 020046A4 */  sh         $a2, 0x2($v0)
/* A5EC8 800B56C8 7ED4020C */  jal        SAVE_GetInstanceRotation
/* A5ECC 800B56CC 040043A4 */   sh        $v1, 0x4($v0)
/* A5ED0 800B56D0 1400228E */  lw         $v0, 0x14($s1)
/* A5ED4 800B56D4 00000000 */  nop
/* A5ED8 800B56D8 200002AE */  sw         $v0, 0x20($s0)
/* A5EDC 800B56DC 1800228E */  lw         $v0, 0x18($s1)
/* A5EE0 800B56E0 00000000 */  nop
/* A5EE4 800B56E4 240002AE */  sw         $v0, 0x24($s0)
/* A5EE8 800B56E8 6A002292 */  lbu        $v0, 0x6A($s1)
/* A5EEC 800B56EC 00000000 */  nop
/* A5EF0 800B56F0 030002A2 */  sb         $v0, 0x3($s0)
/* A5EF4 800B56F4 62002292 */  lbu        $v0, 0x62($s1)
/* A5EF8 800B56F8 00000000 */  nop
/* A5EFC 800B56FC 020002A2 */  sb         $v0, 0x2($s0)
/* A5F00 800B5700 8C002296 */  lhu        $v0, 0x8C($s1)
/* A5F04 800B5704 05004012 */  beqz       $s2, .L800B571C
/* A5F08 800B5708 120002A6 */   sh        $v0, 0x12($s0)
/* A5F0C 800B570C 0400458E */  lw         $a1, 0x4($s2)
/* A5F10 800B5710 0000468E */  lw         $a2, 0x0($s2)
/* A5F14 800B5714 02E5010C */  jal        func_80079408
/* A5F18 800B5718 28000426 */   addiu     $a0, $s0, 0x28
.L800B571C:
/* A5F1C 800B571C 21100002 */  addu       $v0, $s0, $zero
/* A5F20 800B5720 1C00BF8F */  lw         $ra, 0x1C($sp)
/* A5F24 800B5724 1800B28F */  lw         $s2, 0x18($sp)
/* A5F28 800B5728 1400B18F */  lw         $s1, 0x14($sp)
/* A5F2C 800B572C 1000B08F */  lw         $s0, 0x10($sp)
/* A5F30 800B5730 0800E003 */  jr         $ra
/* A5F34 800B5734 2000BD27 */   addiu     $sp, $sp, 0x20
.size SAVE_UpdateSavedIntro, . - SAVE_UpdateSavedIntro
