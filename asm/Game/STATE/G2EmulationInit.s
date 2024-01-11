.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInit
/* 623B0 80071BB0 BCA4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x4)($gp)
/* 623B4 80071BB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 623B8 80071BB8 1000BFAF */  sw         $ra, 0x10($sp)
/* 623BC 80071BBC B8A480AF */  sw         $zero, %gp_rel(G2AlphaTables)($gp)
/* 623C0 80071BC0 12004014 */  bnez       $v0, .L80071C0C
/* 623C4 80071BC4 12000424 */   addiu     $a0, $zero, 0x12
/* 623C8 80071BC8 8140010C */  jal        MEMPACK_Malloc
/* 623CC 80071BCC 19000524 */   addiu     $a1, $zero, 0x19
/* 623D0 80071BD0 04000324 */  addiu      $v1, $zero, 0x4
/* 623D4 80071BD4 BCA482AF */  sw         $v0, %gp_rel(G2AlphaTables + 0x4)($gp)
/* 623D8 80071BD8 000043A4 */  sh         $v1, 0x0($v0)
/* 623DC 80071BDC BCA4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x4)($gp)
/* 623E0 80071BE0 00000000 */  nop
/* 623E4 80071BE4 040040AC */  sw         $zero, 0x4($v0)
/* 623E8 80071BE8 BCA4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x4)($gp)
/* 623EC 80071BEC 00010224 */  addiu      $v0, $zero, 0x100
/* 623F0 80071BF0 080062AC */  sw         $v0, 0x8($v1)
/* 623F4 80071BF4 BCA4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x4)($gp)
/* 623F8 80071BF8 00040224 */  addiu      $v0, $zero, 0x400
/* 623FC 80071BFC 0C0062AC */  sw         $v0, 0xC($v1)
/* 62400 80071C00 BCA4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x4)($gp)
/* 62404 80071C04 00100224 */  addiu      $v0, $zero, 0x1000
/* 62408 80071C08 100062AC */  sw         $v0, 0x10($v1)
.L80071C0C:
/* 6240C 80071C0C C0A4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x8)($gp)
/* 62410 80071C10 00000000 */  nop
/* 62414 80071C14 12004014 */  bnez       $v0, .L80071C60
/* 62418 80071C18 12000424 */   addiu     $a0, $zero, 0x12
/* 6241C 80071C1C 8140010C */  jal        MEMPACK_Malloc
/* 62420 80071C20 19000524 */   addiu     $a1, $zero, 0x19
/* 62424 80071C24 04000324 */  addiu      $v1, $zero, 0x4
/* 62428 80071C28 C0A482AF */  sw         $v0, %gp_rel(G2AlphaTables + 0x8)($gp)
/* 6242C 80071C2C 000043A4 */  sh         $v1, 0x0($v0)
/* 62430 80071C30 C0A4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x8)($gp)
/* 62434 80071C34 00000000 */  nop
/* 62438 80071C38 040040AC */  sw         $zero, 0x4($v0)
/* 6243C 80071C3C C0A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x8)($gp)
/* 62440 80071C40 000C0224 */  addiu      $v0, $zero, 0xC00
/* 62444 80071C44 080062AC */  sw         $v0, 0x8($v1)
/* 62448 80071C48 C0A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x8)($gp)
/* 6244C 80071C4C 000F0224 */  addiu      $v0, $zero, 0xF00
/* 62450 80071C50 0C0062AC */  sw         $v0, 0xC($v1)
/* 62454 80071C54 C0A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x8)($gp)
/* 62458 80071C58 00100224 */  addiu      $v0, $zero, 0x1000
/* 6245C 80071C5C 100062AC */  sw         $v0, 0x10($v1)
.L80071C60:
/* 62460 80071C60 C4A4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0xC)($gp)
/* 62464 80071C64 00000000 */  nop
/* 62468 80071C68 09004014 */  bnez       $v0, .L80071C90
/* 6246C 80071C6C 06000424 */   addiu     $a0, $zero, 0x6
/* 62470 80071C70 8140010C */  jal        MEMPACK_Malloc
/* 62474 80071C74 19000524 */   addiu     $a1, $zero, 0x19
/* 62478 80071C78 01000324 */  addiu      $v1, $zero, 0x1
/* 6247C 80071C7C C4A482AF */  sw         $v0, %gp_rel(G2AlphaTables + 0xC)($gp)
/* 62480 80071C80 000043A4 */  sh         $v1, 0x0($v0)
/* 62484 80071C84 C4A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0xC)($gp)
/* 62488 80071C88 00100224 */  addiu      $v0, $zero, 0x1000
/* 6248C 80071C8C 040062AC */  sw         $v0, 0x4($v1)
.L80071C90:
/* 62490 80071C90 C8A4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x10)($gp)
/* 62494 80071C94 00000000 */  nop
/* 62498 80071C98 12004014 */  bnez       $v0, .L80071CE4
/* 6249C 80071C9C 12000424 */   addiu     $a0, $zero, 0x12
/* 624A0 80071CA0 8140010C */  jal        MEMPACK_Malloc
/* 624A4 80071CA4 19000524 */   addiu     $a1, $zero, 0x19
/* 624A8 80071CA8 04000324 */  addiu      $v1, $zero, 0x4
/* 624AC 80071CAC C8A482AF */  sw         $v0, %gp_rel(G2AlphaTables + 0x10)($gp)
/* 624B0 80071CB0 000043A4 */  sh         $v1, 0x0($v0)
/* 624B4 80071CB4 C8A4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x10)($gp)
/* 624B8 80071CB8 00000000 */  nop
/* 624BC 80071CBC 040040AC */  sw         $zero, 0x4($v0)
/* 624C0 80071CC0 C8A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x10)($gp)
/* 624C4 80071CC4 00010224 */  addiu      $v0, $zero, 0x100
/* 624C8 80071CC8 080062AC */  sw         $v0, 0x8($v1)
/* 624CC 80071CCC C8A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x10)($gp)
/* 624D0 80071CD0 000F0224 */  addiu      $v0, $zero, 0xF00
/* 624D4 80071CD4 0C0062AC */  sw         $v0, 0xC($v1)
/* 624D8 80071CD8 C8A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x10)($gp)
/* 624DC 80071CDC 00100224 */  addiu      $v0, $zero, 0x1000
/* 624E0 80071CE0 100062AC */  sw         $v0, 0x10($v1)
.L80071CE4:
/* 624E4 80071CE4 CCA4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x14)($gp)
/* 624E8 80071CE8 00000000 */  nop
/* 624EC 80071CEC 12004014 */  bnez       $v0, .L80071D38
/* 624F0 80071CF0 12000424 */   addiu     $a0, $zero, 0x12
/* 624F4 80071CF4 8140010C */  jal        MEMPACK_Malloc
/* 624F8 80071CF8 19000524 */   addiu     $a1, $zero, 0x19
/* 624FC 80071CFC 04000324 */  addiu      $v1, $zero, 0x4
/* 62500 80071D00 CCA482AF */  sw         $v0, %gp_rel(G2AlphaTables + 0x14)($gp)
/* 62504 80071D04 000043A4 */  sh         $v1, 0x0($v0)
/* 62508 80071D08 CCA4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x14)($gp)
/* 6250C 80071D0C 00000000 */  nop
/* 62510 80071D10 040040AC */  sw         $zero, 0x4($v0)
/* 62514 80071D14 CCA4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x14)($gp)
/* 62518 80071D18 80000224 */  addiu      $v0, $zero, 0x80
/* 6251C 80071D1C 080062AC */  sw         $v0, 0x8($v1)
/* 62520 80071D20 CCA4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x14)($gp)
/* 62524 80071D24 00020224 */  addiu      $v0, $zero, 0x200
/* 62528 80071D28 0C0062AC */  sw         $v0, 0xC($v1)
/* 6252C 80071D2C CCA4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x14)($gp)
/* 62530 80071D30 00100224 */  addiu      $v0, $zero, 0x1000
/* 62534 80071D34 100062AC */  sw         $v0, 0x10($v1)
.L80071D38:
/* 62538 80071D38 D0A4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x18)($gp)
/* 6253C 80071D3C 00000000 */  nop
/* 62540 80071D40 12004014 */  bnez       $v0, .L80071D8C
/* 62544 80071D44 12000424 */   addiu     $a0, $zero, 0x12
/* 62548 80071D48 8140010C */  jal        MEMPACK_Malloc
/* 6254C 80071D4C 19000524 */   addiu     $a1, $zero, 0x19
/* 62550 80071D50 04000324 */  addiu      $v1, $zero, 0x4
/* 62554 80071D54 D0A482AF */  sw         $v0, %gp_rel(G2AlphaTables + 0x18)($gp)
/* 62558 80071D58 000043A4 */  sh         $v1, 0x0($v0)
/* 6255C 80071D5C D0A4828F */  lw         $v0, %gp_rel(G2AlphaTables + 0x18)($gp)
/* 62560 80071D60 00000000 */  nop
/* 62564 80071D64 040040AC */  sw         $zero, 0x4($v0)
/* 62568 80071D68 D0A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x18)($gp)
/* 6256C 80071D6C 000E0224 */  addiu      $v0, $zero, 0xE00
/* 62570 80071D70 080062AC */  sw         $v0, 0x8($v1)
/* 62574 80071D74 D0A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x18)($gp)
/* 62578 80071D78 800F0224 */  addiu      $v0, $zero, 0xF80
/* 6257C 80071D7C 0C0062AC */  sw         $v0, 0xC($v1)
/* 62580 80071D80 D0A4838F */  lw         $v1, %gp_rel(G2AlphaTables + 0x18)($gp)
/* 62584 80071D84 00100224 */  addiu      $v0, $zero, 0x1000
/* 62588 80071D88 100062AC */  sw         $v0, 0x10($v1)
.L80071D8C:
/* 6258C 80071D8C 1000BF8F */  lw         $ra, 0x10($sp)
/* 62590 80071D90 00000000 */  nop
/* 62594 80071D94 0800E003 */  jr         $ra
/* 62598 80071D98 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationInit, . - G2EmulationInit
