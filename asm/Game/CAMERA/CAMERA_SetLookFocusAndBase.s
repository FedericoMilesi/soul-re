.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetLookFocusAndBase
/* 9154 80018954 5C008294 */  lhu        $v0, 0x5C($a0)
/* 9158 80018958 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 915C 8001895C 0000A2A7 */  sh         $v0, 0x0($sp)
/* 9160 80018960 5E008294 */  lhu        $v0, 0x5E($a0)
/* 9164 80018964 00000000 */  nop
/* 9168 80018968 0200A2A7 */  sh         $v0, 0x2($sp)
/* 916C 8001896C 60008294 */  lhu        $v0, 0x60($a0)
/* 9170 80018970 00000000 */  nop
/* 9174 80018974 00024224 */  addiu      $v0, $v0, 0x200
/* 9178 80018978 0400A2A7 */  sh         $v0, 0x4($sp)
/* 917C 8001897C 0300A38B */  lwl        $v1, 0x3($sp)
/* 9180 80018980 0000A39B */  lwr        $v1, 0x0($sp)
/* 9184 80018984 0400A687 */  lh         $a2, 0x4($sp)
/* 9188 80018988 0300A3A8 */  swl        $v1, 0x3($a1)
/* 918C 8001898C 0000A3B8 */  swr        $v1, 0x0($a1)
/* 9190 80018990 0400A6A4 */  sh         $a2, 0x4($a1)
/* 9194 80018994 0800E003 */  jr         $ra
/* 9198 80018998 0800BD27 */   addiu     $sp, $sp, 0x8
.size CAMERA_SetLookFocusAndBase, . - CAMERA_SetLookFocusAndBase
