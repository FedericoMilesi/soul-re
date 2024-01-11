.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel process_menu_line
/* 4288 80013A88 108A828F */  lw         $v0, %gp_rel(debugMenuChoice)($gp)
/* 428C 80013A8C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4290 80013A90 1000BFAF */  sw         $ra, 0x10($sp)
/* 4294 80013A94 40180200 */  sll        $v1, $v0, 1
/* 4298 80013A98 21186200 */  addu       $v1, $v1, $v0
/* 429C 80013A9C C0180300 */  sll        $v1, $v1, 3
/* 42A0 80013AA0 2128A300 */  addu       $a1, $a1, $v1
/* 42A4 80013AA4 0000A38C */  lw         $v1, 0x0($a1)
/* 42A8 80013AA8 00000000 */  nop
/* 42AC 80013AAC 0500622C */  sltiu      $v0, $v1, 0x5
/* 42B0 80013AB0 0A004010 */  beqz       $v0, .L80013ADC
/* 42B4 80013AB4 C0180300 */   sll       $v1, $v1, 3
/* 42B8 80013AB8 0D80023C */  lui        $v0, %hi(debug_dispatch_table)
/* 42BC 80013ABC 989F4224 */  addiu      $v0, $v0, %lo(debug_dispatch_table)
/* 42C0 80013AC0 21186200 */  addu       $v1, $v1, $v0
/* 42C4 80013AC4 0400628C */  lw         $v0, 0x4($v1)
/* 42C8 80013AC8 00000000 */  nop
/* 42CC 80013ACC 03004010 */  beqz       $v0, .L80013ADC
/* 42D0 80013AD0 00000000 */   nop
/* 42D4 80013AD4 09F84000 */  jalr       $v0
/* 42D8 80013AD8 00000000 */   nop
.L80013ADC:
/* 42DC 80013ADC 1000BF8F */  lw         $ra, 0x10($sp)
/* 42E0 80013AE0 00000000 */  nop
/* 42E4 80013AE4 0800E003 */  jr         $ra
/* 42E8 80013AE8 1800BD27 */   addiu     $sp, $sp, 0x18
.size process_menu_line, . - process_menu_line
