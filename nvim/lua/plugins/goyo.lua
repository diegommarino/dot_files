return {
  'junegunn/goyo.vim',
    config = function()
      vim.g.mapleader = ","
      vim.keymap.set("n", "<leader>g", ":Goyo<CR>")
    end
}
