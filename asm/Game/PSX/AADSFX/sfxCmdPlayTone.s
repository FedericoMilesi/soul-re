.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sfxCmdPlayTone
/* 47BE8 800573E8 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 47BEC 800573EC 4000B4AF */  sw         $s4, 0x40($sp)
/* 47BF0 800573F0 21A08000 */  addu       $s4, $a0, $zero
/* 47BF4 800573F4 5400BFAF */  sw         $ra, 0x54($sp)
/* 47BF8 800573F8 5000BEAF */  sw         $fp, 0x50($sp)
/* 47BFC 800573FC 4C00B7AF */  sw         $s7, 0x4C($sp)
/* 47C00 80057400 4800B6AF */  sw         $s6, 0x48($sp)
/* 47C04 80057404 4400B5AF */  sw         $s5, 0x44($sp)
/* 47C08 80057408 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 47C0C 8005740C 3800B2AF */  sw         $s2, 0x38($sp)
/* 47C10 80057410 3400B1AF */  sw         $s1, 0x34($sp)
/* 47C14 80057414 3000B0AF */  sw         $s0, 0x30($sp)
/* 47C18 80057418 0400978E */  lw         $s7, 0x4($s4)
/* 47C1C 8005741C D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 47C20 80057420 FFFFE232 */  andi       $v0, $s7, 0xFFFF
/* 47C24 80057424 21108200 */  addu       $v0, $a0, $v0
/* 47C28 80057428 08084390 */  lbu        $v1, 0x808($v0)
/* 47C2C 8005742C 00000000 */  nop
/* 47C30 80057430 FE006228 */  slti       $v0, $v1, 0xFE
/* 47C34 80057434 3B004010 */  beqz       $v0, .L80057524
/* 47C38 80057438 80100300 */   sll       $v0, $v1, 2
/* 47C3C 8005743C 21104300 */  addu       $v0, $v0, $v1
/* 47C40 80057440 80100200 */  sll        $v0, $v0, 2
/* 47C44 80057444 080C4224 */  addiu      $v0, $v0, 0xC08
/* 47C48 80057448 21988200 */  addu       $s3, $a0, $v0
/* 47C4C 8005744C 02006296 */  lhu        $v0, 0x2($s3)
/* 47C50 80057450 00000000 */  nop
/* 47C54 80057454 21108200 */  addu       $v0, $a0, $v0
/* 47C58 80057458 080A4390 */  lbu        $v1, 0xA08($v0)
/* 47C5C 8005745C 00000000 */  nop
/* 47C60 80057460 FE006228 */  slti       $v0, $v1, 0xFE
/* 47C64 80057464 2F004010 */  beqz       $v0, .L80057524
/* 47C68 80057468 80100300 */   sll       $v0, $v1, 2
/* 47C6C 8005746C 21104400 */  addu       $v0, $v0, $a0
/* 47C70 80057470 0B164490 */  lbu        $a0, 0x160B($v0)
/* 47C74 80057474 9D4D010C */  jal        aadGetSramBlockAddr
/* 47C78 80057478 04007226 */   addiu     $s2, $s3, 0x4
/* 47C7C 8005747C 04006492 */  lbu        $a0, 0x4($s3)
/* 47C80 80057480 06005592 */  lbu        $s5, 0x6($s2)
/* 47C84 80057484 ED5F010C */  jal        aadAllocateVoice
/* 47C88 80057488 21B04000 */   addu      $s6, $v0, $zero
/* 47C8C 8005748C 489E9E27 */  addiu      $fp, $gp, %gp_rel(aadDummySfxProgram)
/* 47C90 80057490 21884000 */  addu       $s1, $v0, $zero
/* 47C94 80057494 23002012 */  beqz       $s1, .L80057524
/* 47C98 80057498 7F001024 */   addiu     $s0, $zero, 0x7F
/* 47C9C 8005749C 1000B0AF */  sw         $s0, 0x10($sp)
/* 47CA0 800574A0 01008292 */  lbu        $v0, 0x1($s4)
/* 47CA4 800574A4 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 47CA8 800574A8 1400A2AF */  sw         $v0, 0x14($sp)
/* 47CAC 800574AC 02008292 */  lbu        $v0, 0x2($s4)
/* 47CB0 800574B0 21204002 */  addu       $a0, $s2, $zero
/* 47CB4 800574B4 1800A2AF */  sw         $v0, 0x18($sp)
/* 47CB8 800574B8 DA016290 */  lbu        $v0, 0x1DA($v1)
/* 47CBC 800574BC 2128C002 */  addu       $a1, $s6, $zero
/* 47CC0 800574C0 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 47CC4 800574C4 1C00628C */  lw         $v0, 0x1C($v1)
/* 47CC8 800574C8 2130C003 */  addu       $a2, $fp, $zero
/* 47CCC 800574CC 2400B1AF */  sw         $s1, 0x24($sp)
/* 47CD0 800574D0 2000A2AF */  sw         $v0, 0x20($sp)
/* 47CD4 800574D4 08008286 */  lh         $v0, 0x8($s4)
/* 47CD8 800574D8 2138A002 */  addu       $a3, $s5, $zero
/* 47CDC 800574DC 5460010C */  jal        aadPlayTone
/* 47CE0 800574E0 2800A2AF */   sw        $v0, 0x28($sp)
/* 47CE4 800574E4 D0000224 */  addiu      $v0, $zero, 0xD0
/* 47CE8 800574E8 040037AE */  sw         $s7, 0x4($s1)
/* 47CEC 800574EC 080022A2 */  sb         $v0, 0x8($s1)
/* 47CF0 800574F0 04006292 */  lbu        $v0, 0x4($s3)
/* 47CF4 800574F4 0A0035A2 */  sb         $s5, 0xA($s1)
/* 47CF8 800574F8 090022A2 */  sb         $v0, 0x9($s1)
/* 47CFC 800574FC 01004292 */  lbu        $v0, 0x1($s2)
/* 47D00 80057500 0E0030A2 */  sb         $s0, 0xE($s1)
/* 47D04 80057504 0C0022A2 */  sb         $v0, 0xC($s1)
/* 47D08 80057508 01008292 */  lbu        $v0, 0x1($s4)
/* 47D0C 8005750C 00000000 */  nop
/* 47D10 80057510 0F0022A2 */  sb         $v0, 0xF($s1)
/* 47D14 80057514 02008292 */  lbu        $v0, 0x2($s4)
/* 47D18 80057518 18003EAE */  sw         $fp, 0x18($s1)
/* 47D1C 8005751C 140032AE */  sw         $s2, 0x14($s1)
/* 47D20 80057520 100022A2 */  sb         $v0, 0x10($s1)
.L80057524:
/* 47D24 80057524 5400BF8F */  lw         $ra, 0x54($sp)
/* 47D28 80057528 5000BE8F */  lw         $fp, 0x50($sp)
/* 47D2C 8005752C 4C00B78F */  lw         $s7, 0x4C($sp)
/* 47D30 80057530 4800B68F */  lw         $s6, 0x48($sp)
/* 47D34 80057534 4400B58F */  lw         $s5, 0x44($sp)
/* 47D38 80057538 4000B48F */  lw         $s4, 0x40($sp)
/* 47D3C 8005753C 3C00B38F */  lw         $s3, 0x3C($sp)
/* 47D40 80057540 3800B28F */  lw         $s2, 0x38($sp)
/* 47D44 80057544 3400B18F */  lw         $s1, 0x34($sp)
/* 47D48 80057548 3000B08F */  lw         $s0, 0x30($sp)
/* 47D4C 8005754C 0800E003 */  jr         $ra
/* 47D50 80057550 5800BD27 */   addiu     $sp, $sp, 0x58
.size sfxCmdPlayTone, . - sfxCmdPlayTone
