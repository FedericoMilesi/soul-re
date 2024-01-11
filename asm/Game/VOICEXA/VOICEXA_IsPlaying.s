.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VOICEXA_IsPlaying
/* A7BF4 800B73F4 F0FE8427 */  addiu      $a0, $gp, %gp_rel(voiceTracker)
/* A7BF8 800B73F8 AA008390 */  lbu        $v1, 0xAA($a0)
/* A7BFC 800B73FC 02000224 */  addiu      $v0, $zero, 0x2
/* A7C00 800B7400 0A006210 */  beq        $v1, $v0, .L800B742C
/* A7C04 800B7404 00000000 */   nop
/* A7C08 800B7408 01000224 */  addiu      $v0, $zero, 0x1
/* A7C0C 800B740C 05006210 */  beq        $v1, $v0, .L800B7424
/* A7C10 800B7410 00000000 */   nop
/* A7C14 800B7414 AB008290 */  lbu        $v0, 0xAB($a0)
/* A7C18 800B7418 00000000 */  nop
/* A7C1C 800B741C 03004010 */  beqz       $v0, .L800B742C
/* A7C20 800B7420 21100000 */   addu      $v0, $zero, $zero
.L800B7424:
/* A7C24 800B7424 0800E003 */  jr         $ra
/* A7C28 800B7428 01000224 */   addiu     $v0, $zero, 0x1
.L800B742C:
/* A7C2C 800B742C 0800E003 */  jr         $ra
/* A7C30 800B7430 00000000 */   nop
.size VOICEXA_IsPlaying, . - VOICEXA_IsPlaying
