.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ParseOpcode
/* 575D8 80066DD8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 575DC 80066DDC 1000B0AF */  sw         $s0, 0x10($sp)
/* 575E0 80066DE0 21808000 */  addu       $s0, $a0, $zero
/* 575E4 80066DE4 1400B1AF */  sw         $s1, 0x14($sp)
/* 575E8 80066DE8 2188A000 */  addu       $s1, $a1, $zero
/* 575EC 80066DEC 1800BFAF */  sw         $ra, 0x18($sp)
/* 575F0 80066DF0 00002296 */  lhu        $v0, 0x0($s1)
/* 575F4 80066DF4 02003126 */  addiu      $s1, $s1, 0x2
/* 575F8 80066DF8 5CA480AF */  sw         $zero, %gp_rel(MoveCodeStreamExtra)($gp)
/* 575FC 80066DFC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 57600 80066E00 00140200 */  sll        $v0, $v0, 16
/* 57604 80066E04 031C0200 */  sra        $v1, $v0, 16
/* 57608 80066E08 2000622C */  sltiu      $v0, $v1, 0x20
/* 5760C 80066E0C 89004010 */  beqz       $v0, .L80067034
/* 57610 80066E10 0000C0AC */   sw        $zero, 0x0($a2)
/* 57614 80066E14 0180023C */  lui        $v0, %hi(jtbl_80011408)
/* 57618 80066E18 08144224 */  addiu      $v0, $v0, %lo(jtbl_80011408)
/* 5761C 80066E1C 80180300 */  sll        $v1, $v1, 2
/* 57620 80066E20 21186200 */  addu       $v1, $v1, $v0
/* 57624 80066E24 0000628C */  lw         $v0, 0x0($v1)
/* 57628 80066E28 00000000 */  nop
/* 5762C 80066E2C 08004000 */  jr         $v0
/* 57630 80066E30 00000000 */   nop
jlabel .L80066E34
/* 57634 80066E34 00002586 */  lh         $a1, 0x0($s1)
/* 57638 80066E38 D087010C */  jal        EVENT_AddObjectToStack
/* 5763C 80066E3C 21200002 */   addu      $a0, $s0, $zero
/* 57640 80066E40 0D9C0108 */  j          .L80067034
/* 57644 80066E44 02003126 */   addiu     $s1, $s1, 0x2
jlabel .L80066E48
/* 57648 80066E48 21200002 */  addu       $a0, $s0, $zero
/* 5764C 80066E4C 00002586 */  lh         $a1, 0x0($s1)
/* 57650 80066E50 8188010C */  jal        EVENT_AddNumberToStack
/* 57654 80066E54 21300000 */   addu      $a2, $zero, $zero
/* 57658 80066E58 0D9C0108 */  j          .L80067034
/* 5765C 80066E5C 02003126 */   addiu     $s1, $s1, 0x2
jlabel .L80066E60
/* 57660 80066E60 21200002 */  addu       $a0, $s0, $zero
/* 57664 80066E64 00002586 */  lh         $a1, 0x0($s1)
/* 57668 80066E68 F78F010C */  jal        EVENT_ModifyObjectToStackWithAttribute
/* 5766C 80066E6C 21302002 */   addu      $a2, $s1, $zero
/* 57670 80066E70 0D9C0108 */  j          .L80067034
/* 57674 80066E74 02003126 */   addiu     $s1, $s1, 0x2
jlabel .L80066E78
/* 57678 80066E78 21200002 */  addu       $a0, $s0, $zero
/* 5767C 80066E7C FC9A010C */  jal        EVENT_DoStackMathOperation
/* 57680 80066E80 0A000524 */   addiu     $a1, $zero, 0xA
/* 57684 80066E84 0D9C0108 */  j          .L80067034
/* 57688 80066E88 00000000 */   nop
jlabel .L80066E8C
/* 5768C 80066E8C 21200002 */  addu       $a0, $s0, $zero
/* 57690 80066E90 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 57694 80066E94 0B000524 */   addiu     $a1, $zero, 0xB
/* 57698 80066E98 0D9C0108 */  j          .L80067034
/* 5769C 80066E9C 00000000 */   nop
jlabel .L80066EA0
/* 576A0 80066EA0 01000224 */  addiu      $v0, $zero, 0x1
/* 576A4 80066EA4 58CB91AF */  sw         $s1, %gp_rel(EventAbortedPosition)($gp)
/* 576A8 80066EA8 0D9C0108 */  j          .L80067034
/* 576AC 80066EAC 0000C2AC */   sw        $v0, 0x0($a2)
jlabel .L80066EB0
/* 576B0 80066EB0 21200002 */  addu       $a0, $s0, $zero
/* 576B4 80066EB4 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 576B8 80066EB8 0C000524 */   addiu     $a1, $zero, 0xC
/* 576BC 80066EBC 0D9C0108 */  j          .L80067034
/* 576C0 80066EC0 00000000 */   nop
jlabel .L80066EC4
/* 576C4 80066EC4 21200002 */  addu       $a0, $s0, $zero
/* 576C8 80066EC8 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 576CC 80066ECC 01000524 */   addiu     $a1, $zero, 0x1
/* 576D0 80066ED0 0D9C0108 */  j          .L80067034
/* 576D4 80066ED4 00000000 */   nop
jlabel .L80066ED8
/* 576D8 80066ED8 21200002 */  addu       $a0, $s0, $zero
/* 576DC 80066EDC FC9A010C */  jal        EVENT_DoStackMathOperation
/* 576E0 80066EE0 02000524 */   addiu     $a1, $zero, 0x2
/* 576E4 80066EE4 0D9C0108 */  j          .L80067034
/* 576E8 80066EE8 00000000 */   nop
jlabel .L80066EEC
/* 576EC 80066EEC 21200002 */  addu       $a0, $s0, $zero
/* 576F0 80066EF0 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 576F4 80066EF4 03000524 */   addiu     $a1, $zero, 0x3
/* 576F8 80066EF8 0D9C0108 */  j          .L80067034
/* 576FC 80066EFC 00000000 */   nop
jlabel .L80066F00
/* 57700 80066F00 21200002 */  addu       $a0, $s0, $zero
/* 57704 80066F04 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 57708 80066F08 04000524 */   addiu     $a1, $zero, 0x4
/* 5770C 80066F0C 0D9C0108 */  j          .L80067034
/* 57710 80066F10 00000000 */   nop
jlabel .L80066F14
/* 57714 80066F14 21200002 */  addu       $a0, $s0, $zero
/* 57718 80066F18 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 5771C 80066F1C 05000524 */   addiu     $a1, $zero, 0x5
/* 57720 80066F20 0D9C0108 */  j          .L80067034
/* 57724 80066F24 00000000 */   nop
jlabel .L80066F28
/* 57728 80066F28 FE88010C */  jal        EVENT_StackDuplicate
/* 5772C 80066F2C 21200002 */   addu      $a0, $s0, $zero
/* 57730 80066F30 21200002 */  addu       $a0, $s0, $zero
/* 57734 80066F34 01000524 */  addiu      $a1, $zero, 0x1
/* 57738 80066F38 8188010C */  jal        EVENT_AddNumberToStack
/* 5773C 80066F3C 21300000 */   addu      $a2, $zero, $zero
/* 57740 80066F40 21200002 */  addu       $a0, $s0, $zero
/* 57744 80066F44 DB9B0108 */  j          .L80066F6C
/* 57748 80066F48 01000524 */   addiu     $a1, $zero, 0x1
jlabel .L80066F4C
/* 5774C 80066F4C FE88010C */  jal        EVENT_StackDuplicate
/* 57750 80066F50 21200002 */   addu      $a0, $s0, $zero
/* 57754 80066F54 21200002 */  addu       $a0, $s0, $zero
/* 57758 80066F58 01000524 */  addiu      $a1, $zero, 0x1
/* 5775C 80066F5C 8188010C */  jal        EVENT_AddNumberToStack
/* 57760 80066F60 21300000 */   addu      $a2, $zero, $zero
/* 57764 80066F64 21200002 */  addu       $a0, $s0, $zero
/* 57768 80066F68 02000524 */  addiu      $a1, $zero, 0x2
.L80066F6C:
/* 5776C 80066F6C FC9A010C */  jal        EVENT_DoStackMathOperation
/* 57770 80066F70 00000000 */   nop
jlabel .L80066F74
/* 57774 80066F74 21200002 */  addu       $a0, $s0, $zero
/* 57778 80066F78 2298010C */  jal        EVENT_DoStackOperationEquals
/* 5777C 80066F7C 21282002 */   addu      $a1, $s1, $zero
/* 57780 80066F80 0D9C0108 */  j          .L80067034
/* 57784 80066F84 00000000 */   nop
jlabel .L80066F88
/* 57788 80066F88 21200002 */  addu       $a0, $s0, $zero
/* 5778C 80066F8C FC9A010C */  jal        EVENT_DoStackMathOperation
/* 57790 80066F90 06000524 */   addiu     $a1, $zero, 0x6
/* 57794 80066F94 0D9C0108 */  j          .L80067034
/* 57798 80066F98 00000000 */   nop
jlabel .L80066F9C
/* 5779C 80066F9C 21200002 */  addu       $a0, $s0, $zero
/* 577A0 80066FA0 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 577A4 80066FA4 08000524 */   addiu     $a1, $zero, 0x8
/* 577A8 80066FA8 0D9C0108 */  j          .L80067034
/* 577AC 80066FAC 00000000 */   nop
jlabel .L80066FB0
/* 577B0 80066FB0 21200002 */  addu       $a0, $s0, $zero
/* 577B4 80066FB4 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 577B8 80066FB8 07000524 */   addiu     $a1, $zero, 0x7
/* 577BC 80066FBC 0D9C0108 */  j          .L80067034
/* 577C0 80066FC0 00000000 */   nop
jlabel .L80066FC4
/* 577C4 80066FC4 21200002 */  addu       $a0, $s0, $zero
/* 577C8 80066FC8 FC9A010C */  jal        EVENT_DoStackMathOperation
/* 577CC 80066FCC 09000524 */   addiu     $a1, $zero, 0x9
/* 577D0 80066FD0 0D9C0108 */  j          .L80067034
/* 577D4 80066FD4 00000000 */   nop
jlabel .L80066FD8
/* 577D8 80066FD8 0D9C0108 */  j          .L80067034
/* 577DC 80066FDC 21880000 */   addu      $s1, $zero, $zero
jlabel .L80066FE0
/* 577E0 80066FE0 A787010C */  jal        EVENT_AddGameObjectToStack
/* 577E4 80066FE4 21200002 */   addu      $a0, $s0, $zero
/* 577E8 80066FE8 0D9C0108 */  j          .L80067034
/* 577EC 80066FEC 00000000 */   nop
jlabel .L80066FF0
/* 577F0 80066FF0 BA87010C */  jal        EVENT_AddPlayerObjectToStack
/* 577F4 80066FF4 21200002 */   addu      $a0, $s0, $zero
/* 577F8 80066FF8 0D9C0108 */  j          .L80067034
/* 577FC 80066FFC 00000000 */   nop
jlabel .L80067000
/* 57800 80067000 00002586 */  lh         $a1, 0x0($s1)
/* 57804 80067004 DB88010C */  jal        EVENT_AddSubListObjectToStack
/* 57808 80067008 21200002 */   addu      $a0, $s0, $zero
/* 5780C 8006700C 0D9C0108 */  j          .L80067034
/* 57810 80067010 02003126 */   addiu     $s1, $s1, 0x2
jlabel .L80067014
/* 57814 80067014 54CB838F */  lw         $v1, %gp_rel(currentActionScript)($gp)
/* 57818 80067018 00000000 */  nop
/* 5781C 8006701C 05006010 */  beqz       $v1, .L80067034
/* 57820 80067020 00000000 */   nop
/* 57824 80067024 02006294 */  lhu        $v0, 0x2($v1)
/* 57828 80067028 00000000 */  nop
/* 5782C 8006702C 02004234 */  ori        $v0, $v0, 0x2
/* 57830 80067030 020062A4 */  sh         $v0, 0x2($v1)
jlabel .L80067034
/* 57834 80067034 5CA4828F */  lw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 57838 80067038 1800BF8F */  lw         $ra, 0x18($sp)
/* 5783C 8006703C 1000B08F */  lw         $s0, 0x10($sp)
/* 57840 80067040 40100200 */  sll        $v0, $v0, 1
/* 57844 80067044 21102202 */  addu       $v0, $s1, $v0
/* 57848 80067048 1400B18F */  lw         $s1, 0x14($sp)
/* 5784C 8006704C 0800E003 */  jr         $ra
/* 57850 80067050 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_ParseOpcode, . - EVENT_ParseOpcode
