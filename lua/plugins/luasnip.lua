return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local sn = ls.snippet_node
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local c = ls.choice_node
		local d = ls.dynamic_node
		local r = ls.restore_node
		ls.setup({
			history = true,
			enable_autosnippets = true,
			snippets = {
				all = {
					ls.parser.parse_snippet("expand", "-- this is what is expanded!"),
				},
				lua = {
					ls.parser.parse_snippet("ls", "local $1 = function($2)\n  $0\nend"),
				},
			},
		})
		ls.add_snippets("all", {
			s("ufn", {
				t("UFUNCTION()"),
                f("what")
			}),
        })
	end,
}
