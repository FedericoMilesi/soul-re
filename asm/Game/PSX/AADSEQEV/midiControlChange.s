.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiControlChange
/* 464B8 80055CB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 464BC 80055CBC 1000BFAF */  sw         $ra, 0x10($sp)
/* 464C0 80055CC0 06008290 */  lbu        $v0, 0x6($a0)
/* 464C4 80055CC4 AC9C8327 */  addiu      $v1, $gp, %gp_rel(midiControlFunction)
/* 464C8 80055CC8 0F004230 */  andi       $v0, $v0, 0xF
/* 464CC 80055CCC 80100200 */  sll        $v0, $v0, 2
/* 464D0 80055CD0 21104300 */  addu       $v0, $v0, $v1
/* 464D4 80055CD4 0000428C */  lw         $v0, 0x0($v0)
/* 464D8 80055CD8 00000000 */  nop
/* 464DC 80055CDC 09F84000 */  jalr       $v0
/* 464E0 80055CE0 00000000 */   nop
/* 464E4 80055CE4 1000BF8F */  lw         $ra, 0x10($sp)
/* 464E8 80055CE8 00000000 */  nop
/* 464EC 80055CEC 0800E003 */  jr         $ra
/* 464F0 80055CF0 1800BD27 */   addiu     $sp, $sp, 0x18
.size midiControlChange, . - midiControlChange
