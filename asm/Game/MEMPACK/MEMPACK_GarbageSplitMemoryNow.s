.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_GarbageSplitMemoryNow
/* 4108C 8005088C 0600E010 */  beqz       $a3, .L800508A8
/* 41090 80050890 2110A400 */   addu      $v0, $a1, $a0
/* 41094 80050894 DEBA0334 */  ori        $v1, $zero, 0xBADE
/* 41098 80050898 000043A4 */  sh         $v1, 0x0($v0)
/* 4109C 8005089C 020040A0 */  sb         $zero, 0x2($v0)
/* 410A0 800508A0 030040A0 */  sb         $zero, 0x3($v0)
/* 410A4 800508A4 040047AC */  sw         $a3, 0x4($v0)
.L800508A8:
/* 410A8 800508A8 0800E003 */  jr         $ra
/* 410AC 800508AC 00000000 */   nop
.size MEMPACK_GarbageSplitMemoryNow, . - MEMPACK_GarbageSplitMemoryNow
