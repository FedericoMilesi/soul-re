.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_ChangeTo
/* 7878 80017078 0800E003 */  jr         $ra
/* 787C 8001707C C80185AC */   sw        $a1, 0x1C8($a0)
.size CAMERA_ChangeTo, . - CAMERA_ChangeTo
