.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _putchar_flash
/* B7CCC 800C74CC 0D80063C */  lui        $a2, %hi(_spu_rev_param + 0x2B4)
/* B7CD0 800C74D0 A0F4C68C */  lw         $a2, %lo(_spu_rev_param + 0x2B4)($a2)
/* B7CD4 800C74D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B7CD8 800C74D8 0700C018 */  blez       $a2, .L800C74F8
/* B7CDC 800C74DC 1000BFAF */   sw        $ra, 0x10($sp)
/* B7CE0 800C74E0 0E80053C */  lui        $a1, %hi(_spu_RQ + 0x24)
/* B7CE4 800C74E4 E0FDA524 */  addiu      $a1, $a1, %lo(_spu_RQ + 0x24)
/* B7CE8 800C74E8 7E1D030C */  jal        write
/* B7CEC 800C74EC 01000424 */   addiu     $a0, $zero, 0x1
/* B7CF0 800C74F0 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2B4)
/* B7CF4 800C74F4 A0F420AC */  sw         $zero, %lo(_spu_rev_param + 0x2B4)($at)
.L800C74F8:
/* B7CF8 800C74F8 1000BF8F */  lw         $ra, 0x10($sp)
/* B7CFC 800C74FC 1800BD27 */  addiu      $sp, $sp, 0x18
/* B7D00 800C7500 0800E003 */  jr         $ra
/* B7D04 800C7504 00000000 */   nop
.size _putchar_flash, . - _putchar_flash
