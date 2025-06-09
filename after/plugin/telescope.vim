" Telescope configuration to match CtrlP behavior

" Only run this if Telescope is loaded
if !exists(':Telescope')
    finish
endif

" Configure Telescope with Lua
lua << EOF
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup{
    defaults = {
        -- Mimic CtrlP's prompt location
        layout_strategy = 'bottom_pane',
        layout_config = {
            height = 0.35,
            prompt_position = 'bottom',
        },
        
        -- File ignore patterns (similar to CtrlP's custom_ignore)
        file_ignore_patterns = {
            "%.git/",
            "%.hg/",
            "%.svn/",
            "target/",
            "%.exe$",
            "%.so$",
            "%.dll$",
            "vendor/",
            "%.venv/",
            "logs/",
            "sql/",
            "tools/",
            "docroot/res/out/",
            "%.swp$",
            "%.bak$",
            "cli/",
        },
        
        -- Sorting and selection
        sorting_strategy = "descending",
        selection_caret = "> ",
        
        -- Key mappings
        mappings = {
            i = {
                -- Exit with Ctrl-g Ctrl-g (your requested binding)
                ["<C-g><C-g>"] = actions.close,
                ["<C-g>"] = actions.close,
                
                -- Standard navigation
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default,
                
                -- CtrlP-like behavior
                ["<C-t>"] = actions.select_tab,
                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                
                -- Scroll preview
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            },
            n = {
                ["<C-g><C-g>"] = actions.close,
                ["<C-g>"] = actions.close,
                ["q"] = actions.close,
                ["<Esc>"] = actions.close,
            }
        },
        
        -- Performance
        preview = {
            hide_on_startup = false,
        },
        
        -- Use ripgrep for finding files (faster than default)
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob=!.git/*',
        },
    },
    
    pickers = {
        find_files = {
            -- Use git files when in a git repo, otherwise find files
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
            follow = true,
            hidden = false,
        },
        
        buffers = {
            -- Show all buffers in order of most recently used
            sort_mru = true,
            sort_lastused = true,
            show_all_buffers = true,
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer,
                },
                n = {
                    ["<C-d>"] = actions.delete_buffer,
                }
            }
        },
        
        lsp_document_symbols = {
            -- For function navigation
            symbol_width = 50,
            show_line = false,
        },
    },
    
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

-- Load fzf extension for better performance
telescope.load_extension('fzf')

-- Custom function to search symbols with treesitter fallback
-- This will provide better language support including Jai
vim.api.nvim_create_user_command('TelescopeFunctions', function()
    -- Try LSP symbols first
    local ok = pcall(builtin.lsp_document_symbols)
    if not ok then
        -- Fall back to treesitter
        builtin.treesitter()
    end
end, {})

-- Remap the function finder to use our custom command
vim.keymap.set('n', '<M-j>', '<cmd>TelescopeFunctions<cr>', { noremap = true, silent = true })

-- Helper function to jump to symbol with fold handling
-- (similar to CtrlP-funky's after_jump behavior)
local function setup_symbol_jump_behavior()
    vim.api.nvim_create_autocmd("User", {
        pattern = "TelescopePreviewerLoaded",
        callback = function()
            local filetype = vim.bo.filetype
            if filetype == "python" then
                vim.cmd("normal! zO")  -- Open all folds
            elseif filetype == "cpp" then
                vim.cmd("normal! zxzt") -- Open folds and scroll to top
            elseif filetype == "go" then
                vim.cmd("normal! zz")   -- Just center
            elseif filetype ~= "vim" then
                vim.cmd("normal! zxzz") -- Default: open folds and center
            end
        end
    })
end

setup_symbol_jump_behavior()

-- Create a wrapper function for find_files that respects wildignore
_G.telescope_find_files_with_wildignore = function()
    local opts = {}
    opts.find_command = { "rg", "--files", "--hidden" }
    
    -- Add wildignore patterns
    local wildignore = vim.o.wildignore
    if wildignore and wildignore ~= "" then
        for pattern in wildignore:gmatch("[^,]+") do
            -- Convert vim wildignore to ripgrep glob patterns
            local glob_pattern = pattern:gsub("^%*/", ""):gsub("/%*%*$", "")
            table.insert(opts.find_command, "--glob")
            table.insert(opts.find_command, "!" .. glob_pattern)
        end
    end
    
    builtin.find_files(opts)
end

-- Update the keymap to use our wrapper function
vim.keymap.set('n', '<M-p>', telescope_find_files_with_wildignore, { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', telescope_find_files_with_wildignore, { noremap = true, silent = true })

EOF
