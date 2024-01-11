.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_MakeWaterTrail
/* 37B6C 8004736C A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 37B70 80047370 5400BFAF */  sw         $ra, 0x54($sp)
/* 37B74 80047374 5000B2AF */  sw         $s2, 0x50($sp)
/* 37B78 80047378 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 37B7C 8004737C 4800B0AF */  sw         $s0, 0x48($sp)
/* 37B80 80047380 4000858C */  lw         $a1, 0x40($a0)
/* 37B84 80047384 00000000 */  nop
/* 37B88 80047388 7F00A010 */  beqz       $a1, .L80047588
/* 37B8C 8004738C 00000000 */   nop
/* 37B90 80047390 4400828C */  lw         $v0, 0x44($a0)
/* 37B94 80047394 00000000 */  nop
/* 37B98 80047398 7B004010 */  beqz       $v0, .L80047588
/* 37B9C 8004739C 01000224 */   addiu     $v0, $zero, 0x1
/* 37BA0 800473A0 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 37BA4 800473A4 00000000 */  nop
/* 37BA8 800473A8 77006210 */  beq        $v1, $v0, .L80047588
/* 37BAC 800473AC E8030224 */   addiu     $v0, $zero, 0x3E8
/* 37BB0 800473B0 D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 37BB4 800473B4 00000000 */  nop
/* 37BB8 800473B8 73006214 */  bne        $v1, $v0, .L80047588
/* 37BBC 800473BC 00000000 */   nop
/* 37BC0 800473C0 3400A294 */  lhu        $v0, 0x34($a1)
/* 37BC4 800473C4 00000000 */  nop
/* 37BC8 800473C8 2800A2A7 */  sh         $v0, 0x28($sp)
/* 37BCC 800473CC 4000828C */  lw         $v0, 0x40($a0)
/* 37BD0 800473D0 00000000 */  nop
/* 37BD4 800473D4 38004294 */  lhu        $v0, 0x38($v0)
/* 37BD8 800473D8 00000000 */  nop
/* 37BDC 800473DC 2A00A2A7 */  sh         $v0, 0x2A($sp)
/* 37BE0 800473E0 44018294 */  lhu        $v0, 0x144($a0)
/* 37BE4 800473E4 0D80053C */  lui        $a1, %hi(objectAccess + 0x1C)
/* 37BE8 800473E8 2C00A2A7 */  sh         $v0, 0x2C($sp)
/* 37BEC 800473EC 4000828C */  lw         $v0, 0x40($a0)
/* 37BF0 800473F0 4400838C */  lw         $v1, 0x44($a0)
/* 37BF4 800473F4 3C00448C */  lw         $a0, 0x3C($v0)
/* 37BF8 800473F8 3C00628C */  lw         $v0, 0x3C($v1)
/* 37BFC 800473FC 58A2A58C */  lw         $a1, %lo(objectAccess + 0x1C)($a1)
/* 37C00 80047400 00000000 */  nop
/* 37C04 80047404 1600A010 */  beqz       $a1, .L80047460
/* 37C08 80047408 23808200 */   subu      $s0, $a0, $v0
/* 37C0C 8004740C 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 37C10 80047410 2C00A28C */  lw         $v0, 0x2C($a1)
/* 37C14 80047414 0C00A48C */  lw         $a0, 0xC($a1)
/* 37C18 80047418 25104300 */  or         $v0, $v0, $v1
/* 37C1C 8004741C 2C00A2AC */  sw         $v0, 0x2C($a1)
/* 37C20 80047420 0400848C */  lw         $a0, 0x4($a0)
/* 37C24 80047424 44BA828F */  lw         $v0, %gp_rel(gFXT)($gp)
/* 37C28 80047428 2800A627 */  addiu      $a2, $sp, 0x28
/* 37C2C 8004742C 1000A0AF */  sw         $zero, 0x10($sp)
/* 37C30 80047430 1400A2AF */  sw         $v0, 0x14($sp)
/* 37C34 80047434 0480023C */  lui        $v0, %hi(FX_SimpleQuadSetup)
/* 37C38 80047438 6C614224 */  addiu      $v0, $v0, %lo(FX_SimpleQuadSetup)
/* 37C3C 8004743C 1800A2AF */  sw         $v0, 0x18($sp)
/* 37C40 80047440 0480023C */  lui        $v0, %hi(FX_WaterTrailProcess)
/* 37C44 80047444 54724224 */  addiu      $v0, $v0, %lo(FX_WaterTrailProcess)
/* 37C48 80047448 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 37C4C 8004744C 08000224 */  addiu      $v0, $zero, 0x8
/* 37C50 80047450 2000A2AF */  sw         $v0, 0x20($sp)
/* 37C54 80047454 1400858C */  lw         $a1, 0x14($a0)
/* 37C58 80047458 880B010C */  jal        FX_BuildSingleFaceWithModel
/* 37C5C 8004745C 21380000 */   addu      $a3, $zero, $zero
.L80047460:
/* 37C60 80047460 02000106 */  bgez       $s0, .L8004746C
/* 37C64 80047464 21100002 */   addu      $v0, $s0, $zero
/* 37C68 80047468 23100200 */  negu       $v0, $v0
.L8004746C:
/* 37C6C 8004746C 15004228 */  slti       $v0, $v0, 0x15
/* 37C70 80047470 45004014 */  bnez       $v0, .L80047588
/* 37C74 80047474 21900000 */   addu      $s2, $zero, $zero
/* 37C78 80047478 2C00A397 */  lhu        $v1, 0x2C($sp)
/* 37C7C 8004747C FEFF0224 */  addiu      $v0, $zero, -0x2
/* 37C80 80047480 3A00A0A7 */  sh         $zero, 0x3A($sp)
/* 37C84 80047484 3800A0A7 */  sh         $zero, 0x38($sp)
/* 37C88 80047488 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 37C8C 8004748C 4400A3A7 */  sh         $v1, 0x44($sp)
.L80047490:
/* 37C90 80047490 3AF2020C */  jal        rand
/* 37C94 80047494 00000000 */   nop
/* 37C98 80047498 FF0F5030 */  andi       $s0, $v0, 0xFFF
/* 37C9C 8004749C DCE4010C */  jal        rcos
/* 37CA0 800474A0 21200002 */   addu      $a0, $s0, $zero
/* 37CA4 800474A4 21200002 */  addu       $a0, $s0, $zero
/* 37CA8 800474A8 D0E4010C */  jal        rsin
/* 37CAC 800474AC 21804000 */   addu      $s0, $v0, $zero
/* 37CB0 800474B0 3AF2020C */  jal        rand
/* 37CB4 800474B4 21884000 */   addu      $s1, $v0, $zero
/* 37CB8 800474B8 03004230 */  andi       $v0, $v0, 0x3
/* 37CBC 800474BC 0B004324 */  addiu      $v1, $v0, 0xB
/* 37CC0 800474C0 18000302 */  mult       $s0, $v1
/* 37CC4 800474C4 12100000 */  mflo       $v0
/* 37CC8 800474C8 00000000 */  nop
/* 37CCC 800474CC 02004104 */  bgez       $v0, .L800474D8
/* 37CD0 800474D0 18002302 */   mult      $s1, $v1
/* 37CD4 800474D4 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800474D8:
/* 37CD8 800474D8 03130200 */  sra        $v0, $v0, 12
/* 37CDC 800474DC 12200000 */  mflo       $a0
/* 37CE0 800474E0 02008104 */  bgez       $a0, .L800474EC
/* 37CE4 800474E4 3000A2A7 */   sh        $v0, 0x30($sp)
/* 37CE8 800474E8 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L800474EC:
/* 37CEC 800474EC 21180002 */  addu       $v1, $s0, $zero
/* 37CF0 800474F0 03130400 */  sra        $v0, $a0, 12
/* 37CF4 800474F4 3200A2A7 */  sh         $v0, 0x32($sp)
/* 37CF8 800474F8 12000224 */  addiu      $v0, $zero, 0x12
/* 37CFC 800474FC 02006104 */  bgez       $v1, .L80047508
/* 37D00 80047500 3400A2A7 */   sh        $v0, 0x34($sp)
/* 37D04 80047504 7F006324 */  addiu      $v1, $v1, 0x7F
.L80047508:
/* 37D08 80047508 21482002 */  addu       $t1, $s1, $zero
/* 37D0C 8004750C 2800A297 */  lhu        $v0, 0x28($sp)
/* 37D10 80047510 C3190300 */  sra        $v1, $v1, 7
/* 37D14 80047514 21104300 */  addu       $v0, $v0, $v1
/* 37D18 80047518 02002105 */  bgez       $t1, .L80047524
/* 37D1C 8004751C 4000A2A7 */   sh        $v0, 0x40($sp)
/* 37D20 80047520 7F002925 */  addiu      $t1, $t1, 0x7F
.L80047524:
/* 37D24 80047524 4000083C */  lui        $t0, (0x404040 >> 16)
/* 37D28 80047528 40400835 */  ori        $t0, $t0, (0x404040 & 0xFFFF)
/* 37D2C 8004752C 4000A427 */  addiu      $a0, $sp, 0x40
/* 37D30 80047530 3000A527 */  addiu      $a1, $sp, 0x30
/* 37D34 80047534 3800A627 */  addiu      $a2, $sp, 0x38
/* 37D38 80047538 21380000 */  addu       $a3, $zero, $zero
/* 37D3C 8004753C 01005226 */  addiu      $s2, $s2, 0x1
/* 37D40 80047540 2A00A297 */  lhu        $v0, 0x2A($sp)
/* 37D44 80047544 C3190900 */  sra        $v1, $t1, 7
/* 37D48 80047548 21104300 */  addu       $v0, $v0, $v1
/* 37D4C 8004754C 4200A2A7 */  sh         $v0, 0x42($sp)
/* 37D50 80047550 18000224 */  addiu      $v0, $zero, 0x18
/* 37D54 80047554 1400A2AF */  sw         $v0, 0x14($sp)
/* 37D58 80047558 14000224 */  addiu      $v0, $zero, 0x14
/* 37D5C 8004755C 1000A8AF */  sw         $t0, 0x10($sp)
/* 37D60 80047560 1800A2AF */  sw         $v0, 0x18($sp)
/* 37D64 80047564 9622010C */  jal        FX_Dot
/* 37D68 80047568 1C00A0AF */   sw        $zero, 0x1C($sp)
/* 37D6C 8004756C 0800422A */  slti       $v0, $s2, 0x8
/* 37D70 80047570 C7FF4014 */  bnez       $v0, .L80047490
/* 37D74 80047574 0400053C */   lui       $a1, (0x40024 >> 16)
/* 37D78 80047578 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 37D7C 8004757C 2400A534 */  ori        $a1, $a1, (0x40024 & 0xFFFF)
/* 37D80 80047580 A1D1000C */  jal        INSTANCE_Post
/* 37D84 80047584 21300000 */   addu      $a2, $zero, $zero
.L80047588:
/* 37D88 80047588 5400BF8F */  lw         $ra, 0x54($sp)
/* 37D8C 8004758C 5000B28F */  lw         $s2, 0x50($sp)
/* 37D90 80047590 4C00B18F */  lw         $s1, 0x4C($sp)
/* 37D94 80047594 4800B08F */  lw         $s0, 0x48($sp)
/* 37D98 80047598 0800E003 */  jr         $ra
/* 37D9C 8004759C 5800BD27 */   addiu     $sp, $sp, 0x58
.size FX_MakeWaterTrail, . - FX_MakeWaterTrail
