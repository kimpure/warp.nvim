local match = string.match
local gsub = string.gsub
local sub = string.sub

---@param row number
---@param col number
---@param word string
local function shift_line(row, col, word)
	local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]

	vim.api.nvim_buf_set_lines(0, row, row + #word, false, {
		-- if line is `local a = true`
		-- shift col is 7
		-- shift char is b
		-- result:
		-- local ba = true
		sub(line, 1, col - 1)
			.. word
			.. sub(line, col),
	})
end

---@param row number
---@param open_keyword string
---@param close_keyword string
local function warp_line(row, open_keyword, close_keyword)
	local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]

	vim.api.nvim_buf_set_lines(0, row, row + 1, false, {
		gsub(line, "^(%s*)", "%1" .. open_keyword) .. close_keyword,
	})
end

local module = {}

module.default = { "" }

function module.warp(opts)
	local open_keyword = opts.fargs[1] or ""
	local close_keyword = opts.fargs[2] or module.default[2] or open_keyword

	if match(vim.fn.mode(), "v") then
		warp_line(vim.fn.line("v") - 1, open_keyword, close_keyword)
		warp_line(vim.fn.line(".") - 1, open_keyword, close_keyword)
	else
		warp_line(vim.fn.line(".") - 1, open_keyword, close_keyword)
	end
end

function module.warp_visual(opts)
	local open_keyword = opts.fargs[1] or module.default[1]
	local close_keyword = opts.fargs[2] or open_keyword

	if not match(vim.fn.mode(), "v") then
		return
	end

	local start_col = vim.fn.col("v")
	local end_col = vim.fn.col(".") + 1

	local start_row = vim.fn.line("v") - 1
	local end_row = vim.fn.line(".") - 1


	if start_row > end_row or (start_row == end_row and start_col > end_col) then
		shift_line(start_row, end_col - 1, open_keyword)
		shift_line(end_row, start_col + 1 + #open_keyword, close_keyword)

        vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col + #open_keyword })

        vim.fn.setpos("'<", { 0, end_row, end_col - 1, 0 })
        vim.fn.setpos("'>", { 0, start_row, start_col + #open_keyword, 0 })
    else
		shift_line(start_row, start_col, open_keyword)
		shift_line(end_row, end_col + #open_keyword, close_keyword)

        vim.api.nvim_win_set_cursor(0, { start_row + 1, end_col + #open_keyword - 1 })

        vim.fn.setpos("'<", { 0, start_row, start_col, 0 })
        vim.fn.setpos("'>", { 0, end_row, end_col + #open_keyword - 1, 0 })
    end

	vim.cmd("normal! gv")
end

--- @class Warp.Config
--- @field default? { [1]: string, [2]: string? }
--- @field default_command? boolean? (default: true)

---@param opts? Warp.Config
---@return table
local function setup(opts)
	opts = opts or {
		default_command = true,
	}
	module.default = opts.default or { "" }

	if opts.default_command then
		vim.api.nvim_create_user_command("Warp", module.warp, { nargs = "+" })
		vim.api.nvim_create_user_command("WarpVisual", module.warp_visual, { nargs = "+" })
	end

	return module
end

return {
	setup = setup,
}
