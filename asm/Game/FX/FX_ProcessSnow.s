.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_ProcessSnow
/* 39BE8 800493E8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 39BEC 800493EC 1800B0AF */  sw         $s0, 0x18($sp)
/* 39BF0 800493F0 21808000 */  addu       $s0, $a0, $zero
/* 39BF4 800493F4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 39BF8 800493F8 2000BFAF */  sw         $ra, 0x20($sp)
/* 39BFC 800493FC 42000386 */  lh         $v1, 0x42($s0)
/* 39C00 80049400 0F270224 */  addiu      $v0, $zero, 0x270F
/* 39C04 80049404 13006214 */  bne        $v1, $v0, .L80049454
/* 39C08 80049408 2188A000 */   addu      $s1, $a1, $zero
/* 39C0C 8004940C D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 39C10 80049410 01000224 */  addiu      $v0, $zero, 0x1
/* 39C14 80049414 18006210 */  beq        $v1, $v0, .L80049478
/* 39C18 80049418 E8030224 */   addiu     $v0, $zero, 0x3E8
/* 39C1C 8004941C D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 39C20 80049420 00000000 */  nop
/* 39C24 80049424 15006214 */  bne        $v1, $v0, .L8004947C
/* 39C28 80049428 21200002 */   addu      $a0, $s0, $zero
/* 39C2C 8004942C 749A8287 */  lh         $v0, %gp_rel(snow_amount)($gp)
/* 39C30 80049430 00000000 */  nop
/* 39C34 80049434 11004010 */  beqz       $v0, .L8004947C
/* 39C38 80049438 00000000 */   nop
/* 39C3C 8004943C 420000A6 */  sh         $zero, 0x42($s0)
/* 39C40 80049440 D724010C */  jal        FX_GetRandomScreenPt
/* 39C44 80049444 1000A427 */   addiu     $a0, $sp, 0x10
/* 39C48 80049448 1000A427 */  addiu      $a0, $sp, 0x10
/* 39C4C 8004944C 9124010C */  jal        FX_ConvertCamPersToWorld
/* 39C50 80049450 2C000526 */   addiu     $a1, $s0, 0x2C
.L80049454:
/* 39C54 80049454 10000286 */  lh         $v0, 0x10($s0)
/* 39C58 80049458 10000396 */  lhu        $v1, 0x10($s0)
/* 39C5C 8004945C 02004018 */  blez       $v0, .L80049468
/* 39C60 80049460 FFFF6224 */   addiu     $v0, $v1, -0x1
/* 39C64 80049464 100002A6 */  sh         $v0, 0x10($s0)
.L80049468:
/* 39C68 80049468 10000286 */  lh         $v0, 0x10($s0)
/* 39C6C 8004946C 00000000 */  nop
/* 39C70 80049470 06004014 */  bnez       $v0, .L8004948C
/* 39C74 80049474 00000000 */   nop
.L80049478:
/* 39C78 80049478 21200002 */  addu       $a0, $s0, $zero
.L8004947C:
/* 39C7C 8004947C 9009010C */  jal        FX_Die
/* 39C80 80049480 21282002 */   addu      $a1, $s1, $zero
/* 39C84 80049484 42250108 */  j          .L80049508
/* 39C88 80049488 00000000 */   nop
.L8004948C:
/* 39C8C 8004948C 3AF2020C */  jal        func_800BC8E8
/* 39C90 80049490 00000000 */   nop
/* 39C94 80049494 A49A8387 */  lh         $v1, %gp_rel(windx)($gp)
/* 39C98 80049498 FF074230 */  andi       $v0, $v0, 0x7FF
/* 39C9C 8004949C 00084224 */  addiu      $v0, $v0, 0x800
/* 39CA0 800494A0 18006200 */  mult       $v1, $v0
/* 39CA4 800494A4 12180000 */  mflo       $v1
/* 39CA8 800494A8 02006104 */  bgez       $v1, .L800494B4
/* 39CAC 800494AC 00000000 */   nop
/* 39CB0 800494B0 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L800494B4:
/* 39CB4 800494B4 2C000296 */  lhu        $v0, 0x2C($s0)
/* 39CB8 800494B8 031B0300 */  sra        $v1, $v1, 12
/* 39CBC 800494BC 21104300 */  addu       $v0, $v0, $v1
/* 39CC0 800494C0 3AF2020C */  jal        func_800BC8E8
/* 39CC4 800494C4 2C0002A6 */   sh        $v0, 0x2C($s0)
/* 39CC8 800494C8 FF074230 */  andi       $v0, $v0, 0x7FF
/* 39CCC 800494CC A69A8387 */  lh         $v1, %gp_rel(windy)($gp)
/* 39CD0 800494D0 00084224 */  addiu      $v0, $v0, 0x800
/* 39CD4 800494D4 18006200 */  mult       $v1, $v0
/* 39CD8 800494D8 12180000 */  mflo       $v1
/* 39CDC 800494DC 03006104 */  bgez       $v1, .L800494EC
/* 39CE0 800494E0 032B0300 */   sra       $a1, $v1, 12
/* 39CE4 800494E4 FF0F6324 */  addiu      $v1, $v1, 0xFFF
/* 39CE8 800494E8 032B0300 */  sra        $a1, $v1, 12
.L800494EC:
/* 39CEC 800494EC 2E000296 */  lhu        $v0, 0x2E($s0)
/* 39CF0 800494F0 30000396 */  lhu        $v1, 0x30($s0)
/* 39CF4 800494F4 60000496 */  lhu        $a0, 0x60($s0)
/* 39CF8 800494F8 21104500 */  addu       $v0, $v0, $a1
/* 39CFC 800494FC 21186400 */  addu       $v1, $v1, $a0
/* 39D00 80049500 2E0002A6 */  sh         $v0, 0x2E($s0)
/* 39D04 80049504 300003A6 */  sh         $v1, 0x30($s0)
.L80049508:
/* 39D08 80049508 2000BF8F */  lw         $ra, 0x20($sp)
/* 39D0C 8004950C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 39D10 80049510 1800B08F */  lw         $s0, 0x18($sp)
/* 39D14 80049514 0800E003 */  jr         $ra
/* 39D18 80049518 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_ProcessSnow, . - FX_ProcessSnow
