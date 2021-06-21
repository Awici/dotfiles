local g = vim.g
local wk = require("which-key")

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = {gc = "Comments"},
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto" -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specifiy a list manually
}

local opts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

g.timeoutlen = 300

local keymap = {
    ['/'] = 'comment toggle',
    [';'] = {':Dashboard', 'home screen'},
    ['?'] = {':NvimTreeFindFile', 'find current file'},
    e = {':NvimTreeToggle', 'explorer'},
    f = {':Telescope find_files', 'find files'},
    h = {'<C-W>s', 'split below'},
    H = {':let @/ = ""', 'disable higligh'},
    r = {':RnvimrToggle', 'ranger'},
    v = {'<C-W>v', 'split right'},
    w = {':%s/\\s\\+$//e', 'remove whitespace'},
    b = {
        name = '+buffer',
        ['>'] = {':BufferMoveNext', 'move next'},
        ['<'] = {':BufferMovePrevious', 'move prev'},
        b = {':BufferPick', 'pick buffer'},
        d = {':BufferClose', 'delete buffer'},
        n = {'bnext', 'next buffer'},
        p = {'bprevious', 'previous buffer'},
        ['?'] = {'Buffers', 'fzf-bffer'}
    },
    d = {
        name = '+debug',
        b = {'DebugToggleBreakpoint', 'toggle breakpoint'},
        c = {'DebugContinue', 'continue'},
        i = {'DebugStepInto', 'step into'},
        o = {'DebugStepOver', 'step over'},
        r = {'DebugToggleRepl', 'toggle repl'},
        s = {'DebugStart', 'start'}
    },
    F = {
        name = '+fold',
        O = {':set foldlevel=20', 'open all'},
        C = {':set foldlevel=0', 'close all'},
        c = {':foldclose', 'close'},
        o = {':foldopen', 'open'},
        ['1'] = {':set foldlevel=1', 'level 1'},
        ['2'] = {':set foldlevel=2', 'level 2'},
        ['3'] = {':set foldlevel=3', 'level 3'},
        ['4'] = {':set foldlevel=4', 'level 4'},
        ['5'] = {':set foldlevel=5', 'level 5'},
        ['6'] = {':set foldlevel=6', 'level 6'},
    },
    s = {
        name = '+search',
        ['.'] = {':Telescope filetypes', 'filetypes'},
        B = {':Telescope git_branches', 'git branches'},
        d = {':Telescope lsp_document_diagnostics', 'document diagnostics'},
        D = {':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'},
        f = {':Telescope find_files', 'files'},
        h = {':Telescope command_history', 'history'},
        i = {':Telescope media_files', 'media files'},
        m = {':Telescope marks', 'marks'},
        M = {':Telescope man_pages', 'man pages'},
        o = {':Telescope vim_options', 'vim options'},
        t = {':Telescope live_grep', 'text'},
        r = {':Telescope registers', 'registers'},
        w = {':Telescope file_browser', 'buf fuz find'},
        u = {':Telescope colorscheme', 'colorschemes'}
    },
    S = {
        name = '+Session',
        s = {':SessionSave', 'save session'},
        l = {':SessionLoad', 'load session'}
    },
    g = {
        name = '+git',
        b = {':GitBlameToggle', 'blame'},
        B = {':GBrowse', 'browse'},
        d = {':Git diff', 'diff'},
        j = {':NextHunk', 'next hunk'},
        k = {':PrevHunk', 'prev hunk'},
        l = {':Git log', 'log'},
        p = {':PreviewHunk', 'preview hunk'},
        r = {':ResetHunk', 'reset hunk'},
        R = {':ResetBuffer', 'reset buffer'},
        s = {':StageHunk', 'stage hunk'},
        S = {':Gstatus', 'status'},
        u = {':UndoStageHunk', 'undo stage hunk'}
    },
    l = {
        name = '+lsp',
        a = {':Lspsaga code_action', 'code_action'},
        A = {':Lspsaga range_code_action', 'selected action'},
        d = {':Telescope lsp_document_diagnostics', 'document diagnostics'},
        D = {':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'},
        f = {':lua vim.lsp.buf.formatting()', 'format'},
        I = {':LspInfo', 'lsp info'},
        v = {':LspVirtualTextToggle', 'lsp toggle virtual text'},
        l = {':Lspsaga lsp_finder', 'lsp finder'},
        L = {':Lspsaga show_line_diagnostics', 'line diagnostics'},
        p = {':Lspsaga preview_definition', 'preview definition'},
        q = {':Telescope quickfix', 'quickfix'},
        r = {':Lspsaga rename', 'rename'},
        T = {':LspTypeDefinition', 'type definition'},
        x = {':cclose', 'close quickfix'},
        s = {':Telescope lsp_document_symbols', 'document_symbol'},
        S = {':Telescope lsp_workspace_symbols', 'workspace symbols'}
    }
}

wk.register(keymap, { prefix = "<leader>" }, opts)
