.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_NonBlockingReadFile
/* 284B0 80037CB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 284B4 80037CB4 1800B0AF */  sw         $s0, 0x18($sp)
/* 284B8 80037CB8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 284BC 80037CBC 0ADF000C */  jal        LOAD_SetupFileInfo
/* 284C0 80037CC0 21808000 */   addu      $s0, $a0, $zero
/* 284C4 80037CC4 16004010 */  beqz       $v0, .L80037D20
/* 284C8 80037CC8 01000224 */   addiu     $v0, $zero, 0x1
/* 284CC 80037CCC 0C00028E */  lw         $v0, 0xC($s0)
/* 284D0 80037CD0 00000000 */  nop
/* 284D4 80037CD4 06004014 */  bnez       $v0, .L80037CF0
/* 284D8 80037CD8 00000000 */   nop
/* 284DC 80037CDC 1000048E */  lw         $a0, 0x10($s0)
/* 284E0 80037CE0 1C000592 */  lbu        $a1, 0x1C($s0)
/* 284E4 80037CE4 8140010C */  jal        MEMPACK_Malloc
/* 284E8 80037CE8 00000000 */   nop
/* 284EC 80037CEC 0C0002AE */  sw         $v0, 0xC($s0)
.L80037CF0:
/* 284F0 80037CF0 1400028E */  lw         $v0, 0x14($s0)
/* 284F4 80037CF4 00000000 */  nop
/* 284F8 80037CF8 1000A2AF */  sw         $v0, 0x10($sp)
/* 284FC 80037CFC 0800048E */  lw         $a0, 0x8($s0)
/* 28500 80037D00 0C00058E */  lw         $a1, 0xC($s0)
/* 28504 80037D04 1000068E */  lw         $a2, 0x10($s0)
/* 28508 80037D08 1800078E */  lw         $a3, 0x18($s0)
/* 2850C 80037D0C 90DE000C */  jal        LOAD_CdReadFromBigFile
/* 28510 80037D10 00000000 */   nop
/* 28514 80037D14 1CBC80AF */  sw         $zero, %gp_rel(loadStatus + 0x88)($gp)
/* 28518 80037D18 49DF0008 */  j          .L80037D24
/* 2851C 80037D1C 00000000 */   nop
.L80037D20:
/* 28520 80037D20 1CBC82AF */  sw         $v0, %gp_rel(loadStatus + 0x88)($gp)
.L80037D24:
/* 28524 80037D24 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 28528 80037D28 1800B08F */  lw         $s0, 0x18($sp)
/* 2852C 80037D2C 0800E003 */  jr         $ra
/* 28530 80037D30 2000BD27 */   addiu     $sp, $sp, 0x20
.size LOAD_NonBlockingReadFile, . - LOAD_NonBlockingReadFile
