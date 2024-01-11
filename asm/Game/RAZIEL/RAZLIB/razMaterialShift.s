.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razMaterialShift
/* 95F8C 800A578C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 95F90 800A5790 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 95F94 800A5794 02000224 */  addiu      $v0, $zero, 0x2
/* 95F98 800A5798 2A006214 */  bne        $v1, $v0, .L800A5844
/* 95F9C 800A579C 1000BFAF */   sw        $ra, 0x10($sp)
/* 95FA0 800A57A0 0100033C */  lui        $v1, (0x186A0 >> 16)
/* 95FA4 800A57A4 2CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95FA8 800A57A8 A0866334 */  ori        $v1, $v1, (0x186A0 & 0xFFFF)
/* 95FAC 800A57AC 25004314 */  bne        $v0, $v1, .L800A5844
/* 95FB0 800A57B0 FFF7043C */   lui       $a0, (0xF7FFFFFF >> 16)
/* 95FB4 800A57B4 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 95FB8 800A57B8 01000224 */  addiu      $v0, $zero, 0x1
/* 95FBC 800A57BC 68FA82AF */  sw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* 95FC0 800A57C0 1800628C */  lw         $v0, 0x18($v1)
/* 95FC4 800A57C4 FFFF8434 */  ori        $a0, $a0, (0xF7FFFFFF & 0xFFFF)
/* 95FC8 800A57C8 24104400 */  and        $v0, $v0, $a0
/* 95FCC 800A57CC 0492020C */  jal        GetMaxHealth
/* 95FD0 800A57D0 180062AC */   sw        $v0, 0x18($v1)
/* 95FD4 800A57D4 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95FD8 800A57D8 30FA80AF */  sw         $zero, %gp_rel(Raziel + 0x400)($gp)
/* 95FDC 800A57DC 8597020C */  jal        razReaverOn
/* 95FE0 800A57E0 00000000 */   nop
/* 95FE4 800A57E4 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 95FE8 800A57E8 00000000 */  nop
/* 95FEC 800A57EC 15004010 */  beqz       $v0, .L800A5844
/* 95FF0 800A57F0 00000000 */   nop
/* 95FF4 800A57F4 F477010C */  jal        MORPH_ToggleMorph
/* 95FF8 800A57F8 00000000 */   nop
/* 95FFC 800A57FC 3CF6838F */  lw         $v1, %gp_rel(Raziel + 0xC)($gp)
/* 96000 800A5800 0B80023C */  lui        $v0, %hi(StateHandlerGlyphs)
/* 96004 800A5804 50F64224 */  addiu      $v0, $v0, %lo(StateHandlerGlyphs)
/* 96008 800A5808 08006210 */  beq        $v1, $v0, .L800A582C
/* 9600C 800A580C 0A80023C */   lui       $v0, %hi(StateHandlerPuppetShow)
/* 96010 800A5810 0CA94224 */  addiu      $v0, $v0, %lo(StateHandlerPuppetShow)
/* 96014 800A5814 05006210 */  beq        $v1, $v0, .L800A582C
/* 96018 800A5818 0400053C */   lui       $a1, (0x40005 >> 16)
/* 9601C 800A581C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 96020 800A5820 0500A534 */  ori        $a1, $a1, (0x40005 & 0xFFFF)
/* 96024 800A5824 A1D1000C */  jal        INSTANCE_Post
/* 96028 800A5828 21300000 */   addu      $a2, $zero, $zero
.L800A582C:
/* 9602C 800A582C 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* 96030 800A5830 00000000 */  nop
/* 96034 800A5834 03008010 */  beqz       $a0, .L800A5844
/* 96038 800A5838 00000000 */   nop
/* 9603C 800A583C AB35010C */  jal        FX_EndInstanceParticleEffects
/* 96040 800A5840 00000000 */   nop
.L800A5844:
/* 96044 800A5844 1000BF8F */  lw         $ra, 0x10($sp)
/* 96048 800A5848 00000000 */  nop
/* 9604C 800A584C 0800E003 */  jr         $ra
/* 96050 800A5850 1800BD27 */   addiu     $sp, $sp, 0x18
.size razMaterialShift, . - razMaterialShift
