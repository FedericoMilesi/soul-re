.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BA058
/* AA858 800BA058 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA85C 800BA05C 1000B0AF */  sw         $s0, 0x10($sp)
/* AA860 800BA060 0D80103C */  lui        $s0, %hi(the_attract_movies + 0x68)
/* AA864 800BA064 14C91026 */  addiu      $s0, $s0, %lo(the_attract_movies + 0x68)
/* AA868 800BA068 1400BFAF */  sw         $ra, 0x14($sp)
/* AA86C 800BA06C 00000296 */  lhu        $v0, 0x0($s0)
/* AA870 800BA070 00000000 */  nop
/* AA874 800BA074 11004014 */  bnez       $v0, .L800BA0BC
/* AA878 800BA078 00000000 */   nop
/* AA87C 800BA07C C807030C */  jal        HookEntryInt
/* AA880 800BA080 38000426 */   addiu     $a0, $s0, 0x38
/* AA884 800BA084 0D80043C */  lui        $a0, %hi(the_attract_movies + 0x10F8)
/* AA888 800BA088 A4D9848C */  lw         $a0, %lo(the_attract_movies + 0x10F8)($a0)
/* AA88C 800BA08C 32000396 */  lhu        $v1, 0x32($s0)
/* AA890 800BA090 01000224 */  addiu      $v0, $zero, 0x1
/* AA894 800BA094 000002A6 */  sh         $v0, 0x0($s0)
/* AA898 800BA098 000083A4 */  sh         $v1, 0x0($a0)
/* AA89C 800BA09C 0D80033C */  lui        $v1, %hi(the_attract_movies + 0x10FC)
/* AA8A0 800BA0A0 A8D9638C */  lw         $v1, %lo(the_attract_movies + 0x10FC)($v1)
/* AA8A4 800BA0A4 3400028E */  lw         $v0, 0x34($s0)
/* AA8A8 800BA0A8 00000000 */  nop
/* AA8AC 800BA0AC 11FC020C */  jal        ExitCriticalSection
/* AA8B0 800BA0B0 000062AC */   sw        $v0, 0x0($v1)
/* AA8B4 800BA0B4 30E80208 */  j          .L800BA0C0
/* AA8B8 800BA0B8 21100002 */   addu      $v0, $s0, $zero
.L800BA0BC:
/* AA8BC 800BA0BC 21100000 */  addu       $v0, $zero, $zero
.L800BA0C0:
/* AA8C0 800BA0C0 1400BF8F */  lw         $ra, 0x14($sp)
/* AA8C4 800BA0C4 1000B08F */  lw         $s0, 0x10($sp)
/* AA8C8 800BA0C8 0800E003 */  jr         $ra
/* AA8CC 800BA0CC 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BA058, . - func_800BA058
