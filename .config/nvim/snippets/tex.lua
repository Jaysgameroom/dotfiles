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
	s("sn", fmt("\\sin", {})),
	s("sn", fmt("\\sin", {})),

	s("cs", fmt("\\cos", {})),
	s({regTrig=true,trig="(%S+)/(%S+)"},  f(function(_, snip) return "\\frac{" .. snip.captures[1] .. "}{" .. snip.captures[2] end)),
	s({regTrig=true,trig="(%S+)|(%S+)"},  f(function(_, snip) return "\\int_{" .. snip.captures[1] .. "}^{" .. snip.captures[2] end)),

	s("cir", c(1, {
		fmt("\\draw ({}, {}) circle ({}pt);", {i(1), i(2), i(3)}),
		fmt("\\draw [{}] ({}, {}) circle ({}pt);", {i(1, "fill"), i(2), i(3), i(4),})

	})),

	s("line", c(1, {
		fmt("\\draw ({},{}) -- ({},{});", {i(1), i(2), i(3), i(4)}),
		-- fmt("\\draw [{}] ({},{}) -- ({},{});", {i(1, "->"), i(2), i(3), i(4), i(5)}),
	})),
	s("force", fmt("\\draw [{}] ({},{}) -- ({},{}) node [{}] {{${}$}};", {i(1, "->"), i(2), i(3), i(4), i(5), c(6, {t"above", t"below", t"left", t"right"}), i(7)}))

}
