.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CalcFSRotation
/* 83AC 80017BAC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 83B0 80017BB0 2800B0AF */  sw         $s0, 0x28($sp)
/* 83B4 80017BB4 2180A000 */  addu       $s0, $a1, $zero
/* 83B8 80017BB8 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 83BC 80017BBC 0000E594 */  lhu        $a1, 0x0($a3)
/* 83C0 80017BC0 0200E394 */  lhu        $v1, 0x2($a3)
/* 83C4 80017BC4 0400E494 */  lhu        $a0, 0x4($a3)
/* 83C8 80017BC8 0000C294 */  lhu        $v0, 0x0($a2)
/* 83CC 80017BCC 0200C794 */  lhu        $a3, 0x2($a2)
/* 83D0 80017BD0 0400C694 */  lhu        $a2, 0x4($a2)
/* 83D4 80017BD4 2328A200 */  subu       $a1, $a1, $v0
/* 83D8 80017BD8 1000A227 */  addiu      $v0, $sp, 0x10
/* 83DC 80017BDC 23186700 */  subu       $v1, $v1, $a3
/* 83E0 80017BE0 23208600 */  subu       $a0, $a0, $a2
/* 83E4 80017BE4 1000A5A7 */  sh         $a1, 0x10($sp)
/* 83E8 80017BE8 020043A4 */  sh         $v1, 0x2($v0)
/* 83EC 80017BEC 040044A4 */  sh         $a0, 0x4($v0)
/* 83F0 80017BF0 2000A227 */  addiu      $v0, $sp, 0x20
/* 83F4 80017BF4 2000A5A7 */  sh         $a1, 0x20($sp)
/* 83F8 80017BF8 020043A4 */  sh         $v1, 0x2($v0)
/* 83FC 80017BFC 040044A4 */  sh         $a0, 0x4($v0)
/* 8400 80017C00 2200A297 */  lhu        $v0, 0x22($sp)
/* 8404 80017C04 1800A427 */  addiu      $a0, $sp, 0x18
/* 8408 80017C08 1800A5A7 */  sh         $a1, 0x18($sp)
/* 840C 80017C0C 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 8410 80017C10 9C58000C */  jal        CAMERA_LengthSVector
/* 8414 80017C14 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 8418 80017C18 2400A487 */  lh         $a0, 0x24($sp)
/* 841C 80017C1C 26F3020C */  jal        ratan2
/* 8420 80017C20 21284000 */   addu      $a1, $v0, $zero
/* 8424 80017C24 23100200 */  negu       $v0, $v0
/* 8428 80017C28 000002A6 */  sh         $v0, 0x0($s0)
/* 842C 80017C2C 020000A6 */  sh         $zero, 0x2($s0)
/* 8430 80017C30 2200A487 */  lh         $a0, 0x22($sp)
/* 8434 80017C34 2000A587 */  lh         $a1, 0x20($sp)
/* 8438 80017C38 26F3020C */  jal        ratan2
/* 843C 80017C3C 00000000 */   nop
/* 8440 80017C40 00044224 */  addiu      $v0, $v0, 0x400
/* 8444 80017C44 040002A6 */  sh         $v0, 0x4($s0)
/* 8448 80017C48 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 844C 80017C4C 2800B08F */  lw         $s0, 0x28($sp)
/* 8450 80017C50 0800E003 */  jr         $ra
/* 8454 80017C54 3000BD27 */   addiu     $sp, $sp, 0x30
.size CAMERA_CalcFSRotation, . - CAMERA_CalcFSRotation
