.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CalculateLead
/* D5A0 8001CDA0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* D5A4 8001CDA4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* D5A8 8001CDA8 21888000 */  addu       $s1, $a0, $zero
/* D5AC 8001CDAC 2000BFAF */  sw         $ra, 0x20($sp)
/* D5B0 8001CDB0 1800B0AF */  sw         $s0, 0x18($sp)
/* D5B4 8001CDB4 E800228E */  lw         $v0, 0xE8($s1)
/* D5B8 8001CDB8 0100033C */  lui        $v1, (0x10000 >> 16)
/* D5BC 8001CDBC 24104300 */  and        $v0, $v0, $v1
/* D5C0 8001CDC0 4A004014 */  bnez       $v0, .L8001CEEC
/* D5C4 8001CDC4 06000224 */   addiu     $v0, $zero, 0x6
/* D5C8 8001CDC8 F0002386 */  lh         $v1, 0xF0($s1)
/* D5CC 8001CDCC 00000000 */  nop
/* D5D0 8001CDD0 46006210 */  beq        $v1, $v0, .L8001CEEC
/* D5D4 8001CDD4 0003033C */   lui       $v1, (0x3002043 >> 16)
/* D5D8 8001CDD8 9C04228E */  lw         $v0, 0x49C($s1)
/* D5DC 8001CDDC 43206334 */  ori        $v1, $v1, (0x3002043 & 0xFFFF)
/* D5E0 8001CDE0 24104300 */  and        $v0, $v0, $v1
/* D5E4 8001CDE4 41004014 */  bnez       $v0, .L8001CEEC
/* D5E8 8001CDE8 00000000 */   nop
/* D5EC 8001CDEC 0801228E */  lw         $v0, 0x108($s1)
/* D5F0 8001CDF0 B4002586 */  lh         $a1, 0xB4($s1)
/* D5F4 8001CDF4 78004494 */  lhu        $a0, 0x78($v0)
/* D5F8 8001CDF8 A004308E */  lw         $s0, 0x4A0($s1)
/* D5FC 8001CDFC 00088424 */  addiu      $a0, $a0, 0x800
/* D600 8001CE00 00240400 */  sll        $a0, $a0, 16
/* D604 8001CE04 DA59000C */  jal        CAMERA_SignedAngleDifference
/* D608 8001CE08 03240400 */   sra       $a0, $a0, 16
/* D60C 8001CE0C 21204000 */  addu       $a0, $v0, $zero
/* D610 8001CE10 1700022A */  slti       $v0, $s0, 0x17
/* D614 8001CE14 06004014 */  bnez       $v0, .L8001CE30
/* D618 8001CE18 00000000 */   nop
/* D61C 8001CE1C C2042296 */  lhu        $v0, 0x4C2($s1)
/* D620 8001CE20 00000000 */  nop
/* D624 8001CE24 01004224 */  addiu      $v0, $v0, 0x1
/* D628 8001CE28 91730008 */  j          .L8001CE44
/* D62C 8001CE2C C20422A6 */   sh        $v0, 0x4C2($s1)
.L8001CE30:
/* D630 8001CE30 A404228E */  lw         $v0, 0x4A4($s1)
/* D634 8001CE34 00000000 */  nop
/* D638 8001CE38 03004014 */  bnez       $v0, .L8001CE48
/* D63C 8001CE3C 1700022A */   slti      $v0, $s0, 0x17
/* D640 8001CE40 C20420A6 */  sh         $zero, 0x4C2($s1)
.L8001CE44:
/* D644 8001CE44 1700022A */  slti       $v0, $s0, 0x17
.L8001CE48:
/* D648 8001CE48 2A004014 */  bnez       $v0, .L8001CEF4
/* D64C 8001CE4C 21800000 */   addu      $s0, $zero, $zero
/* D650 8001CE50 00140400 */  sll        $v0, $a0, 16
/* D654 8001CE54 03140200 */  sra        $v0, $v0, 16
/* D658 8001CE58 02004104 */  bgez       $v0, .L8001CE64
/* D65C 8001CE5C 00000000 */   nop
/* D660 8001CE60 23100200 */  negu       $v0, $v0
.L8001CE64:
/* D664 8001CE64 6FFE4224 */  addiu      $v0, $v0, -0x191
/* D668 8001CE68 AF04422C */  sltiu      $v0, $v0, 0x4AF
/* D66C 8001CE6C 22004010 */  beqz       $v0, .L8001CEF8
/* D670 8001CE70 03000324 */   addiu     $v1, $zero, 0x3
/* D674 8001CE74 C2042386 */  lh         $v1, 0x4C2($s1)
/* D678 8001CE78 00000000 */  nop
/* D67C 8001CE7C 24006228 */  slti       $v0, $v1, 0x24
/* D680 8001CE80 06004014 */  bnez       $v0, .L8001CE9C
/* D684 8001CE84 00140400 */   sll       $v0, $a0, 16
/* D688 8001CE88 DDFF6324 */  addiu      $v1, $v1, -0x23
/* D68C 8001CE8C 40100300 */  sll        $v0, $v1, 1
/* D690 8001CE90 21104300 */  addu       $v0, $v0, $v1
/* D694 8001CE94 23004324 */  addiu      $v1, $v0, 0x23
/* D698 8001CE98 00140400 */  sll        $v0, $a0, 16
.L8001CE9C:
/* D69C 8001CE9C 05004018 */  blez       $v0, .L8001CEB4
/* D6A0 8001CEA0 50006228 */   slti      $v0, $v1, 0x50
/* D6A4 8001CEA4 06004010 */  beqz       $v0, .L8001CEC0
/* D6A8 8001CEA8 50001024 */   addiu     $s0, $zero, 0x50
/* D6AC 8001CEAC B0730008 */  j          .L8001CEC0
/* D6B0 8001CEB0 21806000 */   addu      $s0, $v1, $zero
.L8001CEB4:
/* D6B4 8001CEB4 02004014 */  bnez       $v0, .L8001CEC0
/* D6B8 8001CEB8 23800300 */   negu      $s0, $v1
/* D6BC 8001CEBC B0FF1024 */  addiu      $s0, $zero, -0x50
.L8001CEC0:
/* D6C0 8001CEC0 BC042586 */  lh         $a1, 0x4BC($s1)
/* D6C4 8001CEC4 00241000 */  sll        $a0, $s0, 16
/* D6C8 8001CEC8 BC59000C */  jal        CAMERA_AngleDifference
/* D6CC 8001CECC 03240400 */   sra       $a0, $a0, 16
/* D6D0 8001CED0 00140200 */  sll        $v0, $v0, 16
/* D6D4 8001CED4 03140200 */  sra        $v0, $v0, 16
/* D6D8 8001CED8 51004228 */  slti       $v0, $v0, 0x51
/* D6DC 8001CEDC 06004014 */  bnez       $v0, .L8001CEF8
/* D6E0 8001CEE0 08000324 */   addiu     $v1, $zero, 0x8
/* D6E4 8001CEE4 BE730008 */  j          .L8001CEF8
/* D6E8 8001CEE8 0C000324 */   addiu     $v1, $zero, 0xC
.L8001CEEC:
/* D6EC 8001CEEC C20420A6 */  sh         $zero, 0x4C2($s1)
/* D6F0 8001CEF0 21800000 */  addu       $s0, $zero, $zero
.L8001CEF4:
/* D6F4 8001CEF4 03000324 */  addiu      $v1, $zero, 0x3
.L8001CEF8:
/* D6F8 8001CEF8 01000424 */  addiu      $a0, $zero, 0x1
/* D6FC 8001CEFC BC042526 */  addiu      $a1, $s1, 0x4BC
/* D700 8001CF00 C0042226 */  addiu      $v0, $s1, 0x4C0
/* D704 8001CF04 00341000 */  sll        $a2, $s0, 16
/* D708 8001CF08 03340600 */  sra        $a2, $a2, 16
/* D70C 8001CF0C BE042726 */  addiu      $a3, $s1, 0x4BE
/* D710 8001CF10 1000A2AF */  sw         $v0, 0x10($sp)
/* D714 8001CF14 7E5E000C */  jal        CriticalDampAngle
/* D718 8001CF18 1400A3AF */   sw        $v1, 0x14($sp)
/* D71C 8001CF1C B4002296 */  lhu        $v0, 0xB4($s1)
/* D720 8001CF20 BC042396 */  lhu        $v1, 0x4BC($s1)
/* D724 8001CF24 00000000 */  nop
/* D728 8001CF28 21104300 */  addu       $v0, $v0, $v1
/* D72C 8001CF2C FF0F4230 */  andi       $v0, $v0, 0xFFF
/* D730 8001CF30 B40022A6 */  sh         $v0, 0xB4($s1)
/* D734 8001CF34 2000BF8F */  lw         $ra, 0x20($sp)
/* D738 8001CF38 1C00B18F */  lw         $s1, 0x1C($sp)
/* D73C 8001CF3C 1800B08F */  lw         $s0, 0x18($sp)
/* D740 8001CF40 0800E003 */  jr         $ra
/* D744 8001CF44 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_CalculateLead, . - CAMERA_CalculateLead
