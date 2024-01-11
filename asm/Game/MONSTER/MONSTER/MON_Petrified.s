.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Petrified
/* 7C5F4 8008BDF4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 7C5F8 8008BDF8 1400B1AF */  sw         $s1, 0x14($sp)
/* 7C5FC 8008BDFC 21888000 */  addu       $s1, $a0, $zero
/* 7C600 8008BE00 2800BFAF */  sw         $ra, 0x28($sp)
/* 7C604 8008BE04 2400B5AF */  sw         $s5, 0x24($sp)
/* 7C608 8008BE08 2000B4AF */  sw         $s4, 0x20($sp)
/* 7C60C 8008BE0C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7C610 8008BE10 1800B2AF */  sw         $s2, 0x18($sp)
/* 7C614 8008BE14 1000B0AF */  sw         $s0, 0x10($sp)
/* 7C618 8008BE18 6C01308E */  lw         $s0, 0x16C($s1)
/* 7C61C 8008BE1C 9006020C */  jal        MON_GetTime
/* 7C620 8008BE20 00000000 */   nop
/* 7C624 8008BE24 1401048E */  lw         $a0, 0x114($s0)
/* 7C628 8008BE28 21184000 */  addu       $v1, $v0, $zero
/* 7C62C 8008BE2C 2B108300 */  sltu       $v0, $a0, $v1
/* 7C630 8008BE30 0A004010 */  beqz       $v0, .L8008BE5C
/* 7C634 8008BE34 02000524 */   addiu     $a1, $zero, 0x2
/* 7C638 8008BE38 21202002 */  addu       $a0, $s1, $zero
/* 7C63C 8008BE3C 0000028E */  lw         $v0, 0x0($s0)
/* 7C640 8008BE40 7FFF0324 */  addiu      $v1, $zero, -0x81
/* 7C644 8008BE44 24104300 */  and        $v0, $v0, $v1
/* 7C648 8008BE48 000002AE */  sw         $v0, 0x0($s0)
/* 7C64C 8008BE4C 91FE010C */  jal        MON_SwitchState
/* 7C650 8008BE50 720120A6 */   sh        $zero, 0x172($s1)
/* 7C654 8008BE54 9E2F0208 */  j          .L8008BE78
/* 7C658 8008BE58 0001133C */   lui       $s3, (0x100001F >> 16)
.L8008BE5C:
/* 7C65C 8008BE5C 18FC8224 */  addiu      $v0, $a0, -0x3E8
/* 7C660 8008BE60 2B104300 */  sltu       $v0, $v0, $v1
/* 7C664 8008BE64 03004010 */  beqz       $v0, .L8008BE74
/* 7C668 8008BE68 23108300 */   subu      $v0, $a0, $v1
/* 7C66C 8008BE6C 80100200 */  sll        $v0, $v0, 2
/* 7C670 8008BE70 720122A6 */  sh         $v0, 0x172($s1)
.L8008BE74:
/* 7C674 8008BE74 0001133C */  lui        $s3, (0x100001F >> 16)
.L8008BE78:
/* 7C678 8008BE78 1F007336 */  ori        $s3, $s3, (0x100001F & 0xFFFF)
/* 7C67C 8008BE7C 0001123C */  lui        $s2, (0x1000023 >> 16)
/* 7C680 8008BE80 23005236 */  ori        $s2, $s2, (0x1000023 & 0xFFFF)
/* 7C684 8008BE84 00101524 */  addiu      $s5, $zero, 0x1000
/* 7C688 8008BE88 00041424 */  addiu      $s4, $zero, 0x400
.L8008BE8C:
/* 7C68C 8008BE8C 27C3010C */  jal        DeMessageQueue
/* 7C690 8008BE90 08000426 */   addiu     $a0, $s0, 0x8
/* 7C694 8008BE94 11004010 */  beqz       $v0, .L8008BEDC
/* 7C698 8008BE98 00000000 */   nop
/* 7C69C 8008BE9C 0000438C */  lw         $v1, 0x0($v0)
/* 7C6A0 8008BEA0 00000000 */  nop
/* 7C6A4 8008BEA4 07007310 */  beq        $v1, $s3, .L8008BEC4
/* 7C6A8 8008BEA8 00000000 */   nop
/* 7C6AC 8008BEAC F7FF7214 */  bne        $v1, $s2, .L8008BE8C
/* 7C6B0 8008BEB0 00000000 */   nop
/* 7C6B4 8008BEB4 0400428C */  lw         $v0, 0x4($v0)
/* 7C6B8 8008BEB8 00000000 */  nop
/* 7C6BC 8008BEBC F3FF5514 */  bne        $v0, $s5, .L8008BE8C
/* 7C6C0 8008BEC0 00000000 */   nop
.L8008BEC4:
/* 7C6C4 8008BEC4 540114A6 */  sh         $s4, 0x154($s0)
/* 7C6C8 8008BEC8 21202002 */  addu       $a0, $s1, $zero
/* 7C6CC 8008BECC 91FE010C */  jal        MON_SwitchState
/* 7C6D0 8008BED0 10000524 */   addiu     $a1, $zero, 0x10
/* 7C6D4 8008BED4 A32F0208 */  j          .L8008BE8C
/* 7C6D8 8008BED8 00000000 */   nop
.L8008BEDC:
/* 7C6DC 8008BEDC 2800BF8F */  lw         $ra, 0x28($sp)
/* 7C6E0 8008BEE0 2400B58F */  lw         $s5, 0x24($sp)
/* 7C6E4 8008BEE4 2000B48F */  lw         $s4, 0x20($sp)
/* 7C6E8 8008BEE8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7C6EC 8008BEEC 1800B28F */  lw         $s2, 0x18($sp)
/* 7C6F0 8008BEF0 1400B18F */  lw         $s1, 0x14($sp)
/* 7C6F4 8008BEF4 1000B08F */  lw         $s0, 0x10($sp)
/* 7C6F8 8008BEF8 0800E003 */  jr         $ra
/* 7C6FC 8008BEFC 3000BD27 */   addiu     $sp, $sp, 0x30
.size MON_Petrified, . - MON_Petrified
