.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_GetBigFileEntryByHash
/* 287CC 80037FCC F8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x64)($gp)
/* 287D0 80037FD0 00000000 */  nop
/* 287D4 80037FD4 11006010 */  beqz       $v1, .L8003801C
/* 287D8 80037FD8 00000000 */   nop
/* 287DC 80037FDC 24BC828F */  lw         $v0, %gp_rel(loadStatus + 0x90)($gp)
/* 287E0 80037FE0 00000000 */  nop
/* 287E4 80037FE4 0D004014 */  bnez       $v0, .L8003801C
/* 287E8 80037FE8 00000000 */   nop
/* 287EC 80037FEC 0000658C */  lw         $a1, 0x0($v1)
/* 287F0 80037FF0 00000000 */  nop
/* 287F4 80037FF4 0900A010 */  beqz       $a1, .L8003801C
/* 287F8 80037FF8 04006324 */   addiu     $v1, $v1, 0x4
.L80037FFC:
/* 287FC 80037FFC 0000628C */  lw         $v0, 0x0($v1)
/* 28800 80038000 00000000 */  nop
/* 28804 80038004 03004414 */  bne        $v0, $a0, .L80038014
/* 28808 80038008 FFFFA524 */   addiu     $a1, $a1, -0x1
.L8003800C:
/* 2880C 8003800C 0800E003 */  jr         $ra
/* 28810 80038010 21106000 */   addu      $v0, $v1, $zero
.L80038014:
/* 28814 80038014 F9FFA014 */  bnez       $a1, .L80037FFC
/* 28818 80038018 10006324 */   addiu     $v1, $v1, 0x10
.L8003801C:
/* 2881C 8003801C F4BB828F */  lw         $v0, %gp_rel(loadStatus + 0x60)($gp)
/* 28820 80038020 00000000 */  nop
/* 28824 80038024 0000458C */  lw         $a1, 0x0($v0)
/* 28828 80038028 00000000 */  nop
/* 2882C 8003802C 0700A010 */  beqz       $a1, .L8003804C
/* 28830 80038030 04004324 */   addiu     $v1, $v0, 0x4
.L80038034:
/* 28834 80038034 0000628C */  lw         $v0, 0x0($v1)
/* 28838 80038038 00000000 */  nop
/* 2883C 8003803C F3FF4410 */  beq        $v0, $a0, .L8003800C
/* 28840 80038040 FFFFA524 */   addiu     $a1, $a1, -0x1
/* 28844 80038044 FBFFA014 */  bnez       $a1, .L80038034
/* 28848 80038048 10006324 */   addiu     $v1, $v1, 0x10
.L8003804C:
/* 2884C 8003804C 0800E003 */  jr         $ra
/* 28850 80038050 21100000 */   addu      $v0, $zero, $zero
.size LOAD_GetBigFileEntryByHash, . - LOAD_GetBigFileEntryByHash
