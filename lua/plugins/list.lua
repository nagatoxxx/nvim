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
        opts = {
            ensure_installed = {
                'codelldb',
                'clangd',
                'clang-format'
            }
        },
    },

    {
        'neovim/nvim-lspconfig',
        ft = {'tex', 'py', 'cpp', 'c', 'h', 'hpp', 'txt', 'lua'},
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig')['clangd'].setup{
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "-j=8",
                    "--malloc-trim",
                    "--background-index",
                    "--pch-storage=memory",
                },
                on_attach = function(client, bufnr)
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(bufnr, true)
                    end
                end
            }
            require('lspconfig')['cmake'].setup{
                capabilities = capabilities,
            }
            require('lspconfig')['pyright'].setup{
                capabilities = capabilities,
            }
            require('lspconfig')['lua_ls'].setup{
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}
                        }
                    }
                }
            }
            require('lspconfig')['texlab'].setup{
                capabilities = capabilities,
            }
            require('lspconfig')['cssls'].setup{
                capabilities = capabilities,
            }
            require('lspconfig')['asm_lsp'].setup{
                capabilities = capabilities,
            }
        end,
    },

    {
        'hrsh7th/nvim-cmp',
        ft = {'tex', 'py', 'cpp', 'c', 'h', 'hpp', 'txt', 'lua'},
        event = {'InsertEnter', 'CmdlineEnter'},
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
            ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp" },
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
            scope = {enabled = false},
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
        opts = {
            ensure_installed = {
                'clangd',
                'pyright',
                'lua_ls',
                'texlab',
            }
        }
    },

    {
        'lervag/vimtex',
        ft = {"tex"},
        config = function ()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_method = 'latexmk'
        end,
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        -- event = 'VeryLazy',
        opts = function()
            return require('plugins.configs.null-ls')
        end,
    },

    {
        'smoka7/hop.nvim',
        opts = {},
    },

    {
        'famiu/bufdelete.nvim',
    },

    {
        'simrat39/symbols-outline.nvim',
        opts = {
            relative_width = true,
            auto_close = true
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
            show_index = false,
            brackets = { '', '' },
            no_name = 'no name',
        }
    },

    {
        'utilyre/barbecue.nvim',
        name = 'barbeque',
        event = 'VeryLazy',
        dependencies = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {

        }
    },

    {
        'eriks47/generate.nvim',
        opts = {}
    },

    {
        'Exafunction/codeium.nvim',
        opts = {

        }
    }
}
