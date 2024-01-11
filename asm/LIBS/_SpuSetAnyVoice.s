.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SpuSetAnyVoice
/* B7410 800C6C10 21488000 */  addu       $t1, $a0, $zero
/* B7414 800C6C14 0D80023C */  lui        $v0, %hi(_spu_env)
/* B7418 800C6C18 48ED428C */  lw         $v0, %lo(_spu_env)($v0)
/* B741C 800C6C1C 00000000 */  nop
/* B7420 800C6C20 01004230 */  andi       $v0, $v0, 0x1
/* B7424 800C6C24 0E80043C */  lui        $a0, %hi(GsOUT_PACKET_P_dup1 + 0x25CC)
/* B7428 800C6C28 34FC8424 */  addiu      $a0, $a0, %lo(GsOUT_PACKET_P_dup1 + 0x25CC)
/* B742C 800C6C2C 03004014 */  bnez       $v0, .L800C6C3C
/* B7430 800C6C30 2140A000 */   addu      $t0, $a1, $zero
/* B7434 800C6C34 0D80043C */  lui        $a0, %hi(_spu_RXX)
/* B7438 800C6C38 5CED848C */  lw         $a0, %lo(_spu_RXX)($a0)
.L800C6C3C:
/* B743C 800C6C3C 40100700 */  sll        $v0, $a3, 1
/* B7440 800C6C40 21104400 */  addu       $v0, $v0, $a0
/* B7444 800C6C44 00004394 */  lhu        $v1, 0x0($v0)
/* B7448 800C6C48 40100600 */  sll        $v0, $a2, 1
/* B744C 800C6C4C 21104400 */  addu       $v0, $v0, $a0
/* B7450 800C6C50 00004294 */  lhu        $v0, 0x0($v0)
/* B7454 800C6C54 FF006330 */  andi       $v1, $v1, 0xFF
/* B7458 800C6C58 001C0300 */  sll        $v1, $v1, 16
/* B745C 800C6C5C 01000B24 */  addiu      $t3, $zero, 0x1
/* B7460 800C6C60 0C002B11 */  beq        $t1, $t3, .L800C6C94
/* B7464 800C6C64 25504300 */   or        $t2, $v0, $v1
/* B7468 800C6C68 02002229 */  slti       $v0, $t1, 0x2
/* B746C 800C6C6C 05004010 */  beqz       $v0, .L800C6C84
/* B7470 800C6C70 08000224 */   addiu     $v0, $zero, 0x8
/* B7474 800C6C74 36002011 */  beqz       $t1, .L800C6D50
/* B7478 800C6C78 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
/* B747C 800C6C7C B11B0308 */  j          .L800C6EC4
/* B7480 800C6C80 FFFF4234 */   ori       $v0, $v0, (0xFFFFFF & 0xFFFF)
.L800C6C84:
/* B7484 800C6C84 67002211 */  beq        $t1, $v0, .L800C6E24
/* B7488 800C6C88 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
/* B748C 800C6C8C B11B0308 */  j          .L800C6EC4
/* B7490 800C6C90 FFFF4234 */   ori       $v0, $v0, (0xFFFFFF & 0xFFFF)
.L800C6C94:
/* B7494 800C6C94 0D80023C */  lui        $v0, %hi(_spu_env)
/* B7498 800C6C98 48ED428C */  lw         $v0, %lo(_spu_env)($v0)
/* B749C 800C6C9C 00000000 */  nop
/* B74A0 800C6CA0 01004230 */  andi       $v0, $v0, 0x1
/* B74A4 800C6CA4 18004010 */  beqz       $v0, .L800C6D08
/* B74A8 800C6CA8 40180600 */   sll       $v1, $a2, 1
/* B74AC 800C6CAC 0E80053C */  lui        $a1, %hi(GsOUT_PACKET_P_dup1 + 0x25CC)
/* B74B0 800C6CB0 34FCA524 */  addiu      $a1, $a1, %lo(GsOUT_PACKET_P_dup1 + 0x25CC)
/* B74B4 800C6CB4 21186500 */  addu       $v1, $v1, $a1
/* B74B8 800C6CB8 40200700 */  sll        $a0, $a3, 1
/* B74BC 800C6CBC 00006294 */  lhu        $v0, 0x0($v1)
/* B74C0 800C6CC0 21208500 */  addu       $a0, $a0, $a1
/* B74C4 800C6CC4 25104800 */  or         $v0, $v0, $t0
/* B74C8 800C6CC8 000062A4 */  sh         $v0, 0x0($v1)
/* B74CC 800C6CCC 02140800 */  srl        $v0, $t0, 16
/* B74D0 800C6CD0 00008394 */  lhu        $v1, 0x0($a0)
/* B74D4 800C6CD4 FF004230 */  andi       $v0, $v0, 0xFF
/* B74D8 800C6CD8 25186200 */  or         $v1, $v1, $v0
/* B74DC 800C6CDC 3AFFC224 */  addiu      $v0, $a2, -0xC6
/* B74E0 800C6CE0 43100200 */  sra        $v0, $v0, 1
/* B74E4 800C6CE4 000083A4 */  sh         $v1, 0x0($a0)
/* B74E8 800C6CE8 0D80033C */  lui        $v1, %hi(_spu_RQmask)
/* B74EC 800C6CEC 14ED638C */  lw         $v1, %lo(_spu_RQmask)($v1)
/* B74F0 800C6CF0 04104B00 */  sllv       $v0, $t3, $v0
/* B74F4 800C6CF4 25186200 */  or         $v1, $v1, $v0
/* B74F8 800C6CF8 0D80013C */  lui        $at, %hi(_spu_RQmask)
/* B74FC 800C6CFC 14ED23AC */  sw         $v1, %lo(_spu_RQmask)($at)
/* B7500 800C6D00 501B0308 */  j          .L800C6D40
/* B7504 800C6D04 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
.L800C6D08:
/* B7508 800C6D08 0D80053C */  lui        $a1, %hi(_spu_RXX)
/* B750C 800C6D0C 5CEDA58C */  lw         $a1, %lo(_spu_RXX)($a1)
/* B7510 800C6D10 40200700 */  sll        $a0, $a3, 1
/* B7514 800C6D14 21186500 */  addu       $v1, $v1, $a1
/* B7518 800C6D18 00006294 */  lhu        $v0, 0x0($v1)
/* B751C 800C6D1C 21208500 */  addu       $a0, $a0, $a1
/* B7520 800C6D20 25104800 */  or         $v0, $v0, $t0
/* B7524 800C6D24 000062A4 */  sh         $v0, 0x0($v1)
/* B7528 800C6D28 02140800 */  srl        $v0, $t0, 16
/* B752C 800C6D2C 00008394 */  lhu        $v1, 0x0($a0)
/* B7530 800C6D30 FF004230 */  andi       $v0, $v0, 0xFF
/* B7534 800C6D34 25186200 */  or         $v1, $v1, $v0
/* B7538 800C6D38 000083A4 */  sh         $v1, 0x0($a0)
/* B753C 800C6D3C FF00023C */  lui        $v0, (0xFFFFFF >> 16)
.L800C6D40:
/* B7540 800C6D40 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* B7544 800C6D44 24100201 */  and        $v0, $t0, $v0
/* B7548 800C6D48 AF1B0308 */  j          .L800C6EBC
/* B754C 800C6D4C 25504201 */   or        $t2, $t2, $v0
.L800C6D50:
/* B7550 800C6D50 0D80023C */  lui        $v0, %hi(_spu_env)
/* B7554 800C6D54 48ED428C */  lw         $v0, %lo(_spu_env)($v0)
/* B7558 800C6D58 00000000 */  nop
/* B755C 800C6D5C 01004230 */  andi       $v0, $v0, 0x1
/* B7560 800C6D60 1A004010 */  beqz       $v0, .L800C6DCC
/* B7564 800C6D64 40180600 */   sll       $v1, $a2, 1
/* B7568 800C6D68 0E80053C */  lui        $a1, %hi(GsOUT_PACKET_P_dup1 + 0x25CC)
/* B756C 800C6D6C 34FCA524 */  addiu      $a1, $a1, %lo(GsOUT_PACKET_P_dup1 + 0x25CC)
/* B7570 800C6D70 21186500 */  addu       $v1, $v1, $a1
/* B7574 800C6D74 00006294 */  lhu        $v0, 0x0($v1)
/* B7578 800C6D78 27200800 */  nor        $a0, $zero, $t0
/* B757C 800C6D7C 24104400 */  and        $v0, $v0, $a0
/* B7580 800C6D80 40200700 */  sll        $a0, $a3, 1
/* B7584 800C6D84 21208500 */  addu       $a0, $a0, $a1
/* B7588 800C6D88 000062A4 */  sh         $v0, 0x0($v1)
/* B758C 800C6D8C 02140800 */  srl        $v0, $t0, 16
/* B7590 800C6D90 FF004230 */  andi       $v0, $v0, 0xFF
/* B7594 800C6D94 00008394 */  lhu        $v1, 0x0($a0)
/* B7598 800C6D98 27100200 */  nor        $v0, $zero, $v0
/* B759C 800C6D9C 24186200 */  and        $v1, $v1, $v0
/* B75A0 800C6DA0 3AFFC224 */  addiu      $v0, $a2, -0xC6
/* B75A4 800C6DA4 43100200 */  sra        $v0, $v0, 1
/* B75A8 800C6DA8 000083A4 */  sh         $v1, 0x0($a0)
/* B75AC 800C6DAC 0D80033C */  lui        $v1, %hi(_spu_RQmask)
/* B75B0 800C6DB0 14ED638C */  lw         $v1, %lo(_spu_RQmask)($v1)
/* B75B4 800C6DB4 04104B00 */  sllv       $v0, $t3, $v0
/* B75B8 800C6DB8 25186200 */  or         $v1, $v1, $v0
/* B75BC 800C6DBC 0D80013C */  lui        $at, %hi(_spu_RQmask)
/* B75C0 800C6DC0 14ED23AC */  sw         $v1, %lo(_spu_RQmask)($at)
/* B75C4 800C6DC4 841B0308 */  j          .L800C6E10
/* B75C8 800C6DC8 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
.L800C6DCC:
/* B75CC 800C6DCC 0D80053C */  lui        $a1, %hi(_spu_RXX)
/* B75D0 800C6DD0 5CEDA58C */  lw         $a1, %lo(_spu_RXX)($a1)
/* B75D4 800C6DD4 00000000 */  nop
/* B75D8 800C6DD8 21186500 */  addu       $v1, $v1, $a1
/* B75DC 800C6DDC 00006294 */  lhu        $v0, 0x0($v1)
/* B75E0 800C6DE0 27200800 */  nor        $a0, $zero, $t0
/* B75E4 800C6DE4 24104400 */  and        $v0, $v0, $a0
/* B75E8 800C6DE8 40200700 */  sll        $a0, $a3, 1
/* B75EC 800C6DEC 21208500 */  addu       $a0, $a0, $a1
/* B75F0 800C6DF0 000062A4 */  sh         $v0, 0x0($v1)
/* B75F4 800C6DF4 02140800 */  srl        $v0, $t0, 16
/* B75F8 800C6DF8 FF004230 */  andi       $v0, $v0, 0xFF
/* B75FC 800C6DFC 00008394 */  lhu        $v1, 0x0($a0)
/* B7600 800C6E00 27100200 */  nor        $v0, $zero, $v0
/* B7604 800C6E04 24186200 */  and        $v1, $v1, $v0
/* B7608 800C6E08 000083A4 */  sh         $v1, 0x0($a0)
/* B760C 800C6E0C FF00023C */  lui        $v0, (0xFFFFFF >> 16)
.L800C6E10:
/* B7610 800C6E10 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* B7614 800C6E14 24100201 */  and        $v0, $t0, $v0
/* B7618 800C6E18 27100200 */  nor        $v0, $zero, $v0
/* B761C 800C6E1C AF1B0308 */  j          .L800C6EBC
/* B7620 800C6E20 24504201 */   and       $t2, $t2, $v0
.L800C6E24:
/* B7624 800C6E24 0D80023C */  lui        $v0, %hi(_spu_env)
/* B7628 800C6E28 48ED428C */  lw         $v0, %lo(_spu_env)($v0)
/* B762C 800C6E2C 00000000 */  nop
/* B7630 800C6E30 01004230 */  andi       $v0, $v0, 0x1
/* B7634 800C6E34 14004010 */  beqz       $v0, .L800C6E88
/* B7638 800C6E38 40180700 */   sll       $v1, $a3, 1
/* B763C 800C6E3C 0E80043C */  lui        $a0, %hi(GsOUT_PACKET_P_dup1 + 0x25CC)
/* B7640 800C6E40 34FC8424 */  addiu      $a0, $a0, %lo(GsOUT_PACKET_P_dup1 + 0x25CC)
/* B7644 800C6E44 40100600 */  sll        $v0, $a2, 1
/* B7648 800C6E48 21104400 */  addu       $v0, $v0, $a0
/* B764C 800C6E4C 21186400 */  addu       $v1, $v1, $a0
/* B7650 800C6E50 000048A4 */  sh         $t0, 0x0($v0)
/* B7654 800C6E54 02140800 */  srl        $v0, $t0, 16
/* B7658 800C6E58 FF004230 */  andi       $v0, $v0, 0xFF
/* B765C 800C6E5C 000062A4 */  sh         $v0, 0x0($v1)
/* B7660 800C6E60 3AFFC224 */  addiu      $v0, $a2, -0xC6
/* B7664 800C6E64 43100200 */  sra        $v0, $v0, 1
/* B7668 800C6E68 0D80033C */  lui        $v1, %hi(_spu_RQmask)
/* B766C 800C6E6C 14ED638C */  lw         $v1, %lo(_spu_RQmask)($v1)
/* B7670 800C6E70 04104B00 */  sllv       $v0, $t3, $v0
/* B7674 800C6E74 25186200 */  or         $v1, $v1, $v0
/* B7678 800C6E78 0D80013C */  lui        $at, %hi(_spu_RQmask)
/* B767C 800C6E7C 14ED23AC */  sw         $v1, %lo(_spu_RQmask)($at)
/* B7680 800C6E80 AD1B0308 */  j          .L800C6EB4
/* B7684 800C6E84 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
.L800C6E88:
/* B7688 800C6E88 40100600 */  sll        $v0, $a2, 1
/* B768C 800C6E8C 0D80043C */  lui        $a0, %hi(_spu_RXX)
/* B7690 800C6E90 5CED848C */  lw         $a0, %lo(_spu_RXX)($a0)
/* B7694 800C6E94 00000000 */  nop
/* B7698 800C6E98 21104400 */  addu       $v0, $v0, $a0
/* B769C 800C6E9C 21186400 */  addu       $v1, $v1, $a0
/* B76A0 800C6EA0 000048A4 */  sh         $t0, 0x0($v0)
/* B76A4 800C6EA4 02140800 */  srl        $v0, $t0, 16
/* B76A8 800C6EA8 FF004230 */  andi       $v0, $v0, 0xFF
/* B76AC 800C6EAC 000062A4 */  sh         $v0, 0x0($v1)
/* B76B0 800C6EB0 FF00023C */  lui        $v0, (0xFFFFFF >> 16)
.L800C6EB4:
/* B76B4 800C6EB4 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* B76B8 800C6EB8 24500201 */  and        $t2, $t0, $v0
.L800C6EBC:
/* B76BC 800C6EBC FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* B76C0 800C6EC0 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
.L800C6EC4:
/* B76C4 800C6EC4 0800E003 */  jr         $ra
/* B76C8 800C6EC8 24104201 */   and       $v0, $t2, $v0
/* B76CC 800C6ECC 00000000 */  nop
.size _SpuSetAnyVoice, . - _SpuSetAnyVoice
