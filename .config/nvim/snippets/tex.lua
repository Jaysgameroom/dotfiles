return {}, {
	s("documentclass", fmt([[
	\documentclass{{article}}

	\date{{{}}}
	\author{{Josiah Ricketts}}
	\title{{{}}}

	\begin{{document}}
	\maketitle

	{}

	\end{{document}}
  ]], {
			i(1, "Date"),
			i(2, "Title"),
			i(3)
		})),
	s("dm", fmt("\\[\n \t{} \n\\]", {i(1)} )),
	s("im", fmt("${}$", {i(1)} )),
	s("int", c(1, {
		fmt("\\int_{{{}}}^{{{}}}", {i(1), i(2)}),
		fmt("\\int", {})
	})),
	s("sn", fmt("\\sin", {})),
	s("cs", fmt("\\cos", {})),
	s({regTrig=true,trig="(%d+)/(%d+)"}, f(function(_, snip) return "\\frac{" .. snip.captures[1] .. "}{" .. snip.captures[2] .."}" end)),

}
