local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("c", {
	s("cBoilerPate", {
		t({
			"#include <stdio.h>",
			"",
			"int main() {",
			"    ",
		}),
		i(1, "// Your code here"),
		t({
			"",
			"    return 0;",
			"}",
		}),
	}),
})
ls.add_snippets("cpp", {
	s("cppBoilerPate", {
		t({
			"#include <iostream>",
			"",
			"using namespace std;",
			"",
			"int main() {",
			"    ",
		}),
		i(1, "// Your code here"),
		t({
			"",
			"    return 0;",
			"}",
		}),
	}),
})

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/config/" })
