return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
    keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree" },
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
