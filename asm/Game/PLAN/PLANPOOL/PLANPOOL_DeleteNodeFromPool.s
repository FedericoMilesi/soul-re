.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_DeleteNodeFromPool
/* 8A3AC 80099BAC 70008010 */  beqz       $a0, .L80099D70
/* 8A3B0 80099BB0 21300000 */   addu      $a2, $zero, $zero
/* 8A3B4 80099BB4 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 8A3B8 80099BB8 00000000 */  nop
/* 8A3BC 80099BBC 01004290 */  lbu        $v0, 0x1($v0)
/* 8A3C0 80099BC0 00000000 */  nop
/* 8A3C4 80099BC4 FFFF4A24 */  addiu      $t2, $v0, -0x1
/* 8A3C8 80099BC8 C0100A00 */  sll        $v0, $t2, 3
/* 8A3CC 80099BCC 23104A00 */  subu       $v0, $v0, $t2
/* 8A3D0 80099BD0 80100200 */  sll        $v0, $v0, 2
/* 8A3D4 80099BD4 2110A200 */  addu       $v0, $a1, $v0
/* 8A3D8 80099BD8 00004D8C */  lw         $t5, 0x0($v0)
/* 8A3DC 80099BDC 04004E8C */  lw         $t6, 0x4($v0)
/* 8A3E0 80099BE0 08004F8C */  lw         $t7, 0x8($v0)
/* 8A3E4 80099BE4 0C00588C */  lw         $t8, 0xC($v0)
/* 8A3E8 80099BE8 00008DAC */  sw         $t5, 0x0($a0)
/* 8A3EC 80099BEC 04008EAC */  sw         $t6, 0x4($a0)
/* 8A3F0 80099BF0 08008FAC */  sw         $t7, 0x8($a0)
/* 8A3F4 80099BF4 0C0098AC */  sw         $t8, 0xC($a0)
/* 8A3F8 80099BF8 10004D8C */  lw         $t5, 0x10($v0)
/* 8A3FC 80099BFC 14004E8C */  lw         $t6, 0x14($v0)
/* 8A400 80099C00 18004F8C */  lw         $t7, 0x18($v0)
/* 8A404 80099C04 10008DAC */  sw         $t5, 0x10($a0)
/* 8A408 80099C08 14008EAC */  sw         $t6, 0x14($a0)
/* 8A40C 80099C0C 18008FAC */  sw         $t7, 0x18($a0)
/* 8A410 80099C10 23208500 */  subu       $a0, $a0, $a1
/* 8A414 80099C14 C0100400 */  sll        $v0, $a0, 3
/* 8A418 80099C18 21104400 */  addu       $v0, $v0, $a0
/* 8A41C 80099C1C 80190200 */  sll        $v1, $v0, 6
/* 8A420 80099C20 21104300 */  addu       $v0, $v0, $v1
/* 8A424 80099C24 C0100200 */  sll        $v0, $v0, 3
/* 8A428 80099C28 21104400 */  addu       $v0, $v0, $a0
/* 8A42C 80099C2C C01B0200 */  sll        $v1, $v0, 15
/* 8A430 80099C30 21104300 */  addu       $v0, $v0, $v1
/* 8A434 80099C34 C0100200 */  sll        $v0, $v0, 3
/* 8A438 80099C38 21104400 */  addu       $v0, $v0, $a0
/* 8A43C 80099C3C 23100200 */  negu       $v0, $v0
/* 8A440 80099C40 83580200 */  sra        $t3, $v0, 2
/* 8A444 80099C44 01000324 */  addiu      $v1, $zero, 0x1
/* 8A448 80099C48 ECF5848F */  lw         $a0, %gp_rel(poolManagementData)($gp)
/* 8A44C 80099C4C 04386301 */  sllv       $a3, $v1, $t3
/* 8A450 80099C50 01008290 */  lbu        $v0, 0x1($a0)
/* 8A454 80099C54 00000000 */  nop
/* 8A458 80099C58 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 8A45C 80099C5C 1E004018 */  blez       $v0, .L80099CD8
/* 8A460 80099C60 04184301 */   sllv      $v1, $v1, $t2
/* 8A464 80099C64 27480700 */  nor        $t1, $zero, $a3
/* 8A468 80099C68 27400300 */  nor        $t0, $zero, $v1
/* 8A46C 80099C6C 21608000 */  addu       $t4, $a0, $zero
.L80099C70:
/* 8A470 80099C70 0800A48C */  lw         $a0, 0x8($a1)
/* 8A474 80099C74 00000000 */  nop
/* 8A478 80099C78 24108300 */  and        $v0, $a0, $v1
/* 8A47C 80099C7C 02004014 */  bnez       $v0, .L80099C88
/* 8A480 80099C80 25108700 */   or        $v0, $a0, $a3
/* 8A484 80099C84 24108900 */  and        $v0, $a0, $t1
.L80099C88:
/* 8A488 80099C88 0800A2AC */  sw         $v0, 0x8($a1)
/* 8A48C 80099C8C 0800A28C */  lw         $v0, 0x8($a1)
/* 8A490 80099C90 0C00A48C */  lw         $a0, 0xC($a1)
/* 8A494 80099C94 24104800 */  and        $v0, $v0, $t0
/* 8A498 80099C98 0800A2AC */  sw         $v0, 0x8($a1)
/* 8A49C 80099C9C 24108300 */  and        $v0, $a0, $v1
/* 8A4A0 80099CA0 02004014 */  bnez       $v0, .L80099CAC
/* 8A4A4 80099CA4 25108700 */   or        $v0, $a0, $a3
/* 8A4A8 80099CA8 24108900 */  and        $v0, $a0, $t1
.L80099CAC:
/* 8A4AC 80099CAC 0C00A2AC */  sw         $v0, 0xC($a1)
/* 8A4B0 80099CB0 0C00A28C */  lw         $v0, 0xC($a1)
/* 8A4B4 80099CB4 0100C624 */  addiu      $a2, $a2, 0x1
/* 8A4B8 80099CB8 24104800 */  and        $v0, $v0, $t0
/* 8A4BC 80099CBC 0C00A2AC */  sw         $v0, 0xC($a1)
/* 8A4C0 80099CC0 01008291 */  lbu        $v0, 0x1($t4)
/* 8A4C4 80099CC4 00000000 */  nop
/* 8A4C8 80099CC8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 8A4CC 80099CCC 2A10C200 */  slt        $v0, $a2, $v0
/* 8A4D0 80099CD0 E7FF4014 */  bnez       $v0, .L80099C70
/* 8A4D4 80099CD4 1C00A524 */   addiu     $a1, $a1, 0x1C
.L80099CD8:
/* 8A4D8 80099CD8 ECF5858F */  lw         $a1, %gp_rel(poolManagementData)($gp)
/* 8A4DC 80099CDC 00000000 */  nop
/* 8A4E0 80099CE0 0100A290 */  lbu        $v0, 0x1($a1)
/* 8A4E4 80099CE4 00000000 */  nop
/* 8A4E8 80099CE8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 8A4EC 80099CEC 1A004018 */  blez       $v0, .L80099D58
/* 8A4F0 80099CF0 21300000 */   addu      $a2, $zero, $zero
/* 8A4F4 80099CF4 80610B00 */  sll        $t4, $t3, 6
/* 8A4F8 80099CF8 80490A00 */  sll        $t1, $t2, 6
/* 8A4FC 80099CFC 40400B00 */  sll        $t0, $t3, 1
/* 8A500 80099D00 40380A00 */  sll        $a3, $t2, 1
.L80099D04:
/* 8A504 80099D04 1000A28C */  lw         $v0, 0x10($a1)
/* 8A508 80099D08 40180600 */  sll        $v1, $a2, 1
/* 8A50C 80099D0C 21208201 */  addu       $a0, $t4, $v0
/* 8A510 80099D10 21102201 */  addu       $v0, $t1, $v0
/* 8A514 80099D14 21106200 */  addu       $v0, $v1, $v0
/* 8A518 80099D18 00004294 */  lhu        $v0, 0x0($v0)
/* 8A51C 80099D1C 21186400 */  addu       $v1, $v1, $a0
/* 8A520 80099D20 000062A4 */  sh         $v0, 0x0($v1)
/* 8A524 80099D24 1000A38C */  lw         $v1, 0x10($a1)
/* 8A528 80099D28 80110600 */  sll        $v0, $a2, 6
/* 8A52C 80099D2C 21104300 */  addu       $v0, $v0, $v1
/* 8A530 80099D30 2118E200 */  addu       $v1, $a3, $v0
/* 8A534 80099D34 00006394 */  lhu        $v1, 0x0($v1)
/* 8A538 80099D38 21100201 */  addu       $v0, $t0, $v0
/* 8A53C 80099D3C 000043A4 */  sh         $v1, 0x0($v0)
/* 8A540 80099D40 0100A290 */  lbu        $v0, 0x1($a1)
/* 8A544 80099D44 0100C624 */  addiu      $a2, $a2, 0x1
/* 8A548 80099D48 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 8A54C 80099D4C 2A10C200 */  slt        $v0, $a2, $v0
/* 8A550 80099D50 ECFF4014 */  bnez       $v0, .L80099D04
/* 8A554 80099D54 00000000 */   nop
.L80099D58:
/* 8A558 80099D58 ECF5838F */  lw         $v1, %gp_rel(poolManagementData)($gp)
/* 8A55C 80099D5C 00000000 */  nop
/* 8A560 80099D60 01006290 */  lbu        $v0, 0x1($v1)
/* 8A564 80099D64 00000000 */  nop
/* 8A568 80099D68 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 8A56C 80099D6C 010062A0 */  sb         $v0, 0x1($v1)
.L80099D70:
/* 8A570 80099D70 0800E003 */  jr         $ra
/* 8A574 80099D74 00000000 */   nop
.size PLANPOOL_DeleteNodeFromPool, . - PLANPOOL_DeleteNodeFromPool
