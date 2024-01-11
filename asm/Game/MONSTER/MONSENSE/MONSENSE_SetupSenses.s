.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_SetupSenses
/* 7735C 80086B5C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 77360 80086B60 1800B2AF */  sw         $s2, 0x18($sp)
/* 77364 80086B64 21908000 */  addu       $s2, $a0, $zero
/* 77368 80086B68 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7736C 80086B6C 1400B1AF */  sw         $s1, 0x14($sp)
/* 77370 80086B70 1000B0AF */  sw         $s0, 0x10($sp)
/* 77374 80086B74 6C01518E */  lw         $s1, 0x16C($s2)
/* 77378 80086B78 05000624 */  addiu      $a2, $zero, 0x5
/* 7737C 80086B7C 21202002 */  addu       $a0, $s1, $zero
/* 77380 80086B80 6801228E */  lw         $v0, 0x168($s1)
/* 77384 80086B84 00000000 */  nop
/* 77388 80086B88 0C00508C */  lw         $s0, 0xC($v0)
/* 7738C 80086B8C FC19020C */  jal        MONSENSE_InitIRList
/* 77390 80086B90 AC012526 */   addiu     $a1, $s1, 0x1AC
/* 77394 80086B94 1800428E */  lw         $v0, 0x18($s2)
/* 77398 80086B98 00000000 */  nop
/* 7739C 80086B9C 00044234 */  ori        $v0, $v0, 0x400
/* 773A0 80086BA0 0A000012 */  beqz       $s0, .L80086BCC
/* 773A4 80086BA4 180042AE */   sw        $v0, 0x18($s2)
/* 773A8 80086BA8 0000028E */  lw         $v0, 0x0($s0)
/* 773AC 80086BAC 0400038E */  lw         $v1, 0x4($s0)
/* 773B0 80086BB0 00000000 */  nop
/* 773B4 80086BB4 25104300 */  or         $v0, $v0, $v1
/* 773B8 80086BB8 0800038E */  lw         $v1, 0x8($s0)
/* 773BC 80086BBC 0C00048E */  lw         $a0, 0xC($s0)
/* 773C0 80086BC0 25104300 */  or         $v0, $v0, $v1
/* 773C4 80086BC4 25104400 */  or         $v0, $v0, $a0
/* 773C8 80086BC8 580042AE */  sw         $v0, 0x58($s2)
.L80086BCC:
/* 773CC 80086BCC E02E0224 */  addiu      $v0, $zero, 0x2EE0
/* 773D0 80086BD0 540042AE */  sw         $v0, 0x54($s2)
/* 773D4 80086BD4 5800428E */  lw         $v0, 0x58($s2)
/* 773D8 80086BD8 50A5838F */  lw         $v1, %gp_rel(gNumMonsters)($gp)
/* 773DC 80086BDC 50A58493 */  lbu        $a0, %gp_rel(gNumMonsters)($gp)
/* 773E0 80086BE0 0B004234 */  ori        $v0, $v0, 0xB
/* 773E4 80086BE4 80180300 */  sll        $v1, $v1, 2
/* 773E8 80086BE8 580042AE */  sw         $v0, 0x58($s2)
/* 773EC 80086BEC 1CED8227 */  addiu      $v0, $gp, %gp_rel(monsterSenseArray)
/* 773F0 80086BF0 21186200 */  addu       $v1, $v1, $v0
/* 773F4 80086BF4 C40020AE */  sw         $zero, 0xC4($s1)
/* 773F8 80086BF8 C80020AE */  sw         $zero, 0xC8($s1)
/* 773FC 80086BFC 000071AC */  sw         $s1, 0x0($v1)
/* 77400 80086C00 630124A2 */  sb         $a0, 0x163($s1)
/* 77404 80086C04 50A5838F */  lw         $v1, %gp_rel(gNumMonsters)($gp)
/* 77408 80086C08 00000000 */  nop
/* 7740C 80086C0C 02006014 */  bnez       $v1, .L80086C18
/* 77410 80086C10 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 77414 80086C14 E4ED82AF */  sw         $v0, %gp_rel(lastSenseFrame)($gp)
.L80086C18:
/* 77418 80086C18 2400428E */  lw         $v0, 0x24($s2)
/* 7741C 80086C1C 00000000 */  nop
/* 77420 80086C20 1000428C */  lw         $v0, 0x10($v0)
/* 77424 80086C24 01006324 */  addiu      $v1, $v1, 0x1
/* 77428 80086C28 50A583AF */  sw         $v1, %gp_rel(gNumMonsters)($gp)
/* 7742C 80086C2C 04184230 */  andi       $v0, $v0, 0x1804
/* 77430 80086C30 07004010 */  beqz       $v0, .L80086C50
/* 77434 80086C34 00000000 */   nop
/* 77438 80086C38 54A5828F */  lw         $v0, %gp_rel(gNumSpectralMonsters)($gp)
/* 7743C 80086C3C 00000000 */  nop
/* 77440 80086C40 01004224 */  addiu      $v0, $v0, 0x1
/* 77444 80086C44 54A582AF */  sw         $v0, %gp_rel(gNumSpectralMonsters)($gp)
/* 77448 80086C48 191B0208 */  j          .L80086C64
/* 7744C 80086C4C 07004228 */   slti      $v0, $v0, 0x7
.L80086C50:
/* 77450 80086C50 58A5828F */  lw         $v0, %gp_rel(gNumMaterialMonsters)($gp)
/* 77454 80086C54 00000000 */  nop
/* 77458 80086C58 01004224 */  addiu      $v0, $v0, 0x1
/* 7745C 80086C5C 58A582AF */  sw         $v0, %gp_rel(gNumMaterialMonsters)($gp)
/* 77460 80086C60 07004228 */  slti       $v0, $v0, 0x7
.L80086C64:
/* 77464 80086C64 12004014 */  bnez       $v0, .L80086CB0
/* 77468 80086C68 00000000 */   nop
/* 7746C 80086C6C 2C00428E */  lw         $v0, 0x2C($s2)
/* 77470 80086C70 00000000 */  nop
/* 77474 80086C74 0E004014 */  bnez       $v0, .L80086CB0
/* 77478 80086C78 00000000 */   nop
/* 7747C 80086C7C 3800438E */  lw         $v1, 0x38($s2)
/* 77480 80086C80 3400428E */  lw         $v0, 0x34($s2)
/* 77484 80086C84 00000000 */  nop
/* 77488 80086C88 09006210 */  beq        $v1, $v0, .L80086CB0
/* 7748C 80086C8C 0200033C */   lui       $v1, (0x20000 >> 16)
/* 77490 80086C90 1400428E */  lw         $v0, 0x14($s2)
/* 77494 80086C94 00000000 */  nop
/* 77498 80086C98 20004234 */  ori        $v0, $v0, 0x20
/* 7749C 80086C9C 140042AE */  sw         $v0, 0x14($s2)
/* 774A0 80086CA0 1800428E */  lw         $v0, 0x18($s2)
/* 774A4 80086CA4 00000000 */  nop
/* 774A8 80086CA8 25104300 */  or         $v0, $v0, $v1
/* 774AC 80086CAC 180042AE */  sw         $v0, 0x18($s2)
.L80086CB0:
/* 774B0 80086CB0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 774B4 80086CB4 1800B28F */  lw         $s2, 0x18($sp)
/* 774B8 80086CB8 1400B18F */  lw         $s1, 0x14($sp)
/* 774BC 80086CBC 1000B08F */  lw         $s0, 0x10($sp)
/* 774C0 80086CC0 0800E003 */  jr         $ra
/* 774C4 80086CC4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MONSENSE_SetupSenses, . - MONSENSE_SetupSenses
