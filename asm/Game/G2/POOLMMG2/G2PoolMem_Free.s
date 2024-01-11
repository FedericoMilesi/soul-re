.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2PoolMem_Free
/* 867E0 80095FE0 0C00838C */  lw         $v1, 0xC($a0)
/* 867E4 80095FE4 00008294 */  lhu        $v0, 0x0($a0)
/* 867E8 80095FE8 2328A300 */  subu       $a1, $a1, $v1
/* 867EC 80095FEC 1A00A200 */  div        $zero, $a1, $v0
/* 867F0 80095FF0 12280000 */  mflo       $a1
/* 867F4 80095FF4 02008294 */  lhu        $v0, 0x2($a0)
/* 867F8 80095FF8 0800838C */  lw         $v1, 0x8($a0)
/* 867FC 80095FFC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 86800 80096000 020082A4 */  sh         $v0, 0x2($a0)
/* 86804 80096004 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 86808 80096008 40100200 */  sll        $v0, $v0, 1
/* 8680C 8009600C 21104300 */  addu       $v0, $v0, $v1
/* 86810 80096010 0800E003 */  jr         $ra
/* 86814 80096014 000045A4 */   sh        $a1, 0x0($v0)
.size G2PoolMem_Free, . - G2PoolMem_Free
