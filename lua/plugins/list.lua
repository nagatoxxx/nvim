return {
    {
        'windwp/nvim-autopairs',
         event = "InsertEnter",
         opts = {}
    },

    {
        'numToStr/Comment.nvim',
        event = { "BufReadPost", "BufNewFile" },
        opts = {
        },
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
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('plugins.configs.bufferline')
        end,
    },

    {
        'nvim-tree/nvim-tree.lua',
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
            }
            require('lspconfig')['cmake'].setup{
                capabilities = capabilities,
            }
            require('lspconfig')['pyright'].setup{
                capabilities = capabilities,
            }
            require('lspconfig')['lua_ls'].setup{
                capabilities = capabilities,
            }
            require('lspconfig')['texlab'].setup{
                capabilities = capabilities,
            }
            require('lspconfig')['cssls'].setup{
                capabilities = capabilities,
            }
        end,
    },

    {
        'hrsh7th/nvim-cmp',
        -- event = 'InsertEnter',
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
        opts = {}
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
        'nvim-telescope/telescope.nvim',
        -- lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = function()
            return require('plugins.configs.telescope')
        end,
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = function()
            return require('plugins.configs.gitsigns')
        end,
    },
    
    {
        'akinsho/toggleterm.nvim',
        opts = {
            open_mapping = [[<C- >]],
        }
    },

    {
        'williamboman/mason-lspconfig.nvim',
        -- lazy = true,
        opts = {
            ensure_installed = {
                'clangd',
                -- 'clang-format',
                'pyright',
                'lua_ls',
                'texlab',
                -- 'codelldb'
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
        'anuvyklack/pretty-fold.nvim',
        config = function ()
            require('pretty-fold').setup({
                keep_intendation = true,
            })
        end
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        -- event = 'VeryLazy',
        opts = function()
            return require('plugins.configs.null-ls')
        end,
    },

    {
        'jay-babu/mason-nvim-dap.nvim',
        event = 'VeryLazy',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap'
        },
        opts = {
            handlers = {

            },
        },
    },
}
