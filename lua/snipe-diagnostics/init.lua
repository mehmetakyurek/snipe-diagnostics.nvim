local Menu = require('snipe.menu')

local function format_diagnostic(d)
	return string.format("%s | [%s, %s] | %s | %s", d.message, d.lnum, d.col, d.code, d.severity)
end

local function get_diagnostics()
	local d = vim.diagnostic.get(0)
	local diagnostics = {}
	for _, result in pairs(d) do
		table.insert(diagnostics, result)
	end

	return diagnostics
end

local function open_diagnostics()
	local menu = Menu:new { position = "center", open_win_override = { title = "LSP Diagnostics" } }
	local win = vim.api.nvim_get_current_win()
	local d = get_diagnostics()
	menu:open(d, function(m, i)
		print(d[i].lnum + 1, d[i].col)
		vim.api.nvim_win_set_cursor(win, { d[i].lnum + 1, d[i].col })
		m:close()
	end, format_diagnostic)
end

return {
	setup = function()
		vim.api.nvim_create_user_command("SnipeDiagnostics", open_diagnostics,
			{ desc = "navigate diagnostics list using snipe" })
	end
}
