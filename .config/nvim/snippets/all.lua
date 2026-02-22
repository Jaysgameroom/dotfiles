return {
	s("date",c(1, {
		f(function() return os.date("%a %b %d") end),
		f(function() return os.date("%b%d") end)
	}) )
}

