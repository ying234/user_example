-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>fb"] = {
      function() require("telescope.builtin").buffers { sort_lastused = true } end,
      desc = "Find buffers",
    },
    ["<leader>a"] = {
      function() require("telescope.builtin").buffers { previewer = false, sort_lastused = true } end,
      desc = "Switch Buffers",
    },
    ["<leader>sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" },
    ["<leader>sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>lb"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "hover Documentation" },
    ["<leader>lm"] = {
      "<cmd>lua require('typescript').actions.addMissingImports()<CR>",
      desc = "add missing import",
    },
    ["<leader>ltu"] = { "<cmd>lua require('typescript').actions.removeUnused()<CR>", desc = "remove unused import" },
    ["<leader>ltf"] = { "<cmd>lua require('typescript').actions.fixAll()<CR>", desc = "fix all" },
    ["<c-d>"] = { "<c-d>zz" },
    ["<c-u>"] = { "<c-u>zz" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
