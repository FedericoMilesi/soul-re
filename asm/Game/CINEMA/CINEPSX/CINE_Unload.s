.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CINE_Unload
/* A7D98 800B7598 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7D9C 800B759C 0480043C */  lui        $a0, %hi(VblTick)
/* A7DA0 800B75A0 C08B8424 */  addiu      $a0, $a0, %lo(VblTick)
/* A7DA4 800B75A4 1400BFAF */  sw         $ra, 0x14($sp)
/* A7DA8 800B75A8 C3E6020C */  jal        VSyncCallback
/* A7DAC 800B75AC 1000B0AF */   sw        $s0, 0x10($sp)
/* A7DB0 800B75B0 0D80103C */  lui        $s0, %hi(the_cine_tracker)
/* A7DB4 800B75B4 78C8048E */  lw         $a0, %lo(the_cine_tracker)($s0)
/* A7DB8 800B75B8 0D80023C */  lui        $v0, %hi(the_cine_table)
/* A7DBC 800B75BC 04008010 */  beqz       $a0, .L800B75D0
/* A7DC0 800B75C0 74C840AC */   sw        $zero, %lo(the_cine_table)($v0)
/* A7DC4 800B75C4 EC64010C */  jal        STREAM_DumpObject
/* A7DC8 800B75C8 00000000 */   nop
/* A7DCC 800B75CC 78C800AE */  sw         $zero, %lo(the_cine_tracker)($s0)
.L800B75D0:
/* A7DD0 800B75D0 1400BF8F */  lw         $ra, 0x14($sp)
/* A7DD4 800B75D4 1000B08F */  lw         $s0, 0x10($sp)
/* A7DD8 800B75D8 0800E003 */  jr         $ra
/* A7DDC 800B75DC 1800BD27 */   addiu     $sp, $sp, 0x18
.size CINE_Unload, . - CINE_Unload
