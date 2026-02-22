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
	s("sn", fmt("\\sin", {})),
	s("cs", fmt("\\cos", {})),
	s({regTrig=true,trig="(%S+)/(%S+)"},  f(function(_, snip) return "\\frac{" .. snip.captures[1] .. "}{" .. snip.captures[2] .."}" end)),
	s({regTrig=true,trig="(%S+)|(%S+)"},  f(function(_, snip) return "\\int_{" .. snip.captures[1] .. "}^{" .. snip.captures[2] .."}" end))

}
