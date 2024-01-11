.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_DetachControllerFromSeg
/* 80C90 80090490 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 80C94 80090494 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 80C98 80090498 21888000 */  addu       $s1, $a0, $zero
/* 80C9C 8009049C 2000B2AF */  sw         $s2, 0x20($sp)
/* 80CA0 800904A0 2190A000 */  addu       $s2, $a1, $zero
/* 80CA4 800904A4 2400B3AF */  sw         $s3, 0x24($sp)
/* 80CA8 800904A8 2198C000 */  addu       $s3, $a2, $zero
/* 80CAC 800904AC 02002226 */  addiu      $v0, $s1, 0x2
/* 80CB0 800904B0 21204002 */  addu       $a0, $s2, $zero
/* 80CB4 800904B4 21286002 */  addu       $a1, $s3, $zero
/* 80CB8 800904B8 1800B0AF */  sw         $s0, 0x18($sp)
/* 80CBC 800904BC 1000B027 */  addiu      $s0, $sp, 0x10
/* 80CC0 800904C0 21300002 */  addu       $a2, $s0, $zero
/* 80CC4 800904C4 2800BFAF */  sw         $ra, 0x28($sp)
/* 80CC8 800904C8 2B48020C */  jal        _G2AnimControllerST_FindPtrInList
/* 80CCC 800904CC 1000A2AF */   sw        $v0, 0x10($sp)
/* 80CD0 800904D0 08004014 */  bnez       $v0, .L800904F4
/* 80CD4 800904D4 21204002 */   addu      $a0, $s2, $zero
/* 80CD8 800904D8 04002226 */  addiu      $v0, $s1, 0x4
/* 80CDC 800904DC 1000A2AF */  sw         $v0, 0x10($sp)
/* 80CE0 800904E0 21286002 */  addu       $a1, $s3, $zero
/* 80CE4 800904E4 2B48020C */  jal        _G2AnimControllerST_FindPtrInList
/* 80CE8 800904E8 21300002 */   addu      $a2, $s0, $zero
/* 80CEC 800904EC 13004010 */  beqz       $v0, .L8009053C
/* 80CF0 800904F0 00000000 */   nop
.L800904F4:
/* 80CF4 800904F4 3B47020C */  jal        _G2AnimController_Destroy
/* 80CF8 800904F8 21204000 */   addu      $a0, $v0, $zero
/* 80CFC 800904FC 84F5838F */  lw         $v1, %gp_rel(_controllerPool + 0xC)($gp)
/* 80D00 80090500 00000000 */  nop
/* 80D04 80090504 23104300 */  subu       $v0, $v0, $v1
/* 80D08 80090508 C0180200 */  sll        $v1, $v0, 3
/* 80D0C 8009050C 23186200 */  subu       $v1, $v1, $v0
/* 80D10 80090510 80210300 */  sll        $a0, $v1, 6
/* 80D14 80090514 21186400 */  addu       $v1, $v1, $a0
/* 80D18 80090518 C0180300 */  sll        $v1, $v1, 3
/* 80D1C 8009051C 21186200 */  addu       $v1, $v1, $v0
/* 80D20 80090520 C0230300 */  sll        $a0, $v1, 15
/* 80D24 80090524 23208300 */  subu       $a0, $a0, $v1
/* 80D28 80090528 C0200400 */  sll        $a0, $a0, 3
/* 80D2C 8009052C 21208200 */  addu       $a0, $a0, $v0
/* 80D30 80090530 1000A28F */  lw         $v0, 0x10($sp)
/* 80D34 80090534 83200400 */  sra        $a0, $a0, 2
/* 80D38 80090538 000044A4 */  sh         $a0, 0x0($v0)
.L8009053C:
/* 80D3C 8009053C 2800BF8F */  lw         $ra, 0x28($sp)
/* 80D40 80090540 2400B38F */  lw         $s3, 0x24($sp)
/* 80D44 80090544 2000B28F */  lw         $s2, 0x20($sp)
/* 80D48 80090548 1C00B18F */  lw         $s1, 0x1C($sp)
/* 80D4C 8009054C 1800B08F */  lw         $s0, 0x18($sp)
/* 80D50 80090550 0800E003 */  jr         $ra
/* 80D54 80090554 3000BD27 */   addiu     $sp, $sp, 0x30
.size G2Anim_DetachControllerFromSeg, . - G2Anim_DetachControllerFromSeg
