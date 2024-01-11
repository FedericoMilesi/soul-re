.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_InitLoader
/* 5079C 8005FF9C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 507A0 8005FFA0 1000BFAF */  sw         $ra, 0x10($sp)
/* 507A4 8005FFA4 B5DE000C */  jal        LOAD_InitCdLoader
/* 507A8 8005FFA8 00000000 */   nop
/* 507AC 8005FFAC 26000524 */  addiu      $a1, $zero, 0x26
/* 507B0 8005FFB0 0E80023C */  lui        $v0, %hi(LoadQueue)
/* 507B4 8005FFB4 84A94224 */  addiu      $v0, $v0, %lo(LoadQueue)
/* 507B8 8005FFB8 A0104424 */  addiu      $a0, $v0, 0x10A0
/* 507BC 8005FFBC 10114324 */  addiu      $v1, $v0, 0x1110
/* 507C0 8005FFC0 40CB82AF */  sw         $v0, %gp_rel(loadFree)($gp)
/* 507C4 8005FFC4 44CB80AF */  sw         $zero, %gp_rel(loadHead)($gp)
/* 507C8 8005FFC8 48CB80AF */  sw         $zero, %gp_rel(loadTail)($gp)
/* 507CC 8005FFCC 4CCB80AF */  sw         $zero, %gp_rel(numLoads)($gp)
.L8005FFD0:
/* 507D0 8005FFD0 000083AC */  sw         $v1, 0x0($a0)
/* 507D4 8005FFD4 90FF8424 */  addiu      $a0, $a0, -0x70
/* 507D8 8005FFD8 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 507DC 8005FFDC FCFFA104 */  bgez       $a1, .L8005FFD0
/* 507E0 8005FFE0 90FF6324 */   addiu     $v1, $v1, -0x70
/* 507E4 8005FFE4 1000BF8F */  lw         $ra, 0x10($sp)
/* 507E8 8005FFE8 0E80023C */  lui        $v0, %hi(LoadQueue + 0x1110)
/* 507EC 8005FFEC 94BA40AC */  sw         $zero, %lo(LoadQueue + 0x1110)($v0)
/* 507F0 8005FFF0 0800E003 */  jr         $ra
/* 507F4 8005FFF4 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_InitLoader, . - STREAM_InitLoader
