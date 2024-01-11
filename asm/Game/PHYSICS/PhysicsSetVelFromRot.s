.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysicsSetVelFromRot
/* 68348 80077B48 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 6834C 80077B4C 4000B0AF */  sw         $s0, 0x40($sp)
/* 68350 80077B50 21808000 */  addu       $s0, $a0, $zero
/* 68354 80077B54 74000426 */  addiu      $a0, $s0, 0x74
/* 68358 80077B58 1000A527 */  addiu      $a1, $sp, 0x10
/* 6835C 80077B5C 23300600 */  negu       $a2, $a2
/* 68360 80077B60 4400BFAF */  sw         $ra, 0x44($sp)
/* 68364 80077B64 3000A0A7 */  sh         $zero, 0x30($sp)
/* 68368 80077B68 3200A6A7 */  sh         $a2, 0x32($sp)
/* 6836C 80077B6C 3DE3010C */  jal        RotMatrix
/* 68370 80077B70 3400A0A7 */   sh        $zero, 0x34($sp)
/* 68374 80077B74 1000A427 */  addiu      $a0, $sp, 0x10
/* 68378 80077B78 3000A527 */  addiu      $a1, $sp, 0x30
/* 6837C 80077B7C 0EF3020C */  jal        ApplyMatrixSV
/* 68380 80077B80 3800A627 */   addiu     $a2, $sp, 0x38
/* 68384 80077B84 3800A287 */  lh         $v0, 0x38($sp)
/* 68388 80077B88 00000000 */  nop
/* 6838C 80077B8C 740102AE */  sw         $v0, 0x174($s0)
/* 68390 80077B90 3A00A287 */  lh         $v0, 0x3A($sp)
/* 68394 80077B94 00000000 */  nop
/* 68398 80077B98 780102AE */  sw         $v0, 0x178($s0)
/* 6839C 80077B9C 3C00A287 */  lh         $v0, 0x3C($sp)
/* 683A0 80077BA0 00000000 */  nop
/* 683A4 80077BA4 7C0102AE */  sw         $v0, 0x17C($s0)
/* 683A8 80077BA8 4400BF8F */  lw         $ra, 0x44($sp)
/* 683AC 80077BAC 4000B08F */  lw         $s0, 0x40($sp)
/* 683B0 80077BB0 0800E003 */  jr         $ra
/* 683B4 80077BB4 4800BD27 */   addiu     $sp, $sp, 0x48
.size PhysicsSetVelFromRot, . - PhysicsSetVelFromRot
