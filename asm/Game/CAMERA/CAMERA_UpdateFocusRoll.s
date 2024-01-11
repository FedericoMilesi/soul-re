.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_UpdateFocusRoll
/* CDD4 8001C5D4 548E838F */  lw         $v1, %gp_rel(roll_inc)($gp)
/* CDD8 8001C5D8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* CDDC 8001C5DC 1400B1AF */  sw         $s1, 0x14($sp)
/* CDE0 8001C5E0 21888000 */  addu       $s1, $a0, $zero
/* CDE4 8001C5E4 1800BFAF */  sw         $ra, 0x18($sp)
/* CDE8 8001C5E8 35006010 */  beqz       $v1, .L8001C6C0
/* CDEC 8001C5EC 1000B0AF */   sw        $s0, 0x10($sp)
/* CDF0 8001C5F0 08C0848F */  lw         $a0, %gp_rel(gameTrackerX + 0x240)($gp)
/* CDF4 8001C5F4 00100224 */  addiu      $v0, $zero, 0x1000
/* CDF8 8001C5F8 0B008210 */  beq        $a0, $v0, .L8001C628
/* CDFC 8001C5FC 21806000 */   addu      $s0, $v1, $zero
/* CE00 8001C600 02006104 */  bgez       $v1, .L8001C60C
/* CE04 8001C604 21106000 */   addu      $v0, $v1, $zero
/* CE08 8001C608 1F006224 */  addiu      $v0, $v1, 0x1F
.L8001C60C:
/* CE0C 8001C60C 43110200 */  sra        $v0, $v0, 5
/* CE10 8001C610 18004400 */  mult       $v0, $a0
/* CE14 8001C614 12100000 */  mflo       $v0
/* CE18 8001C618 03004104 */  bgez       $v0, .L8001C628
/* CE1C 8001C61C C3810200 */   sra       $s0, $v0, 7
/* CE20 8001C620 7F004224 */  addiu      $v0, $v0, 0x7F
/* CE24 8001C624 C3810200 */  sra        $s0, $v0, 7
.L8001C628:
/* CE28 8001C628 508E828F */  lw         $v0, %gp_rel(current_roll_amount)($gp)
/* CE2C 8001C62C 00000000 */  nop
/* CE30 8001C630 02004104 */  bgez       $v0, .L8001C63C
/* CE34 8001C634 00000000 */   nop
/* CE38 8001C638 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8001C63C:
/* CE3C 8001C63C 4C8E858F */  lw         $a1, %gp_rel(roll_target)($gp)
/* CE40 8001C640 00110200 */  sll        $v0, $v0, 4
/* CE44 8001C644 0200A104 */  bgez       $a1, .L8001C650
/* CE48 8001C648 03240200 */   sra       $a0, $v0, 16
/* CE4C 8001C64C FF0FA524 */  addiu      $a1, $a1, 0xFFF
.L8001C650:
/* CE50 8001C650 00290500 */  sll        $a1, $a1, 4
/* CE54 8001C654 BC59000C */  jal        CAMERA_AngleDifference
/* CE58 8001C658 032C0500 */   sra       $a1, $a1, 16
/* CE5C 8001C65C 21180002 */  addu       $v1, $s0, $zero
/* CE60 8001C660 00140200 */  sll        $v0, $v0, 16
/* CE64 8001C664 02000106 */  bgez       $s0, .L8001C670
/* CE68 8001C668 03240200 */   sra       $a0, $v0, 16
/* CE6C 8001C66C FF0F0326 */  addiu      $v1, $s0, 0xFFF
.L8001C670:
/* CE70 8001C670 03130300 */  sra        $v0, $v1, 12
/* CE74 8001C674 02004104 */  bgez       $v0, .L8001C680
/* CE78 8001C678 00000000 */   nop
/* CE7C 8001C67C 23100200 */  negu       $v0, $v0
.L8001C680:
/* CE80 8001C680 2A104400 */  slt        $v0, $v0, $a0
/* CE84 8001C684 05004014 */  bnez       $v0, .L8001C69C
/* CE88 8001C688 00000000 */   nop
/* CE8C 8001C68C 4C8E828F */  lw         $v0, %gp_rel(roll_target)($gp)
/* CE90 8001C690 548E80AF */  sw         $zero, %gp_rel(roll_inc)($gp)
/* CE94 8001C694 AA710008 */  j          .L8001C6A8
/* CE98 8001C698 00000000 */   nop
.L8001C69C:
/* CE9C 8001C69C 508E828F */  lw         $v0, %gp_rel(current_roll_amount)($gp)
/* CEA0 8001C6A0 00000000 */  nop
/* CEA4 8001C6A4 21105000 */  addu       $v0, $v0, $s0
.L8001C6A8:
/* CEA8 8001C6A8 508E82AF */  sw         $v0, %gp_rel(current_roll_amount)($gp)
/* CEAC 8001C6AC FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* CEB0 8001C6B0 508E828F */  lw         $v0, %gp_rel(current_roll_amount)($gp)
/* CEB4 8001C6B4 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* CEB8 8001C6B8 24104300 */  and        $v0, $v0, $v1
/* CEBC 8001C6BC 508E82AF */  sw         $v0, %gp_rel(current_roll_amount)($gp)
.L8001C6C0:
/* CEC0 8001C6C0 508E828F */  lw         $v0, %gp_rel(current_roll_amount)($gp)
/* CEC4 8001C6C4 00000000 */  nop
/* CEC8 8001C6C8 02004104 */  bgez       $v0, .L8001C6D4
/* CECC 8001C6CC 00000000 */   nop
/* CED0 8001C6D0 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8001C6D4:
/* CED4 8001C6D4 03130200 */  sra        $v0, $v0, 12
/* CED8 8001C6D8 B20022A6 */  sh         $v0, 0xB2($s1)
/* CEDC 8001C6DC 1800BF8F */  lw         $ra, 0x18($sp)
/* CEE0 8001C6E0 1400B18F */  lw         $s1, 0x14($sp)
/* CEE4 8001C6E4 1000B08F */  lw         $s0, 0x10($sp)
/* CEE8 8001C6E8 0800E003 */  jr         $ra
/* CEEC 8001C6EC 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_UpdateFocusRoll, . - CAMERA_UpdateFocusRoll
