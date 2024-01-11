.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadStopSfx
/* 4775C 80056F5C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 47760 80056F60 1800B0AF */  sw         $s0, 0x18($sp)
/* 47764 80056F64 21808000 */  addu       $s0, $a0, $zero
/* 47768 80056F68 01000424 */  addiu      $a0, $zero, 0x1
/* 4776C 80056F6C 21280000 */  addu       $a1, $zero, $zero
/* 47770 80056F70 2130A000 */  addu       $a2, $a1, $zero
/* 47774 80056F74 21380002 */  addu       $a3, $s0, $zero
/* 47778 80056F78 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 4777C 80056F7C AA5C010C */  jal        aadPutSfxCommand
/* 47780 80056F80 1000A0AF */   sw        $zero, 0x10($sp)
/* 47784 80056F84 21100002 */  addu       $v0, $s0, $zero
/* 47788 80056F88 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4778C 80056F8C 1800B08F */  lw         $s0, 0x18($sp)
/* 47790 80056F90 0800E003 */  jr         $ra
/* 47794 80056F94 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadStopSfx, . - aadStopSfx
