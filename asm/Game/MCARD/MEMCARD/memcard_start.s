.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_start
/* AA140 800B9940 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA144 800B9944 1000B0AF */  sw         $s0, 0x10($sp)
/* AA148 800B9948 0D80103C */  lui        $s0, %hi(gameTrackerX)
/* AA14C 800B994C 60331026 */  addiu      $s0, $s0, %lo(gameTrackerX)
/* AA150 800B9950 1400BFAF */  sw         $ra, 0x14($sp)
/* AA154 800B9954 4401028E */  lw         $v0, 0x144($s0)
/* AA158 800B9958 0001033C */  lui        $v1, (0x1000000 >> 16)
/* AA15C 800B995C 25104300 */  or         $v0, $v0, $v1
/* AA160 800B9960 AFE4000C */  jal        MAIN_StartGame
/* AA164 800B9964 440102AE */   sw        $v0, 0x144($s0)
/* AA168 800B9968 2400048E */  lw         $a0, 0x24($s0)
/* AA16C 800B996C E6E5020C */  jal        memcard_end
/* AA170 800B9970 00000000 */   nop
/* AA174 800B9974 1400BF8F */  lw         $ra, 0x14($sp)
/* AA178 800B9978 1000B08F */  lw         $s0, 0x10($sp)
/* AA17C 800B997C 0800E003 */  jr         $ra
/* AA180 800B9980 1800BD27 */   addiu     $sp, $sp, 0x18
.size memcard_start, . - memcard_start
