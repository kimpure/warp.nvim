vim.api.nvim_create_user_command("Warp", warp, { nargs = "+" })
vim.api.nvim_create_user_command("WarpVisual", warp_visual, { nargs = "+" })

vim.keymap.set("v", '"', '<CMD>WarpVisual "<CR>')
