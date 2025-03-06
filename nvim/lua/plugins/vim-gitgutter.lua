return {
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.cmd("let g:gitgutter_sign_allow_clobber = 1")
      vim.keymap.set('n', '<leader>g>', '<Plug>(GitGutterNextHunk)', { noremap = true, silent = true })  -- Next hunk
      vim.keymap.set('n', '<leader>g<', '<Plug>(GitGutterPrevHunk)', { noremap = true, silent = true })  -- Previous hunk
      vim.keymap.set('n', '<leader>gs', '<Plug>(GitGutterStageHunk)', { noremap = true, silent = true }) -- Stage hunk
      vim.keymap.set('n', '<leader>gu', '<Plug>(GitGutterUndoHunk)', { noremap = true, silent = true })  -- Undo hunk
    end,
  },
}
