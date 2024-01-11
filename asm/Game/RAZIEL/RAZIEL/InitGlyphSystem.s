.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitGlyphSystem
/* A44E0 800B3CE0 0D80023C */  lui        $v0, %hi(objectAccess + 0xA4)
/* A44E4 800B3CE4 E0A2458C */  lw         $a1, %lo(objectAccess + 0xA4)($v0)
/* A44E8 800B3CE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A44EC 800B3CEC 0600A010 */  beqz       $a1, .L800B3D08
/* A44F0 800B3CF0 1000BFAF */   sw        $ra, 0x10($sp)
/* A44F4 800B3CF4 ACCF000C */  jal        INSTANCE_BirthObject
/* A44F8 800B3CF8 21300000 */   addu      $a2, $zero, $zero
/* A44FC 800B3CFC 02004010 */  beqz       $v0, .L800B3D08
/* A4500 800B3D00 00000000 */   nop
/* A4504 800B3D04 3CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x40C)($gp)
.L800B3D08:
/* A4508 800B3D08 1000BF8F */  lw         $ra, 0x10($sp)
/* A450C 800B3D0C 00000000 */  nop
/* A4510 800B3D10 0800E003 */  jr         $ra
/* A4514 800B3D14 1800BD27 */   addiu     $sp, $sp, 0x18
.size InitGlyphSystem, . - InitGlyphSystem
