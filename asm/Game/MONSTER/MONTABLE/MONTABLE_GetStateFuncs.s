.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONTABLE_GetStateFuncs
/* 7D894 8008D094 1C00828C */  lw         $v0, 0x1C($a0)
/* 7D898 8008D098 00000000 */  nop
/* 7D89C 8008D09C 4000428C */  lw         $v0, 0x40($v0)
/* 7D8A0 8008D0A0 00000000 */  nop
/* 7D8A4 8008D0A4 11004010 */  beqz       $v0, .L8008D0EC
/* 7D8A8 8008D0A8 C0180500 */   sll       $v1, $a1, 3
/* 7D8AC 8008D0AC 1400448C */  lw         $a0, 0x14($v0)
/* 7D8B0 8008D0B0 00000000 */  nop
/* 7D8B4 8008D0B4 0000838C */  lw         $v1, 0x0($a0)
/* 7D8B8 8008D0B8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7D8BC 8008D0BC 0A006210 */  beq        $v1, $v0, .L8008D0E8
/* 7D8C0 8008D0C0 21184000 */   addu      $v1, $v0, $zero
.L8008D0C4:
/* 7D8C4 8008D0C4 0000828C */  lw         $v0, 0x0($a0)
/* 7D8C8 8008D0C8 00000000 */  nop
/* 7D8CC 8008D0CC 0B00A210 */  beq        $a1, $v0, .L8008D0FC
/* 7D8D0 8008D0D0 04008224 */   addiu     $v0, $a0, 0x4
/* 7D8D4 8008D0D4 0C008424 */  addiu      $a0, $a0, 0xC
/* 7D8D8 8008D0D8 0000828C */  lw         $v0, 0x0($a0)
/* 7D8DC 8008D0DC 00000000 */  nop
/* 7D8E0 8008D0E0 F8FF4314 */  bne        $v0, $v1, .L8008D0C4
/* 7D8E4 8008D0E4 00000000 */   nop
.L8008D0E8:
/* 7D8E8 8008D0E8 C0180500 */  sll        $v1, $a1, 3
.L8008D0EC:
/* 7D8EC 8008D0EC 0D80023C */  lui        $v0, %hi(DefaultStateTable)
/* 7D8F0 8008D0F0 04C54224 */  addiu      $v0, $v0, %lo(DefaultStateTable)
/* 7D8F4 8008D0F4 0800E003 */  jr         $ra
/* 7D8F8 8008D0F8 21106200 */   addu      $v0, $v1, $v0
.L8008D0FC:
/* 7D8FC 8008D0FC 0800E003 */  jr         $ra
/* 7D900 8008D100 00000000 */   nop
.size MONTABLE_GetStateFuncs, . - MONTABLE_GetStateFuncs
