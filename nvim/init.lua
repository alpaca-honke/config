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

if vim.g.vscode then
    require("lazy").setup({
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

    --skk
    --vim.api.nvim_exec("set imdisable",false)
    vim.api.nvim_set_var("skk_large_jisyo","~/.config/skkdic/SKK-JISYO.L")
    vim.api.nvim_set_var("skk_auto_save_jisyo",1)
else
    require("lazy").setup({
        -- discord
        --{
        --  "andweeb/presence.nvim",
        --  lazy = false,
        --},

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
--        {"vim-skk/skk.vim"},
        --LSP
        {"neovim/nvim-lspconfig"},
        {"mason-org/mason.nvim"},
        {"mason-org/mason-lspconfig.nvim"},
        --virtual mode counter
        {
          "tzhouhc/virt-counter.nvim",
          opts={
            count_newlines = true,
            preset = "pill",
            count_bytes = false,
          }
        },
        --completion
        {"hrsh7th/nvim-cmp"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/vim-vsnip"},
        --ai companion
        {
          "yetone/avante.nvim",
          -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
          -- ⚠️ must add this setting! ! !
          build = vim.fn.has("win32") ~= 0
              and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
              or "make",
          event = "VeryLazy",
          version = false, -- Never set this value to "*"! Never!
          ---@module 'avante'
          ---@type avante.Config
          opts = {
            -- add any opts here
            -- this file can contain specific instructions for your project
            --instructions_file = "avante.md",
            provider = "gemini",
            auto_suggestions_provider = "gemini",
            -- providers = {
            --   claude = {
            --     endpoint = "https://api.anthropic.com",
            --     model = "claude-sonnet-4-20250514",
            --     timeout = 30000, -- Timeout in milliseconds
            --       extra_request_body = {
            --         temperature = 0.75,
            --         max_tokens = 20480,
            --       },
            --   },
            --   copilot = {
            --     endpoint = "api.githubcopilot.com",
            --     model = "gpt-4o",
            --     timeout = 30000, -- Timeout in milliseconds
            --     extra_request_body = {
            --       temperature = 0.75,
            --       max_tokens = 32768,
            --     },
            --   },
            -- },
          },
          dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-mini/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "stevearc/dressing.nvim", -- for input provider dressing
            "folke/snacks.nvim", -- for input provider snacks
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons

            -- Copilotあきらめた
            --{ "zbirenbaum/copilot.lua",
            --    lazy = false,
            --    cmd = "Copilot",
            --    config= function()
            --      require("copilot").setup({
            --        suggestion = {
            --          enabled = true,
            --          auto_trigger = true,
            --          keymap = {
            --            accept = "<C-l>",
            --            accept_word = "<C-w>",
            --            accept_line = "<C-e>",
            --            next = "<C-[>",
            --            prev = "<C-]>",
            --            dismiss = "<C-/>",
            --          }
            --        },
            --        panel = { enabled = false },
            --      })
            --    end,
            --},
            {
              -- support for image pasting
              "HakonHarnes/img-clip.nvim",
              event = "VeryLazy",
              opts = {
                -- recommended settings
                default = {
                  embed_image_as_base64 = false,
                  prompt_for_file_name = false,
                  drag_and_drop = {
                    insert_mode = true,
                  },
                  -- required for Windows users
                  use_absolute_path = true,
                },
              },
            },
            {
              -- Make sure to set this up properly if you have lazy=true
              'MeanderingProgrammer/render-markdown.nvim',
              opts = {
                file_types = { "markdown", "Avante" },
              },
              ft = { "markdown", "Avante" },
            },
          },
        },
        --render markdown for ai outputs
        {
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
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

    local local_init = vim.fn.expand("~/.init.local.lua")
    if vim.fn.filereadable(local_init) == 1 then
      dofile(local_init)
    end

    -- The setup config table shows all available config options with their default values:
    --require("presence").setup({
    --    -- General options
    --    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    --    neovim_image_text   = "NeoVim", -- Text displayed when hovered over the Neovim image
    --    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    --    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    --    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    --    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    --    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    --    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    --    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    --    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    --    show_time           = true,                       -- Show the timer
    --
    --    -- Rich Presence text options
    --    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    --    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    --    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    --    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    --    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    --    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    --    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    --})

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
    require("nvim-tree").setup({
      filesystem_watchers = {
        enable = true,
        ignore_dirs = {
          ".git",
          "node_modules",
        },
      },
    })
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
    --vim.api.nvim_exec("set imdisable",false)
    vim.api.nvim_set_var("skk_large_jisyo","~/.config/skkdic/SKK-JISYO.L")
    vim.api.nvim_set_var("skk_auto_save_jisyo",1)


    -- 以下built-in LSPの設定

    -- 1. LSP Sever management and completion settings
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_lsp.default_capabilities()

    require("mason").setup()
    -- Note: `nvim-lspconfig` needs to be in 'runtimepath' by the time you set up mason-lspconfig.nvim
    local lspservers = {"lua_ls", "texlab", "ltex", "asm_lsp"}
    require("mason-lspconfig").setup {
      ensure_installed = lspservers
    }

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {
              'vim',
              'require',
            },
          },
          workspace = {
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    vim.lsp.config("texlab", {
      capabilities = capabilities,
    })

    vim.lsp.config("ltex", {
      capabilities = capabilities,
      settings = {
        ltex = {
          language = "ja-JP",
          enabled = {"latex", "html", "markdown", "text"},
        },
      },
    })

    vim.lsp.config("asm_lsp", {
      capabilities = capabilities,
      filetypes = {"asm", "s", "S"}
    })

    vim.lsp.enable(lspservers)

    -- 2. built-in LSP function
    -- keyboard shortcut
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my_lsp_attach", {clear = true}),
      callback = function(ev)
        local opts = {buffer = ev.buf, silent = true}

        vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gf', vim.lsp.buf.format, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)

        vim.bo[ev.buf].formatexpr = "v:lua.vim.lsp.formatexpr()"

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("my_lsp_highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = ev.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = ev.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            
            -- バッファを閉じた時にハイライトグループをクリーンアップ
            vim.api.nvim_create_autocmd("LspDetach", {
              buffer = ev.buf,
              callback = function()
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "my_lsp_highlight", buffer = ev.buf })
              end,
            })
          end
      end
    })
    -- LSP handlers
    vim.diagnostic.config({
      virtual_text = false
    })

    -- Reference highlight
    vim.opt.updatetime = 500

    local hl_opts = {
      underline = true,
      ctermfg = 1,
      ctermbg = 8,
      fg = "#A00000",
      bg = "#104040"
    }

    vim.api.nvim_set_hl(0, "LspReferenceText", hl_opts)
    vim.api.nvim_set_hl(0, "LspReferenceRead", hl_opts)
    vim.api.nvim_set_hl(0, "LspReferenceWrite", hl_opts)

    -- 3. completion (hrsh7th/nvim-cmp)

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = false },
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
end
