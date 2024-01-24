local plugins = {
  {
    "unblevable/quick-scope",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("harpoon").setup(opts)
      require("core.utils").load_mappings("harpoon")
    end
  },
  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        sh = { "shfmt" },
        go = { "gofumpt" },
        elm = { "elm-format" }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        quiet = true,
      },
      init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      end
    },
  }
}

return plugins
