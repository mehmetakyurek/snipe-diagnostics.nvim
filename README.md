# snipe-diagnostics.nvim
Adds buffer diagnostics supports to ["leath-dub/snipe.nvim"](https://github.com/leath-dub/snipe.nvim)
## Installation
```lua
{
	"mehmetakyurek/snipe-diagnostics.nvim",
	dependencies = { "leath-dub/snipe.nvim" },
	config = function()
		require("snipe-diagnostics").setup()
		vim.keymap.set("n", "<leader>dd", "<cmd>SnipeDiagnostics<cr>", { desc = "SnipeDiagnostics" })
	end
}
```
### To-Do
- [ ] Custom message formatting
- [ ] Keybindings as parameters
- [ ] Workspace diagnostics?(maybe)
