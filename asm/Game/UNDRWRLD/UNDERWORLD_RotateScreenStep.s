.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_RotateScreenStep
/* A50AC 800B48AC 00BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x138)($gp)
/* A50B0 800B48B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A50B4 800B48B4 1400B1AF */  sw         $s1, 0x14($sp)
/* A50B8 800B48B8 21888000 */  addu       $s1, $a0, $zero
/* A50BC 800B48BC 1800BFAF */  sw         $ra, 0x18($sp)
/* A50C0 800B48C0 4F007110 */  beq        $v1, $s1, .L800B4A00
/* A50C4 800B48C4 1000B0AF */   sw        $s0, 0x10($sp)
/* A50C8 800B48C8 D0FD828F */  lw         $v0, %gp_rel(UW_scalex)($gp)
/* A50CC 800B48CC 00000000 */  nop
/* A50D0 800B48D0 4C004010 */  beqz       $v0, .L800B4A04
/* A50D4 800B48D4 21102002 */   addu      $v0, $s1, $zero
/* A50D8 800B48D8 CCFD848F */  lw         $a0, %gp_rel(UW_angle)($gp)
/* A50DC 800B48DC D0E4010C */  jal        func_80079340
/* A50E0 800B48E0 21886000 */   addu      $s1, $v1, $zero
/* A50E4 800B48E4 CCFD848F */  lw         $a0, %gp_rel(UW_angle)($gp)
/* A50E8 800B48E8 DCE4010C */  jal        func_80079370
/* A50EC 800B48EC 21804000 */   addu      $s0, $v0, $zero
/* A50F0 800B48F0 21584000 */  addu       $t3, $v0, $zero
/* A50F4 800B48F4 21500000 */  addu       $t2, $zero, $zero
/* A50F8 800B48F8 21484001 */  addu       $t1, $t2, $zero
/* A50FC 800B48FC 2CA88D8F */  lw         $t5, %gp_rel(ScreenMorphArray)($gp)
/* A5100 800B4900 D0FD888F */  lw         $t0, %gp_rel(UW_scalex)($gp)
.L800B4904:
/* A5104 800B4904 21380000 */  addu       $a3, $zero, $zero
/* A5108 800B4908 21602001 */  addu       $t4, $t1, $zero
/* A510C 800B490C 2120EC00 */  addu       $a0, $a3, $t4
.L800B4910:
/* A5110 800B4910 C0200400 */  sll        $a0, $a0, 3
/* A5114 800B4914 2120A401 */  addu       $a0, $t5, $a0
/* A5118 800B4918 00008384 */  lh         $v1, 0x0($a0)
/* A511C 800B491C 00000000 */  nop
/* A5120 800B4920 00FF6324 */  addiu      $v1, $v1, -0x100
/* A5124 800B4924 18006B00 */  mult       $v1, $t3
/* A5128 800B4928 02008284 */  lh         $v0, 0x2($a0)
/* A512C 800B492C 12300000 */  mflo       $a2
/* A5130 800B4930 88FF4224 */  addiu      $v0, $v0, -0x78
/* A5134 800B4934 00000000 */  nop
/* A5138 800B4938 18005000 */  mult       $v0, $s0
/* A513C 800B493C 12780000 */  mflo       $t7
/* A5140 800B4940 00000000 */  nop
/* A5144 800B4944 00000000 */  nop
/* A5148 800B4948 18007000 */  mult       $v1, $s0
/* A514C 800B494C 12280000 */  mflo       $a1
/* A5150 800B4950 00000000 */  nop
/* A5154 800B4954 00000000 */  nop
/* A5158 800B4958 18004B00 */  mult       $v0, $t3
/* A515C 800B495C 12180000 */  mflo       $v1
/* A5160 800B4960 2310CF00 */  subu       $v0, $a2, $t7
/* A5164 800B4964 03130200 */  sra        $v0, $v0, 12
/* A5168 800B4968 18004800 */  mult       $v0, $t0
/* A516C 800B496C 12300000 */  mflo       $a2
/* A5170 800B4970 2110A300 */  addu       $v0, $a1, $v1
/* A5174 800B4974 03130200 */  sra        $v0, $v0, 12
/* A5178 800B4978 18004800 */  mult       $v0, $t0
/* A517C 800B497C 0100E724 */  addiu      $a3, $a3, 0x1
/* A5180 800B4980 03130600 */  sra        $v0, $a2, 12
/* A5184 800B4984 00014224 */  addiu      $v0, $v0, 0x100
/* A5188 800B4988 040082A4 */  sh         $v0, 0x4($a0)
/* A518C 800B498C 12180000 */  mflo       $v1
/* A5190 800B4990 03130300 */  sra        $v0, $v1, 12
/* A5194 800B4994 78004224 */  addiu      $v0, $v0, 0x78
/* A5198 800B4998 060082A4 */  sh         $v0, 0x6($a0)
/* A519C 800B499C 0300E228 */  slti       $v0, $a3, 0x3
/* A51A0 800B49A0 DBFF4014 */  bnez       $v0, .L800B4910
/* A51A4 800B49A4 2120EC00 */   addu      $a0, $a3, $t4
/* A51A8 800B49A8 01004A25 */  addiu      $t2, $t2, 0x1
/* A51AC 800B49AC 03004229 */  slti       $v0, $t2, 0x3
/* A51B0 800B49B0 D4FF4014 */  bnez       $v0, .L800B4904
/* A51B4 800B49B4 03002925 */   addiu     $t1, $t1, 0x3
/* A51B8 800B49B8 CCFD858F */  lw         $a1, %gp_rel(UW_angle)($gp)
/* A51BC 800B49BC D8FD838F */  lw         $v1, %gp_rel(UW_angleInc)($gp)
/* A51C0 800B49C0 D0FD828F */  lw         $v0, %gp_rel(UW_scalex)($gp)
/* A51C4 800B49C4 D4FD848F */  lw         $a0, %gp_rel(UW_scalexInc)($gp)
/* A51C8 800B49C8 2128A300 */  addu       $a1, $a1, $v1
/* A51CC 800B49CC 21104400 */  addu       $v0, $v0, $a0
/* A51D0 800B49D0 CCFD85AF */  sw         $a1, %gp_rel(UW_angle)($gp)
/* A51D4 800B49D4 D0FD82AF */  sw         $v0, %gp_rel(UW_scalex)($gp)
/* A51D8 800B49D8 02004104 */  bgez       $v0, .L800B49E4
/* A51DC 800B49DC FF0FA230 */   andi      $v0, $a1, 0xFFF
/* A51E0 800B49E0 D0FD80AF */  sw         $zero, %gp_rel(UW_scalex)($gp)
.L800B49E4:
/* A51E4 800B49E4 CCBD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x4)($gp)
/* A51E8 800B49E8 CCFD82AF */  sw         $v0, %gp_rel(UW_angle)($gp)
/* A51EC 800B49EC 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* A51F0 800B49F0 0100A538 */  xori       $a1, $a1, 0x1
/* A51F4 800B49F4 0400448C */  lw         $a0, 0x4($v0)
/* A51F8 800B49F8 F7D2020C */  jal        UNDERWORLD_DisplayFrame
/* A51FC 800B49FC 002A0500 */   sll       $a1, $a1, 8
.L800B4A00:
/* A5200 800B4A00 21102002 */  addu       $v0, $s1, $zero
.L800B4A04:
/* A5204 800B4A04 1800BF8F */  lw         $ra, 0x18($sp)
/* A5208 800B4A08 1400B18F */  lw         $s1, 0x14($sp)
/* A520C 800B4A0C 1000B08F */  lw         $s0, 0x10($sp)
/* A5210 800B4A10 0800E003 */  jr         $ra
/* A5214 800B4A14 2000BD27 */   addiu     $sp, $sp, 0x20
.size UNDERWORLD_RotateScreenStep, . - UNDERWORLD_RotateScreenStep
