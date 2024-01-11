.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _spu_init
/* B6824 800C6024 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B6828 800C6028 1000B0AF */  sw         $s0, 0x10($sp)
/* B682C 800C602C 21808000 */  addu       $s0, $a0, $zero
/* B6830 800C6030 0D80043C */  lui        $a0, %hi(_spu_RXX + 0x10)
/* B6834 800C6034 6CED848C */  lw         $a0, %lo(_spu_RXX + 0x10)($a0)
/* B6838 800C6038 1800BFAF */  sw         $ra, 0x18($sp)
/* B683C 800C603C 1400B1AF */  sw         $s1, 0x14($sp)
/* B6840 800C6040 0000828C */  lw         $v0, 0x0($a0)
/* B6844 800C6044 0B00033C */  lui        $v1, (0xB0000 >> 16)
/* B6848 800C6048 25104300 */  or         $v0, $v0, $v1
/* B684C 800C604C 000082AC */  sw         $v0, 0x0($a0)
/* B6850 800C6050 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6854 800C6054 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6858 800C6058 0D80013C */  lui        $at, %hi(_spu_transMode)
/* B685C 800C605C 78ED20AC */  sw         $zero, %lo(_spu_transMode)($at)
/* B6860 800C6060 0D80013C */  lui        $at, %hi(_spu_addrMode)
/* B6864 800C6064 7CED20AC */  sw         $zero, %lo(_spu_addrMode)($at)
/* B6868 800C6068 0D80013C */  lui        $at, %hi(_spu_tsa)
/* B686C 800C606C 74ED20A4 */  sh         $zero, %lo(_spu_tsa)($at)
/* B6870 800C6070 800140A4 */  sh         $zero, 0x180($v0)
/* B6874 800C6074 820140A4 */  sh         $zero, 0x182($v0)
/* B6878 800C6078 861A030C */  jal        _spu_Fw1ts
/* B687C 800C607C AA0140A4 */   sh        $zero, 0x1AA($v0)
/* B6880 800C6080 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6884 800C6084 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6888 800C6088 00000000 */  nop
/* B688C 800C608C 800140A4 */  sh         $zero, 0x180($v0)
/* B6890 800C6090 820140A4 */  sh         $zero, 0x182($v0)
/* B6894 800C6094 AE014294 */  lhu        $v0, 0x1AE($v0)
/* B6898 800C6098 00000000 */  nop
/* B689C 800C609C FF074230 */  andi       $v0, $v0, 0x7FF
/* B68A0 800C60A0 14004010 */  beqz       $v0, .L800C60F4
/* B68A4 800C60A4 21180000 */   addu      $v1, $zero, $zero
/* B68A8 800C60A8 01006324 */  addiu      $v1, $v1, 0x1
.L800C60AC:
/* B68AC 800C60AC 010F622C */  sltiu      $v0, $v1, 0xF01
/* B68B0 800C60B0 08004014 */  bnez       $v0, .L800C60D4
/* B68B4 800C60B4 00000000 */   nop
/* B68B8 800C60B8 0180043C */  lui        $a0, %hi(D_80012D04)
/* B68BC 800C60BC 042D8424 */  addiu      $a0, $a0, %lo(D_80012D04)
/* B68C0 800C60C0 0180053C */  lui        $a1, %hi(D_80012D14)
/* B68C4 800C60C4 06D1010C */  jal        printf
/* B68C8 800C60C8 142DA524 */   addiu     $a1, $a1, %lo(D_80012D14)
/* B68CC 800C60CC 3E180308 */  j          .L800C60F8
/* B68D0 800C60D0 21200000 */   addu      $a0, $zero, $zero
.L800C60D4:
/* B68D4 800C60D4 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B68D8 800C60D8 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B68DC 800C60DC 00000000 */  nop
/* B68E0 800C60E0 AE014294 */  lhu        $v0, 0x1AE($v0)
/* B68E4 800C60E4 00000000 */  nop
/* B68E8 800C60E8 FF074230 */  andi       $v0, $v0, 0x7FF
/* B68EC 800C60EC EFFF4014 */  bnez       $v0, .L800C60AC
/* B68F0 800C60F0 01006324 */   addiu     $v1, $v1, 0x1
.L800C60F4:
/* B68F4 800C60F4 21200000 */  addu       $a0, $zero, $zero
.L800C60F8:
/* B68F8 800C60F8 0E80053C */  lui        $a1, %hi(_spu_RQ)
/* B68FC 800C60FC BCFDA524 */  addiu      $a1, $a1, %lo(_spu_RQ)
/* B6900 800C6100 02000224 */  addiu      $v0, $zero, 0x2
/* B6904 800C6104 0D80013C */  lui        $at, %hi(_spu_mem_mode)
/* B6908 800C6108 80ED22AC */  sw         $v0, %lo(_spu_mem_mode)($at)
/* B690C 800C610C 03000224 */  addiu      $v0, $zero, 0x3
/* B6910 800C6110 0D80013C */  lui        $at, %hi(_spu_mem_mode_plus)
/* B6914 800C6114 84ED22AC */  sw         $v0, %lo(_spu_mem_mode_plus)($at)
/* B6918 800C6118 08000224 */  addiu      $v0, $zero, 0x8
/* B691C 800C611C 0D80013C */  lui        $at, %hi(_spu_mem_mode_unit)
/* B6920 800C6120 88ED22AC */  sw         $v0, %lo(_spu_mem_mode_unit)($at)
/* B6924 800C6124 07000224 */  addiu      $v0, $zero, 0x7
/* B6928 800C6128 0D80013C */  lui        $at, %hi(_spu_mem_mode_unitM)
/* B692C 800C612C 8CED22AC */  sw         $v0, %lo(_spu_mem_mode_unitM)($at)
/* B6930 800C6130 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6934 800C6134 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6938 800C6138 04000324 */  addiu      $v1, $zero, 0x4
/* B693C 800C613C AC0143A4 */  sh         $v1, 0x1AC($v0)
/* B6940 800C6140 FFFF0334 */  ori        $v1, $zero, 0xFFFF
/* B6944 800C6144 840140A4 */  sh         $zero, 0x184($v0)
/* B6948 800C6148 860140A4 */  sh         $zero, 0x186($v0)
/* B694C 800C614C 8C0143A4 */  sh         $v1, 0x18C($v0)
/* B6950 800C6150 8E0143A4 */  sh         $v1, 0x18E($v0)
/* B6954 800C6154 980140A4 */  sh         $zero, 0x198($v0)
/* B6958 800C6158 9A0140A4 */  sh         $zero, 0x19A($v0)
.L800C615C:
/* B695C 800C615C 0000A0A4 */  sh         $zero, 0x0($a1)
/* B6960 800C6160 01008424 */  addiu      $a0, $a0, 0x1
/* B6964 800C6164 0A008228 */  slti       $v0, $a0, 0xA
/* B6968 800C6168 FCFF4014 */  bnez       $v0, .L800C615C
/* B696C 800C616C 0200A524 */   addiu     $a1, $a1, 0x2
/* B6970 800C6170 3C000016 */  bnez       $s0, .L800C6264
/* B6974 800C6174 21100000 */   addu      $v0, $zero, $zero
/* B6978 800C6178 0D80043C */  lui        $a0, %hi(_spu_IRQCallback + 0x4)
/* B697C 800C617C 9CED8424 */  addiu      $a0, $a0, %lo(_spu_IRQCallback + 0x4)
/* B6980 800C6180 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6984 800C6184 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6988 800C6188 00020324 */  addiu      $v1, $zero, 0x200
/* B698C 800C618C 0D80013C */  lui        $at, %hi(_spu_tsa)
/* B6990 800C6190 74ED23A4 */  sh         $v1, %lo(_spu_tsa)($at)
/* B6994 800C6194 900140A4 */  sh         $zero, 0x190($v0)
/* B6998 800C6198 920140A4 */  sh         $zero, 0x192($v0)
/* B699C 800C619C 940140A4 */  sh         $zero, 0x194($v0)
/* B69A0 800C61A0 960140A4 */  sh         $zero, 0x196($v0)
/* B69A4 800C61A4 B00140A4 */  sh         $zero, 0x1B0($v0)
/* B69A8 800C61A8 B20140A4 */  sh         $zero, 0x1B2($v0)
/* B69AC 800C61AC B40140A4 */  sh         $zero, 0x1B4($v0)
/* B69B0 800C61B0 B60140A4 */  sh         $zero, 0x1B6($v0)
/* B69B4 800C61B4 A918030C */  jal        func_800C62A4
/* B69B8 800C61B8 10000524 */   addiu     $a1, $zero, 0x10
/* B69BC 800C61BC 21200000 */  addu       $a0, $zero, $zero
/* B69C0 800C61C0 FF3F0624 */  addiu      $a2, $zero, 0x3FFF
/* B69C4 800C61C4 00020524 */  addiu      $a1, $zero, 0x200
/* B69C8 800C61C8 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B69CC 800C61CC 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B69D0 800C61D0 00000000 */  nop
.L800C61D4:
/* B69D4 800C61D4 000060A4 */  sh         $zero, 0x0($v1)
/* B69D8 800C61D8 020060A4 */  sh         $zero, 0x2($v1)
/* B69DC 800C61DC 040066A4 */  sh         $a2, 0x4($v1)
/* B69E0 800C61E0 060065A4 */  sh         $a1, 0x6($v1)
/* B69E4 800C61E4 080060A4 */  sh         $zero, 0x8($v1)
/* B69E8 800C61E8 0A0060A4 */  sh         $zero, 0xA($v1)
/* B69EC 800C61EC 01008424 */  addiu      $a0, $a0, 0x1
/* B69F0 800C61F0 18008228 */  slti       $v0, $a0, 0x18
/* B69F4 800C61F4 F7FF4014 */  bnez       $v0, .L800C61D4
/* B69F8 800C61F8 10006324 */   addiu     $v1, $v1, 0x10
/* B69FC 800C61FC FFFF1134 */  ori        $s1, $zero, 0xFFFF
/* B6A00 800C6200 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6A04 800C6204 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6A08 800C6208 FF001024 */  addiu      $s0, $zero, 0xFF
/* B6A0C 800C620C 880151A4 */  sh         $s1, 0x188($v0)
/* B6A10 800C6210 861A030C */  jal        _spu_Fw1ts
/* B6A14 800C6214 8A0150A4 */   sh        $s0, 0x18A($v0)
/* B6A18 800C6218 861A030C */  jal        _spu_Fw1ts
/* B6A1C 800C621C 00000000 */   nop
/* B6A20 800C6220 861A030C */  jal        _spu_Fw1ts
/* B6A24 800C6224 00000000 */   nop
/* B6A28 800C6228 861A030C */  jal        _spu_Fw1ts
/* B6A2C 800C622C 00000000 */   nop
/* B6A30 800C6230 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6A34 800C6234 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6A38 800C6238 00000000 */  nop
/* B6A3C 800C623C 8C0151A4 */  sh         $s1, 0x18C($v0)
/* B6A40 800C6240 861A030C */  jal        _spu_Fw1ts
/* B6A44 800C6244 8E0150A4 */   sh        $s0, 0x18E($v0)
/* B6A48 800C6248 861A030C */  jal        _spu_Fw1ts
/* B6A4C 800C624C 00000000 */   nop
/* B6A50 800C6250 861A030C */  jal        _spu_Fw1ts
/* B6A54 800C6254 00000000 */   nop
/* B6A58 800C6258 861A030C */  jal        _spu_Fw1ts
/* B6A5C 800C625C 00000000 */   nop
/* B6A60 800C6260 21100000 */  addu       $v0, $zero, $zero
.L800C6264:
/* B6A64 800C6264 0D80043C */  lui        $a0, %hi(_spu_RXX)
/* B6A68 800C6268 5CED848C */  lw         $a0, %lo(_spu_RXX)($a0)
/* B6A6C 800C626C 01000324 */  addiu      $v1, $zero, 0x1
/* B6A70 800C6270 0D80013C */  lui        $at, %hi(_spu_inTransfer)
/* B6A74 800C6274 90ED23AC */  sw         $v1, %lo(_spu_inTransfer)($at)
/* B6A78 800C6278 00C00334 */  ori        $v1, $zero, 0xC000
/* B6A7C 800C627C AA0183A4 */  sh         $v1, 0x1AA($a0)
/* B6A80 800C6280 0D80013C */  lui        $at, %hi(_spu_transferCallback)
/* B6A84 800C6284 94ED20AC */  sw         $zero, %lo(_spu_transferCallback)($at)
/* B6A88 800C6288 0D80013C */  lui        $at, %hi(_spu_IRQCallback)
/* B6A8C 800C628C 98ED20AC */  sw         $zero, %lo(_spu_IRQCallback)($at)
/* B6A90 800C6290 1800BF8F */  lw         $ra, 0x18($sp)
/* B6A94 800C6294 1400B18F */  lw         $s1, 0x14($sp)
/* B6A98 800C6298 1000B08F */  lw         $s0, 0x10($sp)
/* B6A9C 800C629C 0800E003 */  jr         $ra
/* B6AA0 800C62A0 2000BD27 */   addiu     $sp, $sp, 0x20
.size _spu_init, . - _spu_init
