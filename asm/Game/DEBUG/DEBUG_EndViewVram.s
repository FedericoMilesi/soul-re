.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_EndViewVram
/* 4E2C 8001462C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4E30 80014630 5CBC8427 */  addiu      $a0, $gp, %gp_rel(disp)
/* 4E34 80014634 21280000 */  addu       $a1, $zero, $zero
/* 4E38 80014638 2130A000 */  addu       $a2, $a1, $zero
/* 4E3C 8001463C 00020724 */  addiu      $a3, $zero, 0x200
/* 4E40 80014640 1800B0AF */  sw         $s0, 0x18($sp)
/* 4E44 80014644 F0001024 */  addiu      $s0, $zero, 0xF0
/* 4E48 80014648 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 4E4C 8001464C E2F2020C */  jal        SetDefDispEnv
/* 4E50 80014650 1000B0AF */   sw        $s0, 0x10($sp)
/* 4E54 80014654 70BC8427 */  addiu      $a0, $gp, %gp_rel(disp + 0x14)
/* 4E58 80014658 21280000 */  addu       $a1, $zero, $zero
/* 4E5C 8001465C 00010624 */  addiu      $a2, $zero, 0x100
/* 4E60 80014660 00020724 */  addiu      $a3, $zero, 0x200
/* 4E64 80014664 E2F2020C */  jal        SetDefDispEnv
/* 4E68 80014668 1000B0AF */   sw        $s0, 0x10($sp)
/* 4E6C 8001466C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4E70 80014670 1800B08F */  lw         $s0, 0x18($sp)
/* 4E74 80014674 0800E003 */  jr         $ra
/* 4E78 80014678 2000BD27 */   addiu     $sp, $sp, 0x20
.size DEBUG_EndViewVram, . - DEBUG_EndViewVram
