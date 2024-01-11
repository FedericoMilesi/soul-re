.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strncmp
/* AA8F4 800BA0F4 03008010 */  beqz       $a0, .L800BA104
/* AA8F8 800BA0F8 00000000 */   nop
/* AA8FC 800BA0FC 0700A014 */  bnez       $a1, .L800BA11C
/* AA900 800BA100 00000000 */   nop
.L800BA104:
/* AA904 800BA104 19008510 */  beq        $a0, $a1, .L800BA16C
/* AA908 800BA108 21100000 */   addu      $v0, $zero, $zero
/* AA90C 800BA10C 17008010 */  beqz       $a0, .L800BA16C
/* AA910 800BA110 FFFF0224 */   addiu     $v0, $zero, -0x1
/* AA914 800BA114 5BE80208 */  j          .L800BA16C
/* AA918 800BA118 01000224 */   addiu     $v0, $zero, 0x1
.L800BA11C:
/* AA91C 800BA11C FFFFC624 */  addiu      $a2, $a2, -0x1
/* AA920 800BA120 1200C004 */  bltz       $a2, .L800BA16C
/* AA924 800BA124 21100000 */   addu      $v0, $zero, $zero
.L800BA128:
/* AA928 800BA128 00008380 */  lb         $v1, 0x0($a0)
/* AA92C 800BA12C 0000A280 */  lb         $v0, 0x0($a1)
/* AA930 800BA130 00000000 */  nop
/* AA934 800BA134 06006214 */  bne        $v1, $v0, .L800BA150
/* AA938 800BA138 0100A524 */   addiu     $a1, $a1, 0x1
/* AA93C 800BA13C 0A006010 */  beqz       $v1, .L800BA168
/* AA940 800BA140 01008424 */   addiu     $a0, $a0, 0x1
/* AA944 800BA144 FFFFC624 */  addiu      $a2, $a2, -0x1
/* AA948 800BA148 F7FFC104 */  bgez       $a2, .L800BA128
/* AA94C 800BA14C 00000000 */   nop
.L800BA150:
/* AA950 800BA150 0500C004 */  bltz       $a2, .L800BA168
/* AA954 800BA154 00000000 */   nop
/* AA958 800BA158 00008380 */  lb         $v1, 0x0($a0)
/* AA95C 800BA15C FFFFA280 */  lb         $v0, -0x1($a1)
/* AA960 800BA160 5BE80208 */  j          .L800BA16C
/* AA964 800BA164 23106200 */   subu      $v0, $v1, $v0
.L800BA168:
/* AA968 800BA168 21100000 */  addu       $v0, $zero, $zero
.L800BA16C:
/* AA96C 800BA16C 0800E003 */  jr         $ra
/* AA970 800BA170 00000000 */   nop
.size strncmp, . - strncmp
