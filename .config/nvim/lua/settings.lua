vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime

vim.o.hidden = O.hidden_files -- Required to keep multiple buffers open multiple buffers
vim.o.title = true

-- if O.spell_check then
--   vim.cmd('set spell spelllang=en_us') -- Enbles spell checking
-- end
vim.o.spelllang = 'en_us'
vim.o.spell = O.spell_check

TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')

vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.o.wrap = O.wrap_lines -- Display long lines as just one line
vim.o.linebreak = O.wrap_lines
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys

vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages

vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.t_Co = "256" -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files

vim.cmd('set ts=2') -- Insert 2 spaces for a tab
vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation

vim.o.expandtab = true -- Converts tabs to spaces
vim.o.smartindent = true -- Makes indenting smart
vim.o.number = O.number -- set numbered lines

vim.wo.relativenumber = O.relative_number -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.guifont = "FiraCode Nerd Font:h17"

vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"

vim.cmd ("hi IndentBlanklineChar guifg=#2a2e36")

vim.g.indent_blankline_filetype_exclude = {"help", "terminal"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}

vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
]], false)
