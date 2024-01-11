.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformTGroupAttribute
/* 52C90 80062490 0C00A38C */  lw         $v1, 0xC($a1)
/* 52C94 80062494 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 52C98 80062498 1F006214 */  bne        $v1, $v0, .L80062518
/* 52C9C 8006249C 21200000 */   addu      $a0, $zero, $zero
/* 52CA0 800624A0 0C00A6AC */  sw         $a2, 0xC($a1)
/* 52CA4 800624A4 FBFFC324 */  addiu      $v1, $a2, -0x5
/* 52CA8 800624A8 2B00622C */  sltiu      $v0, $v1, 0x2B
/* 52CAC 800624AC 1A004010 */  beqz       $v0, .L80062518
/* 52CB0 800624B0 01000424 */   addiu     $a0, $zero, 0x1
/* 52CB4 800624B4 0180023C */  lui        $v0, %hi(jtbl_800103E8)
/* 52CB8 800624B8 E8034224 */  addiu      $v0, $v0, %lo(jtbl_800103E8)
/* 52CBC 800624BC 80180300 */  sll        $v1, $v1, 2
/* 52CC0 800624C0 21186200 */  addu       $v1, $v1, $v0
/* 52CC4 800624C4 0000628C */  lw         $v0, 0x0($v1)
/* 52CC8 800624C8 00000000 */  nop
/* 52CCC 800624CC 08004000 */  jr         $v0
/* 52CD0 800624D0 00000000 */   nop
jlabel .L800624D4
/* 52CD4 800624D4 0F00E010 */  beqz       $a3, .L80062514
/* 52CD8 800624D8 0200E724 */   addiu     $a3, $a3, 0x2
/* 52CDC 800624DC 02000224 */  addiu      $v0, $zero, 0x2
/* 52CE0 800624E0 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 52CE4 800624E4 0000E294 */  lhu        $v0, 0x0($a3)
/* 52CE8 800624E8 00000000 */  nop
/* 52CEC 800624EC 1000A2A4 */  sh         $v0, 0x10($a1)
/* 52CF0 800624F0 0200E294 */  lhu        $v0, 0x2($a3)
/* 52CF4 800624F4 45890108 */  j          .L80062514
/* 52CF8 800624F8 1200A2A4 */   sh        $v0, 0x12($a1)
jlabel .L800624FC
/* 52CFC 800624FC 0500E010 */  beqz       $a3, .L80062514
/* 52D00 80062500 01000224 */   addiu     $v0, $zero, 0x1
/* 52D04 80062504 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 52D08 80062508 0200E294 */  lhu        $v0, 0x2($a3)
/* 52D0C 8006250C 00000000 */  nop
/* 52D10 80062510 1000A2A4 */  sh         $v0, 0x10($a1)
.L80062514:
/* 52D14 80062514 01000424 */  addiu      $a0, $zero, 0x1
jlabel .L80062518
/* 52D18 80062518 0800E003 */  jr         $ra
/* 52D1C 8006251C 21108000 */   addu      $v0, $a0, $zero
.size EVENT_TransformTGroupAttribute, . - EVENT_TransformTGroupAttribute
