.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razRotateUpperBody
/* 95C2C 800A542C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 95C30 800A5430 2400B3AF */  sw         $s3, 0x24($sp)
/* 95C34 800A5434 21988000 */  addu       $s3, $a0, $zero
/* 95C38 800A5438 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 95C3C 800A543C 2800B4AF */  sw         $s4, 0x28($sp)
/* 95C40 800A5440 2000B2AF */  sw         $s2, 0x20($sp)
/* 95C44 800A5444 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 95C48 800A5448 1800B0AF */  sw         $s0, 0x18($sp)
/* 95C4C 800A544C 0000A48C */  lw         $a0, 0x0($a1)
/* 95C50 800A5450 0800A284 */  lh         $v0, 0x8($a1)
/* 95C54 800A5454 00008684 */  lh         $a2, 0x0($a0)
/* 95C58 800A5458 0800A394 */  lhu        $v1, 0x8($a1)
/* 95C5C 800A545C 2A10C200 */  slt        $v0, $a2, $v0
/* 95C60 800A5460 06004014 */  bnez       $v0, .L800A547C
/* 95C64 800A5464 00000000 */   nop
/* 95C68 800A5468 0A00A284 */  lh         $v0, 0xA($a1)
/* 95C6C 800A546C 0A00A394 */  lhu        $v1, 0xA($a1)
/* 95C70 800A5470 2A104600 */  slt        $v0, $v0, $a2
/* 95C74 800A5474 02004010 */  beqz       $v0, .L800A5480
/* 95C78 800A5478 00000000 */   nop
.L800A547C:
/* 95C7C 800A547C 000083A4 */  sh         $v1, 0x0($a0)
.L800A5480:
/* 95C80 800A5480 0400A48C */  lw         $a0, 0x4($a1)
/* 95C84 800A5484 0C00A284 */  lh         $v0, 0xC($a1)
/* 95C88 800A5488 00008684 */  lh         $a2, 0x0($a0)
/* 95C8C 800A548C 0C00A394 */  lhu        $v1, 0xC($a1)
/* 95C90 800A5490 2A10C200 */  slt        $v0, $a2, $v0
/* 95C94 800A5494 06004014 */  bnez       $v0, .L800A54B0
/* 95C98 800A5498 00000000 */   nop
/* 95C9C 800A549C 0E00A284 */  lh         $v0, 0xE($a1)
/* 95CA0 800A54A0 0E00A394 */  lhu        $v1, 0xE($a1)
/* 95CA4 800A54A4 2A104600 */  slt        $v0, $v0, $a2
/* 95CA8 800A54A8 02004010 */  beqz       $v0, .L800A54B4
/* 95CAC 800A54AC 00000000 */   nop
.L800A54B0:
/* 95CB0 800A54B0 000083A4 */  sh         $v1, 0x0($a0)
.L800A54B4:
/* 95CB4 800A54B4 0000A28C */  lw         $v0, 0x0($a1)
/* 95CB8 800A54B8 0400A38C */  lw         $v1, 0x4($a1)
/* 95CBC 800A54BC 00005084 */  lh         $s0, 0x0($v0)
/* 95CC0 800A54C0 00007194 */  lhu        $s1, 0x0($v1)
/* 95CC4 800A54C4 1000A427 */  addiu      $a0, $sp, 0x10
/* 95CC8 800A54C8 1200A0A7 */  sh         $zero, 0x12($sp)
/* 95CCC 800A54CC 23801000 */  negu       $s0, $s0
/* 95CD0 800A54D0 C3A71000 */  sra        $s4, $s0, 31
/* 95CD4 800A54D4 23101402 */  subu       $v0, $s0, $s4
/* 95CD8 800A54D8 43100200 */  sra        $v0, $v0, 1
/* 95CDC 800A54DC 008C1100 */  sll        $s1, $s1, 16
/* 95CE0 800A54E0 03941100 */  sra        $s2, $s1, 16
/* 95CE4 800A54E4 C38F1100 */  sra        $s1, $s1, 31
/* 95CE8 800A54E8 1000A2A7 */  sh         $v0, 0x10($sp)
/* 95CEC 800A54EC 23105102 */  subu       $v0, $s2, $s1
/* 95CF0 800A54F0 43100200 */  sra        $v0, $v0, 1
/* 95CF4 800A54F4 95E8000C */  jal        MATH3D_ZYXtoXYZ
/* 95CF8 800A54F8 1400A2A7 */   sh        $v0, 0x14($sp)
/* 95CFC 800A54FC C8017326 */  addiu      $s3, $s3, 0x1C8
/* 95D00 800A5500 21206002 */  addu       $a0, $s3, $zero
/* 95D04 800A5504 0E000524 */  addiu      $a1, $zero, 0xE
/* 95D08 800A5508 2130A000 */  addu       $a2, $a1, $zero
/* 95D0C 800A550C 7D42020C */  jal        G2Anim_SetController_Vector
/* 95D10 800A5510 1000A727 */   addiu     $a3, $sp, 0x10
/* 95D14 800A5514 EB51023C */  lui        $v0, (0x51EB851F >> 16)
/* 95D18 800A5518 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
/* 95D1C 800A551C 00191000 */  sll        $v1, $s0, 4
/* 95D20 800A5520 23187000 */  subu       $v1, $v1, $s0
/* 95D24 800A5524 40180300 */  sll        $v1, $v1, 1
/* 95D28 800A5528 18006200 */  mult       $v1, $v0
/* 95D2C 800A552C 00291200 */  sll        $a1, $s2, 4
/* 95D30 800A5530 10480000 */  mfhi       $t1
/* 95D34 800A5534 2328B200 */  subu       $a1, $a1, $s2
/* 95D38 800A5538 40280500 */  sll        $a1, $a1, 1
/* 95D3C 800A553C 1800A200 */  mult       $a1, $v0
/* 95D40 800A5540 1000A427 */  addiu      $a0, $sp, 0x10
/* 95D44 800A5544 C31F0300 */  sra        $v1, $v1, 31
/* 95D48 800A5548 1200A0A7 */  sh         $zero, 0x12($sp)
/* 95D4C 800A554C 43110900 */  sra        $v0, $t1, 5
/* 95D50 800A5550 23104300 */  subu       $v0, $v0, $v1
/* 95D54 800A5554 C32F0500 */  sra        $a1, $a1, 31
/* 95D58 800A5558 1000A2A7 */  sh         $v0, 0x10($sp)
/* 95D5C 800A555C 10300000 */  mfhi       $a2
/* 95D60 800A5560 43110600 */  sra        $v0, $a2, 5
/* 95D64 800A5564 23104500 */  subu       $v0, $v0, $a1
/* 95D68 800A5568 95E8000C */  jal        MATH3D_ZYXtoXYZ
/* 95D6C 800A556C 1400A2A7 */   sh        $v0, 0x14($sp)
/* 95D70 800A5570 21206002 */  addu       $a0, $s3, $zero
/* 95D74 800A5574 10000524 */  addiu      $a1, $zero, 0x10
/* 95D78 800A5578 0E000624 */  addiu      $a2, $zero, 0xE
/* 95D7C 800A557C 7D42020C */  jal        G2Anim_SetController_Vector
/* 95D80 800A5580 2138A503 */   addu      $a3, $sp, $a1
/* 95D84 800A5584 6666023C */  lui        $v0, (0x66666667 >> 16)
/* 95D88 800A5588 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
/* 95D8C 800A558C 18000202 */  mult       $s0, $v0
/* 95D90 800A5590 10480000 */  mfhi       $t1
/* 95D94 800A5594 00000000 */  nop
/* 95D98 800A5598 00000000 */  nop
/* 95D9C 800A559C 18004202 */  mult       $s2, $v0
/* 95DA0 800A55A0 1000A427 */  addiu      $a0, $sp, 0x10
/* 95DA4 800A55A4 1200A0A7 */  sh         $zero, 0x12($sp)
/* 95DA8 800A55A8 43100900 */  sra        $v0, $t1, 1
/* 95DAC 800A55AC 23105400 */  subu       $v0, $v0, $s4
/* 95DB0 800A55B0 1000A2A7 */  sh         $v0, 0x10($sp)
/* 95DB4 800A55B4 10180000 */  mfhi       $v1
/* 95DB8 800A55B8 43100300 */  sra        $v0, $v1, 1
/* 95DBC 800A55BC 23105100 */  subu       $v0, $v0, $s1
/* 95DC0 800A55C0 95E8000C */  jal        MATH3D_ZYXtoXYZ
/* 95DC4 800A55C4 1400A2A7 */   sh        $v0, 0x14($sp)
/* 95DC8 800A55C8 21206002 */  addu       $a0, $s3, $zero
/* 95DCC 800A55CC 11000524 */  addiu      $a1, $zero, 0x11
/* 95DD0 800A55D0 0E000624 */  addiu      $a2, $zero, 0xE
/* 95DD4 800A55D4 7D42020C */  jal        G2Anim_SetController_Vector
/* 95DD8 800A55D8 1000A727 */   addiu     $a3, $sp, 0x10
/* 95DDC 800A55DC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 95DE0 800A55E0 2800B48F */  lw         $s4, 0x28($sp)
/* 95DE4 800A55E4 2400B38F */  lw         $s3, 0x24($sp)
/* 95DE8 800A55E8 2000B28F */  lw         $s2, 0x20($sp)
/* 95DEC 800A55EC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 95DF0 800A55F0 1800B08F */  lw         $s0, 0x18($sp)
/* 95DF4 800A55F4 0800E003 */  jr         $ra
/* 95DF8 800A55F8 3000BD27 */   addiu     $sp, $sp, 0x30
.size razRotateUpperBody, . - razRotateUpperBody
