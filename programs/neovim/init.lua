vim.g.mapleader = " "
-- Emit "true" (24-bit) colors
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
  -- {
  --   "dguo/blood-moon",
  --   lazy = false,
  --   priority = 1000,
  --   config = function(plugin)
  --     vim.opt.rtp:append(plugin.dir .. "/applications/vim")
  --     vim.cmd([[colorscheme blood-moon]])
  --   end
  -- },
  {
    "github/copilot.vim",
    enabled = function()
      return not vim.g.vscode
    end
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = function()
      return not vim.g.vscode
    end,
    config = true
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    enabled = function()
      return not vim.g.vscode
    end,
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
      vim.keymap.set("n", "<leader>f", builtin.git_files, {})
      vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    enabled = function()
      return not vim.g.vscode
    end,
    config = function()
      require("nvim-tree").setup{}
      vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>", {})
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    enabled = function()
      return not vim.g.vscode
    end,
    build = function()
      vim.fn["mkdp#util#install"]()
      -- TODO: figure out why this doesn't work
      vim.keymap.set("n", "<leader>p", "<Plug>MarkdownPreview", {noremap = false})
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    enabled = function()
      return not vim.g.vscode
    end,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup{
        auto_install = true,
        highlight = {
          enable = true
        },
        additional_vim_regex_highlighting = false
      }
    end
  },
  {
    "sainnhe/gruvbox-material",
    enabled = function()
      return not vim.g.vscode
    end,
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    priority = 1000 -- Ensure it loads first
  }
})

-- TODO: figure out Prettier, linting, etc.

-- Use the system clipboard
vim.opt.clipboard:prepend({"unnamed", "unnamedplus"})
-- Show line numbers
vim.opt.number = true
-- Show the file name in the title bar
vim.opt.title = true
-- Raise a prompt for unsaved changes when quitting
vim.opt.confirm = true
-- Make searches case insensitive unless there's an uppercase letter
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- The number of context lines above/below the cursor
vim.opt.scrolloff = 5
-- Show a column for when a line is getting too long
vim.opt.colorcolumn = "80"

-- Quit
vim.keymap.set("n", "<leader>q", ":q<cr>")
-- Save
vim.keymap.set("n", "<leader>w", ":w<cr>")
-- Save and quit
vim.keymap.set("n", "<leader>e", ":wq<cr>")
-- Clear search highlights
vim.keymap.set("n", "<leader>/", ":noh<cr>")

if not vim.g.vscode then
  vim.g.gruvbox_material_transparent_background = 1
  vim.g.gruvbox_material_foreground = "original"
  vim.g.gruvbox_material_background = "hard"
  vim.cmd("colorscheme gruvbox-material")
end

--[[
  Reset the cursor so that it doesn't persist as a solid block in iTerm. See:
  https://gitlab.com/gnachman/iterm2/-/issues/8885
--]]
vim.api.nvim_create_autocmd({"VimLeave"}, {
  pattern = "*",
  command = "set guicursor=a:ver10-blinkon1",
})

-- Automatically wrap lines for Markdown
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.md",
  command = "setlocal textwidth=80"
})
