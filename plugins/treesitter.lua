return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      -- "lua"
      "lua",
      "javascript",
      "c_sharp",
      "css",
      "go",
      "gomod",
      "gowork",
      "html",
      "json",
      "markdown",
      "rust",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    })
  end,
}
