.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_AddShortPointerToStack
/* 529BC 800621BC 0000838C */  lw         $v1, 0x0($a0)
/* 529C0 800621C0 00000000 */  nop
/* 529C4 800621C4 20006228 */  slti       $v0, $v1, 0x20
/* 529C8 800621C8 0C004010 */  beqz       $v0, .L800621FC
/* 529CC 800621CC C0100300 */   sll       $v0, $v1, 3
/* 529D0 800621D0 21104300 */  addu       $v0, $v0, $v1
/* 529D4 800621D4 80100200 */  sll        $v0, $v0, 2
/* 529D8 800621D8 04004224 */  addiu      $v0, $v0, 0x4
/* 529DC 800621DC 21108200 */  addu       $v0, $a0, $v0
/* 529E0 800621E0 0A000324 */  addiu      $v1, $zero, 0xA
/* 529E4 800621E4 000043AC */  sw         $v1, 0x0($v0)
/* 529E8 800621E8 040045AC */  sw         $a1, 0x4($v0)
/* 529EC 800621EC 0000828C */  lw         $v0, 0x0($a0)
/* 529F0 800621F0 00000000 */  nop
/* 529F4 800621F4 01004224 */  addiu      $v0, $v0, 0x1
/* 529F8 800621F8 000082AC */  sw         $v0, 0x0($a0)
.L800621FC:
/* 529FC 800621FC 0800E003 */  jr         $ra
/* 52A00 80062200 00000000 */   nop
.size EVENT_AddShortPointerToStack, . - EVENT_AddShortPointerToStack
