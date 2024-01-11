.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UpdateZoneDelta
/* 9286C 800A206C 0B00A010 */  beqz       $a1, .L800A209C
/* 92870 800A2070 00000000 */   nop
/* 92874 800A2074 0800A414 */  bne        $a1, $a0, .L800A2098
/* 92878 800A2078 00010224 */   addiu     $v0, $zero, 0x100
/* 9287C 800A207C 80A7828F */  lw         $v0, %gp_rel(ZoneDelta)($gp)
/* 92880 800A2080 00000000 */  nop
/* 92884 800A2084 FCFF4224 */  addiu      $v0, $v0, -0x4
/* 92888 800A2088 80A782AF */  sw         $v0, %gp_rel(ZoneDelta)($gp)
/* 9288C 800A208C 10004228 */  slti       $v0, $v0, 0x10
/* 92890 800A2090 02004010 */  beqz       $v0, .L800A209C
/* 92894 800A2094 10000224 */   addiu     $v0, $zero, 0x10
.L800A2098:
/* 92898 800A2098 80A782AF */  sw         $v0, %gp_rel(ZoneDelta)($gp)
.L800A209C:
/* 9289C 800A209C 80A7828F */  lw         $v0, %gp_rel(ZoneDelta)($gp)
/* 928A0 800A20A0 0800E003 */  jr         $ra
/* 928A4 800A20A4 00000000 */   nop
.size UpdateZoneDelta, . - UpdateZoneDelta
