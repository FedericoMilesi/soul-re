.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_DefaultAnimCallback
/* 261C8 800359C8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 261CC 800359CC 4000A58F */  lw         $a1, 0x40($sp)
/* 261D0 800359D0 2800B4AF */  sw         $s4, 0x28($sp)
/* 261D4 800359D4 21A0E000 */  addu       $s4, $a3, $zero
/* 261D8 800359D8 2400B3AF */  sw         $s3, 0x24($sp)
/* 261DC 800359DC 4400B38F */  lw         $s3, 0x44($sp)
/* 261E0 800359E0 06000224 */  addiu      $v0, $zero, 0x6
/* 261E4 800359E4 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 261E8 800359E8 2000B2AF */  sw         $s2, 0x20($sp)
/* 261EC 800359EC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 261F0 800359F0 2D00C214 */  bne        $a2, $v0, .L80035AA8
/* 261F4 800359F4 1800B0AF */   sw        $s0, 0x18($sp)
/* 261F8 800359F8 05008012 */  beqz       $s4, .L80035A10
/* 261FC 800359FC 01000224 */   addiu     $v0, $zero, 0x1
/* 26200 80035A00 26008212 */  beq        $s4, $v0, .L80035A9C
/* 26204 80035A04 21108002 */   addu      $v0, $s4, $zero
/* 26208 80035A08 ABD60008 */  j          .L80035AAC
/* 2620C 80035A0C 00000000 */   nop
.L80035A10:
/* 26210 80035A10 2500A010 */  beqz       $a1, .L80035AA8
/* 26214 80035A14 2190A000 */   addu      $s2, $a1, $zero
/* 26218 80035A18 0200A294 */  lhu        $v0, 0x2($a1)
/* 2621C 80035A1C 00000000 */  nop
/* 26220 80035A20 001C0200 */  sll        $v1, $v0, 16
/* 26224 80035A24 038C0300 */  sra        $s1, $v1, 16
/* 26228 80035A28 E803222A */  slti       $v0, $s1, 0x3E8
/* 2622C 80035A2C 13004014 */  bnez       $v0, .L80035A7C
/* 26230 80035A30 5C006426 */   addiu     $a0, $s3, 0x5C
/* 26234 80035A34 6210023C */  lui        $v0, (0x10624DD3 >> 16)
/* 26238 80035A38 D34D4234 */  ori        $v0, $v0, (0x10624DD3 & 0xFFFF)
/* 2623C 80035A3C 18002202 */  mult       $s1, $v0
/* 26240 80035A40 21206002 */  addu       $a0, $s3, $zero
/* 26244 80035A44 C3170300 */  sra        $v0, $v1, 31
/* 26248 80035A48 10400000 */  mfhi       $t0
/* 2624C 80035A4C 83810800 */  sra        $s0, $t0, 6
/* 26250 80035A50 23800202 */  subu       $s0, $s0, $v0
/* 26254 80035A54 40111000 */  sll        $v0, $s0, 5
/* 26258 80035A58 23105000 */  subu       $v0, $v0, $s0
/* 2625C 80035A5C 80100200 */  sll        $v0, $v0, 2
/* 26260 80035A60 21105000 */  addu       $v0, $v0, $s0
/* 26264 80035A64 C0100200 */  sll        $v0, $v0, 3
/* 26268 80035A68 60F6010C */  jal        HUMAN_TypeOfHuman
/* 2626C 80035A6C 23882202 */   subu      $s1, $s1, $v0
/* 26270 80035A70 0E000216 */  bne        $s0, $v0, .L80035AAC
/* 26274 80035A74 21100000 */   addu      $v0, $zero, $zero
/* 26278 80035A78 5C006426 */  addiu      $a0, $s3, 0x5C
.L80035A7C:
/* 2627C 80035A7C 00004586 */  lh         $a1, 0x0($s2)
/* 26280 80035A80 04004686 */  lh         $a2, 0x4($s2)
/* 26284 80035A84 06004286 */  lh         $v0, 0x6($s2)
/* 26288 80035A88 21382002 */  addu       $a3, $s1, $zero
/* 2628C 80035A8C 1300010C */  jal        SOUND_Play3dSound
/* 26290 80035A90 1000A2AF */   sw        $v0, 0x10($sp)
/* 26294 80035A94 ABD60008 */  j          .L80035AAC
/* 26298 80035A98 21108002 */   addu      $v0, $s4, $zero
.L80035A9C:
/* 2629C 80035A9C 21206002 */  addu       $a0, $s3, $zero
/* 262A0 80035AA0 8E34010C */  jal        FX_StartInstanceEffect
/* 262A4 80035AA4 21300000 */   addu      $a2, $zero, $zero
.L80035AA8:
/* 262A8 80035AA8 21108002 */  addu       $v0, $s4, $zero
.L80035AAC:
/* 262AC 80035AAC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 262B0 80035AB0 2800B48F */  lw         $s4, 0x28($sp)
/* 262B4 80035AB4 2400B38F */  lw         $s3, 0x24($sp)
/* 262B8 80035AB8 2000B28F */  lw         $s2, 0x20($sp)
/* 262BC 80035ABC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 262C0 80035AC0 1800B08F */  lw         $s0, 0x18($sp)
/* 262C4 80035AC4 0800E003 */  jr         $ra
/* 262C8 80035AC8 3000BD27 */   addiu     $sp, $sp, 0x30
.size INSTANCE_DefaultAnimCallback, . - INSTANCE_DefaultAnimCallback
