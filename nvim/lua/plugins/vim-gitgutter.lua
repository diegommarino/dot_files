return {
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.cmd("let g:gitgutter_sign_allow_clobber = 1")
    end,
  },
}
