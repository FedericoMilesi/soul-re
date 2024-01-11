.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_GarbageCollectFree
/* 410B0 800508B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 410B4 800508B4 1000B0AF */  sw         $s0, 0x10($sp)
/* 410B8 800508B8 21808000 */  addu       $s0, $a0, $zero
/* 410BC 800508BC 1400BFAF */  sw         $ra, 0x14($sp)
/* 410C0 800508C0 020000A2 */  sb         $zero, 0x2($s0)
/* 410C4 800508C4 030000A2 */  sb         $zero, 0x3($s0)
/* 410C8 800508C8 F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 410CC 800508CC 0400038E */  lw         $v1, 0x4($s0)
/* 410D0 800508D0 00000000 */  nop
/* 410D4 800508D4 23104300 */  subu       $v0, $v0, $v1
/* 410D8 800508D8 F8C682AF */  sw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 410DC 800508DC 0400028E */  lw         $v0, 0x4($s0)
/* 410E0 800508E0 00000000 */  nop
/* 410E4 800508E4 21180202 */  addu       $v1, $s0, $v0
/* 410E8 800508E8 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 410EC 800508EC 00000000 */  nop
/* 410F0 800508F0 03006210 */  beq        $v1, $v0, .L80050900
/* 410F4 800508F4 00000000 */   nop
/* 410F8 800508F8 F340010C */  jal        MEMORY_MergeAddresses
/* 410FC 800508FC 21286000 */   addu      $a1, $v1, $zero
.L80050900:
/* 41100 80050900 21180002 */  addu       $v1, $s0, $zero
/* 41104 80050904 F8C68227 */  addiu      $v0, $gp, %gp_rel(newMemTracker + 0x8)
/* 41108 80050908 F8FF508C */  lw         $s0, -0x8($v0)
/* 4110C 8005090C FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 41110 80050910 00000000 */  nop
/* 41114 80050914 0E000212 */  beq        $s0, $v0, .L80050950
/* 41118 80050918 00000000 */   nop
.L8005091C:
/* 4111C 8005091C 0400028E */  lw         $v0, 0x4($s0)
/* 41120 80050920 00000000 */  nop
/* 41124 80050924 21280202 */  addu       $a1, $s0, $v0
/* 41128 80050928 0500A314 */  bne        $a1, $v1, .L80050940
/* 4112C 8005092C 00000000 */   nop
/* 41130 80050930 F340010C */  jal        MEMORY_MergeAddresses
/* 41134 80050934 21200002 */   addu      $a0, $s0, $zero
/* 41138 80050938 54420108 */  j          .L80050950
/* 4113C 8005093C 00000000 */   nop
.L80050940:
/* 41140 80050940 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 41144 80050944 2180A000 */  addu       $s0, $a1, $zero
/* 41148 80050948 F4FF0216 */  bne        $s0, $v0, .L8005091C
/* 4114C 8005094C 00000000 */   nop
.L80050950:
/* 41150 80050950 1400BF8F */  lw         $ra, 0x14($sp)
/* 41154 80050954 1000B08F */  lw         $s0, 0x10($sp)
/* 41158 80050958 0800E003 */  jr         $ra
/* 4115C 8005095C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MEMPACK_GarbageCollectFree, . - MEMPACK_GarbageCollectFree
