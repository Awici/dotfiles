local M = {}

M.config = function()
  require("which-key").setup {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
  }

  -- Set leader

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when crating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  -- no hl
  vim.api.nvim_set_keymap("n", "<Leader>h", ':let @/=""<CR>', { noremap = true, silent = true })

  -- explorer

  vim.api.nvim_set_keymap("n", "<Leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })

  -- dashboard
  vim.api.nvim_set_keymap("n", "<Leader>;", ":Dashboard<CR>", { noremap = true, silent = true })

  -- Comments
  vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", { noremap = true, silent = true })

  -- close buffer
  vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", { noremap = true, silent = true })

  -- TODO create entire treesitter section

  local mappings = {

    ["f"] = "Find File",
    ["h"] = "No Highlight",
    ["w"] = { ":%s/\\s\\+$//e", "remove whitespace" },
    z = {
      name = "Zen",
      z = { ":TZAtaraxis<CR>", "classic" },
      m = { ":TZMinimalist<CR>", "minimal" },
      f = { ":TZFocus<CR>", "focus" }
    },
    b = {
      name = "Buffers",
      j = { "<cmd>BufferPick<cr>", "jump to buffer" },
      f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
      w = { "<cmd>BufferWipeout<cr>", "wipeout buffer" },
      e = {
        "<cmd>BufferCloseAllButCurrent<cr>",
        "close all but current buffer",
      },
      h = { "<cmd>BufferCloseBuffersLeft<cr>", "close all buffers to the left" },
      l = {
        "<cmd>BufferCloseBuffersRight<cr>",
        "close all BufferLines to the right",
      },
      D = {
        "<cmd>BufferOrderByDirectory<cr>",
        "sort BufferLines automatically by directory",
      },
      L = {
        "<cmd>BufferOrderByLanguage<cr>",
        "sort BufferLines automatically by language",
      },
    },
    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      r = { ":luafile %<cr>", "Reload" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    d = {
      name = "Debug",
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      B = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      q = { "<cmd>lua require'dap'.stop()<cr>", "Quit" },
    },
    g = {
      name = "Git",
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
      },
    },
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = {
        "<cmd>Telescope lsp_document_diagnostics<cr>",
        "Document Diagnostics",
      },
      w = {
        "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        "Workspace Diagnostics",
      },
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      j = { "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = O.lsp.popup_border}})<cr>", "Next Diagnostic" },
      k = { "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = O.lsp.popup_border}})<cr>", "Prev Diagnostic" },
      q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    },
    s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      t = { "<cmd>Telescope live_grep<cr>", "Text" },
    },
    S = {
      name = "Session",
      s = { "<cmd>SessionSave<cr>", "Save Session" },
      l = { "<cmd>SessionLoad<cr>", "Load Session" },
    },
    T = {
      name = "Treesitter",
      i = { ":TSConfigInfo<cr>", "Info" },
    },
  }


  local wk = require "which-key"
  wk.register(mappings, opts)
end

return M