.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdLastPos
/* AE82C 800BE02C 0D80023C */  lui        $v0, %hi(CD_pos)
/* AE830 800BE030 0800E003 */  jr         $ra
/* AE834 800BE034 9CE94224 */   addiu     $v0, $v0, %lo(CD_pos)
.size CdLastPos, . - CdLastPos
