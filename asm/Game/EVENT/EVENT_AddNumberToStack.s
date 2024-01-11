.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_AddNumberToStack
/* 52A04 80062204 0000838C */  lw         $v1, 0x0($a0)
/* 52A08 80062208 00000000 */  nop
/* 52A0C 8006220C 20006228 */  slti       $v0, $v1, 0x20
/* 52A10 80062210 0E004010 */  beqz       $v0, .L8006224C
/* 52A14 80062214 C0100300 */   sll       $v0, $v1, 3
/* 52A18 80062218 21104300 */  addu       $v0, $v0, $v1
/* 52A1C 8006221C 80100200 */  sll        $v0, $v0, 2
/* 52A20 80062220 04004224 */  addiu      $v0, $v0, 0x4
/* 52A24 80062224 21108200 */  addu       $v0, $a0, $v0
/* 52A28 80062228 07000324 */  addiu      $v1, $zero, 0x7
/* 52A2C 8006222C 000043AC */  sw         $v1, 0x0($v0)
/* 52A30 80062230 040045AC */  sw         $a1, 0x4($v0)
/* 52A34 80062234 080040AC */  sw         $zero, 0x8($v0)
/* 52A38 80062238 0C0046A4 */  sh         $a2, 0xC($v0)
/* 52A3C 8006223C 0000828C */  lw         $v0, 0x0($a0)
/* 52A40 80062240 00000000 */  nop
/* 52A44 80062244 01004224 */  addiu      $v0, $v0, 0x1
/* 52A48 80062248 000082AC */  sw         $v0, 0x0($a0)
.L8006224C:
/* 52A4C 8006224C 0800E003 */  jr         $ra
/* 52A50 80062250 00000000 */   nop
.size EVENT_AddNumberToStack, . - EVENT_AddNumberToStack
