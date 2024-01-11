.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetVoicePitch
/* B0274 800BFA74 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* B0278 800BFA78 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B027C 800BFA7C 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B0280 800BFA80 00210400 */  sll        $a0, $a0, 4
/* B0284 800BFA84 21208200 */  addu       $a0, $a0, $v0
/* B0288 800BFA88 01000224 */  addiu      $v0, $zero, 0x1
/* B028C 800BFA8C 040085A4 */  sh         $a1, 0x4($a0)
/* B0290 800BFA90 0400A2AF */  sw         $v0, 0x4($sp)
/* B0294 800BFA94 B2FE0208 */  j          .L800BFAC8
/* B0298 800BFA98 0000A0AF */   sw        $zero, 0x0($sp)
.L800BFA9C:
/* B029C 800BFA9C 0400A38F */  lw         $v1, 0x4($sp)
/* B02A0 800BFAA0 00000000 */  nop
/* B02A4 800BFAA4 40100300 */  sll        $v0, $v1, 1
/* B02A8 800BFAA8 21104300 */  addu       $v0, $v0, $v1
/* B02AC 800BFAAC 80100200 */  sll        $v0, $v0, 2
/* B02B0 800BFAB0 21104300 */  addu       $v0, $v0, $v1
/* B02B4 800BFAB4 0400A2AF */  sw         $v0, 0x4($sp)
/* B02B8 800BFAB8 0000A28F */  lw         $v0, 0x0($sp)
/* B02BC 800BFABC 00000000 */  nop
/* B02C0 800BFAC0 01004224 */  addiu      $v0, $v0, 0x1
/* B02C4 800BFAC4 0000A2AF */  sw         $v0, 0x0($sp)
.L800BFAC8:
/* B02C8 800BFAC8 0000A28F */  lw         $v0, 0x0($sp)
/* B02CC 800BFACC 00000000 */  nop
/* B02D0 800BFAD0 02004228 */  slti       $v0, $v0, 0x2
/* B02D4 800BFAD4 F1FF4014 */  bnez       $v0, .L800BFA9C
/* B02D8 800BFAD8 00000000 */   nop
/* B02DC 800BFADC 0800E003 */  jr         $ra
/* B02E0 800BFAE0 0800BD27 */   addiu     $sp, $sp, 0x8
.size SpuSetVoicePitch, . - SpuSetVoicePitch
