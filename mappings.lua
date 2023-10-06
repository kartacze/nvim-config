---@type MappingsTable
local M = {}

M.ted_custom = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gd"] = {
      ":Telescope lsp_definitions <cr>",
      "lsp definition",
    },
    ["gr"] = {
      ":Telescope lsp_references<cr>",
      "lsp references",
    },
    ["<leader>m"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
    -- ["K"] = {
    --   function()
    --     vim.lsp.buf.hover()
    --   end,
    --   "LSP hover",
    -- },
  },
}

-- more keybinds!

return M
