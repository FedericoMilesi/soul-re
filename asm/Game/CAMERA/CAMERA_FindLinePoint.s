.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_FindLinePoint
/* B37C 8001AB7C B8FFBD27 */  addiu      $sp, $sp, -0x48
/* B380 8001AB80 2800B0AF */  sw         $s0, 0x28($sp)
/* B384 8001AB84 21808000 */  addu       $s0, $a0, $zero
/* B388 8001AB88 3C00B5AF */  sw         $s5, 0x3C($sp)
/* B38C 8001AB8C 21A8A000 */  addu       $s5, $a1, $zero
/* B390 8001AB90 4000B6AF */  sw         $s6, 0x40($sp)
/* B394 8001AB94 21B0C000 */  addu       $s6, $a2, $zero
/* B398 8001AB98 2C00B1AF */  sw         $s1, 0x2C($sp)
/* B39C 8001AB9C 2188E000 */  addu       $s1, $a3, $zero
/* B3A0 8001ABA0 3800B4AF */  sw         $s4, 0x38($sp)
/* B3A4 8001ABA4 21A00000 */  addu       $s4, $zero, $zero
/* B3A8 8001ABA8 1000A427 */  addiu      $a0, $sp, 0x10
/* B3AC 8001ABAC 3000B2AF */  sw         $s2, 0x30($sp)
/* B3B0 8001ABB0 1800B227 */  addiu      $s2, $sp, 0x18
/* B3B4 8001ABB4 21304002 */  addu       $a2, $s2, $zero
/* B3B8 8001ABB8 4400BFAF */  sw         $ra, 0x44($sp)
/* B3BC 8001ABBC 3400B3AF */  sw         $s3, 0x34($sp)
/* B3C0 8001ABC0 0000C296 */  lhu        $v0, 0x0($s6)
/* B3C4 8001ABC4 0200C396 */  lhu        $v1, 0x2($s6)
/* B3C8 8001ABC8 0400C796 */  lhu        $a3, 0x4($s6)
/* B3CC 8001ABCC 0000A896 */  lhu        $t0, 0x0($s5)
/* B3D0 8001ABD0 0200A996 */  lhu        $t1, 0x2($s5)
/* B3D4 8001ABD4 0400AA96 */  lhu        $t2, 0x4($s5)
/* B3D8 8001ABD8 23104800 */  subu       $v0, $v0, $t0
/* B3DC 8001ABDC 23186900 */  subu       $v1, $v1, $t1
/* B3E0 8001ABE0 2338EA00 */  subu       $a3, $a3, $t2
/* B3E4 8001ABE4 1800A2A7 */  sh         $v0, 0x18($sp)
/* B3E8 8001ABE8 040047A6 */  sh         $a3, 0x4($s2)
/* B3EC 8001ABEC 21380002 */  addu       $a3, $s0, $zero
/* B3F0 8001ABF0 5F6A000C */  jal        CAMERA_NearestPointOnLineVec
/* B3F4 8001ABF4 020043A6 */   sh        $v1, 0x2($s2)
/* B3F8 8001ABF8 1000A427 */  addiu      $a0, $sp, 0x10
/* B3FC 8001ABFC 406A000C */  jal        CAMERA_GetDistSq
/* B400 8001AC00 21280002 */   addu      $a1, $s0, $zero
/* B404 8001AC04 23882202 */  subu       $s1, $s1, $v0
/* B408 8001AC08 4300201A */  blez       $s1, .L8001AD18
/* B40C 8001AC0C 21108002 */   addu      $v0, $s4, $zero
/* B410 8001AC10 A6E7000C */  jal        MATH3D_FastSqrt0
/* B414 8001AC14 21202002 */   addu      $a0, $s1, $zero
/* B418 8001AC18 21884000 */  addu       $s1, $v0, $zero
/* B41C 8001AC1C 0663000C */  jal        CAMERA_Normalize
/* B420 8001AC20 21204002 */   addu      $a0, $s2, $zero
/* B424 8001AC24 21988002 */  addu       $s3, $s4, $zero
/* B428 8001AC28 2000B227 */  addiu      $s2, $sp, 0x20
/* B42C 8001AC2C 5800B08F */  lw         $s0, 0x58($sp)
.L8001AC30:
/* B430 8001AC30 1800A287 */  lh         $v0, 0x18($sp)
/* B434 8001AC34 00000000 */  nop
/* B438 8001AC38 18005100 */  mult       $v0, $s1
/* B43C 8001AC3C 12180000 */  mflo       $v1
/* B440 8001AC40 02006104 */  bgez       $v1, .L8001AC4C
/* B444 8001AC44 00000000 */   nop
/* B448 8001AC48 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8001AC4C:
/* B44C 8001AC4C 1A00A287 */  lh         $v0, 0x1A($sp)
/* B450 8001AC50 00000000 */  nop
/* B454 8001AC54 18005100 */  mult       $v0, $s1
/* B458 8001AC58 1000A297 */  lhu        $v0, 0x10($sp)
/* B45C 8001AC5C 031B0300 */  sra        $v1, $v1, 12
/* B460 8001AC60 21104300 */  addu       $v0, $v0, $v1
/* B464 8001AC64 12200000 */  mflo       $a0
/* B468 8001AC68 02008104 */  bgez       $a0, .L8001AC74
/* B46C 8001AC6C 2000A2A7 */   sh        $v0, 0x20($sp)
/* B470 8001AC70 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8001AC74:
/* B474 8001AC74 1C00A287 */  lh         $v0, 0x1C($sp)
/* B478 8001AC78 00000000 */  nop
/* B47C 8001AC7C 18005100 */  mult       $v0, $s1
/* B480 8001AC80 1200A297 */  lhu        $v0, 0x12($sp)
/* B484 8001AC84 031B0400 */  sra        $v1, $a0, 12
/* B488 8001AC88 21104300 */  addu       $v0, $v0, $v1
/* B48C 8001AC8C 12380000 */  mflo       $a3
/* B490 8001AC90 0200E104 */  bgez       $a3, .L8001AC9C
/* B494 8001AC94 2200A2A7 */   sh        $v0, 0x22($sp)
/* B498 8001AC98 FF0FE724 */  addiu      $a3, $a3, 0xFFF
.L8001AC9C:
/* B49C 8001AC9C 21204002 */  addu       $a0, $s2, $zero
/* B4A0 8001ACA0 2128A002 */  addu       $a1, $s5, $zero
/* B4A4 8001ACA4 2130C002 */  addu       $a2, $s6, $zero
/* B4A8 8001ACA8 1400A297 */  lhu        $v0, 0x14($sp)
/* B4AC 8001ACAC 031B0700 */  sra        $v1, $a3, 12
/* B4B0 8001ACB0 21104300 */  addu       $v0, $v0, $v1
/* B4B4 8001ACB4 BB6A000C */  jal        CAMERA_CheckIfPointOnLine
/* B4B8 8001ACB8 2400A2A7 */   sh        $v0, 0x24($sp)
/* B4BC 8001ACBC 09004010 */  beqz       $v0, .L8001ACE4
/* B4C0 8001ACC0 00000000 */   nop
/* B4C4 8001ACC4 2000A297 */  lhu        $v0, 0x20($sp)
/* B4C8 8001ACC8 02004396 */  lhu        $v1, 0x2($s2)
/* B4CC 8001ACCC 04004496 */  lhu        $a0, 0x4($s2)
/* B4D0 8001ACD0 01009426 */  addiu      $s4, $s4, 0x1
/* B4D4 8001ACD4 000002A6 */  sh         $v0, 0x0($s0)
/* B4D8 8001ACD8 020003A6 */  sh         $v1, 0x2($s0)
/* B4DC 8001ACDC 040004A6 */  sh         $a0, 0x4($s0)
/* B4E0 8001ACE0 08001026 */  addiu      $s0, $s0, 0x8
.L8001ACE4:
/* B4E4 8001ACE4 01007326 */  addiu      $s3, $s3, 0x1
/* B4E8 8001ACE8 1800A297 */  lhu        $v0, 0x18($sp)
/* B4EC 8001ACEC 1C00A397 */  lhu        $v1, 0x1C($sp)
/* B4F0 8001ACF0 23100200 */  negu       $v0, $v0
/* B4F4 8001ACF4 1800A2A7 */  sh         $v0, 0x18($sp)
/* B4F8 8001ACF8 1A00A297 */  lhu        $v0, 0x1A($sp)
/* B4FC 8001ACFC 23180300 */  negu       $v1, $v1
/* B500 8001AD00 1C00A3A7 */  sh         $v1, 0x1C($sp)
/* B504 8001AD04 23100200 */  negu       $v0, $v0
/* B508 8001AD08 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* B50C 8001AD0C 0200622A */  slti       $v0, $s3, 0x2
/* B510 8001AD10 C7FF4014 */  bnez       $v0, .L8001AC30
/* B514 8001AD14 21108002 */   addu      $v0, $s4, $zero
.L8001AD18:
/* B518 8001AD18 4400BF8F */  lw         $ra, 0x44($sp)
/* B51C 8001AD1C 4000B68F */  lw         $s6, 0x40($sp)
/* B520 8001AD20 3C00B58F */  lw         $s5, 0x3C($sp)
/* B524 8001AD24 3800B48F */  lw         $s4, 0x38($sp)
/* B528 8001AD28 3400B38F */  lw         $s3, 0x34($sp)
/* B52C 8001AD2C 3000B28F */  lw         $s2, 0x30($sp)
/* B530 8001AD30 2C00B18F */  lw         $s1, 0x2C($sp)
/* B534 8001AD34 2800B08F */  lw         $s0, 0x28($sp)
/* B538 8001AD38 0800E003 */  jr         $ra
/* B53C 8001AD3C 4800BD27 */   addiu     $sp, $sp, 0x48
.size CAMERA_FindLinePoint, . - CAMERA_FindLinePoint
