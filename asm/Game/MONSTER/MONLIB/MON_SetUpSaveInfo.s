.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SetUpSaveInfo
/* 7339C 80082B9C 21408000 */  addu       $t0, $a0, $zero
/* 733A0 80082BA0 2138A000 */  addu       $a3, $a1, $zero
/* 733A4 80082BA4 BBFF033C */  lui        $v1, (0xFFBBFFFB >> 16)
/* 733A8 80082BA8 FBFF6334 */  ori        $v1, $v1, (0xFFBBFFFB & 0xFFFF)
/* 733AC 80082BAC FFF7043C */  lui        $a0, (0xF7FFFFFF >> 16)
/* 733B0 80082BB0 FFFF8434 */  ori        $a0, $a0, (0xF7FFFFFF & 0xFFFF)
/* 733B4 80082BB4 6C01068D */  lw         $a2, 0x16C($t0)
/* 733B8 80082BB8 1FFF053C */  lui        $a1, (0xFF1FFFFF >> 16)
/* 733BC 80082BBC 0000C28C */  lw         $v0, 0x0($a2)
/* 733C0 80082BC0 2400098D */  lw         $t1, 0x24($t0)
/* 733C4 80082BC4 24104300 */  and        $v0, $v0, $v1
/* 733C8 80082BC8 0000E2AC */  sw         $v0, 0x0($a3)
/* 733CC 80082BCC 0400C28C */  lw         $v0, 0x4($a2)
/* 733D0 80082BD0 FFFFA534 */  ori        $a1, $a1, (0xFF1FFFFF & 0xFFFF)
/* 733D4 80082BD4 24104400 */  and        $v0, $v0, $a0
/* 733D8 80082BD8 F8FF0424 */  addiu      $a0, $zero, -0x8
/* 733DC 80082BDC 0400E2AC */  sw         $v0, 0x4($a3)
/* 733E0 80082BE0 0C00E28C */  lw         $v0, 0xC($a3)
/* 733E4 80082BE4 5E01C390 */  lbu        $v1, 0x15E($a2)
/* 733E8 80082BE8 24104400 */  and        $v0, $v0, $a0
/* 733EC 80082BEC 07006330 */  andi       $v1, $v1, 0x7
/* 733F0 80082BF0 25104300 */  or         $v0, $v0, $v1
/* 733F4 80082BF4 07FE0424 */  addiu      $a0, $zero, -0x1F9
/* 733F8 80082BF8 0C00E2AC */  sw         $v0, 0xC($a3)
/* 733FC 80082BFC 24104400 */  and        $v0, $v0, $a0
/* 73400 80082C00 9801038D */  lw         $v1, 0x198($t0)
/* 73404 80082C04 FFC10424 */  addiu      $a0, $zero, -0x3E01
/* 73408 80082C08 3F006330 */  andi       $v1, $v1, 0x3F
/* 7340C 80082C0C C0180300 */  sll        $v1, $v1, 3
/* 73410 80082C10 25104300 */  or         $v0, $v0, $v1
/* 73414 80082C14 0C00E2AC */  sw         $v0, 0xC($a3)
/* 73418 80082C18 5A01C390 */  lbu        $v1, 0x15A($a2)
/* 7341C 80082C1C 24104400 */  and        $v0, $v0, $a0
/* 73420 80082C20 1F006330 */  andi       $v1, $v1, 0x1F
/* 73424 80082C24 401A0300 */  sll        $v1, $v1, 9
/* 73428 80082C28 25104300 */  or         $v0, $v0, $v1
/* 7342C 80082C2C 0C00E2AC */  sw         $v0, 0xC($a3)
/* 73430 80082C30 5801C390 */  lbu        $v1, 0x158($a2)
/* 73434 80082C34 24104500 */  and        $v0, $v0, $a1
/* 73438 80082C38 07006330 */  andi       $v1, $v1, 0x7
/* 7343C 80082C3C 401D0300 */  sll        $v1, $v1, 21
/* 73440 80082C40 25104300 */  or         $v0, $v0, $v1
/* 73444 80082C44 0C00E2AC */  sw         $v0, 0xC($a3)
/* 73448 80082C48 9801038D */  lw         $v1, 0x198($t0)
/* 7344C 80082C4C 17000224 */  addiu      $v0, $zero, 0x17
/* 73450 80082C50 08006214 */  bne        $v1, $v0, .L80082C74
/* 73454 80082C54 00000000 */   nop
/* 73458 80082C58 5801C290 */  lbu        $v0, 0x158($a2)
/* 7345C 80082C5C 00000000 */  nop
/* 73460 80082C60 04004014 */  bnez       $v0, .L80082C74
/* 73464 80082C64 00000000 */   nop
/* 73468 80082C68 D400C294 */  lhu        $v0, 0xD4($a2)
/* 7346C 80082C6C 200B0208 */  j          .L80082C80
/* 73470 80082C70 0A00E2A4 */   sh        $v0, 0xA($a3)
.L80082C74:
/* 73474 80082C74 4801C294 */  lhu        $v0, 0x148($a2)
/* 73478 80082C78 00000000 */  nop
/* 7347C 80082C7C 0A00E2A4 */  sh         $v0, 0xA($a3)
.L80082C80:
/* 73480 80082C80 D800C294 */  lhu        $v0, 0xD8($a2)
/* 73484 80082C84 00000000 */  nop
/* 73488 80082C88 0800E2A4 */  sh         $v0, 0x8($a3)
/* 7348C 80082C8C BC00C28C */  lw         $v0, 0xBC($a2)
/* 73490 80082C90 00000000 */  nop
/* 73494 80082C94 12004010 */  beqz       $v0, .L80082CE0
/* 73498 80082C98 EFFF043C */   lui       $a0, (0xFFEFFFFF >> 16)
/* 7349C 80082C9C FFFF8434 */  ori        $a0, $a0, (0xFFEFFFFF & 0xFFFF)
/* 734A0 80082CA0 F0FF053C */  lui        $a1, (0xFFF03FFF >> 16)
/* 734A4 80082CA4 FF3FA534 */  ori        $a1, $a1, (0xFFF03FFF & 0xFFFF)
/* 734A8 80082CA8 0C00E38C */  lw         $v1, 0xC($a3)
/* 734AC 80082CAC EC010291 */  lbu        $v0, 0x1EC($t0)
/* 734B0 80082CB0 24186400 */  and        $v1, $v1, $a0
/* 734B4 80082CB4 42100200 */  srl        $v0, $v0, 1
/* 734B8 80082CB8 01004230 */  andi       $v0, $v0, 0x1
/* 734BC 80082CBC 00150200 */  sll        $v0, $v0, 20
/* 734C0 80082CC0 25186200 */  or         $v1, $v1, $v0
/* 734C4 80082CC4 0C00E3AC */  sw         $v1, 0xC($a3)
/* 734C8 80082CC8 BC00C28C */  lw         $v0, 0xBC($a2)
/* 734CC 80082CCC 4000248D */  lw         $a0, 0x40($t1)
/* 734D0 80082CD0 24186500 */  and        $v1, $v1, $a1
/* 734D4 80082CD4 23104400 */  subu       $v0, $v0, $a0
/* 734D8 80082CD8 3D0B0208 */  j          .L80082CF4
/* 734DC 80082CDC 03110200 */   sra       $v0, $v0, 4
.L80082CE0:
/* 734E0 80082CE0 F0FF043C */  lui        $a0, (0xFFF03FFF >> 16)
/* 734E4 80082CE4 FF3F8434 */  ori        $a0, $a0, (0xFFF03FFF & 0xFFFF)
/* 734E8 80082CE8 0C00E38C */  lw         $v1, 0xC($a3)
/* 734EC 80082CEC 2C002281 */  lb         $v0, 0x2C($t1)
/* 734F0 80082CF0 24186400 */  and        $v1, $v1, $a0
.L80082CF4:
/* 734F4 80082CF4 3F004230 */  andi       $v0, $v0, 0x3F
/* 734F8 80082CF8 80130200 */  sll        $v0, $v0, 14
/* 734FC 80082CFC 25186200 */  or         $v1, $v1, $v0
/* 73500 80082D00 0800E003 */  jr         $ra
/* 73504 80082D04 0C00E3AC */   sw        $v1, 0xC($a3)
.size MON_SetUpSaveInfo, . - MON_SetUpSaveInfo
