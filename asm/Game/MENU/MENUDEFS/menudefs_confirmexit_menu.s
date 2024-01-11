.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menudefs_confirmexit_menu
/* A97C4 800B8FC4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A97C8 800B8FC8 1800B0AF */  sw         $s0, 0x18($sp)
/* A97CC 800B8FCC 21808000 */  addu       $s0, $a0, $zero
/* A97D0 800B8FD0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A97D4 800B8FD4 2000BFAF */  sw         $ra, 0x20($sp)
/* A97D8 800B8FD8 20AA80AF */  sw         $zero, %gp_rel(hack_attract)($gp)
/* A97DC 800B8FDC 7CE1020C */  jal        do_check_controller
/* A97E0 800B8FE0 2188A000 */   addu      $s1, $a1, $zero
/* A97E4 800B8FE4 B3DD020C */  jal        localstr_get
/* A97E8 800B8FE8 25000424 */   addiu     $a0, $zero, 0x25
/* A97EC 800B8FEC 21280000 */  addu       $a1, $zero, $zero
/* A97F0 800B8FF0 2130A000 */  addu       $a2, $a1, $zero
/* A97F4 800B8FF4 1000A2AF */  sw         $v0, 0x10($sp)
/* A97F8 800B8FF8 2000048E */  lw         $a0, 0x20($s0)
/* A97FC 800B8FFC 0FDE020C */  jal        menu_item_flags
/* A9800 800B9000 04000724 */   addiu     $a3, $zero, 0x4
/* A9804 800B9004 B3DD020C */  jal        localstr_get
/* A9808 800B9008 1A000424 */   addiu     $a0, $zero, 0x1A
/* A980C 800B900C 0C80053C */  lui        $a1, %hi(do_pop_menu)
/* A9810 800B9010 5C86A524 */  addiu      $a1, $a1, %lo(do_pop_menu)
/* A9814 800B9014 21300000 */  addu       $a2, $zero, $zero
/* A9818 800B9018 2000048E */  lw         $a0, 0x20($s0)
/* A981C 800B901C 33DE020C */  jal        menu_item
/* A9820 800B9020 21384000 */   addu      $a3, $v0, $zero
/* A9824 800B9024 B3DD020C */  jal        localstr_get
/* A9828 800B9028 36000424 */   addiu     $a0, $zero, 0x36
/* A982C 800B902C 0C80053C */  lui        $a1, %hi(do_function)
/* A9830 800B9030 9486A524 */  addiu      $a1, $a1, %lo(do_function)
/* A9834 800B9034 0180063C */  lui        $a2, %hi(DEBUG_ExitGame)
/* A9838 800B9038 8044C624 */  addiu      $a2, $a2, %lo(DEBUG_ExitGame)
/* A983C 800B903C 2000048E */  lw         $a0, 0x20($s0)
/* A9840 800B9040 33DE020C */  jal        menu_item
/* A9844 800B9044 21384000 */   addu      $a3, $v0, $zero
/* A9848 800B9048 21102002 */  addu       $v0, $s1, $zero
/* A984C 800B904C 02004104 */  bgez       $v0, .L800B9058
/* A9850 800B9050 00000000 */   nop
/* A9854 800B9054 01000224 */  addiu      $v0, $zero, 0x1
.L800B9058:
/* A9858 800B9058 2000BF8F */  lw         $ra, 0x20($sp)
/* A985C 800B905C 1C00B18F */  lw         $s1, 0x1C($sp)
/* A9860 800B9060 1800B08F */  lw         $s0, 0x18($sp)
/* A9864 800B9064 0800E003 */  jr         $ra
/* A9868 800B9068 2800BD27 */   addiu     $sp, $sp, 0x28
.size menudefs_confirmexit_menu, . - menudefs_confirmexit_menu
