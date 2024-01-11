.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_UpdateFocusRotate
/* CEF0 8001C6F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* CEF4 8001C6F4 1800B0AF */  sw         $s0, 0x18($sp)
/* CEF8 8001C6F8 21808000 */  addu       $s0, $a0, $zero
/* CEFC 8001C6FC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* CF00 8001C700 08040386 */  lh         $v1, 0x408($s0)
/* CF04 8001C704 01000224 */  addiu      $v0, $zero, 0x1
/* CF08 8001C708 28006210 */  beq        $v1, $v0, .L8001C7AC
/* CF0C 8001C70C 00000000 */   nop
/* CF10 8001C710 EC00028E */  lw         $v0, 0xEC($s0)
/* CF14 8001C714 00000000 */  nop
/* CF18 8001C718 04004230 */  andi       $v0, $v0, 0x4
/* CF1C 8001C71C 28004014 */  bnez       $v0, .L8001C7C0
/* CF20 8001C720 00000000 */   nop
/* CF24 8001C724 AE040286 */  lh         $v0, 0x4AE($s0)
/* CF28 8001C728 00000000 */  nop
/* CF2C 8001C72C 04004010 */  beqz       $v0, .L8001C740
/* CF30 8001C730 01000424 */   addiu     $a0, $zero, 0x1
/* CF34 8001C734 C4010286 */  lh         $v0, 0x1C4($s0)
/* CF38 8001C738 D7710008 */  j          .L8001C75C
/* CF3C 8001C73C 23180200 */   negu      $v1, $v0
.L8001C740:
/* CF40 8001C740 E800028E */  lw         $v0, 0xE8($s0)
/* CF44 8001C744 0100033C */  lui        $v1, (0x10000 >> 16)
/* CF48 8001C748 24104300 */  and        $v0, $v0, $v1
/* CF4C 8001C74C 03004014 */  bnez       $v0, .L8001C75C
/* CF50 8001C750 80000324 */   addiu     $v1, $zero, 0x80
/* CF54 8001C754 05000424 */  addiu      $a0, $zero, 0x5
/* CF58 8001C758 A0000324 */  addiu      $v1, $zero, 0xA0
.L8001C75C:
/* CF5C 8001C75C 40010526 */  addiu      $a1, $s0, 0x140
/* CF60 8001C760 C0010686 */  lh         $a2, 0x1C0($s0)
/* CF64 8001C764 78010226 */  addiu      $v0, $s0, 0x178
/* CF68 8001C768 1000A2AF */  sw         $v0, 0x10($sp)
/* CF6C 8001C76C 00140300 */  sll        $v0, $v1, 16
/* CF70 8001C770 03140200 */  sra        $v0, $v0, 16
/* CF74 8001C774 70010726 */  addiu      $a3, $s0, 0x170
/* CF78 8001C778 7E5E000C */  jal        CriticalDampAngle
/* CF7C 8001C77C 1400A2AF */   sw        $v0, 0x14($sp)
/* CF80 8001C780 B6010486 */  lh         $a0, 0x1B6($s0)
/* CF84 8001C784 40010586 */  lh         $a1, 0x140($s0)
/* CF88 8001C788 BC59000C */  jal        CAMERA_AngleDifference
/* CF8C 8001C78C 00000000 */   nop
/* CF90 8001C790 00140200 */  sll        $v0, $v0, 16
/* CF94 8001C794 03140200 */  sra        $v0, $v0, 16
/* CF98 8001C798 04004228 */  slti       $v0, $v0, 0x4
/* CF9C 8001C79C 0B004010 */  beqz       $v0, .L8001C7CC
/* CFA0 8001C7A0 00000000 */   nop
/* CFA4 8001C7A4 F3710008 */  j          .L8001C7CC
/* CFA8 8001C7A8 AE0400A6 */   sh        $zero, 0x4AE($s0)
.L8001C7AC:
/* CFAC 8001C7AC EC00028E */  lw         $v0, 0xEC($s0)
/* CFB0 8001C7B0 00000000 */  nop
/* CFB4 8001C7B4 04004230 */  andi       $v0, $v0, 0x4
/* CFB8 8001C7B8 04004010 */  beqz       $v0, .L8001C7CC
/* CFBC 8001C7BC 00000000 */   nop
.L8001C7C0:
/* CFC0 8001C7C0 B6010296 */  lhu        $v0, 0x1B6($s0)
/* CFC4 8001C7C4 00000000 */  nop
/* CFC8 8001C7C8 400102A6 */  sh         $v0, 0x140($s0)
.L8001C7CC:
/* CFCC 8001C7CC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* CFD0 8001C7D0 1800B08F */  lw         $s0, 0x18($sp)
/* CFD4 8001C7D4 0800E003 */  jr         $ra
/* CFD8 8001C7D8 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_UpdateFocusRotate, . - CAMERA_UpdateFocusRotate
