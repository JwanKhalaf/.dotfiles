local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>pv"] = { "<cmd> NvimTreeToggle<CR>", "toggle nvim tree"},
  },
  i = {
    ["jj"] = { "<ESC>", opts = { nowait = true, silent = true }}
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "add yaml struct tags"
    }
  },
}

M.harpoon = {
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon"):list():append()
      end,
      "Harpoon add file",
    },
    ["<C-e>"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      "Harpoon toggle menu",
    },
    ["<C-h>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "Harpoon nav file 1",
    },
    ["<C-t>"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "Harpoon nav file 2",
    },
    ["<C-n>"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "Harpoon nav file 3",
    },
    ["<C-s>"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "Harpoon nav file 4",
    },
    ["<C-S-P>"] = {
      function()
        require("harpoon"):list():prev()
      end,
      "Harpoon nav file 5",
    },
    ["<C-S-N>"] = {
      function()
        require("harpoon"):list():next()
      end,
      "Harpoon nav file 5",
    },
  },
}

return M
