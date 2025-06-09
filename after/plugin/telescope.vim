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
        vimgrep_arguments = vim.fn.executable('rg') == 1 and {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob=!.git/*',
        } or nil,
    },
    
    pickers = {
        find_files = {
            -- Use git files when in a git repo, otherwise find files
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
            follow = true,
            hidden = false,
            previewer = false,  -- Disable preview for file finding
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

-- Load fzf extension for better performance (if available)
pcall(telescope.load_extension, 'fzf')

-- Custom function finder that mimics CtrlP-funky
local function telescope_functions()
    local filetype = vim.bo.filetype
    
    -- Try different methods based on what's available
    local ok = false
    
    -- First try treesitter (most reliable for supported languages)
    -- Skip treesitter for languages without parsers
    local has_parser = pcall(require, 'nvim-treesitter.parsers') and require('nvim-treesitter.parsers').has_parser(filetype)
    
    if has_parser then
        ok = pcall(function()
            builtin.treesitter({
                symbols = { "function", "method", "class", "struct", "interface", "type", "enum" },
                show_line = false,
            })
        end)
        
        if ok then return end
    end
    
    -- Try LSP if available (check if client is actually attached first)
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if #clients > 0 then
        ok = pcall(builtin.lsp_document_symbols)
        if ok then return end
    end
    
    -- Fallback to grep-based search for common patterns
    -- Different patterns for ripgrep vs vim regex
    local rg_patterns = {
        -- C/C++ patterns
        c = "^[[:alnum:]_]+.*\\s+[[:alnum:]_]+\\s*\\([^)]*\\)\\s*{",
        cpp = "^[[:alnum:]_]+.*\\s+[[:alnum:]_]+\\s*\\([^)]*\\)\\s*{",
        -- Go patterns  
        go = "^func\\s+",
        -- Python patterns
        python = "^(def|class)\\s+",
        -- JavaScript/TypeScript patterns
        javascript = "^(function|const|let|var)\\s+[[:alnum:]_]+\\s*=|^[[:alnum:]_]+\\s*\\([^)]*\\)\\s*{",
        typescript = "^(function|const|let|var)\\s+[[:alnum:]_]+\\s*=|^[[:alnum:]_]+\\s*\\([^)]*\\)\\s*{",
        -- Vim patterns
        vim = "^(function!?|command!?|augroup)\\s+",
        -- Lua patterns
        lua = "^(local\\s+)?function\\s+|^local\\s+[[:alnum:]_]+\\s*=\\s*function",
        -- Jai patterns (from ctrlp-funky)
        jai = "^\\w.*\\s*::\\s*\\(|^\\w.*\\s*::\\s*(struct|enum|#type|#run)",
    }
    
    local vim_patterns = {
        -- Jai patterns for vim regex
        jai = "^\\w.*\\s\\+::\\s\\+(\\|^\\w.*\\s\\+::\\s\\+\\(struct\\|enum\\|#type\\|#run\\)",
        -- Add other language patterns here if needed
    }
    
    local rg_pattern = rg_patterns[filetype]
    local vim_pattern = vim_patterns[filetype] or rg_pattern
    
    if rg_pattern then
        -- On Windows, we need to use a different approach to show initial results
        if vim.fn.has("win32") == 1 and vim_pattern then
            local pickers = require('telescope.pickers')
            local finders = require('telescope.finders')
            local conf = require('telescope.config').values
            local entry_display = require('telescope.pickers.entry_display')
            
            -- First collect all matches using vim's search
            local results = {}
            local bufnr = vim.fn.bufnr('%')
            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
            
            for i, line in ipairs(lines) do
                if vim.fn.match(line, vim_pattern) >= 0 then
                    table.insert(results, {
                        lnum = i,
                        text = vim.trim(line),
                        bufnr = bufnr,
                    })
                end
            end
            
            -- Create custom picker
            pickers.new({}, {
                prompt_title = "Functions in " .. vim.fn.expand("%:t"),
                finder = finders.new_table {
                    results = results,
                    entry_maker = function(entry)
                        return {
                            value = entry,
                            display = entry.text,
                            ordinal = entry.text,
                            lnum = entry.lnum,
                            bufnr = entry.bufnr,
                        }
                    end,
                },
                sorter = conf.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, map)
                    actions.select_default:replace(function()
                        actions.close(prompt_bufnr)
                        local selection = require('telescope.actions.state').get_selected_entry()
                        if selection then
                            vim.api.nvim_win_set_cursor(0, {selection.lnum, 0})
                        end
                    end)
                    return true
                end,
            }):find()
        else
            -- Use live_grep on non-Windows systems
            builtin.live_grep({
                search = rg_pattern,
                use_regex = true,
                only_sort_text = true,
                search_dirs = {vim.fn.expand("%:p")},
                prompt_title = "Functions in " .. vim.fn.expand("%:t"),
                default_text = "",
                disable_coordinates = true,
                path_display = {"hidden"},
            })
        end
    else
        -- Generic fallback
        builtin.current_buffer_fuzzy_find({
            prompt_title = "Functions/Symbols",
        })
    end
end

-- Create command and keymap
vim.api.nvim_create_user_command('TelescopeFunctions', telescope_functions, {})
vim.keymap.set('n', '<M-j>', telescope_functions, { noremap = true, silent = true })

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
    opts.previewer = false  -- Disable preview
    
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
