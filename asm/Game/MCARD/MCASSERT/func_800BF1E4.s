.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BF1E4
/* AF9E4 800BF1E4 0D80023C */  lui        $v0, %hi(_spu_trans_mode)
/* AF9E8 800BF1E8 ECEC428C */  lw         $v0, %lo(_spu_trans_mode)($v0)
/* AF9EC 800BF1EC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AF9F0 800BF1F0 1400B1AF */  sw         $s1, 0x14($sp)
/* AF9F4 800BF1F4 21888000 */  addu       $s1, $a0, $zero
/* AF9F8 800BF1F8 1000B0AF */  sw         $s0, 0x10($sp)
/* AF9FC 800BF1FC 01001024 */  addiu      $s0, $zero, 0x1
/* AFA00 800BF200 06005010 */  beq        $v0, $s0, .L800BF21C
/* AFA04 800BF204 1800BFAF */   sw        $ra, 0x18($sp)
/* AFA08 800BF208 0D80023C */  lui        $v0, %hi(_spu_inTransfer)
/* AFA0C 800BF20C 90ED428C */  lw         $v0, %lo(_spu_inTransfer)($v0)
/* AFA10 800BF210 00000000 */  nop
/* AFA14 800BF214 03005014 */  bne        $v0, $s0, .L800BF224
/* AFA18 800BF218 00000000 */   nop
.L800BF21C:
/* AFA1C 800BF21C 9DFC0208 */  j          .L800BF274
/* AFA20 800BF220 01000224 */   addiu     $v0, $zero, 0x1
.L800BF224:
/* AFA24 800BF224 0D80043C */  lui        $a0, %hi(_spu_EVdma)
/* AFA28 800BF228 E4EC848C */  lw         $a0, %lo(_spu_EVdma)($a0)
/* AFA2C 800BF22C A01A030C */  jal        func_800C6A80
/* AFA30 800BF230 00000000 */   nop
/* AFA34 800BF234 0B003016 */  bne        $s1, $s0, .L800BF264
/* AFA38 800BF238 00000000 */   nop
/* AFA3C 800BF23C 0B004014 */  bnez       $v0, .L800BF26C
/* AFA40 800BF240 01000224 */   addiu     $v0, $zero, 0x1
.L800BF244:
/* AFA44 800BF244 0D80043C */  lui        $a0, %hi(_spu_EVdma)
/* AFA48 800BF248 E4EC848C */  lw         $a0, %lo(_spu_EVdma)($a0)
/* AFA4C 800BF24C A01A030C */  jal        func_800C6A80
/* AFA50 800BF250 00000000 */   nop
/* AFA54 800BF254 FBFF4010 */  beqz       $v0, .L800BF244
/* AFA58 800BF258 01000224 */   addiu     $v0, $zero, 0x1
/* AFA5C 800BF25C 9BFC0208 */  j          .L800BF26C
/* AFA60 800BF260 00000000 */   nop
.L800BF264:
/* AFA64 800BF264 03005014 */  bne        $v0, $s0, .L800BF274
/* AFA68 800BF268 00000000 */   nop
.L800BF26C:
/* AFA6C 800BF26C 0D80013C */  lui        $at, %hi(_spu_inTransfer)
/* AFA70 800BF270 90ED22AC */  sw         $v0, %lo(_spu_inTransfer)($at)
.L800BF274:
/* AFA74 800BF274 1800BF8F */  lw         $ra, 0x18($sp)
/* AFA78 800BF278 1400B18F */  lw         $s1, 0x14($sp)
/* AFA7C 800BF27C 1000B08F */  lw         $s0, 0x10($sp)
/* AFA80 800BF280 0800E003 */  jr         $ra
/* AFA84 800BF284 2000BD27 */   addiu     $sp, $sp, 0x20
/* AFA88 800BF288 00000000 */  nop
/* AFA8C 800BF28C 00000000 */  nop
/* AFA90 800BF290 00000000 */  nop
.size func_800BF1E4, . - func_800BF1E4
