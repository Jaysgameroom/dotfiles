hl.workspace_rule({workspace = "s[true]", gaps_out = 200, gaps_in = 100})
hl.workspace_rule({workspace = "special:media", on_created_empty = Browser })
hl.workspace_rule({workspace = "special:control", on_created_empty = "steam"})
hl.workspace_rule({workspace = "name:Game", gaps_out = 0, no_border = true, decorate = false})

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
	name = "opaque controls",
	match = {
		workspace = "s[true]",
		modal = false,
	},
	opacity = "0.9 0.3"
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
