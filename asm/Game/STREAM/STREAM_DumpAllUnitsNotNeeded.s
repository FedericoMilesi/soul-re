.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DumpAllUnitsNotNeeded
/* 4B880 8005B080 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4B884 8005B084 1400B1AF */  sw         $s1, 0x14($sp)
/* 4B888 8005B088 21880000 */  addu       $s1, $zero, $zero
/* 4B88C 8005B08C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4B890 8005B090 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
/* 4B894 8005B094 1800BFAF */  sw         $ra, 0x18($sp)
.L8005B098:
/* 4B898 8005B098 04000286 */  lh         $v0, 0x4($s0)
/* 4B89C 8005B09C 00000000 */  nop
/* 4B8A0 8005B0A0 08004010 */  beqz       $v0, .L8005B0C4
/* 4B8A4 8005B0A4 00000000 */   nop
/* 4B8A8 8005B0A8 2000038E */  lw         $v1, 0x20($s0)
/* 4B8AC 8005B0AC F0BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x128)($gp)
/* 4B8B0 8005B0B0 00000000 */  nop
/* 4B8B4 8005B0B4 03006210 */  beq        $v1, $v0, .L8005B0C4
/* 4B8B8 8005B0B8 21200002 */   addu      $a0, $s0, $zero
/* 4B8BC 8005B0BC A76B010C */  jal        STREAM_DumpUnit
/* 4B8C0 8005B0C0 01000524 */   addiu     $a1, $zero, 0x1
.L8005B0C4:
/* 4B8C4 8005B0C4 01003126 */  addiu      $s1, $s1, 0x1
/* 4B8C8 8005B0C8 1000222A */  slti       $v0, $s1, 0x10
/* 4B8CC 8005B0CC F2FF4014 */  bnez       $v0, .L8005B098
/* 4B8D0 8005B0D0 40001026 */   addiu     $s0, $s0, 0x40
/* 4B8D4 8005B0D4 1800BF8F */  lw         $ra, 0x18($sp)
/* 4B8D8 8005B0D8 1400B18F */  lw         $s1, 0x14($sp)
/* 4B8DC 8005B0DC 1000B08F */  lw         $s0, 0x10($sp)
/* 4B8E0 8005B0E0 0800E003 */  jr         $ra
/* 4B8E4 8005B0E4 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_DumpAllUnitsNotNeeded, . - STREAM_DumpAllUnitsNotNeeded
