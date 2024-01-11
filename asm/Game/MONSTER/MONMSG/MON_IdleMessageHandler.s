.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_IdleMessageHandler
/* 75450 80084C50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 75454 80084C54 1800B2AF */  sw         $s2, 0x18($sp)
/* 75458 80084C58 21908000 */  addu       $s2, $a0, $zero
/* 7545C 80084C5C 1000B0AF */  sw         $s0, 0x10($sp)
/* 75460 80084C60 2180A000 */  addu       $s0, $a1, $zero
/* 75464 80084C64 FFFE023C */  lui        $v0, (0xFEFFFFFE >> 16)
/* 75468 80084C68 FEFF4234 */  ori        $v0, $v0, (0xFEFFFFFE & 0xFFFF)
/* 7546C 80084C6C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 75470 80084C70 1400B1AF */  sw         $s1, 0x14($sp)
/* 75474 80084C74 0000038E */  lw         $v1, 0x0($s0)
/* 75478 80084C78 6C01518E */  lw         $s1, 0x16C($s2)
/* 7547C 80084C7C 21186200 */  addu       $v1, $v1, $v0
/* 75480 80084C80 2200622C */  sltiu      $v0, $v1, 0x22
/* 75484 80084C84 3A004010 */  beqz       $v0, .L80084D70
/* 75488 80084C88 0180023C */   lui       $v0, %hi(jtbl_80011FE0)
/* 7548C 80084C8C E01F4224 */  addiu      $v0, $v0, %lo(jtbl_80011FE0)
/* 75490 80084C90 80180300 */  sll        $v1, $v1, 2
/* 75494 80084C94 21186200 */  addu       $v1, $v1, $v0
/* 75498 80084C98 0000628C */  lw         $v0, 0x0($v1)
/* 7549C 80084C9C 00000000 */  nop
/* 754A0 80084CA0 08004000 */  jr         $v0
/* 754A4 80084CA4 00000000 */   nop
jlabel .L80084CA8
/* 754A8 80084CA8 0400028E */  lw         $v0, 0x4($s0)
/* 754AC 80084CAC 00000000 */  nop
/* 754B0 80084CB0 30004014 */  bnez       $v0, .L80084D74
/* 754B4 80084CB4 21204002 */   addu      $a0, $s2, $zero
/* 754B8 80084CB8 91FE010C */  jal        MON_SwitchState
/* 754BC 80084CBC 16000524 */   addiu     $a1, $zero, 0x16
/* 754C0 80084CC0 5D130208 */  j          .L80084D74
/* 754C4 80084CC4 21204002 */   addu      $a0, $s2, $zero
jlabel .L80084CC8
/* 754C8 80084CC8 0000228E */  lw         $v0, 0x0($s1)
/* 754CC 80084CCC 00000000 */  nop
/* 754D0 80084CD0 04004230 */  andi       $v0, $v0, 0x4
/* 754D4 80084CD4 29004014 */  bnez       $v0, .L80084D7C
/* 754D8 80084CD8 00000000 */   nop
/* 754DC 80084CDC 0400028E */  lw         $v0, 0x4($s0)
/* 754E0 80084CE0 00000000 */  nop
/* 754E4 80084CE4 0400448C */  lw         $a0, 0x4($v0)
/* 754E8 80084CE8 92D1000C */  jal        INSTANCE_Query
/* 754EC 80084CEC 01000524 */   addiu     $a1, $zero, 0x1
/* 754F0 80084CF0 01004230 */  andi       $v0, $v0, 0x1
/* 754F4 80084CF4 05004010 */  beqz       $v0, .L80084D0C
/* 754F8 80084CF8 21204002 */   addu      $a0, $s2, $zero
/* 754FC 80084CFC 5C012592 */  lbu        $a1, 0x15C($s1)
/* 75500 80084D00 D804020C */  jal        MON_ChangeBehavior
/* 75504 80084D04 21204002 */   addu      $a0, $s2, $zero
/* 75508 80084D08 21204002 */  addu       $a0, $s2, $zero
.L80084D0C:
/* 7550C 80084D0C 91FE010C */  jal        MON_SwitchState
/* 75510 80084D10 18000524 */   addiu     $a1, $zero, 0x18
/* 75514 80084D14 5F130208 */  j          .L80084D7C
/* 75518 80084D18 00000000 */   nop
jlabel .L80084D1C
/* 7551C 80084D1C 0000228E */  lw         $v0, 0x0($s1)
/* 75520 80084D20 00000000 */  nop
/* 75524 80084D24 04004230 */  andi       $v0, $v0, 0x4
/* 75528 80084D28 14004014 */  bnez       $v0, .L80084D7C
/* 7552C 80084D2C 00000000 */   nop
/* 75530 80084D30 0400028E */  lw         $v0, 0x4($s0)
/* 75534 80084D34 00000000 */  nop
/* 75538 80084D38 0400448C */  lw         $a0, 0x4($v0)
/* 7553C 80084D3C 92D1000C */  jal        INSTANCE_Query
/* 75540 80084D40 01000524 */   addiu     $a1, $zero, 0x1
/* 75544 80084D44 01004230 */  andi       $v0, $v0, 0x1
/* 75548 80084D48 05004010 */  beqz       $v0, .L80084D60
/* 7554C 80084D4C 21204002 */   addu      $a0, $s2, $zero
/* 75550 80084D50 5C012592 */  lbu        $a1, 0x15C($s1)
/* 75554 80084D54 D804020C */  jal        MON_ChangeBehavior
/* 75558 80084D58 21204002 */   addu      $a0, $s2, $zero
/* 7555C 80084D5C 21204002 */  addu       $a0, $s2, $zero
.L80084D60:
/* 75560 80084D60 91FE010C */  jal        MON_SwitchState
/* 75564 80084D64 19000524 */   addiu     $a1, $zero, 0x19
/* 75568 80084D68 5F130208 */  j          .L80084D7C
/* 7556C 80084D6C 00000000 */   nop
jlabel .L80084D70
/* 75570 80084D70 21204002 */  addu       $a0, $s2, $zero
.L80084D74:
/* 75574 80084D74 6513020C */  jal        MON_DefaultMessageHandler
/* 75578 80084D78 21280002 */   addu      $a1, $s0, $zero
.L80084D7C:
/* 7557C 80084D7C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 75580 80084D80 1800B28F */  lw         $s2, 0x18($sp)
/* 75584 80084D84 1400B18F */  lw         $s1, 0x14($sp)
/* 75588 80084D88 1000B08F */  lw         $s0, 0x10($sp)
/* 7558C 80084D8C 0800E003 */  jr         $ra
/* 75590 80084D90 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_IdleMessageHandler, . - MON_IdleMessageHandler
