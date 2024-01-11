.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_SetUpQueueEntry
/* 50DC0 800605C0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 50DC4 800605C4 4400A28F */  lw         $v0, 0x44($sp)
/* 50DC8 800605C8 1800B2AF */  sw         $s2, 0x18($sp)
/* 50DCC 800605CC 4000B28F */  lw         $s2, 0x40($sp)
/* 50DD0 800605D0 1400B1AF */  sw         $s1, 0x14($sp)
/* 50DD4 800605D4 21888000 */  addu       $s1, $a0, $zero
/* 50DD8 800605D8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 50DDC 800605DC 2198A000 */  addu       $s3, $a1, $zero
/* 50DE0 800605E0 2000B4AF */  sw         $s4, 0x20($sp)
/* 50DE4 800605E4 21A0C000 */  addu       $s4, $a2, $zero
/* 50DE8 800605E8 2400B5AF */  sw         $s5, 0x24($sp)
/* 50DEC 800605EC 21A8E000 */  addu       $s5, $a3, $zero
/* 50DF0 800605F0 2800BFAF */  sw         $ra, 0x28($sp)
/* 50DF4 800605F4 05004010 */  beqz       $v0, .L8006060C
/* 50DF8 800605F8 1000B0AF */   sw        $s0, 0x10($sp)
/* 50DFC 800605FC 4080010C */  jal        STREAM_AddQueueEntryToHead
/* 50E00 80060600 00000000 */   nop
/* 50E04 80060604 86810108 */  j          .L80060618
/* 50E08 80060608 21804000 */   addu      $s0, $v0, $zero
.L8006060C:
/* 50E0C 8006060C 2580010C */  jal        STREAM_AddQueueEntryToTail
/* 50E10 80060610 00000000 */   nop
/* 50E14 80060614 21804000 */  addu       $s0, $v0, $zero
.L80060618:
/* 50E18 80060618 3C000426 */  addiu      $a0, $s0, 0x3C
/* 50E1C 8006061C 1CF4020C */  jal        func_800BD070
/* 50E20 80060620 21282002 */   addu      $a1, $s1, $zero
/* 50E24 80060624 75DF000C */  jal        LOAD_HashName
/* 50E28 80060628 21202002 */   addu      $a0, $s1, $zero
/* 50E2C 8006062C 20E1000C */  jal        LOAD_GetSearchDirectory
/* 50E30 80060630 080002AE */   sw        $v0, 0x8($s0)
/* 50E34 80060634 0C0002AE */  sw         $v0, 0xC($s0)
/* 50E38 80060638 01000224 */  addiu      $v0, $zero, 0x1
/* 50E3C 8006063C 280000AE */  sw         $zero, 0x28($s0)
/* 50E40 80060640 20E1000C */  jal        LOAD_GetSearchDirectory
/* 50E44 80060644 200002AE */   sw        $v0, 0x20($s0)
/* 50E48 80060648 08004010 */  beqz       $v0, .L8006066C
/* 50E4C 8006064C 00000000 */   nop
/* 50E50 80060650 20E1000C */  jal        LOAD_GetSearchDirectory
/* 50E54 80060654 00000000 */   nop
/* 50E58 80060658 0C0002AE */  sw         $v0, 0xC($s0)
/* 50E5C 8006065C 1DE1000C */  jal        LOAD_SetSearchDirectory
/* 50E60 80060660 21200000 */   addu      $a0, $zero, $zero
/* 50E64 80060664 9F810108 */  j          .L8006067C
/* 50E68 80060668 2C0013AE */   sw        $s3, 0x2C($s0)
.L8006066C:
/* 50E6C 8006066C E4A3828F */  lw         $v0, %gp_rel(gCurDir)($gp)
/* 50E70 80060670 00000000 */  nop
/* 50E74 80060674 0C0002AE */  sw         $v0, 0xC($s0)
/* 50E78 80060678 2C0013AE */  sw         $s3, 0x2C($s0)
.L8006067C:
/* 50E7C 8006067C 300014AE */  sw         $s4, 0x30($s0)
/* 50E80 80060680 340015AE */  sw         $s5, 0x34($s0)
/* 50E84 80060684 04004012 */  beqz       $s2, .L80060698
/* 50E88 80060688 380012AE */   sw        $s2, 0x38($s0)
/* 50E8C 8006068C FBFA023C */  lui        $v0, (0xFAFBFCFD >> 16)
/* 50E90 80060690 FDFC4234 */  ori        $v0, $v0, (0xFAFBFCFD & 0xFFFF)
/* 50E94 80060694 000042AE */  sw         $v0, 0x0($s2)
.L80060698:
/* 50E98 80060698 21100002 */  addu       $v0, $s0, $zero
/* 50E9C 8006069C 2800BF8F */  lw         $ra, 0x28($sp)
/* 50EA0 800606A0 2400B58F */  lw         $s5, 0x24($sp)
/* 50EA4 800606A4 2000B48F */  lw         $s4, 0x20($sp)
/* 50EA8 800606A8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 50EAC 800606AC 1800B28F */  lw         $s2, 0x18($sp)
/* 50EB0 800606B0 1400B18F */  lw         $s1, 0x14($sp)
/* 50EB4 800606B4 1000B08F */  lw         $s0, 0x10($sp)
/* 50EB8 800606B8 0800E003 */  jr         $ra
/* 50EBC 800606BC 3000BD27 */   addiu     $sp, $sp, 0x30
.size STREAM_SetUpQueueEntry, . - STREAM_SetUpQueueEntry
