.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C2AEC
/* B32EC 800C2AEC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B32F0 800C2AF0 1000B0AF */  sw         $s0, 0x10($sp)
/* B32F4 800C2AF4 21808000 */  addu       $s0, $a0, $zero
/* B32F8 800C2AF8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B32FC 800C2AFC 2198A000 */  addu       $s3, $a1, $zero
/* B3300 800C2B00 2000BFAF */  sw         $ra, 0x20($sp)
/* B3304 800C2B04 1800B2AF */  sw         $s2, 0x18($sp)
/* B3308 800C2B08 22006106 */  bgez       $s3, .L800C2B94
/* B330C 800C2B0C 1400B1AF */   sw        $s1, 0x14($sp)
/* B3310 800C2B10 0D80023C */  lui        $v0, %hi(_padFixResult + 0xC)
/* B3314 800C2B14 68E9428C */  lw         $v0, %lo(_padFixResult + 0xC)($v0)
/* B3318 800C2B18 4000038E */  lw         $v1, 0x40($s0)
/* B331C 800C2B1C 00004490 */  lbu        $a0, 0x0($v0)
/* B3320 800C2B20 FF000224 */  addiu      $v0, $zero, 0xFF
/* B3324 800C2B24 440002A2 */  sb         $v0, 0x44($s0)
/* B3328 800C2B28 01000224 */  addiu      $v0, $zero, 0x1
/* B332C 800C2B2C 450002A2 */  sb         $v0, 0x45($s0)
/* B3330 800C2B30 27101300 */  nor        $v0, $zero, $s3
/* B3334 800C2B34 000062A0 */  sb         $v0, 0x0($v1)
/* B3338 800C2B38 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B333C 800C2B3C 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B3340 800C2B40 00000000 */  nop
/* B3344 800C2B44 04006294 */  lhu        $v0, 0x4($v1)
/* B3348 800C2B48 00000000 */  nop
/* B334C 800C2B4C 01004230 */  andi       $v0, $v0, 0x1
/* B3350 800C2B50 06004014 */  bnez       $v0, .L800C2B6C
/* B3354 800C2B54 FF009230 */   andi      $s2, $a0, 0xFF
.L800C2B58:
/* B3358 800C2B58 04006294 */  lhu        $v0, 0x4($v1)
/* B335C 800C2B5C 00000000 */  nop
/* B3360 800C2B60 01004230 */  andi       $v0, $v0, 0x1
/* B3364 800C2B64 FCFF4010 */  beqz       $v0, .L800C2B58
/* B3368 800C2B68 00000000 */   nop
.L800C2B6C:
/* B336C 800C2B6C 641E030C */  jal        func_800C7990
/* B3370 800C2B70 00000000 */   nop
/* B3374 800C2B74 FDFF4010 */  beqz       $v0, .L800C2B6C
/* B3378 800C2B78 27101300 */   nor       $v0, $zero, $s3
/* B337C 800C2B7C 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B3380 800C2B80 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B3384 800C2B84 00000000 */  nop
/* B3388 800C2B88 000062A0 */  sb         $v0, 0x0($v1)
/* B338C 800C2B8C 380B0308 */  j          .L800C2CE0
/* B3390 800C2B90 21104002 */   addu      $v0, $s2, $zero
.L800C2B94:
/* B3394 800C2B94 3C00028E */  lw         $v0, 0x3C($s0)
/* B3398 800C2B98 00000000 */  nop
/* B339C 800C2B9C 00004290 */  lbu        $v0, 0x0($v0)
/* B33A0 800C2BA0 08000324 */  addiu      $v1, $zero, 0x8
/* B33A4 800C2BA4 03110200 */  sra        $v0, $v0, 4
/* B33A8 800C2BA8 07004314 */  bne        $v0, $v1, .L800C2BC8
/* B33AC 800C2BAC 88001124 */   addiu     $s1, $zero, 0x88
/* B33B0 800C2BB0 44000292 */  lbu        $v0, 0x44($s0)
/* B33B4 800C2BB4 00000000 */  nop
/* B33B8 800C2BB8 0900422C */  sltiu      $v0, $v0, 0x9
/* B33BC 800C2BBC 03004014 */  bnez       $v0, .L800C2BCC
/* B33C0 800C2BC0 801F023C */   lui       $v0, (0x1F801120 >> 16)
/* B33C4 800C2BC4 22001124 */  addiu      $s1, $zero, 0x22
.L800C2BC8:
/* B33C8 800C2BC8 801F023C */  lui        $v0, (0x1F801120 >> 16)
.L800C2BCC:
/* B33CC 800C2BCC 20114234 */  ori        $v0, $v0, (0x1F801120 & 0xFFFF)
/* B33D0 800C2BD0 0D80053C */  lui        $a1, %hi(_padFixResult + 0xC)
/* B33D4 800C2BD4 68E9A58C */  lw         $a1, %lo(_padFixResult + 0xC)($a1)
/* B33D8 800C2BD8 00004494 */  lhu        $a0, 0x0($v0)
/* B33DC 800C2BDC 0400A394 */  lhu        $v1, 0x4($a1)
/* B33E0 800C2BE0 AE010224 */  addiu      $v0, $zero, 0x1AE
/* B33E4 800C2BE4 0E80013C */  lui        $at, %hi(_waitTime)
/* B33E8 800C2BE8 3CFE22AC */  sw         $v0, %lo(_waitTime)($at)
/* B33EC 800C2BEC 0E80013C */  lui        $at, %hi(D_800DFE40)
/* B33F0 800C2BF0 40FE24AC */  sw         $a0, %lo(D_800DFE40)($at)
/* B33F4 800C2BF4 02006330 */  andi       $v1, $v1, 0x2
/* B33F8 800C2BF8 06006014 */  bnez       $v1, .L800C2C14
/* B33FC 800C2BFC 2118A000 */   addu      $v1, $a1, $zero
.L800C2C00:
/* B3400 800C2C00 04006294 */  lhu        $v0, 0x4($v1)
/* B3404 800C2C04 00000000 */  nop
/* B3408 800C2C08 02004230 */  andi       $v0, $v0, 0x2
/* B340C 800C2C0C FCFF4010 */  beqz       $v0, .L800C2C00
/* B3410 800C2C10 00000000 */   nop
.L800C2C14:
/* B3414 800C2C14 0D80023C */  lui        $v0, %hi(_padFixResult + 0xC)
/* B3418 800C2C18 68E9428C */  lw         $v0, %lo(_padFixResult + 0xC)($v0)
/* B341C 800C2C1C 0D80033C */  lui        $v1, %hi(_padFixResult + 0x8)
/* B3420 800C2C20 64E9638C */  lw         $v1, %lo(_padFixResult + 0x8)($v1)
/* B3424 800C2C24 00004490 */  lbu        $a0, 0x0($v0)
/* B3428 800C2C28 0E0051A4 */  sh         $s1, 0xE($v0)
/* B342C 800C2C2C 0000628C */  lw         $v0, 0x0($v1)
/* B3430 800C2C30 00000000 */  nop
/* B3434 800C2C34 80004230 */  andi       $v0, $v0, 0x80
/* B3438 800C2C38 0D004014 */  bnez       $v0, .L800C2C70
/* B343C 800C2C3C FF009230 */   andi      $s2, $a0, 0xFF
.L800C2C40:
/* B3440 800C2C40 641E030C */  jal        func_800C7990
/* B3444 800C2C44 00000000 */   nop
/* B3448 800C2C48 25004014 */  bnez       $v0, .L800C2CE0
/* B344C 800C2C4C ECFF0224 */   addiu     $v0, $zero, -0x14
/* B3450 800C2C50 0D80023C */  lui        $v0, %hi(_padFixResult + 0x8)
/* B3454 800C2C54 64E9428C */  lw         $v0, %lo(_padFixResult + 0x8)($v0)
/* B3458 800C2C58 00000000 */  nop
/* B345C 800C2C5C 0000428C */  lw         $v0, 0x0($v0)
/* B3460 800C2C60 00000000 */  nop
/* B3464 800C2C64 80004230 */  andi       $v0, $v0, 0x80
/* B3468 800C2C68 F5FF4010 */  beqz       $v0, .L800C2C40
/* B346C 800C2C6C 00000000 */   nop
.L800C2C70:
/* B3470 800C2C70 0D80023C */  lui        $v0, %hi(_padFixResult + 0xC)
/* B3474 800C2C74 68E9428C */  lw         $v0, %lo(_padFixResult + 0xC)($v0)
/* B3478 800C2C78 00000000 */  nop
/* B347C 800C2C7C 000053A0 */  sb         $s3, 0x0($v0)
/* B3480 800C2C80 22000224 */  addiu      $v0, $zero, 0x22
/* B3484 800C2C84 0A002216 */  bne        $s1, $v0, .L800C2CB0
/* B3488 800C2C88 7FFF0224 */   addiu     $v0, $zero, -0x81
/* B348C 800C2C8C 0D80033C */  lui        $v1, %hi(_padFixResult + 0x8)
/* B3490 800C2C90 64E9638C */  lw         $v1, %lo(_padFixResult + 0x8)($v1)
/* B3494 800C2C94 0D80043C */  lui        $a0, %hi(_padFixResult + 0xC)
/* B3498 800C2C98 68E9848C */  lw         $a0, %lo(_padFixResult + 0xC)($a0)
/* B349C 800C2C9C 000062AC */  sw         $v0, 0x0($v1)
/* B34A0 800C2CA0 0A008294 */  lhu        $v0, 0xA($a0)
/* B34A4 800C2CA4 00000000 */  nop
/* B34A8 800C2CA8 10004234 */  ori        $v0, $v0, 0x10
/* B34AC 800C2CAC 0A0082A4 */  sh         $v0, 0xA($a0)
.L800C2CB0:
/* B34B0 800C2CB0 45000292 */  lbu        $v0, 0x45($s0)
/* B34B4 800C2CB4 44000492 */  lbu        $a0, 0x44($s0)
/* B34B8 800C2CB8 3C00038E */  lw         $v1, 0x3C($s0)
/* B34BC 800C2CBC 01004224 */  addiu      $v0, $v0, 0x1
/* B34C0 800C2CC0 21186400 */  addu       $v1, $v1, $a0
/* B34C4 800C2CC4 450002A2 */  sb         $v0, 0x45($s0)
/* B34C8 800C2CC8 000072A0 */  sb         $s2, 0x0($v1)
/* B34CC 800C2CCC 44000292 */  lbu        $v0, 0x44($s0)
/* B34D0 800C2CD0 00000000 */  nop
/* B34D4 800C2CD4 01004224 */  addiu      $v0, $v0, 0x1
/* B34D8 800C2CD8 440002A2 */  sb         $v0, 0x44($s0)
/* B34DC 800C2CDC 21104002 */  addu       $v0, $s2, $zero
.L800C2CE0:
/* B34E0 800C2CE0 2000BF8F */  lw         $ra, 0x20($sp)
/* B34E4 800C2CE4 1C00B38F */  lw         $s3, 0x1C($sp)
/* B34E8 800C2CE8 1800B28F */  lw         $s2, 0x18($sp)
/* B34EC 800C2CEC 1400B18F */  lw         $s1, 0x14($sp)
/* B34F0 800C2CF0 1000B08F */  lw         $s0, 0x10($sp)
/* B34F4 800C2CF4 0800E003 */  jr         $ra
/* B34F8 800C2CF8 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800C2AEC, . - func_800C2AEC
