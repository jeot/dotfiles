-- auto realod
-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
vim.cmd [[
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]

-- set gui font
if vim.fn.has('gui') then
	vim.cmd [[ set guifont=Mononoki\ Nerd\ Font\ Mono:h12 ]]
end

vim.cmd [[
if exists('g:gonvim_running')
	nnoremap <F11> :GonvimFullscreen<cr>
endif
]]
