.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razUpdateSoundRamp
/* 9843C 800A7C3C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 98440 800A7C40 1800B0AF */  sw         $s0, 0x18($sp)
/* 98444 800A7C44 2180A000 */  addu       $s0, $a1, $zero
/* 98448 800A7C48 2000BFAF */  sw         $ra, 0x20($sp)
/* 9844C 800A7C4C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 98450 800A7C50 0000028E */  lw         $v0, 0x0($s0)
/* 98454 800A7C54 00000000 */  nop
/* 98458 800A7C58 33004010 */  beqz       $v0, .L800A7D28
/* 9845C 800A7C5C 21880000 */   addu      $s1, $zero, $zero
/* 98460 800A7C60 0400028E */  lw         $v0, 0x4($s0)
/* 98464 800A7C64 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 98468 800A7C68 0800088E */  lw         $t0, 0x8($s0)
/* 9846C 800A7C6C 21104300 */  addu       $v0, $v0, $v1
/* 98470 800A7C70 040002AE */  sw         $v0, 0x4($s0)
/* 98474 800A7C74 2A100201 */  slt        $v0, $t0, $v0
/* 98478 800A7C78 02004010 */  beqz       $v0, .L800A7C84
/* 9847C 800A7C7C 00000000 */   nop
/* 98480 800A7C80 040008AE */  sw         $t0, 0x4($s0)
.L800A7C84:
/* 98484 800A7C84 29000011 */  beqz       $t0, .L800A7D2C
/* 98488 800A7C88 21102002 */   addu      $v0, $s1, $zero
/* 9848C 800A7C8C 0400068E */  lw         $a2, 0x4($s0)
/* 98490 800A7C90 00000000 */  nop
/* 98494 800A7C94 2A100601 */  slt        $v0, $t0, $a2
/* 98498 800A7C98 24004014 */  bnez       $v0, .L800A7D2C
/* 9849C 800A7C9C 21102002 */   addu      $v0, $s1, $zero
/* 984A0 800A7CA0 14000586 */  lh         $a1, 0x14($s0)
/* 984A4 800A7CA4 16000286 */  lh         $v0, 0x16($s0)
/* 984A8 800A7CA8 00000000 */  nop
/* 984AC 800A7CAC 23104500 */  subu       $v0, $v0, $a1
/* 984B0 800A7CB0 18004600 */  mult       $v0, $a2
/* 984B4 800A7CB4 12180000 */  mflo       $v1
/* 984B8 800A7CB8 00000000 */  nop
/* 984BC 800A7CBC 00000000 */  nop
/* 984C0 800A7CC0 1A006800 */  div        $zero, $v1, $t0
/* 984C4 800A7CC4 12380000 */  mflo       $a3
/* 984C8 800A7CC8 10000386 */  lh         $v1, 0x10($s0)
/* 984CC 800A7CCC 12000286 */  lh         $v0, 0x12($s0)
/* 984D0 800A7CD0 00000000 */  nop
/* 984D4 800A7CD4 23104300 */  subu       $v0, $v0, $v1
/* 984D8 800A7CD8 18004600 */  mult       $v0, $a2
/* 984DC 800A7CDC 12500000 */  mflo       $t2
/* 984E0 800A7CE0 00000000 */  nop
/* 984E4 800A7CE4 00000000 */  nop
/* 984E8 800A7CE8 1A004801 */  div        $zero, $t2, $t0
/* 984EC 800A7CEC 12300000 */  mflo       $a2
/* 984F0 800A7CF0 0C00028E */  lw         $v0, 0xC($s0)
/* 984F4 800A7CF4 5C008424 */  addiu      $a0, $a0, 0x5C
/* 984F8 800A7CF8 1000A2AF */  sw         $v0, 0x10($sp)
/* 984FC 800A7CFC 2188A700 */  addu       $s1, $a1, $a3
/* 98500 800A7D00 21382002 */  addu       $a3, $s1, $zero
/* 98504 800A7D04 0000058E */  lw         $a1, 0x0($s0)
/* 98508 800A7D08 A200010C */  jal        SOUND_Update3dSound
/* 9850C 800A7D0C 21306600 */   addu      $a2, $v1, $a2
/* 98510 800A7D10 06004014 */  bnez       $v0, .L800A7D2C
/* 98514 800A7D14 21102002 */   addu      $v0, $s1, $zero
/* 98518 800A7D18 0000048E */  lw         $a0, 0x0($s0)
/* 9851C 800A7D1C 1C02010C */  jal        SndEndLoop
/* 98520 800A7D20 00000000 */   nop
/* 98524 800A7D24 000000AE */  sw         $zero, 0x0($s0)
.L800A7D28:
/* 98528 800A7D28 21102002 */  addu       $v0, $s1, $zero
.L800A7D2C:
/* 9852C 800A7D2C 2000BF8F */  lw         $ra, 0x20($sp)
/* 98530 800A7D30 1C00B18F */  lw         $s1, 0x1C($sp)
/* 98534 800A7D34 1800B08F */  lw         $s0, 0x18($sp)
/* 98538 800A7D38 0800E003 */  jr         $ra
/* 9853C 800A7D3C 2800BD27 */   addiu     $sp, $sp, 0x28
.size razUpdateSoundRamp, . - razUpdateSoundRamp
