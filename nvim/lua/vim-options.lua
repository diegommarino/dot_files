vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
-- Incremental search to show partial search
vim.cmd("set is")
vim.cmd("set history=1000")
vim.cmd("set ruler")
vim.cmd("set scrolloff=8")
vim.cmd("set ai")
vim.cmd("set si")
vim.cmd("set colorcolumn=120")
vim.cmd("set spelllang=en")
vim.cmd("set spell")
vim.cmd("set foldmethod=indent")
vim.cmd("set foldlevelstart=20")
vim.cmd("set nostartofline")
vim.cmd("set spell")
vim.cmd("set spell")

-- Commands
vim.cmd("command! CloseBuffers %bd|e#|bd#")

-- Autocommands
vim.cmd("autocmd! VimLeave * mks!")
local timer = vim.loop.new_timer()
local function save_session()
    vim.cmd('mks!')
end
timer:start(60000, 60000, vim.schedule_wrap(save_session))



vim.g.mapleader = ","
vim.g.background = "light"
vim.opt.mouse = ""

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- normal mode remaps
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>s', ':w<CR>')
vim.keymap.set('n', '<leader>z', ':bp<CR>')
vim.keymap.set('n', '<leader>x', ':bn<CR>')
vim.keymap.set('n', '<leader>c', ':bd<CR>')
vim.keymap.set('n', '<TAB>', '<C-^>')
vim.keymap.set('n', '<leader>/', 'gcc')

-- visual mode remaps
vim.keymap.set('v', '<C-c>', ':\'<,\'> w !clip.exe<CR><CR>')
vim.wo.number = true
