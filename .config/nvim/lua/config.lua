-- auto realod
-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
-- vim.cmd [[
-- autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
-- autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
-- ]]

-- create a group
local group = vim.api.nvim_create_augroup("SmashThatLikeButton", { clear = true })
-- reload file autocommand in lua:
-- (is this redundant with autoread option in neovim?)
vim.api.nvim_create_autocmd(
	{"FocusGained","BufEnter","CursorHold","CursorHoldI"},
	{ group = group, pattern = "*", command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif "}
)
vim.api.nvim_create_autocmd(
	{"FileChangedShellPost"}, {group = group, pattern = "*", command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"}
)
-- different indentation style for lua files
vim.api.nvim_create_autocmd(
	{"FileType"}, {group = group, pattern = "lua", command = "setlocal ts=2 sw=2 sts=0 noexpandtab"}
)

-- delete white space at end of lines
vim.api.nvim_create_autocmd("BufWritePre", {group = group, pattern={"*.h","*.cpp", "*.lua"}, command="%s/\\s\\+$//e"})

-- set gui font
if vim.fn.has('gui') then
	vim.cmd [[ set guifont=Mononoki\ Nerd\ Font\ Mono:h12 ]]
end

-- test
-- Zoom / Restore window.
vim.cmd [[
function! s:ZoomToggle() abort
	if exists('t:zoomed') && t:zoomed
		execute t:zoom_winrestcmd
		let t:zoomed = 0
	else
		let t:zoom_winrestcmd = winrestcmd()
		resize
		vertical resize
		let t:zoomed = 1
	endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>wf :ZoomToggle<CR>
]]

-- disable diagnostics by default
vim.diagnostic.disable()
