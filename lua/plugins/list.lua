return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    {
        'numToStr/Comment.nvim',
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {}
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = function()
            return require('plugins.configs.catppuccin')
        end,
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            filters = {
                dotfiles = true,
            },

            renderer = {
                icons = {
                    show = {
                        folder_arrow = false,
                    },
                },
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = '└ ',
                        edge = '│',
                        item = '│',
                        none = '  ',
                    },
                },
            },
        }
    },

    {
        'williamboman/mason.nvim',
        version = "^1.0.0",
        opts = {},
    },

    {
        'neovim/nvim-lspconfig',
        ft = { 'tex', 'py', 'cpp', 'c', 'h', 'hpp', 'txt', 'lua' },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig')['clangd'].setup {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "-j=8",
                    "--clang-tidy",
                    "--clang-tidy-checks=*",
                    "--all-scopes-completion",
                    "--cross-file-rename",
                    "--header-insertion-decorators",
                    "--malloc-trim",
                    "--background-index",
                    "--pch-storage=memory",
                },
                on_attach = function(client, bufnr)
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(true)
                    end
                end
            }
            require('lspconfig')['cmake'].setup {
                capabilities = capabilities,
            }
            require('lspconfig')['pyright'].setup {
                capabilities = capabilities,
            }
            require('lspconfig')['hls'].setup {
                capabilities = capabilities,
                filetypes = { 'haskell', 'lhaskell', 'cabal' },
                cmd = { "haskell-language-server-wrapper", "--lsp" }
            }
            require('lspconfig')['gopls'].setup {
                capabilities = capabilities,
                filetypes = { 'go' },
            }
            require('lspconfig')['lua_ls'].setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
            require('lspconfig')['texlab'].setup {
                capabilities = capabilities,
            }
        end,
    },

    {
        'hrsh7th/nvim-cmp',
        ft = { 'tex', 'py', 'cpp', 'c', 'h', 'hpp', 'txt', 'lua' },
        event = { 'InsertEnter', 'CmdlineEnter' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },
        config = function()
            require('plugins.configs.cmp')
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "haskell", "python" },
        }
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            vim.opt.termguicolors = true
            require('colorizer').setup()
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = 'VeryLazy',
        opts = {
            indent = {
                char = '│',
            },
            scope = {
                enabled = true,
                show_start = false,
            },
            exclude = {
                filetypes = {
                    'dashboard'
                }
            }
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.configs.lualine')
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    {
        'nvim-lua/plenary.nvim',
    },

    {
        'williamboman/mason-lspconfig.nvim',
        version = "^1.0.0",
        opts = {
            ensure_installed = {
                'clangd',
                'pyright',
                'lua_ls',
                'texlab',
                'cmake',
                'gopls'
            }
        }
    },

    {
        'lervag/vimtex',
        ft = { "tex" },
        config = function()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_method = 'latexmk'
        end,
    },

    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                cpp = { "clang-format" }
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },

    {
        'smoka7/hop.nvim',
        opts = {},
    },

    {
        'hedyhli/outline.nvim',
        opts = {
            outline_window = {
                -- winhl = 'Normal:Background,Border:Background',
            },
        }
    },

    {
        'akinsho/toggleterm.nvim',
        opts = {
            open_mapping = [[<C- >]],
        }
    },

    {
        'crispgm/nvim-tabline',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
        opts = {
            show_index = true,
            brackets = { '', '' },
            no_name = 'no name',
        }
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs                        = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┇' },
            },
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                follow_files = true
            },
            auto_attach                  = true,
            attach_to_untracked          = false,
            current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        }
    },

    {
        'aveplen/ruscmd.nvim',
        opts = {}
    },

    {
        'nvim-telescope/telescope.nvim',
        opts = {
            pickers = {
                buffers = {
                    initial_mode = 'normal'
                },
                diagnostics = {
                    initial_mode = 'normal'
                }
            }
        }
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        }
    },

    {
        "danymat/neogen",
        opts = {

        }
    },

    {
        'windwp/nvim-ts-autotag',
        opts = {

        }
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            replace = {
                ["<space>"] = "SPC",
                ["<cr>"] = "RET",
                ["<tab>"] = "TAB",
            },

            icons = {
                breadcrumb = ">>",
                separator = "->",
                group = "+",
                keys = {
                    Esc = "<esc>",
                    CR = "<cr>",
                    BS = "<bs>",
                    Space = "<space>"
                },
            },

        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },

    {
        "Badhi/nvim-treesitter-cpp-tools",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        -- Optional: Configuration
        opts = function()
            local options = {
                preview = {
                    quit = "q",                           -- optional keymapping for quit preview
                    accept = "<tab>",                     -- optional keymapping for accept preview
                },
                header_extension = "h",                   -- optional
                source_extension = "cpp",                 -- optional
                custom_define_class_function_commands = { -- optional
                    TSCppImplWrite = {
                        output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
                    },
                    --[[
                    <your impl function custom command name> = {
                        output_handle = function (str, context)
                            -- string contains the class implementation
                            -- do whatever you want to do with it
                        end
                    }
                    ]]
                },
            }
            return options
        end,
        -- End configuration
        config = true,
    },

    {
        "winston0410/range-highlight.nvim",
        event = { "CmdlineEnter" },
        opts = {},
    },

    {
        "potamides/pantran.nvim",
        opts = {
            default_engine = "google",
            engines = {
                default_source = "ru",
                default_target = "en"
            }
        }
    },

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    }
}
