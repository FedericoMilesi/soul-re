.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strcpy
/* AD870 800BD070 0E008010 */  beqz       $a0, .L800BD0AC
/* AD874 800BD074 21100000 */   addu      $v0, $zero, $zero
/* AD878 800BD078 0C00A010 */  beqz       $a1, .L800BD0AC
/* AD87C 800BD07C 21188000 */   addu      $v1, $a0, $zero
/* AD880 800BD080 0000A290 */  lbu        $v0, 0x0($a1)
/* AD884 800BD084 0100A524 */  addiu      $a1, $a1, 0x1
/* AD888 800BD088 01006424 */  addiu      $a0, $v1, 0x1
/* AD88C 800BD08C 06004010 */  beqz       $v0, .L800BD0A8
/* AD890 800BD090 000062A0 */   sb        $v0, 0x0($v1)
.L800BD094:
/* AD894 800BD094 0000A290 */  lbu        $v0, 0x0($a1)
/* AD898 800BD098 0100A524 */  addiu      $a1, $a1, 0x1
/* AD89C 800BD09C 000082A0 */  sb         $v0, 0x0($a0)
/* AD8A0 800BD0A0 FCFF4014 */  bnez       $v0, .L800BD094
/* AD8A4 800BD0A4 01008424 */   addiu     $a0, $a0, 0x1
.L800BD0A8:
/* AD8A8 800BD0A8 21106000 */  addu       $v0, $v1, $zero
.L800BD0AC:
/* AD8AC 800BD0AC 0800E003 */  jr         $ra
/* AD8B0 800BD0B0 00000000 */   nop
/* AD8B4 800BD0B4 00000000 */  nop
/* AD8B8 800BD0B8 00000000 */  nop
/* AD8BC 800BD0BC 00000000 */  nop
.size strcpy, . - strcpy
