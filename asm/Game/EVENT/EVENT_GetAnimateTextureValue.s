.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetAnimateTextureValue
/* 57C98 80067498 01000624 */  addiu      $a2, $zero, 0x1
/* 57C9C 8006749C 0800828C */  lw         $v0, 0x8($a0)
/* 57CA0 800674A0 0000878C */  lw         $a3, 0x0($a0)
/* 57CA4 800674A4 21184600 */  addu       $v1, $v0, $a2
/* 57CA8 800674A8 2B00622C */  sltiu      $v0, $v1, 0x2B
/* 57CAC 800674AC 23004010 */  beqz       $v0, .L8006753C
/* 57CB0 800674B0 21280000 */   addu      $a1, $zero, $zero
/* 57CB4 800674B4 0180023C */  lui        $v0, %hi(jtbl_80011A20)
/* 57CB8 800674B8 201A4224 */  addiu      $v0, $v0, %lo(jtbl_80011A20)
/* 57CBC 800674BC 80180300 */  sll        $v1, $v1, 2
/* 57CC0 800674C0 21186200 */  addu       $v1, $v1, $v0
/* 57CC4 800674C4 0000628C */  lw         $v0, 0x0($v1)
/* 57CC8 800674C8 00000000 */  nop
/* 57CCC 800674CC 08004000 */  jr         $v0
/* 57CD0 800674D0 00000000 */   nop
jlabel .L800674D4
/* 57CD4 800674D4 0100C638 */  xori       $a2, $a2, 0x1
jlabel .L800674D8
/* 57CD8 800674D8 1400E28C */  lw         $v0, 0x14($a3)
/* 57CDC 800674DC 00000000 */  nop
/* 57CE0 800674E0 80004230 */  andi       $v0, $v0, 0x80
/* 57CE4 800674E4 15004014 */  bnez       $v0, .L8006753C
/* 57CE8 800674E8 2128C000 */   addu      $a1, $a2, $zero
/* 57CEC 800674EC 4F9D0108 */  j          .L8006753C
/* 57CF0 800674F0 0100A538 */   xori      $a1, $a1, 0x1
jlabel .L800674F4
/* 57CF4 800674F4 0400848C */  lw         $a0, 0x4($a0)
/* 57CF8 800674F8 00000000 */  nop
/* 57CFC 800674FC 0C008010 */  beqz       $a0, .L80067530
/* 57D00 80067500 04008424 */   addiu     $a0, $a0, 0x4
/* 57D04 80067504 6C00E284 */  lh         $v0, 0x6C($a3)
/* 57D08 80067508 0800838C */  lw         $v1, 0x8($a0)
/* 57D0C 8006750C 00000000 */  nop
/* 57D10 80067510 1A004300 */  div        $zero, $v0, $v1
/* 57D14 80067514 12100000 */  mflo       $v0
/* 57D18 80067518 0400838C */  lw         $v1, 0x4($a0)
/* 57D1C 8006751C 00000000 */  nop
/* 57D20 80067520 1A004300 */  div        $zero, $v0, $v1
/* 57D24 80067524 10280000 */  mfhi       $a1
/* 57D28 80067528 0800E003 */  jr         $ra
/* 57D2C 8006752C 2110A000 */   addu      $v0, $a1, $zero
.L80067530:
/* 57D30 80067530 4F9D0108 */  j          .L8006753C
/* 57D34 80067534 21280000 */   addu      $a1, $zero, $zero
jlabel .L80067538
/* 57D38 80067538 01000524 */  addiu      $a1, $zero, 0x1
jlabel .L8006753C
/* 57D3C 8006753C 2110A000 */  addu       $v0, $a1, $zero
/* 57D40 80067540 0800E003 */  jr         $ra
/* 57D44 80067544 00000000 */   nop
.size EVENT_GetAnimateTextureValue, . - EVENT_GetAnimateTextureValue
