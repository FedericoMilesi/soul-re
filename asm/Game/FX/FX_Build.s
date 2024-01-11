.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Build
/* 350B0 800448B0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 350B4 800448B4 3800A28F */  lw         $v0, 0x38($sp)
/* 350B8 800448B8 3C00A38F */  lw         $v1, 0x3C($sp)
/* 350BC 800448BC 4000A88F */  lw         $t0, 0x40($sp)
/* 350C0 800448C0 2000BFAF */  sw         $ra, 0x20($sp)
/* 350C4 800448C4 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 350C8 800448C8 1000A2AF */  sw         $v0, 0x10($sp)
/* 350CC 800448CC 1400A3AF */  sw         $v1, 0x14($sp)
/* 350D0 800448D0 E711010C */  jal        _FX_Build
/* 350D4 800448D4 1800A8AF */   sw        $t0, 0x18($sp)
/* 350D8 800448D8 2000BF8F */  lw         $ra, 0x20($sp)
/* 350DC 800448DC 00000000 */  nop
/* 350E0 800448E0 0800E003 */  jr         $ra
/* 350E4 800448E4 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_Build, . - FX_Build
