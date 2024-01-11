.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PHYSICS_GenericLineCheckMask
/* 688B4 800780B4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 688B8 800780B8 2000BFAF */  sw         $ra, 0x20($sp)
/* 688BC 800780BC 1800E88C */  lw         $t0, 0x18($a3)
/* 688C0 800780C0 1400E98C */  lw         $t1, 0x14($a3)
/* 688C4 800780C4 0000CC8C */  lw         $t4, 0x0($a2)
/* 688C8 800780C8 0400CD8C */  lw         $t5, 0x4($a2)
/* 688CC 800780CC 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 688D0 800780D0 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 688D4 800780D4 0800CC8C */  lw         $t4, 0x8($a2)
/* 688D8 800780D8 0C00CD8C */  lw         $t5, 0xC($a2)
/* 688DC 800780DC 1000CE8C */  lw         $t6, 0x10($a2)
/* 688E0 800780E0 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 688E4 800780E4 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 688E8 800780E8 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 688EC 800780EC 000000C9 */  lwc2       $0, 0x0($t0)
/* 688F0 800780F0 040001C9 */  lwc2       $1, 0x4($t0)
/* 688F4 800780F4 00000000 */  nop
/* 688F8 800780F8 00000000 */  nop
/* 688FC 800780FC 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 68900 80078100 1000AA27 */  addiu      $t2, $sp, 0x10
/* 68904 80078104 000059E9 */  swc2       $25, 0x0($t2)
/* 68908 80078108 04005AE9 */  swc2       $26, 0x4($t2) # handwritten instruction
/* 6890C 8007810C 08005BE9 */  swc2       $27, 0x8($t2) # handwritten instruction
/* 68910 80078110 1400A294 */  lhu        $v0, 0x14($a1)
/* 68914 80078114 1000A397 */  lhu        $v1, 0x10($sp)
/* 68918 80078118 00000000 */  nop
/* 6891C 8007811C 21104300 */  addu       $v0, $v0, $v1
/* 68920 80078120 000002A5 */  sh         $v0, 0x0($t0)
/* 68924 80078124 1800A294 */  lhu        $v0, 0x18($a1)
/* 68928 80078128 1400A397 */  lhu        $v1, 0x14($sp)
/* 6892C 8007812C 00000000 */  nop
/* 68930 80078130 21104300 */  addu       $v0, $v0, $v1
/* 68934 80078134 020002A5 */  sh         $v0, 0x2($t0)
/* 68938 80078138 1C00A294 */  lhu        $v0, 0x1C($a1)
/* 6893C 8007813C 1800A397 */  lhu        $v1, 0x18($sp)
/* 68940 80078140 00000000 */  nop
/* 68944 80078144 21104300 */  addu       $v0, $v0, $v1
/* 68948 80078148 040002A5 */  sh         $v0, 0x4($t0)
/* 6894C 8007814C 0000CC8C */  lw         $t4, 0x0($a2)
/* 68950 80078150 0400CD8C */  lw         $t5, 0x4($a2)
/* 68954 80078154 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 68958 80078158 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 6895C 8007815C 0800CC8C */  lw         $t4, 0x8($a2)
/* 68960 80078160 0C00CD8C */  lw         $t5, 0xC($a2)
/* 68964 80078164 1000CE8C */  lw         $t6, 0x10($a2)
/* 68968 80078168 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 6896C 8007816C 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 68970 80078170 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 68974 80078174 000020C9 */  lwc2       $0, 0x0($t1)
/* 68978 80078178 040021C9 */  lwc2       $1, 0x4($t1)
/* 6897C 8007817C 00000000 */  nop
/* 68980 80078180 00000000 */  nop
/* 68984 80078184 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 68988 80078188 000059E9 */  swc2       $25, 0x0($t2)
/* 6898C 8007818C 04005AE9 */  swc2       $26, 0x4($t2) # handwritten instruction
/* 68990 80078190 08005BE9 */  swc2       $27, 0x8($t2) # handwritten instruction
/* 68994 80078194 1400A294 */  lhu        $v0, 0x14($a1)
/* 68998 80078198 1000A397 */  lhu        $v1, 0x10($sp)
/* 6899C 8007819C 00000000 */  nop
/* 689A0 800781A0 21104300 */  addu       $v0, $v0, $v1
/* 689A4 800781A4 000022A5 */  sh         $v0, 0x0($t1)
/* 689A8 800781A8 1800A294 */  lhu        $v0, 0x18($a1)
/* 689AC 800781AC 1400A397 */  lhu        $v1, 0x14($sp)
/* 689B0 800781B0 00000000 */  nop
/* 689B4 800781B4 21104300 */  addu       $v0, $v0, $v1
/* 689B8 800781B8 020022A5 */  sh         $v0, 0x2($t1)
/* 689BC 800781BC 1C00A294 */  lhu        $v0, 0x1C($a1)
/* 689C0 800781C0 1800A397 */  lhu        $v1, 0x18($sp)
/* 689C4 800781C4 2128E000 */  addu       $a1, $a3, $zero
/* 689C8 800781C8 21104300 */  addu       $v0, $v0, $v1
/* 689CC 800781CC 62D2010C */  jal        PHYSICS_CheckLineInWorldMask
/* 689D0 800781D0 040022A5 */   sh        $v0, 0x4($t1)
/* 689D4 800781D4 2000BF8F */  lw         $ra, 0x20($sp)
/* 689D8 800781D8 00000000 */  nop
/* 689DC 800781DC 0800E003 */  jr         $ra
/* 689E0 800781E0 2800BD27 */   addiu     $sp, $sp, 0x28
.size PHYSICS_GenericLineCheckMask, . - PHYSICS_GenericLineCheckMask
