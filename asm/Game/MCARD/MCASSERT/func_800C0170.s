.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C0170
/* B0970 800C0170 98FFBD27 */  addiu      $sp, $sp, -0x68
/* B0974 800C0174 5800B0AF */  sw         $s0, 0x58($sp)
/* B0978 800C0178 21808000 */  addu       $s0, $a0, $zero
/* B097C 800C017C 6000B2AF */  sw         $s2, 0x60($sp)
/* B0980 800C0180 21900000 */  addu       $s2, $zero, $zero
/* B0984 800C0184 00010232 */  andi       $v0, $s0, 0x100
/* B0988 800C0188 6400BFAF */  sw         $ra, 0x64($sp)
/* B098C 800C018C 04004010 */  beqz       $v0, .L800C01A0
/* B0990 800C0190 5C00B1AF */   sw        $s1, 0x5C($sp)
/* B0994 800C0194 FFFE0224 */  addiu      $v0, $zero, -0x101
/* B0998 800C0198 24800202 */  and        $s0, $s0, $v0
/* B099C 800C019C 01001224 */  addiu      $s2, $zero, 0x1
.L800C01A0:
/* B09A0 800C01A0 0A00022E */  sltiu      $v0, $s0, 0xA
/* B09A4 800C01A4 09004010 */  beqz       $v0, .L800C01CC
/* B09A8 800C01A8 80101000 */   sll       $v0, $s0, 2
/* B09AC 800C01AC 0D80033C */  lui        $v1, %hi(_spu_rev_startaddr)
/* B09B0 800C01B0 BCED6324 */  addiu      $v1, $v1, %lo(_spu_rev_startaddr)
/* B09B4 800C01B4 21884300 */  addu       $s1, $v0, $v1
/* B09B8 800C01B8 0000248E */  lw         $a0, 0x0($s1)
/* B09BC 800C01BC DC1A030C */  jal        func_800C6B70
/* B09C0 800C01C0 00000000 */   nop
/* B09C4 800C01C4 03004010 */  beqz       $v0, .L800C01D4
/* B09C8 800C01C8 1000A527 */   addiu     $a1, $sp, 0x10
.L800C01CC:
/* B09CC 800C01CC C9000308 */  j          .L800C0324
/* B09D0 800C01D0 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800C01D4:
/* B09D4 800C01D4 00111000 */  sll        $v0, $s0, 4
/* B09D8 800C01D8 21105000 */  addu       $v0, $v0, $s0
/* B09DC 800C01DC 80100200 */  sll        $v0, $v0, 2
/* B09E0 800C01E0 0D80033C */  lui        $v1, %hi(_spu_rev_param)
/* B09E4 800C01E4 ECF16324 */  addiu      $v1, $v1, %lo(_spu_rev_param)
/* B09E8 800C01E8 21204300 */  addu       $a0, $v0, $v1
/* B09EC 800C01EC 43000324 */  addiu      $v1, $zero, 0x43
/* B09F0 800C01F0 0D80013C */  lui        $at, %hi(_spu_rev_attr_dup1)
/* B09F4 800C01F4 00ED30AC */  sw         $s0, %lo(_spu_rev_attr_dup1)($at)
/* B09F8 800C01F8 0000228E */  lw         $v0, 0x0($s1)
/* B09FC 800C01FC FFFF0624 */  addiu      $a2, $zero, -0x1
/* B0A00 800C0200 0D80013C */  lui        $at, %hi(_spu_rev_offsetaddr)
/* B0A04 800C0204 F8EC22AC */  sw         $v0, %lo(_spu_rev_offsetaddr)($at)
.L800C0208:
/* B0A08 800C0208 00008290 */  lbu        $v0, 0x0($a0)
/* B0A0C 800C020C 01008424 */  addiu      $a0, $a0, 0x1
/* B0A10 800C0210 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B0A14 800C0214 0000A2A0 */  sb         $v0, 0x0($a1)
/* B0A18 800C0218 FBFF6614 */  bne        $v1, $a2, .L800C0208
/* B0A1C 800C021C 0100A524 */   addiu     $a1, $a1, 0x1
/* B0A20 800C0220 07000224 */  addiu      $v0, $zero, 0x7
/* B0A24 800C0224 06000212 */  beq        $s0, $v0, .L800C0240
/* B0A28 800C0228 1000A0AF */   sw        $zero, 0x10($sp)
/* B0A2C 800C022C 08000224 */  addiu      $v0, $zero, 0x8
/* B0A30 800C0230 09000212 */  beq        $s0, $v0, .L800C0258
/* B0A34 800C0234 7F000224 */   addiu     $v0, $zero, 0x7F
/* B0A38 800C0238 9B000308 */  j          .L800C026C
/* B0A3C 800C023C 00000000 */   nop
.L800C0240:
/* B0A40 800C0240 0D80033C */  lui        $v1, %hi(_spu_rev_attr_dup2 + 0x8)
/* B0A44 800C0244 0CED6324 */  addiu      $v1, $v1, %lo(_spu_rev_attr_dup2 + 0x8)
/* B0A48 800C0248 7F000224 */  addiu      $v0, $zero, 0x7F
/* B0A4C 800C024C 000062AC */  sw         $v0, 0x0($v1)
/* B0A50 800C0250 9F000308 */  j          .L800C027C
/* B0A54 800C0254 FCFF62AC */   sw        $v0, -0x4($v1)
.L800C0258:
/* B0A58 800C0258 0D80033C */  lui        $v1, %hi(_spu_rev_attr_dup2 + 0x8)
/* B0A5C 800C025C 0CED6324 */  addiu      $v1, $v1, %lo(_spu_rev_attr_dup2 + 0x8)
/* B0A60 800C0260 000060AC */  sw         $zero, 0x0($v1)
/* B0A64 800C0264 9F000308 */  j          .L800C027C
/* B0A68 800C0268 FCFF62AC */   sw        $v0, -0x4($v1)
.L800C026C:
/* B0A6C 800C026C 0D80023C */  lui        $v0, %hi(_spu_rev_attr_dup2 + 0x8)
/* B0A70 800C0270 0CED4224 */  addiu      $v0, $v0, %lo(_spu_rev_attr_dup2 + 0x8)
/* B0A74 800C0274 000040AC */  sw         $zero, 0x0($v0)
/* B0A78 800C0278 FCFF40AC */  sw         $zero, -0x4($v0)
.L800C027C:
/* B0A7C 800C027C 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B0A80 800C0280 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B0A84 800C0284 00000000 */  nop
/* B0A88 800C0288 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B0A8C 800C028C 00000000 */  nop
/* B0A90 800C0290 C2110200 */  srl        $v0, $v0, 7
/* B0A94 800C0294 01004230 */  andi       $v0, $v0, 0x1
/* B0A98 800C0298 05004010 */  beqz       $v0, .L800C02B0
/* B0A9C 800C029C 21884000 */   addu      $s1, $v0, $zero
/* B0AA0 800C02A0 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B0AA4 800C02A4 00000000 */  nop
/* B0AA8 800C02A8 7FFF4230 */  andi       $v0, $v0, 0xFF7F
/* B0AAC 800C02AC AA0162A4 */  sh         $v0, 0x1AA($v1)
.L800C02B0:
/* B0AB0 800C02B0 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B0AB4 800C02B4 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B0AB8 800C02B8 1000A427 */  addiu      $a0, $sp, 0x10
/* B0ABC 800C02BC 840140A4 */  sh         $zero, 0x184($v0)
/* B0AC0 800C02C0 860140A4 */  sh         $zero, 0x186($v0)
/* B0AC4 800C02C4 0D80023C */  lui        $v0, %hi(_spu_rev_attr_dup2)
/* B0AC8 800C02C8 04ED4224 */  addiu      $v0, $v0, %lo(_spu_rev_attr_dup2)
/* B0ACC 800C02CC 000040A4 */  sh         $zero, 0x0($v0)
/* B0AD0 800C02D0 C01B030C */  jal        func_800C6F00
/* B0AD4 800C02D4 020040A4 */   sh        $zero, 0x2($v0)
/* B0AD8 800C02D8 04004012 */  beqz       $s2, .L800C02EC
/* B0ADC 800C02DC D1000424 */   addiu     $a0, $zero, 0xD1
/* B0AE0 800C02E0 5CFF020C */  jal        func_800BFD70
/* B0AE4 800C02E4 21200002 */   addu      $a0, $s0, $zero
/* B0AE8 800C02E8 D1000424 */  addiu      $a0, $zero, 0xD1
.L800C02EC:
/* B0AEC 800C02EC 0D80053C */  lui        $a1, %hi(_spu_rev_offsetaddr)
/* B0AF0 800C02F0 F8ECA58C */  lw         $a1, %lo(_spu_rev_offsetaddr)($a1)
/* B0AF4 800C02F4 221A030C */  jal        func_800C6888
/* B0AF8 800C02F8 21300000 */   addu      $a2, $zero, $zero
/* B0AFC 800C02FC 09002012 */  beqz       $s1, .L800C0324
/* B0B00 800C0300 21100000 */   addu      $v0, $zero, $zero
/* B0B04 800C0304 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B0B08 800C0308 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B0B0C 800C030C 00000000 */  nop
/* B0B10 800C0310 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B0B14 800C0314 00000000 */  nop
/* B0B18 800C0318 80004234 */  ori        $v0, $v0, 0x80
/* B0B1C 800C031C AA0162A4 */  sh         $v0, 0x1AA($v1)
/* B0B20 800C0320 21100000 */  addu       $v0, $zero, $zero
.L800C0324:
/* B0B24 800C0324 6400BF8F */  lw         $ra, 0x64($sp)
/* B0B28 800C0328 6000B28F */  lw         $s2, 0x60($sp)
/* B0B2C 800C032C 5C00B18F */  lw         $s1, 0x5C($sp)
/* B0B30 800C0330 5800B08F */  lw         $s0, 0x58($sp)
/* B0B34 800C0334 0800E003 */  jr         $ra
/* B0B38 800C0338 6800BD27 */   addiu     $sp, $sp, 0x68
/* B0B3C 800C033C 00000000 */  nop
.size func_800C0170, . - func_800C0170
