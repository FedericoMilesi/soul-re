.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _G2AnimController_ApplyToSegValue
/* 81968 80091168 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 8196C 8009116C 4000B0AF */  sw         $s0, 0x40($sp)
/* 81970 80091170 2180A000 */  addu       $s0, $a1, $zero
/* 81974 80091174 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 81978 80091178 2198C000 */  addu       $s3, $a2, $zero
/* 8197C 8009117C 4800B2AF */  sw         $s2, 0x48($sp)
/* 81980 80091180 5000BFAF */  sw         $ra, 0x50($sp)
/* 81984 80091184 4400B1AF */  sw         $s1, 0x44($sp)
/* 81988 80091188 0000828C */  lw         $v0, 0x0($a0)
/* 8198C 8009118C 02FF033C */  lui        $v1, (0xFF020000 >> 16)
/* 81990 80091190 24104300 */  and        $v0, $v0, $v1
/* 81994 80091194 05004014 */  bnez       $v0, .L800911AC
/* 81998 80091198 2190E000 */   addu      $s2, $a3, $zero
/* 8199C 8009119C 5D46020C */  jal        _G2AnimController_ApplyWorldToParentMatrix
/* 819A0 800911A0 21284002 */   addu      $a1, $s2, $zero
/* 819A4 800911A4 3D450208 */  j          .L800914F4
/* 819A8 800911A8 00000000 */   nop
.L800911AC:
/* 819AC 800911AC 02008390 */  lbu        $v1, 0x2($a0)
/* 819B0 800911B0 00000000 */  nop
/* 819B4 800911B4 4D00622C */  sltiu      $v0, $v1, 0x4D
/* 819B8 800911B8 CD004010 */  beqz       $v0, .L800914F0
/* 819BC 800911BC 07001124 */   addiu     $s1, $zero, 0x7
/* 819C0 800911C0 0180023C */  lui        $v0, %hi(jtbl_800120A4)
/* 819C4 800911C4 A4204224 */  addiu      $v0, $v0, %lo(jtbl_800120A4)
/* 819C8 800911C8 80180300 */  sll        $v1, $v1, 2
/* 819CC 800911CC 21186200 */  addu       $v1, $v1, $v0
/* 819D0 800911D0 0000628C */  lw         $v0, 0x0($v1)
/* 819D4 800911D4 00000000 */  nop
/* 819D8 800911D8 08004000 */  jr         $v0
/* 819DC 800911DC 00000000 */   nop
jlabel .L800911E0
/* 819E0 800911E0 21280002 */  addu       $a1, $s0, $zero
/* 819E4 800911E4 1800828C */  lw         $v0, 0x18($a0)
/* 819E8 800911E8 21304002 */  addu       $a2, $s2, $zero
/* 819EC 800911EC 1000A2AF */  sw         $v0, 0x10($sp)
/* 819F0 800911F0 1400828C */  lw         $v0, 0x14($a0)
/* 819F4 800911F4 00000000 */  nop
/* 819F8 800911F8 09F84000 */  jalr       $v0
/* 819FC 800911FC 21386002 */   addu      $a3, $s3, $zero
/* 81A00 80091200 3C450208 */  j          .L800914F0
/* 81A04 80091204 21884000 */   addu      $s1, $v0, $zero
jlabel .L80091208
/* 81A08 80091208 FEFF0224 */  addiu      $v0, $zero, -0x2
/* 81A0C 8009120C 24882202 */  and        $s1, $s1, $v0
jlabel .L80091210
/* 81A10 80091210 B246020C */  jal        _G2AnimController_GetMatrix
/* 81A14 80091214 21286002 */   addu      $a1, $s3, $zero
/* 81A18 80091218 3D450208 */  j          .L800914F4
/* 81A1C 8009121C 21102002 */   addu      $v0, $s1, $zero
jlabel .L80091220
/* 81A20 80091220 FEFF0224 */  addiu      $v0, $zero, -0x2
/* 81A24 80091224 24882202 */  and        $s1, $s1, $v0
/* 81A28 80091228 00004C8E */  lw         $t4, 0x0($s2)
/* 81A2C 8009122C 04004D8E */  lw         $t5, 0x4($s2)
/* 81A30 80091230 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 81A34 80091234 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 81A38 80091238 08004C8E */  lw         $t4, 0x8($s2)
/* 81A3C 8009123C 0C004D8E */  lw         $t5, 0xC($s2)
/* 81A40 80091240 10004E8E */  lw         $t6, 0x10($s2)
/* 81A44 80091244 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 81A48 80091248 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 81A4C 8009124C 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 81A50 80091250 00006C96 */  lhu        $t4, 0x0($s3)
/* 81A54 80091254 06006D96 */  lhu        $t5, 0x6($s3)
/* 81A58 80091258 0C006E96 */  lhu        $t6, 0xC($s3)
/* 81A5C 8009125C 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 81A60 80091260 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 81A64 80091264 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 81A68 80091268 02006896 */  lhu        $t0, 0x2($s3)
/* 81A6C 8009126C 08006996 */  lhu        $t1, 0x8($s3)
/* 81A70 80091270 00000000 */  nop
/* 81A74 80091274 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 81A78 80091278 0E006A96 */  lhu        $t2, 0xE($s3)
/* 81A7C 8009127C 04006B96 */  lhu        $t3, 0x4($s3)
/* 81A80 80091280 00480D48 */  mfc2       $t5, $9 # handwritten instruction
/* 81A84 80091284 00500E48 */  mfc2       $t6, $10 # handwritten instruction
/* 81A88 80091288 00580F48 */  mfc2       $t7, $11 # handwritten instruction
/* 81A8C 8009128C 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 81A90 80091290 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 81A94 80091294 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 81A98 80091298 00006DA6 */  sh         $t5, 0x0($s3)
/* 81A9C 8009129C 06006EA6 */  sh         $t6, 0x6($s3)
/* 81AA0 800912A0 00000000 */  nop
/* 81AA4 800912A4 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 81AA8 800912A8 0A006C96 */  lhu        $t4, 0xA($s3)
/* 81AAC 800912AC 10006D96 */  lhu        $t5, 0x10($s3)
/* 81AB0 800912B0 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 81AB4 800912B4 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 81AB8 800912B8 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 81ABC 800912BC 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 81AC0 800912C0 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 81AC4 800912C4 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 81AC8 800912C8 0C006FA6 */  sh         $t7, 0xC($s3)
/* 81ACC 800912CC 020068A6 */  sh         $t0, 0x2($s3)
/* 81AD0 800912D0 00000000 */  nop
/* 81AD4 800912D4 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 81AD8 800912D8 080069A6 */  sh         $t1, 0x8($s3)
/* 81ADC 800912DC 0E006AA6 */  sh         $t2, 0xE($s3)
/* 81AE0 800912E0 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 81AE4 800912E4 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 81AE8 800912E8 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 81AEC 800912EC 040068A6 */  sh         $t0, 0x4($s3)
/* 81AF0 800912F0 0A0069A6 */  sh         $t1, 0xA($s3)
/* 81AF4 800912F4 10006AA6 */  sh         $t2, 0x10($s3)
jlabel .L800912F8
/* 81AF8 800912F8 B246020C */  jal        _G2AnimController_GetMatrix
/* 81AFC 800912FC 1800A527 */   addiu     $a1, $sp, 0x18
/* 81B00 80091300 1800A227 */  addiu      $v0, $sp, 0x18
/* 81B04 80091304 00004C8C */  lw         $t4, 0x0($v0)
/* 81B08 80091308 04004D8C */  lw         $t5, 0x4($v0)
/* 81B0C 8009130C 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 81B10 80091310 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 81B14 80091314 08004C8C */  lw         $t4, 0x8($v0)
/* 81B18 80091318 0C004D8C */  lw         $t5, 0xC($v0)
/* 81B1C 8009131C 10004E8C */  lw         $t6, 0x10($v0)
/* 81B20 80091320 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 81B24 80091324 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 81B28 80091328 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 81B2C 8009132C 00006C96 */  lhu        $t4, 0x0($s3)
/* 81B30 80091330 06006D96 */  lhu        $t5, 0x6($s3)
/* 81B34 80091334 0C006E96 */  lhu        $t6, 0xC($s3)
/* 81B38 80091338 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 81B3C 8009133C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 81B40 80091340 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 81B44 80091344 02006896 */  lhu        $t0, 0x2($s3)
/* 81B48 80091348 08006996 */  lhu        $t1, 0x8($s3)
/* 81B4C 8009134C 00000000 */  nop
/* 81B50 80091350 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 81B54 80091354 0E006A96 */  lhu        $t2, 0xE($s3)
/* 81B58 80091358 04006B96 */  lhu        $t3, 0x4($s3)
/* 81B5C 8009135C 00480D48 */  mfc2       $t5, $9 # handwritten instruction
/* 81B60 80091360 00500E48 */  mfc2       $t6, $10 # handwritten instruction
/* 81B64 80091364 00580F48 */  mfc2       $t7, $11 # handwritten instruction
/* 81B68 80091368 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 81B6C 8009136C 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 81B70 80091370 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 81B74 80091374 00006DA6 */  sh         $t5, 0x0($s3)
/* 81B78 80091378 06006EA6 */  sh         $t6, 0x6($s3)
/* 81B7C 8009137C 00000000 */  nop
/* 81B80 80091380 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 81B84 80091384 0A006C96 */  lhu        $t4, 0xA($s3)
/* 81B88 80091388 10006D96 */  lhu        $t5, 0x10($s3)
/* 81B8C 8009138C 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 81B90 80091390 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 81B94 80091394 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 81B98 80091398 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 81B9C 8009139C 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 81BA0 800913A0 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 81BA4 800913A4 0C006FA6 */  sh         $t7, 0xC($s3)
/* 81BA8 800913A8 020068A6 */  sh         $t0, 0x2($s3)
/* 81BAC 800913AC 00000000 */  nop
/* 81BB0 800913B0 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 81BB4 800913B4 080069A6 */  sh         $t1, 0x8($s3)
/* 81BB8 800913B8 0E006AA6 */  sh         $t2, 0xE($s3)
/* 81BBC 800913BC 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 81BC0 800913C0 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 81BC4 800913C4 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 81BC8 800913C8 040068A6 */  sh         $t0, 0x4($s3)
/* 81BCC 800913CC 0A0069A6 */  sh         $t1, 0xA($s3)
/* 81BD0 800913D0 10006AA6 */  sh         $t2, 0x10($s3)
/* 81BD4 800913D4 3D450208 */  j          .L800914F4
/* 81BD8 800913D8 21102002 */   addu      $v0, $s1, $zero
jlabel .L800913DC
/* 81BDC 800913DC FDFF0224 */  addiu      $v0, $zero, -0x3
/* 81BE0 800913E0 24882202 */  and        $s1, $s1, $v0
jlabel .L800913E4
/* 81BE4 800913E4 E846020C */  jal        _G2AnimController_GetVector
/* 81BE8 800913E8 3800A527 */   addiu     $a1, $sp, 0x38
/* 81BEC 800913EC 3800A28F */  lw         $v0, 0x38($sp)
/* 81BF0 800913F0 3C00A397 */  lhu        $v1, 0x3C($sp)
/* 81BF4 800913F4 080002AE */  sw         $v0, 0x8($s0)
/* 81BF8 800913F8 3C450208 */  j          .L800914F0
/* 81BFC 800913FC 0C0003A6 */   sh        $v1, 0xC($s0)
jlabel .L80091400
/* 81C00 80091400 E846020C */  jal        _G2AnimController_GetVector
/* 81C04 80091404 3800A527 */   addiu     $a1, $sp, 0x38
/* 81C08 80091408 08000296 */  lhu        $v0, 0x8($s0)
/* 81C0C 8009140C 3800A397 */  lhu        $v1, 0x38($sp)
/* 81C10 80091410 00000000 */  nop
/* 81C14 80091414 21104300 */  addu       $v0, $v0, $v1
/* 81C18 80091418 080002A6 */  sh         $v0, 0x8($s0)
/* 81C1C 8009141C 0A000296 */  lhu        $v0, 0xA($s0)
/* 81C20 80091420 3A00A397 */  lhu        $v1, 0x3A($sp)
/* 81C24 80091424 00000000 */  nop
/* 81C28 80091428 21104300 */  addu       $v0, $v0, $v1
/* 81C2C 8009142C 0A0002A6 */  sh         $v0, 0xA($s0)
/* 81C30 80091430 0C000296 */  lhu        $v0, 0xC($s0)
/* 81C34 80091434 3C00A397 */  lhu        $v1, 0x3C($sp)
/* 81C38 80091438 00000000 */  nop
/* 81C3C 8009143C 21104300 */  addu       $v0, $v0, $v1
/* 81C40 80091440 3C450208 */  j          .L800914F0
/* 81C44 80091444 0C0002A6 */   sh        $v0, 0xC($s0)
jlabel .L80091448
/* 81C48 80091448 FBFF0224 */  addiu      $v0, $zero, -0x5
/* 81C4C 8009144C 24882202 */  and        $s1, $s1, $v0
/* 81C50 80091450 E846020C */  jal        _G2AnimController_GetVector
/* 81C54 80091454 3800A527 */   addiu     $a1, $sp, 0x38
/* 81C58 80091458 3800A297 */  lhu        $v0, 0x38($sp)
/* 81C5C 8009145C 14004396 */  lhu        $v1, 0x14($s2)
/* 81C60 80091460 00000000 */  nop
/* 81C64 80091464 23104300 */  subu       $v0, $v0, $v1
/* 81C68 80091468 100002A6 */  sh         $v0, 0x10($s0)
/* 81C6C 8009146C 3A00A297 */  lhu        $v0, 0x3A($sp)
/* 81C70 80091470 18004396 */  lhu        $v1, 0x18($s2)
/* 81C74 80091474 00000000 */  nop
/* 81C78 80091478 23104300 */  subu       $v0, $v0, $v1
/* 81C7C 8009147C 120002A6 */  sh         $v0, 0x12($s0)
/* 81C80 80091480 3C00A297 */  lhu        $v0, 0x3C($sp)
/* 81C84 80091484 1C004396 */  lhu        $v1, 0x1C($s2)
/* 81C88 80091488 3B450208 */  j          .L800914EC
/* 81C8C 8009148C 23104300 */   subu      $v0, $v0, $v1
jlabel .L80091490
/* 81C90 80091490 E846020C */  jal        _G2AnimController_GetVector
/* 81C94 80091494 3800A527 */   addiu     $a1, $sp, 0x38
/* 81C98 80091498 3800A28F */  lw         $v0, 0x38($sp)
/* 81C9C 8009149C 3C00A397 */  lhu        $v1, 0x3C($sp)
/* 81CA0 800914A0 100002AE */  sw         $v0, 0x10($s0)
/* 81CA4 800914A4 3C450208 */  j          .L800914F0
/* 81CA8 800914A8 140003A6 */   sh        $v1, 0x14($s0)
jlabel .L800914AC
/* 81CAC 800914AC E846020C */  jal        _G2AnimController_GetVector
/* 81CB0 800914B0 3800A527 */   addiu     $a1, $sp, 0x38
/* 81CB4 800914B4 10000296 */  lhu        $v0, 0x10($s0)
/* 81CB8 800914B8 3800A397 */  lhu        $v1, 0x38($sp)
/* 81CBC 800914BC 00000000 */  nop
/* 81CC0 800914C0 21104300 */  addu       $v0, $v0, $v1
/* 81CC4 800914C4 100002A6 */  sh         $v0, 0x10($s0)
/* 81CC8 800914C8 12000296 */  lhu        $v0, 0x12($s0)
/* 81CCC 800914CC 3A00A397 */  lhu        $v1, 0x3A($sp)
/* 81CD0 800914D0 00000000 */  nop
/* 81CD4 800914D4 21104300 */  addu       $v0, $v0, $v1
/* 81CD8 800914D8 120002A6 */  sh         $v0, 0x12($s0)
/* 81CDC 800914DC 14000296 */  lhu        $v0, 0x14($s0)
/* 81CE0 800914E0 3C00A397 */  lhu        $v1, 0x3C($sp)
/* 81CE4 800914E4 00000000 */  nop
/* 81CE8 800914E8 21104300 */  addu       $v0, $v0, $v1
.L800914EC:
/* 81CEC 800914EC 140002A6 */  sh         $v0, 0x14($s0)
jlabel .L800914F0
/* 81CF0 800914F0 21102002 */  addu       $v0, $s1, $zero
.L800914F4:
/* 81CF4 800914F4 5000BF8F */  lw         $ra, 0x50($sp)
/* 81CF8 800914F8 4C00B38F */  lw         $s3, 0x4C($sp)
/* 81CFC 800914FC 4800B28F */  lw         $s2, 0x48($sp)
/* 81D00 80091500 4400B18F */  lw         $s1, 0x44($sp)
/* 81D04 80091504 4000B08F */  lw         $s0, 0x40($sp)
/* 81D08 80091508 0800E003 */  jr         $ra
/* 81D0C 8009150C 5800BD27 */   addiu     $sp, $sp, 0x58
.size _G2AnimController_ApplyToSegValue, . - _G2AnimController_ApplyToSegValue
