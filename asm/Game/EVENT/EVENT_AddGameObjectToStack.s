.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_AddGameObjectToStack
/* 5269C 80061E9C 0000838C */  lw         $v1, 0x0($a0)
/* 526A0 80061EA0 00000000 */  nop
/* 526A4 80061EA4 20006228 */  slti       $v0, $v1, 0x20
/* 526A8 80061EA8 0D004010 */  beqz       $v0, .L80061EE0
/* 526AC 80061EAC C0100300 */   sll       $v0, $v1, 3
/* 526B0 80061EB0 21104300 */  addu       $v0, $v0, $v1
/* 526B4 80061EB4 80100200 */  sll        $v0, $v0, 2
/* 526B8 80061EB8 04004224 */  addiu      $v0, $v0, 0x4
/* 526BC 80061EBC 21108200 */  addu       $v0, $a0, $v0
/* 526C0 80061EC0 03000324 */  addiu      $v1, $zero, 0x3
/* 526C4 80061EC4 000043AC */  sw         $v1, 0x0($v0)
/* 526C8 80061EC8 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 526CC 80061ECC 040043AC */  sw         $v1, 0x4($v0)
/* 526D0 80061ED0 0000828C */  lw         $v0, 0x0($a0)
/* 526D4 80061ED4 00000000 */  nop
/* 526D8 80061ED8 01004224 */  addiu      $v0, $v0, 0x1
/* 526DC 80061EDC 000082AC */  sw         $v0, 0x0($a0)
.L80061EE0:
/* 526E0 80061EE0 0800E003 */  jr         $ra
/* 526E4 80061EE4 00000000 */   nop
.size EVENT_AddGameObjectToStack, . - EVENT_AddGameObjectToStack
