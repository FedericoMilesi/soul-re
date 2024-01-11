.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerHitReaction
/* 8DD68 8009D568 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8DD6C 8009D56C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8DD70 8009D570 21888000 */  addu       $s1, $a0, $zero
/* 8DD74 8009D574 2000B2AF */  sw         $s2, 0x20($sp)
/* 8DD78 8009D578 2190A000 */  addu       $s2, $a1, $zero
/* 8DD7C 8009D57C 2800B4AF */  sw         $s4, 0x28($sp)
/* 8DD80 8009D580 21A0C000 */  addu       $s4, $a2, $zero
/* 8DD84 8009D584 C0101200 */  sll        $v0, $s2, 3
/* 8DD88 8009D588 21105200 */  addu       $v0, $v0, $s2
/* 8DD8C 8009D58C C0100200 */  sll        $v0, $v0, 3
/* 8DD90 8009D590 23105200 */  subu       $v0, $v0, $s2
/* 8DD94 8009D594 80100200 */  sll        $v0, $v0, 2
/* 8DD98 8009D598 08004224 */  addiu      $v0, $v0, 0x8
/* 8DD9C 8009D59C 2400B3AF */  sw         $s3, 0x24($sp)
/* 8DDA0 8009D5A0 21982202 */  addu       $s3, $s1, $v0
/* 8DDA4 8009D5A4 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 8DDA8 8009D5A8 1800B0AF */  sw         $s0, 0x18($sp)
.L8009D5AC:
/* 8DDAC 8009D5AC 39C3010C */  jal        PeekMessageQueue
/* 8DDB0 8009D5B0 04006426 */   addiu     $a0, $s3, 0x4
/* 8DDB4 8009D5B4 83004010 */  beqz       $v0, .L8009D7C4
/* 8DDB8 8009D5B8 1000043C */   lui       $a0, (0x100001 >> 16)
/* 8DDBC 8009D5BC 0000438C */  lw         $v1, 0x0($v0)
/* 8DDC0 8009D5C0 01008434 */  ori        $a0, $a0, (0x100001 & 0xFFFF)
/* 8DDC4 8009D5C4 21006410 */  beq        $v1, $a0, .L8009D64C
/* 8DDC8 8009D5C8 00000000 */   nop
/* 8DDCC 8009D5CC 2A108300 */  slt        $v0, $a0, $v1
/* 8DDD0 8009D5D0 0B004014 */  bnez       $v0, .L8009D600
/* 8DDD4 8009D5D4 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 8DDD8 8009D5D8 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 8DDDC 8009D5DC 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 8DDE0 8009D5E0 2A104300 */  slt        $v0, $v0, $v1
/* 8DDE4 8009D5E4 73004010 */  beqz       $v0, .L8009D7B4
/* 8DDE8 8009D5E8 0080023C */   lui       $v0, (0x80000020 >> 16)
/* 8DDEC 8009D5EC 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8DDF0 8009D5F0 70006210 */  beq        $v1, $v0, .L8009D7B4
/* 8DDF4 8009D5F4 21202002 */   addu      $a0, $s1, $zero
/* 8DDF8 8009D5F8 EB750208 */  j          .L8009D7AC
/* 8DDFC 8009D5FC 21284002 */   addu      $a1, $s2, $zero
.L8009D600:
/* 8DE00 8009D600 6C006210 */  beq        $v1, $v0, .L8009D7B4
/* 8DE04 8009D604 2A104300 */   slt       $v0, $v0, $v1
/* 8DE08 8009D608 06004014 */  bnez       $v0, .L8009D624
/* 8DE0C 8009D60C 0008023C */   lui       $v0, (0x8000001 >> 16)
/* 8DE10 8009D610 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 8DE14 8009D614 67006210 */  beq        $v1, $v0, .L8009D7B4
/* 8DE18 8009D618 21202002 */   addu      $a0, $s1, $zero
/* 8DE1C 8009D61C EB750208 */  j          .L8009D7AC
/* 8DE20 8009D620 21284002 */   addu      $a1, $s2, $zero
.L8009D624:
/* 8DE24 8009D624 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8DE28 8009D628 2A104300 */  slt        $v0, $v0, $v1
/* 8DE2C 8009D62C 5E004014 */  bnez       $v0, .L8009D7A8
/* 8DE30 8009D630 21202002 */   addu      $a0, $s1, $zero
/* 8DE34 8009D634 0008023C */  lui        $v0, (0x8000000 >> 16)
/* 8DE38 8009D638 2A106200 */  slt        $v0, $v1, $v0
/* 8DE3C 8009D63C 5B004014 */  bnez       $v0, .L8009D7AC
/* 8DE40 8009D640 21284002 */   addu      $a1, $s2, $zero
/* 8DE44 8009D644 CB750208 */  j          .L8009D72C
/* 8DE48 8009D648 00000000 */   nop
.L8009D64C:
/* 8DE4C 8009D64C 0400508C */  lw         $s0, 0x4($v0)
/* 8DE50 8009D650 24004016 */  bnez       $s2, .L8009D6E4
/* 8DE54 8009D654 00000000 */   nop
/* 8DE58 8009D658 0000028E */  lw         $v0, 0x0($s0)
/* 8DE5C 8009D65C 00000000 */  nop
/* 8DE60 8009D660 90FA82AF */  sw         $v0, %gp_rel(Raziel + 0x460)($gp)
/* 8DE64 8009D664 2F97020C */  jal        razGetHeldWeapon
/* 8DE68 8009D668 00000000 */   nop
/* 8DE6C 8009D66C 03004010 */  beqz       $v0, .L8009D67C
/* 8DE70 8009D670 21204000 */   addu      $a0, $v0, $zero
/* 8DE74 8009D674 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 8DE78 8009D678 07000524 */   addiu     $a1, $zero, 0x7
.L8009D67C:
/* 8DE7C 8009D67C 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 8DE80 8009D680 00000000 */  nop
/* 8DE84 8009D684 00084230 */  andi       $v0, $v0, 0x800
/* 8DE88 8009D688 05004010 */  beqz       $v0, .L8009D6A0
/* 8DE8C 8009D68C FFF7063C */   lui       $a2, (0xF7FFFFFF >> 16)
/* 8DE90 8009D690 0C00048E */  lw         $a0, 0xC($s0)
/* 8DE94 8009D694 7391020C */  jal        LoseHealth
/* 8DE98 8009D698 00000000 */   nop
/* 8DE9C 8009D69C FFF7063C */  lui        $a2, (0xF7FFFFFF >> 16)
.L8009D6A0:
/* 8DEA0 8009D6A0 FFFFC634 */  ori        $a2, $a2, (0xF7FFFFFF & 0xFFFF)
/* 8DEA4 8009D6A4 2000033C */  lui        $v1, (0x208000 >> 16)
/* 8DEA8 8009D6A8 00806334 */  ori        $v1, $v1, (0x208000 & 0xFFFF)
/* 8DEAC 8009D6AC 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8DEB0 8009D6B0 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 8DEB4 8009D6B4 25104300 */  or         $v0, $v0, $v1
/* 8DEB8 8009D6B8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8DEBC 8009D6BC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8DEC0 8009D6C0 0000248E */  lw         $a0, 0x0($s1)
/* 8DEC4 8009D6C4 08104234 */  ori        $v0, $v0, 0x1008
/* 8DEC8 8009D6C8 24104600 */  and        $v0, $v0, $a2
/* 8DECC 8009D6CC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8DED0 8009D6D0 6B68020C */  jal        ResetPhysics
/* 8DED4 8009D6D4 F0FF0524 */   addiu     $a1, $zero, -0x10
/* 8DED8 8009D6D8 0000248E */  lw         $a0, 0x0($s1)
/* 8DEDC 8009D6DC 938B020C */  jal        SteerSwitchMode
/* 8DEE0 8009D6E0 0A000524 */   addiu     $a1, $zero, 0xA
.L8009D6E4:
/* 8DEE4 8009D6E4 0C00028E */  lw         $v0, 0xC($s0)
/* 8DEE8 8009D6E8 00000000 */  nop
/* 8DEEC 8009D6EC 01104228 */  slti       $v0, $v0, 0x1001
/* 8DEF0 8009D6F0 04004014 */  bnez       $v0, .L8009D704
/* 8DEF4 8009D6F4 21284002 */   addu      $a1, $s2, $zero
/* 8DEF8 8009D6F8 21202002 */  addu       $a0, $s1, $zero
/* 8DEFC 8009D6FC C3750208 */  j          .L8009D70C
/* 8DF00 8009D700 38000624 */   addiu     $a2, $zero, 0x38
.L8009D704:
/* 8DF04 8009D704 21202002 */  addu       $a0, $s1, $zero
/* 8DF08 8009D708 7D000624 */  addiu      $a2, $zero, 0x7D
.L8009D70C:
/* 8DF0C 8009D70C 21380000 */  addu       $a3, $zero, $zero
/* 8DF10 8009D710 02000224 */  addiu      $v0, $zero, 0x2
/* 8DF14 8009D714 1000A2AF */  sw         $v0, 0x10($sp)
/* 8DF18 8009D718 01000224 */  addiu      $v0, $zero, 0x1
/* 8DF1C 8009D71C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8DF20 8009D720 1400A2AF */   sw        $v0, 0x14($sp)
/* 8DF24 8009D724 ED750208 */  j          .L8009D7B4
/* 8DF28 8009D728 00000000 */   nop
.L8009D72C:
/* 8DF2C 8009D72C 21004016 */  bnez       $s2, .L8009D7B4
/* 8DF30 8009D730 1000033C */   lui       $v1, (0x100000 >> 16)
/* 8DF34 8009D734 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8DF38 8009D738 00000000 */  nop
/* 8DF3C 8009D73C 24104300 */  and        $v0, $v0, $v1
/* 8DF40 8009D740 04004010 */  beqz       $v0, .L8009D754
/* 8DF44 8009D744 21202002 */   addu      $a0, $s1, $zero
/* 8DF48 8009D748 0B80053C */  lui        $a1, %hi(StateHandlerGlyphs)
/* 8DF4C 8009D74C DB750208 */  j          .L8009D76C
/* 8DF50 8009D750 50F6A524 */   addiu     $a1, $a1, %lo(StateHandlerGlyphs)
.L8009D754:
/* 8DF54 8009D754 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8DF58 8009D758 0400033C */  lui        $v1, (0x40000 >> 16)
/* 8DF5C 8009D75C 24104300 */  and        $v0, $v0, $v1
/* 8DF60 8009D760 06004010 */  beqz       $v0, .L8009D77C
/* 8DF64 8009D764 0A80053C */   lui       $a1, %hi(StateHandlerSwim)
/* 8DF68 8009D768 0C02A524 */  addiu      $a1, $a1, %lo(StateHandlerSwim)
.L8009D76C:
/* 8DF6C 8009D76C F4CA010C */  jal        StateSwitchStateCharacterData
/* 8DF70 8009D770 21300000 */   addu      $a2, $zero, $zero
/* 8DF74 8009D774 ED750208 */  j          .L8009D7B4
/* 8DF78 8009D778 00000000 */   nop
.L8009D77C:
/* 8DF7C 8009D77C 21200000 */  addu       $a0, $zero, $zero
/* 8DF80 8009D780 21288000 */  addu       $a1, $a0, $zero
/* 8DF84 8009D784 4FC6010C */  jal        SetControlInitIdleData
/* 8DF88 8009D788 03000624 */   addiu     $a2, $zero, 0x3
/* 8DF8C 8009D78C 21202002 */  addu       $a0, $s1, $zero
/* 8DF90 8009D790 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 8DF94 8009D794 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 8DF98 8009D798 F4CA010C */  jal        StateSwitchStateCharacterData
/* 8DF9C 8009D79C 21304000 */   addu      $a2, $v0, $zero
/* 8DFA0 8009D7A0 ED750208 */  j          .L8009D7B4
/* 8DFA4 8009D7A4 00000000 */   nop
.L8009D7A8:
/* 8DFA8 8009D7A8 21284002 */  addu       $a1, $s2, $zero
.L8009D7AC:
/* 8DFAC 8009D7AC B9BF020C */  jal        DefaultStateHandler
/* 8DFB0 8009D7B0 21308002 */   addu      $a2, $s4, $zero
.L8009D7B4:
/* 8DFB4 8009D7B4 27C3010C */  jal        DeMessageQueue
/* 8DFB8 8009D7B8 04006426 */   addiu     $a0, $s3, 0x4
/* 8DFBC 8009D7BC 6B750208 */  j          .L8009D5AC
/* 8DFC0 8009D7C0 00000000 */   nop
.L8009D7C4:
/* 8DFC4 8009D7C4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 8DFC8 8009D7C8 2800B48F */  lw         $s4, 0x28($sp)
/* 8DFCC 8009D7CC 2400B38F */  lw         $s3, 0x24($sp)
/* 8DFD0 8009D7D0 2000B28F */  lw         $s2, 0x20($sp)
/* 8DFD4 8009D7D4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8DFD8 8009D7D8 1800B08F */  lw         $s0, 0x18($sp)
/* 8DFDC 8009D7DC 0800E003 */  jr         $ra
/* 8DFE0 8009D7E0 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerHitReaction, . - StateHandlerHitReaction
