.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _padSetVsyncParam
/* B2B94 800C2394 0E80023C */  lui        $v0, %hi(StStartFrame + 0x18)
/* B2B98 800C2398 5CFD4224 */  addiu      $v0, $v0, %lo(StStartFrame + 0x18)
/* B2B9C 800C239C 0C80033C */  lui        $v1, %hi(func_800C2428)
/* B2BA0 800C23A0 28246324 */  addiu      $v1, $v1, %lo(func_800C2428)
/* B2BA4 800C23A4 000043AC */  sw         $v1, 0x0($v0)
/* B2BA8 800C23A8 0C80033C */  lui        $v1, %hi(func_800C23C0)
/* B2BAC 800C23AC C0236324 */  addiu      $v1, $v1, %lo(func_800C23C0)
/* B2BB0 800C23B0 040043AC */  sw         $v1, 0x4($v0)
/* B2BB4 800C23B4 FCFF40AC */  sw         $zero, -0x4($v0)
/* B2BB8 800C23B8 0800E003 */  jr         $ra
/* B2BBC 800C23BC 080040AC */   sw        $zero, 0x8($v0)
.size _padSetVsyncParam, . - _padSetVsyncParam
