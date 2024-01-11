.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_Addvector3dToStack
/* 52A9C 8006229C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 52AA0 800622A0 1800B0AF */  sw         $s0, 0x18($sp)
/* 52AA4 800622A4 21808000 */  addu       $s0, $a0, $zero
/* 52AA8 800622A8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 52AAC 800622AC 0000038E */  lw         $v1, 0x0($s0)
/* 52AB0 800622B0 00000000 */  nop
/* 52AB4 800622B4 20006228 */  slti       $v0, $v1, 0x20
/* 52AB8 800622B8 12004010 */  beqz       $v0, .L80062304
/* 52ABC 800622BC C0200300 */   sll       $a0, $v1, 3
/* 52AC0 800622C0 21208300 */  addu       $a0, $a0, $v1
/* 52AC4 800622C4 80200400 */  sll        $a0, $a0, 2
/* 52AC8 800622C8 04008424 */  addiu      $a0, $a0, 0x4
/* 52ACC 800622CC 002C0500 */  sll        $a1, $a1, 16
/* 52AD0 800622D0 00340600 */  sll        $a2, $a2, 16
/* 52AD4 800622D4 003C0700 */  sll        $a3, $a3, 16
/* 52AD8 800622D8 21200402 */  addu       $a0, $s0, $a0
/* 52ADC 800622DC 032C0500 */  sra        $a1, $a1, 16
/* 52AE0 800622E0 03340600 */  sra        $a2, $a2, 16
/* 52AE4 800622E4 3000A28F */  lw         $v0, 0x30($sp)
/* 52AE8 800622E8 033C0700 */  sra        $a3, $a3, 16
/* 52AEC 800622EC 9B88010C */  jal        EVENT_ChangeOperandVector3d
/* 52AF0 800622F0 1000A2AF */   sw        $v0, 0x10($sp)
/* 52AF4 800622F4 0000028E */  lw         $v0, 0x0($s0)
/* 52AF8 800622F8 00000000 */  nop
/* 52AFC 800622FC 01004224 */  addiu      $v0, $v0, 0x1
/* 52B00 80062300 000002AE */  sw         $v0, 0x0($s0)
.L80062304:
/* 52B04 80062304 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 52B08 80062308 1800B08F */  lw         $s0, 0x18($sp)
/* 52B0C 8006230C 0800E003 */  jr         $ra
/* 52B10 80062310 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_Addvector3dToStack, . - EVENT_Addvector3dToStack
