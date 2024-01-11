.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BDBB4
/* AE3B4 800BDBB4 0D80023C */  lui        $v0, %hi(_padFuncPort2Info)
/* AE3B8 800BDBB8 18E9428C */  lw         $v0, %lo(_padFuncPort2Info)($v0)
/* AE3BC 800BDBBC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AE3C0 800BDBC0 1000B0AF */  sw         $s0, 0x10($sp)
/* AE3C4 800BDBC4 2180A000 */  addu       $s0, $a1, $zero
/* AE3C8 800BDBC8 1400B1AF */  sw         $s1, 0x14($sp)
/* AE3CC 800BDBCC 1800BFAF */  sw         $ra, 0x18($sp)
/* AE3D0 800BDBD0 09F84000 */  jalr       $v0
/* AE3D4 800BDBD4 2188C000 */   addu      $s1, $a2, $zero
/* AE3D8 800BDBD8 21184000 */  addu       $v1, $v0, $zero
/* AE3DC 800BDBDC 03000224 */  addiu      $v0, $zero, 0x3
/* AE3E0 800BDBE0 16000212 */  beq        $s0, $v0, .L800BDC3C
/* AE3E4 800BDBE4 0400022A */   slti      $v0, $s0, 0x4
/* AE3E8 800BDBE8 07004010 */  beqz       $v0, .L800BDC08
/* AE3EC 800BDBEC 01000224 */   addiu     $v0, $zero, 0x1
/* AE3F0 800BDBF0 0C000212 */  beq        $s0, $v0, .L800BDC24
/* AE3F4 800BDBF4 02000224 */   addiu     $v0, $zero, 0x2
/* AE3F8 800BDBF8 0D000212 */  beq        $s0, $v0, .L800BDC30
/* AE3FC 800BDBFC 21100000 */   addu      $v0, $zero, $zero
/* AE400 800BDC00 26F70208 */  j          .L800BDC98
/* AE404 800BDC04 00000000 */   nop
.L800BDC08:
/* AE408 800BDC08 04000224 */  addiu      $v0, $zero, 0x4
/* AE40C 800BDC0C 0E000212 */  beq        $s0, $v0, .L800BDC48
/* AE410 800BDC10 64000224 */   addiu     $v0, $zero, 0x64
/* AE414 800BDC14 1C000212 */  beq        $s0, $v0, .L800BDC88
/* AE418 800BDC18 21100000 */   addu      $v0, $zero, $zero
/* AE41C 800BDC1C 26F70208 */  j          .L800BDC98
/* AE420 800BDC20 00000000 */   nop
.L800BDC24:
/* AE424 800BDC24 E8006290 */  lbu        $v0, 0xE8($v1)
/* AE428 800BDC28 26F70208 */  j          .L800BDC98
/* AE42C 800BDC2C 00000000 */   nop
.L800BDC30:
/* AE430 800BDC30 E6006294 */  lhu        $v0, 0xE6($v1)
/* AE434 800BDC34 26F70208 */  j          .L800BDC98
/* AE438 800BDC38 00000000 */   nop
.L800BDC3C:
/* AE43C 800BDC3C E4006290 */  lbu        $v0, 0xE4($v1)
/* AE440 800BDC40 26F70208 */  j          .L800BDC98
/* AE444 800BDC44 00000000 */   nop
.L800BDC48:
/* AE448 800BDC48 04002106 */  bgez       $s1, .L800BDC5C
/* AE44C 800BDC4C 00000000 */   nop
/* AE450 800BDC50 E3006290 */  lbu        $v0, 0xE3($v1)
/* AE454 800BDC54 26F70208 */  j          .L800BDC98
/* AE458 800BDC58 00000000 */   nop
.L800BDC5C:
/* AE45C 800BDC5C E3006290 */  lbu        $v0, 0xE3($v1)
/* AE460 800BDC60 00000000 */  nop
/* AE464 800BDC64 2A102202 */  slt        $v0, $s1, $v0
/* AE468 800BDC68 0A004010 */  beqz       $v0, .L800BDC94
/* AE46C 800BDC6C 40101100 */   sll       $v0, $s1, 1
/* AE470 800BDC70 0000638C */  lw         $v1, 0x0($v1)
/* AE474 800BDC74 00000000 */  nop
/* AE478 800BDC78 21104300 */  addu       $v0, $v0, $v1
/* AE47C 800BDC7C 00004294 */  lhu        $v0, 0x0($v0)
/* AE480 800BDC80 26F70208 */  j          .L800BDC98
/* AE484 800BDC84 00000000 */   nop
.L800BDC88:
/* AE488 800BDC88 4C00628C */  lw         $v0, 0x4C($v1)
/* AE48C 800BDC8C 26F70208 */  j          .L800BDC98
/* AE490 800BDC90 00000000 */   nop
.L800BDC94:
/* AE494 800BDC94 21100000 */  addu       $v0, $zero, $zero
.L800BDC98:
/* AE498 800BDC98 1800BF8F */  lw         $ra, 0x18($sp)
/* AE49C 800BDC9C 1400B18F */  lw         $s1, 0x14($sp)
/* AE4A0 800BDCA0 1000B08F */  lw         $s0, 0x10($sp)
/* AE4A4 800BDCA4 0800E003 */  jr         $ra
/* AE4A8 800BDCA8 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BDBB4, . - func_800BDBB4
