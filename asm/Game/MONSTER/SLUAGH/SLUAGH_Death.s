.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SLUAGH_Death
/* 7DE10 8008D610 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7DE14 8008D614 1000B0AF */  sw         $s0, 0x10($sp)
/* 7DE18 8008D618 21808000 */  addu       $s0, $a0, $zero
/* 7DE1C 8008D61C 1400BFAF */  sw         $ra, 0x14($sp)
/* 7DE20 8008D620 1800028E */  lw         $v0, 0x18($s0)
/* 7DE24 8008D624 00000000 */  nop
/* 7DE28 8008D628 10004230 */  andi       $v0, $v0, 0x10
/* 7DE2C 8008D62C 03004010 */  beqz       $v0, .L8008D63C
/* 7DE30 8008D630 18000524 */   addiu     $a1, $zero, 0x18
/* 7DE34 8008D634 B6FF010C */  jal        MON_PlayAnim
/* 7DE38 8008D638 02000624 */   addiu     $a2, $zero, 0x2
.L8008D63C:
/* 7DE3C 8008D63C 1800028E */  lw         $v0, 0x18($s0)
/* 7DE40 8008D640 00000000 */  nop
/* 7DE44 8008D644 02004230 */  andi       $v0, $v0, 0x2
/* 7DE48 8008D648 0D004010 */  beqz       $v0, .L8008D680
/* 7DE4C 8008D64C 00000000 */   nop
/* 7DE50 8008D650 6C01028E */  lw         $v0, 0x16C($s0)
/* 7DE54 8008D654 00000000 */  nop
/* 7DE58 8008D658 C400428C */  lw         $v0, 0xC4($v0)
/* 7DE5C 8008D65C 00000000 */  nop
/* 7DE60 8008D660 03004010 */  beqz       $v0, .L8008D670
/* 7DE64 8008D664 13000524 */   addiu     $a1, $zero, 0x13
/* 7DE68 8008D668 9E350208 */  j          .L8008D678
/* 7DE6C 8008D66C 21200002 */   addu      $a0, $s0, $zero
.L8008D670:
/* 7DE70 8008D670 21200002 */  addu       $a0, $s0, $zero
/* 7DE74 8008D674 02000524 */  addiu      $a1, $zero, 0x2
.L8008D678:
/* 7DE78 8008D678 91FE010C */  jal        MON_SwitchState
/* 7DE7C 8008D67C 00000000 */   nop
.L8008D680:
/* 7DE80 8008D680 0917020C */  jal        MON_DefaultQueueHandler
/* 7DE84 8008D684 21200002 */   addu      $a0, $s0, $zero
/* 7DE88 8008D688 1400BF8F */  lw         $ra, 0x14($sp)
/* 7DE8C 8008D68C 1000B08F */  lw         $s0, 0x10($sp)
/* 7DE90 8008D690 0800E003 */  jr         $ra
/* 7DE94 8008D694 1800BD27 */   addiu     $sp, $sp, 0x18
.size SLUAGH_Death, . - SLUAGH_Death
