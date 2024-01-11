.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerBreakOff
/* 9E3C4 800ADBC4 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 9E3C8 800ADBC8 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 9E3CC 800ADBCC 21988000 */  addu       $s3, $a0, $zero
/* 9E3D0 800ADBD0 3000B4AF */  sw         $s4, 0x30($sp)
/* 9E3D4 800ADBD4 21A0A000 */  addu       $s4, $a1, $zero
/* 9E3D8 800ADBD8 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 9E3DC 800ADBDC 21B8C000 */  addu       $s7, $a2, $zero
/* 9E3E0 800ADBE0 C0101400 */  sll        $v0, $s4, 3
/* 9E3E4 800ADBE4 21105400 */  addu       $v0, $v0, $s4
/* 9E3E8 800ADBE8 C0100200 */  sll        $v0, $v0, 3
/* 9E3EC 800ADBEC 23105400 */  subu       $v0, $v0, $s4
/* 9E3F0 800ADBF0 80100200 */  sll        $v0, $v0, 2
/* 9E3F4 800ADBF4 08004324 */  addiu      $v1, $v0, 0x8
/* 9E3F8 800ADBF8 3800B6AF */  sw         $s6, 0x38($sp)
/* 9E3FC 800ADBFC 21B06302 */  addu       $s6, $s3, $v1
/* 9E400 800ADC00 3400B5AF */  sw         $s5, 0x34($sp)
/* 9E404 800ADC04 21A86202 */  addu       $s5, $s3, $v0
/* 9E408 800ADC08 4000BFAF */  sw         $ra, 0x40($sp)
/* 9E40C 800ADC0C 2800B2AF */  sw         $s2, 0x28($sp)
/* 9E410 800ADC10 2400B1AF */  sw         $s1, 0x24($sp)
/* 9E414 800ADC14 2000B0AF */  sw         $s0, 0x20($sp)
.L800ADC18:
/* 9E418 800ADC18 39C3010C */  jal        PeekMessageQueue
/* 9E41C 800ADC1C 0400C426 */   addiu     $a0, $s6, 0x4
/* 9E420 800ADC20 DB004010 */  beqz       $v0, .L800ADF90
/* 9E424 800ADC24 1000043C */   lui       $a0, (0x100015 >> 16)
/* 9E428 800ADC28 0000438C */  lw         $v1, 0x0($v0)
/* 9E42C 800ADC2C 15008434 */  ori        $a0, $a0, (0x100015 & 0xFFFF)
/* 9E430 800ADC30 90006410 */  beq        $v1, $a0, .L800ADE74
/* 9E434 800ADC34 2A108300 */   slt       $v0, $a0, $v1
/* 9E438 800ADC38 11004014 */  bnez       $v0, .L800ADC80
/* 9E43C 800ADC3C 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9E440 800ADC40 1000023C */  lui        $v0, (0x100001 >> 16)
/* 9E444 800ADC44 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9E448 800ADC48 1A006210 */  beq        $v1, $v0, .L800ADCB4
/* 9E44C 800ADC4C 2A104300 */   slt       $v0, $v0, $v1
/* 9E450 800ADC50 06004014 */  bnez       $v0, .L800ADC6C
/* 9E454 800ADC54 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9E458 800ADC58 0080023C */  lui        $v0, (0x80000004 >> 16)
/* 9E45C 800ADC5C C8006210 */  beq        $v1, $v0, .L800ADF80
/* 9E460 800ADC60 21206002 */   addu      $a0, $s3, $zero
/* 9E464 800ADC64 DEB70208 */  j          .L800ADF78
/* 9E468 800ADC68 21288002 */   addu      $a1, $s4, $zero
.L800ADC6C:
/* 9E46C 800ADC6C 04004234 */  ori        $v0, $v0, (0x80000004 & 0xFFFF)
/* 9E470 800ADC70 C3006210 */  beq        $v1, $v0, .L800ADF80
/* 9E474 800ADC74 21206002 */   addu      $a0, $s3, $zero
/* 9E478 800ADC78 DEB70208 */  j          .L800ADF78
/* 9E47C 800ADC7C 21288002 */   addu      $a1, $s4, $zero
.L800ADC80:
/* 9E480 800ADC80 2A106200 */  slt        $v0, $v1, $v0
/* 9E484 800ADC84 BB004014 */  bnez       $v0, .L800ADF74
/* 9E488 800ADC88 21206002 */   addu      $a0, $s3, $zero
/* 9E48C 800ADC8C 0008023C */  lui        $v0, (0x8000001 >> 16)
/* 9E490 800ADC90 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 9E494 800ADC94 2A104300 */  slt        $v0, $v0, $v1
/* 9E498 800ADC98 AA004010 */  beqz       $v0, .L800ADF44
/* 9E49C 800ADC9C 0008023C */   lui       $v0, (0x8000004 >> 16)
/* 9E4A0 800ADCA0 04004234 */  ori        $v0, $v0, (0x8000004 & 0xFFFF)
/* 9E4A4 800ADCA4 7D006210 */  beq        $v1, $v0, .L800ADE9C
/* 9E4A8 800ADCA8 21288002 */   addu      $a1, $s4, $zero
/* 9E4AC 800ADCAC DEB70208 */  j          .L800ADF78
/* 9E4B0 800ADCB0 00000000 */   nop
.L800ADCB4:
/* 9E4B4 800ADCB4 B2008016 */  bnez       $s4, .L800ADF80
/* 9E4B8 800ADCB8 00000000 */   nop
/* 9E4BC 800ADCBC 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9E4C0 800ADCC0 00000000 */  nop
/* 9E4C4 800ADCC4 10004230 */  andi       $v0, $v0, 0x10
/* 9E4C8 800ADCC8 06004010 */  beqz       $v0, .L800ADCE4
/* 9E4CC 800ADCCC 00000000 */   nop
/* 9E4D0 800ADCD0 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9E4D4 800ADCD4 00000000 */  nop
/* 9E4D8 800ADCD8 2000518C */  lw         $s1, 0x20($v0)
/* 9E4DC 800ADCDC 3EB70208 */  j          .L800ADCF8
/* 9E4E0 800ADCE0 21202002 */   addu      $a0, $s1, $zero
.L800ADCE4:
/* 9E4E4 800ADCE4 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9E4E8 800ADCE8 00000000 */  nop
/* 9E4EC 800ADCEC 6800518C */  lw         $s1, 0x68($v0)
/* 9E4F0 800ADCF0 00000000 */  nop
/* 9E4F4 800ADCF4 21202002 */  addu       $a0, $s1, $zero
.L800ADCF8:
/* 9E4F8 800ADCF8 92D1000C */  jal        INSTANCE_Query
/* 9E4FC 800ADCFC 15000524 */   addiu     $a1, $zero, 0x15
/* 9E500 800ADD00 0CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3DC)($gp)
/* 9E504 800ADD04 00000000 */  nop
/* 9E508 800ADD08 10006330 */  andi       $v1, $v1, 0x10
/* 9E50C 800ADD0C 04006010 */  beqz       $v1, .L800ADD20
/* 9E510 800ADD10 21804000 */   addu      $s0, $v0, $zero
/* 9E514 800ADD14 12000692 */  lbu        $a2, 0x12($s0)
/* 9E518 800ADD18 4AB70208 */  j          .L800ADD28
/* 9E51C 800ADD1C 2001B1AE */   sw        $s1, 0x120($s5)
.L800ADD20:
/* 9E520 800ADD20 13000692 */  lbu        $a2, 0x13($s0)
/* 9E524 800ADD24 2001B1AE */  sw         $s1, 0x120($s5)
.L800ADD28:
/* 9E528 800ADD28 FF001224 */  addiu      $s2, $zero, 0xFF
/* 9E52C 800ADD2C 0600D214 */  bne        $a2, $s2, .L800ADD48
/* 9E530 800ADD30 21282002 */   addu      $a1, $s1, $zero
/* 9E534 800ADD34 14000492 */  lbu        $a0, 0x14($s0)
/* 9E538 800ADD38 31CC020C */  jal        SetTimer
/* 9E53C 800ADD3C 01008424 */   addiu     $a0, $a0, 0x1
/* 9E540 800ADD40 6AB70208 */  j          .L800ADDA8
/* 9E544 800ADD44 0408023C */   lui       $v0, (0x8041108 >> 16)
.L800ADD48:
/* 9E548 800ADD48 01000224 */  addiu      $v0, $zero, 0x1
/* 9E54C 800ADD4C 1000A0AF */  sw         $zero, 0x10($sp)
/* 9E550 800ADD50 1400A2AF */  sw         $v0, 0x14($sp)
/* 9E554 800ADD54 0000648E */  lw         $a0, 0x0($s3)
/* 9E558 800ADD58 C1C8010C */  jal        G2EmulationInstanceToInstanceSwitchAnimationCharacter
/* 9E55C 800ADD5C 21380000 */   addu      $a3, $zero, $zero
/* 9E560 800ADD60 14000292 */  lbu        $v0, 0x14($s0)
/* 9E564 800ADD64 00000000 */  nop
/* 9E568 800ADD68 0E005210 */  beq        $v0, $s2, .L800ADDA4
/* 9E56C 800ADD6C 21184000 */   addu      $v1, $v0, $zero
/* 9E570 800ADD70 40100300 */  sll        $v0, $v1, 1
/* 9E574 800ADD74 21104300 */  addu       $v0, $v0, $v1
/* 9E578 800ADD78 C0100200 */  sll        $v0, $v0, 3
/* 9E57C 800ADD7C 21104300 */  addu       $v0, $v0, $v1
/* 9E580 800ADD80 80100200 */  sll        $v0, $v0, 2
/* 9E584 800ADD84 8CFB8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x55C)
/* 9E588 800ADD88 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 9E58C 800ADD8C 40101400 */  sll        $v0, $s4, 1
/* 9E590 800ADD90 21105400 */  addu       $v0, $v0, $s4
/* 9E594 800ADD94 0000638E */  lw         $v1, 0x0($s3)
/* 9E598 800ADD98 00110200 */  sll        $v0, $v0, 4
/* 9E59C 800ADD9C 21104300 */  addu       $v0, $v0, $v1
/* 9E5A0 800ADDA0 F80144AC */  sw         $a0, 0x1F8($v0)
.L800ADDA4:
/* 9E5A4 800ADDA4 0408023C */  lui        $v0, (0x8041108 >> 16)
.L800ADDA8:
/* 9E5A8 800ADDA8 08114234 */  ori        $v0, $v0, (0x8041108 & 0xFFFF)
/* 9E5AC 800ADDAC 1C000396 */  lhu        $v1, 0x1C($s0)
/* 9E5B0 800ADDB0 03000424 */  addiu      $a0, $zero, 0x3
/* 9E5B4 800ADDB4 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9E5B8 800ADDB8 01000224 */  addiu      $v0, $zero, 0x1
/* 9E5BC 800ADDBC 30FD84AF */  sw         $a0, %gp_rel(PhysicsMode)($gp)
/* 9E5C0 800ADDC0 11006210 */  beq        $v1, $v0, .L800ADE08
/* 9E5C4 800ADDC4 02006228 */   slti      $v0, $v1, 0x2
/* 9E5C8 800ADDC8 05004010 */  beqz       $v0, .L800ADDE0
/* 9E5CC 800ADDCC 00000000 */   nop
/* 9E5D0 800ADDD0 09006010 */  beqz       $v1, .L800ADDF8
/* 9E5D4 800ADDD4 21282002 */   addu      $a1, $s1, $zero
/* 9E5D8 800ADDD8 E0B70208 */  j          .L800ADF80
/* 9E5DC 800ADDDC 00000000 */   nop
.L800ADDE0:
/* 9E5E0 800ADDE0 0E006410 */  beq        $v1, $a0, .L800ADE1C
/* 9E5E4 800ADDE4 04000224 */   addiu     $v0, $zero, 0x4
/* 9E5E8 800ADDE8 16006210 */  beq        $v1, $v0, .L800ADE44
/* 9E5EC 800ADDEC 21202002 */   addu      $a0, $s1, $zero
/* 9E5F0 800ADDF0 E0B70208 */  j          .L800ADF80
/* 9E5F4 800ADDF4 00000000 */   nop
.L800ADDF8:
/* 9E5F8 800ADDF8 16000686 */  lh         $a2, 0x16($s0)
/* 9E5FC 800ADDFC 1000A4AF */  sw         $a0, 0x10($sp)
/* 9E600 800ADE00 8CB70208 */  j          .L800ADE30
/* 9E604 800ADE04 1400A0AF */   sw        $zero, 0x14($sp)
.L800ADE08:
/* 9E608 800ADE08 16000596 */  lhu        $a1, 0x16($s0)
/* 9E60C 800ADE0C 0000678E */  lw         $a3, 0x0($s3)
/* 9E610 800ADE10 21202002 */  addu       $a0, $s1, $zero
/* 9E614 800ADE14 95B70208 */  j          .L800ADE54
/* 9E618 800ADE18 1000A0AF */   sw        $zero, 0x10($sp)
.L800ADE1C:
/* 9E61C 800ADE1C 21282002 */  addu       $a1, $s1, $zero
/* 9E620 800ADE20 16000686 */  lh         $a2, 0x16($s0)
/* 9E624 800ADE24 00080224 */  addiu      $v0, $zero, 0x800
/* 9E628 800ADE28 1000A3AF */  sw         $v1, 0x10($sp)
/* 9E62C 800ADE2C 1400A2AF */  sw         $v0, 0x14($sp)
.L800ADE30:
/* 9E630 800ADE30 0000648E */  lw         $a0, 0x0($s3)
/* 9E634 800ADE34 7E94020C */  jal        razAlignYRotMoveInterp
/* 9E638 800ADE38 21380000 */   addu      $a3, $zero, $zero
/* 9E63C 800ADE3C E0B70208 */  j          .L800ADF80
/* 9E640 800ADE40 00000000 */   nop
.L800ADE44:
/* 9E644 800ADE44 16000596 */  lhu        $a1, 0x16($s0)
/* 9E648 800ADE48 0000678E */  lw         $a3, 0x0($s3)
/* 9E64C 800ADE4C 00080224 */  addiu      $v0, $zero, 0x800
/* 9E650 800ADE50 1000A2AF */  sw         $v0, 0x10($sp)
.L800ADE54:
/* 9E654 800ADE54 23280500 */  negu       $a1, $a1
/* 9E658 800ADE58 002C0500 */  sll        $a1, $a1, 16
/* 9E65C 800ADE5C 032C0500 */  sra        $a1, $a1, 16
/* 9E660 800ADE60 5C00E624 */  addiu      $a2, $a3, 0x5C
/* 9E664 800ADE64 1794020C */  jal        razAlignYMoveRot
/* 9E668 800ADE68 7400E724 */   addiu     $a3, $a3, 0x74
/* 9E66C 800ADE6C E0B70208 */  j          .L800ADF80
/* 9E670 800ADE70 00000000 */   nop
.L800ADE74:
/* 9E674 800ADE74 42008016 */  bnez       $s4, .L800ADF80
/* 9E678 800ADE78 21200000 */   addu      $a0, $zero, $zero
/* 9E67C 800ADE7C 21288000 */  addu       $a1, $a0, $zero
/* 9E680 800ADE80 4FC6010C */  jal        SetControlInitIdleData
/* 9E684 800ADE84 03000624 */   addiu     $a2, $zero, 0x3
/* 9E688 800ADE88 21206002 */  addu       $a0, $s3, $zero
/* 9E68C 800ADE8C 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9E690 800ADE90 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9E694 800ADE94 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9E698 800ADE98 21304000 */   addu      $a2, $v0, $zero
.L800ADE9C:
/* 9E69C 800ADE9C 2001A48E */  lw         $a0, 0x120($s5)
/* 9E6A0 800ADEA0 92D1000C */  jal        INSTANCE_Query
/* 9E6A4 800ADEA4 15000524 */   addiu     $a1, $zero, 0x15
/* 9E6A8 800ADEA8 0CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3DC)($gp)
/* 9E6AC 800ADEAC 00000000 */  nop
/* 9E6B0 800ADEB0 10006330 */  andi       $v1, $v1, 0x10
/* 9E6B4 800ADEB4 05006010 */  beqz       $v1, .L800ADECC
/* 9E6B8 800ADEB8 00000000 */   nop
/* 9E6BC 800ADEBC 0C005194 */  lhu        $s1, 0xC($v0)
/* 9E6C0 800ADEC0 08004294 */  lhu        $v0, 0x8($v0)
/* 9E6C4 800ADEC4 B7B70208 */  j          .L800ADEDC
/* 9E6C8 800ADEC8 FE014230 */   andi      $v0, $v0, 0x1FE
.L800ADECC:
/* 9E6CC 800ADECC 0E005194 */  lhu        $s1, 0xE($v0)
/* 9E6D0 800ADED0 0A004294 */  lhu        $v0, 0xA($v0)
/* 9E6D4 800ADED4 00000000 */  nop
/* 9E6D8 800ADED8 FE014230 */  andi       $v0, $v0, 0x1FE
.L800ADEDC:
/* 9E6DC 800ADEDC 06004010 */  beqz       $v0, .L800ADEF8
/* 9E6E0 800ADEE0 00000000 */   nop
/* 9E6E4 800ADEE4 60FA908F */  lw         $s0, %gp_rel(Raziel + 0x430)($gp)
/* 9E6E8 800ADEE8 ED97020C */  jal        razReaverImbue
/* 9E6EC 800ADEEC 21202002 */   addu      $a0, $s1, $zero
/* 9E6F0 800ADEF0 C1B70208 */  j          .L800ADF04
/* 9E6F4 800ADEF4 21200002 */   addu      $a0, $s0, $zero
.L800ADEF8:
/* 9E6F8 800ADEF8 0000708E */  lw         $s0, 0x0($s3)
/* 9E6FC 800ADEFC 00000000 */  nop
/* 9E700 800ADF00 21200002 */  addu       $a0, $s0, $zero
.L800ADF04:
/* 9E704 800ADF04 31000524 */  addiu      $a1, $zero, 0x31
/* 9E708 800ADF08 21300000 */  addu       $a2, $zero, $zero
/* 9E70C 800ADF0C 2138C000 */  addu       $a3, $a2, $zero
/* 9E710 800ADF10 00141100 */  sll        $v0, $s1, 16
/* 9E714 800ADF14 03140200 */  sra        $v0, $v0, 16
/* 9E718 800ADF18 1000A0AF */  sw         $zero, 0x10($sp)
/* 9E71C 800ADF1C 1400A0AF */  sw         $zero, 0x14($sp)
/* 9E720 800ADF20 19C6010C */  jal        SetObjectBreakOffData
/* 9E724 800ADF24 1800A2AF */   sw        $v0, 0x18($sp)
/* 9E728 800ADF28 8000053C */  lui        $a1, (0x800023 >> 16)
/* 9E72C 800ADF2C 2300A534 */  ori        $a1, $a1, (0x800023 & 0xFFFF)
/* 9E730 800ADF30 2001A48E */  lw         $a0, 0x120($s5)
/* 9E734 800ADF34 A1D1000C */  jal        INSTANCE_Post
/* 9E738 800ADF38 21304000 */   addu      $a2, $v0, $zero
/* 9E73C 800ADF3C E0B70208 */  j          .L800ADF80
/* 9E740 800ADF40 00000000 */   nop
.L800ADF44:
/* 9E744 800ADF44 21200000 */  addu       $a0, $zero, $zero
/* 9E748 800ADF48 21288000 */  addu       $a1, $a0, $zero
/* 9E74C 800ADF4C 4FC6010C */  jal        SetControlInitIdleData
/* 9E750 800ADF50 03000624 */   addiu     $a2, $zero, 0x3
/* 9E754 800ADF54 21206002 */  addu       $a0, $s3, $zero
/* 9E758 800ADF58 21288002 */  addu       $a1, $s4, $zero
/* 9E75C 800ADF5C 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9E760 800ADF60 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9E764 800ADF64 C1CA010C */  jal        StateSwitchStateData
/* 9E768 800ADF68 21384000 */   addu      $a3, $v0, $zero
/* 9E76C 800ADF6C E0B70208 */  j          .L800ADF80
/* 9E770 800ADF70 00000000 */   nop
.L800ADF74:
/* 9E774 800ADF74 21288002 */  addu       $a1, $s4, $zero
.L800ADF78:
/* 9E778 800ADF78 B9BF020C */  jal        DefaultStateHandler
/* 9E77C 800ADF7C 2130E002 */   addu      $a2, $s7, $zero
.L800ADF80:
/* 9E780 800ADF80 27C3010C */  jal        DeMessageQueue
/* 9E784 800ADF84 0400C426 */   addiu     $a0, $s6, 0x4
/* 9E788 800ADF88 06B70208 */  j          .L800ADC18
/* 9E78C 800ADF8C 00000000 */   nop
.L800ADF90:
/* 9E790 800ADF90 4000BF8F */  lw         $ra, 0x40($sp)
/* 9E794 800ADF94 3C00B78F */  lw         $s7, 0x3C($sp)
/* 9E798 800ADF98 3800B68F */  lw         $s6, 0x38($sp)
/* 9E79C 800ADF9C 3400B58F */  lw         $s5, 0x34($sp)
/* 9E7A0 800ADFA0 3000B48F */  lw         $s4, 0x30($sp)
/* 9E7A4 800ADFA4 2C00B38F */  lw         $s3, 0x2C($sp)
/* 9E7A8 800ADFA8 2800B28F */  lw         $s2, 0x28($sp)
/* 9E7AC 800ADFAC 2400B18F */  lw         $s1, 0x24($sp)
/* 9E7B0 800ADFB0 2000B08F */  lw         $s0, 0x20($sp)
/* 9E7B4 800ADFB4 0800E003 */  jr         $ra
/* 9E7B8 800ADFB8 4800BD27 */   addiu     $sp, $sp, 0x48
.size StateHandlerBreakOff, . - StateHandlerBreakOff
