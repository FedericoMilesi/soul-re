.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_MakeNormal
/* F3A0 8001EBA0 2170C000 */  addu       $t6, $a2, $zero
/* F3A4 8001EBA4 0200A394 */  lhu        $v1, 0x2($a1)
/* F3A8 8001EBA8 1C00868C */  lw         $a2, 0x1C($a0)
/* F3AC 8001EBAC 0000A494 */  lhu        $a0, 0x0($a1)
/* F3B0 8001EBB0 40100300 */  sll        $v0, $v1, 1
/* F3B4 8001EBB4 21104300 */  addu       $v0, $v0, $v1
/* F3B8 8001EBB8 80100200 */  sll        $v0, $v0, 2
/* F3BC 8001EBBC 2110C200 */  addu       $v0, $a2, $v0
/* F3C0 8001EBC0 40180400 */  sll        $v1, $a0, 1
/* F3C4 8001EBC4 21186400 */  addu       $v1, $v1, $a0
/* F3C8 8001EBC8 80180300 */  sll        $v1, $v1, 2
/* F3CC 8001EBCC 2118C300 */  addu       $v1, $a2, $v1
/* F3D0 8001EBD0 00004984 */  lh         $t1, 0x0($v0)
/* F3D4 8001EBD4 02004A84 */  lh         $t2, 0x2($v0)
/* F3D8 8001EBD8 00006484 */  lh         $a0, 0x0($v1)
/* F3DC 8001EBDC 04004884 */  lh         $t0, 0x4($v0)
/* F3E0 8001EBE0 02006284 */  lh         $v0, 0x2($v1)
/* F3E4 8001EBE4 23482401 */  subu       $t1, $t1, $a0
/* F3E8 8001EBE8 04006484 */  lh         $a0, 0x4($v1)
/* F3EC 8001EBEC 23504201 */  subu       $t2, $t2, $v0
/* F3F0 8001EBF0 23400401 */  subu       $t0, $t0, $a0
/* F3F4 8001EBF4 0400A494 */  lhu        $a0, 0x4($a1)
/* F3F8 8001EBF8 801F023C */  lui        $v0, (0x1F800008 >> 16)
/* F3FC 8001EBFC 000049AC */  sw         $t1, (0x1F800000 & 0xFFFF)($v0)
/* F400 8001EC00 04004AAC */  sw         $t2, (0x1F800004 & 0xFFFF)($v0)
/* F404 8001EC04 080048AC */  sw         $t0, (0x1F800008 & 0xFFFF)($v0)
/* F408 8001EC08 40100400 */  sll        $v0, $a0, 1
/* F40C 8001EC0C 21104400 */  addu       $v0, $v0, $a0
/* F410 8001EC10 80100200 */  sll        $v0, $v0, 2
/* F414 8001EC14 2130C200 */  addu       $a2, $a2, $v0
/* F418 8001EC18 0400C784 */  lh         $a3, 0x4($a2)
/* F41C 8001EC1C 04006284 */  lh         $v0, 0x4($v1)
/* F420 8001EC20 00000000 */  nop
/* F424 8001EC24 2338E200 */  subu       $a3, $a3, $v0
/* F428 8001EC28 18004701 */  mult       $t2, $a3
/* F42C 8001EC2C 0200C584 */  lh         $a1, 0x2($a2)
/* F430 8001EC30 02006284 */  lh         $v0, 0x2($v1)
/* F434 8001EC34 12680000 */  mflo       $t5
/* F438 8001EC38 2328A200 */  subu       $a1, $a1, $v0
/* F43C 8001EC3C 00000000 */  nop
/* F440 8001EC40 18000501 */  mult       $t0, $a1
/* F444 8001EC44 12600000 */  mflo       $t4
/* F448 8001EC48 00000000 */  nop
/* F44C 8001EC4C 00000000 */  nop
/* F450 8001EC50 18002701 */  mult       $t1, $a3
/* F454 8001EC54 0000C484 */  lh         $a0, 0x0($a2)
/* F458 8001EC58 00006284 */  lh         $v0, 0x0($v1)
/* F45C 8001EC5C 12580000 */  mflo       $t3
/* F460 8001EC60 23208200 */  subu       $a0, $a0, $v0
/* F464 8001EC64 00000000 */  nop
/* F468 8001EC68 18000401 */  mult       $t0, $a0
/* F46C 8001EC6C 12180000 */  mflo       $v1
/* F470 8001EC70 00000000 */  nop
/* F474 8001EC74 00000000 */  nop
/* F478 8001EC78 18002501 */  mult       $t1, $a1
/* F47C 8001EC7C 801F023C */  lui        $v0, (0x1F800010 >> 16)
/* F480 8001EC80 10004234 */  ori        $v0, $v0, (0x1F800010 & 0xFFFF)
/* F484 8001EC84 000044AC */  sw         $a0, 0x0($v0)
/* F488 8001EC88 040045AC */  sw         $a1, 0x4($v0)
/* F48C 8001EC8C 080047AC */  sw         $a3, 0x8($v0)
/* F490 8001EC90 801F083C */  lui        $t0, (0x1F800020 >> 16)
/* F494 8001EC94 20000835 */  ori        $t0, $t0, (0x1F800020 & 0xFFFF)
/* F498 8001EC98 12300000 */  mflo       $a2
/* F49C 8001EC9C 23186301 */  subu       $v1, $t3, $v1
/* F4A0 8001ECA0 031B0300 */  sra        $v1, $v1, 12
/* F4A4 8001ECA4 18004401 */  mult       $t2, $a0
/* F4A8 8001ECA8 23180300 */  negu       $v1, $v1
/* F4AC 8001ECAC 001C0300 */  sll        $v1, $v1, 16
/* F4B0 8001ECB0 031C0300 */  sra        $v1, $v1, 16
/* F4B4 8001ECB4 02006104 */  bgez       $v1, .L8001ECC0
/* F4B8 8001ECB8 21106000 */   addu      $v0, $v1, $zero
/* F4BC 8001ECBC 23100200 */  negu       $v0, $v0
.L8001ECC0:
/* F4C0 8001ECC0 040003AD */  sw         $v1, 0x4($t0)
/* F4C4 8001ECC4 21204000 */  addu       $a0, $v0, $zero
/* F4C8 8001ECC8 2310AC01 */  subu       $v0, $t5, $t4
/* F4CC 8001ECCC 00110200 */  sll        $v0, $v0, 4
/* F4D0 8001ECD0 032C0200 */  sra        $a1, $v0, 16
/* F4D4 8001ECD4 0200A104 */  bgez       $a1, .L8001ECE0
/* F4D8 8001ECD8 2118A000 */   addu      $v1, $a1, $zero
/* F4DC 8001ECDC 23180300 */  negu       $v1, $v1
.L8001ECE0:
/* F4E0 8001ECE0 000005AD */  sw         $a1, 0x0($t0)
/* F4E4 8001ECE4 12380000 */  mflo       $a3
/* F4E8 8001ECE8 2310C700 */  subu       $v0, $a2, $a3
/* F4EC 8001ECEC 00110200 */  sll        $v0, $v0, 4
/* F4F0 8001ECF0 03340200 */  sra        $a2, $v0, 16
/* F4F4 8001ECF4 2A108300 */  slt        $v0, $a0, $v1
/* F4F8 8001ECF8 02004010 */  beqz       $v0, .L8001ED04
/* F4FC 8001ECFC 080006AD */   sw        $a2, 0x8($t0)
/* F500 8001ED00 21206000 */  addu       $a0, $v1, $zero
.L8001ED04:
/* F504 8001ED04 0200C104 */  bgez       $a2, .L8001ED10
/* F508 8001ED08 2118C000 */   addu      $v1, $a2, $zero
/* F50C 8001ED0C 23180300 */  negu       $v1, $v1
.L8001ED10:
/* F510 8001ED10 2A108300 */  slt        $v0, $a0, $v1
/* F514 8001ED14 02004010 */  beqz       $v0, .L8001ED20
/* F518 8001ED18 00000000 */   nop
/* F51C 8001ED1C 21206000 */  addu       $a0, $v1, $zero
.L8001ED20:
/* F520 8001ED20 13008010 */  beqz       $a0, .L8001ED70
/* F524 8001ED24 00130500 */   sll       $v0, $a1, 12
/* F528 8001ED28 1A004400 */  div        $zero, $v0, $a0
/* F52C 8001ED2C 12100000 */  mflo       $v0
/* F530 8001ED30 00000000 */  nop
/* F534 8001ED34 0000C2A5 */  sh         $v0, 0x0($t6)
/* F538 8001ED38 0400028D */  lw         $v0, 0x4($t0)
/* F53C 8001ED3C 00000000 */  nop
/* F540 8001ED40 00130200 */  sll        $v0, $v0, 12
/* F544 8001ED44 1A004400 */  div        $zero, $v0, $a0
/* F548 8001ED48 12100000 */  mflo       $v0
/* F54C 8001ED4C 00000000 */  nop
/* F550 8001ED50 0200C2A5 */  sh         $v0, 0x2($t6)
/* F554 8001ED54 0800028D */  lw         $v0, 0x8($t0)
/* F558 8001ED58 00000000 */  nop
/* F55C 8001ED5C 00130200 */  sll        $v0, $v0, 12
/* F560 8001ED60 1A004400 */  div        $zero, $v0, $a0
/* F564 8001ED64 12100000 */  mflo       $v0
/* F568 8001ED68 00000000 */  nop
/* F56C 8001ED6C 0400C2A5 */  sh         $v0, 0x4($t6)
.L8001ED70:
/* F570 8001ED70 0800E003 */  jr         $ra
/* F574 8001ED74 00000000 */   nop
.size COLLIDE_MakeNormal, . - COLLIDE_MakeNormal
