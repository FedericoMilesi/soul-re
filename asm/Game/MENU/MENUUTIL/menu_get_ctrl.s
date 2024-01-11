.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_get_ctrl
/* A8CB4 800B84B4 4C00858C */  lw         $a1, 0x4C($a0)
/* A8CB8 800B84B8 00000000 */  nop
/* A8CBC 800B84BC 0100A230 */  andi       $v0, $a1, 0x1
/* A8CC0 800B84C0 1A004014 */  bnez       $v0, .L800B852C
/* A8CC4 800B84C4 01000324 */   addiu     $v1, $zero, 0x1
/* A8CC8 800B84C8 0200A230 */  andi       $v0, $a1, 0x2
/* A8CCC 800B84CC 17004014 */  bnez       $v0, .L800B852C
/* A8CD0 800B84D0 02000324 */   addiu     $v1, $zero, 0x2
/* A8CD4 800B84D4 0400A230 */  andi       $v0, $a1, 0x4
/* A8CD8 800B84D8 14004014 */  bnez       $v0, .L800B852C
/* A8CDC 800B84DC 03000324 */   addiu     $v1, $zero, 0x3
/* A8CE0 800B84E0 0800A230 */  andi       $v0, $a1, 0x8
/* A8CE4 800B84E4 11004014 */  bnez       $v0, .L800B852C
/* A8CE8 800B84E8 04000324 */   addiu     $v1, $zero, 0x4
/* A8CEC 800B84EC 8000A230 */  andi       $v0, $a1, 0x80
/* A8CF0 800B84F0 06004010 */  beqz       $v0, .L800B850C
/* A8CF4 800B84F4 1000A230 */   andi      $v0, $a1, 0x10
/* A8CF8 800B84F8 4800828C */  lw         $v0, 0x48($a0)
/* A8CFC 800B84FC 00000000 */  nop
/* A8D00 800B8500 00034230 */  andi       $v0, $v0, 0x300
/* A8D04 800B8504 08004010 */  beqz       $v0, .L800B8528
/* A8D08 800B8508 1000A230 */   andi      $v0, $a1, 0x10
.L800B850C:
/* A8D0C 800B850C 07004014 */  bnez       $v0, .L800B852C
/* A8D10 800B8510 06000324 */   addiu     $v1, $zero, 0x6
/* A8D14 800B8514 0040A230 */  andi       $v0, $a1, 0x4000
/* A8D18 800B8518 04004010 */  beqz       $v0, .L800B852C
/* A8D1C 800B851C 21180000 */   addu      $v1, $zero, $zero
/* A8D20 800B8520 4BE10208 */  j          .L800B852C
/* A8D24 800B8524 07000324 */   addiu     $v1, $zero, 0x7
.L800B8528:
/* A8D28 800B8528 05000324 */  addiu      $v1, $zero, 0x5
.L800B852C:
/* A8D2C 800B852C 0800E003 */  jr         $ra
/* A8D30 800B8530 21106000 */   addu      $v0, $v1, $zero
.size menu_get_ctrl, . - menu_get_ctrl
