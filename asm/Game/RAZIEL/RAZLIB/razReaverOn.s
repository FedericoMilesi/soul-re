.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razReaverOn
/* 96614 800A5E14 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 96618 800A5E18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 9661C 800A5E1C 31004010 */  beqz       $v0, .L800A5EE4
/* 96620 800A5E20 1000BFAF */   sw        $ra, 0x10($sp)
/* 96624 800A5E24 2197020C */  jal        razGetHeldItem
/* 96628 800A5E28 00000000 */   nop
/* 9662C 800A5E2C 2E004014 */  bnez       $v0, .L800A5EE8
/* 96630 800A5E30 21100000 */   addu      $v0, $zero, $zero
/* 96634 800A5E34 0492020C */  jal        GetMaxHealth
/* 96638 800A5E38 00000000 */   nop
/* 9663C 800A5E3C 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 96640 800A5E40 00000000 */  nop
/* 96644 800A5E44 05006210 */  beq        $v1, $v0, .L800A5E5C
/* 96648 800A5E48 02000224 */   addiu     $v0, $zero, 0x2
/* 9664C 800A5E4C 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 96650 800A5E50 00000000 */  nop
/* 96654 800A5E54 24006214 */  bne        $v1, $v0, .L800A5EE8
/* 96658 800A5E58 21100000 */   addu      $v0, $zero, $zero
.L800A5E5C:
/* 9665C 800A5E5C 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 96660 800A5E60 92D1000C */  jal        INSTANCE_Query
/* 96664 800A5E64 28000524 */   addiu     $a1, $zero, 0x28
/* 96668 800A5E68 01004230 */  andi       $v0, $v0, 0x1
/* 9666C 800A5E6C 05004014 */  bnez       $v0, .L800A5E84
/* 96670 800A5E70 8000053C */   lui       $a1, (0x800100 >> 16)
/* 96674 800A5E74 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 96678 800A5E78 0001A534 */  ori        $a1, $a1, (0x800100 & 0xFFFF)
/* 9667C 800A5E7C A1D1000C */  jal        INSTANCE_Post
/* 96680 800A5E80 21300000 */   addu      $a2, $zero, $zero
.L800A5E84:
/* 96684 800A5E84 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 96688 800A5E88 00100224 */  addiu      $v0, $zero, 0x1000
/* 9668C 800A5E8C 1CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3EC)($gp)
/* 96690 800A5E90 02000224 */  addiu      $v0, $zero, 0x2
/* 96694 800A5E94 07006214 */  bne        $v1, $v0, .L800A5EB4
/* 96698 800A5E98 01000224 */   addiu     $v0, $zero, 0x1
/* 9669C 800A5E9C 64FA838F */  lw         $v1, %gp_rel(Raziel + 0x434)($gp)
/* 966A0 800A5EA0 00000000 */  nop
/* 966A4 800A5EA4 03006210 */  beq        $v1, $v0, .L800A5EB4
/* 966A8 800A5EA8 00000000 */   nop
/* 966AC 800A5EAC ED97020C */  jal        razReaverImbue
/* 966B0 800A5EB0 21204000 */   addu      $a0, $v0, $zero
.L800A5EB4:
/* 966B4 800A5EB4 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 966B8 800A5EB8 01000224 */  addiu      $v0, $zero, 0x1
/* 966BC 800A5EBC 0A006214 */  bne        $v1, $v0, .L800A5EE8
/* 966C0 800A5EC0 00000000 */   nop
/* 966C4 800A5EC4 64FA828F */  lw         $v0, %gp_rel(Raziel + 0x434)($gp)
/* 966C8 800A5EC8 00000000 */  nop
/* 966CC 800A5ECC 06004314 */  bne        $v0, $v1, .L800A5EE8
/* 966D0 800A5ED0 01000224 */   addiu     $v0, $zero, 0x1
/* 966D4 800A5ED4 ED97020C */  jal        razReaverImbue
/* 966D8 800A5ED8 02000424 */   addiu     $a0, $zero, 0x2
/* 966DC 800A5EDC BA970208 */  j          .L800A5EE8
/* 966E0 800A5EE0 01000224 */   addiu     $v0, $zero, 0x1
.L800A5EE4:
/* 966E4 800A5EE4 21100000 */  addu       $v0, $zero, $zero
.L800A5EE8:
/* 966E8 800A5EE8 1000BF8F */  lw         $ra, 0x10($sp)
/* 966EC 800A5EEC 00000000 */  nop
/* 966F0 800A5EF0 0800E003 */  jr         $ra
/* 966F4 800A5EF4 1800BD27 */   addiu     $sp, $sp, 0x18
.size razReaverOn, . - razReaverOn
