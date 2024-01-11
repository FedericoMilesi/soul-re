.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_SetupRenderFunction
/* 1FE80 8002F680 0280023C */  lui        $v0, %hi(DRAW_AnimatedModel_S)
/* 1FE84 8002F684 1C524224 */  addiu      $v0, $v0, %lo(DRAW_AnimatedModel_S)
/* 1FE88 8002F688 4C0182AC */  sw         $v0, 0x14C($a0)
/* 1FE8C 8002F68C 0280023C */  lui        $v0, %hi(DRAW_DisplayPolytopeList_S)
/* 1FE90 8002F690 346F4224 */  addiu      $v0, $v0, %lo(DRAW_DisplayPolytopeList_S)
/* 1FE94 8002F694 0800E003 */  jr         $ra
/* 1FE98 8002F698 500182AC */   sw        $v0, 0x150($a0)
.size GAMELOOP_SetupRenderFunction, . - GAMELOOP_SetupRenderFunction
