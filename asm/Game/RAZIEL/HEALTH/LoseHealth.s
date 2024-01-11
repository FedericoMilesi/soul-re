.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoseHealth
/* 94DCC 800A45CC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 94DD0 800A45D0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 94DD4 800A45D4 0001033C */  lui        $v1, (0x1000000 >> 16)
/* 94DD8 800A45D8 24104300 */  and        $v0, $v0, $v1
/* 94DDC 800A45DC 36004014 */  bnez       $v0, .L800A46B8
/* 94DE0 800A45E0 1000BFAF */   sw        $ra, 0x10($sp)
/* 94DE4 800A45E4 34FA828F */  lw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* 94DE8 800A45E8 00000000 */  nop
/* 94DEC 800A45EC 32004014 */  bnez       $v0, .L800A46B8
/* 94DF0 800A45F0 00000000 */   nop
/* 94DF4 800A45F4 2CFA858F */  lw         $a1, %gp_rel(Raziel + 0x3FC)($gp)
/* 94DF8 800A45F8 00000000 */  nop
/* 94DFC 800A45FC 0E02A228 */  slti       $v0, $a1, 0x20E
/* 94E00 800A4600 2D004014 */  bnez       $v0, .L800A46B8
/* 94E04 800A4604 80100400 */   sll       $v0, $a0, 2
/* 94E08 800A4608 21104400 */  addu       $v0, $v0, $a0
/* 94E0C 800A460C C0100200 */  sll        $v0, $v0, 3
/* 94E10 800A4610 23104400 */  subu       $v0, $v0, $a0
/* 94E14 800A4614 00110200 */  sll        $v0, $v0, 4
/* 94E18 800A4618 21104400 */  addu       $v0, $v0, $a0
/* 94E1C 800A461C 40190200 */  sll        $v1, $v0, 5
/* 94E20 800A4620 02006104 */  bgez       $v1, .L800A462C
/* 94E24 800A4624 21106000 */   addu      $v0, $v1, $zero
/* 94E28 800A4628 FF0F6224 */  addiu      $v0, $v1, 0xFFF
.L800A462C:
/* 94E2C 800A462C 03230200 */  sra        $a0, $v0, 12
/* 94E30 800A4630 2310A400 */  subu       $v0, $a1, $a0
/* 94E34 800A4634 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 94E38 800A4638 30FA828F */  lw         $v0, %gp_rel(Raziel + 0x400)($gp)
/* 94E3C 800A463C E8FB838F */  lw         $v1, %gp_rel(PlayerData)($gp)
/* 94E40 800A4640 23104400 */  subu       $v0, $v0, $a0
/* 94E44 800A4644 30FA82AF */  sw         $v0, %gp_rel(Raziel + 0x400)($gp)
/* 94E48 800A4648 34006384 */  lh         $v1, 0x34($v1)
/* 94E4C 800A464C 00000000 */  nop
/* 94E50 800A4650 00110300 */  sll        $v0, $v1, 4
/* 94E54 800A4654 23104300 */  subu       $v0, $v0, $v1
/* 94E58 800A4658 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 94E5C 800A465C 40130200 */  sll        $v0, $v0, 13
/* 94E60 800A4660 34FA82AF */  sw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* 94E64 800A4664 01000224 */  addiu      $v0, $zero, 0x1
/* 94E68 800A4668 0C006214 */  bne        $v1, $v0, .L800A469C
/* 94E6C 800A466C 00000000 */   nop
/* 94E70 800A4670 6397020C */  jal        razReaverOff
/* 94E74 800A4674 00000000 */   nop
/* 94E78 800A4678 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 94E7C 800A467C 00000000 */  nop
/* 94E80 800A4680 06008010 */  beqz       $a0, .L800A469C
/* 94E84 800A4684 8000053C */   lui       $a1, (0x800101 >> 16)
/* 94E88 800A4688 0101A534 */  ori        $a1, $a1, (0x800101 & 0xFFFF)
/* 94E8C 800A468C A1D1000C */  jal        INSTANCE_Post
/* 94E90 800A4690 21300000 */   addu      $a2, $zero, $zero
/* 94E94 800A4694 ED97020C */  jal        razReaverImbue
/* 94E98 800A4698 02000424 */   addiu     $a0, $zero, 0x2
.L800A469C:
/* 94E9C 800A469C 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 94EA0 800A46A0 00000000 */  nop
/* 94EA4 800A46A4 80004230 */  andi       $v0, $v0, 0x80
/* 94EA8 800A46A8 03004014 */  bnez       $v0, .L800A46B8
/* 94EAC 800A46AC 01000424 */   addiu     $a0, $zero, 0x1
/* 94EB0 800A46B0 EAC5000C */  jal        GAMEPAD_Shock0
/* 94EB4 800A46B4 28230524 */   addiu     $a1, $zero, 0x2328
.L800A46B8:
/* 94EB8 800A46B8 1000BF8F */  lw         $ra, 0x10($sp)
/* 94EBC 800A46BC 00000000 */  nop
/* 94EC0 800A46C0 0800E003 */  jr         $ra
/* 94EC4 800A46C4 1800BD27 */   addiu     $sp, $sp, 0x18
.size LoseHealth, . - LoseHealth
