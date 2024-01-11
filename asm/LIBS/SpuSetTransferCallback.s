.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetTransferCallback
/* B0790 800BFF90 0D80023C */  lui        $v0, %hi(_spu_transferCallback)
/* B0794 800BFF94 94ED428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
/* B0798 800BFF98 00000000 */  nop
/* B079C 800BFF9C 03008210 */  beq        $a0, $v0, .L800BFFAC
/* B07A0 800BFFA0 00000000 */   nop
/* B07A4 800BFFA4 0D80013C */  lui        $at, %hi(_spu_transferCallback)
/* B07A8 800BFFA8 94ED24AC */  sw         $a0, %lo(_spu_transferCallback)($at)
.L800BFFAC:
/* B07AC 800BFFAC 0800E003 */  jr         $ra
/* B07B0 800BFFB0 00000000 */   nop
/* B07B4 800BFFB4 00000000 */  nop
/* B07B8 800BFFB8 00000000 */  nop
/* B07BC 800BFFBC 00000000 */  nop
.size SpuSetTransferCallback, . - SpuSetTransferCallback
