hl.workspace_rule({workspace = "s[true]", gaps_out = 200, gaps_in = 100})

hl.workspace_rule({workspace = "name:Game", gaps_out = 0, no_border = true, decorate = false})

hl.workspace_rule({workspace = "special:Media", on_created_empty = "librewolf --new-window youtube.com" })
hl.workspace_rule({workspace = "special:Control", on_created_empty = "steam && vesktop"})
hl.workspace_rule({workspace = "special:Server", on_created_empty = "foot"})

hl.window_rule({

    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
	name = "opaque Controls",
	match = {
		workspace = "s[true]",
		modal = false,
	},
	opacity = "0.9 0.3"
})

hl.window_rule({
	name = "transparent P-I-P",
	match = {
		initial_title = "Picture-in-Picture",
		float = true,
	},
	opacity = "0.5"
})

hl.window_rule({
	name = "move pip out",
	match = {
		initial_title = "Picture-in-Picture",
	},
	workspace = "e+0",
	float = true
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
	name = "dicord-in-special",
	match = {
		initial_class = "(steam|vesktop)"
	},
	workspace = "special:Control"
})

