.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE12C
/* AE92C 800BE12C 0D80023C */  lui        $v0, %hi(CD_cbready)
/* AE930 800BE130 88E9428C */  lw         $v0, %lo(CD_cbready)($v0)
/* AE934 800BE134 0D80013C */  lui        $at, %hi(CD_cbready)
/* AE938 800BE138 0800E003 */  jr         $ra
/* AE93C 800BE13C 88E924AC */   sw        $a0, %lo(CD_cbready)($at)
.size func_800BE12C, . - func_800BE12C
