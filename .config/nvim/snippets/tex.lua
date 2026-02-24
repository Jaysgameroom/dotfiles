return {}, {
	--docstart
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
	--math stuff
	s("dm", fmt("\\[\n \t{} \n\\]", {i(1)} )),
	s("im", fmt("${}$", {i(1)} )),
	s("sn", fmt("\\sin", {})),
	s("sn", fmt("\\sin", {})),
	s("sn", fmt("\\sin", {})),

	s("cs", fmt("\\cos", {})),
	s("frac", fmt("\\frac{{{}}}{{{}}}", {i(1), i(2)})),
	s("int", fmt("\\int_{{{}}}^{{{}}}", {i(1), i(2)})),
	-- s({regTrig=true,trig="(%S+)/(%S+)"},  f(function(_, snip) return "\\frac{" .. snip.captures[1] .. "}{" .. snip.captures[2] end)),
	-- s({regTrig=true,trig="(%S+)|(%S+)"},  f(function(_, snip) return "\\int_{" .. snip.captures[1] .. "}^{" .. snip.captures[2] end)),
	s("rou", c(1, {
		fmt("\\draw ({}, {}) circle ({}pt);", {i(1), i(2), i(3)}),
		fmt("\\draw [{}] ({}, {}) circle ({}pt);", {i(1, "fill"), i(2), i(3), i(4),})

	})),

	--tikz
	s("line", c(1, {
		fmt("\\draw ({},{}) -- ({},{});", {i(1), i(2), i(3), i(4)}),
		-- fmt("\\draw [{}] ({},{}) -- ({},{});", {i(1, "->"), i(2), i(3), i(4), i(5)}),
	})),
	s("force", fmt("\\draw [{}] ({},{}) -- ({},{}) node [{}] {{${}$}};", {i(1, "->"), i(2), i(3), i(4), i(5), c(6, {t"above", t"below", t"left", t"right"}), i(7)})),
	s("pic", fmt("\\begin{{tikzpicture}}\n\t{}\n\\end{{tikzpicture}}", {i(0)})),
	--circuitikz
	s("cuit", fmt([[
	\begin{{circuitikz}}[american]
		{}
	\end{{circuitikz}}
	]], {i(1)})),
	s("wire", fmt("{}to[{}] {}({},{})", {
		c(1, {
			t"",
			sn(1,fmt("\\draw ({},{}) ", {i(1, "0"), i(2, "0")}))
		}),
		c(2, {
			sn(1, fmt("R=${}\\Omega$", i(1))),
			sn(1, fmt("C=${}$", i(1))),
			sn(1, fmt("L=${}$", i(1))),
			sn(1, fmt("short, {} ", i(1))),
			sn(1, fmt("battery, v<=${}V$", i(1))),
			sn(1, fmt("battery, v=${}V$", i(1))),
		}),
		c(3, {t"++", t""}),
		i(4, "0"),
		i(5, "0")
	})),

}
