.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_CheckTerrainAndRespond
/* 72024 80081824 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 72028 80081828 1400B1AF */  sw         $s1, 0x14($sp)
/* 7202C 8008182C 21888000 */  addu       $s1, $a0, $zero
/* 72030 80081830 1800BFAF */  sw         $ra, 0x18($sp)
/* 72034 80081834 2A06020C */  jal        MON_CheckTerrain
/* 72038 80081838 1000B0AF */   sw        $s0, 0x10($sp)
/* 7203C 8008183C 21804000 */  addu       $s0, $v0, $zero
/* 72040 80081840 10000232 */  andi       $v0, $s0, 0x10
/* 72044 80081844 05004010 */  beqz       $v0, .L8008185C
/* 72048 80081848 21202002 */   addu      $a0, $s1, $zero
/* 7204C 8008184C 0001053C */  lui        $a1, (0x100000C >> 16)
/* 72050 80081850 0C00A534 */  ori        $a1, $a1, (0x100000C & 0xFFFF)
/* 72054 80081854 A1D1000C */  jal        INSTANCE_Post
/* 72058 80081858 10000624 */   addiu     $a2, $zero, 0x10
.L8008185C:
/* 7205C 8008185C 20000232 */  andi       $v0, $s0, 0x20
/* 72060 80081860 05004010 */  beqz       $v0, .L80081878
/* 72064 80081864 21202002 */   addu      $a0, $s1, $zero
/* 72068 80081868 0001053C */  lui        $a1, (0x100000C >> 16)
/* 7206C 8008186C 0C00A534 */  ori        $a1, $a1, (0x100000C & 0xFFFF)
/* 72070 80081870 A1D1000C */  jal        INSTANCE_Post
/* 72074 80081874 20000624 */   addiu     $a2, $zero, 0x20
.L80081878:
/* 72078 80081878 40000232 */  andi       $v0, $s0, 0x40
/* 7207C 8008187C 05004010 */  beqz       $v0, .L80081894
/* 72080 80081880 21202002 */   addu      $a0, $s1, $zero
/* 72084 80081884 0001053C */  lui        $a1, (0x100000C >> 16)
/* 72088 80081888 0C00A534 */  ori        $a1, $a1, (0x100000C & 0xFFFF)
/* 7208C 8008188C A1D1000C */  jal        INSTANCE_Post
/* 72090 80081890 40000624 */   addiu     $a2, $zero, 0x40
.L80081894:
/* 72094 80081894 1800BF8F */  lw         $ra, 0x18($sp)
/* 72098 80081898 1400B18F */  lw         $s1, 0x14($sp)
/* 7209C 8008189C 1000B08F */  lw         $s0, 0x10($sp)
/* 720A0 800818A0 0800E003 */  jr         $ra
/* 720A4 800818A4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_CheckTerrainAndRespond, . - MON_CheckTerrainAndRespond
