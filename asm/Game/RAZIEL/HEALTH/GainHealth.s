.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GainHealth
/* 94D40 800A4540 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 94D44 800A4544 80100400 */  sll        $v0, $a0, 2
/* 94D48 800A4548 21104400 */  addu       $v0, $v0, $a0
/* 94D4C 800A454C C0100200 */  sll        $v0, $v0, 3
/* 94D50 800A4550 23104400 */  subu       $v0, $v0, $a0
/* 94D54 800A4554 00110200 */  sll        $v0, $v0, 4
/* 94D58 800A4558 21104400 */  addu       $v0, $v0, $a0
/* 94D5C 800A455C 40190200 */  sll        $v1, $v0, 5
/* 94D60 800A4560 02006104 */  bgez       $v1, .L800A456C
/* 94D64 800A4564 1000BFAF */   sw        $ra, 0x10($sp)
/* 94D68 800A4568 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L800A456C:
/* 94D6C 800A456C 2CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 94D70 800A4570 031B0300 */  sra        $v1, $v1, 12
/* 94D74 800A4574 21104300 */  addu       $v0, $v0, $v1
/* 94D78 800A4578 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 94D7C 800A457C 0492020C */  jal        GetMaxHealth
/* 94D80 800A4580 00000000 */   nop
/* 94D84 800A4584 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 94D88 800A4588 00000000 */  nop
/* 94D8C 800A458C 2A186200 */  slt        $v1, $v1, $v0
/* 94D90 800A4590 0A006014 */  bnez       $v1, .L800A45BC
/* 94D94 800A4594 01000224 */   addiu     $v0, $zero, 0x1
/* 94D98 800A4598 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 94D9C 800A459C 00000000 */  nop
/* 94DA0 800A45A0 06006214 */  bne        $v1, $v0, .L800A45BC
/* 94DA4 800A45A4 00000000 */   nop
/* 94DA8 800A45A8 0492020C */  jal        GetMaxHealth
/* 94DAC 800A45AC 00000000 */   nop
/* 94DB0 800A45B0 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 94DB4 800A45B4 8597020C */  jal        razReaverOn
/* 94DB8 800A45B8 00000000 */   nop
.L800A45BC:
/* 94DBC 800A45BC 1000BF8F */  lw         $ra, 0x10($sp)
/* 94DC0 800A45C0 00000000 */  nop
/* 94DC4 800A45C4 0800E003 */  jr         $ra
/* 94DC8 800A45C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size GainHealth, . - GainHealth
