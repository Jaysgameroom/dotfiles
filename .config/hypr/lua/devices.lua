hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440p@180",
    position = "0x0",
    scale    = "auto",
})

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 2,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    },
})

