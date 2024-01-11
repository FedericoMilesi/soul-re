.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerJump
/* 9C170 800AB970 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 9C174 800AB974 1800B0AF */  sw         $s0, 0x18($sp)
/* 9C178 800AB978 21808000 */  addu       $s0, $a0, $zero
/* 9C17C 800AB97C 2000B2AF */  sw         $s2, 0x20($sp)
/* 9C180 800AB980 2190A000 */  addu       $s2, $a1, $zero
/* 9C184 800AB984 3000B6AF */  sw         $s6, 0x30($sp)
/* 9C188 800AB988 21B0C000 */  addu       $s6, $a2, $zero
/* 9C18C 800AB98C C0101200 */  sll        $v0, $s2, 3
/* 9C190 800AB990 21105200 */  addu       $v0, $v0, $s2
/* 9C194 800AB994 C0100200 */  sll        $v0, $v0, 3
/* 9C198 800AB998 23105200 */  subu       $v0, $v0, $s2
/* 9C19C 800AB99C 2800B4AF */  sw         $s4, 0x28($sp)
/* 9C1A0 800AB9A0 80A00200 */  sll        $s4, $v0, 2
/* 9C1A4 800AB9A4 08008226 */  addiu      $v0, $s4, 0x8
/* 9C1A8 800AB9A8 2400B3AF */  sw         $s3, 0x24($sp)
/* 9C1AC 800AB9AC 21980202 */  addu       $s3, $s0, $v0
/* 9C1B0 800AB9B0 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 9C1B4 800AB9B4 01001524 */  addiu      $s5, $zero, 0x1
/* 9C1B8 800AB9B8 3400BFAF */  sw         $ra, 0x34($sp)
/* 9C1BC 800AB9BC 1C00B1AF */  sw         $s1, 0x1C($sp)
.L800AB9C0:
/* 9C1C0 800AB9C0 39C3010C */  jal        PeekMessageQueue
/* 9C1C4 800AB9C4 04006426 */   addiu     $a0, $s3, 0x4
/* 9C1C8 800AB9C8 ED004010 */  beqz       $v0, .L800ABD80
/* 9C1CC 800AB9CC 0001043C */   lui       $a0, (0x1000001 >> 16)
/* 9C1D0 800AB9D0 0000438C */  lw         $v1, 0x0($v0)
/* 9C1D4 800AB9D4 01008434 */  ori        $a0, $a0, (0x1000001 & 0xFFFF)
/* 9C1D8 800AB9D8 E5006410 */  beq        $v1, $a0, .L800ABD70
/* 9C1DC 800AB9DC 2A108300 */   slt       $v0, $a0, $v1
/* 9C1E0 800AB9E0 1E004014 */  bnez       $v0, .L800ABA5C
/* 9C1E4 800AB9E4 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 9C1E8 800AB9E8 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 9C1EC 800AB9EC 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9C1F0 800AB9F0 DF006210 */  beq        $v1, $v0, .L800ABD70
/* 9C1F4 800AB9F4 2A104300 */   slt       $v0, $v0, $v1
/* 9C1F8 800AB9F8 08004014 */  bnez       $v0, .L800ABA1C
/* 9C1FC 800AB9FC 0400023C */   lui       $v0, (0x40005 >> 16)
/* 9C200 800ABA00 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 9C204 800ABA04 DA006210 */  beq        $v1, $v0, .L800ABD70
/* 9C208 800ABA08 01004234 */   ori       $v0, $v0, (0x80000001 & 0xFFFF)
/* 9C20C 800ABA0C BB006210 */  beq        $v1, $v0, .L800ABCFC
/* 9C210 800ABA10 21200002 */   addu      $a0, $s0, $zero
/* 9C214 800ABA14 5AAF0208 */  j          .L800ABD68
/* 9C218 800ABA18 21284002 */   addu      $a1, $s2, $zero
.L800ABA1C:
/* 9C21C 800ABA1C 05004234 */  ori        $v0, $v0, (0x40005 & 0xFFFF)
/* 9C220 800ABA20 D3006210 */  beq        $v1, $v0, .L800ABD70
/* 9C224 800ABA24 2A104300 */   slt       $v0, $v0, $v1
/* 9C228 800ABA28 07004014 */  bnez       $v0, .L800ABA48
/* 9C22C 800ABA2C 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9C230 800ABA30 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 9C234 800ABA34 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9C238 800ABA38 CD006210 */  beq        $v1, $v0, .L800ABD70
/* 9C23C 800ABA3C 21200002 */   addu      $a0, $s0, $zero
/* 9C240 800ABA40 5AAF0208 */  j          .L800ABD68
/* 9C244 800ABA44 21284002 */   addu      $a1, $s2, $zero
.L800ABA48:
/* 9C248 800ABA48 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9C24C 800ABA4C 26006210 */  beq        $v1, $v0, .L800ABAE8
/* 9C250 800ABA50 21200002 */   addu      $a0, $s0, $zero
/* 9C254 800ABA54 5AAF0208 */  j          .L800ABD68
/* 9C258 800ABA58 21284002 */   addu      $a1, $s2, $zero
.L800ABA5C:
/* 9C25C 800ABA5C C4006210 */  beq        $v1, $v0, .L800ABD70
/* 9C260 800ABA60 2A104300 */   slt       $v0, $v0, $v1
/* 9C264 800ABA64 11004014 */  bnez       $v0, .L800ABAAC
/* 9C268 800ABA68 0008023C */   lui       $v0, (0x8000004 >> 16)
/* 9C26C 800ABA6C 0004023C */  lui        $v0, (0x4000001 >> 16)
/* 9C270 800ABA70 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 9C274 800ABA74 BE006210 */  beq        $v1, $v0, .L800ABD70
/* 9C278 800ABA78 2A104300 */   slt       $v0, $v0, $v1
/* 9C27C 800ABA7C 06004014 */  bnez       $v0, .L800ABA98
/* 9C280 800ABA80 0104023C */   lui       $v0, (0x4010008 >> 16)
/* 9C284 800ABA84 0002023C */  lui        $v0, (0x2000008 >> 16)
/* 9C288 800ABA88 B3006210 */  beq        $v1, $v0, .L800ABD58
/* 9C28C 800ABA8C 21200002 */   addu      $a0, $s0, $zero
/* 9C290 800ABA90 5AAF0208 */  j          .L800ABD68
/* 9C294 800ABA94 21284002 */   addu      $a1, $s2, $zero
.L800ABA98:
/* 9C298 800ABA98 08004234 */  ori        $v0, $v0, (0x2000008 & 0xFFFF)
/* 9C29C 800ABA9C B4006210 */  beq        $v1, $v0, .L800ABD70
/* 9C2A0 800ABAA0 21200002 */   addu      $a0, $s0, $zero
/* 9C2A4 800ABAA4 5AAF0208 */  j          .L800ABD68
/* 9C2A8 800ABAA8 21284002 */   addu      $a1, $s2, $zero
.L800ABAAC:
/* 9C2AC 800ABAAC 04004234 */  ori        $v0, $v0, (0x8000004 & 0xFFFF)
/* 9C2B0 800ABAB0 1A006210 */  beq        $v1, $v0, .L800ABB1C
/* 9C2B4 800ABAB4 2A104300 */   slt       $v0, $v0, $v1
/* 9C2B8 800ABAB8 06004014 */  bnez       $v0, .L800ABAD4
/* 9C2BC 800ABABC 0020023C */   lui       $v0, (0x20000001 >> 16)
/* 9C2C0 800ABAC0 0008023C */  lui        $v0, (0x8000001 >> 16)
/* 9C2C4 800ABAC4 1B006210 */  beq        $v1, $v0, .L800ABB34
/* 9C2C8 800ABAC8 21200002 */   addu      $a0, $s0, $zero
/* 9C2CC 800ABACC 5AAF0208 */  j          .L800ABD68
/* 9C2D0 800ABAD0 21284002 */   addu      $a1, $s2, $zero
.L800ABAD4:
/* 9C2D4 800ABAD4 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 9C2D8 800ABAD8 51006210 */  beq        $v1, $v0, .L800ABC20
/* 9C2DC 800ABADC 21200002 */   addu      $a0, $s0, $zero
/* 9C2E0 800ABAE0 5AAF0208 */  j          .L800ABD68
/* 9C2E4 800ABAE4 21284002 */   addu      $a1, $s2, $zero
.L800ABAE8:
/* 9C2E8 800ABAE8 0A004016 */  bnez       $s2, .L800ABB14
/* 9C2EC 800ABAEC 21101402 */   addu      $v0, $s0, $s4
/* 9C2F0 800ABAF0 11050224 */  addiu      $v0, $zero, 0x511
/* 9C2F4 800ABAF4 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9C2F8 800ABAF8 C8000224 */  addiu      $v0, $zero, 0xC8
/* 9C2FC 800ABAFC 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 9C300 800ABB00 0000038E */  lw         $v1, 0x0($s0)
/* 9C304 800ABB04 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 9C308 800ABB08 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 9C30C 800ABB0C F80162AC */  sw         $v0, 0x1F8($v1)
/* 9C310 800ABB10 21101402 */  addu       $v0, $s0, $s4
.L800ABB14:
/* 9C314 800ABB14 5CAF0208 */  j          .L800ABD70
/* 9C318 800ABB18 200140AC */   sw        $zero, 0x120($v0)
.L800ABB1C:
/* 9C31C 800ABB1C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9C320 800ABB20 00000000 */  nop
/* 9C324 800ABB24 08004234 */  ori        $v0, $v0, 0x8
/* 9C328 800ABB28 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9C32C 800ABB2C 5CAF0208 */  j          .L800ABD70
/* 9C330 800ABB30 00000000 */   nop
.L800ABB34:
/* 9C334 800ABB34 2D004016 */  bnez       $s2, .L800ABBEC
/* 9C338 800ABB38 21284002 */   addu      $a1, $s2, $zero
/* 9C33C 800ABB3C 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9C340 800ABB40 10000224 */  addiu      $v0, $zero, 0x10
/* 9C344 800ABB44 0D006214 */  bne        $v1, $v0, .L800ABB7C
/* 9C348 800ABB48 20000224 */   addiu     $v0, $zero, 0x20
/* 9C34C 800ABB4C 0000048E */  lw         $a0, 0x0($s0)
/* 9C350 800ABB50 18000524 */  addiu      $a1, $zero, 0x18
/* 9C354 800ABB54 21300000 */  addu       $a2, $zero, $zero
/* 9C358 800ABB58 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9C35C 800ABB5C 2138C000 */   addu      $a3, $a2, $zero
/* 9C360 800ABB60 20004010 */  beqz       $v0, .L800ABBE4
/* 9C364 800ABB64 21200002 */   addu      $a0, $s0, $zero
/* 9C368 800ABB68 1000B5AF */  sw         $s5, 0x10($sp)
/* 9C36C 800ABB6C 24000524 */  addiu      $a1, $zero, 0x24
/* 9C370 800ABB70 21300000 */  addu       $a2, $zero, $zero
/* 9C374 800ABB74 F7AE0208 */  j          .L800ABBDC
/* 9C378 800ABB78 04000724 */   addiu     $a3, $zero, 0x4
.L800ABB7C:
/* 9C37C 800ABB7C 0D006214 */  bne        $v1, $v0, .L800ABBB4
/* 9C380 800ABB80 08000524 */   addiu     $a1, $zero, 0x8
/* 9C384 800ABB84 0000048E */  lw         $a0, 0x0($s0)
/* 9C388 800ABB88 28000524 */  addiu      $a1, $zero, 0x28
/* 9C38C 800ABB8C 21300000 */  addu       $a2, $zero, $zero
/* 9C390 800ABB90 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9C394 800ABB94 2138C000 */   addu      $a3, $a2, $zero
/* 9C398 800ABB98 12004010 */  beqz       $v0, .L800ABBE4
/* 9C39C 800ABB9C 21200002 */   addu      $a0, $s0, $zero
/* 9C3A0 800ABBA0 1000B5AF */  sw         $s5, 0x10($sp)
/* 9C3A4 800ABBA4 28000524 */  addiu      $a1, $zero, 0x28
/* 9C3A8 800ABBA8 21300000 */  addu       $a2, $zero, $zero
/* 9C3AC 800ABBAC F7AE0208 */  j          .L800ABBDC
/* 9C3B0 800ABBB0 0A000724 */   addiu     $a3, $zero, 0xA
.L800ABBB4:
/* 9C3B4 800ABBB4 0000048E */  lw         $a0, 0x0($s0)
/* 9C3B8 800ABBB8 21300000 */  addu       $a2, $zero, $zero
/* 9C3BC 800ABBBC 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9C3C0 800ABBC0 2138C000 */   addu      $a3, $a2, $zero
/* 9C3C4 800ABBC4 07004010 */  beqz       $v0, .L800ABBE4
/* 9C3C8 800ABBC8 21200002 */   addu      $a0, $s0, $zero
/* 9C3CC 800ABBCC 1000B5AF */  sw         $s5, 0x10($sp)
/* 9C3D0 800ABBD0 1C000524 */  addiu      $a1, $zero, 0x1C
/* 9C3D4 800ABBD4 21300000 */  addu       $a2, $zero, $zero
/* 9C3D8 800ABBD8 07000724 */  addiu      $a3, $zero, 0x7
.L800ABBDC:
/* 9C3DC 800ABBDC FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9C3E0 800ABBE0 00000000 */   nop
.L800ABBE4:
/* 9C3E4 800ABBE4 21200002 */  addu       $a0, $s0, $zero
/* 9C3E8 800ABBE8 21284002 */  addu       $a1, $s2, $zero
.L800ABBEC:
/* 9C3EC 800ABBEC 0B80063C */  lui        $a2, %hi(StateHandlerFall)
/* 9C3F0 800ABBF0 A8BDC624 */  addiu      $a2, $a2, %lo(StateHandlerFall)
/* 9C3F4 800ABBF4 C1CA010C */  jal        StateSwitchStateData
/* 9C3F8 800ABBF8 21380000 */   addu      $a3, $zero, $zero
/* 9C3FC 800ABBFC C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9C400 800ABC00 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 9C404 800ABC04 0000428C */  lw         $v0, 0x0($v0)
/* 9C408 800ABC08 00000000 */  nop
/* 9C40C 800ABC0C 24104300 */  and        $v0, $v0, $v1
/* 9C410 800ABC10 57004014 */  bnez       $v0, .L800ABD70
/* 9C414 800ABC14 21101402 */   addu      $v0, $s0, $s4
/* 9C418 800ABC18 5CAF0208 */  j          .L800ABD70
/* 9C41C 800ABC1C 200155AC */   sw        $s5, 0x120($v0)
.L800ABC20:
/* 9C420 800ABC20 21101402 */  addu       $v0, $s0, $s4
/* 9C424 800ABC24 52004016 */  bnez       $s2, .L800ABD70
/* 9C428 800ABC28 200155AC */   sw        $s5, 0x120($v0)
/* 9C42C 800ABC2C 90F99127 */  addiu      $s1, $gp, %gp_rel(Raziel + 0x360)
/* 9C430 800ABC30 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9C434 800ABC34 10000224 */  addiu      $v0, $zero, 0x10
/* 9C438 800ABC38 03006210 */  beq        $v1, $v0, .L800ABC48
/* 9C43C 800ABC3C 20000224 */   addiu     $v0, $zero, 0x20
/* 9C440 800ABC40 04006214 */  bne        $v1, $v0, .L800ABC54
/* 9C444 800ABC44 00000000 */   nop
.L800ABC48:
/* 9C448 800ABC48 94000426 */  addiu      $a0, $s0, 0x94
/* 9C44C 800ABC4C 51AF0208 */  j          .L800ABD44
/* 9C450 800ABC50 0020053C */   lui       $a1, (0x20000001 >> 16)
.L800ABC54:
/* 9C454 800ABC54 1C01028E */  lw         $v0, 0x11C($s0)
/* 9C458 800ABC58 00000000 */  nop
/* 9C45C 800ABC5C 07004014 */  bnez       $v0, .L800ABC7C
/* 9C460 800ABC60 21200002 */   addu      $a0, $s0, $zero
/* 9C464 800ABC64 F6C9010C */  jal        G2EmulationQueryFrame
/* 9C468 800ABC68 21280000 */   addu      $a1, $zero, $zero
/* 9C46C 800ABC6C 04004224 */  addiu      $v0, $v0, 0x4
/* 9C470 800ABC70 1F004010 */  beqz       $v0, .L800ABCF0
/* 9C474 800ABC74 1C0102AE */   sw        $v0, 0x11C($s0)
/* 9C478 800ABC78 21200002 */  addu       $a0, $s0, $zero
.L800ABC7C:
/* 9C47C 800ABC7C F6C9010C */  jal        G2EmulationQueryFrame
/* 9C480 800ABC80 21280000 */   addu      $a1, $zero, $zero
/* 9C484 800ABC84 1C01038E */  lw         $v1, 0x11C($s0)
/* 9C488 800ABC88 00000000 */  nop
/* 9C48C 800ABC8C 2A186200 */  slt        $v1, $v1, $v0
/* 9C490 800ABC90 18006010 */  beqz       $v1, .L800ABCF4
/* 9C494 800ABC94 8C006426 */   addiu     $a0, $s3, 0x8C
/* 9C498 800ABC98 0000048E */  lw         $a0, 0x0($s0)
/* 9C49C 800ABC9C 1069020C */  jal        SetDropPhysics
/* 9C4A0 800ABCA0 A0FC2526 */   addiu     $a1, $s1, -0x360
/* 9C4A4 800ABCA4 08000524 */  addiu      $a1, $zero, 0x8
/* 9C4A8 800ABCA8 21300000 */  addu       $a2, $zero, $zero
/* 9C4AC 800ABCAC 0000048E */  lw         $a0, 0x0($s0)
/* 9C4B0 800ABCB0 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9C4B4 800ABCB4 2138C000 */   addu      $a3, $a2, $zero
/* 9C4B8 800ABCB8 06004010 */  beqz       $v0, .L800ABCD4
/* 9C4BC 800ABCBC 21200002 */   addu      $a0, $s0, $zero
/* 9C4C0 800ABCC0 1000B5AF */  sw         $s5, 0x10($sp)
/* 9C4C4 800ABCC4 1C000524 */  addiu      $a1, $zero, 0x1C
/* 9C4C8 800ABCC8 21300000 */  addu       $a2, $zero, $zero
/* 9C4CC 800ABCCC FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9C4D0 800ABCD0 07000724 */   addiu     $a3, $zero, 0x7
.L800ABCD4:
/* 9C4D4 800ABCD4 21200002 */  addu       $a0, $s0, $zero
/* 9C4D8 800ABCD8 2001068E */  lw         $a2, 0x120($s0)
/* 9C4DC 800ABCDC 0B80053C */  lui        $a1, %hi(StateHandlerFall)
/* 9C4E0 800ABCE0 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9C4E4 800ABCE4 A8BDA524 */   addiu     $a1, $a1, %lo(StateHandlerFall)
/* 9C4E8 800ABCE8 5CAF0208 */  j          .L800ABD70
/* 9C4EC 800ABCEC 00000000 */   nop
.L800ABCF0:
/* 9C4F0 800ABCF0 8C006426 */  addiu      $a0, $s3, 0x8C
.L800ABCF4:
/* 9C4F4 800ABCF4 51AF0208 */  j          .L800ABD44
/* 9C4F8 800ABCF8 0020053C */   lui       $a1, (0x20000001 >> 16)
.L800ABCFC:
/* 9C4FC 800ABCFC F6C9010C */  jal        G2EmulationQueryFrame
/* 9C500 800ABD00 21284002 */   addu      $a1, $s2, $zero
/* 9C504 800ABD04 02004228 */  slti       $v0, $v0, 0x2
/* 9C508 800ABD08 0D004014 */  bnez       $v0, .L800ABD40
/* 9C50C 800ABD0C 8C006426 */   addiu     $a0, $s3, 0x8C
/* 9C510 800ABD10 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 9C514 800ABD14 03000224 */  addiu      $v0, $zero, 0x3
/* 9C518 800ABD18 15006210 */  beq        $v1, $v0, .L800ABD70
/* 9C51C 800ABD1C 00000000 */   nop
/* 9C520 800ABD20 13004016 */  bnez       $s2, .L800ABD70
/* 9C524 800ABD24 21200002 */   addu      $a0, $s0, $zero
/* 9C528 800ABD28 0B80053C */  lui        $a1, %hi(StateHandlerGlide)
/* 9C52C 800ABD2C 88CBA524 */  addiu      $a1, $a1, %lo(StateHandlerGlide)
/* 9C530 800ABD30 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9C534 800ABD34 21300000 */   addu      $a2, $zero, $zero
/* 9C538 800ABD38 5CAF0208 */  j          .L800ABD70
/* 9C53C 800ABD3C 00000000 */   nop
.L800ABD40:
/* 9C540 800ABD40 0080053C */  lui        $a1, (0x80000001 >> 16)
.L800ABD44:
/* 9C544 800ABD44 0100A534 */  ori        $a1, $a1, (0x80000001 & 0xFFFF)
/* 9C548 800ABD48 4EC3010C */  jal        EnMessageQueueData
/* 9C54C 800ABD4C 21300000 */   addu      $a2, $zero, $zero
/* 9C550 800ABD50 5CAF0208 */  j          .L800ABD70
/* 9C554 800ABD54 00000000 */   nop
.L800ABD58:
/* 9C558 800ABD58 3A96020C */  jal        razPickupAndGrab
/* 9C55C 800ABD5C 21284002 */   addu      $a1, $s2, $zero
/* 9C560 800ABD60 5CAF0208 */  j          .L800ABD70
/* 9C564 800ABD64 00000000 */   nop
.L800ABD68:
/* 9C568 800ABD68 B9BF020C */  jal        DefaultStateHandler
/* 9C56C 800ABD6C 2130C002 */   addu      $a2, $s6, $zero
.L800ABD70:
/* 9C570 800ABD70 27C3010C */  jal        DeMessageQueue
/* 9C574 800ABD74 04006426 */   addiu     $a0, $s3, 0x4
/* 9C578 800ABD78 70AE0208 */  j          .L800AB9C0
/* 9C57C 800ABD7C 00000000 */   nop
.L800ABD80:
/* 9C580 800ABD80 3400BF8F */  lw         $ra, 0x34($sp)
/* 9C584 800ABD84 3000B68F */  lw         $s6, 0x30($sp)
/* 9C588 800ABD88 2C00B58F */  lw         $s5, 0x2C($sp)
/* 9C58C 800ABD8C 2800B48F */  lw         $s4, 0x28($sp)
/* 9C590 800ABD90 2400B38F */  lw         $s3, 0x24($sp)
/* 9C594 800ABD94 2000B28F */  lw         $s2, 0x20($sp)
/* 9C598 800ABD98 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9C59C 800ABD9C 1800B08F */  lw         $s0, 0x18($sp)
/* 9C5A0 800ABDA0 0800E003 */  jr         $ra
/* 9C5A4 800ABDA4 3800BD27 */   addiu     $sp, $sp, 0x38
.size StateHandlerJump, . - StateHandlerJump
