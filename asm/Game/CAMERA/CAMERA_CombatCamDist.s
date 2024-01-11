.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CombatCamDist
/* A4A4 80019CA4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A4A8 80019CA8 3000B0AF */  sw         $s0, 0x30($sp)
/* A4AC 80019CAC 21808000 */  addu       $s0, $a0, $zero
/* A4B0 80019CB0 3800BFAF */  sw         $ra, 0x38($sp)
/* A4B4 80019CB4 3400B1AF */  sw         $s1, 0x34($sp)
/* A4B8 80019CB8 0801048E */  lw         $a0, 0x108($s0)
/* A4BC 80019CBC 92D1000C */  jal        INSTANCE_Query
/* A4C0 80019CC0 22000524 */   addiu     $a1, $zero, 0x22
/* A4C4 80019CC4 21884000 */  addu       $s1, $v0, $zero
/* A4C8 80019CC8 06002016 */  bnez       $s1, .L80019CE4
/* A4CC 80019CCC 00100224 */   addiu     $v0, $zero, 0x1000
/* A4D0 80019CD0 A8010396 */  lhu        $v1, 0x1A8($s0)
/* A4D4 80019CD4 D8AB82A7 */  sh         $v0, %gp_rel(combat_cam_weight)($gp)
/* A4D8 80019CD8 D4AB83A7 */  sh         $v1, %gp_rel(combat_cam_distance)($gp)
/* A4DC 80019CDC D5670008 */  j          .L80019F54
/* A4E0 80019CE0 00000000 */   nop
.L80019CE4:
/* A4E4 80019CE4 6000048E */  lw         $a0, 0x60($s0)
/* A4E8 80019CE8 52F2020C */  jal        SetRotMatrix
/* A4EC 80019CEC 00000000 */   nop
/* A4F0 80019CF0 6000048E */  lw         $a0, 0x60($s0)
/* A4F4 80019CF4 4AF2020C */  jal        SetTransMatrix
/* A4F8 80019CF8 00000000 */   nop
/* A4FC 80019CFC 0801028E */  lw         $v0, 0x108($s0)
/* A500 80019D00 00000000 */  nop
/* A504 80019D04 5C004294 */  lhu        $v0, 0x5C($v0)
/* A508 80019D08 00000000 */  nop
/* A50C 80019D0C 2000A2A7 */  sh         $v0, 0x20($sp)
/* A510 80019D10 0801028E */  lw         $v0, 0x108($s0)
/* A514 80019D14 00000000 */  nop
/* A518 80019D18 5E004294 */  lhu        $v0, 0x5E($v0)
/* A51C 80019D1C 00000000 */  nop
/* A520 80019D20 2200A2A7 */  sh         $v0, 0x22($sp)
/* A524 80019D24 0801028E */  lw         $v0, 0x108($s0)
/* A528 80019D28 00000000 */  nop
/* A52C 80019D2C 60004294 */  lhu        $v0, 0x60($v0)
/* A530 80019D30 00000000 */  nop
/* A534 80019D34 2400A2A7 */  sh         $v0, 0x24($sp)
/* A538 80019D38 2000A227 */  addiu      $v0, $sp, 0x20
/* A53C 80019D3C 000040C8 */  lwc2       $0, 0x0($v0)
/* A540 80019D40 040041C8 */  lwc2       $1, 0x4($v0)
/* A544 80019D44 00000000 */  nop
/* A548 80019D48 00000000 */  nop
/* A54C 80019D4C 0100184A */  RTPS
/* A550 80019D50 1000A227 */  addiu      $v0, $sp, 0x10
/* A554 80019D54 00004EE8 */  swc2       $14, 0x0($v0)
/* A558 80019D58 2800A227 */  addiu      $v0, $sp, 0x28
/* A55C 80019D5C 000053E8 */  swc2       $19, 0x0($v0)
/* A560 80019D60 1000A487 */  lh         $a0, 0x10($sp)
/* A564 80019D64 00000000 */  nop
/* A568 80019D68 00018228 */  slti       $v0, $a0, 0x100
/* A56C 80019D6C 0B004010 */  beqz       $v0, .L80019D9C
/* A570 80019D70 00FF8224 */   addiu     $v0, $a0, -0x100
/* A574 80019D74 2800A38F */  lw         $v1, 0x28($sp)
/* A578 80019D78 00000000 */  nop
/* A57C 80019D7C 18004300 */  mult       $v0, $v1
/* A580 80019D80 12100000 */  mflo       $v0
/* A584 80019D84 02004104 */  bgez       $v0, .L80019D90
/* A588 80019D88 00000000 */   nop
/* A58C 80019D8C 7F004224 */  addiu      $v0, $v0, 0x7F
.L80019D90:
/* A590 80019D90 C3110200 */  sra        $v0, $v0, 7
/* A594 80019D94 6F670008 */  j          .L80019DBC
/* A598 80019D98 23100200 */   negu      $v0, $v0
.L80019D9C:
/* A59C 80019D9C 2800A38F */  lw         $v1, 0x28($sp)
/* A5A0 80019DA0 00000000 */  nop
/* A5A4 80019DA4 18004300 */  mult       $v0, $v1
/* A5A8 80019DA8 12100000 */  mflo       $v0
/* A5AC 80019DAC 02004104 */  bgez       $v0, .L80019DB8
/* A5B0 80019DB0 00000000 */   nop
/* A5B4 80019DB4 7F004224 */  addiu      $v0, $v0, 0x7F
.L80019DB8:
/* A5B8 80019DB8 C3110200 */  sra        $v0, $v0, 7
.L80019DBC:
/* A5BC 80019DBC D4AB82A7 */  sh         $v0, %gp_rel(combat_cam_distance)($gp)
/* A5C0 80019DC0 D4AB8287 */  lh         $v0, %gp_rel(combat_cam_distance)($gp)
/* A5C4 80019DC4 00000000 */  nop
/* A5C8 80019DC8 B90B4228 */  slti       $v0, $v0, 0xBB9
/* A5CC 80019DCC 02004014 */  bnez       $v0, .L80019DD8
/* A5D0 80019DD0 B80B0224 */   addiu     $v0, $zero, 0xBB8
/* A5D4 80019DD4 D4AB82A7 */  sh         $v0, %gp_rel(combat_cam_distance)($gp)
.L80019DD8:
/* A5D8 80019DD8 D4AB8287 */  lh         $v0, %gp_rel(combat_cam_distance)($gp)
/* A5DC 80019DDC A8010386 */  lh         $v1, 0x1A8($s0)
/* A5E0 80019DE0 A8010496 */  lhu        $a0, 0x1A8($s0)
/* A5E4 80019DE4 2A104300 */  slt        $v0, $v0, $v1
/* A5E8 80019DE8 02004010 */  beqz       $v0, .L80019DF4
/* A5EC 80019DEC 00000000 */   nop
/* A5F0 80019DF0 D4AB84A7 */  sh         $a0, %gp_rel(combat_cam_distance)($gp)
.L80019DF4:
/* A5F4 80019DF4 1200A387 */  lh         $v1, 0x12($sp)
/* A5F8 80019DF8 00000000 */  nop
/* A5FC 80019DFC F1006228 */  slti       $v0, $v1, 0xF1
/* A600 80019E00 0C004014 */  bnez       $v0, .L80019E34
/* A604 80019E04 D2006228 */   slti      $v0, $v1, 0xD2
/* A608 80019E08 D8AB8297 */  lhu        $v0, %gp_rel(combat_cam_weight)($gp)
/* A60C 80019E0C 00000000 */  nop
/* A610 80019E10 30004224 */  addiu      $v0, $v0, 0x30
/* A614 80019E14 D8AB82A7 */  sh         $v0, %gp_rel(combat_cam_weight)($gp)
/* A618 80019E18 00140200 */  sll        $v0, $v0, 16
/* A61C 80019E1C 03140200 */  sra        $v0, $v0, 16
/* A620 80019E20 01104228 */  slti       $v0, $v0, 0x1001
/* A624 80019E24 0F004014 */  bnez       $v0, .L80019E64
/* A628 80019E28 00100224 */   addiu     $v0, $zero, 0x1000
/* A62C 80019E2C 98670008 */  j          .L80019E60
/* A630 80019E30 00000000 */   nop
.L80019E34:
/* A634 80019E34 0B004010 */  beqz       $v0, .L80019E64
/* A638 80019E38 00000000 */   nop
/* A63C 80019E3C D8AB8297 */  lhu        $v0, %gp_rel(combat_cam_weight)($gp)
/* A640 80019E40 00000000 */  nop
/* A644 80019E44 D0FF4224 */  addiu      $v0, $v0, -0x30
/* A648 80019E48 D8AB82A7 */  sh         $v0, %gp_rel(combat_cam_weight)($gp)
/* A64C 80019E4C 00140200 */  sll        $v0, $v0, 16
/* A650 80019E50 03140200 */  sra        $v0, $v0, 16
/* A654 80019E54 00084228 */  slti       $v0, $v0, 0x800
/* A658 80019E58 02004010 */  beqz       $v0, .L80019E64
/* A65C 80019E5C 00080224 */   addiu     $v0, $zero, 0x800
.L80019E60:
/* A660 80019E60 D8AB82A7 */  sh         $v0, %gp_rel(combat_cam_weight)($gp)
.L80019E64:
/* A664 80019E64 5C002296 */  lhu        $v0, 0x5C($s1)
/* A668 80019E68 00000000 */  nop
/* A66C 80019E6C 2000A2A7 */  sh         $v0, 0x20($sp)
/* A670 80019E70 5E002296 */  lhu        $v0, 0x5E($s1)
/* A674 80019E74 00000000 */  nop
/* A678 80019E78 2200A2A7 */  sh         $v0, 0x22($sp)
/* A67C 80019E7C 60002296 */  lhu        $v0, 0x60($s1)
/* A680 80019E80 00000000 */  nop
/* A684 80019E84 2400A2A7 */  sh         $v0, 0x24($sp)
/* A688 80019E88 2000A227 */  addiu      $v0, $sp, 0x20
/* A68C 80019E8C 000040C8 */  lwc2       $0, 0x0($v0)
/* A690 80019E90 040041C8 */  lwc2       $1, 0x4($v0)
/* A694 80019E94 00000000 */  nop
/* A698 80019E98 00000000 */  nop
/* A69C 80019E9C 0100184A */  RTPS
/* A6A0 80019EA0 1800A227 */  addiu      $v0, $sp, 0x18
/* A6A4 80019EA4 00004EE8 */  swc2       $14, 0x0($v0)
/* A6A8 80019EA8 1A00A387 */  lh         $v1, 0x1A($sp)
/* A6AC 80019EAC 1200A487 */  lh         $a0, 0x12($sp)
/* A6B0 80019EB0 1800A287 */  lh         $v0, 0x18($sp)
/* A6B4 80019EB4 1000A587 */  lh         $a1, 0x10($sp)
/* A6B8 80019EB8 23206400 */  subu       $a0, $v1, $a0
/* A6BC 80019EBC 26F3020C */  jal        ratan2
/* A6C0 80019EC0 23284500 */   subu      $a1, $v0, $a1
/* A6C4 80019EC4 0A004004 */  bltz       $v0, .L80019EF0
/* A6C8 80019EC8 00000000 */   nop
/* A6CC 80019ECC 1A00A387 */  lh         $v1, 0x1A($sp)
/* A6D0 80019ED0 1200A487 */  lh         $a0, 0x12($sp)
/* A6D4 80019ED4 1800A287 */  lh         $v0, 0x18($sp)
/* A6D8 80019ED8 1000A587 */  lh         $a1, 0x10($sp)
/* A6DC 80019EDC 23206400 */  subu       $a0, $v1, $a0
/* A6E0 80019EE0 26F3020C */  jal        ratan2
/* A6E4 80019EE4 23284500 */   subu      $a1, $v0, $a1
/* A6E8 80019EE8 C4670008 */  j          .L80019F10
/* A6EC 80019EEC 21184000 */   addu      $v1, $v0, $zero
.L80019EF0:
/* A6F0 80019EF0 1A00A387 */  lh         $v1, 0x1A($sp)
/* A6F4 80019EF4 1200A487 */  lh         $a0, 0x12($sp)
/* A6F8 80019EF8 1800A287 */  lh         $v0, 0x18($sp)
/* A6FC 80019EFC 1000A587 */  lh         $a1, 0x10($sp)
/* A700 80019F00 23206400 */  subu       $a0, $v1, $a0
/* A704 80019F04 26F3020C */  jal        ratan2
/* A708 80019F08 23284500 */   subu      $a1, $v0, $a1
/* A70C 80019F0C 23180200 */  negu       $v1, $v0
.L80019F10:
/* A710 80019F10 D6AB83A7 */  sh         $v1, %gp_rel(combat_cam_angle)($gp)
/* A714 80019F14 00140300 */  sll        $v0, $v1, 16
/* A718 80019F18 03140200 */  sra        $v0, $v0, 16
/* A71C 80019F1C 01044228 */  slti       $v0, $v0, 0x401
/* A720 80019F20 03004014 */  bnez       $v0, .L80019F30
/* A724 80019F24 00080224 */   addiu     $v0, $zero, 0x800
/* A728 80019F28 23104300 */  subu       $v0, $v0, $v1
/* A72C 80019F2C D6AB82A7 */  sh         $v0, %gp_rel(combat_cam_angle)($gp)
.L80019F30:
/* A730 80019F30 D6AB8387 */  lh         $v1, %gp_rel(combat_cam_angle)($gp)
/* A734 80019F34 00000000 */  nop
/* A738 80019F38 02006104 */  bgez       $v1, .L80019F44
/* A73C 80019F3C 00000000 */   nop
/* A740 80019F40 07006324 */  addiu      $v1, $v1, 0x7
.L80019F44:
/* A744 80019F44 C3180300 */  sra        $v1, $v1, 3
/* A748 80019F48 56FF0224 */  addiu      $v0, $zero, -0xAA
/* A74C 80019F4C 23104300 */  subu       $v0, $v0, $v1
/* A750 80019F50 D6AB82A7 */  sh         $v0, %gp_rel(combat_cam_angle)($gp)
.L80019F54:
/* A754 80019F54 3800BF8F */  lw         $ra, 0x38($sp)
/* A758 80019F58 3400B18F */  lw         $s1, 0x34($sp)
/* A75C 80019F5C 3000B08F */  lw         $s0, 0x30($sp)
/* A760 80019F60 0800E003 */  jr         $ra
/* A764 80019F64 4000BD27 */   addiu     $sp, $sp, 0x40
.size CAMERA_CombatCamDist, . - CAMERA_CombatCamDist
