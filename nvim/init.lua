--lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- discord
    {"andweeb/presence.nvim"},
    --theme
    {"rebelot/kanagawa.nvim"},

    --tabbar
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },

    --status bar
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },

    --filer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        lazy = true
    },

    --fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependencies = {"nvim-lua/plenary.nvim"}
    },

    --git diff
    {"lewis6991/gitsigns.nvim"},
    --scrollbar
    {"petertriho/nvim-scrollbar"},
    --autocomplete of (){}[]""''
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },

    --easy inserting of (){}[] etc
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require('nvim-surround').setup()
        end
    },

    --IM
    {"vim-skk/skk.vim"},
    --LSP
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    --completion
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/vim-vsnip"}
})

--load common vimrc with vim
function file_exists(name)
    local f=io.open(name, "r")
    if f~=nil then io.close(f) return false else return true end
end

if file_exists('~/.vimrc_common') then
	vim.api.nvim_exec("source ~/.vimrc_common",false)
else
    print("~/.vimrc_common not found")
end

-- The setup config table shows all available config options with their default values:
require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    --neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    --client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

--colorterm
vim.opt.termguicolors = true

--nvim terminal mode
vim.keymap.set("t","<Esc>","<C-\\><C-n>")
vim.keymap.set("t","jj","<C-\\><C-n>")
vim.api.nvim_create_user_command("T","split | wincmd j | resize 10 | terminal",{})
vim.api.nvim_create_autocmd({"TermOpen"},{
    pattern = "*",
    command = "startinsert",
})

vim.cmd("colorscheme kanagawa")

require("bufferline").setup()

require("lualine").setup({
    options = {
        theme = "everforest",
        section_separators = {left = '', right = ''},
        component_sepatators = {left = '', right = ''}
    }
})

--nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeOpen<CR>')

--fzf
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Telescope find files hidden=true'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Telescope live grep'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Telescope buffers'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Telescope help tags'})

require('gitsigns').setup()
require('scrollbar').setup()

--skk
vim.api.nvim_exec("set imdisable",false)
vim.api.nvim_set_var("skk_large_jisyo","~/.config/skkdic/SKK-JISYO.L")
vim.api.nvim_set_var("skk_auto_save_jisyo",1)


-- 以下built-in LSPの設定

-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
  require('lspconfig')[server].setup(opt)
end })

-- 2. build-in LSP function
-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = "path" },
--     { name = "cmdline" },
--   },
-- })
--
