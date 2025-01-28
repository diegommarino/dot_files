return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = { ensure_installed = { "erb-formatter", "erb-lint" } },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = { 'solargraph' }
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- local registry = require('mason-registry')
      -- local solargraph = registry.get_package('solargraph')
      -- local solargraph_path = solargraph:get_install_path()
      -- local rubocop_config = solargraph_path .. "/lib/.rubocop.yml"

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.solargraph.setup({
        -- cmd = { solargraph_path .. "/bin/solargraph", "stdio" },
        -- settings = {
        --   solargraph = {
        --     diagnostics = true,
        --     rubocop = {
        --       command = solargraph_path .. "/bin/rubocop",
        --       args = { "--config", rubocop_config }
        --     }
        --   }
        -- },
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.g.lazyvim_ruby_lsp = "solargraph"
      vim.g.lazyvim_ruby_formatter = "rubocop"
    end,
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ruby_lsp = {
          enabled = lsp == "ruby_lsp",
        },
        solargraph = {
          enabled = lsp == "solargraph",
        },
        rubocop = {
          -- If Solargraph and Rubocop are both enabled as an LSP,
          -- diagnostics will be duplicated because Solargraph
          -- already calls Rubocop if it is installed
          enabled = formatter == "rubocop" and lsp ~= "solargraph",
        },
        standardrb = {
          enabled = formatter == "standardrb",
        },
      },
    },
  },
}
