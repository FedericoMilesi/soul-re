.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_GenericLineCheckSetup
/* 68880 80078080 0000E4A4 */  sh         $a0, 0x0($a3)
/* 68884 80078084 0200E5A4 */  sh         $a1, 0x2($a3)
/* 68888 80078088 0800E003 */  jr         $ra
/* 6888C 8007808C 0400E6A4 */   sh        $a2, 0x4($a3)
.size PHYSICS_GenericLineCheckSetup, . - PHYSICS_GenericLineCheckSetup
