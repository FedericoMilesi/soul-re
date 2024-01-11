.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerBlock
/* 9CBFC 800AC3FC B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 9CC00 800AC400 3000B2AF */  sw         $s2, 0x30($sp)
/* 9CC04 800AC404 21908000 */  addu       $s2, $a0, $zero
/* 9CC08 800AC408 3800B4AF */  sw         $s4, 0x38($sp)
/* 9CC0C 800AC40C 21A0A000 */  addu       $s4, $a1, $zero
/* 9CC10 800AC410 4400B7AF */  sw         $s7, 0x44($sp)
/* 9CC14 800AC414 21B8C000 */  addu       $s7, $a2, $zero
/* 9CC18 800AC418 4800BFAF */  sw         $ra, 0x48($sp)
/* 9CC1C 800AC41C 4000B6AF */  sw         $s6, 0x40($sp)
/* 9CC20 800AC420 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 9CC24 800AC424 3400B3AF */  sw         $s3, 0x34($sp)
/* 9CC28 800AC428 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 9CC2C 800AC42C A9C9010C */  jal        G2EmulationQueryAnimation
/* 9CC30 800AC430 2800B0AF */   sw        $s0, 0x28($sp)
/* 9CC34 800AC434 05008016 */  bnez       $s4, .L800AC44C
/* 9CC38 800AC438 21984000 */   addu      $s3, $v0, $zero
/* 9CC3C 800AC43C 18A8828F */  lw         $v0, %gp_rel(BlockCount)($gp)
/* 9CC40 800AC440 00000000 */  nop
/* 9CC44 800AC444 01004224 */  addiu      $v0, $v0, 0x1
/* 9CC48 800AC448 18A882AF */  sw         $v0, %gp_rel(BlockCount)($gp)
.L800AC44C:
/* 9CC4C 800AC44C C0101400 */  sll        $v0, $s4, 3
/* 9CC50 800AC450 21105400 */  addu       $v0, $v0, $s4
/* 9CC54 800AC454 C0100200 */  sll        $v0, $v0, 3
/* 9CC58 800AC458 23105400 */  subu       $v0, $v0, $s4
/* 9CC5C 800AC45C 80A80200 */  sll        $s5, $v0, 2
/* 9CC60 800AC460 0800A226 */  addiu      $v0, $s5, 0x8
/* 9CC64 800AC464 21B04202 */  addu       $s6, $s2, $v0
.L800AC468:
/* 9CC68 800AC468 39C3010C */  jal        PeekMessageQueue
/* 9CC6C 800AC46C 0400C426 */   addiu     $a0, $s6, 0x4
/* 9CC70 800AC470 21204000 */  addu       $a0, $v0, $zero
/* 9CC74 800AC474 DD008010 */  beqz       $a0, .L800AC7EC
/* 9CC78 800AC478 0004023C */   lui       $v0, (0x4000001 >> 16)
/* 9CC7C 800AC47C 0000838C */  lw         $v1, 0x0($a0)
/* 9CC80 800AC480 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 9CC84 800AC484 D5006210 */  beq        $v1, $v0, .L800AC7DC
/* 9CC88 800AC488 2A104300 */   slt       $v0, $v0, $v1
/* 9CC8C 800AC48C 12004014 */  bnez       $v0, .L800AC4D8
/* 9CC90 800AC490 00000000 */   nop
/* 9CC94 800AC494 94006010 */  beqz       $v1, .L800AC6E8
/* 9CC98 800AC498 00000000 */   nop
/* 9CC9C 800AC49C 0600601C */  bgtz       $v1, .L800AC4B8
/* 9CCA0 800AC4A0 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9CCA4 800AC4A4 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 9CCA8 800AC4A8 CC006210 */  beq        $v1, $v0, .L800AC7DC
/* 9CCAC 800AC4AC 21204002 */   addu      $a0, $s2, $zero
/* 9CCB0 800AC4B0 F5B10208 */  j          .L800AC7D4
/* 9CCB4 800AC4B4 21288002 */   addu      $a1, $s4, $zero
.L800AC4B8:
/* 9CCB8 800AC4B8 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 9CCBC 800AC4BC 18006210 */  beq        $v1, $v0, .L800AC520
/* 9CCC0 800AC4C0 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9CCC4 800AC4C4 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9CCC8 800AC4C8 2A006210 */  beq        $v1, $v0, .L800AC574
/* 9CCCC 800AC4CC 21204002 */   addu      $a0, $s2, $zero
/* 9CCD0 800AC4D0 F5B10208 */  j          .L800AC7D4
/* 9CCD4 800AC4D4 21288002 */   addu      $a1, $s4, $zero
.L800AC4D8:
/* 9CCD8 800AC4D8 0104023C */  lui        $v0, (0x4010400 >> 16)
/* 9CCDC 800AC4DC 00044234 */  ori        $v0, $v0, (0x4010400 & 0xFFFF)
/* 9CCE0 800AC4E0 8F006210 */  beq        $v1, $v0, .L800AC720
/* 9CCE4 800AC4E4 2A104300 */   slt       $v0, $v0, $v1
/* 9CCE8 800AC4E8 07004014 */  bnez       $v0, .L800AC508
/* 9CCEC 800AC4EC 0008023C */   lui       $v0, (0x8000004 >> 16)
/* 9CCF0 800AC4F0 0104023C */  lui        $v0, (0x4010200 >> 16)
/* 9CCF4 800AC4F4 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* 9CCF8 800AC4F8 B8006210 */  beq        $v1, $v0, .L800AC7DC
/* 9CCFC 800AC4FC 21204002 */   addu      $a0, $s2, $zero
/* 9CD00 800AC500 F5B10208 */  j          .L800AC7D4
/* 9CD04 800AC504 21288002 */   addu      $a1, $s4, $zero
.L800AC508:
/* 9CD08 800AC508 23006210 */  beq        $v1, $v0, .L800AC598
/* 9CD0C 800AC50C 04004234 */   ori       $v0, $v0, (0x8000004 & 0xFFFF)
/* 9CD10 800AC510 57006210 */  beq        $v1, $v0, .L800AC670
/* 9CD14 800AC514 21204002 */   addu      $a0, $s2, $zero
/* 9CD18 800AC518 F5B10208 */  j          .L800AC7D4
/* 9CD1C 800AC51C 21288002 */   addu      $a1, $s4, $zero
.L800AC520:
/* 9CD20 800AC520 12008016 */  bnez       $s4, .L800AC56C
/* 9CD24 800AC524 21105502 */   addu      $v0, $s2, $s5
/* 9CD28 800AC528 8000023C */  lui        $v0, (0x800000 >> 16)
/* 9CD2C 800AC52C 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9CD30 800AC530 0000448E */  lw         $a0, 0x0($s2)
/* 9CD34 800AC534 09800234 */  ori        $v0, $zero, 0x8009
/* 9CD38 800AC538 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9CD3C 800AC53C 03000224 */  addiu      $v0, $zero, 0x3
/* 9CD40 800AC540 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9CD44 800AC544 938B020C */  jal        SteerSwitchMode
/* 9CD48 800AC548 21280000 */   addu      $a1, $zero, $zero
/* 9CD4C 800AC54C 21204002 */  addu       $a0, $s2, $zero
/* 9CD50 800AC550 51000524 */  addiu      $a1, $zero, 0x51
/* 9CD54 800AC554 21300000 */  addu       $a2, $zero, $zero
/* 9CD58 800AC558 0A000724 */  addiu      $a3, $zero, 0xA
/* 9CD5C 800AC55C 01000224 */  addiu      $v0, $zero, 0x1
/* 9CD60 800AC560 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9CD64 800AC564 1000A2AF */   sw        $v0, 0x10($sp)
/* 9CD68 800AC568 21105502 */  addu       $v0, $s2, $s5
.L800AC56C:
/* 9CD6C 800AC56C F7B10208 */  j          .L800AC7DC
/* 9CD70 800AC570 1C0140AC */   sw        $zero, 0x11C($v0)
.L800AC574:
/* 9CD74 800AC574 0000448E */  lw         $a0, 0x0($s2)
/* 9CD78 800AC578 EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 9CD7C 800AC57C 01000524 */   addiu     $a1, $zero, 0x1
/* 9CD80 800AC580 0000448E */  lw         $a0, 0x0($s2)
/* 9CD84 800AC584 18A880AF */  sw         $zero, %gp_rel(BlockCount)($gp)
/* 9CD88 800AC588 CD3E010C */  jal        FX_EndPassthruFX
/* 9CD8C 800AC58C 00000000 */   nop
/* 9CD90 800AC590 F7B10208 */  j          .L800AC7DC
/* 9CD94 800AC594 00000000 */   nop
.L800AC598:
/* 9CD98 800AC598 90008016 */  bnez       $s4, .L800AC7DC
/* 9CD9C 800AC59C 52000224 */   addiu     $v0, $zero, 0x52
/* 9CDA0 800AC5A0 03006212 */  beq        $s3, $v0, .L800AC5B0
/* 9CDA4 800AC5A4 6C000224 */   addiu     $v0, $zero, 0x6C
/* 9CDA8 800AC5A8 11006216 */  bne        $s3, $v0, .L800AC5F0
/* 9CDAC 800AC5AC 00000000 */   nop
.L800AC5B0:
/* 9CDB0 800AC5B0 21200000 */  addu       $a0, $zero, $zero
/* 9CDB4 800AC5B4 21288000 */  addu       $a1, $a0, $zero
/* 9CDB8 800AC5B8 4FC6010C */  jal        SetControlInitIdleData
/* 9CDBC 800AC5BC 03000624 */   addiu     $a2, $zero, 0x3
/* 9CDC0 800AC5C0 21204002 */  addu       $a0, $s2, $zero
/* 9CDC4 800AC5C4 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9CDC8 800AC5C8 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9CDCC 800AC5CC F4CA010C */  jal        StateSwitchStateCharacterData
/* 9CDD0 800AC5D0 21304000 */   addu      $a2, $v0, $zero
/* 9CDD4 800AC5D4 6C000224 */  addiu      $v0, $zero, 0x6C
/* 9CDD8 800AC5D8 80006216 */  bne        $s3, $v0, .L800AC7DC
/* 9CDDC 800AC5DC 00000000 */   nop
/* 9CDE0 800AC5E0 C89E020C */  jal        razSetPlayerEventHistory
/* 9CDE4 800AC5E4 0100043C */   lui       $a0, (0x10000 >> 16)
/* 9CDE8 800AC5E8 F7B10208 */  j          .L800AC7DC
/* 9CDEC 800AC5EC 00000000 */   nop
.L800AC5F0:
/* 9CDF0 800AC5F0 1C01428E */  lw         $v0, 0x11C($s2)
/* 9CDF4 800AC5F4 00000000 */  nop
/* 9CDF8 800AC5F8 11004010 */  beqz       $v0, .L800AC640
/* 9CDFC 800AC5FC 21204002 */   addu      $a0, $s2, $zero
/* 9CE00 800AC600 6C000524 */  addiu      $a1, $zero, 0x6C
/* 9CE04 800AC604 21300000 */  addu       $a2, $zero, $zero
/* 9CE08 800AC608 05000724 */  addiu      $a3, $zero, 0x5
/* 9CE0C 800AC60C 01000224 */  addiu      $v0, $zero, 0x1
/* 9CE10 800AC610 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9CE14 800AC614 1000A2AF */   sw        $v0, 0x10($sp)
/* 9CE18 800AC618 0000448E */  lw         $a0, 0x0($s2)
/* 9CE1C 800AC61C 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 9CE20 800AC620 01000524 */   addiu     $a1, $zero, 0x1
/* 9CE24 800AC624 D0F98427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x3A0)
/* 9CE28 800AC628 5998020C */  jal        razGetRotFromNormal
/* 9CE2C 800AC62C 1800A527 */   addiu     $a1, $sp, 0x18
/* 9CE30 800AC630 0000438E */  lw         $v1, 0x0($s2)
/* 9CE34 800AC634 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 9CE38 800AC638 F7B10208 */  j          .L800AC7DC
/* 9CE3C 800AC63C 780062A4 */   sh        $v0, 0x78($v1)
.L800AC640:
/* 9CE40 800AC640 52000524 */  addiu      $a1, $zero, 0x52
/* 9CE44 800AC644 21300000 */  addu       $a2, $zero, $zero
/* 9CE48 800AC648 03000724 */  addiu      $a3, $zero, 0x3
/* 9CE4C 800AC64C 01000224 */  addiu      $v0, $zero, 0x1
/* 9CE50 800AC650 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9CE54 800AC654 1000A2AF */   sw        $v0, 0x10($sp)
/* 9CE58 800AC658 40060224 */  addiu      $v0, $zero, 0x640
/* 9CE5C 800AC65C 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 9CE60 800AC660 0000438E */  lw         $v1, 0x0($s2)
/* 9CE64 800AC664 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 9CE68 800AC668 F7B10208 */  j          .L800AC7DC
/* 9CE6C 800AC66C F80162AC */   sw        $v0, 0x1F8($v1)
.L800AC670:
/* 9CE70 800AC670 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9CE74 800AC674 00000000 */  nop
/* 9CE78 800AC678 01004230 */  andi       $v0, $v0, 0x1
/* 9CE7C 800AC67C 57004010 */  beqz       $v0, .L800AC7DC
/* 9CE80 800AC680 00000000 */   nop
/* 9CE84 800AC684 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9CE88 800AC688 0000448E */  lw         $a0, 0x0($s2)
/* 9CE8C 800AC68C 0000458C */  lw         $a1, 0x0($v0)
/* 9CE90 800AC690 2098020C */  jal        razGetForwardNormal
/* 9CE94 800AC694 00000000 */   nop
/* 9CE98 800AC698 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9CE9C 800AC69C 0000448E */  lw         $a0, 0x0($s2)
/* 9CEA0 800AC6A0 0000458C */  lw         $a1, 0x0($v0)
/* 9CEA4 800AC6A4 67CE020C */  jal        SetupReaction
/* 9CEA8 800AC6A8 00000000 */   nop
/* 9CEAC 800AC6AC 06000624 */  addiu      $a2, $zero, 0x6
/* 9CEB0 800AC6B0 D0F98487 */  lh         $a0, %gp_rel(Raziel + 0x3A0)($gp)
/* 9CEB4 800AC6B4 D2F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A2)($gp)
/* 9CEB8 800AC6B8 21380000 */  addu       $a3, $zero, $zero
/* 9CEBC 800AC6BC 1000A0AF */  sw         $zero, 0x10($sp)
/* 9CEC0 800AC6C0 23200400 */  negu       $a0, $a0
/* 9CEC4 800AC6C4 21C4010C */  jal        SetObjectData
/* 9CEC8 800AC6C8 23280500 */   negu      $a1, $a1
/* 9CECC 800AC6CC 08FA838F */  lw         $v1, %gp_rel(Raziel + 0x3D8)($gp)
/* 9CED0 800AC6D0 8000053C */  lui        $a1, (0x800000 >> 16)
/* 9CED4 800AC6D4 0000648C */  lw         $a0, 0x0($v1)
/* 9CED8 800AC6D8 A1D1000C */  jal        INSTANCE_Post
/* 9CEDC 800AC6DC 21304000 */   addu      $a2, $v0, $zero
/* 9CEE0 800AC6E0 F7B10208 */  j          .L800AC7DC
/* 9CEE4 800AC6E4 00000000 */   nop
.L800AC6E8:
/* 9CEE8 800AC6E8 3C008016 */  bnez       $s4, .L800AC7DC
/* 9CEEC 800AC6EC 6C000224 */   addiu     $v0, $zero, 0x6C
/* 9CEF0 800AC6F0 3A006212 */  beq        $s3, $v0, .L800AC7DC
/* 9CEF4 800AC6F4 21200000 */   addu      $a0, $zero, $zero
/* 9CEF8 800AC6F8 21288000 */  addu       $a1, $a0, $zero
/* 9CEFC 800AC6FC 4FC6010C */  jal        SetControlInitIdleData
/* 9CF00 800AC700 03000624 */   addiu     $a2, $zero, 0x3
/* 9CF04 800AC704 21204002 */  addu       $a0, $s2, $zero
/* 9CF08 800AC708 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9CF0C 800AC70C E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9CF10 800AC710 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9CF14 800AC714 21304000 */   addu      $a2, $v0, $zero
/* 9CF18 800AC718 F7B10208 */  j          .L800AC7DC
/* 9CF1C 800AC71C 00000000 */   nop
.L800AC720:
/* 9CF20 800AC720 0400918C */  lw         $s1, 0x4($a0)
/* 9CF24 800AC724 00000000 */  nop
/* 9CF28 800AC728 2000228E */  lw         $v0, 0x20($s1)
/* 9CF2C 800AC72C 0200033C */  lui        $v1, (0x20000 >> 16)
/* 9CF30 800AC730 24104300 */  and        $v0, $v0, $v1
/* 9CF34 800AC734 29004010 */  beqz       $v0, .L800AC7DC
/* 9CF38 800AC738 00000000 */   nop
/* 9CF3C 800AC73C 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 9CF40 800AC740 00000000 */  nop
/* 9CF44 800AC744 01004230 */  andi       $v0, $v0, 0x1
/* 9CF48 800AC748 24004010 */  beqz       $v0, .L800AC7DC
/* 9CF4C 800AC74C 02000224 */   addiu     $v0, $zero, 0x2
/* 9CF50 800AC750 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 9CF54 800AC754 00000000 */  nop
/* 9CF58 800AC758 20006214 */  bne        $v1, $v0, .L800AC7DC
/* 9CF5C 800AC75C 21200000 */   addu      $a0, $zero, $zero
/* 9CF60 800AC760 21288000 */  addu       $a1, $a0, $zero
/* 9CF64 800AC764 21308000 */  addu       $a2, $a0, $zero
/* 9CF68 800AC768 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 9CF6C 800AC76C 1800A727 */   addiu     $a3, $sp, 0x18
/* 9CF70 800AC770 21200000 */  addu       $a0, $zero, $zero
/* 9CF74 800AC774 C0FE0524 */  addiu      $a1, $zero, -0x140
/* 9CF78 800AC778 21308000 */  addu       $a2, $a0, $zero
/* 9CF7C 800AC77C 2000B027 */  addiu      $s0, $sp, 0x20
/* 9CF80 800AC780 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 9CF84 800AC784 21380002 */   addu      $a3, $s0, $zero
/* 9CF88 800AC788 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 9CF8C 800AC78C 1800A527 */  addiu      $a1, $sp, 0x18
/* 9CF90 800AC790 21300002 */  addu       $a2, $s0, $zero
/* 9CF94 800AC794 91DF010C */  jal        PHYSICS_CheckForObjectCollide
/* 9CF98 800AC798 01000724 */   addiu     $a3, $zero, 0x1
/* 9CF9C 800AC79C 0F004014 */  bnez       $v0, .L800AC7DC
/* 9CFA0 800AC7A0 21805502 */   addu      $s0, $s2, $s5
/* 9CFA4 800AC7A4 1C01028E */  lw         $v0, 0x11C($s0)
/* 9CFA8 800AC7A8 00000000 */  nop
/* 9CFAC 800AC7AC 0B004014 */  bnez       $v0, .L800AC7DC
/* 9CFB0 800AC7B0 00000000 */   nop
/* 9CFB4 800AC7B4 0000448E */  lw         $a0, 0x0($s2)
/* 9CFB8 800AC7B8 0C00258E */  lw         $a1, 0xC($s1)
/* 9CFBC 800AC7BC 1400268E */  lw         $a2, 0x14($s1)
/* 9CFC0 800AC7C0 963E010C */  jal        FX_StartPassthruFX
/* 9CFC4 800AC7C4 00000000 */   nop
/* 9CFC8 800AC7C8 01000224 */  addiu      $v0, $zero, 0x1
/* 9CFCC 800AC7CC F7B10208 */  j          .L800AC7DC
/* 9CFD0 800AC7D0 1C0102AE */   sw        $v0, 0x11C($s0)
.L800AC7D4:
/* 9CFD4 800AC7D4 B9BF020C */  jal        DefaultStateHandler
/* 9CFD8 800AC7D8 2130E002 */   addu      $a2, $s7, $zero
.L800AC7DC:
/* 9CFDC 800AC7DC 27C3010C */  jal        DeMessageQueue
/* 9CFE0 800AC7E0 0400C426 */   addiu     $a0, $s6, 0x4
/* 9CFE4 800AC7E4 1AB10208 */  j          .L800AC468
/* 9CFE8 800AC7E8 00000000 */   nop
.L800AC7EC:
/* 9CFEC 800AC7EC 4800BF8F */  lw         $ra, 0x48($sp)
/* 9CFF0 800AC7F0 4400B78F */  lw         $s7, 0x44($sp)
/* 9CFF4 800AC7F4 4000B68F */  lw         $s6, 0x40($sp)
/* 9CFF8 800AC7F8 3C00B58F */  lw         $s5, 0x3C($sp)
/* 9CFFC 800AC7FC 3800B48F */  lw         $s4, 0x38($sp)
/* 9D000 800AC800 3400B38F */  lw         $s3, 0x34($sp)
/* 9D004 800AC804 3000B28F */  lw         $s2, 0x30($sp)
/* 9D008 800AC808 2C00B18F */  lw         $s1, 0x2C($sp)
/* 9D00C 800AC80C 2800B08F */  lw         $s0, 0x28($sp)
/* 9D010 800AC810 0800E003 */  jr         $ra
/* 9D014 800AC814 5000BD27 */   addiu     $sp, $sp, 0x50
.size StateHandlerBlock, . - StateHandlerBlock
