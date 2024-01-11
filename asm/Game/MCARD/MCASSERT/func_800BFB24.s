.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BFB24
/* B0324 800BFB24 FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* B0328 800BFB28 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* B032C 800BFB2C 2428A200 */  and        $a1, $a1, $v0
/* B0330 800BFB30 35008010 */  beqz       $a0, .L800BFC08
/* B0334 800BFB34 02340500 */   srl       $a2, $a1, 16
/* B0338 800BFB38 01000224 */  addiu      $v0, $zero, 0x1
/* B033C 800BFB3C 66008214 */  bne        $a0, $v0, .L800BFCD8
/* B0340 800BFB40 00000000 */   nop
/* B0344 800BFB44 0D80023C */  lui        $v0, %hi(_spu_env)
/* B0348 800BFB48 48ED428C */  lw         $v0, %lo(_spu_env)($v0)
/* B034C 800BFB4C 00000000 */  nop
/* B0350 800BFB50 01004230 */  andi       $v0, $v0, 0x1
/* B0354 800BFB54 24004010 */  beqz       $v0, .L800BFBE8
/* B0358 800BFB58 00000000 */   nop
/* B035C 800BFB5C 0E80043C */  lui        $a0, %hi(_spu_RQ)
/* B0360 800BFB60 BCFD8424 */  addiu      $a0, $a0, %lo(_spu_RQ)
/* B0364 800BFB64 000085A4 */  sh         $a1, 0x0($a0)
/* B0368 800BFB68 020086A4 */  sh         $a2, 0x2($a0)
/* B036C 800BFB6C 0D80023C */  lui        $v0, %hi(_spu_RQmask)
/* B0370 800BFB70 14ED428C */  lw         $v0, %lo(_spu_RQmask)($v0)
/* B0374 800BFB74 00000000 */  nop
/* B0378 800BFB78 01004234 */  ori        $v0, $v0, 0x1
/* B037C 800BFB7C 0D80013C */  lui        $at, %hi(_spu_RQmask)
/* B0380 800BFB80 14ED22AC */  sw         $v0, %lo(_spu_RQmask)($at)
/* B0384 800BFB84 0D80023C */  lui        $v0, %hi(_spu_RQvoice)
/* B0388 800BFB88 10ED428C */  lw         $v0, %lo(_spu_RQvoice)($v0)
/* B038C 800BFB8C 00000000 */  nop
/* B0390 800BFB90 25104500 */  or         $v0, $v0, $a1
/* B0394 800BFB94 0D80013C */  lui        $at, %hi(_spu_RQvoice)
/* B0398 800BFB98 10ED22AC */  sw         $v0, %lo(_spu_RQvoice)($at)
/* B039C 800BFB9C 04008294 */  lhu        $v0, 0x4($a0)
/* B03A0 800BFBA0 00000000 */  nop
/* B03A4 800BFBA4 24104500 */  and        $v0, $v0, $a1
/* B03A8 800BFBA8 05004010 */  beqz       $v0, .L800BFBC0
/* B03AC 800BFBAC 00000000 */   nop
/* B03B0 800BFBB0 04008294 */  lhu        $v0, 0x4($a0)
/* B03B4 800BFBB4 27180500 */  nor        $v1, $zero, $a1
/* B03B8 800BFBB8 24104300 */  and        $v0, $v0, $v1
/* B03BC 800BFBBC 040082A4 */  sh         $v0, 0x4($a0)
.L800BFBC0:
/* B03C0 800BFBC0 06008294 */  lhu        $v0, 0x6($a0)
/* B03C4 800BFBC4 00000000 */  nop
/* B03C8 800BFBC8 24104600 */  and        $v0, $v0, $a2
/* B03CC 800BFBCC 42004010 */  beqz       $v0, .L800BFCD8
/* B03D0 800BFBD0 00000000 */   nop
/* B03D4 800BFBD4 06008294 */  lhu        $v0, 0x6($a0)
/* B03D8 800BFBD8 27180600 */  nor        $v1, $zero, $a2
/* B03DC 800BFBDC 24104300 */  and        $v0, $v0, $v1
/* B03E0 800BFBE0 36FF0208 */  j          .L800BFCD8
/* B03E4 800BFBE4 060082A4 */   sh        $v0, 0x6($a0)
.L800BFBE8:
/* B03E8 800BFBE8 0D80023C */  lui        $v0, %hi(_spu_keystat)
/* B03EC 800BFBEC E8EC428C */  lw         $v0, %lo(_spu_keystat)($v0)
/* B03F0 800BFBF0 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B03F4 800BFBF4 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B03F8 800BFBF8 25104500 */  or         $v0, $v0, $a1
/* B03FC 800BFBFC 880165A4 */  sh         $a1, 0x188($v1)
/* B0400 800BFC00 34FF0208 */  j          .L800BFCD0
/* B0404 800BFC04 8A0166A4 */   sh        $a2, 0x18A($v1)
.L800BFC08:
/* B0408 800BFC08 0D80023C */  lui        $v0, %hi(_spu_env)
/* B040C 800BFC0C 48ED428C */  lw         $v0, %lo(_spu_env)($v0)
/* B0410 800BFC10 00000000 */  nop
/* B0414 800BFC14 01004230 */  andi       $v0, $v0, 0x1
/* B0418 800BFC18 24004010 */  beqz       $v0, .L800BFCAC
/* B041C 800BFC1C 00000000 */   nop
/* B0420 800BFC20 0E80043C */  lui        $a0, %hi(_spu_RQ)
/* B0424 800BFC24 BCFD8424 */  addiu      $a0, $a0, %lo(_spu_RQ)
/* B0428 800BFC28 040085A4 */  sh         $a1, 0x4($a0)
/* B042C 800BFC2C 060086A4 */  sh         $a2, 0x6($a0)
/* B0430 800BFC30 0D80023C */  lui        $v0, %hi(_spu_RQmask)
/* B0434 800BFC34 14ED428C */  lw         $v0, %lo(_spu_RQmask)($v0)
/* B0438 800BFC38 00000000 */  nop
/* B043C 800BFC3C 01004234 */  ori        $v0, $v0, 0x1
/* B0440 800BFC40 0D80013C */  lui        $at, %hi(_spu_RQmask)
/* B0444 800BFC44 14ED22AC */  sw         $v0, %lo(_spu_RQmask)($at)
/* B0448 800BFC48 0D80023C */  lui        $v0, %hi(_spu_RQvoice)
/* B044C 800BFC4C 10ED428C */  lw         $v0, %lo(_spu_RQvoice)($v0)
/* B0450 800BFC50 27180500 */  nor        $v1, $zero, $a1
/* B0454 800BFC54 24104300 */  and        $v0, $v0, $v1
/* B0458 800BFC58 0D80013C */  lui        $at, %hi(_spu_RQvoice)
/* B045C 800BFC5C 10ED22AC */  sw         $v0, %lo(_spu_RQvoice)($at)
/* B0460 800BFC60 00008294 */  lhu        $v0, 0x0($a0)
/* B0464 800BFC64 00000000 */  nop
/* B0468 800BFC68 24104500 */  and        $v0, $v0, $a1
/* B046C 800BFC6C 05004010 */  beqz       $v0, .L800BFC84
/* B0470 800BFC70 00000000 */   nop
/* B0474 800BFC74 00008294 */  lhu        $v0, 0x0($a0)
/* B0478 800BFC78 00000000 */  nop
/* B047C 800BFC7C 24104300 */  and        $v0, $v0, $v1
/* B0480 800BFC80 000082A4 */  sh         $v0, 0x0($a0)
.L800BFC84:
/* B0484 800BFC84 02008294 */  lhu        $v0, 0x2($a0)
/* B0488 800BFC88 00000000 */  nop
/* B048C 800BFC8C 24104600 */  and        $v0, $v0, $a2
/* B0490 800BFC90 11004010 */  beqz       $v0, .L800BFCD8
/* B0494 800BFC94 00000000 */   nop
/* B0498 800BFC98 02008294 */  lhu        $v0, 0x2($a0)
/* B049C 800BFC9C 27180600 */  nor        $v1, $zero, $a2
/* B04A0 800BFCA0 24104300 */  and        $v0, $v0, $v1
/* B04A4 800BFCA4 36FF0208 */  j          .L800BFCD8
/* B04A8 800BFCA8 020082A4 */   sh        $v0, 0x2($a0)
.L800BFCAC:
/* B04AC 800BFCAC 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B04B0 800BFCB0 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B04B4 800BFCB4 00000000 */  nop
/* B04B8 800BFCB8 8C0145A4 */  sh         $a1, 0x18C($v0)
/* B04BC 800BFCBC 8E0146A4 */  sh         $a2, 0x18E($v0)
/* B04C0 800BFCC0 0D80023C */  lui        $v0, %hi(_spu_keystat)
/* B04C4 800BFCC4 E8EC428C */  lw         $v0, %lo(_spu_keystat)($v0)
/* B04C8 800BFCC8 27180500 */  nor        $v1, $zero, $a1
/* B04CC 800BFCCC 24104300 */  and        $v0, $v0, $v1
.L800BFCD0:
/* B04D0 800BFCD0 0D80013C */  lui        $at, %hi(_spu_keystat)
/* B04D4 800BFCD4 E8EC22AC */  sw         $v0, %lo(_spu_keystat)($at)
.L800BFCD8:
/* B04D8 800BFCD8 0800E003 */  jr         $ra
/* B04DC 800BFCDC 00000000 */   nop
/* B04E0 800BFCE0 00000000 */  nop
.size func_800BFB24, . - func_800BFB24
