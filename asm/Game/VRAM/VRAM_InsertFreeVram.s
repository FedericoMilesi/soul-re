.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_InsertFreeVram
/* 63C60 80073460 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 63C64 80073464 2400B3AF */  sw         $s3, 0x24($sp)
/* 63C68 80073468 21988000 */  addu       $s3, $a0, $zero
/* 63C6C 8007346C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 63C70 80073470 21A8A000 */  addu       $s5, $a1, $zero
/* 63C74 80073474 2000B2AF */  sw         $s2, 0x20($sp)
/* 63C78 80073478 2190C000 */  addu       $s2, $a2, $zero
/* 63C7C 8007347C 2800B4AF */  sw         $s4, 0x28($sp)
/* 63C80 80073480 21A0E000 */  addu       $s4, $a3, $zero
/* 63C84 80073484 3400B7AF */  sw         $s7, 0x34($sp)
/* 63C88 80073488 21B84002 */  addu       $s7, $s2, $zero
/* 63C8C 8007348C 3800BEAF */  sw         $fp, 0x38($sp)
/* 63C90 80073490 21F08002 */  addu       $fp, $s4, $zero
/* 63C94 80073494 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 63C98 80073498 3F007132 */  andi       $s1, $s3, 0x3F
/* 63C9C 8007349C 3000B6AF */  sw         $s6, 0x30($sp)
/* 63CA0 800734A0 5000B697 */  lhu        $s6, 0x50($sp)
/* 63CA4 800734A4 21102002 */  addu       $v0, $s1, $zero
/* 63CA8 800734A8 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 63CAC 800734AC 1800B0AF */  sw         $s0, 0x18($sp)
/* 63CB0 800734B0 1000B3A7 */  sh         $s3, 0x10($sp)
/* 63CB4 800734B4 2E004010 */  beqz       $v0, .L80073570
/* 63CB8 800734B8 1200B5A7 */   sh        $s5, 0x12($sp)
/* 63CBC 800734BC 001C1200 */  sll        $v1, $s2, 16
/* 63CC0 800734C0 031C0300 */  sra        $v1, $v1, 16
/* 63CC4 800734C4 40001024 */  addiu      $s0, $zero, 0x40
/* 63CC8 800734C8 23100202 */  subu       $v0, $s0, $v0
/* 63CCC 800734CC 2A104300 */  slt        $v0, $v0, $v1
/* 63CD0 800734D0 27004010 */  beqz       $v0, .L80073570
/* 63CD4 800734D4 00000000 */   nop
/* 63CD8 800734D8 BFCC010C */  jal        VRAM_GetOpenBlock
/* 63CDC 800734DC 00000000 */   nop
/* 63CE0 800734E0 21204000 */  addu       $a0, $v0, $zero
/* 63CE4 800734E4 23101102 */  subu       $v0, $s0, $s1
/* 63CE8 800734E8 00841400 */  sll        $s0, $s4, 16
/* 63CEC 800734EC 100082A4 */  sh         $v0, 0x10($a0)
/* 63CF0 800734F0 10008284 */  lh         $v0, 0x10($a0)
/* 63CF4 800734F4 03841000 */  sra        $s0, $s0, 16
/* 63CF8 800734F8 18005000 */  mult       $v0, $s0
/* 63CFC 800734FC 000080AC */  sw         $zero, 0x0($a0)
/* 63D00 80073500 050096A0 */  sb         $s6, 0x5($a0)
/* 63D04 80073504 060080A4 */  sh         $zero, 0x6($a0)
/* 63D08 80073508 080080AC */  sw         $zero, 0x8($a0)
/* 63D0C 8007350C 0C0093A4 */  sh         $s3, 0xC($a0)
/* 63D10 80073510 0E0095A4 */  sh         $s5, 0xE($a0)
/* 63D14 80073514 120094A4 */  sh         $s4, 0x12($a0)
/* 63D18 80073518 12400000 */  mflo       $t0
/* 63D1C 8007351C 5BCC010C */  jal        VRAM_InsertFreeBlock
/* 63D20 80073520 140088AC */   sw        $t0, 0x14($a0)
/* 63D24 80073524 BFCC010C */  jal        VRAM_GetOpenBlock
/* 63D28 80073528 00000000 */   nop
/* 63D2C 8007352C 21204000 */  addu       $a0, $v0, $zero
/* 63D30 80073530 C0FF4226 */  addiu      $v0, $s2, -0x40
/* 63D34 80073534 21105100 */  addu       $v0, $v0, $s1
/* 63D38 80073538 100082A4 */  sh         $v0, 0x10($a0)
/* 63D3C 8007353C 10008284 */  lh         $v0, 0x10($a0)
/* 63D40 80073540 00000000 */  nop
/* 63D44 80073544 18005000 */  mult       $v0, $s0
/* 63D48 80073548 000080AC */  sw         $zero, 0x0($a0)
/* 63D4C 8007354C 050096A0 */  sb         $s6, 0x5($a0)
/* 63D50 80073550 060080A4 */  sh         $zero, 0x6($a0)
/* 63D54 80073554 080080AC */  sw         $zero, 0x8($a0)
/* 63D58 80073558 0E0095A4 */  sh         $s5, 0xE($a0)
/* 63D5C 8007355C 120094A4 */  sh         $s4, 0x12($a0)
/* 63D60 80073560 40006226 */  addiu      $v0, $s3, 0x40
/* 63D64 80073564 23105100 */  subu       $v0, $v0, $s1
/* 63D68 80073568 70CD0108 */  j          .L800735C0
/* 63D6C 8007356C 0C0082A4 */   sh        $v0, 0xC($a0)
.L80073570:
/* 63D70 80073570 BFCC010C */  jal        VRAM_GetOpenBlock
/* 63D74 80073574 00000000 */   nop
/* 63D78 80073578 00241700 */  sll        $a0, $s7, 16
/* 63D7C 8007357C 03240400 */  sra        $a0, $a0, 16
/* 63D80 80073580 001C1E00 */  sll        $v1, $fp, 16
/* 63D84 80073584 031C0300 */  sra        $v1, $v1, 16
/* 63D88 80073588 18008300 */  mult       $a0, $v1
/* 63D8C 8007358C 21204000 */  addu       $a0, $v0, $zero
/* 63D90 80073590 000080AC */  sw         $zero, 0x0($a0)
/* 63D94 80073594 050096A0 */  sb         $s6, 0x5($a0)
/* 63D98 80073598 060080A4 */  sh         $zero, 0x6($a0)
/* 63D9C 8007359C 080080AC */  sw         $zero, 0x8($a0)
/* 63DA0 800735A0 1000A897 */  lhu        $t0, 0x10($sp)
/* 63DA4 800735A4 00000000 */  nop
/* 63DA8 800735A8 0C0088A4 */  sh         $t0, 0xC($a0)
/* 63DAC 800735AC 1200A897 */  lhu        $t0, 0x12($sp)
/* 63DB0 800735B0 00000000 */  nop
/* 63DB4 800735B4 0E0088A4 */  sh         $t0, 0xE($a0)
/* 63DB8 800735B8 100097A4 */  sh         $s7, 0x10($a0)
/* 63DBC 800735BC 12009EA4 */  sh         $fp, 0x12($a0)
.L800735C0:
/* 63DC0 800735C0 12400000 */  mflo       $t0
/* 63DC4 800735C4 5BCC010C */  jal        VRAM_InsertFreeBlock
/* 63DC8 800735C8 140088AC */   sw        $t0, 0x14($a0)
/* 63DCC 800735CC 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 63DD0 800735D0 3800BE8F */  lw         $fp, 0x38($sp)
/* 63DD4 800735D4 3400B78F */  lw         $s7, 0x34($sp)
/* 63DD8 800735D8 3000B68F */  lw         $s6, 0x30($sp)
/* 63DDC 800735DC 2C00B58F */  lw         $s5, 0x2C($sp)
/* 63DE0 800735E0 2800B48F */  lw         $s4, 0x28($sp)
/* 63DE4 800735E4 2400B38F */  lw         $s3, 0x24($sp)
/* 63DE8 800735E8 2000B28F */  lw         $s2, 0x20($sp)
/* 63DEC 800735EC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 63DF0 800735F0 1800B08F */  lw         $s0, 0x18($sp)
/* 63DF4 800735F4 01000224 */  addiu      $v0, $zero, 0x1
/* 63DF8 800735F8 0800E003 */  jr         $ra
/* 63DFC 800735FC 4000BD27 */   addiu     $sp, $sp, 0x40
.size VRAM_InsertFreeVram, . - VRAM_InsertFreeVram
