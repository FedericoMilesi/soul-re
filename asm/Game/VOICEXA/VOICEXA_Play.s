.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VOICEXA_Play
/* A78B4 800B70B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A78B8 800B70B8 21388000 */  addu       $a3, $a0, $zero
/* A78BC 800B70BC F0FE8427 */  addiu      $a0, $gp, %gp_rel(voiceTracker)
/* A78C0 800B70C0 03110700 */  sra        $v0, $a3, 4
/* A78C4 800B70C4 80100200 */  sll        $v0, $v0, 2
/* A78C8 800B70C8 B0004224 */  addiu      $v0, $v0, 0xB0
/* A78CC 800B70CC 21304400 */  addu       $a2, $v0, $a0
/* A78D0 800B70D0 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* A78D4 800B70D4 0800033C */  lui        $v1, (0x80000 >> 16)
/* A78D8 800B70D8 24104300 */  and        $v0, $v0, $v1
/* A78DC 800B70DC 22004010 */  beqz       $v0, .L800B7168
/* A78E0 800B70E0 1000BFAF */   sw        $ra, 0x10($sp)
/* A78E4 800B70E4 0000C28C */  lw         $v0, 0x0($a2)
/* A78E8 800B70E8 00000000 */  nop
/* A78EC 800B70EC 1E004010 */  beqz       $v0, .L800B7168
/* A78F0 800B70F0 00000000 */   nop
/* A78F4 800B70F4 8ABF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C2)($gp)
/* A78F8 800B70F8 00000000 */  nop
/* A78FC 800B70FC 1A004010 */  beqz       $v0, .L800B7168
/* A7900 800B7100 00000000 */   nop
/* A7904 800B7104 1500A010 */  beqz       $a1, .L800B715C
/* A7908 800B7108 00000000 */   nop
/* A790C 800B710C A3008290 */  lbu        $v0, 0xA3($a0)
/* A7910 800B7110 00000000 */  nop
/* A7914 800B7114 40100200 */  sll        $v0, $v0, 1
/* A7918 800B7118 21104400 */  addu       $v0, $v0, $a0
/* A791C 800B711C 580047A4 */  sh         $a3, 0x58($v0)
/* A7920 800B7120 A5008390 */  lbu        $v1, 0xA5($a0)
/* A7924 800B7124 00000000 */  nop
/* A7928 800B7128 0300622C */  sltiu      $v0, $v1, 0x3
/* A792C 800B712C 0E004010 */  beqz       $v0, .L800B7168
/* A7930 800B7130 01006324 */   addiu     $v1, $v1, 0x1
/* A7934 800B7134 A3008290 */  lbu        $v0, 0xA3($a0)
/* A7938 800B7138 A50083A0 */  sb         $v1, 0xA5($a0)
/* A793C 800B713C 04000324 */  addiu      $v1, $zero, 0x4
/* A7940 800B7140 01004224 */  addiu      $v0, $v0, 0x1
/* A7944 800B7144 A30082A0 */  sb         $v0, 0xA3($a0)
/* A7948 800B7148 FF004230 */  andi       $v0, $v0, 0xFF
/* A794C 800B714C 06004314 */  bne        $v0, $v1, .L800B7168
/* A7950 800B7150 00000000 */   nop
/* A7954 800B7154 5ADC0208 */  j          .L800B7168
/* A7958 800B7158 A30080A0 */   sb        $zero, 0xA3($a0)
.L800B715C:
/* A795C 800B715C 21280000 */  addu       $a1, $zero, $zero
/* A7960 800B7160 51DB020C */  jal        putVoiceCommand
/* A7964 800B7164 01000624 */   addiu     $a2, $zero, 0x1
.L800B7168:
/* A7968 800B7168 1000BF8F */  lw         $ra, 0x10($sp)
/* A796C 800B716C 00000000 */  nop
/* A7970 800B7170 0800E003 */  jr         $ra
/* A7974 800B7174 1800BD27 */   addiu     $sp, $sp, 0x18
.size VOICEXA_Play, . - VOICEXA_Play
