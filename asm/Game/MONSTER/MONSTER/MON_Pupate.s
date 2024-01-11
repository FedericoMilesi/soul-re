.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Pupate
/* 7C098 8008B898 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 7C09C 8008B89C 2000B2AF */  sw         $s2, 0x20($sp)
/* 7C0A0 8008B8A0 21908000 */  addu       $s2, $a0, $zero
/* 7C0A4 8008B8A4 3800BFAF */  sw         $ra, 0x38($sp)
/* 7C0A8 8008B8A8 3400B7AF */  sw         $s7, 0x34($sp)
/* 7C0AC 8008B8AC 3000B6AF */  sw         $s6, 0x30($sp)
/* 7C0B0 8008B8B0 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 7C0B4 8008B8B4 2800B4AF */  sw         $s4, 0x28($sp)
/* 7C0B8 8008B8B8 2400B3AF */  sw         $s3, 0x24($sp)
/* 7C0BC 8008B8BC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 7C0C0 8008B8C0 1800B0AF */  sw         $s0, 0x18($sp)
/* 7C0C4 8008B8C4 1400428E */  lw         $v0, 0x14($s2)
/* 7C0C8 8008B8C8 6C01538E */  lw         $s3, 0x16C($s2)
/* 7C0CC 8008B8CC 00084230 */  andi       $v0, $v0, 0x800
/* 7C0D0 8008B8D0 A3004010 */  beqz       $v0, .L8008BB60
/* 7C0D4 8008B8D4 21B00000 */   addu      $s6, $zero, $zero
/* 7C0D8 8008B8D8 21A0C002 */  addu       $s4, $s6, $zero
/* 7C0DC 8008B8DC 0100153C */  lui        $s5, (0x1869F >> 16)
/* 7C0E0 8008B8E0 9F86B536 */  ori        $s5, $s5, (0x1869F & 0xFFFF)
/* 7C0E4 8008B8E4 2400508E */  lw         $s0, 0x24($s2)
/* 7C0E8 8008B8E8 E316020C */  jal        MON_PupateQueueHandler
/* 7C0EC 8008B8EC 21B8C002 */   addu      $s7, $s6, $zero
/* 7C0F0 8008B8F0 17000482 */  lb         $a0, 0x17($s0)
/* 7C0F4 8008B8F4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7C0F8 8008B8F8 6D008210 */  beq        $a0, $v0, .L8008BAB0
/* 7C0FC 8008B8FC 0D80033C */   lui       $v1, %hi(objectAccess)
/* 7C100 8008B900 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 7C104 8008B904 00000000 */  nop
/* 7C108 8008B908 0400518C */  lw         $s1, 0x4($v0)
/* 7C10C 8008B90C 0D80023C */  lui        $v0, %hi(MISSILE_objectTable + 0x2C)
/* 7C110 8008B910 D0C44224 */  addiu      $v0, $v0, %lo(MISSILE_objectTable + 0x2C)
/* 7C114 8008B914 21108200 */  addu       $v0, $a0, $v0
/* 7C118 8008B918 00004290 */  lbu        $v0, 0x0($v0)
/* 7C11C 8008B91C 3CA26324 */  addiu      $v1, $v1, %lo(objectAccess)
/* 7C120 8008B920 C0100200 */  sll        $v0, $v0, 3
/* 7C124 8008B924 21104300 */  addu       $v0, $v0, $v1
/* 7C128 8008B928 0400568C */  lw         $s6, 0x4($v0)
/* 7C12C 8008B92C 4E002012 */  beqz       $s1, .L8008BA68
/* 7C130 8008B930 00000000 */   nop
.L8008B934:
/* 7C134 8008B934 1C00228E */  lw         $v0, 0x1C($s1)
/* 7C138 8008B938 00000000 */  nop
/* 7C13C 8008B93C 46005614 */  bne        $v0, $s6, .L8008BA58
/* 7C140 8008B940 00000000 */   nop
/* 7C144 8008B944 1400228E */  lw         $v0, 0x14($s1)
/* 7C148 8008B948 00000000 */  nop
/* 7C14C 8008B94C 20004230 */  andi       $v0, $v0, 0x20
/* 7C150 8008B950 41004014 */  bnez       $v0, .L8008BA58
/* 7C154 8008B954 00000000 */   nop
/* 7C158 8008B958 2000438E */  lw         $v1, 0x20($s2)
/* 7C15C 8008B95C 5C002286 */  lh         $v0, 0x5C($s1)
/* 7C160 8008B960 5E002786 */  lh         $a3, 0x5E($s1)
/* 7C164 8008B964 20006484 */  lh         $a0, 0x20($v1)
/* 7C168 8008B968 22006584 */  lh         $a1, 0x22($v1)
/* 7C16C 8008B96C 24006684 */  lh         $a2, 0x24($v1)
/* 7C170 8008B970 23204400 */  subu       $a0, $v0, $a0
/* 7C174 8008B974 60002286 */  lh         $v0, 0x60($s1)
/* 7C178 8008B978 2328E500 */  subu       $a1, $a3, $a1
/* 7C17C 8008B97C B7E6000C */  jal        MATH3D_LengthXYZ
/* 7C180 8008B980 23304600 */   subu      $a2, $v0, $a2
/* 7C184 8008B984 3A016386 */  lh         $v1, 0x13A($s3)
/* 7C188 8008B988 00000000 */  nop
/* 7C18C 8008B98C 2A104300 */  slt        $v0, $v0, $v1
/* 7C190 8008B990 31004010 */  beqz       $v0, .L8008BA58
/* 7C194 8008B994 00000000 */   nop
/* 7C198 8008B998 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7C19C 8008B99C 5C002286 */  lh         $v0, 0x5C($s1)
/* 7C1A0 8008B9A0 5E002786 */  lh         $a3, 0x5E($s1)
/* 7C1A4 8008B9A4 5C006484 */  lh         $a0, 0x5C($v1)
/* 7C1A8 8008B9A8 5E006584 */  lh         $a1, 0x5E($v1)
/* 7C1AC 8008B9AC 60006684 */  lh         $a2, 0x60($v1)
/* 7C1B0 8008B9B0 23204400 */  subu       $a0, $v0, $a0
/* 7C1B4 8008B9B4 60002286 */  lh         $v0, 0x60($s1)
/* 7C1B8 8008B9B8 2328E500 */  subu       $a1, $a3, $a1
/* 7C1BC 8008B9BC B7E6000C */  jal        MATH3D_LengthXYZ
/* 7C1C0 8008B9C0 23304600 */   subu      $a2, $v0, $a2
/* 7C1C4 8008B9C4 21184000 */  addu       $v1, $v0, $zero
/* 7C1C8 8008B9C8 2A107500 */  slt        $v0, $v1, $s5
/* 7C1CC 8008B9CC 03004010 */  beqz       $v0, .L8008B9DC
/* 7C1D0 8008B9D0 00000000 */   nop
/* 7C1D4 8008B9D4 21A86000 */  addu       $s5, $v1, $zero
/* 7C1D8 8008B9D8 21A02002 */  addu       $s4, $s1, $zero
.L8008B9DC:
/* 7C1DC 8008B9DC 9006020C */  jal        MON_GetTime
/* 7C1E0 8008B9E0 21204002 */   addu      $a0, $s2, $zero
/* 7C1E4 8008B9E4 1C01638E */  lw         $v1, 0x11C($s3)
/* 7C1E8 8008B9E8 00000000 */  nop
/* 7C1EC 8008B9EC 2B186200 */  sltu       $v1, $v1, $v0
/* 7C1F0 8008B9F0 19006010 */  beqz       $v1, .L8008BA58
/* 7C1F4 8008B9F4 00000000 */   nop
/* 7C1F8 8008B9F8 3AF2020C */  jal        func_800BC8E8
/* 7C1FC 8008B9FC 00000000 */   nop
/* 7C200 8008BA00 0F004230 */  andi       $v0, $v0, 0xF
/* 7C204 8008BA04 14004014 */  bnez       $v0, .L8008BA58
/* 7C208 8008BA08 21202002 */   addu      $a0, $s1, $zero
/* 7C20C 8008BA0C 21280000 */  addu       $a1, $zero, $zero
/* 7C210 8008BA10 2130A000 */  addu       $a2, $a1, $zero
/* 7C214 8008BA14 01000224 */  addiu      $v0, $zero, 0x1
/* 7C218 8008BA18 2138A000 */  addu       $a3, $a1, $zero
/* 7C21C 8008BA1C 64C5010C */  jal        SetAnimationInstanceSwitchData
/* 7C220 8008BA20 1000A2AF */   sw        $v0, 0x10($sp)
/* 7C224 8008BA24 21202002 */  addu       $a0, $s1, $zero
/* 7C228 8008BA28 0008053C */  lui        $a1, (0x8000008 >> 16)
/* 7C22C 8008BA2C 0800A534 */  ori        $a1, $a1, (0x8000008 & 0xFFFF)
/* 7C230 8008BA30 A1D1000C */  jal        INSTANCE_Post
/* 7C234 8008BA34 21304000 */   addu      $a2, $v0, $zero
/* 7C238 8008BA38 9006020C */  jal        MON_GetTime
/* 7C23C 8008BA3C 21204002 */   addu      $a0, $s2, $zero
/* 7C240 8008BA40 3AF2020C */  jal        func_800BC8E8
/* 7C244 8008BA44 21804000 */   addu      $s0, $v0, $zero
/* 7C248 8008BA48 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 7C24C 8008BA4C D0074224 */  addiu      $v0, $v0, 0x7D0
/* 7C250 8008BA50 21800202 */  addu       $s0, $s0, $v0
/* 7C254 8008BA54 1C0170AE */  sw         $s0, 0x11C($s3)
.L8008BA58:
/* 7C258 8008BA58 0800318E */  lw         $s1, 0x8($s1)
/* 7C25C 8008BA5C 00000000 */  nop
/* 7C260 8008BA60 B4FF2016 */  bnez       $s1, .L8008B934
/* 7C264 8008BA64 00000000 */   nop
.L8008BA68:
/* 7C268 8008BA68 11008012 */  beqz       $s4, .L8008BAB0
/* 7C26C 8008BA6C 00000000 */   nop
/* 7C270 8008BA70 5F00888A */  lwl        $t0, 0x5F($s4)
/* 7C274 8008BA74 5C00889A */  lwr        $t0, 0x5C($s4)
/* 7C278 8008BA78 60008986 */  lh         $t1, 0x60($s4)
/* 7C27C 8008BA7C 5F0048AA */  swl        $t0, 0x5F($s2)
/* 7C280 8008BA80 5C0048BA */  swr        $t0, 0x5C($s2)
/* 7C284 8008BA84 600049A6 */  sh         $t1, 0x60($s2)
/* 7C288 8008BA88 C400648E */  lw         $a0, 0xC4($s3)
/* 7C28C 8008BA8C 00000000 */  nop
/* 7C290 8008BA90 07008010 */  beqz       $a0, .L8008BAB0
/* 7C294 8008BA94 00000000 */   nop
/* 7C298 8008BA98 0400838C */  lw         $v1, 0x4($a0)
/* 7C29C 8008BA9C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7C2A0 8008BAA0 00000000 */  nop
/* 7C2A4 8008BAA4 02006214 */  bne        $v1, $v0, .L8008BAB0
/* 7C2A8 8008BAA8 00000000 */   nop
/* 7C2AC 8008BAAC 140095A4 */  sh         $s5, 0x14($a0)
.L8008BAB0:
/* 7C2B0 8008BAB0 9801438E */  lw         $v1, 0x198($s2)
/* 7C2B4 8008BAB4 1A000224 */  addiu      $v0, $zero, 0x1A
/* 7C2B8 8008BAB8 03006210 */  beq        $v1, $v0, .L8008BAC8
/* 7C2BC 8008BABC 00000000 */   nop
/* 7C2C0 8008BAC0 C22E0208 */  j          .L8008BB08
/* 7C2C4 8008BAC4 01001724 */   addiu     $s7, $zero, 0x1
.L8008BAC8:
/* 7C2C8 8008BAC8 03008016 */  bnez       $s4, .L8008BAD8
/* 7C2CC 8008BACC 00000000 */   nop
/* 7C2D0 8008BAD0 0A00C016 */  bnez       $s6, .L8008BAFC
/* 7C2D4 8008BAD4 00000000 */   nop
.L8008BAD8:
/* 7C2D8 8008BAD8 460C020C */  jal        MON_ShouldIAmbushEnemy
/* 7C2DC 8008BADC 21204002 */   addu      $a0, $s2, $zero
/* 7C2E0 8008BAE0 09004010 */  beqz       $v0, .L8008BB08
/* 7C2E4 8008BAE4 1C000524 */   addiu     $a1, $zero, 0x1C
/* 7C2E8 8008BAE8 21204002 */  addu       $a0, $s2, $zero
/* 7C2EC 8008BAEC B6FF010C */  jal        MON_PlayAnim
/* 7C2F0 8008BAF0 01000624 */   addiu     $a2, $zero, 0x1
/* 7C2F4 8008BAF4 C22E0208 */  j          .L8008BB08
/* 7C2F8 8008BAF8 01001724 */   addiu     $s7, $zero, 0x1
.L8008BAFC:
/* 7C2FC 8008BAFC 4A0160A6 */  sh         $zero, 0x14A($s3)
/* 7C300 8008BB00 D00B020C */  jal        MON_KillMonster
/* 7C304 8008BB04 21204002 */   addu      $a0, $s2, $zero
.L8008BB08:
/* 7C308 8008BB08 2800E012 */  beqz       $s7, .L8008BBAC
/* 7C30C 8008BB0C FFDF053C */   lui       $a1, (0xDFFFFFFF >> 16)
/* 7C310 8008BB10 FFFFA534 */  ori        $a1, $a1, (0xDFFFFFFF & 0xFFFF)
/* 7C314 8008BB14 FFF70424 */  addiu      $a0, $zero, -0x801
/* 7C318 8008BB18 1400428E */  lw         $v0, 0x14($s2)
/* 7C31C 8008BB1C 1800438E */  lw         $v1, 0x18($s2)
/* 7C320 8008BB20 24104400 */  and        $v0, $v0, $a0
/* 7C324 8008BB24 24186500 */  and        $v1, $v1, $a1
/* 7C328 8008BB28 140042AE */  sw         $v0, 0x14($s2)
/* 7C32C 8008BB2C 180043AE */  sw         $v1, 0x18($s2)
/* 7C330 8008BB30 0000628E */  lw         $v0, 0x0($s3)
/* 7C334 8008BB34 7FFF0324 */  addiu      $v1, $zero, -0x81
/* 7C338 8008BB38 24104300 */  and        $v0, $v0, $v1
/* 7C33C 8008BB3C 1B008012 */  beqz       $s4, .L8008BBAC
/* 7C340 8008BB40 000062AE */   sw        $v0, 0x0($s3)
/* 7C344 8008BB44 21208002 */  addu       $a0, $s4, $zero
/* 7C348 8008BB48 0400053C */  lui        $a1, (0x40002 >> 16)
/* 7C34C 8008BB4C 0200A534 */  ori        $a1, $a1, (0x40002 & 0xFFFF)
/* 7C350 8008BB50 A1D1000C */  jal        INSTANCE_Post
/* 7C354 8008BB54 05000624 */   addiu     $a2, $zero, 0x5
/* 7C358 8008BB58 EB2E0208 */  j          .L8008BBAC
/* 7C35C 8008BB5C 00000000 */   nop
.L8008BB60:
/* 7C360 8008BB60 0917020C */  jal        MON_DefaultQueueHandler
/* 7C364 8008BB64 21204002 */   addu      $a0, $s2, $zero
/* 7C368 8008BB68 C400638E */  lw         $v1, 0xC4($s3)
/* 7C36C 8008BB6C 00000000 */  nop
/* 7C370 8008BB70 06006010 */  beqz       $v1, .L8008BB8C
/* 7C374 8008BB74 21204002 */   addu      $a0, $s2, $zero
/* 7C378 8008BB78 6801628E */  lw         $v0, 0x168($s3)
/* 7C37C 8008BB7C 0400658C */  lw         $a1, 0x4($v1)
/* 7C380 8008BB80 1C004684 */  lh         $a2, 0x1C($v0)
/* 7C384 8008BB84 6604020C */  jal        MON_TurnToPosition
/* 7C388 8008BB88 5C00A524 */   addiu     $a1, $a1, 0x5C
.L8008BB8C:
/* 7C38C 8008BB8C 1800428E */  lw         $v0, 0x18($s2)
/* 7C390 8008BB90 00000000 */  nop
/* 7C394 8008BB94 10004230 */  andi       $v0, $v0, 0x10
/* 7C398 8008BB98 04004010 */  beqz       $v0, .L8008BBAC
/* 7C39C 8008BB9C 00000000 */   nop
/* 7C3A0 8008BBA0 5C016592 */  lbu        $a1, 0x15C($s3)
/* 7C3A4 8008BBA4 D804020C */  jal        MON_ChangeBehavior
/* 7C3A8 8008BBA8 21204002 */   addu      $a0, $s2, $zero
.L8008BBAC:
/* 7C3AC 8008BBAC 3800BF8F */  lw         $ra, 0x38($sp)
/* 7C3B0 8008BBB0 3400B78F */  lw         $s7, 0x34($sp)
/* 7C3B4 8008BBB4 3000B68F */  lw         $s6, 0x30($sp)
/* 7C3B8 8008BBB8 2C00B58F */  lw         $s5, 0x2C($sp)
/* 7C3BC 8008BBBC 2800B48F */  lw         $s4, 0x28($sp)
/* 7C3C0 8008BBC0 2400B38F */  lw         $s3, 0x24($sp)
/* 7C3C4 8008BBC4 2000B28F */  lw         $s2, 0x20($sp)
/* 7C3C8 8008BBC8 1C00B18F */  lw         $s1, 0x1C($sp)
/* 7C3CC 8008BBCC 1800B08F */  lw         $s0, 0x18($sp)
/* 7C3D0 8008BBD0 0800E003 */  jr         $ra
/* 7C3D4 8008BBD4 4000BD27 */   addiu     $sp, $sp, 0x40
.size MON_Pupate, . - MON_Pupate
