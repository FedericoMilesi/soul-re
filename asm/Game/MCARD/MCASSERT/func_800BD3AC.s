.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD3AC
/* ADBAC 800BD3AC FFFF8330 */  andi       $v1, $a0, 0xFFFF
/* ADBB0 800BD3B0 03006228 */  slti       $v0, $v1, 0x3
/* ADBB4 800BD3B4 08004010 */  beqz       $v0, .L800BD3D8
/* ADBB8 800BD3B8 00190300 */   sll       $v1, $v1, 4
/* ADBBC 800BD3BC 0D80023C */  lui        $v0, %hi(ratan_tbl + 0x814)
/* ADBC0 800BD3C0 90E3428C */  lw         $v0, %lo(ratan_tbl + 0x814)($v0)
/* ADBC4 800BD3C4 00000000 */  nop
/* ADBC8 800BD3C8 21186200 */  addu       $v1, $v1, $v0
/* ADBCC 800BD3CC 00006294 */  lhu        $v0, 0x0($v1)
/* ADBD0 800BD3D0 F7F40208 */  j          .L800BD3DC
/* ADBD4 800BD3D4 00000000 */   nop
.L800BD3D8:
/* ADBD8 800BD3D8 21100000 */  addu       $v0, $zero, $zero
.L800BD3DC:
/* ADBDC 800BD3DC 0800E003 */  jr         $ra
/* ADBE0 800BD3E0 00000000 */   nop
.size func_800BD3AC, . - func_800BD3AC
