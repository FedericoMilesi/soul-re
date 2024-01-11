.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DoObjectLoadAndDump
/* 4A804 8005A004 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4A808 8005A008 1000BFAF */  sw         $ra, 0x10($sp)
/* 4A80C 8005A00C 21200000 */  addu       $a0, $zero, $zero
/* 4A810 8005A010 01000524 */  addiu      $a1, $zero, 0x1
/* 4A814 8005A014 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
.L8005A018:
/* 4A818 8005A018 04006284 */  lh         $v0, 0x4($v1)
/* 4A81C 8005A01C 00000000 */  nop
/* 4A820 8005A020 06004510 */  beq        $v0, $a1, .L8005A03C
/* 4A824 8005A024 01008424 */   addiu     $a0, $a0, 0x1
/* 4A828 8005A028 10008228 */  slti       $v0, $a0, 0x10
/* 4A82C 8005A02C FAFF4014 */  bnez       $v0, .L8005A018
/* 4A830 8005A030 40006324 */   addiu     $v1, $v1, 0x40
/* 4A834 8005A034 5665010C */  jal        STREAM_RemoveAllObjectsNotInUse
/* 4A838 8005A038 00000000 */   nop
.L8005A03C:
/* 4A83C 8005A03C 1000BF8F */  lw         $ra, 0x10($sp)
/* 4A840 8005A040 00000000 */  nop
/* 4A844 8005A044 0800E003 */  jr         $ra
/* 4A848 8005A048 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_DoObjectLoadAndDump, . - STREAM_DoObjectLoadAndDump
