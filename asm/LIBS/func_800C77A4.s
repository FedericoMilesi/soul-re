.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C77A4
/* B7FA4 800C77A4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B7FA8 800C77A8 1800B2AF */  sw         $s2, 0x18($sp)
/* B7FAC 800C77AC 21908000 */  addu       $s2, $a0, $zero
/* B7FB0 800C77B0 2000B4AF */  sw         $s4, 0x20($sp)
/* B7FB4 800C77B4 21A0A000 */  addu       $s4, $a1, $zero
/* B7FB8 800C77B8 2800BFAF */  sw         $ra, 0x28($sp)
/* B7FBC 800C77BC 2400B5AF */  sw         $s5, 0x24($sp)
/* B7FC0 800C77C0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B7FC4 800C77C4 1400B1AF */  sw         $s1, 0x14($sp)
/* B7FC8 800C77C8 1000B0AF */  sw         $s0, 0x10($sp)
/* B7FCC 800C77CC 0000428E */  lw         $v0, 0x0($s2)
/* B7FD0 800C77D0 00000000 */  nop
/* B7FD4 800C77D4 03004014 */  bnez       $v0, .L800C77E4
/* B7FD8 800C77D8 21A8C000 */   addu      $s5, $a2, $zero
/* B7FDC 800C77DC 01000224 */  addiu      $v0, $zero, 0x1
/* B7FE0 800C77E0 000042AE */  sw         $v0, 0x0($s2)
.L800C77E4:
/* B7FE4 800C77E4 5401038C */  lw         $v1, 0x154($zero)
/* B7FE8 800C77E8 CCCC023C */  lui        $v0, (0xCCCCCCCD >> 16)
/* B7FEC 800C77EC CDCC4234 */  ori        $v0, $v0, (0xCCCCCCCD & 0xFFFF)
/* B7FF0 800C77F0 19006200 */  multu      $v1, $v0
/* B7FF4 800C77F4 5001108C */  lw         $s0, 0x150($zero)
/* B7FF8 800C77F8 0E80133C */  lui        $s3, %hi(_spu_RQ + 0x44)
/* B7FFC 800C77FC 00FE738E */  lw         $s3, %lo(_spu_RQ + 0x44)($s3)
/* B8000 800C7800 10380000 */  mfhi       $a3
/* B8004 800C7804 82190700 */  srl        $v1, $a3, 6
/* B8008 800C7808 80100300 */  sll        $v0, $v1, 2
/* B800C 800C780C 21104300 */  addu       $v0, $v0, $v1
/* B8010 800C7810 00110200 */  sll        $v0, $v0, 4
/* B8014 800C7814 21180202 */  addu       $v1, $s0, $v0
/* B8018 800C7818 2B100302 */  sltu       $v0, $s0, $v1
/* B801C 800C781C 12004010 */  beqz       $v0, .L800C7868
/* B8020 800C7820 21204002 */   addu      $a0, $s2, $zero
/* B8024 800C7824 21886000 */  addu       $s1, $v1, $zero
.L800C7828:
/* B8028 800C7828 0000048E */  lw         $a0, 0x0($s0)
/* B802C 800C782C 00000000 */  nop
/* B8030 800C7830 08008010 */  beqz       $a0, .L800C7854
/* B8034 800C7834 00000000 */   nop
/* B8038 800C7838 0E80053C */  lui        $a1, %hi(_spu_RQ + 0x4C)
/* B803C 800C783C 83F7020C */  jal        strcmp
/* B8040 800C7840 08FEA524 */   addiu     $a1, $a1, %lo(_spu_RQ + 0x4C)
/* B8044 800C7844 03004014 */  bnez       $v0, .L800C7854
/* B8048 800C7848 00000000 */   nop
/* B804C 800C784C 191E0308 */  j          .L800C7864
/* B8050 800C7850 340013AE */   sw        $s3, 0x34($s0)
.L800C7854:
/* B8054 800C7854 50001026 */  addiu      $s0, $s0, 0x50
/* B8058 800C7858 2B101102 */  sltu       $v0, $s0, $s1
/* B805C 800C785C F2FF4014 */  bnez       $v0, .L800C7828
/* B8060 800C7860 00000000 */   nop
.L800C7864:
/* B8064 800C7864 21204002 */  addu       $a0, $s2, $zero
.L800C7868:
/* B8068 800C7868 21288002 */  addu       $a1, $s4, $zero
/* B806C 800C786C 0E80023C */  lui        $v0, %hi(_spu_RQ + 0x44)
/* B8070 800C7870 00FE428C */  lw         $v0, %lo(_spu_RQ + 0x44)($v0)
/* B8074 800C7874 00000000 */  nop
/* B8078 800C7878 09F84000 */  jalr       $v0
/* B807C 800C787C 2130A002 */   addu      $a2, $s5, $zero
/* B8080 800C7880 2800BF8F */  lw         $ra, 0x28($sp)
/* B8084 800C7884 2400B58F */  lw         $s5, 0x24($sp)
/* B8088 800C7888 2000B48F */  lw         $s4, 0x20($sp)
/* B808C 800C788C 1C00B38F */  lw         $s3, 0x1C($sp)
/* B8090 800C7890 1800B28F */  lw         $s2, 0x18($sp)
/* B8094 800C7894 1400B18F */  lw         $s1, 0x14($sp)
/* B8098 800C7898 1000B08F */  lw         $s0, 0x10($sp)
/* B809C 800C789C 0800E003 */  jr         $ra
/* B80A0 800C78A0 3000BD27 */   addiu     $sp, $sp, 0x30
/* B80A4 800C78A4 00000000 */  nop
.size func_800C77A4, . - func_800C77A4
