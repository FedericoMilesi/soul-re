.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C34C0
/* B3CC0 800C34C0 E6008294 */  lhu        $v0, 0xE6($a0)
/* B3CC4 800C34C4 00000000 */  nop
/* B3CC8 800C34C8 05004010 */  beqz       $v0, .L800C34E0
/* B3CCC 800C34CC FF000224 */   addiu     $v0, $zero, 0xFF
/* B3CD0 800C34D0 46008390 */  lbu        $v1, 0x46($a0)
/* B3CD4 800C34D4 00000000 */  nop
/* B3CD8 800C34D8 02006210 */  beq        $v1, $v0, .L800C34E4
/* B3CDC 800C34DC 21100000 */   addu      $v0, $zero, $zero
.L800C34E0:
/* B3CE0 800C34E0 01000224 */  addiu      $v0, $zero, 0x1
.L800C34E4:
/* B3CE4 800C34E4 0800E003 */  jr         $ra
/* B3CE8 800C34E8 00000000 */   nop
/* B3CEC 800C34EC 00000000 */  nop
/* B3CF0 800C34F0 00000000 */  nop
/* B3CF4 800C34F4 00000000 */  nop
.size func_800C34C0, . - func_800C34C0
