.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerFall
/* 9C5A8 800ABDA8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 9C5AC 800ABDAC 1800B2AF */  sw         $s2, 0x18($sp)
/* 9C5B0 800ABDB0 21908000 */  addu       $s2, $a0, $zero
/* 9C5B4 800ABDB4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 9C5B8 800ABDB8 2198A000 */  addu       $s3, $a1, $zero
/* 9C5BC 800ABDBC 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 9C5C0 800ABDC0 21B80000 */  addu       $s7, $zero, $zero
/* 9C5C4 800ABDC4 2800B6AF */  sw         $s6, 0x28($sp)
/* 9C5C8 800ABDC8 01001624 */  addiu      $s6, $zero, 0x1
/* 9C5CC 800ABDCC 3400BFAF */  sw         $ra, 0x34($sp)
/* 9C5D0 800ABDD0 3000BEAF */  sw         $fp, 0x30($sp)
/* 9C5D4 800ABDD4 2400B5AF */  sw         $s5, 0x24($sp)
/* 9C5D8 800ABDD8 2000B4AF */  sw         $s4, 0x20($sp)
/* 9C5DC 800ABDDC 1400B1AF */  sw         $s1, 0x14($sp)
/* 9C5E0 800ABDE0 1000B0AF */  sw         $s0, 0x10($sp)
/* 9C5E4 800ABDE4 0E006016 */  bnez       $s3, .L800ABE20
/* 9C5E8 800ABDE8 4000A6AF */   sw        $a2, 0x40($sp)
/* 9C5EC 800ABDEC 0000428E */  lw         $v0, 0x0($s2)
/* 9C5F0 800ABDF0 00000000 */  nop
/* 9C5F4 800ABDF4 3800448C */  lw         $a0, 0x38($v0)
/* 9C5F8 800ABDF8 1C66010C */  jal        STREAM_GetLevelWithID
/* 9C5FC 800ABDFC 00000000 */   nop
/* 9C600 800ABE00 CC00428C */  lw         $v0, 0xCC($v0)
/* 9C604 800ABE04 00000000 */  nop
/* 9C608 800ABE08 00104230 */  andi       $v0, $v0, 0x1000
/* 9C60C 800ABE0C 04004010 */  beqz       $v0, .L800ABE20
/* 9C610 800ABE10 0C004426 */   addiu     $a0, $s2, 0xC
/* 9C614 800ABE14 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9C618 800ABE18 4EC3010C */  jal        EnMessageQueueData
/* 9C61C 800ABE1C 2130E002 */   addu      $a2, $s7, $zero
.L800ABE20:
/* 9C620 800ABE20 C0101300 */  sll        $v0, $s3, 3
/* 9C624 800ABE24 21105300 */  addu       $v0, $v0, $s3
/* 9C628 800ABE28 C0100200 */  sll        $v0, $v0, 3
/* 9C62C 800ABE2C 23105300 */  subu       $v0, $v0, $s3
/* 9C630 800ABE30 80100200 */  sll        $v0, $v0, 2
/* 9C634 800ABE34 08004324 */  addiu      $v1, $v0, 0x8
/* 9C638 800ABE38 21A04302 */  addu       $s4, $s2, $v1
/* 9C63C 800ABE3C 04009526 */  addiu      $s5, $s4, 0x4
/* 9C640 800ABE40 21F04202 */  addu       $fp, $s2, $v0
.L800ABE44:
/* 9C644 800ABE44 39C3010C */  jal        PeekMessageQueue
/* 9C648 800ABE48 2120A002 */   addu      $a0, $s5, $zero
/* 9C64C 800ABE4C 21804000 */  addu       $s0, $v0, $zero
/* 9C650 800ABE50 E6000012 */  beqz       $s0, .L800AC1EC
/* 9C654 800ABE54 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 9C658 800ABE58 0000038E */  lw         $v1, 0x0($s0)
/* 9C65C 800ABE5C 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 9C660 800ABE60 DE006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C664 800ABE64 2A104300 */   slt       $v0, $v0, $v1
/* 9C668 800ABE68 21004014 */  bnez       $v0, .L800ABEF0
/* 9C66C 800ABE6C 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 9C670 800ABE70 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 9C674 800ABE74 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9C678 800ABE78 D8006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C67C 800ABE7C 2A104300 */   slt       $v0, $v0, $v1
/* 9C680 800ABE80 0C004014 */  bnez       $v0, .L800ABEB4
/* 9C684 800ABE84 1000023C */   lui       $v0, (0x100000 >> 16)
/* 9C688 800ABE88 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 9C68C 800ABE8C 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 9C690 800ABE90 AE006210 */  beq        $v1, $v0, .L800AC14C
/* 9C694 800ABE94 2A106200 */   slt       $v0, $v1, $v0
/* 9C698 800ABE98 D0004014 */  bnez       $v0, .L800AC1DC
/* 9C69C 800ABE9C 0080023C */   lui       $v0, (0x80000008 >> 16)
/* 9C6A0 800ABEA0 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9C6A4 800ABEA4 CD006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C6A8 800ABEA8 21204002 */   addu      $a0, $s2, $zero
/* 9C6AC 800ABEAC 74B00208 */  j          .L800AC1D0
/* 9C6B0 800ABEB0 00000000 */   nop
.L800ABEB4:
/* 9C6B4 800ABEB4 4E006210 */  beq        $v1, $v0, .L800ABFF0
/* 9C6B8 800ABEB8 2A104300 */   slt       $v0, $v0, $v1
/* 9C6BC 800ABEBC 07004014 */  bnez       $v0, .L800ABEDC
/* 9C6C0 800ABEC0 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9C6C4 800ABEC4 0400023C */  lui        $v0, (0x40005 >> 16)
/* 9C6C8 800ABEC8 05004234 */  ori        $v0, $v0, (0x40005 & 0xFFFF)
/* 9C6CC 800ABECC B4006210 */  beq        $v1, $v0, .L800AC1A0
/* 9C6D0 800ABED0 21204002 */   addu      $a0, $s2, $zero
/* 9C6D4 800ABED4 74B00208 */  j          .L800AC1D0
/* 9C6D8 800ABED8 00000000 */   nop
.L800ABEDC:
/* 9C6DC 800ABEDC 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9C6E0 800ABEE0 25006210 */  beq        $v1, $v0, .L800ABF78
/* 9C6E4 800ABEE4 21204002 */   addu      $a0, $s2, $zero
/* 9C6E8 800ABEE8 74B00208 */  j          .L800AC1D0
/* 9C6EC 800ABEEC 00000000 */   nop
.L800ABEF0:
/* 9C6F0 800ABEF0 5D006210 */  beq        $v1, $v0, .L800AC068
/* 9C6F4 800ABEF4 2A104300 */   slt       $v0, $v0, $v1
/* 9C6F8 800ABEF8 11004014 */  bnez       $v0, .L800ABF40
/* 9C6FC 800ABEFC 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9C700 800ABF00 0004023C */  lui        $v0, (0x4000001 >> 16)
/* 9C704 800ABF04 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 9C708 800ABF08 B4006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C70C 800ABF0C 2A104300 */   slt       $v0, $v0, $v1
/* 9C710 800ABF10 06004014 */  bnez       $v0, .L800ABF2C
/* 9C714 800ABF14 0104023C */   lui       $v0, (0x4010008 >> 16)
/* 9C718 800ABF18 0002023C */  lui        $v0, (0x2000008 >> 16)
/* 9C71C 800ABF1C 9C006210 */  beq        $v1, $v0, .L800AC190
/* 9C720 800ABF20 21204002 */   addu      $a0, $s2, $zero
/* 9C724 800ABF24 74B00208 */  j          .L800AC1D0
/* 9C728 800ABF28 00000000 */   nop
.L800ABF2C:
/* 9C72C 800ABF2C 08004234 */  ori        $v0, $v0, (0x2000008 & 0xFFFF)
/* 9C730 800ABF30 36006210 */  beq        $v1, $v0, .L800AC00C
/* 9C734 800ABF34 21204002 */   addu      $a0, $s2, $zero
/* 9C738 800ABF38 74B00208 */  j          .L800AC1D0
/* 9C73C 800ABF3C 00000000 */   nop
.L800ABF40:
/* 9C740 800ABF40 29006210 */  beq        $v1, $v0, .L800ABFE8
/* 9C744 800ABF44 2A104300 */   slt       $v0, $v0, $v1
/* 9C748 800ABF48 06004014 */  bnez       $v0, .L800ABF64
/* 9C74C 800ABF4C 0020023C */   lui       $v0, (0x20000001 >> 16)
/* 9C750 800ABF50 0008023C */  lui        $v0, (0x8000001 >> 16)
/* 9C754 800ABF54 A1006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C758 800ABF58 21204002 */   addu      $a0, $s2, $zero
/* 9C75C 800ABF5C 74B00208 */  j          .L800AC1D0
/* 9C760 800ABF60 00000000 */   nop
.L800ABF64:
/* 9C764 800ABF64 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 9C768 800ABF68 6A006210 */  beq        $v1, $v0, .L800AC114
/* 9C76C 800ABF6C 21204002 */   addu      $a0, $s2, $zero
/* 9C770 800ABF70 74B00208 */  j          .L800AC1D0
/* 9C774 800ABF74 00000000 */   nop
.L800ABF78:
/* 9C778 800ABF78 0A006016 */  bnez       $s3, .L800ABFA4
/* 9C77C 800ABF7C 19010224 */   addiu     $v0, $zero, 0x119
/* 9C780 800ABF80 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9C784 800ABF84 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9C788 800ABF88 00010224 */  addiu      $v0, $zero, 0x100
/* 9C78C 800ABF8C 02006210 */  beq        $v1, $v0, .L800ABF98
/* 9C790 800ABF90 19050224 */   addiu     $v0, $zero, 0x519
/* 9C794 800ABF94 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800ABF98:
/* 9C798 800ABF98 1C0140AE */  sw         $zero, 0x11C($s2)
/* 9C79C 800ABF9C C4F980A7 */  sh         $zero, %gp_rel(Raziel + 0x394)($gp)
/* 9C7A0 800ABFA0 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
.L800ABFA4:
/* 9C7A4 800ABFA4 0400028E */  lw         $v0, 0x4($s0)
/* 9C7A8 800ABFA8 00000000 */  nop
/* 9C7AC 800ABFAC 8B004010 */  beqz       $v0, .L800AC1DC
/* 9C7B0 800ABFB0 00000000 */   nop
/* 9C7B4 800ABFB4 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9C7B8 800ABFB8 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 9C7BC 800ABFBC 0000428C */  lw         $v0, 0x0($v0)
/* 9C7C0 800ABFC0 00000000 */  nop
/* 9C7C4 800ABFC4 24104300 */  and        $v0, $v0, $v1
/* 9C7C8 800ABFC8 84004010 */  beqz       $v0, .L800AC1DC
/* 9C7CC 800ABFCC 8C008426 */   addiu     $a0, $s4, 0x8C
/* 9C7D0 800ABFD0 0080053C */  lui        $a1, (0x80000001 >> 16)
/* 9C7D4 800ABFD4 0100A534 */  ori        $a1, $a1, (0x80000001 & 0xFFFF)
/* 9C7D8 800ABFD8 4EC3010C */  jal        EnMessageQueueData
/* 9C7DC 800ABFDC 21300000 */   addu      $a2, $zero, $zero
/* 9C7E0 800ABFE0 77B00208 */  j          .L800AC1DC
/* 9C7E4 800ABFE4 00000000 */   nop
.L800ABFE8:
/* 9C7E8 800ABFE8 77B00208 */  j          .L800AC1DC
/* 9C7EC 800ABFEC 01001724 */   addiu     $s7, $zero, 0x1
.L800ABFF0:
/* 9C7F0 800ABFF0 21204002 */  addu       $a0, $s2, $zero
/* 9C7F4 800ABFF4 0A80053C */  lui        $a1, %hi(StateHandlerForcedGlide)
/* 9C7F8 800ABFF8 8CB6A524 */  addiu      $a1, $a1, %lo(StateHandlerForcedGlide)
/* 9C7FC 800ABFFC F4CA010C */  jal        StateSwitchStateCharacterData
/* 9C800 800AC000 21300000 */   addu      $a2, $zero, $zero
/* 9C804 800AC004 77B00208 */  j          .L800AC1DC
/* 9C808 800AC008 00000000 */   nop
.L800AC00C:
/* 9C80C 800AC00C 0700C012 */  beqz       $s6, .L800AC02C
/* 9C810 800AC010 2120A002 */   addu      $a0, $s5, $zero
/* 9C814 800AC014 0104053C */  lui        $a1, (0x4010008 >> 16)
/* 9C818 800AC018 0800A534 */  ori        $a1, $a1, (0x4010008 & 0xFFFF)
/* 9C81C 800AC01C 4EC3010C */  jal        EnMessageQueueData
/* 9C820 800AC020 21300000 */   addu      $a2, $zero, $zero
/* 9C824 800AC024 11B00208 */  j          .L800AC044
/* 9C828 800AC028 21B00000 */   addu      $s6, $zero, $zero
.L800AC02C:
/* 9C82C 800AC02C 21204002 */  addu       $a0, $s2, $zero
/* 9C830 800AC030 21286002 */  addu       $a1, $s3, $zero
/* 9C834 800AC034 0B80063C */  lui        $a2, %hi(StateHandlerDeCompression)
/* 9C838 800AC038 18C8C624 */  addiu      $a2, $a2, %lo(StateHandlerDeCompression)
/* 9C83C 800AC03C C1CA010C */  jal        StateSwitchStateData
/* 9C840 800AC040 2138E002 */   addu      $a3, $s7, $zero
.L800AC044:
/* 9C844 800AC044 02000224 */  addiu      $v0, $zero, 0x2
/* 9C848 800AC048 2001C2AF */  sw         $v0, 0x120($fp)
/* 9C84C 800AC04C 0000448E */  lw         $a0, 0x0($s2)
/* 9C850 800AC050 03000224 */  addiu      $v0, $zero, 0x3
/* 9C854 800AC054 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9C858 800AC058 6B68020C */  jal        ResetPhysics
/* 9C85C 800AC05C F0FF0524 */   addiu     $a1, $zero, -0x10
/* 9C860 800AC060 77B00208 */  j          .L800AC1DC
/* 9C864 800AC064 00000000 */   nop
.L800AC068:
/* 9C868 800AC068 0400118E */  lw         $s1, 0x4($s0)
/* 9C86C 800AC06C 00000000 */  nop
/* 9C870 800AC070 0C002286 */  lh         $v0, 0xC($s1)
/* 9C874 800AC074 00000000 */  nop
/* 9C878 800AC078 0E004104 */  bgez       $v0, .L800AC0B4
/* 9C87C 800AC07C FBFF033C */   lui       $v1, (0xFFFBFFFF >> 16)
/* 9C880 800AC080 0000448E */  lw         $a0, 0x0($s2)
/* 9C884 800AC084 00000000 */  nop
/* 9C888 800AC088 7C01828C */  lw         $v0, 0x17C($a0)
/* 9C88C 800AC08C 00000000 */  nop
/* 9C890 800AC090 09004014 */  bnez       $v0, .L800AC0B8
/* 9C894 800AC094 FFFF6334 */   ori       $v1, $v1, (0xFFFBFFFF & 0xFFFF)
/* 9C898 800AC098 8801828C */  lw         $v0, 0x188($a0)
/* 9C89C 800AC09C 00000000 */  nop
/* 9C8A0 800AC0A0 04004004 */  bltz       $v0, .L800AC0B4
/* 9C8A4 800AC0A4 FBFF033C */   lui       $v1, (0xFFFBFFFF >> 16)
/* 9C8A8 800AC0A8 6B68020C */  jal        ResetPhysics
/* 9C8AC 800AC0AC F0FF0524 */   addiu     $a1, $zero, -0x10
/* 9C8B0 800AC0B0 FBFF033C */  lui        $v1, (0xFFFBFFFF >> 16)
.L800AC0B4:
/* 9C8B4 800AC0B4 FFFF6334 */  ori        $v1, $v1, (0xFFFBFFFF & 0xFFFF)
.L800AC0B8:
/* 9C8B8 800AC0B8 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9C8BC 800AC0BC 21204002 */  addu       $a0, $s2, $zero
/* 9C8C0 800AC0C0 24104300 */  and        $v0, $v0, $v1
/* 9C8C4 800AC0C4 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9C8C8 800AC0C8 0400068E */  lw         $a2, 0x4($s0)
/* 9C8CC 800AC0CC 369B020C */  jal        razEnterWater
/* 9C8D0 800AC0D0 21286002 */   addu      $a1, $s3, $zero
/* 9C8D4 800AC0D4 0E002386 */  lh         $v1, 0xE($s1)
/* 9C8D8 800AC0D8 00000000 */  nop
/* 9C8DC 800AC0DC 3F006104 */  bgez       $v1, .L800AC1DC
/* 9C8E0 800AC0E0 01800224 */   addiu     $v0, $zero, -0x7FFF
/* 9C8E4 800AC0E4 3D006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C8E8 800AC0E8 01000224 */   addiu     $v0, $zero, 0x1
/* 9C8EC 800AC0EC 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 9C8F0 800AC0F0 00000000 */  nop
/* 9C8F4 800AC0F4 39006214 */  bne        $v1, $v0, .L800AC1DC
/* 9C8F8 800AC0F8 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 9C8FC 800AC0FC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9C900 800AC100 00000000 */  nop
/* 9C904 800AC104 25104300 */  or         $v0, $v0, $v1
/* 9C908 800AC108 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9C90C 800AC10C 77B00208 */  j          .L800AC1DC
/* 9C910 800AC110 00000000 */   nop
.L800AC114:
/* 9C914 800AC114 90F98527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x360)
/* 9C918 800AC118 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9C91C 800AC11C 10000224 */  addiu      $v0, $zero, 0x10
/* 9C920 800AC120 2E006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C924 800AC124 20000224 */   addiu     $v0, $zero, 0x20
/* 9C928 800AC128 2C006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C92C 800AC12C 00000000 */   nop
/* 9C930 800AC130 2A006016 */  bnez       $s3, .L800AC1DC
/* 9C934 800AC134 00000000 */   nop
/* 9C938 800AC138 0000448E */  lw         $a0, 0x0($s2)
/* 9C93C 800AC13C 1069020C */  jal        SetDropPhysics
/* 9C940 800AC140 A0FCA524 */   addiu     $a1, $a1, -0x360
/* 9C944 800AC144 77B00208 */  j          .L800AC1DC
/* 9C948 800AC148 00000000 */   nop
.L800AC14C:
/* 9C94C 800AC14C 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 9C950 800AC150 03000224 */  addiu      $v0, $zero, 0x3
/* 9C954 800AC154 21006210 */  beq        $v1, $v0, .L800AC1DC
/* 9C958 800AC158 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 9C95C 800AC15C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9C960 800AC160 00000000 */  nop
/* 9C964 800AC164 24104300 */  and        $v0, $v0, $v1
/* 9C968 800AC168 1C004014 */  bnez       $v0, .L800AC1DC
/* 9C96C 800AC16C 00000000 */   nop
/* 9C970 800AC170 1A006016 */  bnez       $s3, .L800AC1DC
/* 9C974 800AC174 21204002 */   addu      $a0, $s2, $zero
/* 9C978 800AC178 0B80053C */  lui        $a1, %hi(StateHandlerGlide)
/* 9C97C 800AC17C 88CBA524 */  addiu      $a1, $a1, %lo(StateHandlerGlide)
/* 9C980 800AC180 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9C984 800AC184 03000624 */   addiu     $a2, $zero, 0x3
/* 9C988 800AC188 77B00208 */  j          .L800AC1DC
/* 9C98C 800AC18C 00000000 */   nop
.L800AC190:
/* 9C990 800AC190 3A96020C */  jal        razPickupAndGrab
/* 9C994 800AC194 21286002 */   addu      $a1, $s3, $zero
/* 9C998 800AC198 77B00208 */  j          .L800AC1DC
/* 9C99C 800AC19C 00000000 */   nop
.L800AC1A0:
/* 9C9A0 800AC1A0 0100023C */  lui        $v0, (0x1869F >> 16)
/* 9C9A4 800AC1A4 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 9C9A8 800AC1A8 9F864234 */  ori        $v0, $v0, (0x1869F & 0xFFFF)
/* 9C9AC 800AC1AC 2A104300 */  slt        $v0, $v0, $v1
/* 9C9B0 800AC1B0 0A004014 */  bnez       $v0, .L800AC1DC
/* 9C9B4 800AC1B4 21286002 */   addu      $a1, $s3, $zero
/* 9C9B8 800AC1B8 0A80063C */  lui        $a2, %hi(StateHandlerStumble)
/* 9C9BC 800AC1BC 44D1C624 */  addiu      $a2, $a2, %lo(StateHandlerStumble)
/* 9C9C0 800AC1C0 C1CA010C */  jal        StateSwitchStateData
/* 9C9C4 800AC1C4 21380000 */   addu      $a3, $zero, $zero
/* 9C9C8 800AC1C8 77B00208 */  j          .L800AC1DC
/* 9C9CC 800AC1CC 00000000 */   nop
.L800AC1D0:
/* 9C9D0 800AC1D0 4000A68F */  lw         $a2, 0x40($sp)
/* 9C9D4 800AC1D4 B9BF020C */  jal        DefaultStateHandler
/* 9C9D8 800AC1D8 21286002 */   addu      $a1, $s3, $zero
.L800AC1DC:
/* 9C9DC 800AC1DC 27C3010C */  jal        DeMessageQueue
/* 9C9E0 800AC1E0 04008426 */   addiu     $a0, $s4, 0x4
/* 9C9E4 800AC1E4 91AF0208 */  j          .L800ABE44
/* 9C9E8 800AC1E8 00000000 */   nop
.L800AC1EC:
/* 9C9EC 800AC1EC 3400BF8F */  lw         $ra, 0x34($sp)
/* 9C9F0 800AC1F0 3000BE8F */  lw         $fp, 0x30($sp)
/* 9C9F4 800AC1F4 2C00B78F */  lw         $s7, 0x2C($sp)
/* 9C9F8 800AC1F8 2800B68F */  lw         $s6, 0x28($sp)
/* 9C9FC 800AC1FC 2400B58F */  lw         $s5, 0x24($sp)
/* 9CA00 800AC200 2000B48F */  lw         $s4, 0x20($sp)
/* 9CA04 800AC204 1C00B38F */  lw         $s3, 0x1C($sp)
/* 9CA08 800AC208 1800B28F */  lw         $s2, 0x18($sp)
/* 9CA0C 800AC20C 1400B18F */  lw         $s1, 0x14($sp)
/* 9CA10 800AC210 1000B08F */  lw         $s0, 0x10($sp)
/* 9CA14 800AC214 0800E003 */  jr         $ra
/* 9CA18 800AC218 3800BD27 */   addiu     $sp, $sp, 0x38
.size StateHandlerFall, . - StateHandlerFall
