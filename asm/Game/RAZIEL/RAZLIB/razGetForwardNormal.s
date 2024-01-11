.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razGetForwardNormal
/* 96880 800A6080 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 96884 800A6084 4000A227 */  addiu      $v0, $sp, 0x40
/* 96888 800A6088 2800A2AF */  sw         $v0, 0x28($sp)
/* 9688C 800A608C 4800A227 */  addiu      $v0, $sp, 0x48
/* 96890 800A6090 5000BFAF */  sw         $ra, 0x50($sp)
/* 96894 800A6094 2400A2AF */  sw         $v0, 0x24($sp)
/* 96898 800A6098 4000828C */  lw         $v0, 0x40($a0)
/* 9689C 800A609C 00000000 */  nop
/* 968A0 800A60A0 34004294 */  lhu        $v0, 0x34($v0)
/* 968A4 800A60A4 00000000 */  nop
/* 968A8 800A60A8 4000A2A7 */  sh         $v0, 0x40($sp)
/* 968AC 800A60AC 4000828C */  lw         $v0, 0x40($a0)
/* 968B0 800A60B0 00000000 */  nop
/* 968B4 800A60B4 38004294 */  lhu        $v0, 0x38($v0)
/* 968B8 800A60B8 00000000 */  nop
/* 968BC 800A60BC 4200A2A7 */  sh         $v0, 0x42($sp)
/* 968C0 800A60C0 4000828C */  lw         $v0, 0x40($a0)
/* 968C4 800A60C4 00000000 */  nop
/* 968C8 800A60C8 3C004294 */  lhu        $v0, 0x3C($v0)
/* 968CC 800A60CC 00000000 */  nop
/* 968D0 800A60D0 4400A2A7 */  sh         $v0, 0x44($sp)
/* 968D4 800A60D4 4000A28C */  lw         $v0, 0x40($a1)
/* 968D8 800A60D8 00000000 */  nop
/* 968DC 800A60DC 34004294 */  lhu        $v0, 0x34($v0)
/* 968E0 800A60E0 00000000 */  nop
/* 968E4 800A60E4 4800A2A7 */  sh         $v0, 0x48($sp)
/* 968E8 800A60E8 4000A28C */  lw         $v0, 0x40($a1)
/* 968EC 800A60EC 00000000 */  nop
/* 968F0 800A60F0 38004294 */  lhu        $v0, 0x38($v0)
/* 968F4 800A60F4 00000000 */  nop
/* 968F8 800A60F8 4A00A2A7 */  sh         $v0, 0x4A($sp)
/* 968FC 800A60FC 4000A28C */  lw         $v0, 0x40($a1)
/* 96900 800A6100 00000000 */  nop
/* 96904 800A6104 3C004294 */  lhu        $v0, 0x3C($v0)
/* 96908 800A6108 1000A527 */  addiu      $a1, $sp, 0x10
/* 9690C 800A610C 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 96910 800A6110 4C00A2A7 */   sh        $v0, 0x4C($sp)
/* 96914 800A6114 1000A397 */  lhu        $v1, 0x10($sp)
/* 96918 800A6118 00000000 */  nop
/* 9691C 800A611C FEFF6224 */  addiu      $v0, $v1, -0x2
/* 96920 800A6120 0200422C */  sltiu      $v0, $v0, 0x2
/* 96924 800A6124 05004014 */  bnez       $v0, .L800A613C
/* 96928 800A6128 00140300 */   sll       $v0, $v1, 16
/* 9692C 800A612C 03140200 */  sra        $v0, $v0, 16
/* 96930 800A6130 05000324 */  addiu      $v1, $zero, 0x5
/* 96934 800A6134 07004314 */  bne        $v0, $v1, .L800A6154
/* 96938 800A6138 00000000 */   nop
.L800A613C:
/* 9693C 800A613C 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 96940 800A6140 1E00A397 */  lhu        $v1, 0x1E($sp)
/* 96944 800A6144 2000A497 */  lhu        $a0, 0x20($sp)
/* 96948 800A6148 D0F982A7 */  sh         $v0, %gp_rel(Raziel + 0x3A0)($gp)
/* 9694C 800A614C D2F983A7 */  sh         $v1, %gp_rel(Raziel + 0x3A2)($gp)
/* 96950 800A6150 D4F984A7 */  sh         $a0, %gp_rel(Raziel + 0x3A4)($gp)
.L800A6154:
/* 96954 800A6154 5000BF8F */  lw         $ra, 0x50($sp)
/* 96958 800A6158 00000000 */  nop
/* 9695C 800A615C 0800E003 */  jr         $ra
/* 96960 800A6160 5800BD27 */   addiu     $sp, $sp, 0x58
.size razGetForwardNormal, . - razGetForwardNormal
