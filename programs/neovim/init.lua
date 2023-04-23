vim.g.mapleader = " "
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"numToStr/Comment.nvim", config = true},
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group{
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.date.alias["%Y-%m-%d"],
          augend.date.alias["%Y/%m/%d"],
          augend.constant.new{
            elements = {"and", "or"},
            word = true,
            cyclic = true
          },
          augend.constant.new{
            elements = {"&&", "||"},
            word = false,
            cyclic = true
          },
          augend.constant.new{
            elements = {"let", "const"},
            word = false,
            cyclic = true
          }
        }
      }

      vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
      vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
    end
  },
  {"cappyzawa/trim.nvim", config = true},
  {
    "dguo/blood-moon",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/applications/vim")
      vim.cmd([[colorscheme blood-moon]])
    end
  },
  "github/copilot.vim",
    {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {"lewis6991/gitsigns.nvim", config = true},
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("telescope").setup{
        pickers = {
          git_files = {
            theme = "dropdown",
          }
        }
      }

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("nvim-tree").setup{}
      vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>", {})
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
      -- TODO: figure out why this doesn't work
      vim.keymap.set("n", "<leader>p", "<Plug>MarkdownPreview", {noremap = false})
    end
  }
})

vim.opt.clipboard:prepend({"unnamed", "unnamedplus"})

-- TODO: automatically wrap lines for Markdown?

-- Show line numbers
vim.opt.number = true
-- Show the file name in the title bar
vim.opt.title = true
-- Raise a dialogue for unsaved changes when quitting
vim.opt.confirm = true
