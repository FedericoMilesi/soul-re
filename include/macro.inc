.include "gte_macros.s"

.macro glabel label
    .global \label
    \label:
.endm
