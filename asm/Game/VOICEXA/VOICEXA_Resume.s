.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VOICEXA_Resume
/* A7A2C 800B722C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7A30 800B7230 1000B0AF */  sw         $s0, 0x10($sp)
/* A7A34 800B7234 F0FE9027 */  addiu      $s0, $gp, %gp_rel(voiceTracker)
/* A7A38 800B7238 1400BFAF */  sw         $ra, 0x14($sp)
/* A7A3C 800B723C 5EDC020C */  jal        VOICEXA_FinalStatus
/* A7A40 800B7240 21200002 */   addu      $a0, $s0, $zero
/* A7A44 800B7244 21204000 */  addu       $a0, $v0, $zero
/* A7A48 800B7248 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* A7A4C 800B724C 0800033C */  lui        $v1, (0x80000 >> 16)
/* A7A50 800B7250 24104300 */  and        $v0, $v0, $v1
/* A7A54 800B7254 0D004010 */  beqz       $v0, .L800B728C
/* A7A58 800B7258 03000224 */   addiu     $v0, $zero, 0x3
/* A7A5C 800B725C 04008214 */  bne        $a0, $v0, .L800B7270
/* A7A60 800B7260 21284000 */   addu      $a1, $v0, $zero
/* A7A64 800B7264 21200002 */  addu       $a0, $s0, $zero
/* A7A68 800B7268 A1DC0208 */  j          .L800B7284
/* A7A6C 800B726C 01000624 */   addiu     $a2, $zero, 0x1
.L800B7270:
/* A7A70 800B7270 04000224 */  addiu      $v0, $zero, 0x4
/* A7A74 800B7274 05008214 */  bne        $a0, $v0, .L800B728C
/* A7A78 800B7278 21200002 */   addu      $a0, $s0, $zero
/* A7A7C 800B727C 21284000 */  addu       $a1, $v0, $zero
/* A7A80 800B7280 21300000 */  addu       $a2, $zero, $zero
.L800B7284:
/* A7A84 800B7284 51DB020C */  jal        putVoiceCommand
/* A7A88 800B7288 21380000 */   addu      $a3, $zero, $zero
.L800B728C:
/* A7A8C 800B728C 1400BF8F */  lw         $ra, 0x14($sp)
/* A7A90 800B7290 1000B08F */  lw         $s0, 0x10($sp)
/* A7A94 800B7294 0800E003 */  jr         $ra
/* A7A98 800B7298 1800BD27 */   addiu     $sp, $sp, 0x18
.size VOICEXA_Resume, . - VOICEXA_Resume
