.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BCE18
/* AD618 800BCE18 0000888C */  lw         $t0, 0x0($a0)
/* AD61C 800BCE1C 04008A8C */  lw         $t2, 0x4($a0)
/* AD620 800BCE20 034C0800 */  sra        $t1, $t0, 16
/* AD624 800BCE24 FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* AD628 800BCE28 FFFF4A31 */  andi       $t2, $t2, 0xFFFF
/* AD62C 800BCE2C 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* AD630 800BCE30 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* AD634 800BCE34 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* AD638 800BCE38 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* AD63C 800BCE3C 00000000 */  nop
/* AD640 800BCE40 3D00984B */  GPF        1
/* AD644 800BCE44 0000A88C */  lw         $t0, 0x0($a1)
/* AD648 800BCE48 0400AA8C */  lw         $t2, 0x4($a1)
/* AD64C 800BCE4C 034C0800 */  sra        $t1, $t0, 16
/* AD650 800BCE50 FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* AD654 800BCE54 FFFF4A31 */  andi       $t2, $t2, 0xFFFF
/* AD658 800BCE58 00F80248 */  mfc2       $v0, $31 # handwritten instruction
/* AD65C 800BCE5C 00408748 */  mtc2       $a3, $8 # handwritten instruction
/* AD660 800BCE60 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* AD664 800BCE64 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* AD668 800BCE68 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* AD66C 800BCE6C 00000000 */  nop
/* AD670 800BCE70 3E00A84B */  GPL        1
/* AD674 800BCE74 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* AD678 800BCE78 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* AD67C 800BCE7C FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* AD680 800BCE80 004C0900 */  sll        $t1, $t1, 16
/* AD684 800BCE84 25400901 */  or         $t0, $t0, $t1
/* AD688 800BCE88 1000AD8F */  lw         $t5, 0x10($sp)
/* AD68C 800BCE8C 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* AD690 800BCE90 0000A8AD */  sw         $t0, 0x0($t5)
/* AD694 800BCE94 0400AAAD */  sw         $t2, 0x4($t5)
/* AD698 800BCE98 0800E003 */  jr         $ra
/* AD69C 800BCE9C 00000000 */   nop
.size func_800BCE18, . - func_800BCE18
