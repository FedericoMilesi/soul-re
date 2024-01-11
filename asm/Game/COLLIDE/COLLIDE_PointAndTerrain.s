.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_PointAndTerrain
/* FC54 8001F454 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* FC58 8001F458 1800A6AF */  sw         $a2, 0x18($sp)
/* FC5C 8001F45C 21300000 */  addu       $a2, $zero, $zero
/* FC60 8001F460 2138C000 */  addu       $a3, $a2, $zero
/* FC64 8001F464 2000BFAF */  sw         $ra, 0x20($sp)
/* FC68 8001F468 1000A0AF */  sw         $zero, 0x10($sp)
/* FC6C 8001F46C 217D000C */  jal        COLLIDE_PointAndTerrainFunc
/* FC70 8001F470 1400A0AF */   sw        $zero, 0x14($sp)
/* FC74 8001F474 2000BF8F */  lw         $ra, 0x20($sp)
/* FC78 8001F478 00000000 */  nop
/* FC7C 8001F47C 0800E003 */  jr         $ra
/* FC80 8001F480 2800BD27 */   addiu     $sp, $sp, 0x28
.size COLLIDE_PointAndTerrain, . - COLLIDE_PointAndTerrain
