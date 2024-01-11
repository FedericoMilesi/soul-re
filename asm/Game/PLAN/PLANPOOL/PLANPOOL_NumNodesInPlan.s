.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_NumNodesInPlan
/* 899D4 800991D4 12008394 */  lhu        $v1, 0x12($a0)
/* 899D8 800991D8 80640208 */  j          .L80099200
/* 899DC 800991DC 21300000 */   addu      $a2, $zero, $zero
.L800991E0:
/* 899E0 800991E0 12008394 */  lhu        $v1, 0x12($a0)
/* 899E4 800991E4 00000000 */  nop
/* 899E8 800991E8 C0100300 */  sll        $v0, $v1, 3
/* 899EC 800991EC 23104300 */  subu       $v0, $v0, $v1
/* 899F0 800991F0 80100200 */  sll        $v0, $v0, 2
/* 899F4 800991F4 2120A200 */  addu       $a0, $a1, $v0
/* 899F8 800991F8 12008394 */  lhu        $v1, 0x12($a0)
/* 899FC 800991FC 0100C624 */  addiu      $a2, $a2, 0x1
.L80099200:
/* 89A00 80099200 C0100300 */  sll        $v0, $v1, 3
/* 89A04 80099204 23104300 */  subu       $v0, $v0, $v1
/* 89A08 80099208 80100200 */  sll        $v0, $v0, 2
/* 89A0C 8009920C 2110A200 */  addu       $v0, $a1, $v0
/* 89A10 80099210 F3FF8214 */  bne        $a0, $v0, .L800991E0
/* 89A14 80099214 0100C224 */   addiu     $v0, $a2, 0x1
/* 89A18 80099218 0800E003 */  jr         $ra
/* 89A1C 8009921C 00000000 */   nop
.size PLANPOOL_NumNodesInPlan, . - PLANPOOL_NumNodesInPlan
