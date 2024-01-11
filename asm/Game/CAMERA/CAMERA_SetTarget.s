.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetTarget
/* 7140 80016940 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7144 80016944 1800B0AF */  sw         $s0, 0x18($sp)
/* 7148 80016948 21808000 */  addu       $s0, $a0, $zero
/* 714C 8001694C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 7150 80016950 2188A000 */  addu       $s1, $a1, $zero
/* 7154 80016954 B2010426 */  addiu      $a0, $s0, 0x1B2
/* 7158 80016958 2000BFAF */  sw         $ra, 0x20($sp)
/* 715C 8001695C C45E000C */  jal        CAMERA_CalcRotation
/* 7160 80016960 21300002 */   addu      $a2, $s0, $zero
/* 7164 80016964 1000A427 */  addiu      $a0, $sp, 0x10
/* 7168 80016968 00002296 */  lhu        $v0, 0x0($s1)
/* 716C 8001696C 02002396 */  lhu        $v1, 0x2($s1)
/* 7170 80016970 04002596 */  lhu        $a1, 0x4($s1)
/* 7174 80016974 00000696 */  lhu        $a2, 0x0($s0)
/* 7178 80016978 02000796 */  lhu        $a3, 0x2($s0)
/* 717C 8001697C 04000896 */  lhu        $t0, 0x4($s0)
/* 7180 80016980 23104600 */  subu       $v0, $v0, $a2
/* 7184 80016984 23186700 */  subu       $v1, $v1, $a3
/* 7188 80016988 2328A800 */  subu       $a1, $a1, $t0
/* 718C 8001698C 1000A2A7 */  sh         $v0, 0x10($sp)
/* 7190 80016990 020083A4 */  sh         $v1, 0x2($a0)
/* 7194 80016994 9C58000C */  jal        CAMERA_LengthSVector
/* 7198 80016998 040085A4 */   sh        $a1, 0x4($a0)
/* 719C 8001699C 060102A6 */  sh         $v0, 0x106($s0)
/* 71A0 800169A0 A80102A6 */  sh         $v0, 0x1A8($s0)
/* 71A4 800169A4 B00102A6 */  sh         $v0, 0x1B0($s0)
/* 71A8 800169A8 2000BF8F */  lw         $ra, 0x20($sp)
/* 71AC 800169AC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 71B0 800169B0 1800B08F */  lw         $s0, 0x18($sp)
/* 71B4 800169B4 0800E003 */  jr         $ra
/* 71B8 800169B8 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_SetTarget, . - CAMERA_SetTarget
