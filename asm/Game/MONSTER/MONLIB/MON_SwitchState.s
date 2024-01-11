.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SwitchState
/* 70244 8007FA44 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 70248 8007FA48 1800B2AF */  sw         $s2, 0x18($sp)
/* 7024C 8007FA4C 21908000 */  addu       $s2, $a0, $zero
/* 70250 8007FA50 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 70254 8007FA54 1400B1AF */  sw         $s1, 0x14($sp)
/* 70258 8007FA58 1000B0AF */  sw         $s0, 0x10($sp)
/* 7025C 8007FA5C 6C01508E */  lw         $s0, 0x16C($s2)
/* 70260 8007FA60 00000000 */  nop
/* 70264 8007FA64 0000028E */  lw         $v0, 0x0($s0)
/* 70268 8007FA68 00000000 */  nop
/* 7026C 8007FA6C 00404230 */  andi       $v0, $v0, 0x4000
/* 70270 8007FA70 03004010 */  beqz       $v0, .L8007FA80
/* 70274 8007FA74 2188A000 */   addu      $s1, $a1, $zero
/* 70278 8007FA78 76FD010C */  jal        MON_TurnOffWeaponSpheres
/* 7027C 8007FA7C 00000000 */   nop
.L8007FA80:
/* 70280 8007FA80 0000028E */  lw         $v0, 0x0($s0)
/* 70284 8007FA84 00000000 */  nop
/* 70288 8007FA88 01004230 */  andi       $v0, $v0, 0x1
/* 7028C 8007FA8C 05004014 */  bnez       $v0, .L8007FAA4
/* 70290 8007FA90 10000224 */   addiu     $v0, $zero, 0x10
/* 70294 8007FA94 98014292 */  lbu        $v0, 0x198($s2)
/* 70298 8007FA98 00000000 */  nop
/* 7029C 8007FA9C 590102A2 */  sb         $v0, 0x159($s0)
/* 702A0 8007FAA0 10000224 */  addiu      $v0, $zero, 0x10
.L8007FAA4:
/* 702A4 8007FAA4 09002212 */  beq        $s1, $v0, .L8007FACC
/* 702A8 8007FAA8 17000224 */   addiu     $v0, $zero, 0x17
/* 702AC 8007FAAC 07002212 */  beq        $s1, $v0, .L8007FACC
/* 702B0 8007FAB0 07000224 */   addiu     $v0, $zero, 0x7
/* 702B4 8007FAB4 05002212 */  beq        $s1, $v0, .L8007FACC
/* 702B8 8007FAB8 0A000224 */   addiu     $v0, $zero, 0xA
/* 702BC 8007FABC 03002212 */  beq        $s1, $v0, .L8007FACC
/* 702C0 8007FAC0 03000224 */   addiu     $v0, $zero, 0x3
/* 702C4 8007FAC4 04002216 */  bne        $s1, $v0, .L8007FAD8
/* 702C8 8007FAC8 FDFF063C */   lui       $a2, (0xFFFDFFFF >> 16)
.L8007FACC:
/* 702CC 8007FACC 36C3010C */  jal        PurgeMessageQueue
/* 702D0 8007FAD0 08000426 */   addiu     $a0, $s0, 0x8
/* 702D4 8007FAD4 FDFF063C */  lui        $a2, (0xFFFDFFFF >> 16)
.L8007FAD8:
/* 702D8 8007FAD8 FFFFC634 */  ori        $a2, $a2, (0xFFFDFFFF & 0xFFFF)
/* 702DC 8007FADC FFBF053C */  lui        $a1, (0xBFFFFFFF >> 16)
/* 702E0 8007FAE0 FFFFA534 */  ori        $a1, $a1, (0xBFFFFFFF & 0xFFFF)
/* 702E4 8007FAE4 FFFB043C */  lui        $a0, (0xFBFFFFFF >> 16)
/* 702E8 8007FAE8 FFFF8434 */  ori        $a0, $a0, (0xFBFFFFFF & 0xFFFF)
/* 702EC 8007FAEC 980151AE */  sw         $s1, 0x198($s2)
/* 702F0 8007FAF0 0000028E */  lw         $v0, 0x0($s0)
/* 702F4 8007FAF4 FFEF0324 */  addiu      $v1, $zero, -0x1001
/* 702F8 8007FAF8 01004234 */  ori        $v0, $v0, 0x1
/* 702FC 8007FAFC 24104300 */  and        $v0, $v0, $v1
/* 70300 8007FB00 24104600 */  and        $v0, $v0, $a2
/* 70304 8007FB04 24104500 */  and        $v0, $v0, $a1
/* 70308 8007FB08 24104400 */  and        $v0, $v0, $a0
/* 7030C 8007FB0C 66010482 */  lb         $a0, 0x166($s0)
/* 70310 8007FB10 FFFF1124 */  addiu      $s1, $zero, -0x1
/* 70314 8007FB14 04009110 */  beq        $a0, $s1, .L8007FB28
/* 70318 8007FB18 000002AE */   sw        $v0, 0x0($s0)
/* 7031C 8007FB1C E859020C */  jal        ENMYPLAN_ReleasePlanningWorkspace
/* 70320 8007FB20 00000000 */   nop
/* 70324 8007FB24 660111A2 */  sb         $s1, 0x166($s0)
.L8007FB28:
/* 70328 8007FB28 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7032C 8007FB2C 1800B28F */  lw         $s2, 0x18($sp)
/* 70330 8007FB30 1400B18F */  lw         $s1, 0x14($sp)
/* 70334 8007FB34 1000B08F */  lw         $s0, 0x10($sp)
/* 70338 8007FB38 0800E003 */  jr         $ra
/* 7033C 8007FB3C 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_SwitchState, . - MON_SwitchState
