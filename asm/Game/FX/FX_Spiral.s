.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Spiral
/* 3E3B4 8004DBB4 78FFBD27 */  addiu      $sp, $sp, -0x88
/* 3E3B8 8004DBB8 D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 3E3BC 8004DBBC E8030224 */  addiu      $v0, $zero, 0x3E8
/* 3E3C0 8004DBC0 8400BFAF */  sw         $ra, 0x84($sp)
/* 3E3C4 8004DBC4 8000BEAF */  sw         $fp, 0x80($sp)
/* 3E3C8 8004DBC8 7C00B7AF */  sw         $s7, 0x7C($sp)
/* 3E3CC 8004DBCC 7800B6AF */  sw         $s6, 0x78($sp)
/* 3E3D0 8004DBD0 7400B5AF */  sw         $s5, 0x74($sp)
/* 3E3D4 8004DBD4 7000B4AF */  sw         $s4, 0x70($sp)
/* 3E3D8 8004DBD8 6C00B3AF */  sw         $s3, 0x6C($sp)
/* 3E3DC 8004DBDC 6800B2AF */  sw         $s2, 0x68($sp)
/* 3E3E0 8004DBE0 6400B1AF */  sw         $s1, 0x64($sp)
/* 3E3E4 8004DBE4 6000B0AF */  sw         $s0, 0x60($sp)
/* 3E3E8 8004DBE8 8800A4AF */  sw         $a0, 0x88($sp)
/* 3E3EC 8004DBEC 0D006210 */  beq        $v1, $v0, .L8004DC24
/* 3E3F0 8004DBF0 8C00A5AF */   sw        $a1, 0x8C($sp)
/* 3E3F4 8004DBF4 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 3E3F8 8004DBF8 00000000 */  nop
/* 3E3FC 8004DBFC 0A004014 */  bnez       $v0, .L8004DC28
/* 3E400 8004DC00 FC3A0B3C */   lui       $t3, (0x3AFCFFD3 >> 16)
/* 3E404 8004DC04 C49A8287 */  lh         $v0, %gp_rel(Spiral_Number)($gp)
/* 3E408 8004DC08 00000000 */  nop
/* 3E40C 8004DC0C 07004010 */  beqz       $v0, .L8004DC2C
/* 3E410 8004DC10 D3FF6B35 */   ori       $t3, $t3, (0x3AFCFFD3 & 0xFFFF)
/* 3E414 8004DC14 C89A858F */  lw         $a1, %gp_rel(Spiral_Current)($gp)
/* 3E418 8004DC18 CC9A868F */  lw         $a2, %gp_rel(Spiral_Max)($gp)
/* 3E41C 8004DC1C F537010C */  jal        FX_Health_Spiral
/* 3E420 8004DC20 01000424 */   addiu     $a0, $zero, 0x1
.L8004DC24:
/* 3E424 8004DC24 FC3A0B3C */  lui        $t3, (0x3AFCFFD3 >> 16)
.L8004DC28:
/* 3E428 8004DC28 D3FF6B35 */  ori        $t3, $t3, (0x3AFCFFD3 & 0xFFFF)
.L8004DC2C:
/* 3E42C 8004DC2C DC3A0A3C */  lui        $t2, (0x3ADCE0BA >> 16)
/* 3E430 8004DC30 BAE04A35 */  ori        $t2, $t2, (0x3ADCE0BA & 0xFFFF)
/* 3E434 8004DC34 BB3A0C3C */  lui        $t4, (0x3ABBC09D >> 16)
/* 3E438 8004DC38 9DC08C35 */  ori        $t4, $t4, (0x3ABBC09D & 0xFFFF)
/* 3E43C 8004DC3C 483A153C */  lui        $s5, (0x3A483017 >> 16)
/* 3E440 8004DC40 1730B536 */  ori        $s5, $s5, (0x3A483017 & 0xFFFF)
/* 3E444 8004DC44 003A063C */  lui        $a2, (0x3A002A15 >> 16)
/* 3E448 8004DC48 C49A8287 */  lh         $v0, %gp_rel(Spiral_Number)($gp)
/* 3E44C 8004DC4C 152AC634 */  ori        $a2, $a2, (0x3A002A15 & 0xFFFF)
/* 3E450 8004DC50 1D004014 */  bnez       $v0, .L8004DCC8
/* 3E454 8004DC54 4400ACAF */   sw        $t4, 0x44($sp)
/* 3E458 8004DC58 C89A838F */  lw         $v1, %gp_rel(Spiral_Current)($gp)
/* 3E45C 8004DC5C CC9A828F */  lw         $v0, %gp_rel(Spiral_Max)($gp)
/* 3E460 8004DC60 00000000 */  nop
/* 3E464 8004DC64 0D006214 */  bne        $v1, $v0, .L8004DC9C
/* 3E468 8004DC68 003A0C3C */   lui       $t4, (0x3A00BF00 >> 16)
/* 3E46C 8004DC6C D09A8297 */  lhu        $v0, %gp_rel(Spiral_Max + 0x4)($gp)
/* 3E470 8004DC70 00000000 */  nop
/* 3E474 8004DC74 01004224 */  addiu      $v0, $v0, 0x1
/* 3E478 8004DC78 D09A82A7 */  sh         $v0, %gp_rel(Spiral_Max + 0x4)($gp)
/* 3E47C 8004DC7C 00140200 */  sll        $v0, $v0, 16
/* 3E480 8004DC80 03140200 */  sra        $v0, $v0, 16
/* 3E484 8004DC84 51004228 */  slti       $v0, $v0, 0x51
/* 3E488 8004DC88 0C004014 */  bnez       $v0, .L8004DCBC
/* 3E48C 8004DC8C 00000000 */   nop
/* 3E490 8004DC90 D09A80A7 */  sh         $zero, %gp_rel(Spiral_Max + 0x4)($gp)
/* 3E494 8004DC94 30370108 */  j          .L8004DCC0
/* 3E498 8004DC98 003A063C */   lui       $a2, (0x3A00150B >> 16)
.L8004DC9C:
/* 3E49C 8004DC9C 003A0B3C */  lui        $t3, (0x3A00FF00 >> 16)
/* 3E4A0 8004DCA0 00FF6B35 */  ori        $t3, $t3, (0x3A00FF00 & 0xFFFF)
/* 3E4A4 8004DCA4 003A0A3C */  lui        $t2, (0x3A00E000 >> 16)
/* 3E4A8 8004DCA8 00E04A35 */  ori        $t2, $t2, (0x3A00E000 & 0xFFFF)
/* 3E4AC 8004DCAC 00BF8C35 */  ori        $t4, $t4, (0x3A00BF00 & 0xFFFF)
/* 3E4B0 8004DCB0 4400ACAF */  sw         $t4, 0x44($sp)
/* 3E4B4 8004DCB4 003A153C */  lui        $s5, (0x3A004500 >> 16)
/* 3E4B8 8004DCB8 0045B536 */  ori        $s5, $s5, (0x3A004500 & 0xFFFF)
.L8004DCBC:
/* 3E4BC 8004DCBC 003A063C */  lui        $a2, (0x3A00150B >> 16)
.L8004DCC0:
/* 3E4C0 8004DCC0 3C370108 */  j          .L8004DCF0
/* 3E4C4 8004DCC4 0B15C634 */   ori       $a2, $a2, (0x3A00150B & 0xFFFF)
.L8004DCC8:
/* 3E4C8 8004DCC8 D09A8297 */  lhu        $v0, %gp_rel(Spiral_Max + 0x4)($gp)
/* 3E4CC 8004DCCC 00000000 */  nop
/* 3E4D0 8004DCD0 01004224 */  addiu      $v0, $v0, 0x1
/* 3E4D4 8004DCD4 D09A82A7 */  sh         $v0, %gp_rel(Spiral_Max + 0x4)($gp)
/* 3E4D8 8004DCD8 00140200 */  sll        $v0, $v0, 16
/* 3E4DC 8004DCDC 03140200 */  sra        $v0, $v0, 16
/* 3E4E0 8004DCE0 51004228 */  slti       $v0, $v0, 0x51
/* 3E4E4 8004DCE4 02004014 */  bnez       $v0, .L8004DCF0
/* 3E4E8 8004DCE8 00000000 */   nop
/* 3E4EC 8004DCEC D09A80A7 */  sh         $zero, %gp_rel(Spiral_Max + 0x4)($gp)
.L8004DCF0:
/* 3E4F0 8004DCF0 CC9A848F */  lw         $a0, %gp_rel(Spiral_Max)($gp)
/* 3E4F4 8004DCF4 00000000 */  nop
/* 3E4F8 8004DCF8 02008104 */  bgez       $a0, .L8004DD04
/* 3E4FC 8004DCFC 00000000 */   nop
/* 3E500 8004DD00 3F008424 */  addiu      $a0, $a0, 0x3F
.L8004DD04:
/* 3E504 8004DD04 C89A838F */  lw         $v1, %gp_rel(Spiral_Current)($gp)
/* 3E508 8004DD08 83210400 */  sra        $a0, $a0, 6
/* 3E50C 8004DD0C 1A006400 */  div        $zero, $v1, $a0
/* 3E510 8004DD10 12F00000 */  mflo       $fp
/* 3E514 8004DD14 00000000 */  nop
/* 3E518 8004DD18 00000000 */  nop
/* 3E51C 8004DD1C 1800C403 */  mult       $fp, $a0
/* 3E520 8004DD20 D0C4948F */  lw         $s4, %gp_rel(Spiral_Array + 0x100)($gp)
/* 3E524 8004DD24 8800AC8F */  lw         $t4, 0x88($sp)
/* 3E528 8004DD28 21988002 */  addu       $s3, $s4, $zero
/* 3E52C 8004DD2C 0400928D */  lw         $s2, 0x4($t4)
/* 3E530 8004DD30 0800858D */  lw         $a1, 0x8($t4)
/* 3E534 8004DD34 12100000 */  mflo       $v0
/* 3E538 8004DD38 23186200 */  subu       $v1, $v1, $v0
/* 3E53C 8004DD3C 001B0300 */  sll        $v1, $v1, 12
/* 3E540 8004DD40 44114226 */  addiu      $v0, $s2, 0x1144
/* 3E544 8004DD44 2B104500 */  sltu       $v0, $v0, $a1
/* 3E548 8004DD48 1A006400 */  div        $zero, $v1, $a0
/* 3E54C 8004DD4C 12480000 */  mflo       $t1
/* 3E550 8004DD50 94004010 */  beqz       $v0, .L8004DFA4
/* 3E554 8004DD54 21B88002 */   addu      $s7, $s4, $zero
/* 3E558 8004DD58 21880000 */  addu       $s1, $zero, $zero
/* 3E55C 8004DD5C 3800A827 */  addiu      $t0, $sp, 0x38
/* 3E560 8004DD60 FF00163C */  lui        $s6, (0xFFFFFF >> 16)
/* 3E564 8004DD64 FFFFD636 */  ori        $s6, $s6, (0xFFFFFF & 0xFFFF)
/* 3E568 8004DD68 00FF023C */  lui        $v0, (0xFF000000 >> 16)
/* 3E56C 8004DD6C 24106201 */  and        $v0, $t3, $v0
/* 3E570 8004DD70 D09A8C87 */  lh         $t4, %gp_rel(Spiral_Max + 0x4)($gp)
/* 3E574 8004DD74 40005026 */  addiu      $s0, $s2, 0x40
/* 3E578 8004DD78 4800A2AF */  sw         $v0, 0x48($sp)
/* 3E57C 8004DD7C 3800A6AF */  sw         $a2, 0x38($sp)
/* 3E580 8004DD80 3C00A6AF */  sw         $a2, 0x3C($sp)
/* 3E584 8004DD84 4000ACAF */  sw         $t4, 0x40($sp)
.L8004DD88:
/* 3E588 8004DD88 3800A28F */  lw         $v0, 0x38($sp)
/* 3E58C 8004DD8C 00000000 */  nop
/* 3E590 8004DD90 D4FF02AE */  sw         $v0, -0x2C($s0)
/* 3E594 8004DD94 E4FF02AE */  sw         $v0, -0x1C($s0)
/* 3E598 8004DD98 2A10D103 */  slt        $v0, $fp, $s1
/* 3E59C 8004DD9C 04004010 */  beqz       $v0, .L8004DDB0
/* 3E5A0 8004DDA0 00000000 */   nop
/* 3E5A4 8004DDA4 3C00A28F */  lw         $v0, 0x3C($sp)
/* 3E5A8 8004DDA8 83370108 */  j          .L8004DE0C
/* 3E5AC 8004DDAC 3800A2AF */   sw        $v0, 0x38($sp)
.L8004DDB0:
/* 3E5B0 8004DDB0 4000AC8F */  lw         $t4, 0x40($sp)
/* 3E5B4 8004DDB4 00000000 */  nop
/* 3E5B8 8004DDB8 21102C02 */  addu       $v0, $s1, $t4
/* 3E5BC 8004DDBC 0F004230 */  andi       $v0, $v0, 0xF
/* 3E5C0 8004DDC0 03004104 */  bgez       $v0, .L8004DDD0
/* 3E5C4 8004DDC4 83180200 */   sra       $v1, $v0, 2
/* 3E5C8 8004DDC8 03004224 */  addiu      $v0, $v0, 0x3
/* 3E5CC 8004DDCC 83180200 */  sra        $v1, $v0, 2
.L8004DDD0:
/* 3E5D0 8004DDD0 01000224 */  addiu      $v0, $zero, 0x1
/* 3E5D4 8004DDD4 0C006210 */  beq        $v1, $v0, .L8004DE08
/* 3E5D8 8004DDD8 02006228 */   slti      $v0, $v1, 0x2
/* 3E5DC 8004DDDC 05004014 */  bnez       $v0, .L8004DDF4
/* 3E5E0 8004DDE0 02000224 */   addiu     $v0, $zero, 0x2
/* 3E5E4 8004DDE4 05006210 */  beq        $v1, $v0, .L8004DDFC
/* 3E5E8 8004DDE8 03000224 */   addiu     $v0, $zero, 0x3
/* 3E5EC 8004DDEC 06006210 */  beq        $v1, $v0, .L8004DE08
/* 3E5F0 8004DDF0 00000000 */   nop
.L8004DDF4:
/* 3E5F4 8004DDF4 83370108 */  j          .L8004DE0C
/* 3E5F8 8004DDF8 3800ABAF */   sw        $t3, 0x38($sp)
.L8004DDFC:
/* 3E5FC 8004DDFC 4400AC8F */  lw         $t4, 0x44($sp)
/* 3E600 8004DE00 83370108 */  j          .L8004DE0C
/* 3E604 8004DE04 3800ACAF */   sw        $t4, 0x38($sp)
.L8004DE08:
/* 3E608 8004DE08 3800AAAF */  sw         $t2, 0x38($sp)
.L8004DE0C:
/* 3E60C 8004DE0C 14003E16 */  bne        $s1, $fp, .L8004DE60
/* 3E610 8004DE10 21200001 */   addu      $a0, $t0, $zero
/* 3E614 8004DE14 3C00A527 */  addiu      $a1, $sp, 0x3C
/* 3E618 8004DE18 21302001 */  addu       $a2, $t1, $zero
/* 3E61C 8004DE1C 00100724 */  addiu      $a3, $zero, 0x1000
/* 3E620 8004DE20 2338E900 */  subu       $a3, $a3, $t1
/* 3E624 8004DE24 1000A8AF */  sw         $t0, 0x10($sp)
/* 3E628 8004DE28 5000A8AF */  sw         $t0, 0x50($sp)
/* 3E62C 8004DE2C 5400A9AF */  sw         $t1, 0x54($sp)
/* 3E630 8004DE30 5800AAAF */  sw         $t2, 0x58($sp)
/* 3E634 8004DE34 A8F3020C */  jal        func_800BCEA0
/* 3E638 8004DE38 5C00ABAF */   sw        $t3, 0x5C($sp)
/* 3E63C 8004DE3C 3800A28F */  lw         $v0, 0x38($sp)
/* 3E640 8004DE40 4800AC8F */  lw         $t4, 0x48($sp)
/* 3E644 8004DE44 24105600 */  and        $v0, $v0, $s6
/* 3E648 8004DE48 25104C00 */  or         $v0, $v0, $t4
/* 3E64C 8004DE4C 3800A2AF */  sw         $v0, 0x38($sp)
/* 3E650 8004DE50 5C00AB8F */  lw         $t3, 0x5C($sp)
/* 3E654 8004DE54 5800AA8F */  lw         $t2, 0x58($sp)
/* 3E658 8004DE58 5400A98F */  lw         $t1, 0x54($sp)
/* 3E65C 8004DE5C 5000A88F */  lw         $t0, 0x50($sp)
.L8004DE60:
/* 3E660 8004DE60 C4FF15AE */  sw         $s5, -0x3C($s0)
/* 3E664 8004DE64 CCFF15AE */  sw         $s5, -0x34($s0)
/* 3E668 8004DE68 3800A28F */  lw         $v0, 0x38($sp)
/* 3E66C 8004DE6C 80181100 */  sll        $v1, $s1, 2
/* 3E670 8004DE70 F4FF15AE */  sw         $s5, -0xC($s0)
/* 3E674 8004DE74 FCFF15AE */  sw         $s5, -0x4($s0)
/* 3E678 8004DE78 E8FF13AE */  sw         $s3, -0x18($s0)
/* 3E67C 8004DE7C D8FF13AE */  sw         $s3, -0x28($s0)
/* 3E680 8004DE80 C8FF17AE */  sw         $s7, -0x38($s0)
/* 3E684 8004DE84 F8FF14AE */  sw         $s4, -0x8($s0)
/* 3E688 8004DE88 DCFF02AE */  sw         $v0, -0x24($s0)
/* 3E68C 8004DE8C ECFF02AE */  sw         $v0, -0x14($s0)
/* 3E690 8004DE90 D0C38227 */  addiu      $v0, $gp, %gp_rel(Spiral_Array)
/* 3E694 8004DE94 21106200 */  addu       $v0, $v1, $v0
/* 3E698 8004DE98 0000538C */  lw         $s3, 0x0($v0)
/* 3E69C 8004DE9C E0C48227 */  addiu      $v0, $gp, %gp_rel(Spiral_OffsetP)
/* 3E6A0 8004DEA0 21106200 */  addu       $v0, $v1, $v0
/* 3E6A4 8004DEA4 0000578C */  lw         $s7, 0x0($v0)
/* 3E6A8 8004DEA8 E0C58227 */  addiu      $v0, $gp, %gp_rel(Spiral_OffsetM)
/* 3E6AC 8004DEAC 21186200 */  addu       $v1, $v1, $v0
/* 3E6B0 8004DEB0 0000748C */  lw         $s4, 0x0($v1)
/* 3E6B4 8004DEB4 01003126 */  addiu      $s1, $s1, 0x1
/* 3E6B8 8004DEB8 F0FF13AE */  sw         $s3, -0x10($s0)
/* 3E6BC 8004DEBC E0FF13AE */  sw         $s3, -0x20($s0)
/* 3E6C0 8004DEC0 D0FF17AE */  sw         $s7, -0x30($s0)
/* 3E6C4 8004DEC4 000014AE */  sw         $s4, 0x0($s0)
/* 3E6C8 8004DEC8 8C00AC8F */  lw         $t4, 0x8C($sp)
/* 3E6CC 8004DECC 0010023C */  lui        $v0, (0x10000000 >> 16)
/* 3E6D0 8004DED0 0400838D */  lw         $v1, 0x4($t4)
/* 3E6D4 8004DED4 44001026 */  addiu      $s0, $s0, 0x44
/* 3E6D8 8004DED8 24187600 */  and        $v1, $v1, $s6
/* 3E6DC 8004DEDC 25186200 */  or         $v1, $v1, $v0
/* 3E6E0 8004DEE0 24105602 */  and        $v0, $s2, $s6
/* 3E6E4 8004DEE4 000043AE */  sw         $v1, 0x0($s2)
/* 3E6E8 8004DEE8 040082AD */  sw         $v0, 0x4($t4)
/* 3E6EC 8004DEEC 4000222A */  slti       $v0, $s1, 0x40
/* 3E6F0 8004DEF0 A5FF4014 */  bnez       $v0, .L8004DD88
/* 3E6F4 8004DEF4 44005226 */   addiu     $s2, $s2, 0x44
/* 3E6F8 8004DEF8 00E1023C */  lui        $v0, (0xE1000620 >> 16)
/* 3E6FC 8004DEFC 20064234 */  ori        $v0, $v0, (0xE1000620 & 0xFFFF)
/* 3E700 8004DF00 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 3E704 8004DF04 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 3E708 8004DF08 040042AE */  sw         $v0, 0x4($s2)
/* 3E70C 8004DF0C 0400828D */  lw         $v0, 0x4($t4)
/* 3E710 8004DF10 0001033C */  lui        $v1, (0x1000000 >> 16)
/* 3E714 8004DF14 24104400 */  and        $v0, $v0, $a0
/* 3E718 8004DF18 25104300 */  or         $v0, $v0, $v1
/* 3E71C 8004DF1C C49A8387 */  lh         $v1, %gp_rel(Spiral_Number)($gp)
/* 3E720 8004DF20 24204402 */  and        $a0, $s2, $a0
/* 3E724 8004DF24 000042AE */  sw         $v0, 0x0($s2)
/* 3E728 8004DF28 040084AD */  sw         $a0, 0x4($t4)
/* 3E72C 8004DF2C 8800AC8F */  lw         $t4, 0x88($sp)
/* 3E730 8004DF30 08004226 */  addiu      $v0, $s2, 0x8
/* 3E734 8004DF34 06006014 */  bnez       $v1, .L8004DF50
/* 3E738 8004DF38 040082AD */   sw        $v0, 0x4($t4)
/* 3E73C 8004DF3C C89A838F */  lw         $v1, %gp_rel(Spiral_Current)($gp)
/* 3E740 8004DF40 CC9A828F */  lw         $v0, %gp_rel(Spiral_Max)($gp)
/* 3E744 8004DF44 00000000 */  nop
/* 3E748 8004DF48 16006214 */  bne        $v1, $v0, .L8004DFA4
/* 3E74C 8004DF4C 00000000 */   nop
.L8004DF50:
/* 3E750 8004DF50 2800A427 */  addiu      $a0, $sp, 0x28
/* 3E754 8004DF54 40010524 */  addiu      $a1, $zero, 0x140
/* 3E758 8004DF58 08BE868F */  lw         $a2, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3E75C 8004DF5C E0C6828F */  lw         $v0, %gp_rel(Spiral_Glow_X)($gp)
/* 3E760 8004DF60 E4C6888F */  lw         $t0, %gp_rel(Spiral_Glow_Y)($gp)
/* 3E764 8004DF64 D29A8397 */  lhu        $v1, %gp_rel(Spiral_Max + 0x6)($gp)
/* 3E768 8004DF68 8C00A78F */  lw         $a3, 0x8C($sp)
/* 3E76C 8004DF6C E0FF6324 */  addiu      $v1, $v1, -0x20
/* 3E770 8004DF70 2C00A8AF */  sw         $t0, 0x2C($sp)
/* 3E774 8004DF74 E8C6888F */  lw         $t0, %gp_rel(Spiral_Glow_Size)($gp)
/* 3E778 8004DF78 FF0F6330 */  andi       $v1, $v1, 0xFFF
/* 3E77C 8004DF7C 2800A2AF */  sw         $v0, 0x28($sp)
/* 3E780 8004DF80 05000224 */  addiu      $v0, $zero, 0x5
/* 3E784 8004DF84 1000A2AF */  sw         $v0, 0x10($sp)
/* 3E788 8004DF88 00800234 */  ori        $v0, $zero, 0x8000
/* 3E78C 8004DF8C D29A83A7 */  sh         $v1, %gp_rel(Spiral_Max + 0x6)($gp)
/* 3E790 8004DF90 1400A2AF */  sw         $v0, 0x14($sp)
/* 3E794 8004DF94 2000A3AF */  sw         $v1, 0x20($sp)
/* 3E798 8004DF98 1800A8AF */  sw         $t0, 0x18($sp)
/* 3E79C 8004DF9C 23AE000C */  jal        DRAW_CreateAGlowingCircle
/* 3E7A0 8004DFA0 1C00A8AF */   sw        $t0, 0x1C($sp)
.L8004DFA4:
/* 3E7A4 8004DFA4 8400BF8F */  lw         $ra, 0x84($sp)
/* 3E7A8 8004DFA8 8000BE8F */  lw         $fp, 0x80($sp)
/* 3E7AC 8004DFAC 7C00B78F */  lw         $s7, 0x7C($sp)
/* 3E7B0 8004DFB0 7800B68F */  lw         $s6, 0x78($sp)
/* 3E7B4 8004DFB4 7400B58F */  lw         $s5, 0x74($sp)
/* 3E7B8 8004DFB8 7000B48F */  lw         $s4, 0x70($sp)
/* 3E7BC 8004DFBC 6C00B38F */  lw         $s3, 0x6C($sp)
/* 3E7C0 8004DFC0 6800B28F */  lw         $s2, 0x68($sp)
/* 3E7C4 8004DFC4 6400B18F */  lw         $s1, 0x64($sp)
/* 3E7C8 8004DFC8 6000B08F */  lw         $s0, 0x60($sp)
/* 3E7CC 8004DFCC 0800E003 */  jr         $ra
/* 3E7D0 8004DFD0 8800BD27 */   addiu     $sp, $sp, 0x88
.size FX_Spiral, . - FX_Spiral
