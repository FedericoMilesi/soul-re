.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_WanderEntry
/* 7EBD4 8008E3D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7EBD8 8008E3D8 1000BFAF */  sw         $ra, 0x10($sp)
/* 7EBDC 8008E3DC 6C01868C */  lw         $a2, 0x16C($a0)
/* 7EBE0 8008E3E0 0A000224 */  addiu      $v0, $zero, 0xA
/* 7EBE4 8008E3E4 8C0182AC */  sw         $v0, 0x18C($a0)
/* 7EBE8 8008E3E8 900182AC */  sw         $v0, 0x190($a0)
/* 7EBEC 8008E3EC 11000224 */  addiu      $v0, $zero, 0x11
/* 7EBF0 8008E3F0 940182AC */  sw         $v0, 0x194($a0)
/* 7EBF4 8008E3F4 0000C28C */  lw         $v0, 0x0($a2)
/* 7EBF8 8008E3F8 0400033C */  lui        $v1, (0x40000 >> 16)
/* 7EBFC 8008E3FC 24104300 */  and        $v0, $v0, $v1
/* 7EC00 8008E400 0C004014 */  bnez       $v0, .L8008E434
/* 7EC04 8008E404 00000000 */   nop
/* 7EC08 8008E408 2000858C */  lw         $a1, 0x20($a0)
/* 7EC0C 8008E40C 00000000 */  nop
/* 7EC10 8008E410 0400A010 */  beqz       $a1, .L8008E424
/* 7EC14 8008E414 2000A524 */   addiu     $a1, $a1, 0x20
/* 7EC18 8008E418 3A01C684 */  lh         $a2, 0x13A($a2)
/* 7EC1C 8008E41C 0B390208 */  j          .L8008E42C
/* 7EC20 8008E420 00000000 */   nop
.L8008E424:
/* 7EC24 8008E424 3A01C684 */  lh         $a2, 0x13A($a2)
/* 7EC28 8008E428 5C008524 */  addiu      $a1, $a0, 0x5C
.L8008E42C:
/* 7EC2C 8008E42C D803020C */  jal        MON_GetRandomDestinationInWorld
/* 7EC30 8008E430 00000000 */   nop
.L8008E434:
/* 7EC34 8008E434 1000BF8F */  lw         $ra, 0x10($sp)
/* 7EC38 8008E438 00000000 */  nop
/* 7EC3C 8008E43C 0800E003 */  jr         $ra
/* 7EC40 8008E440 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUL_WanderEntry, . - SOUL_WanderEntry
