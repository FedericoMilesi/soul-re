.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_GetNodeTypeOfNextWaypoint
/* 87920 80097120 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 87924 80097124 1000B0AF */  sw         $s0, 0x10($sp)
/* 87928 80097128 21808000 */  addu       $s0, $a0, $zero
/* 8792C 8009712C 1400B1AF */  sw         $s1, 0x14($sp)
/* 87930 80097130 DCBF918F */  lw         $s1, %gp_rel(gameTrackerX + 0x214)($gp)
/* 87934 80097134 21280002 */  addu       $a1, $s0, $zero
/* 87938 80097138 1800BFAF */  sw         $ra, 0x18($sp)
/* 8793C 8009713C 375C020C */  jal        ValidSlotAndState
/* 87940 80097140 21202002 */   addu      $a0, $s1, $zero
/* 87944 80097144 03004014 */  bnez       $v0, .L80097154
/* 87948 80097148 40101000 */   sll       $v0, $s0, 1
/* 8794C 8009714C 5E5C0208 */  j          .L80097178
/* 87950 80097150 40000224 */   addiu     $v0, $zero, 0x40
.L80097154:
/* 87954 80097154 21105000 */  addu       $v0, $v0, $s0
/* 87958 80097158 00110200 */  sll        $v0, $v0, 4
/* 8795C 8009715C 23105000 */  subu       $v0, $v0, $s0
/* 87960 80097160 40100200 */  sll        $v0, $v0, 1
/* 87964 80097164 21102202 */  addu       $v0, $s1, $v0
/* 87968 80097168 02004390 */  lbu        $v1, 0x2($v0)
/* 8796C 8009716C 00000000 */  nop
/* 87970 80097170 21104300 */  addu       $v0, $v0, $v1
/* 87974 80097174 1E004290 */  lbu        $v0, 0x1E($v0)
.L80097178:
/* 87978 80097178 1800BF8F */  lw         $ra, 0x18($sp)
/* 8797C 8009717C 1400B18F */  lw         $s1, 0x14($sp)
/* 87980 80097180 1000B08F */  lw         $s0, 0x10($sp)
/* 87984 80097184 0800E003 */  jr         $ra
/* 87988 80097188 2000BD27 */   addiu     $sp, $sp, 0x20
.size ENMYPLAN_GetNodeTypeOfNextWaypoint, . - ENMYPLAN_GetNodeTypeOfNextWaypoint
