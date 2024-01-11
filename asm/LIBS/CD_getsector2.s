.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CD_getsector2
/* B5CDC 800C54DC 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B5CE0 800C54E0 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B5CE4 800C54E4 0221063C */  lui        $a2, (0x21020843 >> 16)
/* B5CE8 800C54E8 000040A0 */  sb         $zero, 0x0($v0)
/* B5CEC 800C54EC 0D80033C */  lui        $v1, %hi(CD_intstr + 0x22C)
/* B5CF0 800C54F0 54EC638C */  lw         $v1, %lo(CD_intstr + 0x22C)($v1)
/* B5CF4 800C54F4 80000224 */  addiu      $v0, $zero, 0x80
/* B5CF8 800C54F8 000062A0 */  sb         $v0, 0x0($v1)
/* B5CFC 800C54FC 0D80023C */  lui        $v0, %hi(CD_intstr + 0x254)
/* B5D00 800C5500 7CEC428C */  lw         $v0, %lo(CD_intstr + 0x254)($v0)
/* B5D04 800C5504 4308C634 */  ori        $a2, $a2, (0x21020843 & 0xFFFF)
/* B5D08 800C5508 000046AC */  sw         $a2, 0x0($v0)
/* B5D0C 800C550C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x230)
/* B5D10 800C5510 58EC638C */  lw         $v1, %lo(CD_intstr + 0x230)($v1)
/* B5D14 800C5514 25130224 */  addiu      $v0, $zero, 0x1325
/* B5D18 800C5518 000062AC */  sw         $v0, 0x0($v1)
/* B5D1C 800C551C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x258)
/* B5D20 800C5520 80EC638C */  lw         $v1, %lo(CD_intstr + 0x258)($v1)
/* B5D24 800C5524 00000000 */  nop
/* B5D28 800C5528 0000628C */  lw         $v0, 0x0($v1)
/* B5D2C 800C552C 00000000 */  nop
/* B5D30 800C5530 00804234 */  ori        $v0, $v0, 0x8000
/* B5D34 800C5534 000062AC */  sw         $v0, 0x0($v1)
/* B5D38 800C5538 0D80023C */  lui        $v0, %hi(CD_intstr + 0x25C)
/* B5D3C 800C553C 84EC428C */  lw         $v0, %lo(CD_intstr + 0x25C)($v0)
/* B5D40 800C5540 00000000 */  nop
/* B5D44 800C5544 000044AC */  sw         $a0, 0x0($v0)
/* B5D48 800C5548 0100023C */  lui        $v0, (0x10000 >> 16)
/* B5D4C 800C554C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x260)
/* B5D50 800C5550 88EC638C */  lw         $v1, %lo(CD_intstr + 0x260)($v1)
/* B5D54 800C5554 2528A200 */  or         $a1, $a1, $v0
/* B5D58 800C5558 000065AC */  sw         $a1, 0x0($v1)
/* B5D5C 800C555C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x220)
/* B5D60 800C5560 48EC638C */  lw         $v1, %lo(CD_intstr + 0x220)($v1)
/* B5D64 800C5564 00000000 */  nop
/* B5D68 800C5568 00006290 */  lbu        $v0, 0x0($v1)
/* B5D6C 800C556C 00000000 */  nop
/* B5D70 800C5570 40004230 */  andi       $v0, $v0, 0x40
/* B5D74 800C5574 06004014 */  bnez       $v0, .L800C5590
/* B5D78 800C5578 F8FFBD27 */   addiu     $sp, $sp, -0x8
.L800C557C:
/* B5D7C 800C557C 00006290 */  lbu        $v0, 0x0($v1)
/* B5D80 800C5580 00000000 */  nop
/* B5D84 800C5584 40004230 */  andi       $v0, $v0, 0x40
/* B5D88 800C5588 FCFF4010 */  beqz       $v0, .L800C557C
/* B5D8C 800C558C 00000000 */   nop
.L800C5590:
/* B5D90 800C5590 4011033C */  lui        $v1, (0x11400100 >> 16)
/* B5D94 800C5594 0D80023C */  lui        $v0, %hi(CD_intstr + 0x264)
/* B5D98 800C5598 8CEC428C */  lw         $v0, %lo(CD_intstr + 0x264)($v0)
/* B5D9C 800C559C 00016334 */  ori        $v1, $v1, (0x11400100 & 0xFFFF)
/* B5DA0 800C55A0 000043AC */  sw         $v1, 0x0($v0)
/* B5DA4 800C55A4 0D80023C */  lui        $v0, %hi(CD_intstr + 0x264)
/* B5DA8 800C55A8 8CEC428C */  lw         $v0, %lo(CD_intstr + 0x264)($v0)
/* B5DAC 800C55AC 00000000 */  nop
/* B5DB0 800C55B0 0000428C */  lw         $v0, 0x0($v0)
/* B5DB4 800C55B4 00000000 */  nop
/* B5DB8 800C55B8 0000A2AF */  sw         $v0, 0x0($sp)
/* B5DBC 800C55BC 21100000 */  addu       $v0, $zero, $zero
/* B5DC0 800C55C0 0800E003 */  jr         $ra
/* B5DC4 800C55C4 0800BD27 */   addiu     $sp, $sp, 0x8
.size CD_getsector2, . - CD_getsector2
