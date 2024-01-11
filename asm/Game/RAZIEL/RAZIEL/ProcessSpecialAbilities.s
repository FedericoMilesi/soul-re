.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessSpecialAbilities
/* A38D4 800B30D4 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* A38D8 800B30D8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A38DC 800B30DC 1400B1AF */  sw         $s1, 0x14($sp)
/* A38E0 800B30E0 21888000 */  addu       $s1, $a0, $zero
/* A38E4 800B30E4 1800BFAF */  sw         $ra, 0x18($sp)
/* A38E8 800B30E8 08004230 */  andi       $v0, $v0, 0x8
/* A38EC 800B30EC 55004010 */  beqz       $v0, .L800B3244
/* A38F0 800B30F0 1000B0AF */   sw        $s0, 0x10($sp)
/* A38F4 800B30F4 5CAB858F */  lw         $a1, %gp_rel(debugRazielFlags2)($gp)
/* A38F8 800B30F8 00000000 */  nop
/* A38FC 800B30FC 0D00A010 */  beqz       $a1, .L800B3134
/* A3900 800B3100 01000324 */   addiu     $v1, $zero, 0x1
/* A3904 800B3104 64FA828F */  lw         $v0, %gp_rel(Raziel + 0x434)($gp)
/* A3908 800B3108 00000000 */  nop
/* A390C 800B310C 09004224 */  addiu      $v0, $v0, 0x9
/* A3910 800B3110 04204300 */  sllv       $a0, $v1, $v0
/* A3914 800B3114 03008510 */  beq        $a0, $a1, .L800B3124
/* A3918 800B3118 27100400 */   nor       $v0, $zero, $a0
/* A391C 800B311C 2420A200 */  and        $a0, $a1, $v0
/* A3920 800B3120 5CAB84AF */  sw         $a0, %gp_rel(debugRazielFlags2)($gp)
.L800B3124:
/* A3924 800B3124 FD97020C */  jal        razGetReaverFromMask
/* A3928 800B3128 00000000 */   nop
/* A392C 800B312C 56CC0208 */  j          .L800B3158
/* A3930 800B3130 21804000 */   addu      $s0, $v0, $zero
.L800B3134:
/* A3934 800B3134 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* A3938 800B3138 01000224 */  addiu      $v0, $zero, 0x1
/* A393C 800B313C 04006214 */  bne        $v1, $v0, .L800B3150
/* A3940 800B3140 01001024 */   addiu     $s0, $zero, 0x1
/* A3944 800B3144 02001024 */  addiu      $s0, $zero, 0x2
/* A3948 800B3148 55CC0208 */  j          .L800B3154
/* A394C 800B314C 00080224 */   addiu     $v0, $zero, 0x800
.L800B3150:
/* A3950 800B3150 00040224 */  addiu      $v0, $zero, 0x400
.L800B3154:
/* A3954 800B3154 5CAB82AF */  sw         $v0, %gp_rel(debugRazielFlags2)($gp)
.L800B3158:
/* A3958 800B3158 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* A395C 800B315C 00000000 */  nop
/* A3960 800B3160 0E008014 */  bnez       $a0, .L800B319C
/* A3964 800B3164 0D80023C */   lui       $v0, %hi(objectAccess + 0xB4)
/* A3968 800B3168 F0A2458C */  lw         $a1, %lo(objectAccess + 0xB4)($v0)
/* A396C 800B316C 00000000 */  nop
/* A3970 800B3170 4100A010 */  beqz       $a1, .L800B3278
/* A3974 800B3174 21202002 */   addu      $a0, $s1, $zero
/* A3978 800B3178 ACCF000C */  jal        INSTANCE_BirthObject
/* A397C 800B317C 21300000 */   addu      $a2, $zero, $zero
/* A3980 800B3180 21202002 */  addu       $a0, $s1, $zero
/* A3984 800B3184 BE97020C */  jal        razReaverPickup
/* A3988 800B3188 21284000 */   addu      $a1, $v0, $zero
/* A398C 800B318C B493020C */  jal        RAZIEL_DebugHealthFillUp
/* A3990 800B3190 00000000 */   nop
/* A3994 800B3194 9ECC0208 */  j          .L800B3278
/* A3998 800B3198 00000000 */   nop
.L800B319C:
/* A399C 800B319C 64FA828F */  lw         $v0, %gp_rel(Raziel + 0x434)($gp)
/* A39A0 800B31A0 00000000 */  nop
/* A39A4 800B31A4 07005010 */  beq        $v0, $s0, .L800B31C4
/* A39A8 800B31A8 8000053C */   lui       $a1, (0x800103 >> 16)
/* A39AC 800B31AC 0301A534 */  ori        $a1, $a1, (0x800103 & 0xFFFF)
/* A39B0 800B31B0 A1D1000C */  jal        INSTANCE_Post
/* A39B4 800B31B4 21300002 */   addu      $a2, $s0, $zero
/* A39B8 800B31B8 64FA90AF */  sw         $s0, %gp_rel(Raziel + 0x434)($gp)
/* A39BC 800B31BC 9ECC0208 */  j          .L800B3278
/* A39C0 800B31C0 00000000 */   nop
.L800B31C4:
/* A39C4 800B31C4 06000224 */  addiu      $v0, $zero, 0x6
/* A39C8 800B31C8 2B000216 */  bne        $s0, $v0, .L800B3278
/* A39CC 800B31CC 00000000 */   nop
/* A39D0 800B31D0 3800248E */  lw         $a0, 0x38($s1)
/* A39D4 800B31D4 1C66010C */  jal        STREAM_GetLevelWithID
/* A39D8 800B31D8 00000000 */   nop
/* A39DC 800B31DC 2801238E */  lw         $v1, 0x128($s1)
/* A39E0 800B31E0 00000000 */  nop
/* A39E4 800B31E4 09006010 */  beqz       $v1, .L800B320C
/* A39E8 800B31E8 21284000 */   addu      $a1, $v0, $zero
/* A39EC 800B31EC 4000228E */  lw         $v0, 0x40($s1)
/* A39F0 800B31F0 00000000 */  nop
/* A39F4 800B31F4 20004010 */  beqz       $v0, .L800B3278
/* A39F8 800B31F8 00000000 */   nop
/* A39FC 800B31FC 44012386 */  lh         $v1, 0x144($s1)
/* A3A00 800B3200 3C05428C */  lw         $v0, 0x53C($v0)
/* A3A04 800B3204 8BCC0208 */  j          .L800B322C
/* A3A08 800B3208 2A104300 */   slt       $v0, $v0, $v1
.L800B320C:
/* A3A0C 800B320C 4000248E */  lw         $a0, 0x40($s1)
/* A3A10 800B3210 00000000 */  nop
/* A3A14 800B3214 18008010 */  beqz       $a0, .L800B3278
/* A3A18 800B3218 00000000 */   nop
/* A3A1C 800B321C 3C05828C */  lw         $v0, 0x53C($a0)
/* A3A20 800B3220 3800A38C */  lw         $v1, 0x38($a1)
/* A3A24 800B3224 00000000 */  nop
/* A3A28 800B3228 2A104300 */  slt        $v0, $v0, $v1
.L800B322C:
/* A3A2C 800B322C 12004010 */  beqz       $v0, .L800B3278
/* A3A30 800B3230 00000000 */   nop
/* A3A34 800B3234 ED97020C */  jal        razReaverImbue
/* A3A38 800B3238 02000424 */   addiu     $a0, $zero, 0x2
/* A3A3C 800B323C 9ECC0208 */  j          .L800B3278
/* A3A40 800B3240 00000000 */   nop
.L800B3244:
/* A3A44 800B3244 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* A3A48 800B3248 00000000 */  nop
/* A3A4C 800B324C 0A008010 */  beqz       $a0, .L800B3278
/* A3A50 800B3250 00000000 */   nop
/* A3A54 800B3254 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* A3A58 800B3258 00000000 */   nop
/* A3A5C 800B325C 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* A3A60 800B3260 85D1000C */  jal        INSTANCE_KillInstance
/* A3A64 800B3264 00000000 */   nop
/* A3A68 800B3268 60FA80AF */  sw         $zero, %gp_rel(Raziel + 0x430)($gp)
/* A3A6C 800B326C 64FA80AF */  sw         $zero, %gp_rel(Raziel + 0x434)($gp)
/* A3A70 800B3270 5CAB80AF */  sw         $zero, %gp_rel(debugRazielFlags2)($gp)
/* A3A74 800B3274 1CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x3EC)($gp)
.L800B3278:
/* A3A78 800B3278 1800BF8F */  lw         $ra, 0x18($sp)
/* A3A7C 800B327C 1400B18F */  lw         $s1, 0x14($sp)
/* A3A80 800B3280 1000B08F */  lw         $s0, 0x10($sp)
/* A3A84 800B3284 0800E003 */  jr         $ra
/* A3A88 800B3288 2000BD27 */   addiu     $sp, $sp, 0x20
.size ProcessSpecialAbilities, . - ProcessSpecialAbilities
