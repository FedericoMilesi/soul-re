.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformSavedEventAttribute
/* 53B90 80063390 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 53B94 80063394 1000BFAF */  sw         $ra, 0x10($sp)
/* 53B98 80063398 21408000 */  addu       $t0, $a0, $zero
/* 53B9C 8006339C 2120A000 */  addu       $a0, $a1, $zero
/* 53BA0 800633A0 03000224 */  addiu      $v0, $zero, 0x3
/* 53BA4 800633A4 2500C214 */  bne        $a2, $v0, .L8006343C
/* 53BA8 800633A8 21180000 */   addu      $v1, $zero, $zero
/* 53BAC 800633AC 01000224 */  addiu      $v0, $zero, 0x1
/* 53BB0 800633B0 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53BB4 800633B4 0200E584 */  lh         $a1, 0x2($a3)
/* 53BB8 800633B8 00000000 */  nop
/* 53BBC 800633BC 0600A22C */  sltiu      $v0, $a1, 0x6
/* 53BC0 800633C0 1E004010 */  beqz       $v0, .L8006343C
/* 53BC4 800633C4 00000000 */   nop
/* 53BC8 800633C8 0400868C */  lw         $a2, 0x4($a0)
/* 53BCC 800633CC 00000000 */  nop
/* 53BD0 800633D0 1600C010 */  beqz       $a2, .L8006342C
/* 53BD4 800633D4 02000224 */   addiu     $v0, $zero, 0x2
/* 53BD8 800633D8 0000C390 */  lbu        $v1, 0x0($a2)
/* 53BDC 800633DC 00000000 */  nop
/* 53BE0 800633E0 0A006214 */  bne        $v1, $v0, .L8006340C
/* 53BE4 800633E4 21200001 */   addu      $a0, $t0, $zero
/* 53BE8 800633E8 40280500 */  sll        $a1, $a1, 1
/* 53BEC 800633EC 0600A524 */  addiu      $a1, $a1, 0x6
/* 53BF0 800633F0 0000828C */  lw         $v0, 0x0($a0)
/* 53BF4 800633F4 2128C500 */  addu       $a1, $a2, $a1
/* 53BF8 800633F8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 53BFC 800633FC 6F88010C */  jal        EVENT_AddShortPointerToStack
/* 53C00 80063400 000082AC */   sw        $v0, 0x0($a0)
/* 53C04 80063404 0F8D0108 */  j          .L8006343C
/* 53C08 80063408 01000324 */   addiu     $v1, $zero, 0x1
.L8006340C:
/* 53C0C 8006340C 0500A524 */  addiu      $a1, $a1, 0x5
/* 53C10 80063410 0000828C */  lw         $v0, 0x0($a0)
/* 53C14 80063414 2128C500 */  addu       $a1, $a2, $a1
/* 53C18 80063418 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 53C1C 8006341C 5D88010C */  jal        EVENT_AddCharPointerToStack
/* 53C20 80063420 000082AC */   sw        $v0, 0x0($a0)
/* 53C24 80063424 0F8D0108 */  j          .L8006343C
/* 53C28 80063428 01000324 */   addiu     $v1, $zero, 0x1
.L8006342C:
/* 53C2C 8006342C 21280000 */  addu       $a1, $zero, $zero
/* 53C30 80063430 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53C34 80063434 2130A000 */   addu      $a2, $a1, $zero
/* 53C38 80063438 01000324 */  addiu      $v1, $zero, 0x1
.L8006343C:
/* 53C3C 8006343C 1000BF8F */  lw         $ra, 0x10($sp)
/* 53C40 80063440 21106000 */  addu       $v0, $v1, $zero
/* 53C44 80063444 0800E003 */  jr         $ra
/* 53C48 80063448 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformSavedEventAttribute, . - EVENT_TransformSavedEventAttribute
