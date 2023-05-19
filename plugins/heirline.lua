return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    -- inactive winbar, don't show breadcrumbs
    opts.winbar[2] = {
      condition = function() return not status.condition.is_active() end,
      status.component.separated_path { path_func = status.provider.filename { modify = ":.:h:t" } },
      status.component.file_info {
        file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
        file_modified = false,
        file_read_only = false,
        hl = status.hl.get_attributes("winbarnc", true),
        surround = false,
        update = "BufEnter",
      },
    }
    -- active winbar, show breadcrumbs
    opts.winbar[3] = {
      status.component.separated_path { path_func = status.provider.filename { modify = ":.:h:t" } },
      status.component.file_info { -- add file_info to breadcrumbs
        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
        file_modified = false,
        file_read_only = false,
        hl = status.hl.get_attributes("winbar", true),
        surround = false,
        update = "BufEnter",
      },
      status.component.breadcrumbs {
        icon = { hl = true },
        hl = status.hl.get_attributes("winbar", true),
        prefix = true,
        padding = { left = 0 },
      },
    }
    return opts
  end,
}
