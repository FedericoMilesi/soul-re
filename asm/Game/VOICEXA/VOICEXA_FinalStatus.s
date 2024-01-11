.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VOICEXA_FinalStatus
/* A7978 800B7178 A8008290 */  lbu        $v0, 0xA8($a0)
/* A797C 800B717C 00000000 */  nop
/* A7980 800B7180 04004014 */  bnez       $v0, .L800B7194
/* A7984 800B7184 00000000 */   nop
/* A7988 800B7188 AA008290 */  lbu        $v0, 0xAA($a0)
/* A798C 800B718C 0800E003 */  jr         $ra
/* A7990 800B7190 00000000 */   nop
.L800B7194:
/* A7994 800B7194 A6008290 */  lbu        $v0, 0xA6($a0)
/* A7998 800B7198 00000000 */  nop
/* A799C 800B719C 02004014 */  bnez       $v0, .L800B71A8
/* A79A0 800B71A0 FFFF4224 */   addiu     $v0, $v0, -0x1
/* A79A4 800B71A4 0F000224 */  addiu      $v0, $zero, 0xF
.L800B71A8:
/* A79A8 800B71A8 80100200 */  sll        $v0, $v0, 2
/* A79AC 800B71AC 21108200 */  addu       $v0, $a0, $v0
/* A79B0 800B71B0 61004290 */  lbu        $v0, 0x61($v0)
/* A79B4 800B71B4 0800E003 */  jr         $ra
/* A79B8 800B71B8 00000000 */   nop
.size VOICEXA_FinalStatus, . - VOICEXA_FinalStatus
