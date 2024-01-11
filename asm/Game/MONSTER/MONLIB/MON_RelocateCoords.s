.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_RelocateCoords
/* 73C74 80083474 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 73C78 80083478 2140A000 */  addu       $t0, $a1, $zero
/* 73C7C 8008347C 1000BFAF */  sw         $ra, 0x10($sp)
/* 73C80 80083480 6C01848C */  lw         $a0, 0x16C($a0)
/* 73C84 80083484 00000585 */  lh         $a1, 0x0($t0)
/* 73C88 80083488 02000685 */  lh         $a2, 0x2($t0)
/* 73C8C 8008348C 04000785 */  lh         $a3, 0x4($t0)
/* 73C90 80083490 24018294 */  lhu        $v0, 0x124($a0)
/* 73C94 80083494 26018394 */  lhu        $v1, 0x126($a0)
/* 73C98 80083498 21104500 */  addu       $v0, $v0, $a1
/* 73C9C 8008349C 240182A4 */  sh         $v0, 0x124($a0)
/* 73CA0 800834A0 28018294 */  lhu        $v0, 0x128($a0)
/* 73CA4 800834A4 21186600 */  addu       $v1, $v1, $a2
/* 73CA8 800834A8 260183A4 */  sh         $v1, 0x126($a0)
/* 73CAC 800834AC 2C018394 */  lhu        $v1, 0x12C($a0)
/* 73CB0 800834B0 21104700 */  addu       $v0, $v0, $a3
/* 73CB4 800834B4 280182A4 */  sh         $v0, 0x128($a0)
/* 73CB8 800834B8 2E018294 */  lhu        $v0, 0x12E($a0)
/* 73CBC 800834BC 21186500 */  addu       $v1, $v1, $a1
/* 73CC0 800834C0 2C0183A4 */  sh         $v1, 0x12C($a0)
/* 73CC4 800834C4 30018394 */  lhu        $v1, 0x130($a0)
/* 73CC8 800834C8 21104600 */  addu       $v0, $v0, $a2
/* 73CCC 800834CC 21186700 */  addu       $v1, $v1, $a3
/* 73CD0 800834D0 2E0182A4 */  sh         $v0, 0x12E($a0)
/* 73CD4 800834D4 300183A4 */  sh         $v1, 0x130($a0)
/* 73CD8 800834D8 66018480 */  lb         $a0, 0x166($a0)
/* 73CDC 800834DC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 73CE0 800834E0 03008210 */  beq        $a0, $v0, .L800834F0
/* 73CE4 800834E4 00000000 */   nop
/* 73CE8 800834E8 8B5C020C */  jal        ENMYPLAN_RelocatePlanPositions
/* 73CEC 800834EC 21280001 */   addu      $a1, $t0, $zero
.L800834F0:
/* 73CF0 800834F0 1000BF8F */  lw         $ra, 0x10($sp)
/* 73CF4 800834F4 00000000 */  nop
/* 73CF8 800834F8 0800E003 */  jr         $ra
/* 73CFC 800834FC 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_RelocateCoords, . - MON_RelocateCoords
