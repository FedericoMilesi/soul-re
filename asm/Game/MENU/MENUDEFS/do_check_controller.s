.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel do_check_controller
/* A8DF0 800B85F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8DF4 800B85F4 1000BFAF */  sw         $ra, 0x10($sp)
/* A8DF8 800B85F8 72018384 */  lh         $v1, 0x172($a0)
/* A8DFC 800B85FC 06000224 */  addiu      $v0, $zero, 0x6
/* A8E00 800B8600 02006214 */  bne        $v1, $v0, .L800B860C
/* A8E04 800B8604 C8000424 */   addiu     $a0, $zero, 0xC8
/* A8E08 800B8608 AA000424 */  addiu      $a0, $zero, 0xAA
.L800B860C:
/* A8E0C 800B860C E9C7000C */  jal        GAMEPAD_DisplayControllerStatus
/* A8E10 800B8610 00000000 */   nop
/* A8E14 800B8614 1000BF8F */  lw         $ra, 0x10($sp)
/* A8E18 800B8618 00000000 */  nop
/* A8E1C 800B861C 0800E003 */  jr         $ra
/* A8E20 800B8620 1800BD27 */   addiu     $sp, $sp, 0x18
.size do_check_controller, . - do_check_controller
