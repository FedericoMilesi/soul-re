.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_load
/* AA184 800B9984 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA188 800B9988 1000B0AF */  sw         $s0, 0x10($sp)
/* AA18C 800B998C 0D80103C */  lui        $s0, %hi(gameTrackerX)
/* AA190 800B9990 60331026 */  addiu      $s0, $s0, %lo(gameTrackerX)
/* AA194 800B9994 1400BFAF */  sw         $ra, 0x14($sp)
/* AA198 800B9998 4401028E */  lw         $v0, 0x144($s0)
/* AA19C 800B999C 2000033C */  lui        $v1, (0x200000 >> 16)
/* AA1A0 800B99A0 25104300 */  or         $v0, $v0, $v1
/* AA1A4 800B99A4 50DA020C */  jal        SAVE_RestoreGame
/* AA1A8 800B99A8 440102AE */   sw        $v0, 0x144($s0)
/* AA1AC 800B99AC AFE4000C */  jal        MAIN_StartGame
/* AA1B0 800B99B0 00000000 */   nop
/* AA1B4 800B99B4 2400048E */  lw         $a0, 0x24($s0)
/* AA1B8 800B99B8 E6E5020C */  jal        memcard_end
/* AA1BC 800B99BC 00000000 */   nop
/* AA1C0 800B99C0 1400BF8F */  lw         $ra, 0x14($sp)
/* AA1C4 800B99C4 1000B08F */  lw         $s0, 0x10($sp)
/* AA1C8 800B99C8 0800E003 */  jr         $ra
/* AA1CC 800B99CC 1800BD27 */   addiu     $sp, $sp, 0x18
.size memcard_load, . - memcard_load
