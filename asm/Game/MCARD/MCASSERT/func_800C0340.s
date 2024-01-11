.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C0340
/* B0B40 800C0340 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* B0B44 800C0344 FF7FA530 */  andi       $a1, $a1, 0x7FFF
/* B0B48 800C0348 00210400 */  sll        $a0, $a0, 4
/* B0B4C 800C034C 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B0B50 800C0350 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B0B54 800C0354 FF7FC630 */  andi       $a2, $a2, 0x7FFF
/* B0B58 800C0358 21208200 */  addu       $a0, $a0, $v0
/* B0B5C 800C035C 01000224 */  addiu      $v0, $zero, 0x1
/* B0B60 800C0360 000085A4 */  sh         $a1, 0x0($a0)
/* B0B64 800C0364 020086A4 */  sh         $a2, 0x2($a0)
/* B0B68 800C0368 0400A2AF */  sw         $v0, 0x4($sp)
/* B0B6C 800C036C E8000308 */  j          .L800C03A0
/* B0B70 800C0370 0000A0AF */   sw        $zero, 0x0($sp)
.L800C0374:
/* B0B74 800C0374 0400A38F */  lw         $v1, 0x4($sp)
/* B0B78 800C0378 00000000 */  nop
/* B0B7C 800C037C 40100300 */  sll        $v0, $v1, 1
/* B0B80 800C0380 21104300 */  addu       $v0, $v0, $v1
/* B0B84 800C0384 80100200 */  sll        $v0, $v0, 2
/* B0B88 800C0388 21104300 */  addu       $v0, $v0, $v1
/* B0B8C 800C038C 0400A2AF */  sw         $v0, 0x4($sp)
/* B0B90 800C0390 0000A28F */  lw         $v0, 0x0($sp)
/* B0B94 800C0394 00000000 */  nop
/* B0B98 800C0398 01004224 */  addiu      $v0, $v0, 0x1
/* B0B9C 800C039C 0000A2AF */  sw         $v0, 0x0($sp)
.L800C03A0:
/* B0BA0 800C03A0 0000A28F */  lw         $v0, 0x0($sp)
/* B0BA4 800C03A4 00000000 */  nop
/* B0BA8 800C03A8 02004228 */  slti       $v0, $v0, 0x2
/* B0BAC 800C03AC F1FF4014 */  bnez       $v0, .L800C0374
/* B0BB0 800C03B0 00000000 */   nop
/* B0BB4 800C03B4 0800E003 */  jr         $ra
/* B0BB8 800C03B8 0800BD27 */   addiu     $sp, $sp, 0x8
/* B0BBC 800C03BC 00000000 */  nop
.size func_800C0340, . - func_800C0340
