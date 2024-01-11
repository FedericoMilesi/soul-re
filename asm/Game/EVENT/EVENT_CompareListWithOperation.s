.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_CompareListWithOperation
/* 56D28 80066528 60A4838F */  lw         $v1, %gp_rel(CurrentEventLine)($gp)
/* 56D2C 8006652C 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 56D30 80066530 6400B7AF */  sw         $s7, 0x64($sp)
/* 56D34 80066534 21B88000 */  addu       $s7, $a0, $zero
/* 56D38 80066538 5400B3AF */  sw         $s3, 0x54($sp)
/* 56D3C 8006653C 2198A000 */  addu       $s3, $a1, $zero
/* 56D40 80066540 6800BEAF */  sw         $fp, 0x68($sp)
/* 56D44 80066544 21F0E000 */  addu       $fp, $a3, $zero
/* 56D48 80066548 5800B4AF */  sw         $s4, 0x58($sp)
/* 56D4C 8006654C 21A00000 */  addu       $s4, $zero, $zero
/* 56D50 80066550 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 56D54 80066554 6000B6AF */  sw         $s6, 0x60($sp)
/* 56D58 80066558 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 56D5C 8006655C 5000B2AF */  sw         $s2, 0x50($sp)
/* 56D60 80066560 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 56D64 80066564 4800B0AF */  sw         $s0, 0x48($sp)
/* 56D68 80066568 14006228 */  slti       $v0, $v1, 0x14
/* 56D6C 8006656C 05004010 */  beqz       $v0, .L80066584
/* 56D70 80066570 7800A6AF */   sw        $a2, 0x78($sp)
/* 56D74 80066574 80100300 */  sll        $v0, $v1, 2
/* 56D78 80066578 38CE8327 */  addiu      $v1, $gp, %gp_rel(eventListNumInstances)
/* 56D7C 8006657C 21104300 */  addu       $v0, $v0, $v1
/* 56D80 80066580 000040AC */  sw         $zero, 0x0($v0)
.L80066584:
/* 56D84 80066584 0000628E */  lw         $v0, 0x0($s3)
/* 56D88 80066588 3800B027 */  addiu      $s0, $sp, 0x38
/* 56D8C 8006658C 0800458C */  lw         $a1, 0x8($v0)
/* 56D90 80066590 1CF4020C */  jal        func_800BD070
/* 56D94 80066594 21200002 */   addu      $a0, $s0, $zero
/* 56D98 80066598 21200002 */  addu       $a0, $s0, $zero
/* 56D9C 8006659C 0CF4020C */  jal        func_800BD030
/* 56DA0 800665A0 3F000524 */   addiu     $a1, $zero, 0x3F
/* 56DA4 800665A4 02004010 */  beqz       $v0, .L800665B0
/* 56DA8 800665A8 00000000 */   nop
/* 56DAC 800665AC 000040A0 */  sb         $zero, 0x0($v0)
.L800665B0:
/* 56DB0 800665B0 0000628E */  lw         $v0, 0x0($s3)
/* 56DB4 800665B4 00000000 */  nop
/* 56DB8 800665B8 0400558C */  lw         $s5, 0x4($v0)
/* 56DBC 800665BC 3F000224 */  addiu      $v0, $zero, 0x3F
/* 56DC0 800665C0 0200A216 */  bne        $s5, $v0, .L800665CC
/* 56DC4 800665C4 21900000 */   addu      $s2, $zero, $zero
/* 56DC8 800665C8 21A80000 */  addu       $s5, $zero, $zero
.L800665CC:
/* 56DCC 800665CC 38CE9627 */  addiu      $s6, $gp, %gp_rel(eventListNumInstances)
/* 56DD0 800665D0 2120A002 */  addu       $a0, $s5, $zero
.L800665D4:
/* 56DD4 800665D4 3800A527 */  addiu      $a1, $sp, 0x38
/* 56DD8 800665D8 0CD2000C */  jal        INSTANCE_FindWithName
/* 56DDC 800665DC 21304002 */   addu      $a2, $s2, $zero
/* 56DE0 800665E0 21904000 */  addu       $s2, $v0, $zero
/* 56DE4 800665E4 40004012 */  beqz       $s2, .L800666E8
/* 56DE8 800665E8 02000224 */   addiu     $v0, $zero, 0x2
/* 56DEC 800665EC 1000A2AF */  sw         $v0, 0x10($sp)
/* 56DF0 800665F0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 56DF4 800665F4 1400B2AF */  sw         $s2, 0x14($sp)
/* 56DF8 800665F8 1800A2AF */  sw         $v0, 0x18($sp)
/* 56DFC 800665FC 1800628E */  lw         $v0, 0x18($s3)
/* 56E00 80066600 00000000 */  nop
/* 56E04 80066604 0D004018 */  blez       $v0, .L8006663C
/* 56E08 80066608 21800000 */   addu      $s0, $zero, $zero
/* 56E0C 8006660C 21886002 */  addu       $s1, $s3, $zero
/* 56E10 80066610 1000A427 */  addiu      $a0, $sp, 0x10
.L80066614:
/* 56E14 80066614 2128E002 */  addu       $a1, $s7, $zero
/* 56E18 80066618 21380000 */  addu       $a3, $zero, $zero
/* 56E1C 8006661C 0400268E */  lw         $a2, 0x4($s1)
/* 56E20 80066620 BFA2010C */  jal        EVENT_TransformOperand
/* 56E24 80066624 04003126 */   addiu     $s1, $s1, 0x4
/* 56E28 80066628 1800628E */  lw         $v0, 0x18($s3)
/* 56E2C 8006662C 01001026 */  addiu      $s0, $s0, 0x1
/* 56E30 80066630 2A100202 */  slt        $v0, $s0, $v0
/* 56E34 80066634 F7FF4014 */  bnez       $v0, .L80066614
/* 56E38 80066638 1000A427 */   addiu     $a0, $sp, 0x10
.L8006663C:
/* 56E3C 8006663C 2120E002 */  addu       $a0, $s7, $zero
/* 56E40 80066640 1000A527 */  addiu      $a1, $sp, 0x10
/* 56E44 80066644 7800A68F */  lw         $a2, 0x78($sp)
/* 56E48 80066648 2E9A010C */  jal        EVENT_CompareOperandsWithOperation
/* 56E4C 8006664C 2138C003 */   addu      $a3, $fp, $zero
/* 56E50 80066650 16004010 */  beqz       $v0, .L800666AC
/* 56E54 80066654 0B000224 */   addiu     $v0, $zero, 0xB
/* 56E58 80066658 60A4848F */  lw         $a0, %gp_rel(CurrentEventLine)($gp)
/* 56E5C 8006665C 00000000 */  nop
/* 56E60 80066660 14008228 */  slti       $v0, $a0, 0x14
/* 56E64 80066664 0F004010 */  beqz       $v0, .L800666A4
/* 56E68 80066668 80300400 */   sll       $a2, $a0, 2
/* 56E6C 8006666C 2138D600 */  addu       $a3, $a2, $s6
/* 56E70 80066670 0000E58C */  lw         $a1, 0x0($a3)
/* 56E74 80066674 00000000 */  nop
/* 56E78 80066678 0A00A228 */  slti       $v0, $a1, 0xA
/* 56E7C 8006667C 09004010 */  beqz       $v0, .L800666A4
/* 56E80 80066680 80180500 */   sll       $v1, $a1, 2
/* 56E84 80066684 2110C400 */  addu       $v0, $a2, $a0
/* 56E88 80066688 C0100200 */  sll        $v0, $v0, 3
/* 56E8C 8006668C 21186200 */  addu       $v1, $v1, $v0
/* 56E90 80066690 28CF8227 */  addiu      $v0, $gp, %gp_rel(eventListArray)
/* 56E94 80066694 21186200 */  addu       $v1, $v1, $v0
/* 56E98 80066698 0100A224 */  addiu      $v0, $a1, 0x1
/* 56E9C 8006669C 000072AC */  sw         $s2, 0x0($v1)
/* 56EA0 800666A0 0000E2AC */  sw         $v0, 0x0($a3)
.L800666A4:
/* 56EA4 800666A4 B8990108 */  j          .L800666E0
/* 56EA8 800666A8 01001424 */   addiu     $s4, $zero, 0x1
.L800666AC:
/* 56EAC 800666AC 0C00C217 */  bne        $fp, $v0, .L800666E0
/* 56EB0 800666B0 00000000 */   nop
/* 56EB4 800666B4 60A4828F */  lw         $v0, %gp_rel(CurrentEventLine)($gp)
/* 56EB8 800666B8 00000000 */  nop
/* 56EBC 800666BC 80100200 */  sll        $v0, $v0, 2
/* 56EC0 800666C0 21185600 */  addu       $v1, $v0, $s6
/* 56EC4 800666C4 0000628C */  lw         $v0, 0x0($v1)
/* 56EC8 800666C8 00000000 */  nop
/* 56ECC 800666CC 0A004228 */  slti       $v0, $v0, 0xA
/* 56ED0 800666D0 05004010 */  beqz       $v0, .L800666E8
/* 56ED4 800666D4 21A00000 */   addu      $s4, $zero, $zero
/* 56ED8 800666D8 BA990108 */  j          .L800666E8
/* 56EDC 800666DC 000060AC */   sw        $zero, 0x0($v1)
.L800666E0:
/* 56EE0 800666E0 BCFF4016 */  bnez       $s2, .L800665D4
/* 56EE4 800666E4 2120A002 */   addu      $a0, $s5, $zero
.L800666E8:
/* 56EE8 800666E8 21108002 */  addu       $v0, $s4, $zero
/* 56EEC 800666EC 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 56EF0 800666F0 6800BE8F */  lw         $fp, 0x68($sp)
/* 56EF4 800666F4 6400B78F */  lw         $s7, 0x64($sp)
/* 56EF8 800666F8 6000B68F */  lw         $s6, 0x60($sp)
/* 56EFC 800666FC 5C00B58F */  lw         $s5, 0x5C($sp)
/* 56F00 80066700 5800B48F */  lw         $s4, 0x58($sp)
/* 56F04 80066704 5400B38F */  lw         $s3, 0x54($sp)
/* 56F08 80066708 5000B28F */  lw         $s2, 0x50($sp)
/* 56F0C 8006670C 4C00B18F */  lw         $s1, 0x4C($sp)
/* 56F10 80066710 4800B08F */  lw         $s0, 0x48($sp)
/* 56F14 80066714 0800E003 */  jr         $ra
/* 56F18 80066718 7000BD27 */   addiu     $sp, $sp, 0x70
.size EVENT_CompareListWithOperation, . - EVENT_CompareListWithOperation
