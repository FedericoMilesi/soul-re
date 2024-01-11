.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_AddSubListObjectToStack
/* 52B6C 8006236C 0000838C */  lw         $v1, 0x0($a0)
/* 52B70 80062370 00000000 */  nop
/* 52B74 80062374 20006228 */  slti       $v0, $v1, 0x20
/* 52B78 80062378 1D004010 */  beqz       $v0, .L800623F0
/* 52B7C 8006237C C0100300 */   sll       $v0, $v1, 3
/* 52B80 80062380 21104300 */  addu       $v0, $v0, $v1
/* 52B84 80062384 80100200 */  sll        $v0, $v0, 2
/* 52B88 80062388 04004224 */  addiu      $v0, $v0, 0x4
/* 52B8C 8006238C 21388200 */  addu       $a3, $a0, $v0
/* 52B90 80062390 16000224 */  addiu      $v0, $zero, 0x16
/* 52B94 80062394 80180500 */  sll        $v1, $a1, 2
/* 52B98 80062398 0000E2AC */  sw         $v0, 0x0($a3)
/* 52B9C 8006239C 38CE8227 */  addiu      $v0, $gp, %gp_rel(eventListNumInstances)
/* 52BA0 800623A0 21306200 */  addu       $a2, $v1, $v0
/* 52BA4 800623A4 0000C28C */  lw         $v0, 0x0($a2)
/* 52BA8 800623A8 00000000 */  nop
/* 52BAC 800623AC 07004018 */  blez       $v0, .L800623CC
/* 52BB0 800623B0 00000000 */   nop
/* 52BB4 800623B4 21106500 */  addu       $v0, $v1, $a1
/* 52BB8 800623B8 C0100200 */  sll        $v0, $v0, 3
/* 52BBC 800623BC 28CF8327 */  addiu      $v1, $gp, %gp_rel(eventListArray)
/* 52BC0 800623C0 21104300 */  addu       $v0, $v0, $v1
/* 52BC4 800623C4 F4880108 */  j          .L800623D0
/* 52BC8 800623C8 0400E2AC */   sw        $v0, 0x4($a3)
.L800623CC:
/* 52BCC 800623CC 0400E0AC */  sw         $zero, 0x4($a3)
.L800623D0:
/* 52BD0 800623D0 0000C28C */  lw         $v0, 0x0($a2)
/* 52BD4 800623D4 00000000 */  nop
/* 52BD8 800623D8 0800E2AC */  sw         $v0, 0x8($a3)
/* 52BDC 800623DC 0C00E0AC */  sw         $zero, 0xC($a3)
/* 52BE0 800623E0 0000828C */  lw         $v0, 0x0($a0)
/* 52BE4 800623E4 00000000 */  nop
/* 52BE8 800623E8 01004224 */  addiu      $v0, $v0, 0x1
/* 52BEC 800623EC 000082AC */  sw         $v0, 0x0($a0)
.L800623F0:
/* 52BF0 800623F0 0800E003 */  jr         $ra
/* 52BF4 800623F4 21100000 */   addu      $v0, $zero, $zero
.size EVENT_AddSubListObjectToStack, . - EVENT_AddSubListObjectToStack
