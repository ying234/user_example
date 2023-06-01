local is_wsl = (function()
  local output = vim.fn.systemlist "uname -r"
  return not not string.find(output[1] or "", "WSL")
end)()

-- local is_windows = vim.fn.has("win32") == 1
--
-- local is_mac = vim.fn.has("macunix") == 1
--
-- local is_linux = not is_wsl and not is_mac

if is_wsl then
  vim.g.clipboard = {
    name = "wslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enable = 0,
  }
end

return {
  {
    "mfussenegger/nvim-dap",
    enabled = true,
  },
  "folke/tokyonight.nvim",
  "jose-elias-alvarez/typescript.nvim",
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
