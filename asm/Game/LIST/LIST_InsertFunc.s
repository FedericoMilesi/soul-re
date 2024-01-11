.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LIST_InsertFunc
/* 40354 8004FB54 0000A4AC */  sw         $a0, 0x0($a1)
/* 40358 8004FB58 0400828C */  lw         $v0, 0x4($a0)
/* 4035C 8004FB5C 00000000 */  nop
/* 40360 8004FB60 0400A2AC */  sw         $v0, 0x4($a1)
/* 40364 8004FB64 0400828C */  lw         $v0, 0x4($a0)
/* 40368 8004FB68 00000000 */  nop
/* 4036C 8004FB6C 02004010 */  beqz       $v0, .L8004FB78
/* 40370 8004FB70 00000000 */   nop
/* 40374 8004FB74 000045AC */  sw         $a1, 0x0($v0)
.L8004FB78:
/* 40378 8004FB78 0800E003 */  jr         $ra
/* 4037C 8004FB7C 040085AC */   sw        $a1, 0x4($a0)
.size LIST_InsertFunc, . - LIST_InsertFunc
