.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CINE_Play
/* A7C80 800B7480 0D80023C */  lui        $v0, %hi(the_cine_table)
/* A7C84 800B7484 74C8478C */  lw         $a3, %lo(the_cine_table)($v0)
/* A7C88 800B7488 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7C8C 800B748C 1100E010 */  beqz       $a3, .L800B74D4
/* A7C90 800B7490 1000BFAF */   sw        $ra, 0x10($sp)
/* A7C94 800B7494 0400E38C */  lw         $v1, 0x4($a3)
/* A7C98 800B7498 0D80023C */  lui        $v0, %hi(monVersion)
/* A7C9C 800B749C A41E4224 */  addiu      $v0, $v0, %lo(monVersion)
/* A7CA0 800B74A0 09006214 */  bne        $v1, $v0, .L800B74C8
/* A7CA4 800B74A4 00000000 */   nop
/* A7CA8 800B74A8 0000E28C */  lw         $v0, 0x0($a3)
/* A7CAC 800B74AC 00000000 */  nop
/* A7CB0 800B74B0 09F84000 */  jalr       $v0
/* A7CB4 800B74B4 FFFFA530 */   andi      $a1, $a1, 0xFFFF
/* A7CB8 800B74B8 B5E0000C */  jal        LOAD_InitCdStreamMode
/* A7CBC 800B74BC 00000000 */   nop
/* A7CC0 800B74C0 35DD0208 */  j          .L800B74D4
/* A7CC4 800B74C4 00000000 */   nop
.L800B74C8:
/* A7CC8 800B74C8 0180043C */  lui        $a0, %hi(D_80012424)
/* A7CCC 800B74CC 06D1010C */  jal        printf
/* A7CD0 800B74D0 24248424 */   addiu     $a0, $a0, %lo(D_80012424)
.L800B74D4:
/* A7CD4 800B74D4 1000BF8F */  lw         $ra, 0x10($sp)
/* A7CD8 800B74D8 00000000 */  nop
/* A7CDC 800B74DC 0800E003 */  jr         $ra
/* A7CE0 800B74E0 1800BD27 */   addiu     $sp, $sp, 0x18
.size CINE_Play, . - CINE_Play
