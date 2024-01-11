.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerPickupObject
/* 9F4F4 800AECF4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9F4F8 800AECF8 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 9F4FC 800AECFC 21888000 */  addu       $s1, $a0, $zero
/* 9F500 800AED00 2800B0AF */  sw         $s0, 0x28($sp)
/* 9F504 800AED04 2180A000 */  addu       $s0, $a1, $zero
/* 9F508 800AED08 3800B4AF */  sw         $s4, 0x38($sp)
/* 9F50C 800AED0C 21A0C000 */  addu       $s4, $a2, $zero
/* 9F510 800AED10 C0101000 */  sll        $v0, $s0, 3
/* 9F514 800AED14 21105000 */  addu       $v0, $v0, $s0
/* 9F518 800AED18 C0100200 */  sll        $v0, $v0, 3
/* 9F51C 800AED1C 23105000 */  subu       $v0, $v0, $s0
/* 9F520 800AED20 80100200 */  sll        $v0, $v0, 2
/* 9F524 800AED24 08004224 */  addiu      $v0, $v0, 0x8
/* 9F528 800AED28 3000B2AF */  sw         $s2, 0x30($sp)
/* 9F52C 800AED2C 21902202 */  addu       $s2, $s1, $v0
/* 9F530 800AED30 0B80023C */  lui        $v0, %hi(StateHandlerIdle)
/* 9F534 800AED34 3400B3AF */  sw         $s3, 0x34($sp)
/* 9F538 800AED38 E0845324 */  addiu      $s3, $v0, %lo(StateHandlerIdle)
/* 9F53C 800AED3C 3C00BFAF */  sw         $ra, 0x3C($sp)
.L800AED40:
/* 9F540 800AED40 39C3010C */  jal        PeekMessageQueue
/* 9F544 800AED44 04004426 */   addiu     $a0, $s2, 0x4
/* 9F548 800AED48 69004010 */  beqz       $v0, .L800AEEF0
/* 9F54C 800AED4C 1000043C */   lui       $a0, (0x100001 >> 16)
/* 9F550 800AED50 0000438C */  lw         $v1, 0x0($v0)
/* 9F554 800AED54 01008434 */  ori        $a0, $a0, (0x100001 & 0xFFFF)
/* 9F558 800AED58 11006410 */  beq        $v1, $a0, .L800AEDA0
/* 9F55C 800AED5C 2A108300 */   slt       $v0, $a0, $v1
/* 9F560 800AED60 08004014 */  bnez       $v0, .L800AED84
/* 9F564 800AED64 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9F568 800AED68 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 9F56C 800AED6C 5C006210 */  beq        $v1, $v0, .L800AEEE0
/* 9F570 800AED70 20004234 */   ori       $v0, $v0, (0x80000020 & 0xFFFF)
/* 9F574 800AED74 5A006210 */  beq        $v1, $v0, .L800AEEE0
/* 9F578 800AED78 21202002 */   addu      $a0, $s1, $zero
/* 9F57C 800AED7C B6BB0208 */  j          .L800AEED8
/* 9F580 800AED80 21280002 */   addu      $a1, $s0, $zero
.L800AED84:
/* 9F584 800AED84 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9F588 800AED88 23006210 */  beq        $v1, $v0, .L800AEE18
/* 9F58C 800AED8C 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9F590 800AED90 2C006210 */  beq        $v1, $v0, .L800AEE44
/* 9F594 800AED94 21202002 */   addu      $a0, $s1, $zero
/* 9F598 800AED98 B6BB0208 */  j          .L800AEED8
/* 9F59C 800AED9C 21280002 */   addu      $a1, $s0, $zero
.L800AEDA0:
/* 9F5A0 800AEDA0 01000224 */  addiu      $v0, $zero, 0x1
/* 9F5A4 800AEDA4 4E000216 */  bne        $s0, $v0, .L800AEEE0
/* 9F5A8 800AEDA8 FF00023C */   lui       $v0, (0xFF5400 >> 16)
/* 9F5AC 800AEDAC 00544234 */  ori        $v0, $v0, (0xFF5400 & 0xFFFF)
/* 9F5B0 800AEDB0 29000524 */  addiu      $a1, $zero, 0x29
/* 9F5B4 800AEDB4 2000A627 */  addiu      $a2, $sp, 0x20
/* 9F5B8 800AEDB8 2000A2AF */  sw         $v0, 0x20($sp)
/* 9F5BC 800AEDBC 08110224 */  addiu      $v0, $zero, 0x1108
/* 9F5C0 800AEDC0 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9F5C4 800AEDC4 4B000224 */  addiu      $v0, $zero, 0x4B
/* 9F5C8 800AEDC8 1400A2AF */  sw         $v0, 0x14($sp)
/* 9F5CC 800AEDCC 1800A2AF */  sw         $v0, 0x18($sp)
/* 9F5D0 800AEDD0 0A000224 */  addiu      $v0, $zero, 0xA
/* 9F5D4 800AEDD4 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 9F5D8 800AEDD8 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9F5DC 800AEDDC CCF9838F */  lw         $v1, %gp_rel(Raziel + 0x39C)($gp)
/* 9F5E0 800AEDE0 1000A0AF */  sw         $zero, 0x10($sp)
/* 9F5E4 800AEDE4 00084234 */  ori        $v0, $v0, 0x800
/* 9F5E8 800AEDE8 80006334 */  ori        $v1, $v1, 0x80
/* 9F5EC 800AEDEC 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9F5F0 800AEDF0 CCF983AF */  sw         $v1, %gp_rel(Raziel + 0x39C)($gp)
/* 9F5F4 800AEDF4 0000248E */  lw         $a0, 0x0($s1)
/* 9F5F8 800AEDF8 03000224 */  addiu      $v0, $zero, 0x3
/* 9F5FC 800AEDFC 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9F600 800AEE00 CD2D010C */  jal        FX_DoInstanceOneSegmentGlowWithTime
/* 9F604 800AEE04 01000724 */   addiu     $a3, $zero, 0x1
/* 9F608 800AEE08 C89E020C */  jal        razSetPlayerEventHistory
/* 9F60C 800AEE0C 10000424 */   addiu     $a0, $zero, 0x10
/* 9F610 800AEE10 B8BB0208 */  j          .L800AEEE0
/* 9F614 800AEE14 00000000 */   nop
.L800AEE18:
/* 9F618 800AEE18 01000224 */  addiu      $v0, $zero, 0x1
/* 9F61C 800AEE1C 30000216 */  bne        $s0, $v0, .L800AEEE0
/* 9F620 800AEE20 FFEF0324 */   addiu     $v1, $zero, -0x1001
/* 9F624 800AEE24 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9F628 800AEE28 0000248E */  lw         $a0, 0x0($s1)
/* 9F62C 800AEE2C 24104300 */  and        $v0, $v0, $v1
/* 9F630 800AEE30 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9F634 800AEE34 DF2D010C */  jal        FX_StopAllGlowEffects
/* 9F638 800AEE38 21280000 */   addu      $a1, $zero, $zero
/* 9F63C 800AEE3C B8BB0208 */  j          .L800AEEE0
/* 9F640 800AEE40 00000000 */   nop
.L800AEE44:
/* 9F644 800AEE44 01000224 */  addiu      $v0, $zero, 0x1
/* 9F648 800AEE48 04000216 */  bne        $s0, $v0, .L800AEE5C
/* 9F64C 800AEE4C 00000000 */   nop
/* 9F650 800AEE50 0000248E */  lw         $a0, 0x0($s1)
/* 9F654 800AEE54 DF2D010C */  jal        FX_StopAllGlowEffects
/* 9F658 800AEE58 21280000 */   addu      $a1, $zero, $zero
.L800AEE5C:
/* 9F65C 800AEE5C 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9F660 800AEE60 0400033C */  lui        $v1, (0x40000 >> 16)
/* 9F664 800AEE64 24104300 */  and        $v0, $v0, $v1
/* 9F668 800AEE68 05004010 */  beqz       $v0, .L800AEE80
/* 9F66C 800AEE6C 21202002 */   addu      $a0, $s1, $zero
/* 9F670 800AEE70 21280002 */  addu       $a1, $s0, $zero
/* 9F674 800AEE74 0A80063C */  lui        $a2, %hi(StateHandlerSwim)
/* 9F678 800AEE78 B0BB0208 */  j          .L800AEEC0
/* 9F67C 800AEE7C 0C02C624 */   addiu     $a2, $a2, %lo(StateHandlerSwim)
.L800AEE80:
/* 9F680 800AEE80 38FB868F */  lw         $a2, %gp_rel(Raziel + 0x508)($gp)
/* 9F684 800AEE84 00000000 */  nop
/* 9F688 800AEE88 0400D310 */  beq        $a2, $s3, .L800AEE9C
/* 9F68C 800AEE8C 21200000 */   addu      $a0, $zero, $zero
/* 9F690 800AEE90 0A00C014 */  bnez       $a2, .L800AEEBC
/* 9F694 800AEE94 21280002 */   addu      $a1, $s0, $zero
/* 9F698 800AEE98 21200000 */  addu       $a0, $zero, $zero
.L800AEE9C:
/* 9F69C 800AEE9C 21288000 */  addu       $a1, $a0, $zero
/* 9F6A0 800AEEA0 4FC6010C */  jal        SetControlInitIdleData
/* 9F6A4 800AEEA4 03000624 */   addiu     $a2, $zero, 0x3
/* 9F6A8 800AEEA8 21202002 */  addu       $a0, $s1, $zero
/* 9F6AC 800AEEAC 21280002 */  addu       $a1, $s0, $zero
/* 9F6B0 800AEEB0 21306002 */  addu       $a2, $s3, $zero
/* 9F6B4 800AEEB4 B1BB0208 */  j          .L800AEEC4
/* 9F6B8 800AEEB8 21384000 */   addu      $a3, $v0, $zero
.L800AEEBC:
/* 9F6BC 800AEEBC 21202002 */  addu       $a0, $s1, $zero
.L800AEEC0:
/* 9F6C0 800AEEC0 21380000 */  addu       $a3, $zero, $zero
.L800AEEC4:
/* 9F6C4 800AEEC4 C1CA010C */  jal        StateSwitchStateData
/* 9F6C8 800AEEC8 00000000 */   nop
/* 9F6CC 800AEECC 38FB80AF */  sw         $zero, %gp_rel(Raziel + 0x508)($gp)
/* 9F6D0 800AEED0 B8BB0208 */  j          .L800AEEE0
/* 9F6D4 800AEED4 00000000 */   nop
.L800AEED8:
/* 9F6D8 800AEED8 B9BF020C */  jal        DefaultStateHandler
/* 9F6DC 800AEEDC 21308002 */   addu      $a2, $s4, $zero
.L800AEEE0:
/* 9F6E0 800AEEE0 27C3010C */  jal        DeMessageQueue
/* 9F6E4 800AEEE4 04004426 */   addiu     $a0, $s2, 0x4
/* 9F6E8 800AEEE8 50BB0208 */  j          .L800AED40
/* 9F6EC 800AEEEC 00000000 */   nop
.L800AEEF0:
/* 9F6F0 800AEEF0 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 9F6F4 800AEEF4 3800B48F */  lw         $s4, 0x38($sp)
/* 9F6F8 800AEEF8 3400B38F */  lw         $s3, 0x34($sp)
/* 9F6FC 800AEEFC 3000B28F */  lw         $s2, 0x30($sp)
/* 9F700 800AEF00 2C00B18F */  lw         $s1, 0x2C($sp)
/* 9F704 800AEF04 2800B08F */  lw         $s0, 0x28($sp)
/* 9F708 800AEF08 0800E003 */  jr         $ra
/* 9F70C 800AEF0C 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerPickupObject, . - StateHandlerPickupObject
