-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    
    --
    -- File Mappings
    ["<leader>1"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    ["<leader>2"] = { "<cmd>Neotree reveal<cr>", desc = "Reveal NeoTree" },
    ["<C-p>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["<M-p>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["e"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },

    --
    -- Buffer Mappings
    ["q"] = { "<cmd>:bd<cr>", desc="Close Current Buffer"},
    ["<cr>"] = {
      function() require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end) end,
      desc = "Select buffer from tabline"
    },

    --
    -- Terminal
    ["<leader>3"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    
    --
    -- LSP
    ["r"] = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end
      end,
      desc = "Search current document symbols",
    },
    
    ["R"] = {
      function()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      desc = "Search global symbols",
    },

    -- Cursor
    --
    
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<leader>3"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  },
}
