.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Control
/* C4DC 8001BCDC C8FFBD27 */  addiu      $sp, $sp, -0x38
/* C4E0 8001BCE0 1800B0AF */  sw         $s0, 0x18($sp)
/* C4E4 8001BCE4 21808000 */  addu       $s0, $a0, $zero
/* C4E8 8001BCE8 2C00B5AF */  sw         $s5, 0x2C($sp)
/* C4EC 8001BCEC 2000B2AF */  sw         $s2, 0x20($sp)
/* C4F0 8001BCF0 10BE9227 */  addiu      $s2, $gp, %gp_rel(gameTrackerX + 0x48)
/* C4F4 8001BCF4 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* C4F8 8001BCF8 1000033C */  lui        $v1, (0x100000 >> 16)
/* C4FC 8001BCFC 3000BFAF */  sw         $ra, 0x30($sp)
/* C500 8001BD00 2800B4AF */  sw         $s4, 0x28($sp)
/* C504 8001BD04 2400B3AF */  sw         $s3, 0x24($sp)
/* C508 8001BD08 1C00B1AF */  sw         $s1, 0x1C($sp)
/* C50C 8001BD0C 0801148E */  lw         $s4, 0x108($s0)
/* C510 8001BD10 24104300 */  and        $v0, $v0, $v1
/* C514 8001BD14 3A014014 */  bnez       $v0, .L8001C200
/* C518 8001BD18 21A8A000 */   addu      $s5, $a1, $zero
/* C51C 8001BD1C 668E8287 */  lh         $v0, %gp_rel(CameraLookStickyFlag)($gp)
/* C520 8001BD20 00000000 */  nop
/* C524 8001BD24 06004014 */  bnez       $v0, .L8001BD40
/* C528 8001BD28 01001124 */   addiu     $s1, $zero, 0x1
/* C52C 8001BD2C 10BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x48)($gp)
/* C530 8001BD30 00000000 */  nop
/* C534 8001BD34 000C5130 */  andi       $s1, $v0, 0xC00
/* C538 8001BD38 000C223A */  xori       $v0, $s1, 0xC00
/* C53C 8001BD3C 0100512C */  sltiu      $s1, $v0, 0x1
.L8001BD40:
/* C540 8001BD40 08040296 */  lhu        $v0, 0x408($s0)
/* C544 8001BD44 A004038E */  lw         $v1, 0x4A0($s0)
/* C548 8001BD48 00000000 */  nop
/* C54C 8001BD4C 0A006014 */  bnez       $v1, .L8001BD78
/* C550 8001BD50 0A0402A6 */   sh        $v0, 0x40A($s0)
/* C554 8001BD54 08040386 */  lh         $v1, 0x408($s0)
/* C558 8001BD58 01000224 */  addiu      $v0, $zero, 0x1
/* C55C 8001BD5C 06006214 */  bne        $v1, $v0, .L8001BD78
/* C560 8001BD60 0002033C */   lui       $v1, (0x2000000 >> 16)
/* C564 8001BD64 9C04028E */  lw         $v0, 0x49C($s0)
/* C568 8001BD68 00000000 */  nop
/* C56C 8001BD6C 24104300 */  and        $v0, $v0, $v1
/* C570 8001BD70 02004010 */  beqz       $v0, .L8001BD7C
/* C574 8001BD74 00000000 */   nop
.L8001BD78:
/* C578 8001BD78 080400A6 */  sh         $zero, 0x408($s0)
.L8001BD7C:
/* C57C 8001BD7C F0000486 */  lh         $a0, 0xF0($s0)
/* C580 8001BD80 08000224 */  addiu      $v0, $zero, 0x8
/* C584 8001BD84 1E018210 */  beq        $a0, $v0, .L8001C200
/* C588 8001BD88 00000000 */   nop
/* C58C 8001BD8C 9C04038E */  lw         $v1, 0x49C($s0)
/* C590 8001BD90 00000000 */  nop
/* C594 8001BD94 1A016004 */  bltz       $v1, .L8001C200
/* C598 8001BD98 FFFF1324 */   addiu     $s3, $zero, -0x1
/* C59C 8001BD9C DCAB8287 */  lh         $v0, %gp_rel(CenterFlag)($gp)
/* C5A0 8001BDA0 00000000 */  nop
/* C5A4 8001BDA4 1C005310 */  beq        $v0, $s3, .L8001BE18
/* C5A8 8001BDA8 0002023C */   lui       $v0, (0x2000000 >> 16)
/* C5AC 8001BDAC 24106200 */  and        $v0, $v1, $v0
/* C5B0 8001BDB0 03004014 */  bnez       $v0, .L8001BDC0
/* C5B4 8001BDB4 01000424 */   addiu     $a0, $zero, 0x1
/* C5B8 8001BDB8 01000224 */  addiu      $v0, $zero, 0x1
/* C5BC 8001BDBC 080402A6 */  sh         $v0, 0x408($s0)
.L8001BDC0:
/* C5C0 8001BDC0 40010526 */  addiu      $a1, $s0, 0x140
/* C5C4 8001BDC4 70010726 */  addiu      $a3, $s0, 0x170
/* C5C8 8001BDC8 DCAB8687 */  lh         $a2, %gp_rel(CenterFlag)($gp)
/* C5CC 8001BDCC 78010226 */  addiu      $v0, $s0, 0x178
/* C5D0 8001BDD0 1000A2AF */  sw         $v0, 0x10($sp)
/* C5D4 8001BDD4 90000224 */  addiu      $v0, $zero, 0x90
/* C5D8 8001BDD8 7E5E000C */  jal        CriticalDampAngle
/* C5DC 8001BDDC 1400A2AF */   sw        $v0, 0x14($sp)
/* C5E0 8001BDE0 40010296 */  lhu        $v0, 0x140($s0)
/* C5E4 8001BDE4 40010486 */  lh         $a0, 0x140($s0)
/* C5E8 8001BDE8 DCAB8587 */  lh         $a1, %gp_rel(CenterFlag)($gp)
/* C5EC 8001BDEC C00102A6 */  sh         $v0, 0x1C0($s0)
/* C5F0 8001BDF0 BC59000C */  jal        CAMERA_AngleDifference
/* C5F4 8001BDF4 B60102A6 */   sh        $v0, 0x1B6($s0)
/* C5F8 8001BDF8 00140200 */  sll        $v0, $v0, 16
/* C5FC 8001BDFC 03140200 */  sra        $v0, $v0, 16
/* C600 8001BE00 08004228 */  slti       $v0, $v0, 0x8
/* C604 8001BE04 FE004010 */  beqz       $v0, .L8001C200
/* C608 8001BE08 00000000 */   nop
/* C60C 8001BE0C DCAB93A7 */  sh         $s3, %gp_rel(CenterFlag)($gp)
/* C610 8001BE10 80700008 */  j          .L8001C200
/* C614 8001BE14 00000000 */   nop
.L8001BE18:
/* C618 8001BE18 8FBF8393 */  lbu        $v1, %gp_rel(gameTrackerX + 0x1C7)($gp)
/* C61C 8001BE1C 01000224 */  addiu      $v0, $zero, 0x1
/* C620 8001BE20 06006214 */  bne        $v1, $v0, .L8001BE3C
/* C624 8001BE24 00000000 */   nop
/* C628 8001BE28 0000428E */  lw         $v0, 0x0($s2)
/* C62C 8001BE2C 00000000 */  nop
/* C630 8001BE30 0F004230 */  andi       $v0, $v0, 0xF
/* C634 8001BE34 F2004014 */  bnez       $v0, .L8001C200
/* C638 8001BE38 00000000 */   nop
.L8001BE3C:
/* C63C 8001BE3C EC00028E */  lw         $v0, 0xEC($s0)
/* C640 8001BE40 00000000 */  nop
/* C644 8001BE44 04004230 */  andi       $v0, $v0, 0x4
/* C648 8001BE48 6F004014 */  bnez       $v0, .L8001C008
/* C64C 8001BE4C 0100033C */   lui       $v1, (0x10000 >> 16)
/* C650 8001BE50 E800028E */  lw         $v0, 0xE8($s0)
/* C654 8001BE54 00000000 */  nop
/* C658 8001BE58 24104300 */  and        $v0, $v0, $v1
/* C65C 8001BE5C 6A004014 */  bnez       $v0, .L8001C008
/* C660 8001BE60 00000000 */   nop
/* C664 8001BE64 07008010 */  beqz       $a0, .L8001BE84
/* C668 8001BE68 0C000224 */   addiu     $v0, $zero, 0xC
/* C66C 8001BE6C 05008210 */  beq        $a0, $v0, .L8001BE84
/* C670 8001BE70 04000224 */   addiu     $v0, $zero, 0x4
/* C674 8001BE74 03008210 */  beq        $a0, $v0, .L8001BE84
/* C678 8001BE78 0D000224 */   addiu     $v0, $zero, 0xD
/* C67C 8001BE7C 62008214 */  bne        $a0, $v0, .L8001C008
/* C680 8001BE80 00000000 */   nop
.L8001BE84:
/* C684 8001BE84 1400A28E */  lw         $v0, 0x14($s5)
/* C688 8001BE88 00000000 */  nop
/* C68C 8001BE8C 00014230 */  andi       $v0, $v0, 0x100
/* C690 8001BE90 5D004014 */  bnez       $v0, .L8001C008
/* C694 8001BE94 00000000 */   nop
/* C698 8001BE98 0000428E */  lw         $v0, 0x0($s2)
/* C69C 8001BE9C 00000000 */  nop
/* C6A0 8001BEA0 00044230 */  andi       $v0, $v0, 0x400
/* C6A4 8001BEA4 1F004010 */  beqz       $v0, .L8001BF24
/* C6A8 8001BEA8 00000000 */   nop
/* C6AC 8001BEAC 1D002016 */  bnez       $s1, .L8001BF24
/* C6B0 8001BEB0 00000000 */   nop
/* C6B4 8001BEB4 8E040296 */  lhu        $v0, 0x48E($s0)
/* C6B8 8001BEB8 00000000 */  nop
/* C6BC 8001BEBC 01004224 */  addiu      $v0, $v0, 0x1
/* C6C0 8001BEC0 8E0402A6 */  sh         $v0, 0x48E($s0)
/* C6C4 8001BEC4 00140200 */  sll        $v0, $v0, 16
/* C6C8 8001BEC8 03140200 */  sra        $v0, $v0, 16
/* C6CC 8001BECC 03004228 */  slti       $v0, $v0, 0x3
/* C6D0 8001BED0 1F004014 */  bnez       $v0, .L8001BF50
/* C6D4 8001BED4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* C6D8 8001BED8 0C0402A6 */  sh         $v0, 0x40C($s0)
/* C6DC 8001BEDC 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* C6E0 8001BEE0 40010396 */  lhu        $v1, 0x140($s0)
/* C6E4 8001BEE4 40110200 */  sll        $v0, $v0, 5
/* C6E8 8001BEE8 02130200 */  srl        $v0, $v0, 12
/* C6EC 8001BEEC 23186200 */  subu       $v1, $v1, $v0
/* C6F0 8001BEF0 FF0F6330 */  andi       $v1, $v1, 0xFFF
/* C6F4 8001BEF4 400103A6 */  sh         $v1, 0x140($s0)
/* C6F8 8001BEF8 F4BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x12C)($gp)
/* C6FC 8001BEFC 01000224 */  addiu      $v0, $zero, 0x1
/* C700 8001BF00 080402A6 */  sh         $v0, 0x408($s0)
/* C704 8001BF04 A2E5023C */  lui        $v0, (0xE5A20000 >> 16)
/* C708 8001BF08 FF0F6330 */  andi       $v1, $v1, 0xFFF
/* C70C 8001BF0C 700402AE */  sw         $v0, 0x470($s0)
/* C710 8001BF10 400103A6 */  sh         $v1, 0x140($s0)
/* C714 8001BF14 C00103A6 */  sh         $v1, 0x1C0($s0)
/* C718 8001BF18 B60103A6 */  sh         $v1, 0x1B6($s0)
/* C71C 8001BF1C D46F0008 */  j          .L8001BF50
/* C720 8001BF20 100404AE */   sw        $a0, 0x410($s0)
.L8001BF24:
/* C724 8001BF24 8E040296 */  lhu        $v0, 0x48E($s0)
/* C728 8001BF28 00000000 */  nop
/* C72C 8001BF2C FFFF4224 */  addiu      $v0, $v0, -0x1
/* C730 8001BF30 0300422C */  sltiu      $v0, $v0, 0x3
/* C734 8001BF34 05004010 */  beqz       $v0, .L8001BF4C
/* C738 8001BF38 00000000 */   nop
/* C73C 8001BF3C 03002016 */  bnez       $s1, .L8001BF4C
/* C740 8001BF40 00000000 */   nop
/* C744 8001BF44 AE6E000C */  jal        CAMERA_CenterCamera
/* C748 8001BF48 21200002 */   addu      $a0, $s0, $zero
.L8001BF4C:
/* C74C 8001BF4C 8E0400A6 */  sh         $zero, 0x48E($s0)
.L8001BF50:
/* C750 8001BF50 0000428E */  lw         $v0, 0x0($s2)
/* C754 8001BF54 00000000 */  nop
/* C758 8001BF58 00084230 */  andi       $v0, $v0, 0x800
/* C75C 8001BF5C 1E004010 */  beqz       $v0, .L8001BFD8
/* C760 8001BF60 00000000 */   nop
/* C764 8001BF64 1C002016 */  bnez       $s1, .L8001BFD8
/* C768 8001BF68 00000000 */   nop
/* C76C 8001BF6C 90040296 */  lhu        $v0, 0x490($s0)
/* C770 8001BF70 00000000 */  nop
/* C774 8001BF74 01004224 */  addiu      $v0, $v0, 0x1
/* C778 8001BF78 900402A6 */  sh         $v0, 0x490($s0)
/* C77C 8001BF7C 00140200 */  sll        $v0, $v0, 16
/* C780 8001BF80 03140200 */  sra        $v0, $v0, 16
/* C784 8001BF84 03004228 */  slti       $v0, $v0, 0x3
/* C788 8001BF88 21004014 */  bnez       $v0, .L8001C010
/* C78C 8001BF8C 01000224 */   addiu     $v0, $zero, 0x1
/* C790 8001BF90 0C0402A6 */  sh         $v0, 0x40C($s0)
/* C794 8001BF94 080402A6 */  sh         $v0, 0x408($s0)
/* C798 8001BF98 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* C79C 8001BF9C 40010396 */  lhu        $v1, 0x140($s0)
/* C7A0 8001BFA0 40110200 */  sll        $v0, $v0, 5
/* C7A4 8001BFA4 02130200 */  srl        $v0, $v0, 12
/* C7A8 8001BFA8 21186200 */  addu       $v1, $v1, $v0
/* C7AC 8001BFAC FF0F6330 */  andi       $v1, $v1, 0xFFF
/* C7B0 8001BFB0 A2E5023C */  lui        $v0, (0xE5A20000 >> 16)
/* C7B4 8001BFB4 400103A6 */  sh         $v1, 0x140($s0)
/* C7B8 8001BFB8 F4BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x12C)($gp)
/* C7BC 8001BFBC FF0F6330 */  andi       $v1, $v1, 0xFFF
/* C7C0 8001BFC0 700402AE */  sw         $v0, 0x470($s0)
/* C7C4 8001BFC4 400103A6 */  sh         $v1, 0x140($s0)
/* C7C8 8001BFC8 C00103A6 */  sh         $v1, 0x1C0($s0)
/* C7CC 8001BFCC B60103A6 */  sh         $v1, 0x1B6($s0)
/* C7D0 8001BFD0 04700008 */  j          .L8001C010
/* C7D4 8001BFD4 100404AE */   sw        $a0, 0x410($s0)
.L8001BFD8:
/* C7D8 8001BFD8 90040296 */  lhu        $v0, 0x490($s0)
/* C7DC 8001BFDC 00000000 */  nop
/* C7E0 8001BFE0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* C7E4 8001BFE4 0300422C */  sltiu      $v0, $v0, 0x3
/* C7E8 8001BFE8 05004010 */  beqz       $v0, .L8001C000
/* C7EC 8001BFEC 00000000 */   nop
/* C7F0 8001BFF0 03002016 */  bnez       $s1, .L8001C000
/* C7F4 8001BFF4 00000000 */   nop
/* C7F8 8001BFF8 AE6E000C */  jal        CAMERA_CenterCamera
/* C7FC 8001BFFC 21200002 */   addu      $a0, $s0, $zero
.L8001C000:
/* C800 8001C000 04700008 */  j          .L8001C010
/* C804 8001C004 900400A6 */   sh        $zero, 0x490($s0)
.L8001C008:
/* C808 8001C008 900400A6 */  sh         $zero, 0x490($s0)
/* C80C 8001C00C 8E0400A6 */  sh         $zero, 0x48E($s0)
.L8001C010:
/* C810 8001C010 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* C814 8001C014 0002033C */  lui        $v1, (0x2000000 >> 16)
/* C818 8001C018 24104300 */  and        $v0, $v0, $v1
/* C81C 8001C01C 3C004010 */  beqz       $v0, .L8001C110
/* C820 8001C020 00000000 */   nop
/* C824 8001C024 EC00028E */  lw         $v0, 0xEC($s0)
/* C828 8001C028 00000000 */  nop
/* C82C 8001C02C 01004230 */  andi       $v0, $v0, 0x1
/* C830 8001C030 20004014 */  bnez       $v0, .L8001C0B4
/* C834 8001C034 0040033C */   lui       $v1, (0x40000008 >> 16)
/* C838 8001C038 0000428E */  lw         $v0, 0x0($s2)
/* C83C 8001C03C 08006334 */  ori        $v1, $v1, (0x40000008 & 0xFFFF)
/* C840 8001C040 24104300 */  and        $v0, $v0, $v1
/* C844 8001C044 0C004314 */  bne        $v0, $v1, .L8001C078
/* C848 8001C048 0040033C */   lui       $v1, (0x40000004 >> 16)
/* C84C 8001C04C A8010296 */  lhu        $v0, 0x1A8($s0)
/* C850 8001C050 00000000 */  nop
/* C854 8001C054 ECFF4224 */  addiu      $v0, $v0, -0x14
/* C858 8001C058 A80102A6 */  sh         $v0, 0x1A8($s0)
/* C85C 8001C05C 00140200 */  sll        $v0, $v0, 16
/* C860 8001C060 03140200 */  sra        $v0, $v0, 16
/* C864 8001C064 C8004228 */  slti       $v0, $v0, 0xC8
/* C868 8001C068 03004010 */  beqz       $v0, .L8001C078
/* C86C 8001C06C C8000224 */   addiu     $v0, $zero, 0xC8
/* C870 8001C070 A80102A6 */  sh         $v0, 0x1A8($s0)
/* C874 8001C074 0040033C */  lui        $v1, (0x40000004 >> 16)
.L8001C078:
/* C878 8001C078 0000428E */  lw         $v0, 0x0($s2)
/* C87C 8001C07C 04006334 */  ori        $v1, $v1, (0x40000004 & 0xFFFF)
/* C880 8001C080 24104300 */  and        $v0, $v0, $v1
/* C884 8001C084 0B004314 */  bne        $v0, $v1, .L8001C0B4
/* C888 8001C088 00000000 */   nop
/* C88C 8001C08C A8010296 */  lhu        $v0, 0x1A8($s0)
/* C890 8001C090 00000000 */  nop
/* C894 8001C094 14004224 */  addiu      $v0, $v0, 0x14
/* C898 8001C098 A80102A6 */  sh         $v0, 0x1A8($s0)
/* C89C 8001C09C 00140200 */  sll        $v0, $v0, 16
/* C8A0 8001C0A0 03140200 */  sra        $v0, $v0, 16
/* C8A4 8001C0A4 01104228 */  slti       $v0, $v0, 0x1001
/* C8A8 8001C0A8 02004014 */  bnez       $v0, .L8001C0B4
/* C8AC 8001C0AC 00100224 */   addiu     $v0, $zero, 0x1000
/* C8B0 8001C0B0 A80102A6 */  sh         $v0, 0x1A8($s0)
.L8001C0B4:
/* C8B4 8001C0B4 EC00028E */  lw         $v0, 0xEC($s0)
/* C8B8 8001C0B8 00000000 */  nop
/* C8BC 8001C0BC 02004230 */  andi       $v0, $v0, 0x2
/* C8C0 8001C0C0 13004014 */  bnez       $v0, .L8001C110
/* C8C4 8001C0C4 0040033C */   lui       $v1, (0x40000002 >> 16)
/* C8C8 8001C0C8 0000428E */  lw         $v0, 0x0($s2)
/* C8CC 8001C0CC 02006334 */  ori        $v1, $v1, (0x40000002 & 0xFFFF)
/* C8D0 8001C0D0 24104300 */  and        $v0, $v0, $v1
/* C8D4 8001C0D4 05004314 */  bne        $v0, $v1, .L8001C0EC
/* C8D8 8001C0D8 0040033C */   lui       $v1, (0x40000001 >> 16)
/* C8DC 8001C0DC 8C040296 */  lhu        $v0, 0x48C($s0)
/* C8E0 8001C0E0 00000000 */  nop
/* C8E4 8001C0E4 10004224 */  addiu      $v0, $v0, 0x10
/* C8E8 8001C0E8 8C0402A6 */  sh         $v0, 0x48C($s0)
.L8001C0EC:
/* C8EC 8001C0EC 0000428E */  lw         $v0, 0x0($s2)
/* C8F0 8001C0F0 01006334 */  ori        $v1, $v1, (0x40000001 & 0xFFFF)
/* C8F4 8001C0F4 24104300 */  and        $v0, $v0, $v1
/* C8F8 8001C0F8 05004314 */  bne        $v0, $v1, .L8001C110
/* C8FC 8001C0FC 00000000 */   nop
/* C900 8001C100 8C040296 */  lhu        $v0, 0x48C($s0)
/* C904 8001C104 00000000 */  nop
/* C908 8001C108 F0FF4224 */  addiu      $v0, $v0, -0x10
/* C90C 8001C10C 8C0402A6 */  sh         $v0, 0x48C($s0)
.L8001C110:
/* C910 8001C110 35002012 */  beqz       $s1, .L8001C1E8
/* C914 8001C114 21200002 */   addu      $a0, $s0, $zero
/* C918 8001C118 1400A28E */  lw         $v0, 0x14($s5)
/* C91C 8001C11C 00000000 */  nop
/* C920 8001C120 00014230 */  andi       $v0, $v0, 0x100
/* C924 8001C124 30004014 */  bnez       $v0, .L8001C1E8
/* C928 8001C128 0200033C */   lui       $v1, (0x20000 >> 16)
/* C92C 8001C12C E800028E */  lw         $v0, 0xE8($s0)
/* C930 8001C130 00000000 */  nop
/* C934 8001C134 24104300 */  and        $v0, $v0, $v1
/* C938 8001C138 30004010 */  beqz       $v0, .L8001C1FC
/* C93C 8001C13C 05000224 */   addiu     $v0, $zero, 0x5
/* C940 8001C140 F0000386 */  lh         $v1, 0xF0($s0)
/* C944 8001C144 00000000 */  nop
/* C948 8001C148 2C006210 */  beq        $v1, $v0, .L8001C1FC
/* C94C 8001C14C 00000000 */   nop
/* C950 8001C150 F0010296 */  lhu        $v0, 0x1F0($s0)
/* C954 8001C154 00000000 */  nop
/* C958 8001C158 01004224 */  addiu      $v0, $v0, 0x1
/* C95C 8001C15C F00102A6 */  sh         $v0, 0x1F0($s0)
/* C960 8001C160 00140200 */  sll        $v0, $v0, 16
/* C964 8001C164 031C0200 */  sra        $v1, $v0, 16
/* C968 8001C168 02000224 */  addiu      $v0, $zero, 0x2
/* C96C 8001C16C 12006214 */  bne        $v1, $v0, .L8001C1B8
/* C970 8001C170 03006228 */   slti      $v0, $v1, 0x3
/* C974 8001C174 754B000C */  jal        PLAYER_OkToLookAround
/* C978 8001C178 21208002 */   addu      $a0, $s4, $zero
/* C97C 8001C17C 0C004010 */  beqz       $v0, .L8001C1B0
/* C980 8001C180 00000000 */   nop
/* C984 8001C184 EC00028E */  lw         $v0, 0xEC($s0)
/* C988 8001C188 00000000 */  nop
/* C98C 8001C18C 00024230 */  andi       $v0, $v0, 0x200
/* C990 8001C190 07004014 */  bnez       $v0, .L8001C1B0
/* C994 8001C194 00000000 */   nop
/* C998 8001C198 EB6E000C */  jal        CAMERA_StartLookaroundMode
/* C99C 8001C19C 21200002 */   addu      $a0, $s0, $zero
/* C9A0 8001C1A0 884B000C */  jal        PLAYER_SetLookAround
/* C9A4 8001C1A4 21208002 */   addu      $a0, $s4, $zero
/* C9A8 8001C1A8 80700008 */  j          .L8001C200
/* C9AC 8001C1AC 920400A6 */   sh        $zero, 0x492($s0)
.L8001C1B0:
/* C9B0 8001C1B0 7F700008 */  j          .L8001C1FC
/* C9B4 8001C1B4 F00100A6 */   sh        $zero, 0x1F0($s0)
.L8001C1B8:
/* C9B8 8001C1B8 10004014 */  bnez       $v0, .L8001C1FC
/* C9BC 8001C1BC 06000224 */   addiu     $v0, $zero, 0x6
/* C9C0 8001C1C0 F0000386 */  lh         $v1, 0xF0($s0)
/* C9C4 8001C1C4 00000000 */  nop
/* C9C8 8001C1C8 0C006214 */  bne        $v1, $v0, .L8001C1FC
/* C9CC 8001C1CC 21208002 */   addu      $a0, $s4, $zero
/* C9D0 8001C1D0 14040526 */  addiu      $a1, $s0, 0x414
/* C9D4 8001C1D4 C8BD8727 */  addiu      $a3, $gp, %gp_rel(gameTrackerX)
/* C9D8 8001C1D8 554B000C */  jal        PLAYER_TurnHead
/* C9DC 8001C1DC 18040626 */   addiu     $a2, $s0, 0x418
/* C9E0 8001C1E0 80700008 */  j          .L8001C200
/* C9E4 8001C1E4 920400A6 */   sh        $zero, 0x492($s0)
.L8001C1E8:
/* C9E8 8001C1E8 E800028E */  lw         $v0, 0xE8($s0)
/* C9EC 8001C1EC 0200033C */  lui        $v1, (0x20000 >> 16)
/* C9F0 8001C1F0 25104300 */  or         $v0, $v0, $v1
/* C9F4 8001C1F4 8970000C */  jal        CAMERA_EndLook
/* C9F8 8001C1F8 E80002AE */   sw        $v0, 0xE8($s0)
.L8001C1FC:
/* C9FC 8001C1FC 920400A6 */  sh         $zero, 0x492($s0)
.L8001C200:
/* CA00 8001C200 3000BF8F */  lw         $ra, 0x30($sp)
/* CA04 8001C204 2C00B58F */  lw         $s5, 0x2C($sp)
/* CA08 8001C208 2800B48F */  lw         $s4, 0x28($sp)
/* CA0C 8001C20C 2400B38F */  lw         $s3, 0x24($sp)
/* CA10 8001C210 2000B28F */  lw         $s2, 0x20($sp)
/* CA14 8001C214 1C00B18F */  lw         $s1, 0x1C($sp)
/* CA18 8001C218 1800B08F */  lw         $s0, 0x18($sp)
/* CA1C 8001C21C 0800E003 */  jr         $ra
/* CA20 8001C220 3800BD27 */   addiu     $sp, $sp, 0x38
.size CAMERA_Control, . - CAMERA_Control
