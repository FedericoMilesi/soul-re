.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformRotation3dAttribute
/* 546A8 80063EA8 0600C228 */  slti       $v0, $a2, 0x6
/* 546AC 80063EAC 0A004014 */  bnez       $v0, .L80063ED8
/* 546B0 80063EB0 0900C228 */   slti      $v0, $a2, 0x9
/* 546B4 80063EB4 05004014 */  bnez       $v0, .L80063ECC
/* 546B8 80063EB8 6300C228 */   slti      $v0, $a2, 0x63
/* 546BC 80063EBC 06004010 */  beqz       $v0, .L80063ED8
/* 546C0 80063EC0 6000C228 */   slti      $v0, $a2, 0x60
/* 546C4 80063EC4 04004014 */  bnez       $v0, .L80063ED8
/* 546C8 80063EC8 00000000 */   nop
.L80063ECC:
/* 546CC 80063ECC 1400A6AC */  sw         $a2, 0x14($a1)
/* 546D0 80063ED0 0800E003 */  jr         $ra
/* 546D4 80063ED4 01000224 */   addiu     $v0, $zero, 0x1
.L80063ED8:
/* 546D8 80063ED8 0800E003 */  jr         $ra
/* 546DC 80063EDC 21100000 */   addu      $v0, $zero, $zero
.size EVENT_TransformRotation3dAttribute, . - EVENT_TransformRotation3dAttribute
