.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CalcTilt
/* 90E0 800188E0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 90E4 800188E4 4400B1AF */  sw         $s1, 0x44($sp)
/* 90E8 800188E8 21888000 */  addu       $s1, $a0, $zero
/* 90EC 800188EC 4000B0AF */  sw         $s0, 0x40($sp)
/* 90F0 800188F0 2180A000 */  addu       $s0, $a1, $zero
/* 90F4 800188F4 4800BFAF */  sw         $ra, 0x48($sp)
/* 90F8 800188F8 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 90FC 800188FC 1000A427 */   addiu     $a0, $sp, 0x10
/* 9100 80018900 00841000 */  sll        $s0, $s0, 16
/* 9104 80018904 03841000 */  sra        $s0, $s0, 16
/* 9108 80018908 23201000 */  negu       $a0, $s0
/* 910C 8001890C 32E4010C */  jal        RotMatrixZ
/* 9110 80018910 1000A527 */   addiu     $a1, $sp, 0x10
/* 9114 80018914 1000A427 */  addiu      $a0, $sp, 0x10
/* 9118 80018918 21282002 */  addu       $a1, $s1, $zero
/* 911C 8001891C 1AF2020C */  jal        ApplyMatrix
/* 9120 80018920 3000A627 */   addiu     $a2, $sp, 0x30
/* 9124 80018924 3400A48F */  lw         $a0, 0x34($sp)
/* 9128 80018928 3800A58F */  lw         $a1, 0x38($sp)
/* 912C 8001892C 26F3020C */  jal        ratan2
/* 9130 80018930 00000000 */   nop
/* 9134 80018934 00140200 */  sll        $v0, $v0, 16
/* 9138 80018938 03140200 */  sra        $v0, $v0, 16
/* 913C 8001893C 4800BF8F */  lw         $ra, 0x48($sp)
/* 9140 80018940 4400B18F */  lw         $s1, 0x44($sp)
/* 9144 80018944 4000B08F */  lw         $s0, 0x40($sp)
/* 9148 80018948 23100200 */  negu       $v0, $v0
/* 914C 8001894C 0800E003 */  jr         $ra
/* 9150 80018950 5000BD27 */   addiu     $sp, $sp, 0x50
.size CAMERA_CalcTilt, . - CAMERA_CalcTilt
