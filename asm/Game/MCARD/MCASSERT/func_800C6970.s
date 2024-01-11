.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C6970
/* B7170 800C6970 0D80053C */  lui        $a1, %hi(_spu_RXX + 0x10)
/* B7174 800C6974 6CEDA58C */  lw         $a1, %lo(_spu_RXX + 0x10)($a1)
/* B7178 800C6978 F8FF033C */  lui        $v1, (0xFFF8FFFF >> 16)
/* B717C 800C697C 0000A28C */  lw         $v0, 0x0($a1)
/* B7180 800C6980 FFFF6334 */  ori        $v1, $v1, (0xFFF8FFFF & 0xFFFF)
/* B7184 800C6984 24104300 */  and        $v0, $v0, $v1
/* B7188 800C6988 07008010 */  beqz       $a0, .L800C69A8
/* B718C 800C698C 0000A2AC */   sw        $v0, 0x0($a1)
/* B7190 800C6990 0D80023C */  lui        $v0, %hi(_spu_RXX + 0x10)
/* B7194 800C6994 6CED428C */  lw         $v0, %lo(_spu_RXX + 0x10)($v0)
/* B7198 800C6998 00000000 */  nop
/* B719C 800C699C 0000438C */  lw         $v1, 0x0($v0)
/* B71A0 800C69A0 6F1A0308 */  j          .L800C69BC
/* B71A4 800C69A4 0300043C */   lui       $a0, (0x30000 >> 16)
.L800C69A8:
/* B71A8 800C69A8 0D80023C */  lui        $v0, %hi(_spu_RXX + 0x10)
/* B71AC 800C69AC 6CED428C */  lw         $v0, %lo(_spu_RXX + 0x10)($v0)
/* B71B0 800C69B0 00000000 */  nop
/* B71B4 800C69B4 0000438C */  lw         $v1, 0x0($v0)
/* B71B8 800C69B8 0500043C */  lui        $a0, (0x50000 >> 16)
.L800C69BC:
/* B71BC 800C69BC 25186400 */  or         $v1, $v1, $a0
/* B71C0 800C69C0 0800E003 */  jr         $ra
/* B71C4 800C69C4 000043AC */   sw        $v1, 0x0($v0)
.size func_800C6970, . - func_800C6970
