.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_draw
/* A8930 800B8130 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* A8934 800B8134 3800B2AF */  sw         $s2, 0x38($sp)
/* A8938 800B8138 21908000 */  addu       $s2, $a0, $zero
/* A893C 800B813C 0D80023C */  lui        $v0, %hi(D_800D1F40)
/* A8940 800B8140 4C00BFAF */  sw         $ra, 0x4C($sp)
/* A8944 800B8144 4800B6AF */  sw         $s6, 0x48($sp)
/* A8948 800B8148 4400B5AF */  sw         $s5, 0x44($sp)
/* A894C 800B814C 4000B4AF */  sw         $s4, 0x40($sp)
/* A8950 800B8150 3C00B3AF */  sw         $s3, 0x3C($sp)
/* A8954 800B8154 3400B1AF */  sw         $s1, 0x34($sp)
/* A8958 800B8158 3000B0AF */  sw         $s0, 0x30($sp)
/* A895C 800B815C 401F4C24 */  addiu      $t4, $v0, %lo(D_800D1F40)
/* A8960 800B8160 0000898D */  lw         $t1, 0x0($t4)
/* A8964 800B8164 04008A8D */  lw         $t2, 0x4($t4)
/* A8968 800B8168 08008B8D */  lw         $t3, 0x8($t4)
/* A896C 800B816C 2000A9AF */  sw         $t1, 0x20($sp)
/* A8970 800B8170 2400AAAF */  sw         $t2, 0x24($sp)
/* A8974 800B8174 2800ABAF */  sw         $t3, 0x28($sp)
/* A8978 800B8178 0C00898D */  lw         $t1, 0xC($t4)
/* A897C 800B817C 00000000 */  nop
/* A8980 800B8180 2C00A9AF */  sw         $t1, 0x2C($sp)
/* A8984 800B8184 0000438E */  lw         $v1, 0x0($s2)
/* A8988 800B8188 00000000 */  nop
/* A898C 800B818C C0100300 */  sll        $v0, $v1, 3
/* A8990 800B8190 21104300 */  addu       $v0, $v0, $v1
/* A8994 800B8194 80100200 */  sll        $v0, $v0, 2
/* A8998 800B8198 21105200 */  addu       $v0, $v0, $s2
/* A899C 800B819C E8FF5624 */  addiu      $s6, $v0, -0x18
/* A89A0 800B81A0 8003428E */  lw         $v0, 0x380($s2)
/* A89A4 800B81A4 0400D58E */  lw         $s5, 0x4($s6)
/* A89A8 800B81A8 04004010 */  beqz       $v0, .L800B81BC
/* A89AC 800B81AC 21980000 */   addu      $s3, $zero, $zero
/* A89B0 800B81B0 8403448E */  lw         $a0, 0x384($s2)
/* A89B4 800B81B4 09F84000 */  jalr       $v0
/* A89B8 800B81B8 00000000 */   nop
.L800B81BC:
/* A89BC 800B81BC 0400428E */  lw         $v0, 0x4($s2)
/* A89C0 800B81C0 00000000 */  nop
/* A89C4 800B81C4 1E004018 */  blez       $v0, .L800B8240
/* A89C8 800B81C8 21800000 */   addu      $s0, $zero, $zero
/* A89CC 800B81CC 2000B427 */  addiu      $s4, $sp, 0x20
/* A89D0 800B81D0 C0001124 */  addiu      $s1, $zero, 0xC0
.L800B81D4:
/* A89D4 800B81D4 06000016 */  bnez       $s0, .L800B81F0
/* A89D8 800B81D8 21185102 */   addu      $v1, $s2, $s1
/* A89DC 800B81DC 0C00628C */  lw         $v0, 0xC($v1)
/* A89E0 800B81E0 00000000 */  nop
/* A89E4 800B81E4 04004230 */  andi       $v0, $v0, 0x4
/* A89E8 800B81E8 03004014 */  bnez       $v0, .L800B81F8
/* A89EC 800B81EC 03000824 */   addiu     $t0, $zero, 0x3
.L800B81F0:
/* A89F0 800B81F0 26101502 */  xor        $v0, $s0, $s5
/* A89F4 800B81F4 2B400200 */  sltu       $t0, $zero, $v0
.L800B81F8:
/* A89F8 800B81F8 21204002 */  addu       $a0, $s2, $zero
/* A89FC 800B81FC 21286002 */  addu       $a1, $s3, $zero
/* A8A00 800B8200 21300000 */  addu       $a2, $zero, $zero
/* A8A04 800B8204 2138C000 */  addu       $a3, $a2, $zero
/* A8A08 800B8208 0000628C */  lw         $v0, 0x0($v1)
/* A8A0C 800B820C 10003126 */  addiu      $s1, $s1, 0x10
/* A8A10 800B8210 1400A8AF */  sw         $t0, 0x14($sp)
/* A8A14 800B8214 1000A2AF */  sw         $v0, 0x10($sp)
/* A8A18 800B8218 0C00628C */  lw         $v0, 0xC($v1)
/* A8A1C 800B821C 01001026 */  addiu      $s0, $s0, 0x1
/* A8A20 800B8220 1C00B4AF */  sw         $s4, 0x1C($sp)
/* A8A24 800B8224 4BDF020C */  jal        menu_draw_item
/* A8A28 800B8228 1800A2AF */   sw        $v0, 0x18($sp)
/* A8A2C 800B822C 0400438E */  lw         $v1, 0x4($s2)
/* A8A30 800B8230 00000000 */  nop
/* A8A34 800B8234 2A180302 */  slt        $v1, $s0, $v1
/* A8A38 800B8238 E6FF6014 */  bnez       $v1, .L800B81D4
/* A8A3C 800B823C 21984000 */   addu      $s3, $v0, $zero
.L800B8240:
/* A8A40 800B8240 2000C28E */  lw         $v0, 0x20($s6)
/* A8A44 800B8244 00000000 */  nop
/* A8A48 800B8248 07004010 */  beqz       $v0, .L800B8268
/* A8A4C 800B824C 00000000 */   nop
/* A8A50 800B8250 2000A48F */  lw         $a0, 0x20($sp)
/* A8A54 800B8254 2400A58F */  lw         $a1, 0x24($sp)
/* A8A58 800B8258 2800A68F */  lw         $a2, 0x28($sp)
/* A8A5C 800B825C 2C00A78F */  lw         $a3, 0x2C($sp)
/* A8A60 800B8260 BDDE020C */  jal        DisplayMenuBox
/* A8A64 800B8264 00000000 */   nop
.L800B8268:
/* A8A68 800B8268 4C00BF8F */  lw         $ra, 0x4C($sp)
/* A8A6C 800B826C 4800B68F */  lw         $s6, 0x48($sp)
/* A8A70 800B8270 4400B58F */  lw         $s5, 0x44($sp)
/* A8A74 800B8274 4000B48F */  lw         $s4, 0x40($sp)
/* A8A78 800B8278 3C00B38F */  lw         $s3, 0x3C($sp)
/* A8A7C 800B827C 3800B28F */  lw         $s2, 0x38($sp)
/* A8A80 800B8280 3400B18F */  lw         $s1, 0x34($sp)
/* A8A84 800B8284 3000B08F */  lw         $s0, 0x30($sp)
/* A8A88 800B8288 0800E003 */  jr         $ra
/* A8A8C 800B828C 5000BD27 */   addiu     $sp, $sp, 0x50
.size menu_draw, . - menu_draw
