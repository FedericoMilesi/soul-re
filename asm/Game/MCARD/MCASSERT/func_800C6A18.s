.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C6A18
/* B7218 800C6A18 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* B721C 800C6A1C 0D000224 */  addiu      $v0, $zero, 0xD
/* B7220 800C6A20 0400A2AF */  sw         $v0, 0x4($sp)
/* B7224 800C6A24 961A0308 */  j          .L800C6A58
/* B7228 800C6A28 0000A0AF */   sw        $zero, 0x0($sp)
.L800C6A2C:
/* B722C 800C6A2C 0400A38F */  lw         $v1, 0x4($sp)
/* B7230 800C6A30 00000000 */  nop
/* B7234 800C6A34 40100300 */  sll        $v0, $v1, 1
/* B7238 800C6A38 21104300 */  addu       $v0, $v0, $v1
/* B723C 800C6A3C 80100200 */  sll        $v0, $v0, 2
/* B7240 800C6A40 21104300 */  addu       $v0, $v0, $v1
/* B7244 800C6A44 0400A2AF */  sw         $v0, 0x4($sp)
/* B7248 800C6A48 0000A28F */  lw         $v0, 0x0($sp)
/* B724C 800C6A4C 00000000 */  nop
/* B7250 800C6A50 01004224 */  addiu      $v0, $v0, 0x1
/* B7254 800C6A54 0000A2AF */  sw         $v0, 0x0($sp)
.L800C6A58:
/* B7258 800C6A58 0000A28F */  lw         $v0, 0x0($sp)
/* B725C 800C6A5C 00000000 */  nop
/* B7260 800C6A60 3C004228 */  slti       $v0, $v0, 0x3C
/* B7264 800C6A64 F1FF4014 */  bnez       $v0, .L800C6A2C
/* B7268 800C6A68 00000000 */   nop
/* B726C 800C6A6C 0800E003 */  jr         $ra
/* B7270 800C6A70 0800BD27 */   addiu     $sp, $sp, 0x8
/* B7274 800C6A74 00000000 */  nop
/* B7278 800C6A78 00000000 */  nop
/* B727C 800C6A7C 00000000 */  nop
.size func_800C6A18, . - func_800C6A18
