.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CINE_Loaded
/* A7D88 800B7588 0D80023C */  lui        $v0, %hi(the_cine_tracker)
/* A7D8C 800B758C 78C8428C */  lw         $v0, %lo(the_cine_tracker)($v0)
/* A7D90 800B7590 0800E003 */  jr         $ra
/* A7D94 800B7594 2B100200 */   sltu      $v0, $zero, $v0
.size CINE_Loaded, . - CINE_Loaded
