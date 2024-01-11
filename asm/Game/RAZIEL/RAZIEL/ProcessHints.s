.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessHints
/* A30E8 800B28E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A30EC 800B28EC 1400BFAF */  sw         $ra, 0x14($sp)
/* A30F0 800B28F0 8D83010C */  jal        HINT_GetCurrentHint
/* A30F4 800B28F4 1000B0AF */   sw        $s0, 0x10($sp)
/* A30F8 800B28F8 E0FB838F */  lw         $v1, %gp_rel(Raziel + 0x5B0)($gp)
/* A30FC 800B28FC 00000000 */  nop
/* A3100 800B2900 00206330 */  andi       $v1, $v1, 0x2000
/* A3104 800B2904 25006014 */  bnez       $v1, .L800B299C
/* A3108 800B2908 21804000 */   addu      $s0, $v0, $zero
/* A310C 800B290C DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* A3110 800B2910 00000000 */  nop
/* A3114 800B2914 00204230 */  andi       $v0, $v0, 0x2000
/* A3118 800B2918 1E004010 */  beqz       $v0, .L800B2994
/* A311C 800B291C FFFF0224 */   addiu     $v0, $zero, -0x1
/* A3120 800B2920 04000216 */  bne        $s0, $v0, .L800B2934
/* A3124 800B2924 0C000224 */   addiu     $v0, $zero, 0xC
/* A3128 800B2928 5583010C */  jal        HINT_StartHint
/* A312C 800B292C 0C000424 */   addiu     $a0, $zero, 0xC
/* A3130 800B2930 0C000224 */  addiu      $v0, $zero, 0xC
.L800B2934:
/* A3134 800B2934 0B000216 */  bne        $s0, $v0, .L800B2964
/* A3138 800B2938 28000224 */   addiu     $v0, $zero, 0x28
/* A313C 800B293C 3CF6838F */  lw         $v1, %gp_rel(Raziel + 0xC)($gp)
/* A3140 800B2940 0B80023C */  lui        $v0, %hi(StateHandlerGlyphs)
/* A3144 800B2944 50F64224 */  addiu      $v0, $v0, %lo(StateHandlerGlyphs)
/* A3148 800B2948 06006214 */  bne        $v1, $v0, .L800B2964
/* A314C 800B294C 28000224 */   addiu     $v0, $zero, 0x28
/* A3150 800B2950 8183010C */  jal        HINT_KillSpecificHint
/* A3154 800B2954 0C000424 */   addiu     $a0, $zero, 0xC
/* A3158 800B2958 5583010C */  jal        HINT_StartHint
/* A315C 800B295C 28000424 */   addiu     $a0, $zero, 0x28
/* A3160 800B2960 28000224 */  addiu      $v0, $zero, 0x28
.L800B2964:
/* A3164 800B2964 15000216 */  bne        $s0, $v0, .L800B29BC
/* A3168 800B2968 0B80023C */   lui       $v0, %hi(StateHandlerGlyphs)
/* A316C 800B296C 3CF6838F */  lw         $v1, %gp_rel(Raziel + 0xC)($gp)
/* A3170 800B2970 50F64224 */  addiu      $v0, $v0, %lo(StateHandlerGlyphs)
/* A3174 800B2974 11006210 */  beq        $v1, $v0, .L800B29BC
/* A3178 800B2978 00000000 */   nop
/* A317C 800B297C 8183010C */  jal        HINT_KillSpecificHint
/* A3180 800B2980 28000424 */   addiu     $a0, $zero, 0x28
/* A3184 800B2984 5583010C */  jal        HINT_StartHint
/* A3188 800B2988 0C000424 */   addiu     $a0, $zero, 0xC
/* A318C 800B298C 6FCA0208 */  j          .L800B29BC
/* A3190 800B2990 00000000 */   nop
.L800B2994:
/* A3194 800B2994 6BCA0208 */  j          .L800B29AC
/* A3198 800B2998 0C000224 */   addiu     $v0, $zero, 0xC
.L800B299C:
/* A319C 800B299C 0C000224 */  addiu      $v0, $zero, 0xC
/* A31A0 800B29A0 04000212 */  beq        $s0, $v0, .L800B29B4
/* A31A4 800B29A4 00000000 */   nop
/* A31A8 800B29A8 28000224 */  addiu      $v0, $zero, 0x28
.L800B29AC:
/* A31AC 800B29AC 03000216 */  bne        $s0, $v0, .L800B29BC
/* A31B0 800B29B0 00000000 */   nop
.L800B29B4:
/* A31B4 800B29B4 8183010C */  jal        HINT_KillSpecificHint
/* A31B8 800B29B8 21204000 */   addu      $a0, $v0, $zero
.L800B29BC:
/* A31BC 800B29BC E0FB828F */  lw         $v0, %gp_rel(Raziel + 0x5B0)($gp)
/* A31C0 800B29C0 0100033C */  lui        $v1, (0x10000 >> 16)
/* A31C4 800B29C4 24104300 */  and        $v0, $v0, $v1
/* A31C8 800B29C8 11004014 */  bnez       $v0, .L800B2A10
/* A31CC 800B29CC 00000000 */   nop
/* A31D0 800B29D0 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* A31D4 800B29D4 00000000 */  nop
/* A31D8 800B29D8 24104300 */  and        $v0, $v0, $v1
/* A31DC 800B29DC 07004010 */  beqz       $v0, .L800B29FC
/* A31E0 800B29E0 FFFF0224 */   addiu     $v0, $zero, -0x1
/* A31E4 800B29E4 0A000216 */  bne        $s0, $v0, .L800B2A10
/* A31E8 800B29E8 00000000 */   nop
/* A31EC 800B29EC 5583010C */  jal        HINT_StartHint
/* A31F0 800B29F0 20000424 */   addiu     $a0, $zero, 0x20
/* A31F4 800B29F4 84CA0208 */  j          .L800B2A10
/* A31F8 800B29F8 00000000 */   nop
.L800B29FC:
/* A31FC 800B29FC 20000224 */  addiu      $v0, $zero, 0x20
/* A3200 800B2A00 03000216 */  bne        $s0, $v0, .L800B2A10
/* A3204 800B2A04 00000000 */   nop
/* A3208 800B2A08 8183010C */  jal        HINT_KillSpecificHint
/* A320C 800B2A0C 21204000 */   addu      $a0, $v0, $zero
.L800B2A10:
/* A3210 800B2A10 1400BF8F */  lw         $ra, 0x14($sp)
/* A3214 800B2A14 1000B08F */  lw         $s0, 0x10($sp)
/* A3218 800B2A18 0800E003 */  jr         $ra
/* A321C 800B2A1C 1800BD27 */   addiu     $sp, $sp, 0x18
.size ProcessHints, . - ProcessHints
