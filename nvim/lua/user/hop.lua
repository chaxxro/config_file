local status_ok, hop = pcall(require, "hop")
if not status_ok then
  vim.notify("not find hop, " .. hop)
  return
end

local directions = require('hop.hint').HintDirection

hop.setup({

})

local opt = {
  noremap = true,
  silent = true
}
vim.api.nvim_set_keymap("n", "<leader>jw", ":HopWord<cr>", opt)
vim.api.nvim_set_keymap("n", "<leader>ja", ":HopAnywhere<cr>", opt)
vim.api.nvim_set_keymap("n", "<leader>jc", ":HopChar1<cr>", opt)
