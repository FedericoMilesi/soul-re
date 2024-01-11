.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C7990
/* B8190 800C7990 801F023C */  lui        $v0, (0x1F801120 >> 16)
/* B8194 800C7994 20114234 */  ori        $v0, $v0, (0x1F801120 & 0xFFFF)
/* B8198 800C7998 00004394 */  lhu        $v1, 0x0($v0)
/* B819C 800C799C 0E80023C */  lui        $v0, %hi(D_800DFE40)
/* B81A0 800C79A0 40FE428C */  lw         $v0, %lo(D_800DFE40)($v0)
/* B81A4 800C79A4 FFFF6430 */  andi       $a0, $v1, 0xFFFF
/* B81A8 800C79A8 2B108200 */  sltu       $v0, $a0, $v0
/* B81AC 800C79AC 0A004010 */  beqz       $v0, .L800C79D8
/* B81B0 800C79B0 801F033C */   lui       $v1, (0x1F801128 >> 16)
/* B81B4 800C79B4 28116334 */  ori        $v1, $v1, (0x1F801128 & 0xFFFF)
/* B81B8 800C79B8 00006294 */  lhu        $v0, 0x0($v1)
/* B81BC 800C79BC 00000000 */  nop
/* B81C0 800C79C0 04004010 */  beqz       $v0, .L800C79D4
/* B81C4 800C79C4 0100023C */   lui       $v0, (0x10000 >> 16)
/* B81C8 800C79C8 00006294 */  lhu        $v0, 0x0($v1)
/* B81CC 800C79CC 761E0308 */  j          .L800C79D8
/* B81D0 800C79D0 21208200 */   addu      $a0, $a0, $v0
.L800C79D4:
/* B81D4 800C79D4 21208200 */  addu       $a0, $a0, $v0
.L800C79D8:
/* B81D8 800C79D8 801F023C */  lui        $v0, (0x1F801124 >> 16)
/* B81DC 800C79DC 24114234 */  ori        $v0, $v0, (0x1F801124 & 0xFFFF)
/* B81E0 800C79E0 00004294 */  lhu        $v0, 0x0($v0)
/* B81E4 800C79E4 00000000 */  nop
/* B81E8 800C79E8 00024230 */  andi       $v0, $v0, 0x200
/* B81EC 800C79EC 08004014 */  bnez       $v0, .L800C7A10
/* B81F0 800C79F0 00000000 */   nop
/* B81F4 800C79F4 0E80023C */  lui        $v0, %hi(D_800DFE40)
/* B81F8 800C79F8 40FE428C */  lw         $v0, %lo(D_800DFE40)($v0)
/* B81FC 800C79FC 0E80033C */  lui        $v1, %hi(_waitTime)
/* B8200 800C7A00 3CFE638C */  lw         $v1, %lo(_waitTime)($v1)
/* B8204 800C7A04 23108200 */  subu       $v0, $a0, $v0
/* B8208 800C7A08 891E0308 */  j          .L800C7A24
/* B820C 800C7A0C C2100200 */   srl       $v0, $v0, 3
.L800C7A10:
/* B8210 800C7A10 0E80023C */  lui        $v0, %hi(D_800DFE40)
/* B8214 800C7A14 40FE428C */  lw         $v0, %lo(D_800DFE40)($v0)
/* B8218 800C7A18 0E80033C */  lui        $v1, %hi(_waitTime)
/* B821C 800C7A1C 3CFE638C */  lw         $v1, %lo(_waitTime)($v1)
/* B8220 800C7A20 23108200 */  subu       $v0, $a0, $v0
.L800C7A24:
/* B8224 800C7A24 2B104300 */  sltu       $v0, $v0, $v1
/* B8228 800C7A28 0800E003 */  jr         $ra
/* B822C 800C7A2C 01004238 */   xori      $v0, $v0, 0x1
.size func_800C7990, . - func_800C7990
