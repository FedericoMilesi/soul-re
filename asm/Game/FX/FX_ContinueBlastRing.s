.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_ContinueBlastRing
/* 3C524 8004BD24 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 3C528 8004BD28 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3C52C 8004BD2C 2000B0AF */  sw         $s0, 0x20($sp)
/* 3C530 8004BD30 21808000 */  addu       $s0, $a0, $zero
/* 3C534 8004BD34 2400BFAF */  sw         $ra, 0x24($sp)
/* 3C538 8004BD38 5400038E */  lw         $v1, 0x54($s0)
/* 3C53C 8004BD3C 02110200 */  srl        $v0, $v0, 4
/* 3C540 8004BD40 18006200 */  mult       $v1, $v0
/* 3C544 8004BD44 12200000 */  mflo       $a0
/* 3C548 8004BD48 02008104 */  bgez       $a0, .L8004BD54
/* 3C54C 8004BD4C 00000000 */   nop
/* 3C550 8004BD50 FF008424 */  addiu      $a0, $a0, 0xFF
.L8004BD54:
/* 3C554 8004BD54 C0C38387 */  lh         $v1, %gp_rel(FX_Frames)($gp)
/* 3C558 8004BD58 5800028E */  lw         $v0, 0x58($s0)
/* 3C55C 8004BD5C 00000000 */  nop
/* 3C560 8004BD60 18004300 */  mult       $v0, $v1
/* 3C564 8004BD64 031A0400 */  sra        $v1, $a0, 8
/* 3C568 8004BD68 3C00028E */  lw         $v0, 0x3C($s0)
/* 3C56C 8004BD6C 5000048E */  lw         $a0, 0x50($s0)
/* 3C570 8004BD70 21104300 */  addu       $v0, $v0, $v1
/* 3C574 8004BD74 3C0002AE */  sw         $v0, 0x3C($s0)
/* 3C578 8004BD78 5400028E */  lw         $v0, 0x54($s0)
/* 3C57C 8004BD7C 3C00038E */  lw         $v1, 0x3C($s0)
/* 3C580 8004BD80 12400000 */  mflo       $t0
/* 3C584 8004BD84 21284800 */  addu       $a1, $v0, $t0
/* 3C588 8004BD88 2A108300 */  slt        $v0, $a0, $v1
/* 3C58C 8004BD8C 2B004010 */  beqz       $v0, .L8004BE3C
/* 3C590 8004BD90 540005AE */   sw        $a1, 0x54($s0)
/* 3C594 8004BD94 21106000 */  addu       $v0, $v1, $zero
/* 3C598 8004BD98 02004104 */  bgez       $v0, .L8004BDA4
/* 3C59C 8004BD9C 00000000 */   nop
/* 3C5A0 8004BDA0 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004BDA4:
/* 3C5A4 8004BDA4 02008104 */  bgez       $a0, .L8004BDB0
/* 3C5A8 8004BDA8 03130200 */   sra       $v0, $v0, 12
/* 3C5AC 8004BDAC FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8004BDB0:
/* 3C5B0 8004BDB0 4C00038E */  lw         $v1, 0x4C($s0)
/* 3C5B4 8004BDB4 00000000 */  nop
/* 3C5B8 8004BDB8 02006104 */  bgez       $v1, .L8004BDC4
/* 3C5BC 8004BDBC 03230400 */   sra       $a0, $a0, 12
/* 3C5C0 8004BDC0 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004BDC4:
/* 3C5C4 8004BDC4 0C00A104 */  bgez       $a1, .L8004BDF8
/* 3C5C8 8004BDC8 031B0300 */   sra       $v1, $v1, 12
/* 3C5CC 8004BDCC 4800038E */  lw         $v1, 0x48($s0)
/* 3C5D0 8004BDD0 23104400 */  subu       $v0, $v0, $a0
/* 3C5D4 8004BDD4 02006104 */  bgez       $v1, .L8004BDE0
/* 3C5D8 8004BDD8 00330200 */   sll       $a2, $v0, 12
/* 3C5DC 8004BDDC FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004BDE0:
/* 3C5E0 8004BDE0 03130300 */  sra        $v0, $v1, 12
/* 3C5E4 8004BDE4 23104400 */  subu       $v0, $v0, $a0
/* 3C5E8 8004BDE8 1A00C200 */  div        $zero, $a2, $v0
/* 3C5EC 8004BDEC 12300000 */  mflo       $a2
/* 3C5F0 8004BDF0 852F0108 */  j          .L8004BE14
/* 3C5F4 8004BDF4 0010C228 */   slti      $v0, $a2, 0x1000
.L8004BDF8:
/* 3C5F8 8004BDF8 23104400 */  subu       $v0, $v0, $a0
/* 3C5FC 8004BDFC 00130200 */  sll        $v0, $v0, 12
/* 3C600 8004BE00 23186400 */  subu       $v1, $v1, $a0
/* 3C604 8004BE04 1A004300 */  div        $zero, $v0, $v1
/* 3C608 8004BE08 12300000 */  mflo       $a2
/* 3C60C 8004BE0C 00000000 */  nop
/* 3C610 8004BE10 0010C228 */  slti       $v0, $a2, 0x1000
.L8004BE14:
/* 3C614 8004BE14 03004014 */  bnez       $v0, .L8004BE24
/* 3C618 8004BE18 6C000226 */   addiu     $v0, $s0, 0x6C
/* 3C61C 8004BE1C 8F2F0108 */  j          .L8004BE3C
/* 3C620 8004BE20 6C0000AE */   sw        $zero, 0x6C($s0)
.L8004BE24:
/* 3C624 8004BE24 1000A2AF */  sw         $v0, 0x10($sp)
/* 3C628 8004BE28 74000426 */  addiu      $a0, $s0, 0x74
/* 3C62C 8004BE2C 70000526 */  addiu      $a1, $s0, 0x70
/* 3C630 8004BE30 00100724 */  addiu      $a3, $zero, 0x1000
/* 3C634 8004BE34 A8F3020C */  jal        LoadAverageCol
/* 3C638 8004BE38 2338E600 */   subu      $a3, $a3, $a2
.L8004BE3C:
/* 3C63C 8004BE3C D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 3C640 8004BE40 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 3C644 8004BE44 14006210 */  beq        $v1, $v0, .L8004BE98
/* 3C648 8004BE48 FF00033C */   lui       $v1, (0xFFFFFF >> 16)
/* 3C64C 8004BE4C 0800048E */  lw         $a0, 0x8($s0)
/* 3C650 8004BE50 39D6000C */  jal        INSTANCE_GetFadeValue
/* 3C654 8004BE54 1800A0AF */   sw        $zero, 0x18($sp)
/* 3C658 8004BE58 3C00048E */  lw         $a0, 0x3C($s0)
/* 3C65C 8004BE5C 5000038E */  lw         $v1, 0x50($s0)
/* 3C660 8004BE60 00000000 */  nop
/* 3C664 8004BE64 2A186400 */  slt        $v1, $v1, $a0
/* 3C668 8004BE68 03006010 */  beqz       $v1, .L8004BE78
/* 3C66C 8004BE6C 21384000 */   addu      $a3, $v0, $zero
/* 3C670 8004BE70 9F2F0108 */  j          .L8004BE7C
/* 3C674 8004BE74 6C000426 */   addiu     $a0, $s0, 0x6C
.L8004BE78:
/* 3C678 8004BE78 70000426 */  addiu      $a0, $s0, 0x70
.L8004BE7C:
/* 3C67C 8004BE7C 6C000226 */  addiu      $v0, $s0, 0x6C
/* 3C680 8004BE80 1000A2AF */  sw         $v0, 0x10($sp)
/* 3C684 8004BE84 1800A527 */  addiu      $a1, $sp, 0x18
/* 3C688 8004BE88 00100624 */  addiu      $a2, $zero, 0x1000
/* 3C68C 8004BE8C A8F3020C */  jal        LoadAverageCol
/* 3C690 8004BE90 2330C700 */   subu      $a2, $a2, $a3
/* 3C694 8004BE94 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
.L8004BE98:
/* 3C698 8004BE98 6C00028E */  lw         $v0, 0x6C($s0)
/* 3C69C 8004BE9C FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 3C6A0 8004BEA0 24104300 */  and        $v0, $v0, $v1
/* 3C6A4 8004BEA4 0E000386 */  lh         $v1, 0xE($s0)
/* 3C6A8 8004BEA8 6C0002AE */  sw         $v0, 0x6C($s0)
/* 3C6AC 8004BEAC 9DFF0224 */  addiu      $v0, $zero, -0x63
/* 3C6B0 8004BEB0 13006210 */  beq        $v1, $v0, .L8004BF00
/* 3C6B4 8004BEB4 00000000 */   nop
/* 3C6B8 8004BEB8 5400048E */  lw         $a0, 0x54($s0)
/* 3C6BC 8004BEBC 00000000 */  nop
/* 3C6C0 8004BEC0 07008018 */  blez       $a0, .L8004BEE0
/* 3C6C4 8004BEC4 00000000 */   nop
/* 3C6C8 8004BEC8 3C00038E */  lw         $v1, 0x3C($s0)
/* 3C6CC 8004BECC 4C00028E */  lw         $v0, 0x4C($s0)
/* 3C6D0 8004BED0 00000000 */  nop
/* 3C6D4 8004BED4 2A104300 */  slt        $v0, $v0, $v1
/* 3C6D8 8004BED8 11004014 */  bnez       $v0, .L8004BF20
/* 3C6DC 8004BEDC 00000000 */   nop
.L8004BEE0:
/* 3C6E0 8004BEE0 07008104 */  bgez       $a0, .L8004BF00
/* 3C6E4 8004BEE4 00000000 */   nop
/* 3C6E8 8004BEE8 3C00028E */  lw         $v0, 0x3C($s0)
/* 3C6EC 8004BEEC 4C00038E */  lw         $v1, 0x4C($s0)
/* 3C6F0 8004BEF0 00000000 */  nop
/* 3C6F4 8004BEF4 2A104300 */  slt        $v0, $v0, $v1
/* 3C6F8 8004BEF8 09004014 */  bnez       $v0, .L8004BF20
/* 3C6FC 8004BEFC 00000000 */   nop
.L8004BF00:
/* 3C700 8004BF00 0E000286 */  lh         $v0, 0xE($s0)
/* 3C704 8004BF04 0E000396 */  lhu        $v1, 0xE($s0)
/* 3C708 8004BF08 07004004 */  bltz       $v0, .L8004BF28
/* 3C70C 8004BF0C FFFF6224 */   addiu     $v0, $v1, -0x1
/* 3C710 8004BF10 0E0002A6 */  sh         $v0, 0xE($s0)
/* 3C714 8004BF14 00140200 */  sll        $v0, $v0, 16
/* 3C718 8004BF18 0300401C */  bgtz       $v0, .L8004BF28
/* 3C71C 8004BF1C 00000000 */   nop
.L8004BF20:
/* 3C720 8004BF20 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3C724 8004BF24 21200002 */   addu      $a0, $s0, $zero
.L8004BF28:
/* 3C728 8004BF28 2400BF8F */  lw         $ra, 0x24($sp)
/* 3C72C 8004BF2C 2000B08F */  lw         $s0, 0x20($sp)
/* 3C730 8004BF30 0800E003 */  jr         $ra
/* 3C734 8004BF34 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_ContinueBlastRing, . - FX_ContinueBlastRing
