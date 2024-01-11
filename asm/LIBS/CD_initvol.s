.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CD_initvol
/* B5758 800C4F58 0D80033C */  lui        $v1, %hi(CD_intstr + 0x234)
/* B575C 800C4F5C 5CEC638C */  lw         $v1, %lo(CD_intstr + 0x234)($v1)
/* B5760 800C4F60 00000000 */  nop
/* B5764 800C4F64 B8016294 */  lhu        $v0, 0x1B8($v1)
/* B5768 800C4F68 00000000 */  nop
/* B576C 800C4F6C 09004014 */  bnez       $v0, .L800C4F94
/* B5770 800C4F70 F8FFBD27 */   addiu     $sp, $sp, -0x8
/* B5774 800C4F74 BA016294 */  lhu        $v0, 0x1BA($v1)
/* B5778 800C4F78 00000000 */  nop
/* B577C 800C4F7C 06004014 */  bnez       $v0, .L800C4F98
/* B5780 800C4F80 FF3F0224 */   addiu     $v0, $zero, 0x3FFF
/* B5784 800C4F84 800162A4 */  sh         $v0, 0x180($v1)
/* B5788 800C4F88 820162A4 */  sh         $v0, 0x182($v1)
/* B578C 800C4F8C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x234)
/* B5790 800C4F90 5CEC638C */  lw         $v1, %lo(CD_intstr + 0x234)($v1)
.L800C4F94:
/* B5794 800C4F94 FF3F0224 */  addiu      $v0, $zero, 0x3FFF
.L800C4F98:
/* B5798 800C4F98 B00162A4 */  sh         $v0, 0x1B0($v1)
/* B579C 800C4F9C B20162A4 */  sh         $v0, 0x1B2($v1)
/* B57A0 800C4FA0 01C00234 */  ori        $v0, $zero, 0xC001
/* B57A4 800C4FA4 AA0162A4 */  sh         $v0, 0x1AA($v1)
/* B57A8 800C4FA8 0D80033C */  lui        $v1, %hi(CD_intstr + 0x220)
/* B57AC 800C4FAC 48EC638C */  lw         $v1, %lo(CD_intstr + 0x220)($v1)
/* B57B0 800C4FB0 80000224 */  addiu      $v0, $zero, 0x80
/* B57B4 800C4FB4 0200A2A3 */  sb         $v0, 0x2($sp)
/* B57B8 800C4FB8 0000A2A3 */  sb         $v0, 0x0($sp)
/* B57BC 800C4FBC 02000224 */  addiu      $v0, $zero, 0x2
/* B57C0 800C4FC0 0300A0A3 */  sb         $zero, 0x3($sp)
/* B57C4 800C4FC4 0100A0A3 */  sb         $zero, 0x1($sp)
/* B57C8 800C4FC8 000062A0 */  sb         $v0, 0x0($v1)
/* B57CC 800C4FCC 0D80033C */  lui        $v1, %hi(CD_intstr + 0x228)
/* B57D0 800C4FD0 50EC638C */  lw         $v1, %lo(CD_intstr + 0x228)($v1)
/* B57D4 800C4FD4 0000A293 */  lbu        $v0, 0x0($sp)
/* B57D8 800C4FD8 00000000 */  nop
/* B57DC 800C4FDC 000062A0 */  sb         $v0, 0x0($v1)
/* B57E0 800C4FE0 0D80033C */  lui        $v1, %hi(CD_intstr + 0x22C)
/* B57E4 800C4FE4 54EC638C */  lw         $v1, %lo(CD_intstr + 0x22C)($v1)
/* B57E8 800C4FE8 0100A293 */  lbu        $v0, 0x1($sp)
/* B57EC 800C4FEC 00000000 */  nop
/* B57F0 800C4FF0 000062A0 */  sb         $v0, 0x0($v1)
/* B57F4 800C4FF4 0D80033C */  lui        $v1, %hi(CD_intstr + 0x220)
/* B57F8 800C4FF8 48EC638C */  lw         $v1, %lo(CD_intstr + 0x220)($v1)
/* B57FC 800C4FFC 03000224 */  addiu      $v0, $zero, 0x3
/* B5800 800C5000 000062A0 */  sb         $v0, 0x0($v1)
/* B5804 800C5004 0D80033C */  lui        $v1, %hi(CD_intstr + 0x224)
/* B5808 800C5008 4CEC638C */  lw         $v1, %lo(CD_intstr + 0x224)($v1)
/* B580C 800C500C 0200A293 */  lbu        $v0, 0x2($sp)
/* B5810 800C5010 00000000 */  nop
/* B5814 800C5014 000062A0 */  sb         $v0, 0x0($v1)
/* B5818 800C5018 0D80033C */  lui        $v1, %hi(CD_intstr + 0x228)
/* B581C 800C501C 50EC638C */  lw         $v1, %lo(CD_intstr + 0x228)($v1)
/* B5820 800C5020 0300A293 */  lbu        $v0, 0x3($sp)
/* B5824 800C5024 00000000 */  nop
/* B5828 800C5028 000062A0 */  sb         $v0, 0x0($v1)
/* B582C 800C502C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x22C)
/* B5830 800C5030 54EC638C */  lw         $v1, %lo(CD_intstr + 0x22C)($v1)
/* B5834 800C5034 20000224 */  addiu      $v0, $zero, 0x20
/* B5838 800C5038 000062A0 */  sb         $v0, 0x0($v1)
/* B583C 800C503C 21100000 */  addu       $v0, $zero, $zero
/* B5840 800C5040 0800E003 */  jr         $ra
/* B5844 800C5044 0800BD27 */   addiu     $sp, $sp, 0x8
.size CD_initvol, . - CD_initvol
