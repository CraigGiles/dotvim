" Treesitter configuration for better language parsing

if !exists(':TSUpdate')
    finish
endif

lua << EOF
require'nvim-treesitter.configs'.setup {
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    
    -- List of parsers to ignore installing
    ignore_install = {},
    
    ensure_installed = {
        "c",
        "cpp", 
        "go",
        "vim",
        "vimdoc",
        "lua",
        "markdown",
        "python",
        "bash",
    },
    
    highlight = {
        enable = true,
        -- Disable for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        
        additional_vim_regex_highlighting = false,
    },
    
    -- Better indentation based on treesitter
    indent = {
        enable = true
    },
}

-- Custom queries for Jai language patterns
-- This mimics the ctrlp-funky Jai support
local function setup_jai_symbols()
    -- Define custom queries for Jai if treesitter parser exists
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "jai",
        callback = function()
            -- Create a custom symbol provider for Telescope
            local has_telescope, telescope = pcall(require, 'telescope.builtin')
            if not has_telescope then return end
            
            -- Override the document symbols for Jai files
            local function jai_document_symbols()
                local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                local results = {}
                
                for i, line in ipairs(lines) do
                    -- Match function definitions: word :: (
                    local func_match = line:match("^(%w[%w%s_]*)%s*::%s*%(")
                    if func_match then
                        table.insert(results, {
                            lnum = i,
                            col = 0,
                            text = func_match:gsub("^%s*(.-)%s*$", "%1") .. " :: ()",
                            type = "Function"
                        })
                    end
                    
                    -- Match struct/enum/type definitions
                    local type_match = line:match("^(%w[%w%s_]*)%s*::%s*([:#]?%w+)")
                    if type_match and (line:match("struct") or line:match("enum") or line:match("#type") or line:match("#run")) then
                        table.insert(results, {
                            lnum = i,
                            col = 0,
                            text = type_match:gsub("^%s*(.-)%s*$", "%1"),
                            type = "Type"
                        })
                    end
                end
                
                -- Convert to quickfix list format and open with Telescope
                local qf_list = {}
                for _, item in ipairs(results) do
                    table.insert(qf_list, {
                        bufnr = vim.fn.bufnr('%'),
                        lnum = item.lnum,
                        col = item.col + 1,
                        text = item.text,
                        type = item.type:sub(1, 1)
                    })
                end
                
                vim.fn.setqflist(qf_list)
                telescope.quickfix({ title = "Jai Symbols" })
            end
            
            -- Jai symbol detection is now handled in telescope.vim
        end
    })
end

setup_jai_symbols()

EOF