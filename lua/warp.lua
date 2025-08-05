local match = string.match
local gsub = string.gsub
local sub = string.sub

local function shift_line(row, col, word)
	local text = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]

	vim.api.nvim_buf_set_lines(0, row, row + 1, false, {
		sub(text, 1, col) .. word .. sub(text, col + 1),
	})
end

local function warp_line(row, open_keyword, close_keyword)
	local text = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]

	vim.api.nvim_buf_set_lines(0, row, row + 1, false, {
		gsub(text, "^(%s*)", "%1" .. open_keyword) .. close_keyword,
	})
end

local function warp(opts)
	local open_keyword = opts.fargs[1] or ""
	local close_keyword = opts.fargs[2] or open_keyword

	if match(vim.fn.mode(), "v") then
		warp_line(vim.fn.line("v") - 1, open_keyword, close_keyword)
		warp_line(vim.fn.line(".") - 1, open_keyword, close_keyword)
	else
		warp_line(vim.fn.line(".") - 1, open_keyword, close_keyword)
	end
end

local function warp_visual(opts)
	local open_keyword = opts.fargs[1] or ""
	local close_keyword = opts.fargs[2] or open_keyword

	if not match(vim.fn.mode(), "v") then
		return
	end

	local start_col = vim.fn.col("v")
	local end_col = vim.fn.col(".")

	local start_row = vim.fn.line("v") - 1
	local end_row = vim.fn.line(".") - 1

	if start_row > end_row or (start_row == end_row and start_col > end_col) then
		start_row, end_row = end_row, start_row
		start_col, end_col = end_col, start_col
	end

	shift_line(start_row, start_col - 1, open_keyword)
	shift_line(end_row, end_col + 1, close_keyword)

	vim.fn.setpos("'<", { 0, start_row + 1, start_col + #open_keyword, 0 })
	vim.fn.setpos("'>", { 0, end_row + 1, end_col + #open_keyword + #close_keyword, 0 })

	vim.cmd("normal! gv")
end

return {
    warp = warp,
    warp_visual = warp_visual,
}
