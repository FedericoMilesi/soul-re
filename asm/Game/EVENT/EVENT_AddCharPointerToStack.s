.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_AddCharPointerToStack
/* 52974 80062174 0000838C */  lw         $v1, 0x0($a0)
/* 52978 80062178 00000000 */  nop
/* 5297C 8006217C 20006228 */  slti       $v0, $v1, 0x20
/* 52980 80062180 0C004010 */  beqz       $v0, .L800621B4
/* 52984 80062184 C0100300 */   sll       $v0, $v1, 3
/* 52988 80062188 21104300 */  addu       $v0, $v0, $v1
/* 5298C 8006218C 80100200 */  sll        $v0, $v0, 2
/* 52990 80062190 04004224 */  addiu      $v0, $v0, 0x4
/* 52994 80062194 21108200 */  addu       $v0, $a0, $v0
/* 52998 80062198 1C000324 */  addiu      $v1, $zero, 0x1C
/* 5299C 8006219C 000043AC */  sw         $v1, 0x0($v0)
/* 529A0 800621A0 040045AC */  sw         $a1, 0x4($v0)
/* 529A4 800621A4 0000828C */  lw         $v0, 0x0($a0)
/* 529A8 800621A8 00000000 */  nop
/* 529AC 800621AC 01004224 */  addiu      $v0, $v0, 0x1
/* 529B0 800621B0 000082AC */  sw         $v0, 0x0($a0)
.L800621B4:
/* 529B4 800621B4 0800E003 */  jr         $ra
/* 529B8 800621B8 00000000 */   nop
.size EVENT_AddCharPointerToStack, . - EVENT_AddCharPointerToStack
