return {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      local config = require("nvim-web-devicons")
      config.setup({
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
          }
        };
      })
    end
  }
}

