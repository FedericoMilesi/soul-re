.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONAPI_SetLookAround
/* 6FACC 8007F2CC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6FAD0 8007F2D0 1400BFAF */  sw         $ra, 0x14($sp)
/* 6FAD4 8007F2D4 1000B0AF */  sw         $s0, 0x10($sp)
/* 6FAD8 8007F2D8 6C01908C */  lw         $s0, 0x16C($a0)
/* 6FADC 8007F2DC 9E09020C */  jal        MON_EnableHeadMove
/* 6FAE0 8007F2E0 00000000 */   nop
/* 6FAE4 8007F2E4 0800023C */  lui        $v0, (0x80000 >> 16)
/* 6FAE8 8007F2E8 080102AE */  sw         $v0, 0x108($s0)
/* 6FAEC 8007F2EC 1400BF8F */  lw         $ra, 0x14($sp)
/* 6FAF0 8007F2F0 1000B08F */  lw         $s0, 0x10($sp)
/* 6FAF4 8007F2F4 0800E003 */  jr         $ra
/* 6FAF8 8007F2F8 1800BD27 */   addiu     $sp, $sp, 0x18
.size MONAPI_SetLookAround, . - MONAPI_SetLookAround
