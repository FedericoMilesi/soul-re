.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel rand
/* AD0E8 800BC8E8 C641033C */  lui        $v1, (0x41C64E6D >> 16)
/* AD0EC 800BC8EC 0E80023C */  lui        $v0, %hi(GsOUT_PACKET_P_dup1)
/* AD0F0 800BC8F0 68D6428C */  lw         $v0, %lo(GsOUT_PACKET_P_dup1)($v0)
/* AD0F4 800BC8F4 6D4E6334 */  ori        $v1, $v1, (0x41C64E6D & 0xFFFF)
/* AD0F8 800BC8F8 18004300 */  mult       $v0, $v1
/* AD0FC 800BC8FC 12200000 */  mflo       $a0
/* AD100 800BC900 39308224 */  addiu      $v0, $a0, 0x3039
/* AD104 800BC904 0E80013C */  lui        $at, %hi(GsOUT_PACKET_P_dup1)
/* AD108 800BC908 68D622AC */  sw         $v0, %lo(GsOUT_PACKET_P_dup1)($at)
/* AD10C 800BC90C 02140200 */  srl        $v0, $v0, 16
/* AD110 800BC910 0800E003 */  jr         $ra
/* AD114 800BC914 FF7F4230 */   andi      $v0, $v0, 0x7FFF
.size rand, . - rand
