.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANCOLL_DoesStraightLinePathExist
/* 89810 80099010 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 89814 80099014 2000B2AF */  sw         $s2, 0x20($sp)
/* 89818 80099018 21908000 */  addu       $s2, $a0, $zero
/* 8981C 8009901C 2400B3AF */  sw         $s3, 0x24($sp)
/* 89820 80099020 2198A000 */  addu       $s3, $a1, $zero
/* 89824 80099024 2800B4AF */  sw         $s4, 0x28($sp)
/* 89828 80099028 21A0C000 */  addu       $s4, $a2, $zero
/* 8982C 8009902C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 89830 80099030 21880000 */  addu       $s1, $zero, $zero
/* 89834 80099034 08BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x140)($gp)
/* 89838 80099038 00010224 */  addiu      $v0, $zero, 0x100
/* 8983C 8009903C 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 89840 80099040 1800B0AF */  sw         $s0, 0x18($sp)
/* 89844 80099044 1000A2AF */  sw         $v0, 0x10($sp)
/* 89848 80099048 2A807100 */  slt        $s0, $v1, $s1
/* 8984C 8009904C B862020C */  jal        PLANCOLL_DoesLOSExistFinal
/* 89850 80099050 21380002 */   addu      $a3, $s0, $zero
/* 89854 80099054 08004010 */  beqz       $v0, .L80099078
/* 89858 80099058 00FF0224 */   addiu     $v0, $zero, -0x100
/* 8985C 8009905C 1000A2AF */  sw         $v0, 0x10($sp)
/* 89860 80099060 21204002 */  addu       $a0, $s2, $zero
/* 89864 80099064 21286002 */  addu       $a1, $s3, $zero
/* 89868 80099068 21308002 */  addu       $a2, $s4, $zero
/* 8986C 8009906C B862020C */  jal        PLANCOLL_DoesLOSExistFinal
/* 89870 80099070 21380002 */   addu      $a3, $s0, $zero
/* 89874 80099074 2B880200 */  sltu       $s1, $zero, $v0
.L80099078:
/* 89878 80099078 21102002 */  addu       $v0, $s1, $zero
/* 8987C 8009907C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 89880 80099080 2800B48F */  lw         $s4, 0x28($sp)
/* 89884 80099084 2400B38F */  lw         $s3, 0x24($sp)
/* 89888 80099088 2000B28F */  lw         $s2, 0x20($sp)
/* 8988C 8009908C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 89890 80099090 1800B08F */  lw         $s0, 0x18($sp)
/* 89894 80099094 0800E003 */  jr         $ra
/* 89898 80099098 3000BD27 */   addiu     $sp, $sp, 0x30
.size PLANCOLL_DoesStraightLinePathExist, . - PLANCOLL_DoesStraightLinePathExist
