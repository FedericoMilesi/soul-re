.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_GeneralDeath
/* 7BD68 8008B568 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7BD6C 8008B56C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7BD70 8008B570 21888000 */  addu       $s1, $a0, $zero
/* 7BD74 8008B574 1800B2AF */  sw         $s2, 0x18($sp)
/* 7BD78 8008B578 2000BFAF */  sw         $ra, 0x20($sp)
/* 7BD7C 8008B57C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7BD80 8008B580 1000B0AF */  sw         $s0, 0x10($sp)
/* 7BD84 8008B584 1800228E */  lw         $v0, 0x18($s1)
/* 7BD88 8008B588 6C01308E */  lw         $s0, 0x16C($s1)
/* 7BD8C 8008B58C 10004230 */  andi       $v0, $v0, 0x10
/* 7BD90 8008B590 05004010 */  beqz       $v0, .L8008B5A8
/* 7BD94 8008B594 21900000 */   addu      $s2, $zero, $zero
/* 7BD98 8008B598 C3FF010C */  jal        MON_AnimPlaying
/* 7BD9C 8008B59C 24000524 */   addiu     $a1, $zero, 0x24
/* 7BDA0 8008B5A0 05004014 */  bnez       $v0, .L8008B5B8
/* 7BDA4 8008B5A4 00000000 */   nop
.L8008B5A8:
/* 7BDA8 8008B5A8 58010392 */  lbu        $v1, 0x158($s0)
/* 7BDAC 8008B5AC 06000224 */  addiu      $v0, $zero, 0x6
/* 7BDB0 8008B5B0 03006214 */  bne        $v1, $v0, .L8008B5C0
/* 7BDB4 8008B5B4 00000000 */   nop
.L8008B5B8:
/* 7BDB8 8008B5B8 812D0208 */  j          .L8008B604
/* 7BDBC 8008B5BC 01001224 */   addiu     $s2, $zero, 0x1
.L8008B5C0:
/* 7BDC0 8008B5C0 1800228E */  lw         $v0, 0x18($s1)
/* 7BDC4 8008B5C4 00000000 */  nop
/* 7BDC8 8008B5C8 12004230 */  andi       $v0, $v0, 0x12
/* 7BDCC 8008B5CC 0D004010 */  beqz       $v0, .L8008B604
/* 7BDD0 8008B5D0 00000000 */   nop
/* 7BDD4 8008B5D4 9006020C */  jal        MON_GetTime
/* 7BDD8 8008B5D8 21202002 */   addu      $a0, $s1, $zero
/* 7BDDC 8008B5DC 1401038E */  lw         $v1, 0x114($s0)
/* 7BDE0 8008B5E0 00000000 */  nop
/* 7BDE4 8008B5E4 2B186200 */  sltu       $v1, $v1, $v0
/* 7BDE8 8008B5E8 06006010 */  beqz       $v1, .L8008B604
/* 7BDEC 8008B5EC 24000524 */   addiu     $a1, $zero, 0x24
/* 7BDF0 8008B5F0 21202002 */  addu       $a0, $s1, $zero
/* 7BDF4 8008B5F4 B6FF010C */  jal        MON_PlayAnim
/* 7BDF8 8008B5F8 01000624 */   addiu     $a2, $zero, 0x1
/* 7BDFC 8008B5FC 7BFE010C */  jal        MON_TurnOffAllSpheres
/* 7BE00 8008B600 21202002 */   addu      $a0, $s1, $zero
.L8008B604:
/* 7BE04 8008B604 09004012 */  beqz       $s2, .L8008B62C
/* 7BE08 8008B608 C8012426 */   addiu     $a0, $s1, 0x1C8
/* 7BE0C 8008B60C 0000028E */  lw         $v0, 0x0($s0)
/* 7BE10 8008B610 EFFF0324 */  addiu      $v1, $zero, -0x11
/* 7BE14 8008B614 24104300 */  and        $v0, $v0, $v1
/* 7BE18 8008B618 5E3F020C */  jal        G2Anim_SetNoLooping
/* 7BE1C 8008B61C 000002AE */   sw        $v0, 0x0($s0)
/* 7BE20 8008B620 21202002 */  addu       $a0, $s1, $zero
/* 7BE24 8008B624 91FE010C */  jal        MON_SwitchState
/* 7BE28 8008B628 17000524 */   addiu     $a1, $zero, 0x17
.L8008B62C:
/* 7BE2C 8008B62C 0000028E */  lw         $v0, 0x0($s0)
/* 7BE30 8008B630 00000000 */  nop
/* 7BE34 8008B634 00044230 */  andi       $v0, $v0, 0x400
/* 7BE38 8008B638 0C004010 */  beqz       $v0, .L8008B66C
/* 7BE3C 8008B63C 00000000 */   nop
/* 7BE40 8008B640 9304020C */  jal        MON_OnGround
/* 7BE44 8008B644 21202002 */   addu      $a0, $s1, $zero
/* 7BE48 8008B648 04004010 */  beqz       $v0, .L8008B65C
/* 7BE4C 8008B64C FDFF0324 */   addiu     $v1, $zero, -0x3
/* 7BE50 8008B650 0000028E */  lw         $v0, 0x0($s0)
/* 7BE54 8008B654 9A2D0208 */  j          .L8008B668
/* 7BE58 8008B658 02004234 */   ori       $v0, $v0, 0x2
.L8008B65C:
/* 7BE5C 8008B65C 0000028E */  lw         $v0, 0x0($s0)
/* 7BE60 8008B660 00000000 */  nop
/* 7BE64 8008B664 24104300 */  and        $v0, $v0, $v1
.L8008B668:
/* 7BE68 8008B668 000002AE */  sw         $v0, 0x0($s0)
.L8008B66C:
/* 7BE6C 8008B66C 0000028E */  lw         $v0, 0x0($s0)
/* 7BE70 8008B670 00000000 */  nop
/* 7BE74 8008B674 02004230 */  andi       $v0, $v0, 0x2
/* 7BE78 8008B678 04004014 */  bnez       $v0, .L8008B68C
/* 7BE7C 8008B67C 0001123C */   lui       $s2, (0x100000B >> 16)
/* 7BE80 8008B680 CF04020C */  jal        MON_ApplyPhysics
/* 7BE84 8008B684 21202002 */   addu      $a0, $s1, $zero
/* 7BE88 8008B688 0001123C */  lui        $s2, (0x100000B >> 16)
.L8008B68C:
/* 7BE8C 8008B68C 0B005236 */  ori        $s2, $s2, (0x100000B & 0xFFFF)
/* 7BE90 8008B690 F0FF1324 */  addiu      $s3, $zero, -0x10
.L8008B694:
/* 7BE94 8008B694 27C3010C */  jal        DeMessageQueue
/* 7BE98 8008B698 08000426 */   addiu     $a0, $s0, 0x8
/* 7BE9C 8008B69C 09004010 */  beqz       $v0, .L8008B6C4
/* 7BEA0 8008B6A0 00000000 */   nop
/* 7BEA4 8008B6A4 0000428C */  lw         $v0, 0x0($v0)
/* 7BEA8 8008B6A8 00000000 */  nop
/* 7BEAC 8008B6AC F9FF5214 */  bne        $v0, $s2, .L8008B694
/* 7BEB0 8008B6B0 00000000 */   nop
/* 7BEB4 8008B6B4 800120AE */  sw         $zero, 0x180($s1)
/* 7BEB8 8008B6B8 840120AE */  sw         $zero, 0x184($s1)
/* 7BEBC 8008B6BC A52D0208 */  j          .L8008B694
/* 7BEC0 8008B6C0 880133AE */   sw        $s3, 0x188($s1)
.L8008B6C4:
/* 7BEC4 8008B6C4 2000BF8F */  lw         $ra, 0x20($sp)
/* 7BEC8 8008B6C8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7BECC 8008B6CC 1800B28F */  lw         $s2, 0x18($sp)
/* 7BED0 8008B6D0 1400B18F */  lw         $s1, 0x14($sp)
/* 7BED4 8008B6D4 1000B08F */  lw         $s0, 0x10($sp)
/* 7BED8 8008B6D8 0800E003 */  jr         $ra
/* 7BEDC 8008B6DC 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_GeneralDeath, . - MON_GeneralDeath
