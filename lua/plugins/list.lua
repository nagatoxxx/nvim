return {
    {
        'windwp/nvim-autopairs',
         event = "InsertEnter",
         opts = {}
    },

    {
        'numToStr/Comment.nvim',
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
        opts = {}
    },

    {
        'neovim/nvim-lspconfig',
        config = function(args)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig')['clangd'].setup{
                -- on_attach = function()
                -- end,
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
        end,
    },

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
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
        'rhysd/vim-clang-format'
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function(args)
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
                highlight = hl_name_list
            },
            scope = {enabled = false},
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        config = function(args)
            require('plugins.configs.lualine')
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function(args)
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
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
            -- winbar = {
            --     enabled = false,
            -- }
        }
    },
}
