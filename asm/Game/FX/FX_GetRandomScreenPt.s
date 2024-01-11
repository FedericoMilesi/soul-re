.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetRandomScreenPt
/* 39B5C 8004935C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 39B60 80049360 1000B0AF */  sw         $s0, 0x10($sp)
/* 39B64 80049364 1400BFAF */  sw         $ra, 0x14($sp)
/* 39B68 80049368 3AF2020C */  jal        func_800BC8E8
/* 39B6C 8004936C 21808000 */   addu      $s0, $a0, $zero
/* 39B70 80049370 21184000 */  addu       $v1, $v0, $zero
/* 39B74 80049374 03006104 */  bgez       $v1, .L80049384
/* 39B78 80049378 43120200 */   sra       $v0, $v0, 9
/* 39B7C 8004937C FF016224 */  addiu      $v0, $v1, 0x1FF
/* 39B80 80049380 43120200 */  sra        $v0, $v0, 9
.L80049384:
/* 39B84 80049384 40120200 */  sll        $v0, $v0, 9
/* 39B88 80049388 23106200 */  subu       $v0, $v1, $v0
/* 39B8C 8004938C 3AF2020C */  jal        func_800BC8E8
/* 39B90 80049390 000002A6 */   sh        $v0, 0x0($s0)
/* 39B94 80049394 8888033C */  lui        $v1, (0x88888889 >> 16)
/* 39B98 80049398 89886334 */  ori        $v1, $v1, (0x88888889 & 0xFFFF)
/* 39B9C 8004939C 18004300 */  mult       $v0, $v1
/* 39BA0 800493A0 C31F0200 */  sra        $v1, $v0, 31
/* 39BA4 800493A4 10280000 */  mfhi       $a1
/* 39BA8 800493A8 2120A200 */  addu       $a0, $a1, $v0
/* 39BAC 800493AC C3210400 */  sra        $a0, $a0, 7
/* 39BB0 800493B0 23208300 */  subu       $a0, $a0, $v1
/* 39BB4 800493B4 00190400 */  sll        $v1, $a0, 4
/* 39BB8 800493B8 23186400 */  subu       $v1, $v1, $a0
/* 39BBC 800493BC 00190300 */  sll        $v1, $v1, 4
/* 39BC0 800493C0 23104300 */  subu       $v0, $v0, $v1
/* 39BC4 800493C4 3AF2020C */  jal        func_800BC8E8
/* 39BC8 800493C8 020002A6 */   sh        $v0, 0x2($s0)
/* 39BCC 800493CC FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 39BD0 800493D0 80014224 */  addiu      $v0, $v0, 0x180
/* 39BD4 800493D4 040002A6 */  sh         $v0, 0x4($s0)
/* 39BD8 800493D8 1400BF8F */  lw         $ra, 0x14($sp)
/* 39BDC 800493DC 1000B08F */  lw         $s0, 0x10($sp)
/* 39BE0 800493E0 0800E003 */  jr         $ra
/* 39BE4 800493E4 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_GetRandomScreenPt, . - FX_GetRandomScreenPt
