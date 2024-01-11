.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CalcRotation
/* 8310 80017B10 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 8314 80017B14 2000B0AF */  sw         $s0, 0x20($sp)
/* 8318 80017B18 21808000 */  addu       $s0, $a0, $zero
/* 831C 80017B1C 2400BFAF */  sw         $ra, 0x24($sp)
/* 8320 80017B20 0000C794 */  lhu        $a3, 0x0($a2)
/* 8324 80017B24 0200C294 */  lhu        $v0, 0x2($a2)
/* 8328 80017B28 0400C394 */  lhu        $v1, 0x4($a2)
/* 832C 80017B2C 0000A494 */  lhu        $a0, 0x0($a1)
/* 8330 80017B30 0200A694 */  lhu        $a2, 0x2($a1)
/* 8334 80017B34 0400A594 */  lhu        $a1, 0x4($a1)
/* 8338 80017B38 2338E400 */  subu       $a3, $a3, $a0
/* 833C 80017B3C 1000A427 */  addiu      $a0, $sp, 0x10
/* 8340 80017B40 23104600 */  subu       $v0, $v0, $a2
/* 8344 80017B44 23186500 */  subu       $v1, $v1, $a1
/* 8348 80017B48 1000A7A7 */  sh         $a3, 0x10($sp)
/* 834C 80017B4C 020082A4 */  sh         $v0, 0x2($a0)
/* 8350 80017B50 040083A4 */  sh         $v1, 0x4($a0)
/* 8354 80017B54 1200A297 */  lhu        $v0, 0x12($sp)
/* 8358 80017B58 1800A427 */  addiu      $a0, $sp, 0x18
/* 835C 80017B5C 1800A7A7 */  sh         $a3, 0x18($sp)
/* 8360 80017B60 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 8364 80017B64 9C58000C */  jal        CAMERA_LengthSVector
/* 8368 80017B68 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 836C 80017B6C 1400A487 */  lh         $a0, 0x14($sp)
/* 8370 80017B70 26F3020C */  jal        func_800BCC98
/* 8374 80017B74 21284000 */   addu      $a1, $v0, $zero
/* 8378 80017B78 23100200 */  negu       $v0, $v0
/* 837C 80017B7C 000002A6 */  sh         $v0, 0x0($s0)
/* 8380 80017B80 020000A6 */  sh         $zero, 0x2($s0)
/* 8384 80017B84 1200A487 */  lh         $a0, 0x12($sp)
/* 8388 80017B88 1000A587 */  lh         $a1, 0x10($sp)
/* 838C 80017B8C 26F3020C */  jal        func_800BCC98
/* 8390 80017B90 00000000 */   nop
/* 8394 80017B94 00044224 */  addiu      $v0, $v0, 0x400
/* 8398 80017B98 040002A6 */  sh         $v0, 0x4($s0)
/* 839C 80017B9C 2400BF8F */  lw         $ra, 0x24($sp)
/* 83A0 80017BA0 2000B08F */  lw         $s0, 0x20($sp)
/* 83A4 80017BA4 0800E003 */  jr         $ra
/* 83A8 80017BA8 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_CalcRotation, . - CAMERA_CalcRotation
