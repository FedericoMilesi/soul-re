.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_DisplayStatus
/* 49F8 800141F8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 49FC 800141FC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 4A00 80014200 21888000 */  addu       $s1, $a0, $zero
/* 4A04 80014204 2000BFAF */  sw         $ra, 0x20($sp)
/* 4A08 80014208 1800B0AF */  sw         $s0, 0x18($sp)
/* 4A0C 8001420C 2C00228E */  lw         $v0, 0x2C($s1)
/* 4A10 80014210 00000000 */  nop
/* 4A14 80014214 3800448C */  lw         $a0, 0x38($v0)
/* 4A18 80014218 1C66010C */  jal        STREAM_GetLevelWithID
/* 4A1C 8001421C 00000000 */   nop
/* 4A20 80014220 C000228E */  lw         $v0, 0xC0($s1)
/* 4A24 80014224 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 4A28 80014228 24104300 */  and        $v0, $v0, $v1
/* 4A2C 8001422C 04004010 */  beqz       $v0, .L80014240
/* 4A30 80014230 0004023C */   lui       $v0, (0x4000004 >> 16)
/* 4A34 80014234 EFA1010C */  jal        EVENT_PrintVars
/* 4A38 80014238 00000000 */   nop
/* 4A3C 8001423C 0004023C */  lui        $v0, (0x4000004 >> 16)
.L80014240:
/* 4A40 80014240 C000238E */  lw         $v1, 0xC0($s1)
/* 4A44 80014244 04004234 */  ori        $v0, $v0, (0x4000004 & 0xFFFF)
/* 4A48 80014248 24106200 */  and        $v0, $v1, $v0
/* 4A4C 8001424C 73004010 */  beqz       $v0, .L8001441C
/* 4A50 80014250 0004023C */   lui       $v0, (0x4000000 >> 16)
/* 4A54 80014254 24106200 */  and        $v0, $v1, $v0
/* 4A58 80014258 13004010 */  beqz       $v0, .L800142A8
/* 4A5C 8001425C 00000000 */   nop
/* 4A60 80014260 0F00053C */  lui        $a1, (0xF4240 >> 16)
/* 4A64 80014264 5402228E */  lw         $v0, 0x254($s1)
/* 4A68 80014268 4042A534 */  ori        $a1, $a1, (0xF4240 & 0xFFFF)
/* 4A6C 8001426C 1B00A200 */  divu       $zero, $a1, $v0
/* 4A70 80014270 12280000 */  mflo       $a1
/* 4A74 80014274 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x48)
/* 4A78 80014278 A8018424 */  addiu      $a0, $a0, %lo(cem_item_leading + 0x48)
/* 4A7C 8001427C C3B5000C */  jal        FONT_Print
/* 4A80 80014280 0100A524 */   addiu     $a1, $a1, 0x1
/* 4A84 80014284 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x58)
/* 4A88 80014288 5C02258E */  lw         $a1, 0x25C($s1)
/* 4A8C 8001428C C3B5000C */  jal        FONT_Print
/* 4A90 80014290 B8018424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0x58)
/* 4A94 80014294 3400228E */  lw         $v0, 0x34($s1)
/* 4A98 80014298 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x64)
/* 4A9C 8001429C 0000458C */  lw         $a1, 0x0($v0)
/* 4AA0 800142A0 B1500008 */  j          .L800142C4
/* 4AA4 800142A4 C4018424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0x64)
.L800142A8:
/* 4AA8 800142A8 0F00053C */  lui        $a1, (0xF4240 >> 16)
/* 4AAC 800142AC 5402228E */  lw         $v0, 0x254($s1)
/* 4AB0 800142B0 4042A534 */  ori        $a1, $a1, (0xF4240 & 0xFFFF)
/* 4AB4 800142B4 1B00A200 */  divu       $zero, $a1, $v0
/* 4AB8 800142B8 12280000 */  mflo       $a1
/* 4ABC 800142BC 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x6C)
/* 4AC0 800142C0 CC018424 */  addiu      $a0, $a0, %lo(cem_item_leading + 0x6C)
.L800142C4:
/* 4AC4 800142C4 C3B5000C */  jal        FONT_Print
/* 4AC8 800142C8 0100A524 */   addiu     $a1, $a1, 0x1
/* 4ACC 800142CC 98AD828F */  lw         $v0, %gp_rel(theCamera + 0x108)($gp)
/* 4AD0 800142D0 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x7C)
/* 4AD4 800142D4 5C004584 */  lh         $a1, 0x5C($v0)
/* 4AD8 800142D8 5E004684 */  lh         $a2, 0x5E($v0)
/* 4ADC 800142DC 60004784 */  lh         $a3, 0x60($v0)
/* 4AE0 800142E0 C3B5000C */  jal        FONT_Print
/* 4AE4 800142E4 DC018424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0x7C)
/* 4AE8 800142E8 C000228E */  lw         $v0, 0xC0($s1)
/* 4AEC 800142EC 00000000 */  nop
/* 4AF0 800142F0 04004230 */  andi       $v0, $v0, 0x4
/* 4AF4 800142F4 28004010 */  beqz       $v0, .L80014398
/* 4AF8 800142F8 00000000 */   nop
/* 4AFC 800142FC 5802238E */  lw         $v1, 0x258($s1)
/* 4B00 80014300 00000000 */  nop
/* 4B04 80014304 0F006010 */  beqz       $v1, .L80014344
/* 4B08 80014308 40100300 */   sll       $v0, $v1, 1
/* 4B0C 8001430C 21104300 */  addu       $v0, $v0, $v1
/* 4B10 80014310 C0100200 */  sll        $v0, $v0, 3
/* 4B14 80014314 21104300 */  addu       $v0, $v0, $v1
/* 4B18 80014318 80100200 */  sll        $v0, $v0, 2
/* 4B1C 8001431C A9FB033C */  lui        $v1, (0xFBA92759 >> 16)
/* 4B20 80014320 59276334 */  ori        $v1, $v1, (0xFBA92759 & 0xFFFF)
/* 4B24 80014324 19004300 */  multu      $v0, $v1
/* 4B28 80014328 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x94)
/* 4B2C 8001432C F4018424 */  addiu      $a0, $a0, %lo(cem_item_leading + 0x94)
/* 4B30 80014330 10400000 */  mfhi       $t0
/* 4B34 80014334 C3B5000C */  jal        FONT_Print
/* 4B38 80014338 C22B0800 */   srl       $a1, $t0, 15
/* 4B3C 8001433C D5500008 */  j          .L80014354
/* 4B40 80014340 0D80043C */   lui       $a0, %hi(cem_item_leading + 0xB0)
.L80014344:
/* 4B44 80014344 0D80043C */  lui        $a0, %hi(cem_item_leading + 0xA4)
/* 4B48 80014348 C3B5000C */  jal        FONT_Print
/* 4B4C 8001434C 04028424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0xA4)
/* 4B50 80014350 0D80043C */  lui        $a0, %hi(cem_item_leading + 0xB0)
.L80014354:
/* 4B54 80014354 2802258E */  lw         $a1, 0x228($s1)
/* 4B58 80014358 C3B5000C */  jal        FONT_Print
/* 4B5C 8001435C 10028424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0xB0)
/* 4B60 80014360 0D80043C */  lui        $a0, %hi(cem_item_leading + 0xBC)
/* 4B64 80014364 F4AC858F */  lw         $a1, %gp_rel(theCamera + 0x64)($gp)
/* 4B68 80014368 C3B5000C */  jal        FONT_Print
/* 4B6C 8001436C 1C028424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0xBC)
/* 4B70 80014370 2800228E */  lw         $v0, 0x28($s1)
/* 4B74 80014374 0D80043C */  lui        $a0, %hi(cem_item_leading + 0xCC)
/* 4B78 80014378 46004594 */  lhu        $a1, 0x46($v0)
/* 4B7C 8001437C 44004694 */  lhu        $a2, 0x44($v0)
/* 4B80 80014380 C3B5000C */  jal        FONT_Print
/* 4B84 80014384 2C028424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0xCC)
/* 4B88 80014388 0D80043C */  lui        $a0, %hi(cem_item_leading + 0xEC)
/* 4B8C 8001438C E2BF8587 */  lh         $a1, %gp_rel(gameTrackerX + 0x21A)($gp)
/* 4B90 80014390 C3B5000C */  jal        FONT_Print
/* 4B94 80014394 4C028424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0xEC)
.L80014398:
/* 4B98 80014398 7B41010C */  jal        MEMPACK_ReportFreeMemory
/* 4B9C 8001439C 00000000 */   nop
/* 4BA0 800143A0 7ADA020C */  jal        SAVE_SizeOfFreeSpace
/* 4BA4 800143A4 21804000 */   addu      $s0, $v0, $zero
/* 4BA8 800143A8 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x100)
/* 4BAC 800143AC 60028424 */  addiu      $a0, $a0, %lo(cem_item_leading + 0x100)
/* 4BB0 800143B0 21280002 */  addu       $a1, $s0, $zero
/* 4BB4 800143B4 C3B5000C */  jal        FONT_Print
/* 4BB8 800143B8 21304000 */   addu      $a2, $v0, $zero
/* 4BBC 800143BC 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x11C)
/* 4BC0 800143C0 7C028424 */  addiu      $a0, $a0, %lo(cem_item_leading + 0x11C)
/* 4BC4 800143C4 C3B5000C */  jal        FONT_Print
/* 4BC8 800143C8 5C012526 */   addiu     $a1, $s1, 0x15C
/* 4BCC 800143CC 40AD8487 */  lh         $a0, %gp_rel(theCamera + 0xB0)($gp)
/* 4BD0 800143D0 00000000 */  nop
/* 4BD4 800143D4 01088228 */  slti       $v0, $a0, 0x801
/* 4BD8 800143D8 03004014 */  bnez       $v0, .L800143E8
/* 4BDC 800143DC 00100224 */   addiu     $v0, $zero, 0x1000
/* 4BE0 800143E0 FB500008 */  j          .L800143EC
/* 4BE4 800143E4 23204400 */   subu      $a0, $v0, $a0
.L800143E8:
/* 4BE8 800143E8 23200400 */  negu       $a0, $a0
.L800143EC:
/* 4BEC 800143EC 40180400 */  sll        $v1, $a0, 1
/* 4BF0 800143F0 21186400 */  addu       $v1, $v1, $a0
/* 4BF4 800143F4 00110300 */  sll        $v0, $v1, 4
/* 4BF8 800143F8 23104300 */  subu       $v0, $v0, $v1
/* 4BFC 800143FC C0100200 */  sll        $v0, $v0, 3
/* 4C00 80014400 02004104 */  bgez       $v0, .L8001440C
/* 4C04 80014404 0D80043C */   lui       $a0, %hi(cem_item_leading + 0x12C)
/* 4C08 80014408 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8001440C:
/* 4C0C 8001440C 8C028424 */  addiu      $a0, $a0, %lo(cem_item_leading + 0x12C)
/* 4C10 80014410 38AE8687 */  lh         $a2, %gp_rel(theCamera + 0x1A8)($gp)
/* 4C14 80014414 C3B5000C */  jal        FONT_Print
/* 4C18 80014418 032B0200 */   sra       $a1, $v0, 12
.L8001441C:
/* 4C1C 8001441C C000228E */  lw         $v0, 0xC0($s1)
/* 4C20 80014420 00000000 */  nop
/* 4C24 80014424 09004104 */  bgez       $v0, .L8001444C
/* 4C28 80014428 00000000 */   nop
/* 4C2C 8001442C 6D80010C */  jal        STREAM_IsCdBusy
/* 4C30 80014430 1000A427 */   addiu     $a0, $sp, 0x10
/* 4C34 80014434 05004010 */  beqz       $v0, .L8001444C
/* 4C38 80014438 00000000 */   nop
/* 4C3C 8001443C 1000A58F */  lw         $a1, 0x10($sp)
/* 4C40 80014440 0D80043C */  lui        $a0, %hi(cem_item_leading + 0x144)
/* 4C44 80014444 C3B5000C */  jal        FONT_Print
/* 4C48 80014448 A4028424 */   addiu     $a0, $a0, %lo(cem_item_leading + 0x144)
.L8001444C:
/* 4C4C 8001444C 2000BF8F */  lw         $ra, 0x20($sp)
/* 4C50 80014450 1C00B18F */  lw         $s1, 0x1C($sp)
/* 4C54 80014454 1800B08F */  lw         $s0, 0x18($sp)
/* 4C58 80014458 0800E003 */  jr         $ra
/* 4C5C 8001445C 2800BD27 */   addiu     $sp, $sp, 0x28
.size DEBUG_DisplayStatus, . - DEBUG_DisplayStatus
