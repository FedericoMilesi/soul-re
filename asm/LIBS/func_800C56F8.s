.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C56F8
/* B5EF8 800C56F8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B5EFC 800C56FC 2400B1AF */  sw         $s1, 0x24($sp)
/* B5F00 800C5700 2188A000 */  addu       $s1, $a1, $zero
/* B5F04 800C5704 0D80033C */  lui        $v1, %hi(CD_intstr + 0x274)
/* B5F08 800C5708 9CEC6324 */  addiu      $v1, $v1, %lo(CD_intstr + 0x274)
/* B5F0C 800C570C FF008430 */  andi       $a0, $a0, 0xFF
/* B5F10 800C5710 01000224 */  addiu      $v0, $zero, 0x1
/* B5F14 800C5714 2800BFAF */  sw         $ra, 0x28($sp)
/* B5F18 800C5718 2000B0AF */  sw         $s0, 0x20($sp)
/* B5F1C 800C571C 340071AC */  sw         $s1, 0x34($v1)
/* B5F20 800C5720 4E008214 */  bne        $a0, $v0, .L800C585C
/* B5F24 800C5724 FFFF0224 */   addiu     $v0, $zero, -0x1
/* B5F28 800C5728 1400628C */  lw         $v0, 0x14($v1)
/* B5F2C 800C572C 00000000 */  nop
/* B5F30 800C5730 4B004018 */  blez       $v0, .L800C5860
/* B5F34 800C5734 00000000 */   nop
/* B5F38 800C5738 1000638C */  lw         $v1, 0x10($v1)
/* B5F3C 800C573C 00020224 */  addiu      $v0, $zero, 0x200
/* B5F40 800C5740 23006214 */  bne        $v1, $v0, .L800C57D0
/* B5F44 800C5744 00000000 */   nop
/* B5F48 800C5748 0D80023C */  lui        $v0, %hi(CD_read_dma_mode)
/* B5F4C 800C574C 40E4428C */  lw         $v0, %lo(CD_read_dma_mode)($v0)
/* B5F50 800C5750 00000000 */  nop
/* B5F54 800C5754 01004230 */  andi       $v0, $v0, 0x1
/* B5F58 800C5758 0D004010 */  beqz       $v0, .L800C5790
/* B5F5C 800C575C 1000A427 */   addiu     $a0, $sp, 0x10
/* B5F60 800C5760 4FF9020C */  jal        CdDataCallback
/* B5F64 800C5764 21200000 */   addu      $a0, $zero, $zero
/* B5F68 800C5768 1000A427 */  addiu      $a0, $sp, 0x10
/* B5F6C 800C576C 47F9020C */  jal        CdGetSector2
/* B5F70 800C5770 03000524 */   addiu     $a1, $zero, 0x3
/* B5F74 800C5774 58F9020C */  jal        CdDataSync
/* B5F78 800C5778 21200000 */   addu      $a0, $zero, $zero
/* B5F7C 800C577C 0C80043C */  lui        $a0, %hi(func_800C596C)
/* B5F80 800C5780 4FF9020C */  jal        CdDataCallback
/* B5F84 800C5784 6C598424 */   addiu     $a0, $a0, %lo(func_800C596C)
/* B5F88 800C5788 E6150308 */  j          .L800C5798
/* B5F8C 800C578C 00000000 */   nop
.L800C5790:
/* B5F90 800C5790 3FF9020C */  jal        CdGetSector
/* B5F94 800C5794 03000524 */   addiu     $a1, $zero, 0x3
.L800C5798:
/* B5F98 800C5798 56FC020C */  jal        CdPosToInt
/* B5F9C 800C579C 1000A427 */   addiu     $a0, $sp, 0x10
/* B5FA0 800C57A0 0D80103C */  lui        $s0, %hi(CD_intstr + 0x294)
/* B5FA4 800C57A4 BCEC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x294)
/* B5FA8 800C57A8 0000038E */  lw         $v1, 0x0($s0)
/* B5FAC 800C57AC 00000000 */  nop
/* B5FB0 800C57B0 07004310 */  beq        $v0, $v1, .L800C57D0
/* B5FB4 800C57B4 00000000 */   nop
/* B5FB8 800C57B8 0180043C */  lui        $a0, %hi(D_80012CB4)
/* B5FBC 800C57BC 9901030C */  jal        puts
/* B5FC0 800C57C0 B42C8424 */   addiu     $a0, $a0, %lo(D_80012CB4)
/* B5FC4 800C57C4 E0FF0326 */  addiu      $v1, $s0, -0x20
/* B5FC8 800C57C8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* B5FCC 800C57CC 140062AC */  sw         $v0, 0x14($v1)
.L800C57D0:
/* B5FD0 800C57D0 0D80023C */  lui        $v0, %hi(CD_read_dma_mode)
/* B5FD4 800C57D4 40E4428C */  lw         $v0, %lo(CD_read_dma_mode)($v0)
/* B5FD8 800C57D8 00000000 */  nop
/* B5FDC 800C57DC 01004230 */  andi       $v0, $v0, 0x1
/* B5FE0 800C57E0 09004010 */  beqz       $v0, .L800C5808
/* B5FE4 800C57E4 00000000 */   nop
/* B5FE8 800C57E8 0D80023C */  lui        $v0, %hi(CD_intstr + 0x27C)
/* B5FEC 800C57EC A4EC4224 */  addiu      $v0, $v0, %lo(CD_intstr + 0x27C)
/* B5FF0 800C57F0 0000448C */  lw         $a0, 0x0($v0)
/* B5FF4 800C57F4 0800458C */  lw         $a1, 0x8($v0)
/* B5FF8 800C57F8 47F9020C */  jal        CdGetSector2
/* B5FFC 800C57FC 00000000 */   nop
/* B6000 800C5800 18160308 */  j          .L800C5860
/* B6004 800C5804 00000000 */   nop
.L800C5808:
/* B6008 800C5808 0D80103C */  lui        $s0, %hi(CD_intstr + 0x27C)
/* B600C 800C580C A4EC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x27C)
/* B6010 800C5810 0000048E */  lw         $a0, 0x0($s0)
/* B6014 800C5814 0800058E */  lw         $a1, 0x8($s0)
/* B6018 800C5818 3FF9020C */  jal        CdGetSector
/* B601C 800C581C 00000000 */   nop
/* B6020 800C5820 F8FF0426 */  addiu      $a0, $s0, -0x8
/* B6024 800C5824 0800028E */  lw         $v0, 0x8($s0)
/* B6028 800C5828 0000038E */  lw         $v1, 0x0($s0)
/* B602C 800C582C 80100200 */  sll        $v0, $v0, 2
/* B6030 800C5830 21186200 */  addu       $v1, $v1, $v0
/* B6034 800C5834 080083AC */  sw         $v1, 0x8($a0)
/* B6038 800C5838 1400828C */  lw         $v0, 0x14($a0)
/* B603C 800C583C 00000000 */  nop
/* B6040 800C5840 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B6044 800C5844 140082AC */  sw         $v0, 0x14($a0)
/* B6048 800C5848 2000828C */  lw         $v0, 0x20($a0)
/* B604C 800C584C 00000000 */  nop
/* B6050 800C5850 01004224 */  addiu      $v0, $v0, 0x1
/* B6054 800C5854 18160308 */  j          .L800C5860
/* B6058 800C5858 200082AC */   sw        $v0, 0x20($a0)
.L800C585C:
/* B605C 800C585C 140062AC */  sw         $v0, 0x14($v1)
.L800C5860:
/* B6060 800C5860 5EF2020C */  jal        VSync
/* B6064 800C5864 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B6068 800C5868 0D80103C */  lui        $s0, %hi(CD_intstr + 0x274)
/* B606C 800C586C 9CEC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x274)
/* B6070 800C5870 180002AE */  sw         $v0, 0x18($s0)
/* B6074 800C5874 1400028E */  lw         $v0, 0x14($s0)
/* B6078 800C5878 00000000 */  nop
/* B607C 800C587C 03004104 */  bgez       $v0, .L800C588C
/* B6080 800C5880 00000000 */   nop
/* B6084 800C5884 8F16030C */  jal        func_800C5A3C
/* B6088 800C5888 01000424 */   addiu     $a0, $zero, 0x1
.L800C588C:
/* B608C 800C588C 5EF2020C */  jal        VSync
/* B6090 800C5890 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B6094 800C5894 1C00038E */  lw         $v1, 0x1C($s0)
/* B6098 800C5898 00000000 */  nop
/* B609C 800C589C B0046324 */  addiu      $v1, $v1, 0x4B0
/* B60A0 800C58A0 2A186200 */  slt        $v1, $v1, $v0
/* B60A4 800C58A4 02006010 */  beqz       $v1, .L800C58B0
/* B60A8 800C58A8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* B60AC 800C58AC 140002AE */  sw         $v0, 0x14($s0)
.L800C58B0:
/* B60B0 800C58B0 1400028E */  lw         $v0, 0x14($s0)
/* B60B4 800C58B4 00000000 */  nop
/* B60B8 800C58B8 09004010 */  beqz       $v0, .L800C58E0
/* B60BC 800C58BC 00000000 */   nop
/* B60C0 800C58C0 5EF2020C */  jal        VSync
/* B60C4 800C58C4 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B60C8 800C58C8 1C00038E */  lw         $v1, 0x1C($s0)
/* B60CC 800C58CC 00000000 */  nop
/* B60D0 800C58D0 B0046324 */  addiu      $v1, $v1, 0x4B0
/* B60D4 800C58D4 2A186200 */  slt        $v1, $v1, $v0
/* B60D8 800C58D8 1F006010 */  beqz       $v1, .L800C5958
/* B60DC 800C58DC 00000000 */   nop
.L800C58E0:
/* B60E0 800C58E0 2C00048E */  lw         $a0, 0x2C($s0)
/* B60E4 800C58E4 4BF8020C */  jal        CdReadyCallback
/* B60E8 800C58E8 00000000 */   nop
/* B60EC 800C58EC 0D80023C */  lui        $v0, %hi(CD_read_dma_mode)
/* B60F0 800C58F0 40E4428C */  lw         $v0, %lo(CD_read_dma_mode)($v0)
/* B60F4 800C58F4 00000000 */  nop
/* B60F8 800C58F8 01004230 */  andi       $v0, $v0, 0x1
/* B60FC 800C58FC 04004010 */  beqz       $v0, .L800C5910
/* B6100 800C5900 00000000 */   nop
/* B6104 800C5904 3000048E */  lw         $a0, 0x30($s0)
/* B6108 800C5908 4FF9020C */  jal        CdDataCallback
/* B610C 800C590C 00000000 */   nop
.L800C5910:
/* B6110 800C5910 0C80043C */  lui        $a0, %hi(DeliverEvent + 0x10)
/* B6114 800C5914 46F8020C */  jal        CdSyncCallback
/* B6118 800C5918 C4568424 */   addiu     $a0, $a0, %lo(DeliverEvent + 0x10)
/* B611C 800C591C 09000424 */  addiu      $a0, $zero, 0x9
/* B6120 800C5920 9FF8020C */  jal        CdControlF
/* B6124 800C5924 21280000 */   addu      $a1, $zero, $zero
/* B6128 800C5928 0D80033C */  lui        $v1, %hi(CD_cbread)
/* B612C 800C592C 3CE4638C */  lw         $v1, %lo(CD_cbread)($v1)
/* B6130 800C5930 01000224 */  addiu      $v0, $zero, 0x1
/* B6134 800C5934 08006010 */  beqz       $v1, .L800C5958
/* B6138 800C5938 240002AE */   sw        $v0, 0x24($s0)
/* B613C 800C593C 1400028E */  lw         $v0, 0x14($s0)
/* B6140 800C5940 00000000 */  nop
/* B6144 800C5944 02004014 */  bnez       $v0, .L800C5950
/* B6148 800C5948 05000424 */   addiu     $a0, $zero, 0x5
/* B614C 800C594C 02000424 */  addiu      $a0, $zero, 0x2
.L800C5950:
/* B6150 800C5950 09F86000 */  jalr       $v1
/* B6154 800C5954 21282002 */   addu      $a1, $s1, $zero
.L800C5958:
/* B6158 800C5958 2800BF8F */  lw         $ra, 0x28($sp)
/* B615C 800C595C 2400B18F */  lw         $s1, 0x24($sp)
/* B6160 800C5960 2000B08F */  lw         $s0, 0x20($sp)
/* B6164 800C5964 0800E003 */  jr         $ra
/* B6168 800C5968 3000BD27 */   addiu     $sp, $sp, 0x30
.size func_800C56F8, . - func_800C56F8
