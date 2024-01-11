.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnOffBodySpheres
/* 70090 8007F890 6C01868C */  lw         $a2, 0x16C($a0)
/* 70094 8007F894 00000000 */  nop
/* 70098 8007F898 0000C28C */  lw         $v0, 0x0($a2)
/* 7009C 8007F89C 00000000 */  nop
/* 700A0 8007F8A0 00804230 */  andi       $v0, $v0, 0x8000
/* 700A4 8007F8A4 22004010 */  beqz       $v0, .L8007F930
/* 700A8 8007F8A8 00000000 */   nop
/* 700AC 8007F8AC 26018284 */  lh         $v0, 0x126($a0)
/* 700B0 8007F8B0 0001838C */  lw         $v1, 0x100($a0)
/* 700B4 8007F8B4 C0100200 */  sll        $v0, $v0, 3
/* 700B8 8007F8B8 21186200 */  addu       $v1, $v1, $v0
/* 700BC 8007F8BC 0400658C */  lw         $a1, 0x4($v1)
/* 700C0 8007F8C0 0000638C */  lw         $v1, 0x0($v1)
/* 700C4 8007F8C4 1500A010 */  beqz       $a1, .L8007F91C
/* 700C8 8007F8C8 01000824 */   addiu     $t0, $zero, 0x1
/* 700CC 8007F8CC 08000724 */  addiu      $a3, $zero, 0x8
/* 700D0 8007F8D0 04006424 */  addiu      $a0, $v1, 0x4
.L8007F8D4:
/* 700D4 8007F8D4 FEFF8290 */  lbu        $v0, -0x2($a0)
/* 700D8 8007F8D8 00000000 */  nop
/* 700DC 8007F8DC 0B004814 */  bne        $v0, $t0, .L8007F90C
/* 700E0 8007F8E0 00000000 */   nop
/* 700E4 8007F8E4 0000828C */  lw         $v0, 0x0($a0)
/* 700E8 8007F8E8 00000000 */  nop
/* 700EC 8007F8EC 04004290 */  lbu        $v0, 0x4($v0)
/* 700F0 8007F8F0 00000000 */  nop
/* 700F4 8007F8F4 05004714 */  bne        $v0, $a3, .L8007F90C
/* 700F8 8007F8F8 00000000 */   nop
/* 700FC 8007F8FC 00006290 */  lbu        $v0, 0x0($v1)
/* 70100 8007F900 00000000 */  nop
/* 70104 8007F904 FE004230 */  andi       $v0, $v0, 0xFE
/* 70108 8007F908 000062A0 */  sb         $v0, 0x0($v1)
.L8007F90C:
/* 7010C 8007F90C FFFFA524 */  addiu      $a1, $a1, -0x1
/* 70110 8007F910 08008424 */  addiu      $a0, $a0, 0x8
/* 70114 8007F914 EFFFA014 */  bnez       $a1, .L8007F8D4
/* 70118 8007F918 08006324 */   addiu     $v1, $v1, 0x8
.L8007F91C:
/* 7011C 8007F91C FFFF033C */  lui        $v1, (0xFFFF7FFF >> 16)
/* 70120 8007F920 0000C28C */  lw         $v0, 0x0($a2)
/* 70124 8007F924 FF7F6334 */  ori        $v1, $v1, (0xFFFF7FFF & 0xFFFF)
/* 70128 8007F928 24104300 */  and        $v0, $v0, $v1
/* 7012C 8007F92C 0000C2AC */  sw         $v0, 0x0($a2)
.L8007F930:
/* 70130 8007F930 0800E003 */  jr         $ra
/* 70134 8007F934 00000000 */   nop
.size MON_TurnOffBodySpheres, . - MON_TurnOffBodySpheres
