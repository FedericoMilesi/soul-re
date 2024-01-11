.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel TimerTick
/* 159D8 800251D8 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 159DC 800251DC 0000A2AF */  sw         $v0, 0x0($sp)
/* 159E0 800251E0 0400A3AF */  sw         $v1, 0x4($sp)
/* 159E4 800251E4 0D80023C */  lui        $v0, (0x800D05F0 >> 16)
/* 159E8 800251E8 F0054234 */  ori        $v0, $v0, (0x800D05F0 & 0xFFFF)
/* 159EC 800251EC 0000438C */  lw         $v1, 0x0($v0)
/* 159F0 800251F0 00000000 */  nop
/* 159F4 800251F4 01006320 */  addi       $v1, $v1, 0x1 # handwritten instruction
/* 159F8 800251F8 000043AC */  sw         $v1, 0x0($v0)
/* 159FC 800251FC 0000A28F */  lw         $v0, 0x0($sp)
/* 15A00 80025200 0400A38F */  lw         $v1, 0x4($sp)
/* 15A04 80025204 0800BD27 */  addiu      $sp, $sp, 0x8
/* 15A08 80025208 0800E003 */  jr         $ra
/* 15A0C 8002520C 00000000 */   nop
.size TimerTick, . - TimerTick
