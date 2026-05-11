return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  keys = {
    { "<Leader>od", "<Cmd>Obsidian dailies<CR>", desc = "obsidian daily notes" },
    { "<C-S-d>", "<C-r>=strftime('%A, %B %d, %Y, %I:%M%p')<CR><CR>", desc = "obsidian time stamp" },
  },

  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "obsidian",
        path = "~/Documents/obsidian",
      },
    },

    ui = {
      enable = false, -- Disables checkboxes, links, and other visual enhancements
    },

    daily_notes = {
      enabled = true,
      folder = "zzz/dailynotes",
      date_format = "%B %-d, %Y",
      default_tags = "type/dailynotes",
    },

  },
}
