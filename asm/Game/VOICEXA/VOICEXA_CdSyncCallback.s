.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VOICEXA_CdSyncCallback
/* A7430 800B6C30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7434 800B6C34 F0FE8527 */  addiu      $a1, $gp, %gp_rel(voiceTracker)
/* A7438 800B6C38 FF008430 */  andi       $a0, $a0, 0xFF
/* A743C 800B6C3C 02000224 */  addiu      $v0, $zero, 0x2
/* A7440 800B6C40 11008214 */  bne        $a0, $v0, .L800B6C88
/* A7444 800B6C44 1000BFAF */   sw        $ra, 0x10($sp)
/* A7448 800B6C48 A100A290 */  lbu        $v0, 0xA1($a1)
/* A744C 800B6C4C 08000324 */  addiu      $v1, $zero, 0x8
/* A7450 800B6C50 AB00A0A0 */  sb         $zero, 0xAB($a1)
/* A7454 800B6C54 01004224 */  addiu      $v0, $v0, 0x1
/* A7458 800B6C58 A100A2A0 */  sb         $v0, 0xA1($a1)
/* A745C 800B6C5C FF004230 */  andi       $v0, $v0, 0xFF
/* A7460 800B6C60 02004314 */  bne        $v0, $v1, .L800B6C6C
/* A7464 800B6C64 00000000 */   nop
/* A7468 800B6C68 A100A0A0 */  sb         $zero, 0xA1($a1)
.L800B6C6C:
/* A746C 800B6C6C A200A290 */  lbu        $v0, 0xA2($a1)
/* A7470 800B6C70 0C00A48C */  lw         $a0, 0xC($a1)
/* A7474 800B6C74 FFFF4224 */  addiu      $v0, $v0, -0x1
/* A7478 800B6C78 46F8020C */  jal        CdSyncCallback
/* A747C 800B6C7C A200A2A0 */   sb        $v0, 0xA2($a1)
/* A7480 800B6C80 23DB0208 */  j          .L800B6C8C
/* A7484 800B6C84 00000000 */   nop
.L800B6C88:
/* A7488 800B6C88 AB00A2A0 */  sb         $v0, 0xAB($a1)
.L800B6C8C:
/* A748C 800B6C8C 1000BF8F */  lw         $ra, 0x10($sp)
/* A7490 800B6C90 00000000 */  nop
/* A7494 800B6C94 0800E003 */  jr         $ra
/* A7498 800B6C98 1800BD27 */   addiu     $sp, $sp, 0x18
.size VOICEXA_CdSyncCallback, . - VOICEXA_CdSyncCallback
