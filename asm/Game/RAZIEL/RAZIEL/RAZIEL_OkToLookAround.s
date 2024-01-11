.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_OkToLookAround
/* A4C58 800B4458 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A4C5C 800B445C 00000000 */  nop
/* A4C60 800B4460 04004230 */  andi       $v0, $v0, 0x4
/* A4C64 800B4464 0A004010 */  beqz       $v0, .L800B4490
/* A4C68 800B4468 0B80023C */   lui       $v0, %hi(StateHandlerIdle)
/* A4C6C 800B446C 3CF6838F */  lw         $v1, %gp_rel(Raziel + 0xC)($gp)
/* A4C70 800B4470 E0844224 */  addiu      $v0, $v0, %lo(StateHandlerIdle)
/* A4C74 800B4474 04006210 */  beq        $v1, $v0, .L800B4488
/* A4C78 800B4478 0A80023C */   lui       $v0, %hi(StateHandlerThrow2)
/* A4C7C 800B447C E4D74224 */  addiu      $v0, $v0, %lo(StateHandlerThrow2)
/* A4C80 800B4480 03006214 */  bne        $v1, $v0, .L800B4490
/* A4C84 800B4484 00000000 */   nop
.L800B4488:
/* A4C88 800B4488 0800E003 */  jr         $ra
/* A4C8C 800B448C 01000224 */   addiu     $v0, $zero, 0x1
.L800B4490:
/* A4C90 800B4490 58F7838F */  lw         $v1, %gp_rel(Raziel + 0x128)($gp)
/* A4C94 800B4494 0A80023C */  lui        $v0, %hi(StateHandlerSwim)
/* A4C98 800B4498 0C024224 */  addiu      $v0, $v0, %lo(StateHandlerSwim)
/* A4C9C 800B449C FAFF6210 */  beq        $v1, $v0, .L800B4488
/* A4CA0 800B44A0 0A80023C */   lui       $v0, %hi(StateHandlerSwimTread)
/* A4CA4 800B44A4 B8F64224 */  addiu      $v0, $v0, %lo(StateHandlerSwimTread)
/* A4CA8 800B44A8 F7FF6210 */  beq        $v1, $v0, .L800B4488
/* A4CAC 800B44AC 21100000 */   addu      $v0, $zero, $zero
/* A4CB0 800B44B0 0800E003 */  jr         $ra
/* A4CB4 800B44B4 00000000 */   nop
.size RAZIEL_OkToLookAround, . - RAZIEL_OkToLookAround
