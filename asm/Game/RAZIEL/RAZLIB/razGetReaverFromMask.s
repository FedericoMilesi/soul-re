.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razGetReaverFromMask
/* 967F4 800A5FF4 82220400 */  srl        $a0, $a0, 10
/* 967F8 800A5FF8 FF008430 */  andi       $a0, $a0, 0xFF
/* 967FC 800A5FFC 04008010 */  beqz       $a0, .L800A6010
/* 96800 800A6000 21100000 */   addu      $v0, $zero, $zero
.L800A6004:
/* 96804 800A6004 43200400 */  sra        $a0, $a0, 1
/* 96808 800A6008 FEFF8014 */  bnez       $a0, .L800A6004
/* 9680C 800A600C 01004224 */   addiu     $v0, $v0, 0x1
.L800A6010:
/* 96810 800A6010 0800E003 */  jr         $ra
/* 96814 800A6014 00000000 */   nop
.size razGetReaverFromMask, . - razGetReaverFromMask
