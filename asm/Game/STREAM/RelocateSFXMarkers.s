.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateSFXMarkers
/* 4C92C 8005C12C 0000C894 */  lhu        $t0, 0x0($a2)
/* 4C930 8005C130 0200C794 */  lhu        $a3, 0x2($a2)
/* 4C934 8005C134 0400C694 */  lhu        $a2, 0x4($a2)
/* 4C938 8005C138 0D00A010 */  beqz       $a1, .L8005C170
/* 4C93C 8005C13C 18008424 */   addiu     $a0, $a0, 0x18
.L8005C140:
/* 4C940 8005C140 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 4C944 8005C144 FCFF8294 */  lhu        $v0, -0x4($a0)
/* 4C948 8005C148 00008394 */  lhu        $v1, 0x0($a0)
/* 4C94C 8005C14C 21104800 */  addu       $v0, $v0, $t0
/* 4C950 8005C150 FCFF82A4 */  sh         $v0, -0x4($a0)
/* 4C954 8005C154 FEFF8294 */  lhu        $v0, -0x2($a0)
/* 4C958 8005C158 21186600 */  addu       $v1, $v1, $a2
/* 4C95C 8005C15C 000083A4 */  sh         $v1, 0x0($a0)
/* 4C960 8005C160 21104700 */  addu       $v0, $v0, $a3
/* 4C964 8005C164 FEFF82A4 */  sh         $v0, -0x2($a0)
/* 4C968 8005C168 F5FFA014 */  bnez       $a1, .L8005C140
/* 4C96C 8005C16C 24008424 */   addiu     $a0, $a0, 0x24
.L8005C170:
/* 4C970 8005C170 0800E003 */  jr         $ra
/* 4C974 8005C174 00000000 */   nop
.size RelocateSFXMarkers, . - RelocateSFXMarkers
