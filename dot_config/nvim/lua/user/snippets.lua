local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

s("HTML", {
	t("<!DOCTYPE html>"),
	t("<html>"),
	t("<head>"),
	t({ "<title>" }, i(1), t({ "</title>" })),
})
