.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_ClearMemory
/* A5A80 800B5280 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A5A84 800B5284 21280000 */  addu       $a1, $zero, $zero
/* A5A88 800B5288 DCFD828F */  lw         $v0, %gp_rel(savedInfoTracker)($gp)
/* A5A8C 800B528C 48A8838F */  lw         $v1, %gp_rel(the_header_size)($gp)
/* A5A90 800B5290 00600624 */  addiu      $a2, $zero, 0x6000
/* A5A94 800B5294 1000BFAF */  sw         $ra, 0x10($sp)
/* A5A98 800B5298 21204300 */  addu       $a0, $v0, $v1
/* A5A9C 800B529C 00604224 */  addiu      $v0, $v0, 0x6000
/* A5AA0 800B52A0 E0FD84AF */  sw         $a0, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A5AA4 800B52A4 E4FD84AF */  sw         $a0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A5AA8 800B52A8 E8FD82AF */  sw         $v0, %gp_rel(savedInfoTracker + 0xC)($gp)
/* A5AAC 800B52AC 2EF2020C */  jal        func_800BC8B8
/* A5AB0 800B52B0 2330C300 */   subu      $a2, $a2, $v1
/* A5AB4 800B52B4 ECFD8427 */  addiu      $a0, $gp, %gp_rel(bufferSavedIntroArray)
/* A5AB8 800B52B8 21280000 */  addu       $a1, $zero, $zero
/* A5ABC 800B52BC 44A880AF */  sw         $zero, %gp_rel(numbufferedIntros)($gp)
/* A5AC0 800B52C0 2EF2020C */  jal        func_800BC8B8
/* A5AC4 800B52C4 00010624 */   addiu     $a2, $zero, 0x100
/* A5AC8 800B52C8 06000424 */  addiu      $a0, $zero, 0x6
/* A5ACC 800B52CC E1D4020C */  jal        SAVE_GetSavedBlock
/* A5AD0 800B52D0 21280000 */   addu      $a1, $zero, $zero
/* A5AD4 800B52D4 04000424 */  addiu      $a0, $zero, 0x4
/* A5AD8 800B52D8 21280000 */  addu       $a1, $zero, $zero
/* A5ADC 800B52DC 00200324 */  addiu      $v1, $zero, 0x2000
/* A5AE0 800B52E0 40A882AF */  sw         $v0, %gp_rel(GlobalSave)($gp)
/* A5AE4 800B52E4 760043A4 */  sh         $v1, 0x76($v0)
/* A5AE8 800B52E8 E1D4020C */  jal        SAVE_GetSavedBlock
/* A5AEC 800B52EC 0C0040A4 */   sh        $zero, 0xC($v0)
/* A5AF0 800B52F0 1000BF8F */  lw         $ra, 0x10($sp)
/* A5AF4 800B52F4 00000000 */  nop
/* A5AF8 800B52F8 0800E003 */  jr         $ra
/* A5AFC 800B52FC 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_ClearMemory, . - SAVE_ClearMemory
