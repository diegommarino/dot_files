return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    opts = function(_, opts)
      opts.endwise = { enable = true }
      opts.highlight = { enable = true }
      opts.auto_install = { enable = true }
      opts.indent = { enable = true, disable = { "yaml", "ruby" } }
      opts.ensure_installed = {
        "bash",
        "embedded_template",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      }
    end,
    -- config = function()
    --   local config = require("nvim-treesitter.configs")
    --   config.setup({
    --     auto_install = true,
    --     highlight = { enable = true },
    --     indent = { enable = true },
    --   })
    -- end,
  },
}
