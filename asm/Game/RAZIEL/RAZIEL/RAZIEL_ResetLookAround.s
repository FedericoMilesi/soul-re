.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_ResetLookAround
/* A4BDC 800B43DC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A4BE0 800B43E0 1400B1AF */  sw         $s1, 0x14($sp)
/* A4BE4 800B43E4 21888000 */  addu       $s1, $a0, $zero
/* A4BE8 800B43E8 1000B0AF */  sw         $s0, 0x10($sp)
/* A4BEC 800B43EC C8013026 */  addiu      $s0, $s1, 0x1C8
/* A4BF0 800B43F0 21200002 */  addu       $a0, $s0, $zero
/* A4BF4 800B43F4 11000524 */  addiu      $a1, $zero, 0x11
/* A4BF8 800B43F8 0E000624 */  addiu      $a2, $zero, 0xE
/* A4BFC 800B43FC 1800BFAF */  sw         $ra, 0x18($sp)
/* A4C00 800B4400 9D41020C */  jal        G2Anim_InterpDisableController
/* A4C04 800B4404 2C010724 */   addiu     $a3, $zero, 0x12C
/* A4C08 800B4408 21200002 */  addu       $a0, $s0, $zero
/* A4C0C 800B440C 10000524 */  addiu      $a1, $zero, 0x10
/* A4C10 800B4410 0E000624 */  addiu      $a2, $zero, 0xE
/* A4C14 800B4414 9D41020C */  jal        G2Anim_InterpDisableController
/* A4C18 800B4418 2C010724 */   addiu     $a3, $zero, 0x12C
/* A4C1C 800B441C 21200002 */  addu       $a0, $s0, $zero
/* A4C20 800B4420 0E000524 */  addiu      $a1, $zero, 0xE
/* A4C24 800B4424 2130A000 */  addu       $a2, $a1, $zero
/* A4C28 800B4428 9D41020C */  jal        G2Anim_InterpDisableController
/* A4C2C 800B442C 2C010724 */   addiu     $a3, $zero, 0x12C
/* A4C30 800B4430 21202002 */  addu       $a0, $s1, $zero
/* A4C34 800B4434 1000053C */  lui        $a1, (0x100009 >> 16)
/* A4C38 800B4438 0900A534 */  ori        $a1, $a1, (0x100009 & 0xFFFF)
/* A4C3C 800B443C A1D1000C */  jal        INSTANCE_Post
/* A4C40 800B4440 21300000 */   addu      $a2, $zero, $zero
/* A4C44 800B4444 1800BF8F */  lw         $ra, 0x18($sp)
/* A4C48 800B4448 1400B18F */  lw         $s1, 0x14($sp)
/* A4C4C 800B444C 1000B08F */  lw         $s0, 0x10($sp)
/* A4C50 800B4450 0800E003 */  jr         $ra
/* A4C54 800B4454 2000BD27 */   addiu     $sp, $sp, 0x20
.size RAZIEL_ResetLookAround, . - RAZIEL_ResetLookAround
