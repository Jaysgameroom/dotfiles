return { s("date",c(1, {
		f(function() return os.date("%a %b %d") end),
		f(function() return os.date("%b%d") end)
	}) ),
}, {
	s("/#/", f(function(_, snip) return snip.env.BLOCK_COMMENT_START .. "###############################################################################" .. snip.env.BLOCK_COMMENT_END end) )
}

