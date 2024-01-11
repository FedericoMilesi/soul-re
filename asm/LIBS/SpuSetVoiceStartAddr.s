.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetVoiceStartAddr
/* B0BC0 800C03C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B0BC4 800C03C4 C0200400 */  sll        $a0, $a0, 3
/* B0BC8 800C03C8 1800BFAF */  sw         $ra, 0x18($sp)
/* B0BCC 800C03CC 331A030C */  jal        _spu_FsetRXXa
/* B0BD0 800C03D0 03008434 */   ori       $a0, $a0, 0x3
/* B0BD4 800C03D4 01000224 */  addiu      $v0, $zero, 0x1
/* B0BD8 800C03D8 1400A2AF */  sw         $v0, 0x14($sp)
/* B0BDC 800C03DC 04010308 */  j          .L800C0410
/* B0BE0 800C03E0 1000A0AF */   sw        $zero, 0x10($sp)
.L800C03E4:
/* B0BE4 800C03E4 1400A38F */  lw         $v1, 0x14($sp)
/* B0BE8 800C03E8 00000000 */  nop
/* B0BEC 800C03EC 40100300 */  sll        $v0, $v1, 1
/* B0BF0 800C03F0 21104300 */  addu       $v0, $v0, $v1
/* B0BF4 800C03F4 80100200 */  sll        $v0, $v0, 2
/* B0BF8 800C03F8 21104300 */  addu       $v0, $v0, $v1
/* B0BFC 800C03FC 1400A2AF */  sw         $v0, 0x14($sp)
/* B0C00 800C0400 1000A28F */  lw         $v0, 0x10($sp)
/* B0C04 800C0404 00000000 */  nop
/* B0C08 800C0408 01004224 */  addiu      $v0, $v0, 0x1
/* B0C0C 800C040C 1000A2AF */  sw         $v0, 0x10($sp)
.L800C0410:
/* B0C10 800C0410 1000A28F */  lw         $v0, 0x10($sp)
/* B0C14 800C0414 00000000 */  nop
/* B0C18 800C0418 02004228 */  slti       $v0, $v0, 0x2
/* B0C1C 800C041C F1FF4014 */  bnez       $v0, .L800C03E4
/* B0C20 800C0420 00000000 */   nop
/* B0C24 800C0424 1800BF8F */  lw         $ra, 0x18($sp)
/* B0C28 800C0428 2000BD27 */  addiu      $sp, $sp, 0x20
/* B0C2C 800C042C 0800E003 */  jr         $ra
/* B0C30 800C0430 00000000 */   nop
/* B0C34 800C0434 00000000 */  nop
/* B0C38 800C0438 00000000 */  nop
/* B0C3C 800C043C 00000000 */  nop
.size SpuSetVoiceStartAddr, . - SpuSetVoiceStartAddr
