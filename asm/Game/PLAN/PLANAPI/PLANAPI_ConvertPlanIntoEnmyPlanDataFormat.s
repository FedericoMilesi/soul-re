.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_ConvertPlanIntoEnmyPlanDataFormat
/* 884CC 80097CCC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 884D0 80097CD0 1400B1AF */  sw         $s1, 0x14($sp)
/* 884D4 80097CD4 2188A000 */  addu       $s1, $a1, $zero
/* 884D8 80097CD8 1800B2AF */  sw         $s2, 0x18($sp)
/* 884DC 80097CDC 2190C000 */  addu       $s2, $a2, $zero
/* 884E0 80097CE0 1000B0AF */  sw         $s0, 0x10($sp)
/* 884E4 80097CE4 21808000 */  addu       $s0, $a0, $zero
/* 884E8 80097CE8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 884EC 80097CEC 7564020C */  jal        PLANPOOL_NumNodesInPlan
/* 884F0 80097CF0 21284002 */   addu      $a1, $s2, $zero
/* 884F4 80097CF4 420022A2 */  sb         $v0, 0x42($s1)
/* 884F8 80097CF8 FF004230 */  andi       $v0, $v0, 0xFF
/* 884FC 80097CFC FFFF4424 */  addiu      $a0, $v0, -0x1
/* 88500 80097D00 19008004 */  bltz       $a0, .L80097D68
/* 88504 80097D04 00000000 */   nop
/* 88508 80097D08 40100400 */  sll        $v0, $a0, 1
/* 8850C 80097D0C 21104400 */  addu       $v0, $v0, $a0
/* 88510 80097D10 40100200 */  sll        $v0, $v0, 1
/* 88514 80097D14 21285100 */  addu       $a1, $v0, $s1
.L80097D18:
/* 88518 80097D18 08008228 */  slti       $v0, $a0, 0x8
/* 8851C 80097D1C 0A004010 */  beqz       $v0, .L80097D48
/* 88520 80097D20 21102402 */   addu      $v0, $s1, $a0
/* 88524 80097D24 0300078A */  lwl        $a3, 0x3($s0)
/* 88528 80097D28 0000079A */  lwr        $a3, 0x0($s0)
/* 8852C 80097D2C 04000886 */  lh         $t0, 0x4($s0)
/* 88530 80097D30 1300A7A8 */  swl        $a3, 0x13($a1)
/* 88534 80097D34 1000A7B8 */  swr        $a3, 0x10($a1)
/* 88538 80097D38 1400A8A4 */  sh         $t0, 0x14($a1)
/* 8853C 80097D3C 14000392 */  lbu        $v1, 0x14($s0)
/* 88540 80097D40 000040A0 */  sb         $zero, 0x0($v0)
/* 88544 80097D44 080043A0 */  sb         $v1, 0x8($v0)
.L80097D48:
/* 88548 80097D48 FAFFA524 */  addiu      $a1, $a1, -0x6
/* 8854C 80097D4C 12000396 */  lhu        $v1, 0x12($s0)
/* 88550 80097D50 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 88554 80097D54 C0100300 */  sll        $v0, $v1, 3
/* 88558 80097D58 23104300 */  subu       $v0, $v0, $v1
/* 8855C 80097D5C 80100200 */  sll        $v0, $v0, 2
/* 88560 80097D60 EDFF8104 */  bgez       $a0, .L80097D18
/* 88564 80097D64 21804202 */   addu      $s0, $s2, $v0
.L80097D68:
/* 88568 80097D68 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 8856C 80097D6C 1800B28F */  lw         $s2, 0x18($sp)
/* 88570 80097D70 1400B18F */  lw         $s1, 0x14($sp)
/* 88574 80097D74 1000B08F */  lw         $s0, 0x10($sp)
/* 88578 80097D78 0800E003 */  jr         $ra
/* 8857C 80097D7C 2000BD27 */   addiu     $sp, $sp, 0x20
.size PLANAPI_ConvertPlanIntoEnmyPlanDataFormat, . - PLANAPI_ConvertPlanIntoEnmyPlanDataFormat
