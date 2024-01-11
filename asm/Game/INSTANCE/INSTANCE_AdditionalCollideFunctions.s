.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_AdditionalCollideFunctions
/* 23CC8 800334C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 23CCC 800334CC 1400BFAF */  sw         $ra, 0x14($sp)
/* 23CD0 800334D0 1000B0AF */  sw         $s0, 0x10($sp)
/* 23CD4 800334D4 0400908C */  lw         $s0, 0x4($a0)
/* 23CD8 800334D8 00000000 */  nop
/* 23CDC 800334DC 3E000012 */  beqz       $s0, .L800335D8
/* 23CE0 800334E0 00000000 */   nop
.L800334E4:
/* 23CE4 800334E4 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 23CE8 800334E8 06000224 */  addiu      $v0, $zero, 0x6
/* 23CEC 800334EC 08006214 */  bne        $v1, $v0, .L80033510
/* 23CF0 800334F0 0200033C */   lui       $v1, (0x20000 >> 16)
/* 23CF4 800334F4 1C00028E */  lw         $v0, 0x1C($s0)
/* 23CF8 800334F8 00000000 */  nop
/* 23CFC 800334FC 0000428C */  lw         $v0, 0x0($v0)
/* 23D00 80033500 00000000 */  nop
/* 23D04 80033504 24104300 */  and        $v0, $v0, $v1
/* 23D08 80033508 2F004010 */  beqz       $v0, .L800335C8
/* 23D0C 8003350C 00000000 */   nop
.L80033510:
/* 23D10 80033510 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 23D14 80033514 1000033C */  lui        $v1, (0x100000 >> 16)
/* 23D18 80033518 24104300 */  and        $v0, $v0, $v1
/* 23D1C 8003351C 08004010 */  beqz       $v0, .L80033540
/* 23D20 80033520 0400033C */   lui       $v1, (0x40000 >> 16)
/* 23D24 80033524 1C00028E */  lw         $v0, 0x1C($s0)
/* 23D28 80033528 00000000 */  nop
/* 23D2C 8003352C 0000428C */  lw         $v0, 0x0($v0)
/* 23D30 80033530 00000000 */  nop
/* 23D34 80033534 24104300 */  and        $v0, $v0, $v1
/* 23D38 80033538 23004010 */  beqz       $v0, .L800335C8
/* 23D3C 8003353C 00000000 */   nop
.L80033540:
/* 23D40 80033540 1001028E */  lw         $v0, 0x110($s0)
/* 23D44 80033544 00000000 */  nop
/* 23D48 80033548 1F004010 */  beqz       $v0, .L800335C8
/* 23D4C 8003354C 0024023C */   lui       $v0, (0x24000000 >> 16)
/* 23D50 80033550 1800048E */  lw         $a0, 0x18($s0)
/* 23D54 80033554 00000000 */  nop
/* 23D58 80033558 24108200 */  and        $v0, $a0, $v0
/* 23D5C 8003355C 1A004014 */  bnez       $v0, .L800335C8
/* 23D60 80033560 00000000 */   nop
/* 23D64 80033564 1C00028E */  lw         $v0, 0x1C($s0)
/* 23D68 80033568 00000000 */  nop
/* 23D6C 8003356C 0F004010 */  beqz       $v0, .L800335AC
/* 23D70 80033570 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 23D74 80033574 2C00428C */  lw         $v0, 0x2C($v0)
/* 23D78 80033578 00000000 */  nop
/* 23D7C 8003357C 24104300 */  and        $v0, $v0, $v1
/* 23D80 80033580 0A004010 */  beqz       $v0, .L800335AC
/* 23D84 80033584 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 23D88 80033588 24108200 */  and        $v0, $a0, $v0
/* 23D8C 8003358C 04004010 */  beqz       $v0, .L800335A0
/* 23D90 80033590 00000000 */   nop
/* 23D94 80033594 10C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x248)($gp)
/* 23D98 80033598 6CCD0008 */  j          .L800335B0
/* 23D9C 8003359C 00000000 */   nop
.L800335A0:
/* 23DA0 800335A0 14C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x24C)($gp)
/* 23DA4 800335A4 6CCD0008 */  j          .L800335B0
/* 23DA8 800335A8 00000000 */   nop
.L800335AC:
/* 23DAC 800335AC 0CC0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x244)($gp)
.L800335B0:
/* 23DB0 800335B0 00000000 */  nop
/* 23DB4 800335B4 08C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 23DB8 800335B8 1001028E */  lw         $v0, 0x110($s0)
/* 23DBC 800335BC C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* 23DC0 800335C0 09F84000 */  jalr       $v0
/* 23DC4 800335C4 21200002 */   addu      $a0, $s0, $zero
.L800335C8:
/* 23DC8 800335C8 0800108E */  lw         $s0, 0x8($s0)
/* 23DCC 800335CC 00000000 */  nop
/* 23DD0 800335D0 C4FF0016 */  bnez       $s0, .L800334E4
/* 23DD4 800335D4 00000000 */   nop
.L800335D8:
/* 23DD8 800335D8 0CC0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x244)($gp)
/* 23DDC 800335DC 1400BF8F */  lw         $ra, 0x14($sp)
/* 23DE0 800335E0 1000B08F */  lw         $s0, 0x10($sp)
/* 23DE4 800335E4 08C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 23DE8 800335E8 0800E003 */  jr         $ra
/* 23DEC 800335EC 1800BD27 */   addiu     $sp, $sp, 0x18
.size INSTANCE_AdditionalCollideFunctions, . - INSTANCE_AdditionalCollideFunctions
