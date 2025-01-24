-- Allow telescope to open multiple files when using live_grep
local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end


return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          mappings = {
            i = {
              ['<CR>'] = select_one_or_multi,
            }
          }
        }
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      -- Find word under cursor
      local telescopebuiltin = require("telescope.builtin")
      local opts = { noremap = true, silent = true }

      -- This can be extracted for reuse purpose
      function vim.getVisualSelection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg('v', {})

        text = string.gsub(text, "\n", "")
        if #text > 0 then
          return text
        else
          return ''
        end
      end

      -- Grep word under cursor and expand
      local function grep_cword()
        return telescopebuiltin.grep_string({search = vim.fn.expand("<cword>")})
      end

      vim.keymap.set('v', '<leader>f', function()
        local text = vim.getVisualSelection()
        telescopebuiltin.grep_string({ search = text })
      end, opts)
      vim.keymap.set("n", "<leader>f", grep_cword, {})
      vim.api.nvim_create_user_command("GrepCword", grep_cword, {})
      -- ############################## --

      require("telescope").load_extension("ui-select")
    end,
  },
}

