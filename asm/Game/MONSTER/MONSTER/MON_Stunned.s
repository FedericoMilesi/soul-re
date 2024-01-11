.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Stunned
/* 79E20 80089620 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 79E24 80089624 1000B0AF */  sw         $s0, 0x10($sp)
/* 79E28 80089628 21808000 */  addu       $s0, $a0, $zero
/* 79E2C 8008962C 1800BFAF */  sw         $ra, 0x18($sp)
/* 79E30 80089630 1400B1AF */  sw         $s1, 0x14($sp)
/* 79E34 80089634 1800028E */  lw         $v0, 0x18($s0)
/* 79E38 80089638 6C01118E */  lw         $s1, 0x16C($s0)
/* 79E3C 8008963C 10004230 */  andi       $v0, $v0, 0x10
/* 79E40 80089640 0D004010 */  beqz       $v0, .L80089678
/* 79E44 80089644 00000000 */   nop
/* 79E48 80089648 0000228E */  lw         $v0, 0x0($s1)
/* 79E4C 8008964C 00000000 */  nop
/* 79E50 80089650 00014230 */  andi       $v0, $v0, 0x100
/* 79E54 80089654 05004014 */  bnez       $v0, .L8008966C
/* 79E58 80089658 05000524 */   addiu     $a1, $zero, 0x5
/* 79E5C 8008965C 91FE010C */  jal        MON_SwitchState
/* 79E60 80089660 0D000524 */   addiu     $a1, $zero, 0xD
/* 79E64 80089664 9E250208 */  j          .L80089678
/* 79E68 80089668 00000000 */   nop
.L8008966C:
/* 79E6C 8008966C 21200002 */  addu       $a0, $s0, $zero
/* 79E70 80089670 B6FF010C */  jal        MON_PlayAnim
/* 79E74 80089674 01000624 */   addiu     $a2, $zero, 0x1
.L80089678:
/* 79E78 80089678 9006020C */  jal        MON_GetTime
/* 79E7C 8008967C 21200002 */   addu      $a0, $s0, $zero
/* 79E80 80089680 1401238E */  lw         $v1, 0x114($s1)
/* 79E84 80089684 00000000 */  nop
/* 79E88 80089688 2B186200 */  sltu       $v1, $v1, $v0
/* 79E8C 8008968C 04006010 */  beqz       $v1, .L800896A0
/* 79E90 80089690 00000000 */   nop
/* 79E94 80089694 740100AE */  sw         $zero, 0x174($s0)
/* 79E98 80089698 780100AE */  sw         $zero, 0x178($s0)
/* 79E9C 8008969C 7C0100AE */  sw         $zero, 0x17C($s0)
.L800896A0:
/* 79EA0 800896A0 0000228E */  lw         $v0, 0x0($s1)
/* 79EA4 800896A4 00000000 */  nop
/* 79EA8 800896A8 00014230 */  andi       $v0, $v0, 0x100
/* 79EAC 800896AC 08004014 */  bnez       $v0, .L800896D0
/* 79EB0 800896B0 21200002 */   addu      $a0, $s0, $zero
/* 79EB4 800896B4 C3FF010C */  jal        MON_AnimPlaying
/* 79EB8 800896B8 0C000524 */   addiu     $a1, $zero, 0xC
/* 79EBC 800896BC 04004014 */  bnez       $v0, .L800896D0
/* 79EC0 800896C0 21200002 */   addu      $a0, $s0, $zero
/* 79EC4 800896C4 0C000524 */  addiu      $a1, $zero, 0xC
/* 79EC8 800896C8 B6FF010C */  jal        MON_PlayAnim
/* 79ECC 800896CC 01000624 */   addiu     $a2, $zero, 0x1
.L800896D0:
/* 79ED0 800896D0 0917020C */  jal        MON_DefaultQueueHandler
/* 79ED4 800896D4 21200002 */   addu      $a0, $s0, $zero
/* 79ED8 800896D8 21200002 */  addu       $a0, $s0, $zero
/* 79EDC 800896DC 21280000 */  addu       $a1, $zero, $zero
/* 79EE0 800896E0 2130A000 */  addu       $a2, $a1, $zero
/* 79EE4 800896E4 47DF010C */  jal        PHYSICS_StopIfCloseToTarget
/* 79EE8 800896E8 2138A000 */   addu      $a3, $a1, $zero
/* 79EEC 800896EC 21200002 */  addu       $a0, $s0, $zero
/* 79EF0 800896F0 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 79EF4 800896F4 4FDE010C */  jal        PhysicsMove
/* 79EF8 800896F8 5C000526 */   addiu     $a1, $s0, 0x5C
/* 79EFC 800896FC 9801038E */  lw         $v1, 0x198($s0)
/* 79F00 80089700 09000224 */  addiu      $v0, $zero, 0x9
/* 79F04 80089704 05006210 */  beq        $v1, $v0, .L8008971C
/* 79F08 80089708 DFFF0324 */   addiu     $v1, $zero, -0x21
/* 79F0C 8008970C 5800028E */  lw         $v0, 0x58($s0)
/* 79F10 80089710 00000000 */  nop
/* 79F14 80089714 24104300 */  and        $v0, $v0, $v1
/* 79F18 80089718 580002AE */  sw         $v0, 0x58($s0)
.L8008971C:
/* 79F1C 8008971C 1800BF8F */  lw         $ra, 0x18($sp)
/* 79F20 80089720 1400B18F */  lw         $s1, 0x14($sp)
/* 79F24 80089724 1000B08F */  lw         $s0, 0x10($sp)
/* 79F28 80089728 0800E003 */  jr         $ra
/* 79F2C 8008972C 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_Stunned, . - MON_Stunned
