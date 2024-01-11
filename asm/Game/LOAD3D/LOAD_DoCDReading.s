.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_DoCDReading
/* 27E04 80037604 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 27E08 80037608 1000B0AF */  sw         $s0, 0x10($sp)
/* 27E0C 8003760C C0BB908F */  lw         $s0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27E10 80037610 9CBB828F */  lw         $v0, %gp_rel(loadStatus + 0x8)($gp)
/* 27E14 80037614 C8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x34)($gp)
/* 27E18 80037618 1400BFAF */  sw         $ra, 0x14($sp)
/* 27E1C 8003761C 23204300 */  subu       $a0, $v0, $v1
/* 27E20 80037620 C8BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x34)($gp)
/* 27E24 80037624 08008010 */  beqz       $a0, .L80037648
/* 27E28 80037628 05000224 */   addiu     $v0, $zero, 0x5
/* 27E2C 8003762C B0BB828F */  lw         $v0, %gp_rel(loadStatus + 0x1C)($gp)
/* 27E30 80037630 00000000 */  nop
/* 27E34 80037634 04004010 */  beqz       $v0, .L80037648
/* 27E38 80037638 05000224 */   addiu     $v0, $zero, 0x5
/* 27E3C 8003763C 70DD000C */  jal        LOAD_UpdateCheckSum
/* 27E40 80037640 00000000 */   nop
/* 27E44 80037644 05000224 */  addiu      $v0, $zero, 0x5
.L80037648:
/* 27E48 80037648 15000216 */  bne        $s0, $v0, .L800376A0
/* 27E4C 8003764C 00000000 */   nop
/* 27E50 80037650 B0BB828F */  lw         $v0, %gp_rel(loadStatus + 0x1C)($gp)
/* 27E54 80037654 00000000 */  nop
/* 27E58 80037658 09004010 */  beqz       $v0, .L80037680
/* 27E5C 8003765C 00000000 */   nop
/* 27E60 80037660 E8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x54)($gp)
/* 27E64 80037664 ACBB828F */  lw         $v0, %gp_rel(loadStatus + 0x18)($gp)
/* 27E68 80037668 00000000 */  nop
/* 27E6C 8003766C 04006210 */  beq        $v1, $v0, .L80037680
/* 27E70 80037670 07000224 */   addiu     $v0, $zero, 0x7
/* 27E74 80037674 A8BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x14)($gp)
/* 27E78 80037678 A8DD0008 */  j          .L800376A0
/* 27E7C 8003767C 00000000 */   nop
.L80037680:
/* 27E80 80037680 24BC828F */  lw         $v0, %gp_rel(loadStatus + 0x90)($gp)
/* 27E84 80037684 A8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x14)($gp)
/* 27E88 80037688 05004010 */  beqz       $v0, .L800376A0
/* 27E8C 8003768C 00000000 */   nop
/* 27E90 80037690 F8BB848F */  lw         $a0, %gp_rel(loadStatus + 0x64)($gp)
/* 27E94 80037694 24BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x90)($gp)
/* 27E98 80037698 B541010C */  jal        MEMPACK_SetMemoryDoneStreamed
/* 27E9C 8003769C 00000000 */   nop
.L800376A0:
/* 27EA0 800376A0 1400BF8F */  lw         $ra, 0x14($sp)
/* 27EA4 800376A4 1000B08F */  lw         $s0, 0x10($sp)
/* 27EA8 800376A8 0800E003 */  jr         $ra
/* 27EAC 800376AC 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_DoCDReading, . - LOAD_DoCDReading
