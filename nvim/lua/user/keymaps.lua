-- leader key 为空格
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- 快捷键绑定说明
-- https://github.com/nanotee/nvim-lua-guide#defining-mappings
-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}

-- magic search
map("n", "/", "/\\v", { noremap = true , silent = false})
map("v", "/", "/\\v", { noremap = true , silent = false})

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opt)
map("n", "<S-h>", ":bprevious<CR>", opt)

-- Lists files in your current working directory, respects .gitignore
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opt)
-- Search for a string in your current working directory and get results live as you type, respecting .gitignore
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opt)
-- -i ignore case
-- -s 大小写敏感
-- -w match word
-- -e 正则表达式匹配
-- -v 反转匹配
-- -g 通配符文件或文件夹，可以用!来取反
-- -F fixed-string 原意字符串，类似python的 r'xxx'
map("n", "<leader>fg", "<cmd>Telescope live_grep_raw<cr>", opt)
-- Lists LSP references for word under the cursor
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", opt)
-- bookmark's
map("n", "<leader>fm", "<cmd>Telescope vim_bookmarks current_file<cr>", opt)
map("n", "<leader>fma", "<cmd>Telescope vim_bookmarks all<cr>", opt)

-- git diff view
-- Navigation
map('n', '<S-j>', ':Gitsigns next_hunk<CR>', opt)
map('n', '<S-k>',':Gitsigns prev_hunk<CR>', opt)
-- Actions 
-- #map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', opt)
map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', opt)
map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', opt)

map("n", "<C-n>", ":NvimTreeToggle<cr>", opt)

map("n", "<leader>t", ":TranslateW<cr>", opt)
map("v", "<leader>t", ":TranslateW<cr>", opt)

map("n", "<leader>1", ":BufferLineGoToBuffer 1<cr>", opt)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<cr>", opt)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<cr>", opt)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<cr>", opt)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<cr>", opt)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<cr>", opt)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<cr>", opt)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<cr>", opt)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<cr>", opt)
