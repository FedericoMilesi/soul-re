.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_HideAllCloudCovers
/* 4FD9C 8005F59C 0D80023C */  lui        $v0, %hi(objectAccess + 0xBC)
/* 4FDA0 8005F5A0 F8A2458C */  lw         $a1, %lo(objectAccess + 0xBC)($v0)
/* 4FDA4 8005F5A4 00000000 */  nop
/* 4FDA8 8005F5A8 1200A010 */  beqz       $a1, .L8005F5F4
/* 4FDAC 8005F5AC 00000000 */   nop
/* 4FDB0 8005F5B0 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4FDB4 8005F5B4 00000000 */  nop
/* 4FDB8 8005F5B8 0400438C */  lw         $v1, 0x4($v0)
/* 4FDBC 8005F5BC 00000000 */  nop
/* 4FDC0 8005F5C0 0C006010 */  beqz       $v1, .L8005F5F4
/* 4FDC4 8005F5C4 00000000 */   nop
.L8005F5C8:
/* 4FDC8 8005F5C8 1C00628C */  lw         $v0, 0x1C($v1)
/* 4FDCC 8005F5CC 0800648C */  lw         $a0, 0x8($v1)
/* 4FDD0 8005F5D0 05004514 */  bne        $v0, $a1, .L8005F5E8
/* 4FDD4 8005F5D4 00000000 */   nop
/* 4FDD8 8005F5D8 1400628C */  lw         $v0, 0x14($v1)
/* 4FDDC 8005F5DC 00000000 */  nop
/* 4FDE0 8005F5E0 00084234 */  ori        $v0, $v0, 0x800
/* 4FDE4 8005F5E4 140062AC */  sw         $v0, 0x14($v1)
.L8005F5E8:
/* 4FDE8 8005F5E8 21188000 */  addu       $v1, $a0, $zero
/* 4FDEC 8005F5EC F6FF6014 */  bnez       $v1, .L8005F5C8
/* 4FDF0 8005F5F0 00000000 */   nop
.L8005F5F4:
/* 4FDF4 8005F5F4 0800E003 */  jr         $ra
/* 4FDF8 8005F5F8 00000000 */   nop
.size WARPGATE_HideAllCloudCovers, . - WARPGATE_HideAllCloudCovers
