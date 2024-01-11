.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessRazControl
/* 61408 80070C08 0000828C */  lw         $v0, 0x0($a0)
/* 6140C 80070C0C 8CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x8)($gp)
/* 61410 80070C10 00000000 */  nop
/* 61414 80070C14 24104300 */  and        $v0, $v0, $v1
/* 61418 80070C18 07004010 */  beqz       $v0, .L80070C38
/* 6141C 80070C1C 00000000 */   nop
/* 61420 80070C20 B4A4828F */  lw         $v0, %gp_rel(Down)($gp)
/* 61424 80070C24 B0A480AF */  sw         $zero, %gp_rel(Up)($gp)
/* 61428 80070C28 01004224 */  addiu      $v0, $v0, 0x1
/* 6142C 80070C2C B4A482AF */  sw         $v0, %gp_rel(Down)($gp)
/* 61430 80070C30 16C30108 */  j          .L80070C58
/* 61434 80070C34 00000000 */   nop
.L80070C38:
/* 61438 80070C38 B0A4828F */  lw         $v0, %gp_rel(Up)($gp)
/* 6143C 80070C3C B4A4838F */  lw         $v1, %gp_rel(Down)($gp)
/* 61440 80070C40 01004224 */  addiu      $v0, $v0, 0x1
/* 61444 80070C44 B0A482AF */  sw         $v0, %gp_rel(Up)($gp)
/* 61448 80070C48 02006010 */  beqz       $v1, .L80070C54
/* 6144C 80070C4C 00000000 */   nop
/* 61450 80070C50 ACA483AF */  sw         $v1, %gp_rel(Pending)($gp)
.L80070C54:
/* 61454 80070C54 B4A480AF */  sw         $zero, %gp_rel(Down)($gp)
.L80070C58:
/* 61458 80070C58 B4A4838F */  lw         $v1, %gp_rel(Down)($gp)
/* 6145C 80070C5C 00000000 */  nop
/* 61460 80070C60 06006228 */  slti       $v0, $v1, 0x6
/* 61464 80070C64 02004014 */  bnez       $v0, .L80070C70
/* 61468 80070C68 00000000 */   nop
/* 6146C 80070C6C ACA483AF */  sw         $v1, %gp_rel(Pending)($gp)
.L80070C70:
/* 61470 80070C70 B0A4828F */  lw         $v0, %gp_rel(Up)($gp)
/* 61474 80070C74 00000000 */  nop
/* 61478 80070C78 03004228 */  slti       $v0, $v0, 0x3
/* 6147C 80070C7C 02004014 */  bnez       $v0, .L80070C88
/* 61480 80070C80 00000000 */   nop
/* 61484 80070C84 ACA480AF */  sw         $zero, %gp_rel(Pending)($gp)
.L80070C88:
/* 61488 80070C88 0800E003 */  jr         $ra
/* 6148C 80070C8C 00000000 */   nop
.size ProcessRazControl, . - ProcessRazControl
