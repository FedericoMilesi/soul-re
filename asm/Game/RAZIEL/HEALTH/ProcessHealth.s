.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessHealth
/* 95060 800A4860 34FA838F */  lw         $v1, %gp_rel(Raziel + 0x404)($gp)
/* 95064 800A4864 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95068 800A4868 1800B0AF */  sw         $s0, 0x18($sp)
/* 9506C 800A486C 21808000 */  addu       $s0, $a0, $zero
/* 95070 800A4870 06006014 */  bnez       $v1, .L800A488C
/* 95074 800A4874 1C00BFAF */   sw        $ra, 0x1C($sp)
/* 95078 800A4878 E0FB828F */  lw         $v0, %gp_rel(Raziel + 0x5B0)($gp)
/* 9507C 800A487C 00000000 */  nop
/* 95080 800A4880 00104230 */  andi       $v0, $v0, 0x1000
/* 95084 800A4884 1B004014 */  bnez       $v0, .L800A48F4
/* 95088 800A4888 00000000 */   nop
.L800A488C:
/* 9508C 800A488C 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 95090 800A4890 00000000 */  nop
/* 95094 800A4894 23106200 */  subu       $v0, $v1, $v0
/* 95098 800A4898 34FA82AF */  sw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* 9509C 800A489C 02004104 */  bgez       $v0, .L800A48A8
/* 950A0 800A48A0 00000000 */   nop
/* 950A4 800A48A4 34FA80AF */  sw         $zero, %gp_rel(Raziel + 0x404)($gp)
.L800A48A8:
/* 950A8 800A48A8 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 950AC 800A48AC 01000224 */  addiu      $v0, $zero, 0x1
/* 950B0 800A48B0 0D016214 */  bne        $v1, $v0, .L800A4CE8
/* 950B4 800A48B4 21200000 */   addu      $a0, $zero, $zero
/* 950B8 800A48B8 FEFF023C */  lui        $v0, (0xFFFE7960 >> 16)
/* 950BC 800A48BC 60794234 */  ori        $v0, $v0, (0xFFFE7960 & 0xFFFF)
/* 950C0 800A48C0 2CFA858F */  lw         $a1, %gp_rel(Raziel + 0x3FC)($gp)
/* 950C4 800A48C4 28FA8487 */  lh         $a0, %gp_rel(Raziel + 0x3F8)($gp)
/* 950C8 800A48C8 2128A200 */  addu       $a1, $a1, $v0
/* 950CC 800A48CC 40300400 */  sll        $a2, $a0, 1
/* 950D0 800A48D0 2130C400 */  addu       $a2, $a2, $a0
/* 950D4 800A48D4 80110600 */  sll        $v0, $a2, 6
/* 950D8 800A48D8 2130C200 */  addu       $a2, $a2, $v0
/* 950DC 800A48DC 80300600 */  sll        $a2, $a2, 2
/* 950E0 800A48E0 2130C400 */  addu       $a2, $a2, $a0
/* 950E4 800A48E4 80300600 */  sll        $a2, $a2, 2
/* 950E8 800A48E8 2130C400 */  addu       $a2, $a2, $a0
/* 950EC 800A48EC 3D930208 */  j          .L800A4CF4
/* 950F0 800A48F0 40310600 */   sll       $a2, $a2, 5
.L800A48F4:
/* 950F4 800A48F4 0492020C */  jal        GetMaxHealth
/* 950F8 800A48F8 00000000 */   nop
/* 950FC 800A48FC 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 95100 800A4900 00000000 */  nop
/* 95104 800A4904 05006210 */  beq        $v1, $v0, .L800A491C
/* 95108 800A4908 02000224 */   addiu     $v0, $zero, 0x2
/* 9510C 800A490C 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 95110 800A4910 00000000 */  nop
/* 95114 800A4914 05006214 */  bne        $v1, $v0, .L800A492C
/* 95118 800A4918 00000000 */   nop
.L800A491C:
/* 9511C 800A491C 8597020C */  jal        razReaverOn
/* 95120 800A4920 00000000 */   nop
/* 95124 800A4924 4D920208 */  j          .L800A4934
/* 95128 800A4928 00000000 */   nop
.L800A492C:
/* 9512C 800A492C 6397020C */  jal        razReaverOff
/* 95130 800A4930 00000000 */   nop
.L800A4934:
/* 95134 800A4934 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 95138 800A4938 01000224 */  addiu      $v0, $zero, 0x1
/* 9513C 800A493C 86006214 */  bne        $v1, $v0, .L800A4B58
/* 95140 800A4940 00000000 */   nop
/* 95144 800A4944 2801028E */  lw         $v0, 0x128($s0)
/* 95148 800A4948 00000000 */  nop
/* 9514C 800A494C 08004010 */  beqz       $v0, .L800A4970
/* 95150 800A4950 00000000 */   nop
/* 95154 800A4954 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 95158 800A4958 00000000 */  nop
/* 9515C 800A495C 10004230 */  andi       $v0, $v0, 0x10
/* 95160 800A4960 03004014 */  bnez       $v0, .L800A4970
/* 95164 800A4964 00000000 */   nop
/* 95168 800A4968 B291020C */  jal        DrainHealth
/* 9516C 800A496C 00A00434 */   ori       $a0, $zero, 0xA000
.L800A4970:
/* 95170 800A4970 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 95174 800A4974 00000000 */  nop
/* 95178 800A4978 07004010 */  beqz       $v0, .L800A4998
/* 9517C 800A497C 00000000 */   nop
/* 95180 800A4980 0492020C */  jal        GetMaxHealth
/* 95184 800A4984 00000000 */   nop
/* 95188 800A4988 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 9518C 800A498C 00000000 */  nop
/* 95190 800A4990 10006210 */  beq        $v1, $v0, .L800A49D4
/* 95194 800A4994 0100023C */   lui       $v0, (0x1869F >> 16)
.L800A4998:
/* 95198 800A4998 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 9519C 800A499C 00000000 */  nop
/* 951A0 800A49A0 30004384 */  lh         $v1, 0x30($v0)
/* 951A4 800A49A4 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 951A8 800A49A8 00000000 */  nop
/* 951AC 800A49AC 18006200 */  mult       $v1, $v0
/* 951B0 800A49B0 12180000 */  mflo       $v1
/* 951B4 800A49B4 02006104 */  bgez       $v1, .L800A49C0
/* 951B8 800A49B8 00000000 */   nop
/* 951BC 800A49BC FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L800A49C0:
/* 951C0 800A49C0 2CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 951C4 800A49C4 031B0300 */  sra        $v1, $v1, 12
/* 951C8 800A49C8 21104300 */  addu       $v0, $v0, $v1
/* 951CC 800A49CC 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 951D0 800A49D0 0100023C */  lui        $v0, (0x1869F >> 16)
.L800A49D4:
/* 951D4 800A49D4 2CFA848F */  lw         $a0, %gp_rel(Raziel + 0x3FC)($gp)
/* 951D8 800A49D8 9F864234 */  ori        $v0, $v0, (0x1869F & 0xFFFF)
/* 951DC 800A49DC 2A104400 */  slt        $v0, $v0, $a0
/* 951E0 800A49E0 15004014 */  bnez       $v0, .L800A4A38
/* 951E4 800A49E4 0200023C */   lui       $v0, (0x249EF >> 16)
/* 951E8 800A49E8 8895020C */  jal        razPlaneShift
/* 951EC 800A49EC 21200002 */   addu      $a0, $s0, $zero
/* 951F0 800A49F0 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 951F4 800A49F4 00000000 */  nop
/* 951F8 800A49F8 36004384 */  lh         $v1, 0x36($v0)
/* 951FC 800A49FC 00000000 */  nop
/* 95200 800A4A00 00110300 */  sll        $v0, $v1, 4
/* 95204 800A4A04 23104300 */  subu       $v0, $v0, $v1
/* 95208 800A4A08 40130200 */  sll        $v0, $v0, 13
/* 9520C 800A4A0C 34FA82AF */  sw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* 95210 800A4A10 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 95214 800A4A14 0400033C */  lui        $v1, (0x40000 >> 16)
/* 95218 800A4A18 24104300 */  and        $v0, $v0, $v1
/* 9521C 800A4A1C 40004010 */  beqz       $v0, .L800A4B20
/* 95220 800A4A20 FEFF023C */   lui       $v0, (0xFFFE7960 >> 16)
/* 95224 800A4A24 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 95228 800A4A28 F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 9522C 800A4A2C 21280002 */   addu      $a1, $s0, $zero
/* 95230 800A4A30 C8920208 */  j          .L800A4B20
/* 95234 800A4A34 FEFF023C */   lui       $v0, (0xFFFE7960 >> 16)
.L800A4A38:
/* 95238 800A4A38 EF494234 */  ori        $v0, $v0, (0x249EF & 0xFFFF)
/* 9523C 800A4A3C 2A104400 */  slt        $v0, $v0, $a0
/* 95240 800A4A40 37004014 */  bnez       $v0, .L800A4B20
/* 95244 800A4A44 FEFF023C */   lui       $v0, (0xFFFE7960 >> 16)
/* 95248 800A4A48 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 9524C 800A4A4C 00000000 */  nop
/* 95250 800A4A50 40110300 */  sll        $v0, $v1, 5
/* 95254 800A4A54 23104300 */  subu       $v0, $v0, $v1
/* 95258 800A4A58 80100200 */  sll        $v0, $v0, 2
/* 9525C 800A4A5C 21104300 */  addu       $v0, $v0, $v1
/* 95260 800A4A60 C0180200 */  sll        $v1, $v0, 3
/* 95264 800A4A64 02006104 */  bgez       $v1, .L800A4A70
/* 95268 800A4A68 00000000 */   nop
/* 9526C 800A4A6C FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L800A4A70:
/* 95270 800A4A70 30FA828F */  lw         $v0, %gp_rel(Raziel + 0x400)($gp)
/* 95274 800A4A74 031B0300 */  sra        $v1, $v1, 12
/* 95278 800A4A78 23104300 */  subu       $v0, $v0, $v1
/* 9527C 800A4A7C 30FA82AF */  sw         $v0, %gp_rel(Raziel + 0x400)($gp)
/* 95280 800A4A80 27004104 */  bgez       $v0, .L800A4B20
/* 95284 800A4A84 FEFF023C */   lui       $v0, (0xFFFE7960 >> 16)
/* 95288 800A4A88 60794234 */  ori        $v0, $v0, (0xFFFE7960 & 0xFFFF)
/* 9528C 800A4A8C 21108200 */  addu       $v0, $a0, $v0
/* 95290 800A4A90 30FA82AF */  sw         $v0, %gp_rel(Raziel + 0x400)($gp)
/* 95294 800A4A94 3E494228 */  slti       $v0, $v0, 0x493E
/* 95298 800A4A98 02004010 */  beqz       $v0, .L800A4AA4
/* 9529C 800A4A9C 3E490224 */   addiu     $v0, $zero, 0x493E
/* 952A0 800A4AA0 30FA82AF */  sw         $v0, %gp_rel(Raziel + 0x400)($gp)
.L800A4AA4:
/* 952A4 800A4AA4 1B43043C */  lui        $a0, (0x431BDE83 >> 16)
/* 952A8 800A4AA8 83DE8434 */  ori        $a0, $a0, (0x431BDE83 & 0xFFFF)
/* 952AC 800A4AAC 30FA838F */  lw         $v1, %gp_rel(Raziel + 0x400)($gp)
/* 952B0 800A4AB0 50C30234 */  ori        $v0, $zero, 0xC350
/* 952B4 800A4AB4 23104300 */  subu       $v0, $v0, $v1
/* 952B8 800A4AB8 80180200 */  sll        $v1, $v0, 2
/* 952BC 800A4ABC 21186200 */  addu       $v1, $v1, $v0
/* 952C0 800A4AC0 00110300 */  sll        $v0, $v1, 4
/* 952C4 800A4AC4 23104300 */  subu       $v0, $v0, $v1
/* 952C8 800A4AC8 80100200 */  sll        $v0, $v0, 2
/* 952CC 800A4ACC 18004400 */  mult       $v0, $a0
/* 952D0 800A4AD0 21300000 */  addu       $a2, $zero, $zero
/* 952D4 800A4AD4 2138C000 */  addu       $a3, $a2, $zero
/* 952D8 800A4AD8 1000A0AF */  sw         $zero, 0x10($sp)
/* 952DC 800A4ADC 21200002 */  addu       $a0, $s0, $zero
/* 952E0 800A4AE0 C3170200 */  sra        $v0, $v0, 31
/* 952E4 800A4AE4 10400000 */  mfhi       $t0
/* 952E8 800A4AE8 432B0800 */  sra        $a1, $t0, 13
/* 952EC 800A4AEC 2328A200 */  subu       $a1, $a1, $v0
/* 952F0 800A4AF0 EE020224 */  addiu      $v0, $zero, 0x2EE
/* 952F4 800A4AF4 EA2B010C */  jal        FX_DoInstancePowerRing
/* 952F8 800A4AF8 23284500 */   subu      $a1, $v0, $a1
/* 952FC 800A4AFC 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 95300 800A4B00 00000000 */  nop
/* 95304 800A4B04 80004230 */  andi       $v0, $v0, 0x80
/* 95308 800A4B08 05004014 */  bnez       $v0, .L800A4B20
/* 9530C 800A4B0C FEFF023C */   lui       $v0, (0xFFFE7960 >> 16)
/* 95310 800A4B10 80000424 */  addiu      $a0, $zero, 0x80
/* 95314 800A4B14 F9C5000C */  jal        GAMEPAD_Shock1
/* 95318 800A4B18 00500524 */   addiu     $a1, $zero, 0x5000
/* 9531C 800A4B1C FEFF023C */  lui        $v0, (0xFFFE7960 >> 16)
.L800A4B20:
/* 95320 800A4B20 60794234 */  ori        $v0, $v0, (0xFFFE7960 & 0xFFFF)
/* 95324 800A4B24 2CFA858F */  lw         $a1, %gp_rel(Raziel + 0x3FC)($gp)
/* 95328 800A4B28 28FA8487 */  lh         $a0, %gp_rel(Raziel + 0x3F8)($gp)
/* 9532C 800A4B2C 2128A200 */  addu       $a1, $a1, $v0
/* 95330 800A4B30 40300400 */  sll        $a2, $a0, 1
/* 95334 800A4B34 2130C400 */  addu       $a2, $a2, $a0
/* 95338 800A4B38 80110600 */  sll        $v0, $a2, 6
/* 9533C 800A4B3C 2130C200 */  addu       $a2, $a2, $v0
/* 95340 800A4B40 80300600 */  sll        $a2, $a2, 2
/* 95344 800A4B44 2130C400 */  addu       $a2, $a2, $a0
/* 95348 800A4B48 80300600 */  sll        $a2, $a2, 2
/* 9534C 800A4B4C 2130C400 */  addu       $a2, $a2, $a0
/* 95350 800A4B50 3D930208 */  j          .L800A4CF4
/* 95354 800A4B54 40310600 */   sll       $a2, $a2, 5
.L800A4B58:
/* 95358 800A4B58 2CFA848F */  lw         $a0, %gp_rel(Raziel + 0x3FC)($gp)
/* 9535C 800A4B5C 00000000 */  nop
/* 95360 800A4B60 0E028228 */  slti       $v0, $a0, 0x20E
/* 95364 800A4B64 0E004010 */  beqz       $v0, .L800A4BA0
/* 95368 800A4B68 0100023C */   lui       $v0, (0x1869F >> 16)
/* 9536C 800A4B6C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 95370 800A4B70 00000000 */  nop
/* 95374 800A4B74 32004384 */  lh         $v1, 0x32($v0)
/* 95378 800A4B78 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 9537C 800A4B7C 00000000 */  nop
/* 95380 800A4B80 18006200 */  mult       $v1, $v0
/* 95384 800A4B84 12100000 */  mflo       $v0
/* 95388 800A4B88 02004104 */  bgez       $v0, .L800A4B94
/* 9538C 800A4B8C 00000000 */   nop
/* 95390 800A4B90 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800A4B94:
/* 95394 800A4B94 03130200 */  sra        $v0, $v0, 12
/* 95398 800A4B98 FA920208 */  j          .L800A4BE8
/* 9539C 800A4B9C 23108200 */   subu      $v0, $a0, $v0
.L800A4BA0:
/* 953A0 800A4BA0 9F864234 */  ori        $v0, $v0, (0x1869F & 0xFFFF)
/* 953A4 800A4BA4 2A104400 */  slt        $v0, $v0, $a0
/* 953A8 800A4BA8 0E004014 */  bnez       $v0, .L800A4BE4
/* 953AC 800A4BAC 0100023C */   lui       $v0, (0x186A0 >> 16)
/* 953B0 800A4BB0 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 953B4 800A4BB4 00000000 */  nop
/* 953B8 800A4BB8 32004384 */  lh         $v1, 0x32($v0)
/* 953BC 800A4BBC 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 953C0 800A4BC0 00000000 */  nop
/* 953C4 800A4BC4 18006200 */  mult       $v1, $v0
/* 953C8 800A4BC8 12100000 */  mflo       $v0
/* 953CC 800A4BCC 02004104 */  bgez       $v0, .L800A4BD8
/* 953D0 800A4BD0 00000000 */   nop
/* 953D4 800A4BD4 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800A4BD8:
/* 953D8 800A4BD8 03130200 */  sra        $v0, $v0, 12
/* 953DC 800A4BDC FA920208 */  j          .L800A4BE8
/* 953E0 800A4BE0 21108200 */   addu      $v0, $a0, $v0
.L800A4BE4:
/* 953E4 800A4BE4 A0864234 */  ori        $v0, $v0, (0x186A0 & 0xFFFF)
.L800A4BE8:
/* 953E8 800A4BE8 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 953EC 800A4BEC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 953F0 800A4BF0 8000033C */  lui        $v1, (0x800000 >> 16)
/* 953F4 800A4BF4 24104300 */  and        $v0, $v0, $v1
/* 953F8 800A4BF8 1D004014 */  bnez       $v0, .L800A4C70
/* 953FC 800A4BFC 00000000 */   nop
/* 95400 800A4C00 2CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95404 800A4C04 00000000 */  nop
/* 95408 800A4C08 0D024228 */  slti       $v0, $v0, 0x20D
/* 9540C 800A4C0C 18004010 */  beqz       $v0, .L800A4C70
/* 95410 800A4C10 21200000 */   addu      $a0, $zero, $zero
/* 95414 800A4C14 21288000 */  addu       $a1, $a0, $zero
/* 95418 800A4C18 4FC6010C */  jal        SetControlInitIdleData
/* 9541C 800A4C1C 03000624 */   addiu     $a2, $zero, 0x3
/* 95420 800A4C20 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* 95424 800A4C24 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 95428 800A4C28 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9542C 800A4C2C F4CA010C */  jal        StateSwitchStateCharacterData
/* 95430 800A4C30 21304000 */   addu      $a2, $v0, $zero
/* 95434 800A4C34 2CFA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x3FC)
/* 95438 800A4C38 08FC8424 */  addiu      $a0, $a0, -0x3F8
/* 9543C 800A4C3C D6000524 */  addiu      $a1, $zero, 0xD6
/* 95440 800A4C40 21300000 */  addu       $a2, $zero, $zero
/* 95444 800A4C44 03000724 */  addiu      $a3, $zero, 0x3
/* 95448 800A4C48 01000224 */  addiu      $v0, $zero, 0x1
/* 9544C 800A4C4C FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 95450 800A4C50 1000A2AF */   sw        $v0, 0x10($sp)
/* 95454 800A4C54 8000043C */  lui        $a0, (0x804000 >> 16)
/* 95458 800A4C58 00408434 */  ori        $a0, $a0, (0x804000 & 0xFFFF)
/* 9545C 800A4C5C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 95460 800A4C60 0D020324 */  addiu      $v1, $zero, 0x20D
/* 95464 800A4C64 2CFA83AF */  sw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 95468 800A4C68 25104400 */  or         $v0, $v0, $a0
/* 9546C 800A4C6C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800A4C70:
/* 95470 800A4C70 2CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95474 800A4C74 00000000 */  nop
/* 95478 800A4C78 1B004104 */  bgez       $v0, .L800A4CE8
/* 9547C 800A4C7C 21200000 */   addu      $a0, $zero, $zero
/* 95480 800A4C80 C0FC828F */  lw         $v0, %gp_rel(gameTracker)($gp)
/* 95484 800A4C84 00000000 */  nop
/* 95488 800A4C88 4401438C */  lw         $v1, 0x144($v0)
/* 9548C 800A4C8C 0800043C */  lui        $a0, (0x80000 >> 16)
/* 95490 800A4C90 25186400 */  or         $v1, $v1, $a0
/* 95494 800A4C94 440143AC */  sw         $v1, 0x144($v0)
/* 95498 800A4C98 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 9549C 800A4C9C 00000000 */  nop
/* 954A0 800A4CA0 04008010 */  beqz       $a0, .L800A4CB4
/* 954A4 800A4CA4 8000053C */   lui       $a1, (0x800105 >> 16)
/* 954A8 800A4CA8 0501A534 */  ori        $a1, $a1, (0x800105 & 0xFFFF)
/* 954AC 800A4CAC A1D1000C */  jal        INSTANCE_Post
/* 954B0 800A4CB0 21300000 */   addu      $a2, $zero, $zero
.L800A4CB4:
/* 954B4 800A4CB4 C89E020C */  jal        razSetPlayerEventHistory
/* 954B8 800A4CB8 00800434 */   ori       $a0, $zero, 0x8000
/* 954BC 800A4CBC F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 954C0 800A4CC0 50C30234 */  ori        $v0, $zero, 0xC350
/* 954C4 800A4CC4 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 954C8 800A4CC8 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 954CC 800A4CCC 01000324 */  addiu      $v1, $zero, 0x1
/* 954D0 800A4CD0 D2BD83A7 */  sh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 954D4 800A4CD4 00804234 */  ori        $v0, $v0, 0x8000
/* 954D8 800A4CD8 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 954DC 800A4CDC D493020C */  jal        razPlayUnderworldSounds
/* 954E0 800A4CE0 00000000 */   nop
/* 954E4 800A4CE4 21200000 */  addu       $a0, $zero, $zero
.L800A4CE8:
/* 954E8 800A4CE8 2CFA858F */  lw         $a1, %gp_rel(Raziel + 0x3FC)($gp)
/* 954EC 800A4CEC 0100063C */  lui        $a2, (0x186A0 >> 16)
/* 954F0 800A4CF0 A086C634 */  ori        $a2, $a2, (0x186A0 & 0xFFFF)
.L800A4CF4:
/* 954F4 800A4CF4 F537010C */  jal        FX_Health_Spiral
/* 954F8 800A4CF8 00000000 */   nop
/* 954FC 800A4CFC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 95500 800A4D00 1800B08F */  lw         $s0, 0x18($sp)
/* 95504 800A4D04 0800E003 */  jr         $ra
/* 95508 800A4D08 2000BD27 */   addiu     $sp, $sp, 0x20
.size ProcessHealth, . - ProcessHealth
