.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BFF30
/* B0730 800BFF30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B0734 800BFF34 1000B0AF */  sw         $s0, 0x10($sp)
/* B0738 800BFF38 2180A000 */  addu       $s0, $a1, $zero
/* B073C 800BFF3C 0700023C */  lui        $v0, (0x7EFF0 >> 16)
/* B0740 800BFF40 F0EF4234 */  ori        $v0, $v0, (0x7EFF0 & 0xFFFF)
/* B0744 800BFF44 2B105000 */  sltu       $v0, $v0, $s0
/* B0748 800BFF48 03004010 */  beqz       $v0, .L800BFF58
/* B074C 800BFF4C 1400BFAF */   sw        $ra, 0x14($sp)
/* B0750 800BFF50 0700103C */  lui        $s0, (0x7EFF0 >> 16)
/* B0754 800BFF54 F0EF1036 */  ori        $s0, $s0, (0x7EFF0 & 0xFFFF)
.L800BFF58:
/* B0758 800BFF58 091A030C */  jal        func_800C6824
/* B075C 800BFF5C 21280002 */   addu      $a1, $s0, $zero
/* B0760 800BFF60 0D80023C */  lui        $v0, %hi(_spu_transferCallback)
/* B0764 800BFF64 94ED428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
/* B0768 800BFF68 00000000 */  nop
/* B076C 800BFF6C 03004014 */  bnez       $v0, .L800BFF7C
/* B0770 800BFF70 21100002 */   addu      $v0, $s0, $zero
/* B0774 800BFF74 0D80013C */  lui        $at, %hi(_spu_inTransfer)
/* B0778 800BFF78 90ED20AC */  sw         $zero, %lo(_spu_inTransfer)($at)
.L800BFF7C:
/* B077C 800BFF7C 1400BF8F */  lw         $ra, 0x14($sp)
/* B0780 800BFF80 1000B08F */  lw         $s0, 0x10($sp)
/* B0784 800BFF84 0800E003 */  jr         $ra
/* B0788 800BFF88 1800BD27 */   addiu     $sp, $sp, 0x18
/* B078C 800BFF8C 00000000 */  nop
.size func_800BFF30, . - func_800BFF30
