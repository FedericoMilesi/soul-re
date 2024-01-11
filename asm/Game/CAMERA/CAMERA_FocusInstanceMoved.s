.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_FocusInstanceMoved
/* E388 8001DB88 12018384 */  lh         $v1, 0x112($a0)
/* E38C 8001DB8C 0C018284 */  lh         $v0, 0x10C($a0)
/* E390 8001DB90 00000000 */  nop
/* E394 8001DB94 15006214 */  bne        $v1, $v0, .L8001DBEC
/* E398 8001DB98 21280000 */   addu      $a1, $zero, $zero
/* E39C 8001DB9C 14018384 */  lh         $v1, 0x114($a0)
/* E3A0 8001DBA0 0E018284 */  lh         $v0, 0x10E($a0)
/* E3A4 8001DBA4 00000000 */  nop
/* E3A8 8001DBA8 10006214 */  bne        $v1, $v0, .L8001DBEC
/* E3AC 8001DBAC 00000000 */   nop
/* E3B0 8001DBB0 16018384 */  lh         $v1, 0x116($a0)
/* E3B4 8001DBB4 10018284 */  lh         $v0, 0x110($a0)
/* E3B8 8001DBB8 00000000 */  nop
/* E3BC 8001DBBC 0B006214 */  bne        $v1, $v0, .L8001DBEC
/* E3C0 8001DBC0 00000000 */   nop
/* E3C4 8001DBC4 2001838C */  lw         $v1, 0x120($a0)
/* E3C8 8001DBC8 1801828C */  lw         $v0, 0x118($a0)
/* E3CC 8001DBCC 00000000 */  nop
/* E3D0 8001DBD0 06006214 */  bne        $v1, $v0, .L8001DBEC
/* E3D4 8001DBD4 00000000 */   nop
/* E3D8 8001DBD8 24018384 */  lh         $v1, 0x124($a0)
/* E3DC 8001DBDC 1C018284 */  lh         $v0, 0x11C($a0)
/* E3E0 8001DBE0 00000000 */  nop
/* E3E4 8001DBE4 02006210 */  beq        $v1, $v0, .L8001DBF0
/* E3E8 8001DBE8 00000000 */   nop
.L8001DBEC:
/* E3EC 8001DBEC 01000524 */  addiu      $a1, $zero, 0x1
.L8001DBF0:
/* E3F0 8001DBF0 0800E003 */  jr         $ra
/* E3F4 8001DBF4 2110A000 */   addu      $v0, $a1, $zero
.size CAMERA_FocusInstanceMoved, . - CAMERA_FocusInstanceMoved
