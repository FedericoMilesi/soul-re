.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C39DC
/* B41DC 800C39DC 21288000 */  addu       $a1, $a0, $zero
/* B41E0 800C39E0 4600A390 */  lbu        $v1, 0x46($a1)
/* B41E4 800C39E4 03000224 */  addiu      $v0, $zero, 0x3
/* B41E8 800C39E8 37006210 */  beq        $v1, $v0, .L800C3AC8
/* B41EC 800C39EC 04006228 */   slti      $v0, $v1, 0x4
/* B41F0 800C39F0 05004010 */  beqz       $v0, .L800C3A08
/* B41F4 800C39F4 02000224 */   addiu     $v0, $zero, 0x2
/* B41F8 800C39F8 08006210 */  beq        $v1, $v0, .L800C3A1C
/* B41FC 800C39FC 01000224 */   addiu     $v0, $zero, 0x1
/* B4200 800C3A00 730F0308 */  j          .L800C3DCC
/* B4204 800C3A04 00000000 */   nop
.L800C3A08:
/* B4208 800C3A08 04000224 */  addiu      $v0, $zero, 0x4
/* B420C 800C3A0C 84006210 */  beq        $v1, $v0, .L800C3C20
/* B4210 800C3A10 01000224 */   addiu     $v0, $zero, 0x1
/* B4214 800C3A14 730F0308 */  j          .L800C3DCC
/* B4218 800C3A18 00000000 */   nop
.L800C3A1C:
/* B421C 800C3A1C 3C00A38C */  lw         $v1, 0x3C($a1)
/* B4220 800C3A20 00000000 */  nop
/* B4224 800C3A24 02006290 */  lbu        $v0, 0x2($v1)
/* B4228 800C3A28 00000000 */  nop
/* B422C 800C3A2C E7004014 */  bnez       $v0, .L800C3DCC
/* B4230 800C3A30 21100000 */   addu      $v0, $zero, $zero
/* B4234 800C3A34 03006290 */  lbu        $v0, 0x3($v1)
/* B4238 800C3A38 00000000 */  nop
/* B423C 800C3A3C E3004014 */  bnez       $v0, .L800C3DCC
/* B4240 800C3A40 21100000 */   addu      $v0, $zero, $zero
/* B4244 800C3A44 4700A490 */  lbu        $a0, 0x47($a1)
/* B4248 800C3A48 0000A28C */  lw         $v0, 0x0($a1)
/* B424C 800C3A4C 40200400 */  sll        $a0, $a0, 1
/* B4250 800C3A50 21208200 */  addu       $a0, $a0, $v0
/* B4254 800C3A54 04006290 */  lbu        $v0, 0x4($v1)
/* B4258 800C3A58 05006390 */  lbu        $v1, 0x5($v1)
/* B425C 800C3A5C 00120200 */  sll        $v0, $v0, 8
/* B4260 800C3A60 21186200 */  addu       $v1, $v1, $v0
/* B4264 800C3A64 000083A4 */  sh         $v1, 0x0($a0)
/* B4268 800C3A68 4700A290 */  lbu        $v0, 0x47($a1)
/* B426C 800C3A6C 0000A38C */  lw         $v1, 0x0($a1)
/* B4270 800C3A70 40100200 */  sll        $v0, $v0, 1
/* B4274 800C3A74 21104300 */  addu       $v0, $v0, $v1
/* B4278 800C3A78 00004394 */  lhu        $v1, 0x0($v0)
/* B427C 800C3A7C EE00A294 */  lhu        $v0, 0xEE($a1)
/* B4280 800C3A80 00000000 */  nop
/* B4284 800C3A84 04004310 */  beq        $v0, $v1, .L800C3A98
/* B4288 800C3A88 00000000 */   nop
/* B428C 800C3A8C EE00A3A4 */  sh         $v1, 0xEE($a1)
.L800C3A90:
/* B4290 800C3A90 730F0308 */  j          .L800C3DCC
/* B4294 800C3A94 21100000 */   addu      $v0, $zero, $zero
.L800C3A98:
/* B4298 800C3A98 4700A290 */  lbu        $v0, 0x47($a1)
/* B429C 800C3A9C E300A390 */  lbu        $v1, 0xE3($a1)
/* B42A0 800C3AA0 EE00A0A4 */  sh         $zero, 0xEE($a1)
/* B42A4 800C3AA4 EB00A0A0 */  sb         $zero, 0xEB($a1)
/* B42A8 800C3AA8 01004224 */  addiu      $v0, $v0, 0x1
/* B42AC 800C3AAC 4700A2A0 */  sb         $v0, 0x47($a1)
/* B42B0 800C3AB0 FF004230 */  andi       $v0, $v0, 0xFF
/* B42B4 800C3AB4 2B104300 */  sltu       $v0, $v0, $v1
/* B42B8 800C3AB8 C4004014 */  bnez       $v0, .L800C3DCC
/* B42BC 800C3ABC 21100000 */   addu      $v0, $zero, $zero
/* B42C0 800C3AC0 720F0308 */  j          .L800C3DC8
/* B42C4 800C3AC4 4700A0A0 */   sb        $zero, 0x47($a1)
.L800C3AC8:
/* B42C8 800C3AC8 3C00A68C */  lw         $a2, 0x3C($a1)
/* B42CC 800C3ACC 00000000 */  nop
/* B42D0 800C3AD0 0200C290 */  lbu        $v0, 0x2($a2)
/* B42D4 800C3AD4 00000000 */  nop
/* B42D8 800C3AD8 BC004014 */  bnez       $v0, .L800C3DCC
/* B42DC 800C3ADC 21100000 */   addu      $v0, $zero, $zero
/* B42E0 800C3AE0 0300C290 */  lbu        $v0, 0x3($a2)
/* B42E4 800C3AE4 00000000 */  nop
/* B42E8 800C3AE8 B8004014 */  bnez       $v0, .L800C3DCC
/* B42EC 800C3AEC 21100000 */   addu      $v0, $zero, $zero
/* B42F0 800C3AF0 4700A390 */  lbu        $v1, 0x47($a1)
/* B42F4 800C3AF4 0400A48C */  lw         $a0, 0x4($a1)
/* B42F8 800C3AF8 80100300 */  sll        $v0, $v1, 2
/* B42FC 800C3AFC 21104300 */  addu       $v0, $v0, $v1
/* B4300 800C3B00 21208200 */  addu       $a0, $a0, $v0
/* B4304 800C3B04 00008390 */  lbu        $v1, 0x0($a0)
/* B4308 800C3B08 0400C290 */  lbu        $v0, 0x4($a2)
/* B430C 800C3B0C 00000000 */  nop
/* B4310 800C3B10 17006214 */  bne        $v1, $v0, .L800C3B70
/* B4314 800C3B14 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B4318 800C3B18 0500C290 */  lbu        $v0, 0x5($a2)
/* B431C 800C3B1C 01008390 */  lbu        $v1, 0x1($a0)
/* B4320 800C3B20 7F004230 */  andi       $v0, $v0, 0x7F
/* B4324 800C3B24 12006214 */  bne        $v1, $v0, .L800C3B70
/* B4328 800C3B28 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B432C 800C3B2C 02008390 */  lbu        $v1, 0x2($a0)
/* B4330 800C3B30 0600C290 */  lbu        $v0, 0x6($a2)
/* B4334 800C3B34 00000000 */  nop
/* B4338 800C3B38 0D006214 */  bne        $v1, $v0, .L800C3B70
/* B433C 800C3B3C FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B4340 800C3B40 03008390 */  lbu        $v1, 0x3($a0)
/* B4344 800C3B44 0700C290 */  lbu        $v0, 0x7($a2)
/* B4348 800C3B48 00000000 */  nop
/* B434C 800C3B4C 08006214 */  bne        $v1, $v0, .L800C3B70
/* B4350 800C3B50 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B4354 800C3B54 0500C290 */  lbu        $v0, 0x5($a2)
/* B4358 800C3B58 04008390 */  lbu        $v1, 0x4($a0)
/* B435C 800C3B5C C3110200 */  sra        $v0, $v0, 7
/* B4360 800C3B60 03006214 */  bne        $v1, $v0, .L800C3B70
/* B4364 800C3B64 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B4368 800C3B68 DD0E0308 */  j          .L800C3B74
/* B436C 800C3B6C EE00A0A4 */   sh        $zero, 0xEE($a1)
.L800C3B70:
/* B4370 800C3B70 EE00A2A4 */  sh         $v0, 0xEE($a1)
.L800C3B74:
/* B4374 800C3B74 3C00A28C */  lw         $v0, 0x3C($a1)
/* B4378 800C3B78 00000000 */  nop
/* B437C 800C3B7C 04004290 */  lbu        $v0, 0x4($v0)
/* B4380 800C3B80 00000000 */  nop
/* B4384 800C3B84 000082A0 */  sb         $v0, 0x0($a0)
/* B4388 800C3B88 3C00A28C */  lw         $v0, 0x3C($a1)
/* B438C 800C3B8C 00000000 */  nop
/* B4390 800C3B90 05004290 */  lbu        $v0, 0x5($v0)
/* B4394 800C3B94 00000000 */  nop
/* B4398 800C3B98 7F004230 */  andi       $v0, $v0, 0x7F
/* B439C 800C3B9C 010082A0 */  sb         $v0, 0x1($a0)
/* B43A0 800C3BA0 3C00A28C */  lw         $v0, 0x3C($a1)
/* B43A4 800C3BA4 00000000 */  nop
/* B43A8 800C3BA8 06004290 */  lbu        $v0, 0x6($v0)
/* B43AC 800C3BAC 00000000 */  nop
/* B43B0 800C3BB0 020082A0 */  sb         $v0, 0x2($a0)
/* B43B4 800C3BB4 3C00A28C */  lw         $v0, 0x3C($a1)
/* B43B8 800C3BB8 00000000 */  nop
/* B43BC 800C3BBC 07004290 */  lbu        $v0, 0x7($v0)
/* B43C0 800C3BC0 00000000 */  nop
/* B43C4 800C3BC4 030082A0 */  sb         $v0, 0x3($a0)
/* B43C8 800C3BC8 3C00A28C */  lw         $v0, 0x3C($a1)
/* B43CC 800C3BCC 00000000 */  nop
/* B43D0 800C3BD0 05004290 */  lbu        $v0, 0x5($v0)
/* B43D4 800C3BD4 00000000 */  nop
/* B43D8 800C3BD8 C3110200 */  sra        $v0, $v0, 7
/* B43DC 800C3BDC 040082A0 */  sb         $v0, 0x4($a0)
/* B43E0 800C3BE0 EE00A294 */  lhu        $v0, 0xEE($a1)
/* B43E4 800C3BE4 00000000 */  nop
/* B43E8 800C3BE8 78004014 */  bnez       $v0, .L800C3DCC
/* B43EC 800C3BEC 21100000 */   addu      $v0, $zero, $zero
/* B43F0 800C3BF0 4700A290 */  lbu        $v0, 0x47($a1)
/* B43F4 800C3BF4 E900A390 */  lbu        $v1, 0xE9($a1)
/* B43F8 800C3BF8 EB00A0A0 */  sb         $zero, 0xEB($a1)
/* B43FC 800C3BFC 01004224 */  addiu      $v0, $v0, 0x1
/* B4400 800C3C00 4700A2A0 */  sb         $v0, 0x47($a1)
/* B4404 800C3C04 FF004230 */  andi       $v0, $v0, 0xFF
/* B4408 800C3C08 2B104300 */  sltu       $v0, $v0, $v1
/* B440C 800C3C0C 6F004014 */  bnez       $v0, .L800C3DCC
/* B4410 800C3C10 21100000 */   addu      $v0, $zero, $zero
/* B4414 800C3C14 4700A0A0 */  sb         $zero, 0x47($a1)
/* B4418 800C3C18 720F0308 */  j          .L800C3DC8
/* B441C 800C3C1C 4800A0A0 */   sb        $zero, 0x48($a1)
.L800C3C20:
/* B4420 800C3C20 3C00A68C */  lw         $a2, 0x3C($a1)
/* B4424 800C3C24 00000000 */  nop
/* B4428 800C3C28 0200C290 */  lbu        $v0, 0x2($a2)
/* B442C 800C3C2C 00000000 */  nop
/* B4430 800C3C30 03004010 */  beqz       $v0, .L800C3C40
/* B4434 800C3C34 00000000 */   nop
/* B4438 800C3C38 A40E0308 */  j          .L800C3A90
/* B443C 800C3C3C 4800A0A0 */   sb        $zero, 0x48($a1)
.L800C3C40:
/* B4440 800C3C40 4700A290 */  lbu        $v0, 0x47($a1)
/* B4444 800C3C44 0800A38C */  lw         $v1, 0x8($a1)
/* B4448 800C3C48 4800A490 */  lbu        $a0, 0x48($a1)
/* B444C 800C3C4C C0100200 */  sll        $v0, $v0, 3
/* B4450 800C3C50 18008014 */  bnez       $a0, .L800C3CB4
/* B4454 800C3C54 21406200 */   addu      $t0, $v1, $v0
/* B4458 800C3C58 0400C290 */  lbu        $v0, 0x4($a2)
/* B445C 800C3C5C 03000724 */  addiu      $a3, $zero, 0x3
/* B4460 800C3C60 4800A2A0 */  sb         $v0, 0x48($a1)
/* B4464 800C3C64 000002A1 */  sb         $v0, 0x0($t0)
/* B4468 800C3C68 3C00A28C */  lw         $v0, 0x3C($a1)
/* B446C 800C3C6C 4700A390 */  lbu        $v1, 0x47($a1)
/* B4470 800C3C70 00000000 */  nop
/* B4474 800C3C74 05006014 */  bnez       $v1, .L800C3C8C
/* B4478 800C3C78 05004424 */   addiu     $a0, $v0, 0x5
/* B447C 800C3C7C EA00A290 */  lbu        $v0, 0xEA($a1)
/* B4480 800C3C80 0800A38C */  lw         $v1, 0x8($a1)
/* B4484 800C3C84 270F0308 */  j          .L800C3C9C
/* B4488 800C3C88 C0100200 */   sll       $v0, $v0, 3
.L800C3C8C:
/* B448C 800C3C8C F8FF0291 */  lbu        $v0, -0x8($t0)
/* B4490 800C3C90 FCFF038D */  lw         $v1, -0x4($t0)
/* B4494 800C3C94 03004224 */  addiu      $v0, $v0, 0x3
/* B4498 800C3C98 FC014230 */  andi       $v0, $v0, 0x1FC
.L800C3C9C:
/* B449C 800C3C9C 21186200 */  addu       $v1, $v1, $v0
/* B44A0 800C3CA0 040003AD */  sw         $v1, 0x4($t0)
/* B44A4 800C3CA4 0E80013C */  lui        $at, %hi(StStartFrame + 0x34)
/* B44A8 800C3CA8 78FD23AC */  sw         $v1, %lo(StStartFrame + 0x34)($at)
/* B44AC 800C3CAC 300F0308 */  j          .L800C3CC0
/* B44B0 800C3CB0 FFFFE724 */   addiu     $a3, $a3, -0x1
.L800C3CB4:
/* B44B4 800C3CB4 05000724 */  addiu      $a3, $zero, 0x5
/* B44B8 800C3CB8 0300C424 */  addiu      $a0, $a2, 0x3
/* B44BC 800C3CBC FFFFE724 */  addiu      $a3, $a3, -0x1
.L800C3CC0:
/* B44C0 800C3CC0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* B44C4 800C3CC4 2100E210 */  beq        $a3, $v0, .L800C3D4C
/* B44C8 800C3CC8 00000000 */   nop
/* B44CC 800C3CCC E300A824 */  addiu      $t0, $a1, 0xE3
/* B44D0 800C3CD0 FFFF0A34 */  ori        $t2, $zero, 0xFFFF
/* B44D4 800C3CD4 0E80063C */  lui        $a2, %hi(StStartFrame + 0x34)
/* B44D8 800C3CD8 78FDC624 */  addiu      $a2, $a2, %lo(StStartFrame + 0x34)
/* B44DC 800C3CDC FFFF0924 */  addiu      $t1, $zero, -0x1
.L800C3CE0:
/* B44E0 800C3CE0 4800A290 */  lbu        $v0, 0x48($a1)
/* B44E4 800C3CE4 00000000 */  nop
/* B44E8 800C3CE8 1C004010 */  beqz       $v0, .L800C3D5C
/* B44EC 800C3CEC 00000000 */   nop
/* B44F0 800C3CF0 0E80033C */  lui        $v1, %hi(StStartFrame + 0x34)
/* B44F4 800C3CF4 78FD638C */  lw         $v1, %lo(StStartFrame + 0x34)($v1)
/* B44F8 800C3CF8 00000000 */  nop
/* B44FC 800C3CFC 2B106800 */  sltu       $v0, $v1, $t0
/* B4500 800C3D00 2E004010 */  beqz       $v0, .L800C3DBC
/* B4504 800C3D04 21100000 */   addu      $v0, $zero, $zero
/* B4508 800C3D08 00006390 */  lbu        $v1, 0x0($v1)
/* B450C 800C3D0C 00008290 */  lbu        $v0, 0x0($a0)
/* B4510 800C3D10 00000000 */  nop
/* B4514 800C3D14 02006210 */  beq        $v1, $v0, .L800C3D20
/* B4518 800C3D18 00000000 */   nop
/* B451C 800C3D1C EE00AAA4 */  sh         $t2, 0xEE($a1)
.L800C3D20:
/* B4520 800C3D20 0000C28C */  lw         $v0, 0x0($a2)
/* B4524 800C3D24 00008390 */  lbu        $v1, 0x0($a0)
/* B4528 800C3D28 01008424 */  addiu      $a0, $a0, 0x1
/* B452C 800C3D2C 000043A0 */  sb         $v1, 0x0($v0)
/* B4530 800C3D30 01004224 */  addiu      $v0, $v0, 0x1
/* B4534 800C3D34 0000C2AC */  sw         $v0, 0x0($a2)
/* B4538 800C3D38 4800A290 */  lbu        $v0, 0x48($a1)
/* B453C 800C3D3C FFFFE724 */  addiu      $a3, $a3, -0x1
/* B4540 800C3D40 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B4544 800C3D44 E6FFE914 */  bne        $a3, $t1, .L800C3CE0
/* B4548 800C3D48 4800A2A0 */   sb        $v0, 0x48($a1)
.L800C3D4C:
/* B454C 800C3D4C 4800A290 */  lbu        $v0, 0x48($a1)
/* B4550 800C3D50 00000000 */  nop
/* B4554 800C3D54 1D004014 */  bnez       $v0, .L800C3DCC
/* B4558 800C3D58 21100000 */   addu      $v0, $zero, $zero
.L800C3D5C:
/* B455C 800C3D5C EE00A294 */  lhu        $v0, 0xEE($a1)
/* B4560 800C3D60 00000000 */  nop
/* B4564 800C3D64 04004010 */  beqz       $v0, .L800C3D78
/* B4568 800C3D68 21100000 */   addu      $v0, $zero, $zero
/* B456C 800C3D6C EE00A0A4 */  sh         $zero, 0xEE($a1)
/* B4570 800C3D70 730F0308 */  j          .L800C3DCC
/* B4574 800C3D74 4800A0A0 */   sb        $zero, 0x48($a1)
.L800C3D78:
/* B4578 800C3D78 4700A290 */  lbu        $v0, 0x47($a1)
/* B457C 800C3D7C EA00A390 */  lbu        $v1, 0xEA($a1)
/* B4580 800C3D80 01004224 */  addiu      $v0, $v0, 0x1
/* B4584 800C3D84 4700A2A0 */  sb         $v0, 0x47($a1)
/* B4588 800C3D88 FF004230 */  andi       $v0, $v0, 0xFF
/* B458C 800C3D8C 2B104300 */  sltu       $v0, $v0, $v1
/* B4590 800C3D90 07004014 */  bnez       $v0, .L800C3DB0
/* B4594 800C3D94 21100000 */   addu      $v0, $zero, $zero
/* B4598 800C3D98 06000324 */  addiu      $v1, $zero, 0x6
/* B459C 800C3D9C 4900A3A0 */  sb         $v1, 0x49($a1)
/* B45A0 800C3DA0 FE000324 */  addiu      $v1, $zero, 0xFE
/* B45A4 800C3DA4 4600A3A0 */  sb         $v1, 0x46($a1)
/* B45A8 800C3DA8 730F0308 */  j          .L800C3DCC
/* B45AC 800C3DAC EB00A0A0 */   sb        $zero, 0xEB($a1)
.L800C3DB0:
/* B45B0 800C3DB0 4800A0A0 */  sb         $zero, 0x48($a1)
/* B45B4 800C3DB4 730F0308 */  j          .L800C3DCC
/* B45B8 800C3DB8 EB00A0A0 */   sb        $zero, 0xEB($a1)
.L800C3DBC:
/* B45BC 800C3DBC 4700A0A0 */  sb         $zero, 0x47($a1)
/* B45C0 800C3DC0 730F0308 */  j          .L800C3DCC
/* B45C4 800C3DC4 4800A0A0 */   sb        $zero, 0x48($a1)
.L800C3DC8:
/* B45C8 800C3DC8 01000224 */  addiu      $v0, $zero, 0x1
.L800C3DCC:
/* B45CC 800C3DCC 0800E003 */  jr         $ra
/* B45D0 800C3DD0 00000000 */   nop
.size func_800C39DC, . - func_800C39DC
