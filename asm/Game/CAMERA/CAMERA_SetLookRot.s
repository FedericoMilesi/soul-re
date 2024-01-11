.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetLookRot
/* C3A0 8001BBA0 140485A4 */  sh         $a1, 0x414($a0)
/* C3A4 8001BBA4 0800E003 */  jr         $ra
/* C3A8 8001BBA8 180486A4 */   sh        $a2, 0x418($a0)
.size CAMERA_SetLookRot, . - CAMERA_SetLookRot
