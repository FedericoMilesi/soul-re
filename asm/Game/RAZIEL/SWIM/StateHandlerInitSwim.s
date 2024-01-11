.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerInitSwim
/* 8F62C 8009EE2C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 8F630 8009EE30 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8F634 8009EE34 21888000 */  addu       $s1, $a0, $zero
/* 8F638 8009EE38 1800B0AF */  sw         $s0, 0x18($sp)
/* 8F63C 8009EE3C 2180A000 */  addu       $s0, $a1, $zero
/* 8F640 8009EE40 3D000624 */  addiu      $a2, $zero, 0x3D
/* 8F644 8009EE44 21380000 */  addu       $a3, $zero, $zero
/* 8F648 8009EE48 09000224 */  addiu      $v0, $zero, 0x9
/* 8F64C 8009EE4C 2000B2AF */  sw         $s2, 0x20($sp)
/* 8F650 8009EE50 02001224 */  addiu      $s2, $zero, 0x2
/* 8F654 8009EE54 2400BFAF */  sw         $ra, 0x24($sp)
/* 8F658 8009EE58 1000A2AF */  sw         $v0, 0x10($sp)
/* 8F65C 8009EE5C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8F660 8009EE60 1400B2AF */   sw        $s2, 0x14($sp)
/* 8F664 8009EE64 21202002 */  addu       $a0, $s1, $zero
/* 8F668 8009EE68 21280002 */  addu       $a1, $s0, $zero
/* 8F66C 8009EE6C 0A80063C */  lui        $a2, %hi(StateHandlerSwimTread)
/* 8F670 8009EE70 B8F6C624 */  addiu      $a2, $a2, %lo(StateHandlerSwimTread)
/* 8F674 8009EE74 C1CA010C */  jal        StateSwitchStateData
/* 8F678 8009EE78 21380000 */   addu      $a3, $zero, $zero
/* 8F67C 8009EE7C C0101000 */  sll        $v0, $s0, 3
/* 8F680 8009EE80 21105000 */  addu       $v0, $v0, $s0
/* 8F684 8009EE84 C0100200 */  sll        $v0, $v0, 3
/* 8F688 8009EE88 23105000 */  subu       $v0, $v0, $s0
/* 8F68C 8009EE8C 04284202 */  sllv       $a1, $v0, $s2
/* 8F690 8009EE90 21182502 */  addu       $v1, $s1, $a1
/* 8F694 8009EE94 2001628C */  lw         $v0, 0x120($v1)
/* 8F698 8009EE98 C4FC848F */  lw         $a0, %gp_rel(PadData)($gp)
/* 8F69C 8009EE9C 25105200 */  or         $v0, $v0, $s2
/* 8F6A0 8009EEA0 200162AC */  sw         $v0, 0x120($v1)
/* 8F6A4 8009EEA4 0000828C */  lw         $v0, 0x0($a0)
/* 8F6A8 8009EEA8 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 8F6AC 8009EEAC 00000000 */  nop
/* 8F6B0 8009EEB0 24104300 */  and        $v0, $v0, $v1
/* 8F6B4 8009EEB4 06004010 */  beqz       $v0, .L8009EED0
/* 8F6B8 8009EEB8 2120B100 */   addu      $a0, $a1, $s1
/* 8F6BC 8009EEBC 94008424 */  addiu      $a0, $a0, 0x94
/* 8F6C0 8009EEC0 0080053C */  lui        $a1, (0x80000001 >> 16)
/* 8F6C4 8009EEC4 0100A534 */  ori        $a1, $a1, (0x80000001 & 0xFFFF)
/* 8F6C8 8009EEC8 4EC3010C */  jal        EnMessageQueueData
/* 8F6CC 8009EECC 21300000 */   addu      $a2, $zero, $zero
.L8009EED0:
/* 8F6D0 8009EED0 13001216 */  bne        $s0, $s2, .L8009EF20
/* 8F6D4 8009EED4 01000224 */   addiu     $v0, $zero, 0x1
/* 8F6D8 8009EED8 98F982AF */  sw         $v0, %gp_rel(Raziel + 0x368)($gp)
/* 8F6DC 8009EEDC 0400023C */  lui        $v0, (0x40000 >> 16)
/* 8F6E0 8009EEE0 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8F6E4 8009EEE4 0000248E */  lw         $a0, 0x0($s1)
/* 8F6E8 8009EEE8 938B020C */  jal        SteerSwitchMode
/* 8F6EC 8009EEEC 06000524 */   addiu     $a1, $zero, 0x6
/* 8F6F0 8009EEF0 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 8F6F4 8009EEF4 0000258E */  lw         $a1, 0x0($s1)
/* 8F6F8 8009EEF8 91010224 */  addiu      $v0, $zero, 0x191
/* 8F6FC 8009EEFC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8F700 8009EF00 C670000C */  jal        CAMERA_ChangeToUnderWater
/* 8F704 8009EF04 00000000 */   nop
/* 8F708 8009EF08 C8FC8227 */  addiu      $v0, $gp, %gp_rel(ExtraRotData)
/* 8F70C 8009EF0C D0FC82AF */  sw         $v0, %gp_rel(ExtraRot)($gp)
/* 8F710 8009EF10 80000224 */  addiu      $v0, $zero, 0x80
/* 8F714 8009EF14 C8FC82A7 */  sh         $v0, %gp_rel(ExtraRotData)($gp)
/* 8F718 8009EF18 800F0224 */  addiu      $v0, $zero, 0xF80
/* 8F71C 8009EF1C F0FC82A7 */  sh         $v0, %gp_rel(ExternalForces_dup1 + 0x10)($gp)
.L8009EF20:
/* 8F720 8009EF20 2400BF8F */  lw         $ra, 0x24($sp)
/* 8F724 8009EF24 2000B28F */  lw         $s2, 0x20($sp)
/* 8F728 8009EF28 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8F72C 8009EF2C 1800B08F */  lw         $s0, 0x18($sp)
/* 8F730 8009EF30 0800E003 */  jr         $ra
/* 8F734 8009EF34 2800BD27 */   addiu     $sp, $sp, 0x28
.size StateHandlerInitSwim, . - StateHandlerInitSwim
